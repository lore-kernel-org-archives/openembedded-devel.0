Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03236C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 07:24:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15863.1736925892231482504
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 23:24:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3110a90dd8=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F3t26W012307
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 23:24:52 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443s1pkjjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 23:24:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxAw0+yXemG/xreyxvUaGxhyyYG8AnG8ZZ2aMm8M8BqF4EO60bRYRdhkGn82nQiUqd0oyI616JdYqFVI77+AgTACuPuY/SY6fxRuisPWo0/ZbEoTwNle17ij3+U+tPA4+Kb6jwfBfeocvs/Ld9PHcjl3BsYdt//UraYML2VqJZm6xA06CutpDnp8/i0VEG9yUWTt+mvUCe3f7yT4tQSZxOCkJ2JWZ3T/mX4Fi99ThCQ+dfiEmH+YoKvDTjviiWXVEHmH+d3bal7uyWJxm231sBvY7Z19u18I8aqtJaoYKE8SGWBK9eZv/fqwIMrxlZIJ8hugDbCKKHu49obhDjGUrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqbrlqol1fCruGzwQV6JJyNByUYtxbr9iXD97plUuWM=;
 b=bjsuPK3SyzZK1Ps5R01XxwfyWlSYFd3bBKgEOQKiV3NF6dAzTZoWb2uobuxjzKu1nPpTD8SIzI84e3JMp5mD2HptO2/E/CFXku7Z/IAB8DyBspnJYQR2eYm2wm/dqV90rqUfC48trUZ0gG6FcwabEdaG3pr0Vxa2cZGMumD5B4K6/V2oN8NRjO70TR7U0MFC9i0/2dxLO8fxeGJ6bi670R7uLSn6labTld6RFO9SZK1oRPPSV6f/iPr0PLNeeezzYlmoI5iVomaSsCTbol5lyoPpFiccBbkBILXLMnb9UeC+H3VtncYNqJy1ptj4p1emed8CcuxiP2/nTbOpDTBS8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 07:24:49 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 07:24:49 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 8/8] opensc: fix CVE-2024-45620
