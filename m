Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84554CA5FB3
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 12:04:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9552.1790856292960609940
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 05:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bniOvbUy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=473490b304=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691BkcTA2606406
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Oct 2026 12:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=7S/mV5MXvQsw7pgc3MDDA2w9ZREZvifGcvMBlaX8JRU=; b=
	bniOvbUyhu02hIPqt1cWv1RNzpfDapbB3XQ1V8ugCJohyVuWyAA/ZE09bAclMmt7
	g1xLsYJH4ge7jB8ayHIlz5FEr/SdmHQrorTR4fU9OYmL0XEK160asdjmCC43YQtR
	Zi8aNFM74klOE/Riq8FTuflcFRj34MI1cM0PJchVtEg0oro7kIA7QDnf+XcuXeOs
	/qyLMj0Iqn6dNl7r3tspU3TPHmXo/g95ti744y7byAJVPBub3rbPP1MIDZjro/Ci
	DWPXiuBAOun0DfX0ptM29io/oabdwIWrmZ+LtTrsFmONejNTiLQzt12XvftH/ZY9
	ytzBGzwkJvN8Oyd+6ncmQQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022094.outbound.protection.outlook.com [52.101.43.94])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gx515gx5x-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 12:04:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYWK+O4YCoOtgDigfGV6nkb99A8NRHSlhHQwmvZ5q3RHq9FQqEg05k7O9xtIrqn0adVA/mCrK+boVQS+y1GbGFlJiJlVMub1Wt4TmWRqrf4m0Luh41C5miUjrBsDFsXZ7zBWrW2wMStw7Uz0+ahEtQawcgMUfqvfmx4tbi9v5ZBUr81qWfXzV8RtdfzMNBRCo0Z5bQNe1Mv5VqUQOTXKNLPbGvUXL50/pzcYReKLCK2NyJQZfG0xtm+mZWXoayoc42Zm6JLV40Pacf9KqkxRhSeZgdJZPTYTPsB48rYSDsGobMToxV3d3YdPhXjQxbPS119XtVktBkHnh0reBWqErw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7S/mV5MXvQsw7pgc3MDDA2w9ZREZvifGcvMBlaX8JRU=;
 b=mrKmTmOUF90eaOt4xmgWeRxLdDaOVVtKoDHTRZBUAyPrZtyvGntIBAgwj7CW0IqB1F4E6Hkq0hc8/Q218f2p1QffkZ37QFi+ba08TuC3ehoMcrQtbivSHlPEgmNUMQ1NTH96/Akbx3uooi4LFZczHk3wCRY/mixVB4oyJ+ajzW1o4hZeM1h56UOXHkrixbs9//v1ndcXcc1dRYmk478Y5rzpV+dYtAiy3V/Ws8gcuVIUYXEkLF/WiuAZt258Dd7b5Oju28LAzN7O7ZCPyzj1gors3bZimsj4Z3ZQhgFd+psv3zUmVuW37jZPJItFBr+CyWXfCHDOw15H3oWlHCgKYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Thu, 1 Oct
 2026 12:04:45 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%4]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 12:04:45 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shiva.Komati@windriver.com
