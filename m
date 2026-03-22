Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9E2FC72C9
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 15:06:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32048.1774191980670914015
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Mar 2026 08:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Lpwmfl+w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7541320468=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MEoKWY1580173
	for <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 15:06:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=rTdrs5gxih2mbGE9rn/O
	eLVVP7MV6avXAznsrJlJvxA=; b=Lpwmfl+wXQh7jwPh6bdDPz5/CaImPpHT5+QW
	ZDgMaY3pknTu6D4C/apQkVl9yX3R/FoVG8IrV4q4qkW+jTQsmiDALVsPKrIbbvy/
	Qg5cetXc+adf/38xJ9M3izT+eHJzx58ASRtFwWiWEt/prHt9NDL0os6ZzoeIOaUt
	m39UX3FCYP8IdYDokIkwrYvAiW6Zan0fiYUoXxoXaGVCSP8uoEEVHaJx1W12CYbL
	Ed5EnCaAJUFL2psar++Cj/FR423NpVIIyvFNMFMyceLRKF+ZUp3Lsa/7aOzLOZaH
	57lQToiRvEcwHpIHPKlWuNlax8lfkpDDG1SiMk6YlT7JEH9tyA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013028.outbound.protection.outlook.com [40.93.201.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1gj813a6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 15:06:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRMhNRyFradvfLRKz5j2KCNorKh7MkVDQiT4EY2Zo51Ty4Y0XploeQ16VX3C62vgByXtzG8Uzd3CL3Pbq6OXZdHe3f6zbva84QvraeubH3+E2Ze5cag73Fxd8lrSUj700Kk2XXuu5O6mzEyCMRH8oJKtjpR5uyQjfzedSHb4qA3F4F7gSsxLaT4ZkrNN0uRTyPeR7wFhklR8Zdq5utjBFvXFike65oGr5lIiMcyoU+7OXWF0lsu3eHioGjrBl8H1/NhCSxdgu3Z3fA2cgH3gdCudPC+bbHuX9MRAqTMWv1mqF/ML38iIEHDLmJebn3m1B2WjsHfPp7qK7Nw7Awmayw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTdrs5gxih2mbGE9rn/OeLVVP7MV6avXAznsrJlJvxA=;
 b=BURzxsEf/jhMLGT+7e5Tqc56QgBigX9Gicy/O7Z4YYGOACPYDyKh4Gm1cMyYIVsI7kY1wXTJ3vqkO7gCA1OenC2HzzXZawkVEZ9lipe1V/oxTITkx84mpYZh0Ze12BDrifxHhTZ7KRmDhkAi4vAXiAAQg78PRl9+1BSHjrCnoczuMP83raWeliUoyBjOYnVujmwZkWH+5E/5QYP0Kz24klAzy92h85f9gGX+9Lc2YMNcG39S2ev4aeiIQYtZPgsnADhcW80NdlwrgGJVYWtmsY2b/x2JPTm2okimxv91Kwn1Fg58B+qaTkVpidWO/RfASQLVKPv6LCc/xwZUFkFWbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ5PPF8225D2149.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::83a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.10; Sun, 22 Mar
 2026 15:06:16 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9745.012; Sun, 22 Mar 2026
 15:06:16 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] cmocka: upgrade 1.1.8 -> 2.0.2
