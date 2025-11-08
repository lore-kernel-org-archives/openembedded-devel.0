Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D83CD1288
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 14:16:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6268.1762611352167119892
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Nov 2025 06:15:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Accn5Ubo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3407a683bf=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A8CK12Z2055482
	for <openembedded-devel@lists.openembedded.org>; Sat, 8 Nov 2025 14:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=xtfnB50sNU5M3tUQ9n7T
	0PiLrLxv/YMa/E0h37JB+pA=; b=Accn5UboPly4sh1cHNNMHEDSTTtNT/RFfw2W
	lDeYSCOkZyplZx9uT8o2Kuu03xVDQ217TRcTvg7f8iukc0WK+I9YEHew7Lx7nyV9
	RILgfZYnQxK8jPiC2uzuS26jIUkc55RvmDOI/plXS7UnwaFYXHfQz2Q1ELWxzghr
	qUBp7zhJNXhB+UVcwX59rBu1bEwW3n2x4mKLibIJBBuTdM6xWujTuuVrGBfSiSLf
	tow6opHtxlOOsCfEk3PxYI4Qnqy3qUHPQBo3OXQRmDJOnrVxOuKb+pdp2CQ4aBPd
	Rft5Y2B3OUpM/BM8cW/D+HmR+ePuS7hGhStImnP9NHuTeyQeEQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012043.outbound.protection.outlook.com [52.101.53.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9vu90b0b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 14:15:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TaXP7gZZ/Ih59gmsbDDEwYte56KFIXFE2kum9MauB4R5N888OlANxeWvG/spY1mCn+54lYmOOmTCPy+h8K7cM2j7HU1h2Va0TYZ0Mdfp+3xwgirDjWcUrSm4DAAoD8gYfzg5clVCQNNSSgFkg+DJr8e/hIWQreqBjB7A9Ui/SmiKZtj2MzA3K0PcP6BwNGaqjm7Qj+GHwx9r+RCJKBtLHxwJw6uc8fIdpBNMpUIiagPc1vfZVoMw4UE2dynypQLTpjF0SqQ0owDYdLObjvAzMSpAXB80EXro9wPGLtquDKA+STwjjr3xczTZlm6bozp89fcTQKVhOq1HCTwg4mAPew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtfnB50sNU5M3tUQ9n7T0PiLrLxv/YMa/E0h37JB+pA=;
 b=oeN5GlMaHg/4njjMhio2IxrcERABBPJEJB9hRkmSn0Kk4UEitVWm2c1u4Ref+gKeuEITc8sP+qLSfrQBT+9XexVPSoC37ju85bCpRqcMXk3OXZ20Jz8bFL1P2V2ixHdS1XYVE5p+BfITjkjY9bJOYQViPTLvdNddLpAIp9FyA+Oxlmpy9worRy0r0nkhNlWKu8SqdSRbEJ9aHoHWIPLuQV9+P38PoBCP0G00ZmXo3/wH2vvKxUfu+D3n88hXpQmWJ1l29NM6yCHX5LKvrfxmudjLYJfqfcGuaCM0SN853lQg9GdfzOUqDD+LtzDkrCYjWeib/CEeZPEnymExkbmwyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM3PPFD5EE188BF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f53) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.14; Sat, 8 Nov
 2025 14:15:49 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 14:15:49 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] libgtop: add UPSTREAM_CHECK_REGEX