Date: Wed, 15 Jan 2025 15:24:28 +0800
Message-Id: <20250115072428.3667416-8-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250115072428.3667416-1-peng.zhang1.cn@windriver.com>
References: <20250115072428.3667416-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0112.apcprd02.prod.outlook.com
 (2603:1096:4:92::28) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|SA3PR11MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 439fb32b-865f-4b55-46ed-08dd3535b210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PDZYaCPM7cKf9iHMoN1I+dt32t+kfovuNXvCOeOnaf6ctL75NN/0v1FYm4p3?=
 =?us-ascii?Q?9yvgk73HhmbpBvkFtukadzZUV9hlK7pL4YL9eFVzFvw86orRdQNGYvcsER3h?=
 =?us-ascii?Q?wLoOBMiJ00+SLPiKsUJ6a2WZ8lmc2/JCx3gs4YKPcwXyQjruIgHtu8GQ4Xga?=
 =?us-ascii?Q?8gKD+F2x4LUlQ/y2fKJS2qTcTa+QQfrjtYcNomOiN0VkpwUTJnJqKqX1Rmmq?=
 =?us-ascii?Q?azTMm1XGV2mQlGxWlBYxF8SI227p+0wbCLK+R0oKwwQk9AioxVy0YpNQY9vU?=
 =?us-ascii?Q?kD3YCMSeT3ezBVMqnYs9+b2uoGVjos5KBhihzVqBBPzqwNj+O6eOwR63bGaU?=
 =?us-ascii?Q?7brcxqPsqR+QbL9pG3HKl68uFOEJesjNdwp+Si2Mqx1DMp5fxHzcX0L2YXLr?=
 =?us-ascii?Q?3RGnfsSuK3LLege6NlrjLICEBcfHMxJgvb9Q7aOLKSDih8C5OQnw+4OldUui?=
 =?us-ascii?Q?7Wr1P1nWi6EiPqI8vNzOfkwg6b/3PxC2p/gb+hKOfjmvYM7Sd35xzlOWyJ75?=
 =?us-ascii?Q?7aFz9HNtm4frMuDtsDWrE8jM1RpUKmSGQdjbeW1qKWeey1f5xjHajvrXra2t?=
 =?us-ascii?Q?FgoieIgG1Qgs/r9XOhbkugV3rhEJRy8tGEHMOaE8rgKMrMQcsFe/M5ySUAps?=
 =?us-ascii?Q?/z1KMfiD52BtJ5FIcOmdKmtSi2lfvmAKfekhjpjLhaWB5jzemD2m1RLK7Hf2?=
 =?us-ascii?Q?EwU2d+8PoHKo/69jYexpcTOSTvw9eSwCdBY9GFtj2lbe7uVNxO4z4q1Sx2jd?=
 =?us-ascii?Q?Tf+tLVXD2/MBUXHKmJvCJ+YIC8OvwYyLHjo5WRwd7QmMSplBOShzBQ9xfIJs?=
 =?us-ascii?Q?iMcqMttVaqNeQXgivjmErAOCu4NuvDWHoS2MlDDi1MHz6VGoFOQSoYOun3fB?=
 =?us-ascii?Q?dT3LtHcSmzq+TJ5bpi/lcbxWR4RHbF+v9vbFOWbfyBXQSF43A5JlXK0jGeu8?=
 =?us-ascii?Q?FfZnmtTlD0LjRv3lhY4tttHhYNTbJyOxBl/+8MQz7na8OnyPTn0JkCB5A69D?=
 =?us-ascii?Q?kze3PRE//HXPeMaOKKJ84WpLj3Uz6Bbd1NPUllBDYRYRe6qaWrAXLUGYmXvi?=
 =?us-ascii?Q?XCX99+KfynfQLZhEkFKb3uzvhYxpIvV840WZjMXEWDLpl+aHVok7hJXgpCV6?=
 =?us-ascii?Q?yJ6J+HozqxftpHgZRHS/ffrlEZNNt3PUNfxhQj7AdeVfyAelPB4yhDlAaOlo?=
 =?us-ascii?Q?0CVfESVnNOG1lU2OZdyv5thHhd+oQfjOq9zIhGFMk2SSFydMY5qNtqHSLSBx?=
 =?us-ascii?Q?zA3uqoRQjYkWO8y0QVi5TON7ohOKFD1GfWggYfNsz6KgvOJxVZrCI9frrX9x?=
 =?us-ascii?Q?HBjbwmKEgAkbdg7dLbRAI0DyZLU/Tucy52G91mjrxr3uu3bylXZWVsZ73aP7?=
 =?us-ascii?Q?8ydzS0/B5+sMrEk44gnK7OOMxqmbLOvpt2F76KHGPmaRjIs+Ag=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?C8lk0Dox9+WT3mjCF7IUH3rMLVA4e+FC4S1lkKxglLmzNqwn+DDbVPC+ryN+?=
 =?us-ascii?Q?HOlQYhYI+eK4JPJaJy1v3Cb7H7D0kyvN58zUxztrNtGrbR94NXwgCQWw0l1T?=
 =?us-ascii?Q?MG0OG0nP0ogwbxiTEij0t0TmI6trRcfpja1/0+qkNz0ire7ZyOIO/eN5zPyJ?=
 =?us-ascii?Q?3OX6K491BJQ6xedLNNFSoFUp28joy0Wjo3k1uxLAvtbRdfpSe1Hkmj9tpoAX?=
 =?us-ascii?Q?aoXblrNPAARXtpYc2D2XY/1luVEfLDWgqKY3/Tckn5rlxmSMmZe0UBaKwIY3?=
 =?us-ascii?Q?S6aEc7C2N791/yyT8jmJbVb7Akvlv7Zi1h2hYUkcgzxJdLXYWHlQP6hA+Xx8?=
 =?us-ascii?Q?OeR8TlmdoKPzI5h7d+AJHUs8h9/rHBDIwmwhtyw2VehhrDmRCRKr8bzqzWmD?=
 =?us-ascii?Q?IwME4ma3QAzyLeVYNl/eqUWDvI+zzgqDxvR+gDlu8yfrfineqbQj0DxoHoMX?=
 =?us-ascii?Q?Po+VOEYH37P0wJz8N3sYa3HuWrVk+bSooqtX42CUsQERoEY7VPRJRJaO0jhw?=
 =?us-ascii?Q?PfNSt66pF3H5y06LF0p0R7MVfp8Xo4EdTbK6qupulQjdBzEd9VL4Ip+b3JxH?=
 =?us-ascii?Q?FtHQtezvSQCypUxfwBnmpv464K7mrHqUMHRn7OOa5FApfgF1+jZpscoVVtGJ?=
 =?us-ascii?Q?QCZttC796YCWQAvuH8Cu24FDJW6swDLlQoLx1chqCAUDT1sxVThcfMbrfVm+?=
 =?us-ascii?Q?Jw6G9GD6TI0cO6PJ7LR7zHPW2hvz/Aj4Hzuw+ASQNJrry5H/zzSCcrtnQwZR?=
 =?us-ascii?Q?ZiHloxQP7+oYhse2qUXQj9rkj6OFK75cuR67QPwmruuv3sD9T0Xbsj+EyRWU?=
 =?us-ascii?Q?1/TAfAkW4/mAAJH6Knvpqhb+s+02WQCTpbTqUa9e8VTDibcRyHBZt67IE7wD?=
 =?us-ascii?Q?hLGQTSV3jXjGDYFfok+M9BEU5d0no3rmlh3oJC2GYGU4L2sv0ZRVD2ypb5O4?=
 =?us-ascii?Q?uRucvU6WXg6ADuecQjbMvfZJ4IUDvn0vYdSd01oc2liivFvJ53uh4LQEjNeJ?=
 =?us-ascii?Q?U7vj0iZbXdk6rb7ZEyiNK9AuUJWwQod+2QcpTJPe1IFk7YN4XXs24pPuKryb?=
 =?us-ascii?Q?vMoOq5Us/g4UoNd9mHFFO2dR7YfrTa3Gt+M96yNJ817xwsZCdj5ljsJ5tMdn?=
 =?us-ascii?Q?2McWLeRkfHNNM6wdKPyjo6zefNd5MR5efir+fsQE5cqwHbachAyOn0wcHuph?=
 =?us-ascii?Q?klWBA7ZutjoV9buwQO/MK9qs+WQbjJruxk7bMwCLHBhp3eFPOtXRL18YH54V?=
 =?us-ascii?Q?/wppzTE3aT519eUmrEPMuGJZdnGOyMaGjnajB7adEFNS0kcLEWVSBLlkHUS3?=
 =?us-ascii?Q?GkUHArQFjd77YHhWnYcOtS1zsDrt0iWLrHD5b3ENPBUvARIP1WN4v1zVawGH?=
 =?us-ascii?Q?2sgr3jgKkZOGdyz64cbuAxK+CGg58bnGE75gYXfBiPCaMB4eUZMNywYodNv/?=
 =?us-ascii?Q?8aOoJXPQ2C9ikm6nTEKnaRT9kLcf/qGbEbOdg7BTh/hd7Vczmb30Wm43v7W/?=
 =?us-ascii?Q?UI17nakRJXuPsmcDQbJ1Pd/VpNkL6mr6ySotVvSpsa1F5QRcRS1+2OG1cfrV?=
 =?us-ascii?Q?+IFHh5hXZSCigO/9DGhkmz8R/VJGYSkdp66lHie9XteCwgzCFfnr/rpkZ1BV?=
 =?us-ascii?Q?qw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 439fb32b-865f-4b55-46ed-08dd3535b210
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 07:24:49.6363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UU8eYf596geRUxaFCqd1RBkNSIjeFlCHRmuxyXblrsKafc46TIXV/+Ti69/2jgivoSX2peUEchrCmlj1ekfNgw8Cdfu6hVdeonzrGLObOS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8046
X-Authority-Analysis: v=2.4 cv=DdLtqutW c=1 sm=1 tr=0 ts=678762c3 cx=c_pps a=ynuEE1Gfdg78pLiovR0MAg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=b0JbnPJMiK5919SWX6MA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 1k3BpG5xKQsbDllioP-ytDCUhFOT0Wtc
X-Proofpoint-ORIG-GUID: 1k3BpG5xKQsbDllioP-ytDCUhFOT0Wtc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_02,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501150054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 07:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114892

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-45620:
A vulnerability was found in the pkcs15-init tool in OpenSC. An attacker could use
a crafted USB Device or Smart Card, which would present the system with a specially
crafted response to APDUs. When buffers are partially filled with data, initialized
parts of the buffer can be incorrectly accessed.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-45620]