Date: Sun, 22 Mar 2026 23:05:52 +0800
Message-Id: <20260322150553.2261687-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0140.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c8::16) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ5PPF8225D2149:EE_
X-MS-Office365-Filtering-Correlation-Id: caac2450-8fdf-4f91-a10e-08de8824908f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	uBOgtWv0CTDzJTwqDnqj8g31kCCIMw3hkXBPAyMH3799iHG4jX0cciUysshUx9ly89ScqC66rLzMe1FHpf1oAErTpeB4jqWvNDMf7KlL5crP12pGL0kyBUW6rIpJ3L3aKOGis95KWRkibhKKZ4gN61x4F7BR1tjZwkfHYQoEi8jMNLYJIG4SyV8u8NfXJfCuKBafJW/BswghaB+ShQdSLwA5JL5z9knb6skpeq000L+GWpptvZLQxGW5GefVQruX+h4ZmWuU3avTGSBdXebp31m7UX2M0vCKFpOevK22+wePr32YUq9lC+8lpEBkEQ8QTrMXYo2yaICmexG+9+gMvDQnUhFzEV4Y6T0h6itd/yA5m+2eE+5GF/iBQ2sD4of9BrAMws55V8eB11HbRsMSqYxC3KzWyeQKTtvjN42R3IXNE4Rk0LpvoyZCWAseZ/2XP6/dlxBiQB6RbUTh4MgfQkHfCksr3jwrqC730YzvKAjpMhq0NQwl277ofNcf3WATvAsM9Oq4EcndC+5QQBcWEe49JBvllZLuJLCCly3Ct/ku19cEqAYO8czrUFImCLWUSEnvyYdWZVNdHSKI8cV0YTQgwBAU3T5mP+Dc4qEFytMIhnUucwUZJVCfHOtVpEksTV84YxZFbng9YXKInO9K/dJvRWLTUxTmF6bAbiRDLkUkbug7ehd8m3x8EYLEViuDo1azvF7xXX5JYHmTyKlsBxoaC3E07d2Np4ALgDC9bag=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4T2D4ZDXEw7cayWhE5341XbY7Z7JMFcGr0bX8U2iPQDwcRC/740CyTi566hh?=
 =?us-ascii?Q?sbEc35XSsr/Ko7b6xSQjf32YgMSDX/UpAPYUuXbybkkI9jfxWrUuCFHT4iOF?=
 =?us-ascii?Q?TwBi9E4DABvJ6/TdJfEeoeqGMmRYtclPVv1AukJzBFL3AyNhKLPZ+MV2xd3o?=
 =?us-ascii?Q?+pwkv/xxXPqSkHJNMPNqCe3IwmRjzwmNDR4wk6Nxt5D+dQ7xxsosnpEibdQr?=
 =?us-ascii?Q?7k1fBaPihSh8JqKFQFIJZsGgDMCZWKpfG3gVNYmtMUfhJs74yCOzTUPO/rbk?=
 =?us-ascii?Q?Vco+ap9we4SDX8YPz+X25ejS8VBOVDjBLrrGZTTJLWI6ntNumac7OGN+7ghy?=
 =?us-ascii?Q?ArDedALMckDt5C8d3aqWELE1qZPnnuqeRuq3ij4BmqaPMZF89vdfzcXnaTKv?=
 =?us-ascii?Q?lp0KdBlZR67pKcETnmR8QclZ8rpE6+gJIeF5vJ/BNNeqFGFVl+1qCq1yGPoG?=
 =?us-ascii?Q?AxnAzWa8gbrBPyuuHtWsvmZDMaST1OsykMIoLANNsen5saYEzpdUDeeK0L98?=
 =?us-ascii?Q?A8kF5HRlgXUctGLEJa2oF79aziJDa2su6cTtPB3bnrDwtN2Dls5H/qi1uRq+?=
 =?us-ascii?Q?MOEqtfSEAAPHippGanCWwmytXazBk5ZVEnqCxdDp0sffwJQ/zLFNTzGghUcC?=
 =?us-ascii?Q?+5jD3hRpLbSr/fKE0F860xEENPeyp33hTkL2Ek+VOj6hiMGrtSLG1a5kKohD?=
 =?us-ascii?Q?ZJEFDrMoLNe0U6xYOyXSWH2XC9WsMNQ0ZWKQ8xOI5KuFrfcxFmd02KDh/fYw?=
 =?us-ascii?Q?wwxhg/HFF7Lye1t9EbCalh8HtcTtdTUB0VZpTbG9/XWjU/5xNo4bIGD4koHy?=
 =?us-ascii?Q?Rt6Zcv2uPYfqppBgt3SfWCzqJhH93ngTPvwMz5jFwYUkN2jKxYRTzeTScjKb?=
 =?us-ascii?Q?oQZZc7aVycXUUKwpukHGPy4cZiRufyBh3MQBM9ZQbe7vSMJcgMNpcDfNPjIz?=
 =?us-ascii?Q?zigSTwj+eP2BmkpRS+Ual5SNdEjIG1wkvA3+BxVA+BSl5QZODVBzf6mVbyrx?=
 =?us-ascii?Q?3AFDlDQb/jPz/oQfVwkfKrEHvmuVKWwGWg/DWKJhiomV2JU0uW/adNSqhT0m?=
 =?us-ascii?Q?pEp59Vv0oL/RLsAvjqJooNhtEDkX58CwVDPRC+quo9VGsZU3CW90PIsXfQke?=
 =?us-ascii?Q?/4LZv5uZjNwd7F/jeVBzY3JABGV4LQrgz0KO3TnQH0D3HZk7ZYiBSglRsfAJ?=
 =?us-ascii?Q?VaeyA6s5G5k4jr1YXgKr6E4RRKS/syzqSPCvKwgoL5GcY1zkCMp5inCBdVaX?=
 =?us-ascii?Q?O5sgcHIo4l0O8z4oe+EHAmA4OfHIM0AUZrwVMxWkK2F3wOS0SGYx8adShZRW?=
 =?us-ascii?Q?HtOOgoJRo4FcCQGBsBJdD1FIq95fuYpLil21CfGqnIMJjdAdMbjr6aVWx2rF?=
 =?us-ascii?Q?8kDTmJMIpLk85rM27u5BmU9fPcbc7tXLbtUUpQWVSGYveh4y3HO8m9jhh+A4?=
 =?us-ascii?Q?sSsiQnqWtAHl32Bwh/aoheUjC6LQEN4DzjNitudLl1h53fjJxPWfAVbO0wpW?=
 =?us-ascii?Q?fv9nfrZvBeuD+5jM/lPZRO0UE4A6AFTmy144/G9hgAA7/T+1xcLf++133usI?=
 =?us-ascii?Q?9n1+z1avau/Zon3VQgmVpqdl/Ll0W7L85KR6bIXvGbCY31PNQjtQXWXDbEP+?=
 =?us-ascii?Q?yMv+L/41phvKPZHPsiGqAZJ5Reak3/atzqMkR3eNmabnelX5jBhIwZxCL/Ts?=
 =?us-ascii?Q?+1eSlj22ZxKSFj/AbbrO+7f1lZ4t3vNzBFY+un533Gep7hEMnYiVvWHGdnso?=
 =?us-ascii?Q?Vk38qgRo6w=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	XGmgcuRFMPPIZyjmli6Ll3BiQgYyPnxub9tbIHJUkThGLCK6QVrypTLV5jr0IowUdtcTfVtOYTuxFnOqf+EZoIkJczx5hXL99IBkwWTydT9ACh2XwjrYAfXUwrZOCKuOcPCgL/DchVuyF7haS0V/qvOB/AinIJc4k2oesTcnaKauiLEnfK8bxMtYBOaU/j2uTYODMb9R39MJ/lINuzCQejuPWa1C8Tz01SCU9o5BeBkmJEkAOCerOxci9usuABrFb9/codF44ZTUdOiORtp2lyuUPef1BNXr2z5rwyD4LduS443uzmkwzDWksDkLaYA6i6QWbG/cBwEG0QHbm/gD9w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caac2450-8fdf-4f91-a10e-08de8824908f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2026 15:06:16.0710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4xRles0ULvhq2mrYekILkHBPxfMf5dBto7Qn0fM+HAdr/dqotvEk8qeyOE1toc2JfPVRUuVWsNPSoZVCvDtcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8225D2149
