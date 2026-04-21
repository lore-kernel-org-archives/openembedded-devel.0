Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DCBF327BF
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 08:11:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16304.1776759071605627401
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Apr 2026 01:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Bi0D1qke;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8571aaff97=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L4P3tn791542
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 01:11:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ZrKX8wZRZyZCIgY3EYV7
	N8s8P1Wwru26gNymc0j4T1E=; b=Bi0D1qkezM5xWD+F/wakCdM384gr7xsEjUSB
	8lxh7pcDad0WX9pJp2IAVgK+mUnLV21VXqHp3Z+B3mJBdFytJq2aG3G8zieRA3Sw
	Wro8KRD+/IKYht6C4AyeME97VPu9hLXDQNRw2RgkqXruR87qGlvEPJuDnB+NrPtR
	m6J3TJ0S95SKm6iPSxqY9FxzzyLyQBuAtRgo2NUNu8pQsBd4JQrQwFy0s9TA19I8
	F212gCMG5c9k+O3YIr9pXP6G8eQVpOfeQg1vXPXqHTUSRABUoQLmYoXYO8HNaPOD
	Q+vz0Hm8vMkdSMrpu/Zc01ZORk9hfeEkjqqqAZ9YqYplnVbN6g==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013035.outbound.protection.outlook.com [40.93.201.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dm9fctu2h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 01:11:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGQYynbUXhvQlTWkrDNA5zLzcPMK3JZzrE8bz/92m+H2LQCKcsMxZYQdZ6m7LbrprgL8+De3zYnhqWN+40p1kpgBEtn+Ujd8DIv7MeVZMpzMoRGbmmuED35ybCAHJBCDuqMS4Cp2QXm8Q3V69YgSn1IhQetZ2wyXRsKnurH2WkPhdit/V1wvaqojf9VsTePtjohU0qA5bvrDTTELvsrzXAVRrT076v92PdGmuRbGd42MACrF+OW141sSeibiX0SBnuPBr/tyvZkIIlJweD0wde836NP0P+OeihSoi5qWzc3VlXqmb2mdbuWNvM5SyduVcMucOQf38MnAfD/TzMW5eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrKX8wZRZyZCIgY3EYV7N8s8P1Wwru26gNymc0j4T1E=;
 b=EGGKUnDBeY3sCS+4Yrd5EVdpFDt0BounTgZ4Fjrdk3z1ZNXBoqqKHx3IMTXxFcrjYfHYPNqDmp8KHIV1A9zc5WQYN4s891huAM1DcpsbjKjEEWupLRGU6Lv7Ik1CJnBJGni7gLtoc3ckklw+9IbI0c60Zd4+7E+BHlBl6gnCccbaEXWyixs/1TEEV2y/KTWoZRc4q+90pdkYFTzA71lBlpSJkDdhDmMFmzqDM60aF3NhTxxto4sG+64SbuOAtYkCtv1eXUAac+mmR2vd7iO0S+YfQ+TZbNnbL32+oz+NyGFt0hGm2JRhwkiNYzdZ6R/2R3SRw2kjrdazj7dlJQq+OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA1PR11MB6075.namprd11.prod.outlook.com (2603:10b6:208:3d5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 08:11:07 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 08:11:07 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libsoup-2.4: fix several CVEs
Date: Tue, 21 Apr 2026 16:09:31 +0800
Message-Id: <20260421080931.2771689-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0089.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::16) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA1PR11MB6075:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a53a541-59fd-4a58-1f0b-08de9f7d8a27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	MGp6pQ1fZXG+rE51Xddo0p/FgSWaOv/MX2bRiIsM0e4jAi6QE2U+G+n0JoW8rgDqxkDmVjir4Fz3QDNnsCpxliqBon0/AT8U5Rc8WyWRofmR9z/i83R+R/tISiZTC/UBWJXwthFPwm7iFHPDE2cOHN3G6KYAh17jOodnXnwFBpCWYRqZ9GeQVWfchLRZiZydZ1seEJzVBSL3ne3ogUZBmgWcoT2z0No9tEsEOUw4xXayGDCyflZtdEuEX+fST5HU0Nmj5FTv/SaDtSuQvE9oVTPjhK/NXfwQbfgpErp6EJO1B9bZY95QfbawIJT6lpZspZirdng9DrPc+NoQvvggDlsGxQHpLvSUuSAPeXUm0ujw8HKlLOeVvzkP5yzE//dPzynxR5Rrwt+iiFb3+6XRYpnVlMgpXnO70rt3U7f+nOY20JNoCXpaMVnl71jfHumS3wXGlhWinq70H+WYPutFf45738D8K3uFKyR/3UYTGgid6Ud3FYkT7OYHkTdpimRDLqVe2Kp7S19ZdfMEL6bhxhlRx6PMAH+4QN0u98gUfu6EHJLmG+zKhDVS9BCTJWlwA8q0TEYGXIHA+kBmice88sVetD+V/rUX2hwY815bLZqrPb8yDlqvsFVwCvNSyBxmII2h6T/ypzepsyL1htbBGW99pK6ihcRlBG1q3yrXLxb3QeckXJ4Rfv/0ogEN0xsnzzZPMGyCY+dMInGiHL1ePBpNyHRIr92FumcsHjTfEaY/rfoGiwUA+gQUkCyUyhy3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b+tjKHDbiQ/TaduPA3SdxG2S0rCgcihgHq7OVALqtx6hqcEnXk7H3U/eKxCl?=
 =?us-ascii?Q?+lHq2Lfh9IXyIC7GkrSxYokcj/6e1U0Xkncnpaf6FsKK95ZwjmyfFDpTC9NW?=
 =?us-ascii?Q?BifgBsD3IHBx6y/OvwIzGah6kaaU7ZQpnrwHYDp59XyJOtyE22QbM5IFWyiv?=
 =?us-ascii?Q?y8NpLieuvMuaEVpkHQ4Z6uwKbeOcCcS4AAFHYcpPTamh2HsXnh5AtgZPJDqF?=
 =?us-ascii?Q?98+v87ydX8yPysETiuCW/dbaikqZNqMkORIhzn3XA3x6El7OBq/H+DnM3whW?=
 =?us-ascii?Q?3VAGvPAHTYZ8Xu1PM/hcJWVMtJGOeqx1bXE/BePHoX99GZkPUMnOSZGWyU7q?=
 =?us-ascii?Q?rMwF70hq0QZrM2U9Kt+PWCITV3UR6gM+dLWeDPVZdYMlsN+8WJX17qnASi4h?=
 =?us-ascii?Q?khhXdHFiSKVToSqbdbSsInrjEHWOYymEjBsyubWWHoJgGDx8Ps7DbPkQq21a?=
 =?us-ascii?Q?fqurNKBbbJ57j6oWEM6IUpkZ8ADEBczgnxgZeK+LdMn6itmxwyUD8lloukck?=
 =?us-ascii?Q?bcXpNIwOOlI5ro6IGeuBmoQXJChp2aIo0TS6wjVQ4WjZz2ZQWGBMs0efsF23?=
 =?us-ascii?Q?VMcFvaQeAIZsUzq5sOIfZlYuYMwOUi8qQAmSqzuBvyWYaqmZCM2WUiW8GB4Q?=
 =?us-ascii?Q?bC+Na5UrmuvRbqIwMcuP4l2GP8GYjGzok/uz1yT9SIPDBMayjn6qdZqDEz7A?=
 =?us-ascii?Q?mqGh0XcLjUbveD9QnDMGOfVvDYIPKCbixQoRWBVtmGL8wNzZP+uxIqXoEEdg?=
 =?us-ascii?Q?4aKlJjeRuniRbojEXvyJ65Nm5+uHqoAy/pMJDlFlTrStn9XidKEE2TYFme39?=
 =?us-ascii?Q?8BSStq+s+mqAS6hzoXaBk5PYor51OgkyGMzL4gcZJPcVM3CjShN0OQah3mAn?=
 =?us-ascii?Q?j7wHqa12uHTarvO9gZ4n2J0oXNPWXg3nwqQ+yV4XquvfMDyI0bMwrE864T7k?=
 =?us-ascii?Q?ySL7VYza3V+l6qO4Ya5ZqV8iKLHJBPFLcI1W8/XQRbZ6DtL3l07Py2wqb7UA?=
 =?us-ascii?Q?xri6gb66ikepm9v8iMisWS6yiz/NPkgOjk86DIv7HWgaGy9k/XbFG/Q7+yB5?=
 =?us-ascii?Q?t3KzvWWGdTf8AYgK7bdVlXBH9Dzr3z0VOFX0gr8D0v/fN6ESOuiwYBj6re88?=
 =?us-ascii?Q?Oft5ZGDT5ej26RsTIYODwF9bCMkinuxsVz6aQpbaNxwFYet815Udo8ktsSkN?=
 =?us-ascii?Q?vX7aZFIBQTY3R4sIBiy2FSsfjy6dER6G/IVwNIYP4/gh9E7u9vVjrvFLt6s0?=
 =?us-ascii?Q?fsfjxxyWBo/fKVysDDd3fE0Ln3o35JksOhH6JUKfbehEPeXdvfEYUbOkXDkH?=
 =?us-ascii?Q?DF5Q15ZPRYQxJ4Txaamz/Saa/Sd+l42dnR/M23++j4CKSuC6NM8E2Rf0S1Oj?=
 =?us-ascii?Q?QOjURrbWvZCESu6hn2DHndaUgsWtT+4uS6Ic7ABLCtxtGKcKfrIQ5c61zFS2?=
 =?us-ascii?Q?qrXwH1J6gESbTAqLJB+cEqBRCWOrouCPR6AtFnweNBz4HOKEUDxa85gm+JgW?=
 =?us-ascii?Q?rZanZROKDeTXPh1xkAZOJWbNamon4lhHzH7iaYqmUUVOQmlHd15n6y7WBX7B?=
 =?us-ascii?Q?Lu7p4sHaidJwzkMJOw6JyZGqbzEN7YHHP0+VKpDNXK19WodDwPU1FthmEuMi?=
 =?us-ascii?Q?wVIxZ6xlMajlyfnW7Dolp5XOZ14pBD/1lHVAMCycjVULJM69gGIh+UzbF8sq?=
 =?us-ascii?Q?CoTVOSniUZchnVBtswOFiFCRSjsGHODKZ/fXcvlRWj30MjOw+6L9VaEIGLzi?=
 =?us-ascii?Q?MT5tTYhSOUK0yx+vLIoSnXE8lUWyDW4=3D?=
X-Exchange-RoutingPolicyChecked: 
	wCTTsl85/F/VzDhgdAIv7JzGhTc1cgIejVzrofGHy/yVX4RfM3zPF5viu0MW9VsqrTuN5ZRAGPVfPvnCYOJ/teyJ8ujoouSmn7e8N6US3je0cDLX2OKbOpEX4agzEADFgoXfMEoEq2srhaKzmqkFfFQ44C3KomRf7WoHW7ISeUL6wIEyu68hh5+mpIjW75FQ8/iS1VGy1bOlXQsejp2An3Zu4Gt6o8QJygzIxslah/BeBCYU1SGD1g291Jwtnlf8VopisPuzTe1ZPIv7IhkK9bNh5CTa6Zb0rfyMHgpmFVlwdfmFMBUi2m8QDJY324YRdFZeRatkJtMzP7dw4uprfw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a53a541-59fd-4a58-1f0b-08de9f7d8a27
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 08:11:07.4817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apLPahiJjN0H1eFiDKLNTc8QLh/sAzPUiYKzY586Yueitl+LOdYXMEx9d/3Pe8Pd6VwrCS4zGD4MrwqvAnT7ZfWyje/EaXt4JN0R/T8dYyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6075
X-Proofpoint-ORIG-GUID: iuDj1q3piLeiKVpWWUp7EEJePWdCNAoL
X-Proofpoint-GUID: iuDj1q3piLeiKVpWWUp7EEJePWdCNAoL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA3OSBTYWx0ZWRfXzqW2LnhBL7qI
 TMsntaI1s4mZKFG+seEyIxrr9s3YVwI8ASMRCB8kMYuryuQp95FL+M0j+vT00CmteQpUKgox3Jj
 F99eTzWOwh4BiczqHHKUJGfbEKUhPCDCRhZMUELN8MMcHuwF3DLib5INCjNZo4uOK4A5ewbIgca
 jSWbpVRjfacMtiGS1+y5PdA0Awmvrs7i/QLVpQ8XHn8o0U/9n43t4o82Ad7VKWu0QcZtMVoVycj
 ONH3XbzXJb8MAwwkeVLc+ESIyM3tW0SWUSKLTj/llhmz0GTeR5iRgBRfeFh+Urf2d5NEtMJharp
 L49iY97aIczbIESG2w/RmSX4tFBAAYbd7cRYqcBWQ4w18t4rUpezC6xh17fdVFz+mKpF1nQ9U8b
 MGU2J1VLux4j+GQqlF3KvSJ8M5ofAT70Tcka0/amYBfPAGyzVilMu+uu+Kp/+TQ8mlIBzMmYOGg
 QLEcsWusDqE6ReOkkvA==
X-Authority-Analysis: v=2.4 cv=WKZPmHsR c=1 sm=1 tr=0 ts=69e7311e cx=c_pps
 a=5s0qIa4y+KO52koKvlB/mg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=GHR8O2WEAAAA:20
 a=rztzz8zuAAAA:8 a=t7CeM3EgAAAA:8 a=V2sgnzSHAAAA:8 a=aiIX5UjjAAAA:8
 a=m2hn0q6Y9bguT0pYoaIA:9 a=utNLEOu7vwYDzd2dY_SC:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 08:11:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126527

Fix CVE-2026-1539,CVE-2026-1761,CVE-2026-1801,CVE-2026-2443,
CVE-2026-2369,CVE-2026-1760,CVE-2025-14523,CVE-2025-32049

Refer:
CVE-2026-1801 https://gitlab.gnome.org/GNOME/libsoup/-/issues/481
CVE-2026-1761 https://gitlab.gnome.org/GNOME/libsoup/-/issues/493
CVE-2026-2443 https://gitlab.gnome.org/GNOME/libsoup/-/issues/487
CVE-2026-1539 https://gitlab.gnome.org/GNOME/libsoup/-/issues/489
CVE-2026-2369 https://gitlab.gnome.org/GNOME/libsoup/-/issues/498
CVE-2026-1760 https://gitlab.gnome.org/GNOME/libsoup/-/issues/475
CVE-2025-14523 https://gitlab.gnome.org/GNOME/libsoup/-/issues/472
CVE-2025-32049 https://gitlab.gnome.org/GNOME/libsoup/-/issues/390

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-14523.patch  |  52 ++++
 .../libsoup-2.4/CVE-2025-32049-1.patch        | 229 ++++++++++++++++++
 .../libsoup-2.4/CVE-2025-32049-2.patch        | 131 ++++++++++
 .../libsoup/libsoup-2.4/CVE-2026-1539.patch   |  31 +++
 .../libsoup/libsoup-2.4/CVE-2026-1760.patch   | 153 ++++++++++++
 .../libsoup/libsoup-2.4/CVE-2026-1761.patch   |  36 +++
 .../libsoup/libsoup-2.4/CVE-2026-1801.patch   | 126 ++++++++++
 .../libsoup/libsoup-2.4/CVE-2026-2369.patch   |  33 +++
 .../libsoup/libsoup-2.4/CVE-2026-2443.patch   | 135 +++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   9 +
 10 files changed, 935 insertions(+)
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1539.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1760.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1761.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1801.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-2369.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-2443.patch

diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
new file mode 100644
index 0000000000..7815dba55a
--- /dev/null
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
@@ -0,0 +1,52 @@
+From d6028a6e6a8417b7fb6c89f6c10fb94781435ee6 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 4 Feb 2026 15:08:50 +0800
+Subject: [PATCH] Reject duplicate Host headers (for libsoup 2)
+
+This is a simplified version of my patch for libsoup 3:
+
+!491
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/d3db5a6f8f03e1f0133754872877c92c0284c472]
+CVE: CVE-2025-14523
+
+This patch is a MR for branch 2-74, but not merged yet, maybe it will
+not be merged.
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-headers.c         | 3 +++
+ libsoup/soup-message-headers.c | 3 +++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index ea2f986..6cd3dad 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -138,6 +138,9 @@ soup_headers_parse (const char *str, int len, SoupMessageHeaders *dest)
+ 		for (p = strchr (value, '\r'); p; p = strchr (p, '\r'))
+ 			*p = ' ';
+ 
++		if (g_ascii_strcasecmp (name, "Host") == 0 && soup_message_headers_get_one (dest, "Host"))
++			goto done;
++
+ 		soup_message_headers_append (dest, name, value);
+         }
+ 	success = TRUE;
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
+index f612bff..bb20bbb 100644
+--- a/libsoup/soup-message-headers.c
++++ b/libsoup/soup-message-headers.c
+@@ -220,6 +220,9 @@ soup_message_headers_append (SoupMessageHeaders *hdrs,
+ 	}
+ #endif
+ 
++	if (g_ascii_strcasecmp (name, "Host") == 0 && soup_message_headers_get_one (hdrs, "Host"))
++		return;
++
+ 	header.name = intern_header_name (name, &setter);
+ 	header.value = g_strdup (value);
+ 	g_array_append_val (hdrs->array, header);
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.patch
new file mode 100644
index 0000000000..64e87cb1ec
--- /dev/null
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.patch
@@ -0,0 +1,229 @@
+From c574e659c41c18fad3973bbaa3b3ec75664b3137 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 5 Feb 2026 16:20:02 +0800
+Subject: [PATCH 1/2] websocket: add a way to restrict the total message size
+
+Otherwise a client could send small packages smaller than
+total-incoming-payload-size but still to break the server
+with a big allocation
+
+Fixes: #390
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/db87805ab565d67533dfed2cb409dbfd63c7fdce]
+CVE: CVE-2025-32049
+
+libsoup2 is not maintained, the patch is backported from libsoup3, and
+change accordingly
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-websocket-connection.c | 104 ++++++++++++++++++++++++++--
+ libsoup/soup-websocket-connection.h |   7 ++
+ 2 files changed, 107 insertions(+), 4 deletions(-)
+
+diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-connection.c
+index 9d5f4f8..3dad477 100644
+--- a/libsoup/soup-websocket-connection.c
++++ b/libsoup/soup-websocket-connection.c
+@@ -85,7 +85,8 @@ enum {
+ 	PROP_STATE,
+ 	PROP_MAX_INCOMING_PAYLOAD_SIZE,
+ 	PROP_KEEPALIVE_INTERVAL,
+-	PROP_EXTENSIONS
++	PROP_EXTENSIONS,
++	PROP_MAX_TOTAL_MESSAGE_SIZE,
+ };
+ 
+ enum {
+@@ -120,6 +121,7 @@ struct _SoupWebsocketConnectionPrivate {
+ 	char *origin;
+ 	char *protocol;
+ 	guint64 max_incoming_payload_size;
++	guint64 max_total_message_size;
+ 	guint keepalive_interval;
+ 
+ 	gushort peer_close_code;
+@@ -152,6 +154,7 @@ struct _SoupWebsocketConnectionPrivate {
+ };
+ 
+ #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
+ #define READ_BUFFER_SIZE 1024
+ #define MASK_LENGTH 4
+ 
+@@ -664,7 +667,7 @@ bad_data_error_and_close (SoupWebsocketConnection *self)
+ }
+ 
+ static void
+-too_big_error_and_close (SoupWebsocketConnection *self,
++too_big_incoming_payload_error_and_close (SoupWebsocketConnection *self,
+                          guint64 payload_len)
+ {
+ 	GError *error;
+@@ -680,6 +683,23 @@ too_big_error_and_close (SoupWebsocketConnection *self,
+ 	emit_error_and_close (self, error, TRUE);
+ }
+ 
++static void
++too_big_message_error_and_close (SoupWebsocketConnection *self,
++                                 guint64 len)
++{
++	GError *error;
++
++	error = g_error_new_literal (SOUP_WEBSOCKET_ERROR,
++				     SOUP_WEBSOCKET_CLOSE_TOO_BIG,
++				     self->pv->connection_type == SOUP_WEBSOCKET_CONNECTION_SERVER ?
++				     "Received WebSocket payload from the client larger than configured max-total-message-size" :
++				     "Received WebSocket payload from the server larger than configured max-total-message-size");
++	g_debug ("%s received message of size %" G_GUINT64_FORMAT " or greater, but max supported size is %" G_GUINT64_FORMAT,
++	         self->pv->connection_type == SOUP_WEBSOCKET_CONNECTION_SERVER ? "server" : "client",
++	         len, self->pv->max_total_message_size);
++	emit_error_and_close (self, error, TRUE);
++}
++
+ static void
+ close_connection (SoupWebsocketConnection *self,
+                   gushort                  code,
+@@ -913,6 +933,12 @@ process_contents (SoupWebsocketConnection *self,
+ 		switch (pv->message_opcode) {
+ 		case 0x01:
+ 		case 0x02:
++			/* Safety valve */
++			if (pv->max_total_message_size > 0 &&
++			    (pv->message_data->len + payload_len) > pv->max_total_message_size) {
++				too_big_message_error_and_close (self, (pv->message_data->len + payload_len));
++				return;
++			}
+ 			g_byte_array_append (pv->message_data, payload, payload_len);
+ 			break;
+ 		default:
+@@ -1050,7 +1076,7 @@ process_frame (SoupWebsocketConnection *self)
+ 	/* Safety valve */
+ 	if (self->pv->max_incoming_payload_size > 0 &&
+ 	    payload_len >= self->pv->max_incoming_payload_size) {
+-		too_big_error_and_close (self, payload_len);
++		too_big_incoming_payload_error_and_close (self, payload_len);
+ 		return FALSE;
+ 	}
+ 
+@@ -1357,6 +1383,10 @@ soup_websocket_connection_get_property (GObject *object,
+ 		g_value_set_pointer (value, pv->extensions);
+ 		break;
+ 
++	case PROP_MAX_TOTAL_MESSAGE_SIZE:
++		g_value_set_uint64 (value, pv->max_total_message_size);
++		break;
++
+ 	default:
+ 		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+ 		break;
+@@ -1410,6 +1440,10 @@ soup_websocket_connection_set_property (GObject *object,
+ 		pv->extensions = g_value_get_pointer (value);
+ 		break;
+ 
++	case PROP_MAX_TOTAL_MESSAGE_SIZE:
++		pv->max_total_message_size = g_value_get_uint64 (value);
++		break;
++
+ 	default:
+ 		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+ 		break;
+@@ -1631,7 +1665,24 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+                                                                G_PARAM_READWRITE |
+                                                                G_PARAM_CONSTRUCT_ONLY |
+                                                                G_PARAM_STATIC_STRINGS));
+-
++	/**
++	 * SoupWebsocketConnection:max-total-message-size:
++	 *
++	 * The total message size for incoming packets.
++	 *
++	 * The protocol expects or 0 to not limit it.
++	 *
++	 */
++	g_object_class_install_property (gobject_class, PROP_MAX_TOTAL_MESSAGE_SIZE,
++					g_param_spec_uint64 ("max-total-message-size",
++					                     "Max total message size",
++					                     "Max total message size ",
++					                     0,
++					                     G_MAXUINT64,
++					                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
++					                     G_PARAM_READWRITE |
++					                     G_PARAM_CONSTRUCT |
++					                     G_PARAM_STATIC_STRINGS));
+ 	/**
+ 	 * SoupWebsocketConnection::message:
+ 	 * @self: the WebSocket
+@@ -2145,6 +2196,51 @@ soup_websocket_connection_set_max_incoming_payload_size (SoupWebsocketConnection
+ 	}
+ }
+ 
++/**
++ * soup_websocket_connection_get_max_total_message_size:
++ * @self: the WebSocket
++ *
++ * Gets the maximum total message size allowed for packets.
++ *
++ * Returns: the maximum total message size.
++ *
++ */
++guint64
++soup_websocket_connection_get_max_total_message_size (SoupWebsocketConnection *self)
++{
++   SoupWebsocketConnectionPrivate *pv;
++
++   g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTAL_MESSAGE_SIZE_DEFAULT);
++   pv = self->pv;
++
++   return pv->max_total_message_size;
++}
++
++/**
++ * soup_websocket_connection_set_max_total_message_size:
++ * @self: the WebSocket
++ * @max_total_message_size: the maximum total message size
++ *
++ * Sets the maximum total message size allowed for packets.
++ *
++ * It does not limit the outgoing packet size.
++ *
++ */
++void
++soup_websocket_connection_set_max_total_message_size (SoupWebsocketConnection *self,
++                                                      guint64                  max_total_message_size)
++{
++   SoupWebsocketConnectionPrivate *pv;
++
++   g_return_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self));
++   pv = self->pv;
++
++   if (pv->max_total_message_size != max_total_message_size) {
++       pv->max_total_message_size = max_total_message_size;
++       g_object_notify (G_OBJECT (self), "max-total-message-size");
++   }
++}
++
+ /**
+  * soup_websocket_connection_get_keepalive_interval:
+  * @self: the WebSocket
+diff --git a/libsoup/soup-websocket-connection.h b/libsoup/soup-websocket-connection.h
+index f82d723..d2a60e9 100644
+--- a/libsoup/soup-websocket-connection.h
++++ b/libsoup/soup-websocket-connection.h
+@@ -136,6 +136,13 @@ SOUP_AVAILABLE_IN_2_58
+ void                soup_websocket_connection_set_keepalive_interval (SoupWebsocketConnection *self,
+                                                                       guint                    interval);
+ 
++SOUP_AVAILABLE_IN_2_72
++guint64             soup_websocket_connection_get_max_total_message_size    (SoupWebsocketConnection *self);
++
++SOUP_AVAILABLE_IN_2_72
++void                soup_websocket_connection_set_max_total_message_size    (SoupWebsocketConnection *self,
++                                                                             guint64                  max_total_message_size);
++
+ G_END_DECLS
+ 
+ #endif /* __SOUP_WEBSOCKET_CONNECTION_H__ */
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.patch
new file mode 100644
index 0000000000..f9c894aaec
--- /dev/null
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.patch
@@ -0,0 +1,131 @@
+From 0bfc66f1082f5d47df99b6fc03f742ef7fa1051e Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 5 Feb 2026 17:19:51 +0800
+Subject: [PATCH] Set message size limit in SoupServer rather than 
+ SoupWebsocketConnection
+
+We're not sure about the compatibility implications of having a default
+size limit for clients.
+
+Also not sure whether the server limit is actually set appropriately,
+but there is probably very little server usage of
+SoupWebsocketConnection in the wild, so it's not so likely to break
+things.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/2df34d9544cabdbfdedd3b36f098cf69233b1df7]
+CVE: CVE-2025-32049
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-server.c               | 24 +++++++++++++++++++-----
+ libsoup/soup-websocket-connection.c | 23 ++++++++++++++++-------
+ 2 files changed, 35 insertions(+), 12 deletions(-)
+
+diff --git a/libsoup/soup-server.c b/libsoup/soup-server.c
+index 63875f3..a3f8597 100644
+--- a/libsoup/soup-server.c
++++ b/libsoup/soup-server.c
+@@ -216,6 +216,16 @@ enum {
+ 
+ G_DEFINE_TYPE_WITH_PRIVATE (SoupServer, soup_server, G_TYPE_OBJECT)
+ 
++/* SoupWebsocketConnection by default limits only maximum packet size. But a
++ * message may consist of multiple packets, so SoupServer additionally restricts
++ * total message size to mitigate denial of service attacks on the server.
++ * SoupWebsocketConnection does not do this by default because I don't know
++ * whether that would or would not cause compatibility problems for websites.
++ *
++ * This size is in bytes and it is arbitrary.
++ */
++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
++
+ static SoupClientContext *soup_client_context_ref (SoupClientContext *client);
+ static void soup_client_context_unref (SoupClientContext *client);
+ 
+@@ -1445,11 +1455,15 @@ complete_websocket_upgrade (SoupMessage *msg, gpointer user_data)
+ 
+ 	soup_client_context_ref (client);
+ 	stream = soup_client_context_steal_connection (client);
+-	conn = soup_websocket_connection_new_with_extensions (stream, uri,
+-							      SOUP_WEBSOCKET_CONNECTION_SERVER,
+-							      soup_message_headers_get_one (msg->request_headers, "Origin"),
+-							      soup_message_headers_get_one (msg->response_headers, "Sec-WebSocket-Protocol"),
+-							      handler->websocket_extensions);
++	conn = SOUP_WEBSOCKET_CONNECTION (g_object_new (SOUP_TYPE_WEBSOCKET_CONNECTION,
++						          "io-stream", stream,
++						          "uri", uri,
++						          "connection-type", SOUP_WEBSOCKET_CONNECTION_SERVER,
++						          "origin", soup_message_headers_get_one (msg->request_headers, "Origin"),
++						          "protocol", soup_message_headers_get_one (msg->response_headers, "Sec-WebSocket-Protocol"),
++						          "extensions", handler->websocket_extensions,
++						          "max-total-message-size", (guint64)MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
++                                 NULL));
+ 	handler->websocket_extensions = NULL;
+ 	g_object_unref (stream);
+ 	soup_client_context_unref (client);
+diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-connection.c
+index 3dad477..e7fa9b7 100644
+--- a/libsoup/soup-websocket-connection.c
++++ b/libsoup/soup-websocket-connection.c
+@@ -154,7 +154,6 @@ struct _SoupWebsocketConnectionPrivate {
+ };
+ 
+ #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
+-#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
+ #define READ_BUFFER_SIZE 1024
+ #define MASK_LENGTH 4
+ 
+@@ -1615,8 +1614,9 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+ 	/**
+ 	 * SoupWebsocketConnection:max-incoming-payload-size:
+ 	 *
+-	 * The maximum payload size for incoming packets the protocol expects
+-	 * or 0 to not limit it.
++	 * The maximum payload size for incoming packets, or 0 to not limit it.
++	 * Each message may consist of multiple packets, so also refer to
++	 * [property@WebSocketConnection:max-total-message-size].
+ 	 *
+ 	 * Since: 2.56
+ 	 */
+@@ -1668,9 +1668,18 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+ 	/**
+ 	 * SoupWebsocketConnection:max-total-message-size:
+ 	 *
+-	 * The total message size for incoming packets.
++	 * The maximum size for incoming messages.
++	 * Set to a value to limit the total message size, or 0 to not
++	 * limit it.
+ 	 *
+-	 * The protocol expects or 0 to not limit it.
++	 * [method@Server.add_websocket_handler] will set this to a nonzero
++	 * default value to mitigate denial of service attacks. Clients must
++	 * choose their own default if they need to mitigate denial of service
++	 * attacks. You also need to set your own default if creating your own
++	 * server SoupWebsocketConnection without using SoupServer.
++	 *
++	 * Each message may consist of multiple packets, so also refer to
++	 *[property@WebSocketConnection:max-incoming-payload-size].
+ 	 *
+ 	 */
+ 	g_object_class_install_property (gobject_class, PROP_MAX_TOTAL_MESSAGE_SIZE,
+@@ -1679,7 +1688,7 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+ 					                     "Max total message size ",
+ 					                     0,
+ 					                     G_MAXUINT64,
+-					                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
++					                     0,
+ 					                     G_PARAM_READWRITE |
+ 					                     G_PARAM_CONSTRUCT |
+ 					                     G_PARAM_STATIC_STRINGS));
+@@ -2210,7 +2219,7 @@ soup_websocket_connection_get_max_total_message_size (SoupWebsocketConnection *s
+ {
+    SoupWebsocketConnectionPrivate *pv;
+ 
+-   g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTAL_MESSAGE_SIZE_DEFAULT);
++   g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), 0);
+    pv = self->pv;
+ 
+    return pv->max_total_message_size;
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1539.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1539.patch
new file mode 100644
index 0000000000..c6b813a98f
--- /dev/null
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1539.patch
@@ -0,0 +1,31 @@
+From 285faea567e1e2a95226201175dbf745a64a2439 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 20 Mar 2026 15:04:22 +0800
+Subject: [PATCH 4/4] Also remove Proxy-Authorization header on cross origin
+ redirect
+
+Closes #489
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/98c1285d9d78662c38bf14b4a128af01ccfdb446]
+CVE: CVE-2026-1539
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-session.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
+index cc0d04c..0361856 100644
+--- a/libsoup/soup-session.c
++++ b/libsoup/soup-session.c
+@@ -1190,6 +1190,7 @@ soup_session_redirect_message (SoupSession *session, SoupMessage *msg)
+ 	/* Strip all credentials on cross-origin redirect. */
+ 	if (!soup_uri_host_equal (soup_message_get_uri (msg), new_uri)) {
+ 		soup_message_headers_remove (msg->request_headers, "Authorization");
++		soup_message_headers_remove (msg->request_headers, "Proxy-Authorization");
+ 		soup_message_set_auth (msg, NULL);
+ 	}
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1760.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1760.patch
new file mode 100644
index 0000000000..a5547132a2
--- /dev/null
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1760.patch
@@ -0,0 +1,153 @@
+From 0fca37e0fce479284e62091ffb9b7d6caff1c7e4 Mon Sep 17 00:00:00 2001
+From: Carlos Garcia Campos <cgarcia@igalia.com>
+Date: Thu, 29 Jan 2026 16:43:28 +0100
+Subject: [PATCH] server: close the connection after responsing a request
+ containing Content-Length and Transfer-Encoding
+
+Closes #475
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/6224df5a471e9040a99dd3dc2e91817a701b1bf6]
+CVE: CVE-2026-1760
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-message-headers.c   | 86 +++++++++++++++-----------------
+ libsoup/soup-message-server-io.c |  8 +++
+ 2 files changed, 49 insertions(+), 45 deletions(-)
+
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
+index 535cf14..06d9600 100644
+--- a/libsoup/soup-message-headers.c
++++ b/libsoup/soup-message-headers.c
+@@ -666,38 +666,13 @@ clear_special_headers (SoupMessageHeaders *hdrs)
+ static void
+ transfer_encoding_setter (SoupMessageHeaders *hdrs, const char *value)
+ {
+-	if (value) {
+-		/* "identity" is a wrong value according to RFC errata 408,
+-		 * and RFC 7230 does not list it as valid transfer-coding.
+-		 * Nevertheless, the obsolete RFC 2616 stated "identity"
+-		 * as valid, so we can't handle it as unrecognized here
+-		 * for compatibility reasons.
+-		 */
+-		if (g_ascii_strcasecmp (value, "chunked") == 0)
+-			hdrs->encoding = SOUP_ENCODING_CHUNKED;
+-		else if (g_ascii_strcasecmp (value, "identity") != 0)
+-			hdrs->encoding = SOUP_ENCODING_UNRECOGNIZED;
+-	} else
+-		hdrs->encoding = -1;
++	hdrs->encoding = -1;
+ }
+ 
+ static void
+ content_length_setter (SoupMessageHeaders *hdrs, const char *value)
+ {
+-	/* Transfer-Encoding trumps Content-Length */
+-	if (hdrs->encoding == SOUP_ENCODING_CHUNKED)
+-		return;
+-
+-	if (value) {
+-		char *end;
+-
+-		hdrs->content_length = g_ascii_strtoull (value, &end, 10);
+-		if (*end)
+-			hdrs->encoding = SOUP_ENCODING_UNRECOGNIZED;
+-		else
+-			hdrs->encoding = SOUP_ENCODING_CONTENT_LENGTH;
+-	} else
+-		hdrs->encoding = -1;
++	hdrs->encoding = -1;
+ }
+ 
+ /**
+@@ -730,29 +705,50 @@ SoupEncoding
+ soup_message_headers_get_encoding (SoupMessageHeaders *hdrs)
+ {
+ 	const char *header;
++	const char *content_length;
++	const char *transfer_encoding;
+ 
+ 	if (hdrs->encoding != -1)
+ 		return hdrs->encoding;
+ 
+-	/* If Transfer-Encoding was set, hdrs->encoding would already
+-	 * be set. So we don't need to check that possibility.
+-	 */
+-	header = soup_message_headers_get_one (hdrs, "Content-Length");
+-	if (header) {
+-		content_length_setter (hdrs, header);
+-		if (hdrs->encoding != -1)
+-			return hdrs->encoding;
+-	}
++			/* Transfer-Encoding is checked first because it overrides the Content-Length */
++			transfer_encoding = soup_message_headers_get_one (hdrs, "Transfer-Encoding");
++			if (transfer_encoding) {
++					/* "identity" is a wrong value according to RFC errata 408,
++					 * and RFC 7230 does not list it as valid transfer-coding.
++					 * Nevertheless, the obsolete RFC 2616 stated "identity"
++					 * as valid, so we can't handle it as unrecognized here
++					 * for compatibility reasons.
++					 */
++					if (g_ascii_strcasecmp (transfer_encoding, "chunked") == 0)
++							hdrs->encoding = SOUP_ENCODING_CHUNKED;
++					else if (g_ascii_strcasecmp (transfer_encoding, "identity") != 0)
++							hdrs->encoding = SOUP_ENCODING_UNRECOGNIZED;
++			} else {
++					content_length = soup_message_headers_get_one (hdrs, "Content-Length");
++					if (content_length) {
++							char *end;
++
++							hdrs->content_length = g_ascii_strtoull (content_length, &end, 10);
++							if (*end)
++									hdrs->encoding = SOUP_ENCODING_UNRECOGNIZED;
++							else
++									hdrs->encoding = SOUP_ENCODING_CONTENT_LENGTH;
++					}
++			}
++
++			if (hdrs->encoding == -1) {
++					/* Per RFC 2616 4.4, a response body that doesn't indicate its
++					 * encoding otherwise is terminated by connection close, and a
++					 * request that doesn't indicate otherwise has no body. Note
++					 * that SoupMessage calls soup_message_headers_set_encoding()
++					 * to override the response body default for our own
++					 * server-side messages.
++					 */
++					hdrs->encoding = (hdrs->type == SOUP_MESSAGE_HEADERS_RESPONSE) ?
++							SOUP_ENCODING_EOF : SOUP_ENCODING_NONE;
++			}
+ 
+-	/* Per RFC 2616 4.4, a response body that doesn't indicate its
+-	 * encoding otherwise is terminated by connection close, and a
+-	 * request that doesn't indicate otherwise has no body. Note
+-	 * that SoupMessage calls soup_message_headers_set_encoding()
+-	 * to override the response body default for our own
+-	 * server-side messages.
+-	 */
+-	hdrs->encoding = (hdrs->type == SOUP_MESSAGE_HEADERS_RESPONSE) ?
+-		SOUP_ENCODING_EOF : SOUP_ENCODING_NONE;
+ 	return hdrs->encoding;
+ }
+ 
+diff --git a/libsoup/soup-message-server-io.c b/libsoup/soup-message-server-io.c
+index 71e943b..df5eafc 100644
+--- a/libsoup/soup-message-server-io.c
++++ b/libsoup/soup-message-server-io.c
+@@ -80,6 +80,14 @@ parse_request_headers (SoupMessage *msg, char *headers, guint headers_len,
+ 			return SOUP_STATUS_BAD_REQUEST;
+ 	}
+ 
++	/* A server MAY reject a request that contains both Content-Length and
++	 * Transfer-Encoding or process such a request in accordance with the
++	 * Transfer-Encoding alone. Regardless, the server MUST close the connection
++	 * after responding to such a request to avoid the potential attacks
++	 */
++	if (*encoding == SOUP_ENCODING_CHUNKED && soup_message_headers_get_one (msg->request_headers, "Content-Length"))
++			soup_message_headers_replace (msg->request_headers, "Connection", "close");
++
+ 	/* Generate correct context for request */
+ 	req_host = soup_message_headers_get_one (msg->request_headers, "Host");
+ 	if (req_host && strchr (req_host, '/')) {
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1761.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1761.patch
new file mode 100644
index 0000000000..573e3e1dd0
--- /dev/null
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1761.patch
@@ -0,0 +1,36 @@
+From 07757b7feacfc660c6c463ff2b773c13bc42d2c9 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 19 Mar 2026 17:21:32 +0800
+Subject: [PATCH 3/4] multipart: check length of bytes read
+ soup_filter_input_stream_read_until()
+
+We do make sure the read length is smaller than the buffer length when
+the boundary is not found, but we should do the same when the boundary
+is found.
+
+Spotted in #YWH-PGM9867-149
+Closes #493
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/cfa9d90d1a5c274233554a264c56551c13d6a6f0]
+CVE: CVE-2026-1761
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-filter-input-stream.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-filter-input-stream.c b/libsoup/soup-filter-input-stream.c
+index 2c30bf9..c34510b 100644
+--- a/libsoup/soup-filter-input-stream.c
++++ b/libsoup/soup-filter-input-stream.c
+@@ -272,6 +272,6 @@ soup_filter_input_stream_read_until (SoupFilterInputStream  *fstream,
+ 	if (eof && !*got_boundary)
+ 		read_length = MIN (fstream->priv->buf->len, length);
+ 	else
+-		read_length = p - buf;
++		read_length = MIN ((gsize)(p - buf), length);
+ 	return read_from_buf (fstream, buffer, read_length);
+ }
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1801.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1801.patch
new file mode 100644
index 0000000000..5f445f7354
--- /dev/null
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1801.patch
@@ -0,0 +1,126 @@
+From f9c933e258e9ef2f221cca6395f8092a1c4b93dd Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 19 Mar 2026 17:10:36 +0800
+Subject: [PATCH 2/4] Fix CVE-2026-1801
+
+This patch merges 3 upstream patches
+
+Chery-pick the first two patches to make the context is the same as the
+third patch that fix CVE-2026-1801
+
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/commit/1e32b5e123aa1689505472bdbfcbd897eac41977,
+https://gitlab.gnome.org/GNOME/libsoup/-/commit/8a2e15c88512ae4517d2c2c887d39299725b22da,
+https://gitlab.gnome.org/GNOME/libsoup/-/commit/b9a1c0663ff8ab6e79715db4b35b54f560416ddd]
+CVE: CVE-2026-1801
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-body-input-stream.c | 66 ++++++++++++++++++++------------
+ 1 file changed, 41 insertions(+), 25 deletions(-)
+
+diff --git a/libsoup/soup-body-input-stream.c b/libsoup/soup-body-input-stream.c
+index 6b95884..25d9312 100644
+--- a/libsoup/soup-body-input-stream.c
++++ b/libsoup/soup-body-input-stream.c
+@@ -159,15 +159,18 @@ soup_body_input_stream_read_chunked (SoupBodyInputStream  *bistream,
+ again:
+ 	switch (bistream->priv->chunked_state) {
+ 	case SOUP_BODY_INPUT_STREAM_STATE_CHUNK_SIZE:
+-		nread = soup_filter_input_stream_read_line (
+-			fstream, metabuf, sizeof (metabuf), blocking,
+-			&got_line, cancellable, error);
+-		if (nread <= 0)
++		nread = soup_filter_input_stream_read_until (
++				fstream, metabuf, sizeof (metabuf),
++				"\r\n", 2, blocking, TRUE,
++				&got_line, cancellable, error);
++		if (nread < 0)
+ 			return nread;
+-		if (!got_line) {
+-			g_set_error_literal (error, G_IO_ERROR,
+-					     G_IO_ERROR_PARTIAL_INPUT,
+-					     _("Connection terminated unexpectedly"));
++		if (nread == 0 || !got_line) {
++			if (error && *error == NULL) {
++				g_set_error_literal (error, G_IO_ERROR,
++									G_IO_ERROR_PARTIAL_INPUT,
++									("Connection terminated unexpectedly"));
++			}
+ 			return -1;
+ 		}
+ 
+@@ -180,9 +183,9 @@ again:
+ 
+ 	case SOUP_BODY_INPUT_STREAM_STATE_CHUNK:
+ 		nread = soup_body_input_stream_read_raw (
+-			bistream, buffer,
+-			MIN (count, bistream->priv->read_length),
+-			blocking, cancellable, error);
++				bistream, buffer,
++				MIN (count, bistream->priv->read_length),
++				blocking, cancellable, error);
+ 		if (nread > 0) {
+ 			bistream->priv->read_length -= nread;
+ 			if (bistream->priv->read_length == 0)
+@@ -191,16 +194,19 @@ again:
+ 		return nread;
+ 
+ 	case SOUP_BODY_INPUT_STREAM_STATE_CHUNK_END:
+-		nread = soup_filter_input_stream_read_line (
+-			SOUP_FILTER_INPUT_STREAM (bistream->priv->base_stream),
+-			metabuf, sizeof (metabuf), blocking,
+-			&got_line, cancellable, error);
+-		if (nread <= 0)
++		nread = soup_filter_input_stream_read_until (
++				SOUP_FILTER_INPUT_STREAM (bistream->priv->base_stream),
++				metabuf, sizeof (metabuf),
++				"\r\n", 2, blocking, TRUE,
++				&got_line, cancellable, error);
++		if (nread < 0)
+ 			return nread;
+-		if (!got_line) {
+-			g_set_error_literal (error, G_IO_ERROR,
+-					     G_IO_ERROR_PARTIAL_INPUT,
+-					     _("Connection terminated unexpectedly"));
++		if (nread == 0 || !got_line) {
++			if (error && *error == NULL) {
++				g_set_error_literal (error, G_IO_ERROR,
++				G_IO_ERROR_PARTIAL_INPUT,
++				_("Connection terminated unexpectedly"));
++			}
+ 			return -1;
+ 		}
+ 
+@@ -208,13 +214,23 @@ again:
+ 		break;
+ 
+ 	case SOUP_BODY_INPUT_STREAM_STATE_TRAILERS:
+-		nread = soup_filter_input_stream_read_line (
+-			fstream, buffer, count, blocking,
+-			&got_line, cancellable, error);
+-		if (nread <= 0)
++		nread = soup_filter_input_stream_read_until (
++				fstream, metabuf, sizeof (metabuf),
++				"\r\n", 2, blocking, TRUE,
++				&got_line, cancellable, error);
++		if (nread < 0)
+ 			return nread;
+ 
+-		if (strncmp (buffer, "\r\n", nread) || strncmp (buffer, "\n", nread)) {
++		if (nread == 0) {
++			if (error && *error == NULL) {
++				g_set_error_literal (error, G_IO_ERROR,
++				G_IO_ERROR_PARTIAL_INPUT,
++				_("Connection terminated unexpectedly"));
++			}
++			return -1;
++		}
++
++		if (nread == 2 && strncmp (metabuf, "\r\n", nread) == 0) {
+ 			bistream->priv->chunked_state = SOUP_BODY_INPUT_STREAM_STATE_DONE;
+ 			bistream->priv->eof = TRUE;
+ 		}
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-2369.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-2369.patch
new file mode 100644
index 0000000000..814672caca
--- /dev/null
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-2369.patch
@@ -0,0 +1,33 @@
+From 5c4e65fd99ff4e3ae76c7985c5e160bb07ea0f92 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 25 Mar 2026 11:24:36 +0800
+Subject: [PATCH] sniffer: Handle potential underflow
+
+Closes #498
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/b91bbd7d7888c85b17a8b33173caa806dff51681]
+CVE: CVE-2026-2369
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-content-sniffer.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
+index 3edc568..b091bca 100644
+--- a/libsoup/soup-content-sniffer.c
++++ b/libsoup/soup-content-sniffer.c
+@@ -504,6 +504,10 @@ sniff_unknown (SoupContentSniffer *sniffer, SoupBuffer *buffer,
+ 		if (!sniff_scriptable && type_row->scriptable)
+ 			continue;
+ 
++		/* Ensure we have data to sniff - prevents underflow in resource_length - 1 */
++		if (resource_length == 0)
++			continue;
++
+ 		if (type_row->has_ws) {
+ 			guint index_stream = 0;
+ 			guint index_pattern = 0;
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-2443.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-2443.patch
new file mode 100644
index 0000000000..99d42acb1e
--- /dev/null
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-2443.patch
@@ -0,0 +1,135 @@
+From 7bb3115a296154e3f465900ea5c984a493385a7f Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Fri, 19 Dec 2025 23:49:05 +0000
+Subject: [PATCH] Fix CVE-2026-2443
+
+Upstream-Status: Backport [
+c1796442 soup-message-headers: Rework Range response statuses to match Apache
+191ef313 soup-message-headers: Fix rejection of Range headers with trailing garbage
+be677bea soup-message-headers: Fix parsing of invalid Range suffix lengths
+2bbfdfe8 soup-message-headers: Reject ranges where end is before start
+739bf7cb soup-message-headers: Reject invalid Range ends longer than the content
+]
+CVE: CVE-2026-2443
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-message-headers.c | 62 ++++++++++++++++++++++++----------
+ 1 file changed, 44 insertions(+), 18 deletions(-)
+
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
+index bb20bbb..535cf14 100644
+--- a/libsoup/soup-message-headers.c
++++ b/libsoup/soup-message-headers.c
+@@ -943,10 +943,16 @@ sort_ranges (gconstpointer a, gconstpointer b)
+ }
+ 
+ /* like soup_message_headers_get_ranges(), except it returns:
+- *   SOUP_STATUS_OK if there is no Range or it should be ignored.
+- *   SOUP_STATUS_PARTIAL_CONTENT if there is at least one satisfiable range.
+- *   SOUP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE if @check_satisfiable
+- *     is %TRUE and the request is not satisfiable given @total_length.
++ *  - SOUP_STATUS_OK if there is no Range or it should be ignored due to being
++ *    entirely invalid.
++ *  - SOUP_STATUS_PARTIAL_CONTENT if there is at least one satisfiable range.
++ *  - SOUP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE if @check_satisfiable
++ *     is %TRUE, the Range is valid, but no part of the request is satisfiable
++ *     given @total_length.
++ *
++ * @ranges and @length are only set if SOUP_STATUS_PARTIAL_CONTENT is returned.
++ *
++ * See https://httpwg.org/specs/rfc9110.html#field.range
+  */
+ guint
+ soup_message_headers_get_ranges_internal (SoupMessageHeaders  *hdrs,
+@@ -960,22 +966,28 @@ soup_message_headers_get_ranges_internal (SoupMessageHeaders  *hdrs,
+ 	GArray *array;
+ 	char *spec, *end;
+ 	guint status = SOUP_STATUS_OK;
++	gboolean is_all_valid = TRUE;
+ 
+ 	if (!range || strncmp (range, "bytes", 5) != 0)
+-		return status;
++		return SOUP_STATUS_OK;  /* invalid header or unknown range unit */
+ 
+ 	range += 5;
+ 	while (g_ascii_isspace (*range))
+ 		range++;
+ 	if (*range++ != '=')
+-		return status;
++		return SOUP_STATUS_OK;  /* invalid header */
+ 	while (g_ascii_isspace (*range))
+ 		range++;
+ 
+ 	range_list = soup_header_parse_list (range);
+ 	if (!range_list)
+-		return status;
++		return SOUP_STATUS_OK;  /* invalid list */
+ 
++	/* Loop through the ranges and modify the status accordingly. Default to
++	 * status 200 (OK, ignoring the ranges). Switch to status 206 (Partial
++	 * Content) if there is at least one partially valid range. Switch to
++	 * status 416 (Range Not Satisfiable) if there are no partially valid
++	 * ranges at all. */
+ 	array = g_array_new (FALSE, FALSE, sizeof (SoupRange));
+ 	for (r = range_list; r; r = r->next) {
+ 		SoupRange cur;
+@@ -988,30 +1000,44 @@ soup_message_headers_get_ranges_internal (SoupMessageHeaders  *hdrs,
+ 			cur.start = g_ascii_strtoull (spec, &end, 10);
+ 			if (*end == '-')
+ 				end++;
+-			if (*end) {
++			if (*end)
+ 				cur.end = g_ascii_strtoull (end, &end, 10);
+-				if (cur.end < cur.start) {
+-					status = SOUP_STATUS_OK;
+-					break;
+-				}
+-			} else
++			else
+ 				cur.end = total_length - 1;
+ 		}
++
+ 		if (*end) {
+-			status = SOUP_STATUS_OK;
+-			break;
+-		} else if (check_satisfiable && cur.start >= total_length) {
+-			if (status == SOUP_STATUS_OK)
+-				status = SOUP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE;
++			/* Junk after the range */
++			is_all_valid = FALSE;
++			continue;
++		}
++
++		if (cur.end < cur.start) {
++			is_all_valid = FALSE;
++			continue;
++		}
++
++		g_assert (cur.start >= 0);
++		if (cur.end >= total_length)
++			cur.end = total_length - 1;
++
++		if (cur.start >= total_length) {
++			/* Range is valid, but unsatisfiable */
+ 			continue;
+ 		}
+ 
++		/* We have at least one (at least partially) satisfiable range */
+ 		g_array_append_val (array, cur);
+ 		status = SOUP_STATUS_PARTIAL_CONTENT;
+ 	}
+ 	soup_header_free_list (range_list);
+ 
+ 	if (status != SOUP_STATUS_PARTIAL_CONTENT) {
++		g_assert (status == SOUP_STATUS_OK);
++
++		if (is_all_valid && check_satisfiable)
++			status = SOUP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE;
++
+ 		g_array_free (array, TRUE);
+ 		return status;
+ 	}
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 68ec576d9b..4ec7b18c0f 100644
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -40,6 +40,15 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-4948.patch \
            file://CVE-2025-4969.patch \
            file://CVE-2025-4945.patch \
+           file://CVE-2025-14523.patch \
+           file://CVE-2025-32049-1.patch \
+           file://CVE-2025-32049-2.patch \
+           file://CVE-2026-2443.patch \
+           file://CVE-2026-1801.patch \
+           file://CVE-2026-1761.patch \
+           file://CVE-2026-1539.patch \
+           file://CVE-2026-2369.patch \
+           file://CVE-2026-1760.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.34.1