Upstream patches:
[https://github.com/OpenSC/OpenSC/commit/a1bcc6516f43d570899820d259b71c53f8049168]
[https://github.com/OpenSC/OpenSC/commit/6baa19596598169d652659863470a60c5ed79ecd]
[https://github.com/OpenSC/OpenSC/commit/468a314d76b26f724a551f2eb339dd17c856cf18]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../opensc/files/CVE-2024-45620-0001.patch    | 42 ++++++++++++++++
 .../opensc/files/CVE-2024-45620-0002.patch    | 34 +++++++++++++
 .../opensc/files/CVE-2024-45620-0003.patch    | 50 +++++++++++++++++++
 .../recipes-support/opensc/opensc_0.22.0.bb   |  3 ++
 4 files changed, 129 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45620-0001.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45620-0002.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45620-0003.patch

diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45620-0001.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45620-0001.patch
new file mode 100644
index 000000000..bacf75960
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45620-0001.patch
@@ -0,0 +1,42 @@
+From a1bcc6516f43d570899820d259b71c53f8049168 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Thu, 18 Jul 2024 09:23:20 +0200
+Subject: [PATCH] pkcs15-starcos: Check length of file to be non-zero
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_pkcs15init/20
+
+CVE: CVE-2024-45620
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/a1bcc6516f43d570899820d259b71c53f8049168]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/pkcs15init/pkcs15-starcos.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/pkcs15init/pkcs15-starcos.c b/src/pkcs15init/pkcs15-starcos.c
+index bde7413a46..267ad2b04a 100644
+--- a/src/pkcs15init/pkcs15-starcos.c
++++ b/src/pkcs15init/pkcs15-starcos.c
+@@ -670,6 +670,8 @@ static int starcos_write_pukey(sc_profile_t *profile, sc_card_t *card,
+ 		return r;
+ 	len = tfile->size;
+ 	sc_file_free(tfile);
++	if (len == 0)
++		return SC_ERROR_INTERNAL;
+ 	buf = malloc(len);
+ 	if (!buf)
+ 		return SC_ERROR_OUT_OF_MEMORY;
+@@ -682,7 +684,7 @@ static int starcos_write_pukey(sc_profile_t *profile, sc_card_t *card,
+ 	if (num_keys == 0xff)
+ 		num_keys = 0;
+ 	/* encode public key */
+-	keylen  = starcos_encode_pukey(rsa, NULL, kinfo);
++	keylen = starcos_encode_pukey(rsa, NULL, kinfo);
+ 	if (!keylen) {
+ 		free(buf);
+ 		return SC_ERROR_INTERNAL;
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45620-0002.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45620-0002.patch
new file mode 100644
index 000000000..65d596b92
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45620-0002.patch
@@ -0,0 +1,34 @@
+From 6baa19596598169d652659863470a60c5ed79ecd Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Thu, 18 Jul 2024 09:35:23 +0200
+Subject: [PATCH] iasecc-sdo: Check length of data before dereferencing
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_pkcs15init/21
+
+CVE: CVE-2024-45620
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/6baa19596598169d652659863470a60c5ed79ecd]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/iasecc-sdo.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/libopensc/iasecc-sdo.c b/src/libopensc/iasecc-sdo.c
+index 417b6dd57d..98402a4e3f 100644
+--- a/src/libopensc/iasecc-sdo.c
++++ b/src/libopensc/iasecc-sdo.c
+@@ -729,6 +729,9 @@ iasecc_sdo_parse(struct sc_card *card, unsigned char *data, size_t data_len, str
+
+ 	LOG_FUNC_CALLED(ctx);
+
++	if (data == NULL || data_len < 2)
++		LOG_FUNC_RETURN(ctx, SC_ERROR_INVALID_DATA);
++
+ 	if (*data == IASECC_SDO_TEMPLATE_TAG)   {
+ 		size_size = iasecc_parse_size(data + 1, &size);
+ 		LOG_TEST_RET(ctx, size_size, "parse error: invalid size data of IASECC_SDO_TEMPLATE");
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45620-0003.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45620-0003.patch
new file mode 100644
index 000000000..5bc8805e6
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45620-0003.patch
@@ -0,0 +1,50 @@
+From 468a314d76b26f724a551f2eb339dd17c856cf18 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Thu, 18 Jul 2024 11:03:46 +0200
+Subject: [PATCH] iasecc-sdo: Check length of data when parsing
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_pkcs15init/27,29
+
+CVE: CVE-2024-45620
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/468a314d76b26f724a551f2eb339dd17c856cf18]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/iasecc-sdo.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/libopensc/iasecc-sdo.c b/src/libopensc/iasecc-sdo.c
+index 4d6be7ad4..bdbd5ab17 100644
+--- a/src/libopensc/iasecc-sdo.c
++++ b/src/libopensc/iasecc-sdo.c
+@@ -334,16 +334,25 @@ iasecc_se_parse(struct sc_card *card, unsigned char *data, size_t data_len, stru
+ 
+ 	LOG_FUNC_CALLED(ctx);
+ 
++	if (data_len < 1)
++		LOG_FUNC_RETURN(ctx, SC_ERROR_INVALID_DATA);
++
+ 	if (*data == IASECC_SDO_TEMPLATE_TAG)   {
+ 		size_size = iasecc_parse_size(data + 1, &size);
+ 		LOG_TEST_RET(ctx, size_size, "parse error: invalid size data of IASECC_SDO_TEMPLATE");
+ 
++		if (data_len - 1 < size)
++			LOG_FUNC_RETURN(ctx, SC_ERROR_INVALID_DATA);
++
+ 		data += size_size + 1;
+ 		data_len = size;
+ 		sc_log(ctx,
+ 		       "IASECC_SDO_TEMPLATE: size %"SC_FORMAT_LEN_SIZE_T"u, size_size %"SC_FORMAT_LEN_SIZE_T"u",
+ 		       size, size_size);
+ 
++		if (data_len < 3)
++			LOG_FUNC_RETURN(ctx, SC_ERROR_INVALID_DATA);
++
+ 		if (*data != IASECC_SDO_TAG_HEADER)
+ 			LOG_FUNC_RETURN(ctx, SC_ERROR_INVALID_DATA);
+ 
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
index 5e840555b..52e29a5d9 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
@@ -52,6 +52,9 @@ SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https \
            file://CVE-2024-45619-0004.patch \
            file://CVE-2024-45619-0005.patch \
            file://CVE-2024-45619-0006.patch \
+           file://CVE-2024-45620-0001.patch \
+           file://CVE-2024-45620-0002.patch \
+           file://CVE-2024-45620-0003.patch \
           "
 
 # CVE-2021-34193 is a duplicate CVE covering the 5 individual
-- 
2.34.1