X-Proofpoint-ORIG-GUID: LiRsFJ7No99XB1jZ9b30-cs7-xMrVYIr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIyMDEzMSBTYWx0ZWRfXxKU6jtGTb47r
 tVhuEe5XWyCdQF/6tl7kqjGYzDQqYq5348YJ6XDU98AZRjJf0BBC6QfZEodP4hzHT4bcMDRChhV
 yebeiEGJbQuD1p8ez7csPh6+J78j5mNtxeercRshsOq3KUxPSgk5Vd0vZ0W9dUi/HU9BXOFg/kI
 VmR9eJ7UbZ/L0L6yeloDD8Gh4Qrv8MmaMvO4EiFrRIvPGscLlVxuFnPzuGhGSBt0eYrWunIyab0
 +UfhgsjWseKYshaDk9E4zjr3rTf+BpE9Tql8cMbF1tyDo6bnFohYmbgEBEX0R68tW0J8Bgy4EKH
 oDCyD355PyuMbaWJKB6lV+r5JCo+gZ9xw2mSv9RD/rvsu1VqapDfaTa5veknQQJqKqC/MfksyMQ
 gYY9fHQFodeiJ6E0mnSrelhqbyWgXu5t1jUL57ukXmeU47DRoq6HyQRh+u7hYxNFAn2+28wZZqU
 By8Nz4OdTLyBX/gquFw==