Date: Sat,  8 Nov 2025 22:15:32 +0800
Message-Id: <20251108141533.97228-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0044.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM3PPFD5EE188BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 61c5f895-714c-49f6-a2d4-08de1ed1510f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fN0Z6A7UEASInOOEvlfN97GRGC0NbCT3Xep9zc0Tbrwhvq1uJY6+ouBkwcHW?=
 =?us-ascii?Q?jTDsFKTQ+huRT9yyy0MrtPcVz4MX9fenewyjukDAfuMrntHAgz5RWKF3fl3j?=
 =?us-ascii?Q?IoL6ig4COX/suwC+cut8tS6WkYduNvxgIZGIndefDXPyNuPcJPEArZCoTcxl?=
 =?us-ascii?Q?sPsrALTux9aiF3hSi4FUu5sS6tFuWzvQsi3XTLiX8VaumAOxNV9VUyw54SVx?=
 =?us-ascii?Q?/Z7yLelzXud2SDS9Ycb3G83psO2dV/jNrO3aPqGgq4eqy8q5cgB8UxF6/y/G?=
 =?us-ascii?Q?4A9Su+TbmJyOFeSIk3ROO9pu7uh4KGSNvrE7BRWNbrB8gSvj913vV/n4NTfB?=
 =?us-ascii?Q?xNVSfftgk3O/YMJfxnoC4KTy3db43XlmN4jOLXZyu3Ubk001PicZPRJn3siE?=
 =?us-ascii?Q?W1CM3px0/Se/Rfv+Aa9pxcMD6GrGdNMCEG+p7fq8oMsYcmpokxhJOfspet2e?=
 =?us-ascii?Q?mZaiptb0Yg3A2bNasLcYNxHPJbY/l3MZx+CZL4WaQUCyxJ5KuP/M1C2CN2mi?=
 =?us-ascii?Q?BMBhdjHYj38QR96ik7hQRaSedOlRtnBA2IxuSaf4ghE5vZyrlKHAYEBOee1s?=
 =?us-ascii?Q?jVKY5n5l3OfpSrrqkYXSOaKe7wbBJ7Y5viPNnJvygTbesM69wTY/DoC/dGWD?=
 =?us-ascii?Q?ivPp8IA/BHihsUtRIQ7UYMSZ2sTWAgr2TAWu4FPEbTjiUqSPTtAYraXbVeMd?=
 =?us-ascii?Q?oKRn0YeN0JOcTMe4wkw0xeUrgmVlFxzqY9vLm9xdkoVNjIxy99nBCeNektG6?=
 =?us-ascii?Q?60FB4UXrrlDIVo8OoRUsM1n8VWP4Cy/ScIWhcsGu4t0lrxwQnubngjSe72ga?=
 =?us-ascii?Q?sgSlEpcg2EPaNyL7qCuFnsLcq3GLiVKaTuVCgJkCHzt05kh7cd6ME0gupPNm?=
 =?us-ascii?Q?6r5VTr492GXLX7BWmUZ/1Rnevn8K1/Po1jeIvl8zgzOEsXRMMgd5XWoPQ4D9?=
 =?us-ascii?Q?FizoXqr3lcju9eFycTDC3E6K7sN27VbFzTGHxaIfS4WvCfAcaoRKgzr9Z2Se?=
 =?us-ascii?Q?nRsYUptDmn04QdZ9RcyURWxImNbXEZ+BpXIIhsyz5TXQrn8TSot8fua9Lmb+?=
 =?us-ascii?Q?uWAr11paylZDL0K7GYGWJ007+4eEIQovuOINftobAiWoS7KNH4JSw687raPh?=
 =?us-ascii?Q?+pRwp7Kj+gHsF7LH02UfySbVc0SWEQxUkXn5dltbbHwWkO14uApz7N7z76FK?=
 =?us-ascii?Q?VtDY3xYCi8v2TNVjx3xgV60TXe/ZxDZ7GppxQerx3rko2idU/suh59nM0Gl3?=
 =?us-ascii?Q?bkh3Xx2XSl7kGZJkgBKFfHG9p1FBDizVCnHJPzd3sTIoP5x8GOB+1gwY1B9N?=
 =?us-ascii?Q?PPtsfiF1OLObn9yGCOi9kEIr0h480gHjH3vJ+nKgeQh9pWVjJLJa9rAie1Xm?=
 =?us-ascii?Q?sw2jU2orFYjqCFl70Vvf6oSvRz/+bQYa/ChCWYlIdqEWWMmUqrcZs566mcBd?=
 =?us-ascii?Q?YlJHis5opP5+zNDyxcn8QgwQXkYfjeFwvYYF4ow31BXsC8wMZBBTBa1UrioX?=
 =?us-ascii?Q?j+7aNAaZEeRLDbvZ92VORZoiCHNGG/USofvf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M7l3XhiEIzq2Nsb5Mb9uwSR99PaSUKfHVc3LgX+qpqsD15L3wTFm+U5htMJA?=
 =?us-ascii?Q?HTiMG42+15DVHwcaYq0ssCwTUosEhDWIIZzKt0w6EQLyZtegh0Z5nusLYm6T?=
 =?us-ascii?Q?dn+PcsNMdpuppIizHzYela2dv6W28GAa9UnnS1eD3+meiqVnFst9zOjQMVS+?=
 =?us-ascii?Q?HlA5UxZ20b9s6q97R24XEuHlOBifK9VZT142MxD6PveLLWfDEtxOSCk7UOdE?=
 =?us-ascii?Q?vST4fpNgMBWSMuno98sY8/U2jtch4oYb6BPBQGaMx8mdZc+xkbC1W0Dm4moE?=
 =?us-ascii?Q?KMjFfMwuHZq/SaOQRsn7x5dpPLZMxGJfi1oZnfJb4gQH8hVqntaGIvUxY4CD?=
 =?us-ascii?Q?Zg/xtOhcSMP/luuL8nVCTRw7T4n7B6Ol6yPMp/Q4T07PpLAR+pELgbvqOWKg?=
 =?us-ascii?Q?DcSoW1z9u9bPjhaMwB9MNKD5SYf29ZCZ+vGf8R4Zmz+VtFAiYLeulwh0xONO?=
 =?us-ascii?Q?dr+M6xA+hjzsUaPtHJ8XA2il/4NGd7P3/T5k/jTVvdj3ifEXI+ZbdeWjKXfJ?=
 =?us-ascii?Q?TuzQ7LC3ZkPhtkzwqUzixWNK0qjxKLBuNA4haylEbGobj2/RlZNZAqy0p3bK?=
 =?us-ascii?Q?ehb5fkTaq+mne+Up4iBluqfTGpznRxzbv+hMUGEjOIQi+udmkLnGxBOf+O4S?=
 =?us-ascii?Q?wA0R3L5L2GB1n86uJ7RUtVo5l/hxBcml4A9tfstFXnxX0rMl5yio8kAC5jx/?=
 =?us-ascii?Q?RKb9UxxY3zu4rqGJJDwwGsGoZvzKHChUUulXYfpJkKOOEMqIUEx4sHqvVpTV?=
 =?us-ascii?Q?kvSZOMJGg4ALLr8B/WIkdE2xuQGniBVKVpnHXztrydef4AbqFkqZ5CeGyujs?=
 =?us-ascii?Q?4l6oxX15saLu4hCrtz0nz7pBtriLoI4XTggDyRbbp96R7ioetgjE1cdTaT3t?=
 =?us-ascii?Q?m05ojBJXKmdA30Su/wzTLx7+olg02wU13mG8QA38k82qktfAq0r8IzXoY5C0?=
 =?us-ascii?Q?CVSMuBt3gXvylNmlnoQ7zGe/ti0hwO4L5sQ+r3EkdS2mos8EE8WfFbIsID9P?=
 =?us-ascii?Q?9g8+NEd2AbMrY0xdONKj/vuccC3iGT+Ho8UzrFYGxMDYcVP3kaGQ+JNtQwcx?=
 =?us-ascii?Q?Of7rwFisosOe5iAVDVf8uewnYof8/HbHgH3HnkiTNCCgkc0PHkm/3Xm/v/NL?=
 =?us-ascii?Q?/ZfykrfNr5fgb1ilyQ4nyuXpWnQ84smeKc9KKmsg8jXP3Ia8yingTcgjUS5C?=
 =?us-ascii?Q?cEvnJkMDccf7NDakXeLpaoGohdchrZIXs9RyGkHK6IOm2ICqRH/yiTTHFwDl?=
 =?us-ascii?Q?bkmItmxu7Ud3q25UEJ3S3HdWO7nwCDz/LCJ2zo4CnekVa8WRpsAo1qLDPsmo?=
 =?us-ascii?Q?CiDcgcH7WR7kINt8CJPUJg8+By9qn84QdoUIKxiL7iBSvP8y3+fS9nEgtoyA?=
 =?us-ascii?Q?Dyy7K+yfJ5A5DUHXjTPf0Ydz/VLqy8v/9wtNBckBZb+LHADnxnG3ROyJW2ad?=
 =?us-ascii?Q?/T+Cs1Jzl/VwTGXjoDN5F6cOlCSDLtgw4TZjS4Vt40KkPAxLs1HBbOiDhF+q?=
 =?us-ascii?Q?Ik2/tNO7P3vBABaON6mbNaVaTR+EAx0rLfVPpH6cKqfNZjrLTL536ZgD3khx?=
 =?us-ascii?Q?EhvFZNuRkj3c1ZyLKYN7ES0XiyO/JkAlI4kjaKvg?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61c5f895-714c-49f6-a2d4-08de1ed1510f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 14:15:49.3587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5eJ0VdQlkHBqnqrJtt1TtLiDoe0RZJWLmy4bglp6WihTPsnNAtr5NK+pOyF6f167x5I07BR7TKKq/V+C7elkNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFD5EE188BF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDExNCBTYWx0ZWRfXw1ecYVFGhId7
 84CpwVKI6DWhrcQMUpat59EsBIE4ZUPSECUHkBmlG6EFTzFwEp0JWtuTaeBVjqZUH/+eZt9zB0L
 GUdpaxQIcIlN7kzjawamnPlJkMJBuPycevqmI1n/K8KKUMog/mT73A9Gxoe33kkzFIR/E0Nf67c
 /jQfww0v+iFDHD7KQjcx2Ik69SQERC+UnS5sfCdEB5R/WMAGo/15QieQUjcnVd0DurRP5g+oBTC
 vXYHnaJ06QvEdtJXzH6ewG68sETPkMUtZdaFwPaeTor6jbSI1N0GntvXZNqrfqJeVUPIHupTIAQ
 nWvk5o+FCapwSK4z5pgwoOFpEI/0pOY2vGqtHXpKiK5qMurYxy10QX7aapp9n0wlKVSprZFLj1V
 adfCGePaMQfROeXgQKe8LcESSH+eeQ==
