Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FFBEA3C4A
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:35:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128854.1775730902234232822
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dOM9L3Q7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=855908c7c1=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6394wP9I3601645
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Apr 2026 10:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=QDV4b0TgKfrzOK+v9Zqe
	xrzTVWhmsi2wXZBf3EfnUPs=; b=dOM9L3Q7D64ubdGKzAmmbQ0sg4KVrlZnn4bD
	kJpvvuYWupZeNNo/yxrqZKsLd5cH+lFRL4/2YqOkvQjKdHXvkEYZtqShZ0cIaZ48
	DFZ9bzRikferc8+0dNLDhBT4Wy91U5gey4TVG//Niu1l9q586OouSgW2EPQhH0a2
	puAU2YSJumg97QGakfXFUfe0G64X7aNjvpGUAZMGopyHaOsFG1cLbQ7nHmZCnIw0
	/5mhJiRgNW2xvkBNgYdPkx1lZMi10SC2cWP0Fx+zciAt/tGUnvkZQ7+okXbpSGb3
	9aP5Eu3XlLOz5l365Rvap16h/mqmNXhHpwyU3TUJ0gB8F/YiZQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010065.outbound.protection.outlook.com [52.101.201.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrqm0ym-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:35:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Io4IervGyUShyxnMiueQb2CKnwBwlgvp7XwLevM5g/+PbMk3wejwKFco5ApjcocCM/6BnhUUms6NtTm2xgMB7DtpQ4NftCGk+Kw0LFCWoXcx/P6rd+kt/DaMTlA8dEt4LuufJFRf9g1krJszb6foR37tml5/tXNO2xwlkO5ZHSkeSGXZb85tBurDFvmjFYyrbhC2Mt1sqT50fZ2DVnw0pl3lhGc0+2ps6PQ/Mr8QKM9vRiMYhinyOoyw2IvS+p0O+OuAVabdJDT2WfvqKXbq0XL/SKfdb57Vi2wfDjAUHZMuM5j3VrL2/7Fl1GFmKXVhIBfHLuZ0cGnbNNpAQ0ZtJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDV4b0TgKfrzOK+v9ZqexrzTVWhmsi2wXZBf3EfnUPs=;
 b=gywe05eyHku7uOZpR/zpH52OtIGAAWyAlWFLcL83f3rtZr0MPva2P+q1SO1NryPIExYwt25jyCsk/DENqpOcZmqtNUHEa/zvRgoA+CJEU+JFN/UPO19aToPehzl0kPkWex3i0s9MS7/oFGk4AEgCYcN7z1aHdAMl6xVLroHwz66KZaOb88nRuHozdcmAtm2XwA10tKSAbzrT1N/v+JNtGFlgBblCJ/1mS3iNODl9Ab9nH+xTJPbO0klT9Lv7C0Rdq1rDIiZwyXfrpWyn4qrLQmZvLtVLfu8xco/pjBZRD6zynWR/77aZFbcBA//d3PDhOLmR8ZtqW5HZwoSselCqOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS0PR11MB6472.namprd11.prod.outlook.com (2603:10b6:8:c0::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17; Thu, 9 Apr 2026 10:34:58 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9769.017; Thu, 9 Apr 2026
 10:34:57 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-pytest-codspeed: upgrade 3.0.0 -> 4.3.0
Date: Thu,  9 Apr 2026 18:34:46 +0800
Message-Id: <20260409103446.3079100-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0137.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c8::12) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS0PR11MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: e722ed13-e953-4654-14f8-08de9623a561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	4Mlr+//5mruFoZkmbXoX4fYNL4CG0jH5RDpVFmIc8iXTShlaC3hRLMCugAbJHQfrbBBZRQoeUL0i6lDJf3cpYQUQnyiwuq4NTEHv2JdzUOXKtE8dVgUzjYBvFgO4SP4udRw0fKvAm4DKceOJ3c/HCRFmQ0wmuKv6y1J8b/9y4uYDXbgBsdlrRzEPb3b0KANK/mSfhHK8+v4Z6x7MoZ62Cc4Gb6n+pd8Iv5Zm8psbU7Cq+xkjvHdTds5shfiuDqxuZ6ajtd1fvmeR8mzUFxiUrWS2wD39l5RKuFxDRC/+Oet+RSULi7AwmMxK1YV+ULbfuwSQ5DgxkNQwK2tPHcLj5ABqqEFFDuPE/BiatMBAafXBYwr4byo8ZWzbjNu+l6Vt3A9OpZqObOX41aEG7uWYk0W453sfqr22A6KI6oWhufS6tmb/y1lTsIyCRR2eML8urgXMvqezUzR+q4m1vhM4bCb3WNyqG+aQlOQ42G/sFgVSqZTG/UDzYAs4erfcATkOroKHHKmdh5bn2Z7iNLLmcaAIH7eGJkzKhXE5v91NbSYaJSTr83FLjxu+ruXdBhcImMcK7y76c7O2SBWWziE3r2gl/q4VevulAtZzuE328Sg34NmlgecTzEF7DCr1GqdO+qS/TZ0OZLQAY8BL5Qd5cjFJ2zDdg1MTF5EsM4QkofOob5jlKCkneNIgEheHFksEdTRXIR6fwMD0t55dIUi/6iOTmmts2KQU2LS7VRst2GmEBrmLPx7ZjNkMJ8f5TbyR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?t65ewEgRp2lfMWiJvrQiRE1remeCk4b3rF7rlYePrLLMLof8dPHDeAhFArQz?=
 =?us-ascii?Q?urkV7PVbpGbteg3E09vV/0t/bp/GPpqVJ20M8isCgqjQYHrniUvxBSikXlHm?=
 =?us-ascii?Q?5Vh6yBBelx9ZaVmapIOuCh6uE1FsQ3YxSlRLKzdpTkvwxe2ZCCYhjbPpZGDB?=
 =?us-ascii?Q?+1lBiCYCb4Bp/PqXTQi+rsdqazAqCLFrK7MVvhzeeNSI5B/jnLqvQIcB8Unh?=
 =?us-ascii?Q?AhaWKsKo/tBiuMTJDelrQtpH9qeMWo9fZ3VAV7lzoWIi6dBazpmqyvK1vArr?=
 =?us-ascii?Q?FDBANcfRZRt1hEDCedoSbTltGZoeD9294bhARj41JblGbq1EH9K4fQhkKS2W?=
 =?us-ascii?Q?TCYSbUczYproBPW2EUYTWrbQQCSeTKJajEUWp0Plu4Ah3J0V5Cc9dUuugXvk?=
 =?us-ascii?Q?h8CaA2o9qPcX5KmCK76N6Fatxg0VY00vm3oGEW0jtVU++2/lUebiAVIRnB9Z?=
 =?us-ascii?Q?82wnEDtUylt5s3wRCX3eBB+CJQZeB1KO6EK3JVKvmE7mFPyQfuwTFF9CcflL?=
 =?us-ascii?Q?KIvHaXKQWwVn6QIYQYlQl6KA5isLaTBOWLlKspdpT9eNCvzPQmCGLlbXtF/k?=
 =?us-ascii?Q?y4ZyxTY0jxDswPrhZYoGkFu6v5e4TQVq4PtniL1LebkdJyiCo1PCAuNakaTK?=
 =?us-ascii?Q?fBS7h1lM6yUMp94JMxvuCl1QrF5NIoRLo8DCrNWR9gtm6JWu2wej2ZGejtZ1?=
 =?us-ascii?Q?QnHQYrCf4DOKYLtGI1LGU88GJQE/zLE1L773o8TAUdoODi9KAc8dXIQGrWGJ?=
 =?us-ascii?Q?VQGZTAWGpi5uhBxYQ2unksPGvU9CaP9hK2PWlgSbCwUigooNU4h2wtJUo/Qu?=
 =?us-ascii?Q?zNqAi54JAPX3Y9nAryvQ9H8N7IOBeGSxv7sJKufVKZooIdcZNNMYrep6ohKb?=
 =?us-ascii?Q?QlTLkW34EqhOXhl6svE/hPEus+ixS6XOZ+NNeJMXrHVmc7cFrKjJ4Wf4Dzox?=
 =?us-ascii?Q?K3wAK4dUlHaUgLwI8exyPvdgeCjcACJ4LyDox+KbEOZwgzeRl8emkvYF5Ooc?=
 =?us-ascii?Q?uu0bEUp8LLdchzlqSXQIDOlRl8s7L5sxMqSfVJ9rQqaTSFs0u/ELUiwvJkfR?=
 =?us-ascii?Q?ClEFYZeiUWrcbgVidACgq/Erc+Sbi7oqewDigPhbUiNKQrtHl3KfSGUP3R9X?=
 =?us-ascii?Q?zTdWj92JZKx9+fl4gAZS1+Q7PWuFsVWOriykdn/DARZb085PeEVKq00QEt5O?=
 =?us-ascii?Q?untPJ0zpfCDYtnMp8si6nFBEkxZWMkz8gnd648tVPi3DXyRYVOHC0MNObyNH?=
 =?us-ascii?Q?glPGzKFe7u6WaA1DNU2ZwZFlWYKZxSZJgmjlHAgPsmoKG85BKgoCFEk0ru+Q?=
 =?us-ascii?Q?LvD6jpA7ny3mAar/txfwH7mju5vm2H/dAvGmtw8BypfzujWwfhaz4uWNRKkD?=
 =?us-ascii?Q?++ljyz2Rs+2eZPM5fhhY3dLQPpLQ9Sv2HFS/HnBZIywcOGhHvsJGdmVtCXHr?=
 =?us-ascii?Q?eH3PNo6QCRL2Yq4tz8M+FHaDTT7c2aCpRcPTkdRPCTgHy0lwenmfioixMejk?=
 =?us-ascii?Q?T6eWdeFj10tdlXXN9xGnoPa3Qyu2RXjH/EtjpMtP8u90+2qY6rtwouh5RTMm?=
 =?us-ascii?Q?NR5ABgG0f4g0cMJ+DP1o524xOxBLP6cjnRWn9rq0/V4SgHyd9+CFRCNTU7OC?=
 =?us-ascii?Q?VA1auTQlGaEP+hEccs+X6fXSNL5zztCjnYfrUuGikRY+a46zfqFmzbflgqS5?=
 =?us-ascii?Q?wYm7rk9y7cdGx7OyeC3otvz+INt/X003E35lEOFUMNJSJV6aV58I2WRszaPo?=
 =?us-ascii?Q?LLwluVTJ7D5HP7DQU3wMle7xI2uXDXc=3D?=