Subject: [meta-networking][wrynose][PATCH 01/11] strongswan: fix CVE-2026-78123
Date: Thu,  1 Oct 2026 17:34:07 +0530
Message-Id: <20261001120417.1280843-2-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20261001120417.1280843-1-Abhishek.Bachiphale@windriver.com>
References: <20261001120417.1280843-1-Abhishek.Bachiphale@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::13) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|MW4PR11MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: ab57b320-ec29-4872-49b8-08df1fb42f17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|23010399003|260925022911599003|260925021911599003|260925021311599003|10067099003|11063799006|56012099006|12006099003|6133799003|22082099003|18002099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	Ogp9c14z+wDOXdFUr3c7TrdL6FTVyVW3gKkC2fqHIPXhe9t1iOdV/yNICu+mJE60sIlzSy1kiSQzvq0Cgu222D4MkiP+o/JWRGVO/WMHWBvT/5ZpqqDKTo0Z+AHPi/C137Q+9G7fNhdd2ztJPOZCbOQyC2gobsQrLbHPdddUqAJzElaZ/6aA0HDURHWKoD/LEo4btZjqgLCnN1KGZ2UJT+nJDSBmlqeVa3sGeHeTY1+raKcJZJ425cunnFjJOXrqzUjW6mrpiJwEBCTG6we2Ezo3JxTN0j4BWv5blauWcc7szhcQXOQ4p/397lOXIUrGJ9SMx0lf721rX29BugOPG2CHILe2guPuRLMZ4qhO/lXC1YMFJuR0Smb3mKBeA6E0mInKSmkhbtwXw0EzQ01pHUQanXuoOJe049jBnCl/mZV/yoIgXTnx04DoPqiVe1B7tObFDrVggg6icjL48EUKZHaTh1XUbzVUKADrMMP4ThVdzE+h/tsDqS4zcfb5+ihECB1PQDbfp3yOzyYZuYR1bZ+uKu0nub6dc0Z28ew5N/FPsAnriTTvvYtEpVBE2et6eHKamdq4UD7hDxoXFlH/5GlkC7265EnMgrixzq2vnctkvmbwbFo4zi4lKYC6XIUTg02H6xPXwrH2titxcmhJ6ZkNYK2/Ej2pLSriYFHoGY0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(23010399003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(11063799006)(56012099006)(12006099003)(6133799003)(22082099003)(18002099003)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lvAJYZJdjmJ+mB/hoPhoCaqvZZoPyFTsL95Zytm/QfAA0C86zq9iTVxj+26D?=
 =?us-ascii?Q?/8ixmmG/8O5f52yBjEcNpgEb4wr2p2S8IWaeb5hLHAg6ihyoXvqpdpn32lSc?=
 =?us-ascii?Q?WJVU08v0YSPRw9hoaBfz4nGHklIRayP1VcJ5L0OhilQ2MGVKyB/CThPSfgXo?=
 =?us-ascii?Q?dA+m/+xRAdL7gzfeG7Emx1h+h8gwECbllnT3S3c6CmnPKNkaBVWB3yKF6O6B?=
 =?us-ascii?Q?/p82aOLStzjvB1F1B5zpKxNkpX9aexrTHZELOYYX3KqztlQuUujO8sdL3ubK?=
 =?us-ascii?Q?uFz65ypIGEkjOS22Gdfyp3MWKwV1KM+JXquXOzHr7a8uPanIa26HotkVNg6E?=
 =?us-ascii?Q?YREnefRdZhqidD37RZy+m+bSgh01oosme14f6Aq644h0PYkiMBr9Jlhph69D?=
 =?us-ascii?Q?H10aqebs6xx8aCIyKeGfRIk5HLxBP2GkQI9A36t6NLr3TJvb48JAacKAJ1hi?=
 =?us-ascii?Q?fc6swMFStQ6FVZ4nt8lfmZSxZAjQ6n65s/uYt/D0vSXl2MUQgjLs12y0MEqn?=
 =?us-ascii?Q?f2hOA/ltTxGjKF1Pu1d7gC8MawKwY38ThxHo7YxNJC+M+9uaUbkGO1VLYXM4?=
 =?us-ascii?Q?v4mCys1ubPieTDYt+gu6y02v72panh19dU77WeS8O1qj9I8+zAWfrU0iB8ST?=
 =?us-ascii?Q?uSZxaMaxiYHF8rIzPlquIG9V8db6U5tqViXApKCg6aNzkEmlyyQedTPcp/R3?=
 =?us-ascii?Q?4m47a9VEndUnYpZyRqMHEB90OKGdXcDEFNAZNtKKSTM8OlK6SExtZTcwYtEf?=
 =?us-ascii?Q?X9TUJI9wXvE0CidVpmdc0QGGwcnV3ddYOzCmhnXwn1JPM5XMsoMLA7H13RUB?=
 =?us-ascii?Q?gRf1S6rTXvAWzPNszocg9ssQh2YDALb+KbR7RQs4SZfUng+mxLBpj9vzZSk8?=
 =?us-ascii?Q?REOGP4H0+hXD4rTQSufZ1PMJvigH3fuY1fTsmsnOGqCanGvJSF/cKs+LgZTB?=
 =?us-ascii?Q?Ypdm7kfqC94pPQT+chG0vnnmw/R7ui+aFnZNyjgr41nVwHQet3t58yIgx11I?=
 =?us-ascii?Q?8TOJYdFom64RW8sEi0xzeDBxiECh0bKLfIZKaOIelOtWVo2DlQ8tlwkspp2n?=
 =?us-ascii?Q?Kvhj1ySS8fxb0PLPnboKhNDjtM6lW7lxHnRUspV8LUtVvVXRwgyl3sNfctKS?=
 =?us-ascii?Q?Pc2ZslbBD7VdnLhNG/gxeGL+ZVzEZ0pmJPNr5nNwz6lypiHFjTIPiJ4HhyEL?=
 =?us-ascii?Q?CaKJgTv3l8NzkQkle7nE4Gk/OLa1yXOmc9F0kT9Ngnj3mmQK0UwePPZ+CBgE?=
 =?us-ascii?Q?9m7U/1qf9rOxUS6bzaZCxcJ19EcjrGM6qB8M2d5kZC2fat6ACejmsQlMBEUi?=
 =?us-ascii?Q?Roodcyxt2FIas+H95gBYpwilw51AmH/DF/H0HhHl7M8DltUpCRBx0Aw32vSZ?=
 =?us-ascii?Q?c8lgUkBrVC7Cr/T0iGA7Ue2TLYFY7Uq3w4qAJKHuJNHClT0bOuY6lRtM8qKL?=
 =?us-ascii?Q?tCmFhPANtIoEQBeVQoj1HW79XIu0B39CLzH9u0s7uyc9PYKN163XCJKD98FN?=
 =?us-ascii?Q?mOjoYy8XZqMb5g+E6LzKK8y66EG+mFx9ZxURqEP9sVUR95O7ghOS9apVfP/+?=
 =?us-ascii?Q?g0EU5UQyKMfdSqbpwcSf6SOc4dz9MvRsue79/JEnRsyVLPVopc6HyhN8ZmR5?=
 =?us-ascii?Q?J8q8Wa0zZheGj1yl1ypnRV9UM4UQyo3kPTQYrsERVRmwmOEwEWz/T0OExhs4?=
 =?us-ascii?Q?syIq4dXlQiqc2POqV042vXYPr5xn+FUy6YnFQpdq63b2LGkxJLFiiHVXwRng?=
 =?us-ascii?Q?Wx2EMMidPkqr35o9j1wKXp+5CNRBhQ4vJKAZtv5yDdBAZ7thPMK7?=
X-Exchange-RoutingPolicyChecked: 
	k7qWZjx7O6aQX6bLlJuacB/ZEWeU8va0MzhwtX4NiyKfvc/hy5pKY+3PAufc/MLbx5Mg4h62JcHlqFH5Sa+nnua9cdeN6OsrQXBkOmt94L5gVsOFqUR2UeFbp4hWhDN3M+1wpMM4gdz4vC7u5yLx7Rp2t2xyOZaCu3rNKExneQx1CKDm6CMszxJ5wNEb7FWYozBBQPo1tMm6yhps6U1//tvQghyvkW59/keW59vHeHTocexHvm1t3NYW96Qg1grFR3dfO4omsF0ZQfW3sSU0LDWfr9BPxuOFym06AXAVS5oyvenIkXSwzbm+MluylPNyDLhvdaqVUjovoQJYwYNYjw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab57b320-ec29-4872-49b8-08df1fb42f17
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:04:45.6512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nkszgepQqcXSOLj1Xow2qFVjBYuZ47V16psyUV8Xrm8nKYG0vDsITjvOgunEqdVEfbUcvNTvXwB5MF5RisTtbzswkWGc5DQ9rGo3AvI7Vlfm/HZtO1B6/xtkv+LaZDjJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0NyBTYWx0ZWRfX089mlG9rJEUK
 mleXQ5vFq0Juz20b3yYWF2mYKDCfeXlAbZ65rf8UJpUvWu3qy1tLz4R/nSpYttEBgymOkoAklGm
 B3vu8B2OQDo/zmoJahIsGhBDRa5yTHy0E6yi7FH/ivBp9mlFFoK7
X-Proofpoint-ORIG-GUID: mALMO9Vf4aWefsfPhaTP8YlCaACq_fpW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0NyBTYWx0ZWRfXxlolHDmQFtlH
 +lZhXsWzpaZEkFBrlZkiDD4XsypGM2vtT0S6O9HlNc6v5mAcoUG6da7Rptlafs6VVCk+R7FCrVH
 0YQjvW49H7Ib1rPompCOQIdn+PwzdqF54ASE3uI3uk22HEzUWfTxb1Pr6y7K+pI5KGEjXHyb6bs
 7k8L6wvG8cuDeMusGRvdxAZEewk3lYEVgu7AaUWEuXjMfZvCejfUwVCKZKvV+qOY0IR1vpgqviH
 K1vbnh4isik8Tzn33xVZgSHOq4fTrCKFV31iK/iIIu9Tsj7ZO/zg7jBN4aWRwZxWjZiou+3jl5D
 M6zZtHqQaZEohBUzDBEyQZ6/eD7qpnpHWhPdN377SMKIrV8cBrH0donC9YODOlK6l69QCWWOwqh
 zf4Cqu/Y9+Zon43isWR2IksZNL0EMfSvOEpOk7/v1Gv66A6v5BWJuT0Y+aOSj9Pt6BUcnk4aQ/O
 O6gFBzI+2QBm+dZdd0g==
X-Proofpoint-GUID: mALMO9Vf4aWefsfPhaTP8YlCaACq_fpW
X-Authority-Analysis: v=2.4 cv=S5lMU4sP c=1 sm=1 tr=0 ts=6abe4c63 cx=c_pps
 a=13WRnYNq68uQF2pe1ZmaJw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8
 a=KiMCiSwjAAAA:8 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=w8PvocCMYwcLFiy05zgA:9
 a=sPCYT0qwnquSfqsKqTDE:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 12:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130580

strongSwan 5.0.2 through 6.0.7 has an Expired Pointer
Dereference in PKCS#7 parsing in the openssl plugin.

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-78123]
[https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78123).html]
[https://security-tracker.debian.org/tracker/CVE-2026-78123]

Upstream Patch:
[https://download.strongswan.org/security/CVE-2026-78123/]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../strongswan/CVE-2026-78123.patch           | 53 +++++++++++++++++++
 .../strongswan/strongswan_6.0.6.bb            |  3 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78123.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78123.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78123.patch
new file mode 100644
index 0000000000..27750ee740
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78123.patch
@@ -0,0 +1,53 @@
+From 2918eb8a6d4b3167f26ac011e87c3a7ecc7dbe56 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Mon, 1 Jun 2026 17:51:35 +0200
+Subject: [PATCH] openssl: Fix undefined memory access when verifying PKCS#7
+ containers
+
+If the signerInfo or recipientInfo structure doesn't contain
+issuerAndSerialNumber but instead a subjectKeyIdentifier, then the called
+functions will leave the passed name and serial numbers unchanged.  While
+openssl_x509_name2id() prevents a NULL-pointer dereference, it tries to
+DER-encode the object at the passed pointer via i2d_X509_NAME().
+Depending on the stack contents, this likely causes a segmentation fault.
+
+Fixes: 3c820cdc232a ("Implement PKCS#7 decryption using openssl")
+Fixes: c61723c69fb5 ("Implement OpenSSL PKCS#7 signed-data parsing and verification")
+Fixes: CVE-2026-78123
+CVE: CVE-2026-78123
+Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2026-78123/]
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+---
+ src/libstrongswan/plugins/openssl/openssl_pkcs7.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/libstrongswan/plugins/openssl/openssl_pkcs7.c b/src/libstrongswan/plugins/openssl/openssl_pkcs7.c
+index 73611821aadb..9980bf242c12 100644
+--- a/src/libstrongswan/plugins/openssl/openssl_pkcs7.c
++++ b/src/libstrongswan/plugins/openssl/openssl_pkcs7.c
+@@ -222,8 +222,8 @@ static auth_cfg_t *verify_signature(CMS_SignerInfo *si,
+ 	auth_cfg_t *auth, *found = NULL;
+ 	identification_t *issuer, *serial;
+ 	chunk_t attrs = chunk_empty, sig, attr;
+-	X509_NAME *name;
+-	ASN1_INTEGER *snr;
++	X509_NAME *name = NULL;
++	ASN1_INTEGER *snr = NULL;
+ 	int i;
+ 
+ 	if (CMS_SignerInfo_get0_signer_id(si, NULL, &name, &snr) != 1)
+@@ -633,8 +633,8 @@ static bool decrypt(private_openssl_pkcs7_t *this,
+ 			identification_t *serial, *issuer;
+ 			private_key_t *private;
+ 			X509_ALGOR *alg;
+-			X509_NAME *name;
+-			ASN1_INTEGER *sn;
++			X509_NAME *name = NULL;
++			ASN1_INTEGER *sn = NULL;
+ 			u_char zero = 0;
+ 			int oid;
+ 
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
index d6176f000e..dfd4c0c8ca 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
@@ -10,7 +10,8 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-47895.patch \
-"
+           file://CVE-2026-78123.patch \
+          "
 
 SRC_URI[sha256sum] = "07df7cedae56a7f3bb07e66d21a1f9f87e961db70e99184e11d3819413e4f87c"
 
-- 
2.40.0