X-Proofpoint-GUID: seyhtb32J1j3u117B0BOJeihEdD15r8_
X-Proofpoint-ORIG-GUID: seyhtb32J1j3u117B0BOJeihEdD15r8_
X-Authority-Analysis: v=2.4 cv=CMknnBrD c=1 sm=1 tr=0 ts=690f5097 cx=c_pps
 a=gBbgJzl4OEn/1oy4V0Rvig==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=TFVKWaS0DvIGfFj2vREA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511080114
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 14:16:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121384

Add UPSTREAM_CHECK_REGEX to check the correct latest stable verison.

Before the patch:
$ devtool latest-version libgtop
INFO: Current version: 2.41.3
INFO: Latest version:

After the patch:
$ devtool latest-version libgtop
INFO: Current version: 2.41.3
INFO: Latest version: 2.41.3

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-gnome/recipes-gnome/libgtop/libgtop_2.41.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.41.3.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.41.3.bb
index 5587baa0f7..e7b61a7b20 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.41.3.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.41.3.bb
@@ -9,4 +9,6 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SRC_URI[archive.sha256sum] = "775676df958e2ea2452f7568f28b2ea581063d312773dd5c0b7624c1b9b2da8c"
 
+UPSTREAM_CHECK_REGEX = "libgtop-(?P<pver>\d+(\.\d+)+).tar"
+
 DEPENDS = "glib-2.0 libxau"
-- 
2.34.1