X-Exchange-RoutingPolicyChecked: 
	D+kqdURg9cWd17A4+tBGTAHR0/Ldr2F2DQG5Op3qO58LOxiAL3JJcGafDSTbB63FpBD7LMrewD7oRM78H4wVXlYMzlPPsqK0T9KaKD0a7gU37/9bPHNv3766K+tFMaUGJluHu6ySfcthh2LEVCH6CNhglDWQKIKo8YNWbRkDQhSkhXJaPLfVCKnJp5JHWWjf2z95pUoMOcw0NkUlgWkegA/RpNgeUrHYtSnzwSlHnbWE/lPrLcUxzz+9qkoFA53DaYBmWcUB0Vq4ji6wLkhL0U4mNArHcbLwiBSrEUDjUfQjxt8P79LBGCgSoFNfBLh/0bzikfiF5UE6kIz211n8Vg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e722ed13-e953-4654-14f8-08de9623a561
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 10:34:57.8197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQ3GTRGZ7Q2GJSY2haJCUoPWXVhDTBqIBy+xIhgvzmgJ3LwL3miqc0DcyNrCVtFQiy1hVkNupcmLTOutiNzSJkCtvusVXfVELNHW/O27U4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6472
X-Authority-Analysis: v=2.4 cv=RPCD2Yi+ c=1 sm=1 tr=0 ts=69d780d5 cx=c_pps
 a=Lj9o+5Kg1g76LDS8oSCIAA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=L27hKlPSAAAA:20
 a=yqlMzxAxAAAA:8 a=t7CeM3EgAAAA:8 a=zlXbXU_owulEPEzm5UoA:9
 a=LsaQmJBP5CD7zixGX6Do:22 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: JMvNeepg_cluWhFwz6Ti_F1D5sZ5wM2B