X-Authority-Analysis: v=2.4 cv=LtqfC3dc c=1 sm=1 tr=0 ts=69c0056b cx=c_pps
 a=6NHOJSrb2DrgGhcKreW8mw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=p0WdMEafAAAA:8
 a=OWqaEUjHAAAA:8 a=t7CeM3EgAAAA:8 a=_9gtbkrcAAAA:8 a=uM6TQC4aY_HE4G22n7gA:9
 a=BffUIevxNqKmbQaS3xYn:22 a=FdTzh2GWekK77mhwV6Dw:22 a=mzAfeOUevkGYtpgvwSZb:22
X-Proofpoint-GUID: LiRsFJ7No99XB1jZ9b30-cs7-xMrVYIr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603220131
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 15:06:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125484

License-Update: Rename COPYING to LICENSE, no text content changed.

ChangeLog:
https://gitlab.com/cmocka/cmocka/-/blob/cmocka-2.0.2/CHANGELOG.md

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../cmocka/{cmocka_1.1.8.bb => cmocka_2.0.2.bb}            | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-test/cmocka/{cmocka_1.1.8.bb => cmocka_2.0.2.bb} (90%)

diff --git a/meta-oe/recipes-test/cmocka/cmocka_1.1.8.bb b/meta-oe/recipes-test/cmocka/cmocka_2.0.2.bb
similarity index 90%
rename from meta-oe/recipes-test/cmocka/cmocka_1.1.8.bb
rename to meta-oe/recipes-test/cmocka/cmocka_2.0.2.bb
index f7e8b96ffb..11e8db87d8 100644
--- a/meta-oe/recipes-test/cmocka/cmocka_1.1.8.bb
+++ b/meta-oe/recipes-test/cmocka/cmocka_2.0.2.bb
@@ -4,13 +4,14 @@ platforms (including embedded) and with different compilers."
 HOMEPAGE = "https://cmocka.org/"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "eba4d6ffca53b500ab8dfabc30256bb6c3088b2b"
-SRC_URI = "git://git.cryptomilk.org/projects/cmocka.git;protocol=https;branch=stable-1.1;tag=cmocka-${PV} \
+SRCREV = "fefa2b8a023121f7235e18ed17249e4012dd144f"
+SRC_URI = "git://git.cryptomilk.org/projects/cmocka.git;protocol=https;branch=stable-2.0;tag=cmocka-${PV} \
            file://run-ptest \
           "
 
+
 inherit cmake ptest
 
 EXTRA_OECMAKE += "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCMAKE_BUILD_TYPE=Debug -DUNIT_TESTING=ON', '', d)}"
-- 
2.34.1