X-Proofpoint-GUID: JMvNeepg_cluWhFwz6Ti_F1D5sZ5wM2B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA5MiBTYWx0ZWRfXxKkqzTN3fAns
 dHSKc2yp6vzjg5q/2yKvjKsy95g/Dd4XTWLNfruFO6nOQYlLivhuPpMs43zz23WwprPeSu+wqT+
 1lJamMDeSWorMvwvYGXmLvK5LKy3ZJ4JRrRRdD476flTFm2+wbM0LPlCBauF7R2TYYJrdfz+WP9
 4F0TxjqJDwErqdxYZYh20pctuu+GV9+rZ2ZYgYgPLnv87EYIGWx/OgJl2bKGQqbdZXOrfeCWjfR
 aNX3M694nrHlR41w5R/ndHEU0Rj1e7cYJm7/KLA0AekslNlRsw+8kzy9p9wIlcx5nSukg5net29
 G6DHCwv4S0qnlr3rzFPusbc8Qvl5d6d9/YpUN+09yJmSLVdJqhzh6+zzUlixswhvpjL6EHdedT+
 76j1rwse/VKWNuR5COIQLYAYZPrOzup/DOyKLtWwrRYmY61JPewL1LUQ2qwej4ijlDgV1alvCGZ
 wshVat0mAIFX4bIJ5hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_03,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090092
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:35:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126187

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Add python3-cffi-native to DEPENDS since v4.0.0 introduced
CodSpeedHQ/instrument-hooks which uses cffi FFI bindings at
build time.

Changelog:
https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.3.0
https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.2.0
https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.1.1
https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.1.0
https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.0.0
https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.2.0
https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.1.2
https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.1.1
https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.1.0

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...est-codspeed_3.0.0.bb => python3-pytest-codspeed_4.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-codspeed_3.0.0.bb => python3-pytest-codspeed_4.3.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0.bb b/meta-python/recipes-devtools/python/python3-pytest-codspeed_4.3.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-codspeed_4.3.0.bb
index 0789e9f548..05c05e1048 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-codspeed_4.3.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://codspeed.io/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2856cbe664e8843cd4fd4c1d1d85c2c3"
 
-DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "c5b80100ea32dd44079bb2db298288763eb8fe859eafa1650a8711bd2c32fd06"
+DEPENDS = "python3-hatchling-native python3-cffi-native"
+SRC_URI[sha256sum] = "5230d9d65f39063a313ed1820df775166227ec5c20a1122968f85653d5efee48"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


