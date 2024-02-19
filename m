Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAA6C48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 10:50:50 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.139])
 by mx.groups.io with SMTP id smtpd.web11.38953.1708339846468973216
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 02:50:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector2 header.b=ksLScnKn;
 spf=pass (domain: witekio.com, ip: 40.107.21.139, mailfrom: hsimeliere@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjhCPim6XuntmRtYgA4HONecYPmC7TsRnNPL/A54cVds7hSyqHNZnLgRq5O7j3CKC+MGvkRxKatF8uYLrbrcQ0GE5C2mEYR9SPb7/JNZ141Y1jfX+V2+c8fZ8L1vvmdCwVX9huJRAa50yrpLp1V8DJXvZDSalDo1SrJ+/fsmVxwDWoKHNAzrb/Uc6xcKnIzvsJr8AOuZ1yH/ZC0ge8wIW9lMRE4cUn6N2Lw1IUtorHkI9GBEa0G/CtPoK4hj2FG6wudMA6GMWhz6ETnr/enp/bqNlWz43LcV3bQgPL71UC4Ig+QOG1g5Ex0e79bIKfuIx2R/vc/gTT9Lf6pdN/9vKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCu4tEFYMK38Sr89BtHuTjNwSNk7FpUwSGx7lklPgUY=;
 b=lO4GiJ53QbFB+hO0i1/rh4QBxoMiPBlSaEsJXufqpJ7icx8IQ/J42HIvATaMy2UHZOtzd1AOivQq7gL9Tm8YXNPUAtL2EhkpBheg2rVJdgKDD/QswSeKLK4sxXDnIZSI4icR7SWC8BSBP5l6X5B1sPvq8PoPxTcwneL+0lGEMZtgU4rnVWbWI9xawbQG6PaO0dMsXyBBgkXmsD3Kq9FLdG5J4YaSp3GsmkDwFU6HICq//SWpw3I52qGDBTS7cXLqDZgnvbo70jfRzq17uxG7RiV3lEKVfK8rbxZl1j0g1bn18vWkXfwxelIk+bKk6+kWNOccZnzAkAYZRhEm+BlD5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCu4tEFYMK38Sr89BtHuTjNwSNk7FpUwSGx7lklPgUY=;
 b=ksLScnKnj7RFXKwMX+smxNzI3OuiwgS+mG1Asr+BR3Qr39/hKMU1/k/oRskg2KT1LrdNwr4rWE1PxSaxJhmPHa2RE7pfSvq16H0RAMTZiIvewznMgseecJano3iJ4oi+r2AF7Ce6RnRs+S4ERJP+4vwE3Zi5BYZf9W7lq5Bcp5WDsbvq4WWlQ1oHWLZhaRfpVbxHTJ2sSFhKEwQmy422ss5T7dwsSqyZTGlMvIXZopNlIOLWNk1XbVE/xLpWh54cG+Ult5JnSmJ7ZzNXMHnZPcusuUi67SAzDkkG5yB94+C7VIXY8O/ZhYAgdnx9xIqtVxa9holFVItCZo70RkjiCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:48::10)
 by VI1P192MB2187.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:1cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.34; Mon, 19 Feb
 2024 10:50:41 +0000
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0ac:ede:a6e1:17e8]) by PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0ac:ede:a6e1:17e8%4]) with mapi id 15.20.7292.036; Mon, 19 Feb 2024
 10:50:41 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-devel@lists.openembedded.org
CC: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Subject: [meta-oe][dunfell][PATCH] libuv: fix CVE-2024-24806
Date: Mon, 19 Feb 2024 11:50:33 +0100
Message-ID: <20240219105033.7581-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::32) To PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:48::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3P192MB0714:EE_|VI1P192MB2187:EE_
X-MS-Office365-Filtering-Correlation-Id: acd21bce-024b-4fe6-c89e-08dc31389d80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4kYtZCTnSO7mGzFHB1kuigLFZM3ssUKIW9j44ndgN051V4u8BLfojMvIsfSPlQnKjtR3ktGqrSSamBqk9vvSOsbieEnrkj/CATbxZEvX4RWOf8dWXSuopeVXH2gQWxAUWzdcE5BO+FzmjJCnZr9BRhpVBWt7WNuyVQ0bDalvneHWzV5pnLhepfQOhBhETvCDcxZUrWAPZnG4J8h+XWG5K5IJzq+ennsiYx7Er7gd/1Fn0wAzU5FCc0cF0GPNSkZ+fAYQu1CFVigQxS92VQ/A5Hhj9whm8ABFKVGr5thlctP1Z7IHmvEtMDnba+f4qP/8/UrUr2XlCFzIHwRfR6nQ/dHDrF0+xGQQpBj1ssCmvKiW1D0odWQjv6WrI/VUQeqNIvZnPgmkgT41aIyhfasBl4dxwCqYuyFmR/fxCGrWYz5cMXwBHgn0txvy0FMxYz+jpSTN8X1ritdDZXDCodSIcPlzYgCCNvDFTMqBJHCayFg0Jh9vset912jAdcbS9BFRe0dbS40jw7uh5cmjPjMJkCYSfJ1EYO1P79L7qmQM/9Qvp7A6sML9VoQQSslZ2otnQI58923rIcBK7GuGp1864DW2odvlLfFL0Aj5QjxddX0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB0714.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4drE5lqqFN8dUSArIRcPus4nOKsOwsGcAvwEqHsLY2jIutfxMmKob6pP+SPW?=
 =?us-ascii?Q?mohcP8823agz2Lm8AT6cswdVEbx5ZatuNy3G5Cn9Dc6ySc/++kl+WiRXC5II?=
 =?us-ascii?Q?a9+bZRRu7OTSI9w1LIVkRkihwP6FQzQeWNRD8IGtPd0xucvLG73fRTa91pt5?=
 =?us-ascii?Q?DFQIPBkTSEHbjSm8F6/k+9/9It8l55xrUzAf25Cgl0bai0iK9ji61M0niPiE?=
 =?us-ascii?Q?0/rsCbkWhZfr7MEGjDYvd1SiTBVvoG7uozWn7mEwpT6AL/q5yioqo0ePNfXY?=
 =?us-ascii?Q?0rwx6uIRA84MvjagC7zEqfEfnrJAGrbZqoikRJqU/z/q07QsmkFGjOyLXnnn?=
 =?us-ascii?Q?ZezoUuELJTzmcyxR+b8vNMXAl0AlAIdx2Ddop6IJEzg7rkBEgViQObbjc2/7?=
 =?us-ascii?Q?OdnUFA3bvoeK+VEaZbKkEtC9H4rs7z62JJmgJhxyqUYSmyODEtx2RWTXpZ2w?=
 =?us-ascii?Q?CYj97C9opYsHgWhzjRE/uJFN4KVA63yugH0EUmLEMQeCN01bXxtzVzMpe0lg?=
 =?us-ascii?Q?lj0Gl2nND6zPRVOt3Mj2AvYh5d8A5Zzz9EHyC6RxmNqd0e9cQHLukaAdaYh2?=
 =?us-ascii?Q?xks/uBFO666BQEc8pjxkjIX+SgVj+r3gVEZq7n6YGRVgVAzdnF8NdxeRWntT?=
 =?us-ascii?Q?v9rNXgSMAZSZI60Wht9DkTtPOEmorC9fQ1tYaSBZ82HHzXOgDsUZ845x3EHv?=
 =?us-ascii?Q?IvV90MH8Uuw/TS1t3wPcZTR4vt8ppaii5RCedkNpYmCnwJYth/XKmBIKbG/B?=
 =?us-ascii?Q?KKfenkRXRyjzZyY8HpNSwl8oTpnlbF4OwuF/5LiLyzmO+Sf8y4nV9GFyXm/z?=
 =?us-ascii?Q?ktIp4or7GqEjrIBNpucEkZMPKW6eOgXZ5uQMOdSc/WL/G26Ph4HqxeP3u6xb?=
 =?us-ascii?Q?2Ti36s8ku8RHSBx5mHOcP04o1L3lvfZEAOCkmP9GaBqxcuQhC+0V45K1DwKV?=
 =?us-ascii?Q?qz+XcyesLbVdEwA8PICPmlMmIqIup8BQJ2hDr/SDeJBa2My0zkMX5NvmKR5R?=
 =?us-ascii?Q?TkZ6vS29HqQUw7CawuUlP8srSw1GPwkYhhrH/xXGQINV6YGxC1njoSl/7JzZ?=
 =?us-ascii?Q?YezX3I7aXcmurHSHbVrqysDOEhik+kTmw0wi8yLpfI3MMFf5Aro2a8VsQ09l?=
 =?us-ascii?Q?lUIPb/Qt0On+0j6OrLL09ticW1REvehNz59OMUgX80jDlRa0UASe6NOPrO77?=
 =?us-ascii?Q?mN3EPmp/a8kRZCA4mOi5jtWVJshcnJM11Q3gi7e7Ghs+00I0PNYyZtzgIE3/?=
 =?us-ascii?Q?PCmJQPMFAb6mvZiz9iBGz8JK+GyQea1+xvz/qTPKCnvBmHuyxEqUJvKUWegH?=
 =?us-ascii?Q?ZZlVUG491VUVCRYbtPn+QF5wBbV6cU5qJ9H3bziDTVxIixvuUte7uHIND9P3?=
 =?us-ascii?Q?zIw7DX0alPycYI4GZCBpeT52sHlzHLKn/m+sAO0EargsZpVoqWzeOdn/Px3t?=
 =?us-ascii?Q?MyRD8nos93Pq8Ie3BdOPnYvZoFNJOgXSL9RnNr4iXNPwD0NICxO/kyNukoDS?=
 =?us-ascii?Q?PNMLFD/wOXUct263fJ0NNJbWyrSIfAF+LBMXrASVZIx207ntKS4TImGqSfzj?=
 =?us-ascii?Q?oJQIq6Bju5Mgch/kN9DAms/rsWVgRDevzOS9udWV?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd21bce-024b-4fe6-c89e-08dc31389d80
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 10:50:41.1166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0KBSdGydaqa0X8m+KzrseGzwUU+IiNgQZyjqq2GsG3oHcPYwwCDVwkM9jwatpZ+8OVmpQcRI0TlhuGzIsiidCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P192MB2187
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 10:50:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108869

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Upstream-Status: Backport[https://github.com/libuv/libuv/commit/0f2d7e784a2=
56b54b2385043438848047bc2a629]
Upstream-Status: Backport[https://github.com/libuv/libuv/commit/3530bcc3035=
0d4a6ccf35d2f7b33e23292b9de70]>

Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../libuv/libuv/CVE-2024-24806-1.patch        | 32 +++++++++++++++++++
 .../libuv/libuv/CVE-2024-24806-2.patch        | 30 +++++++++++++++++
 .../libuv/libuv_1.36.0.bb                     |  4 ++-
 3 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/libuv/libuv/CVE-2024-24806=
-1.patch
 create mode 100644 meta-oe/recipes-connectivity/libuv/libuv/CVE-2024-24806=
-2.patch

diff --git a/meta-oe/recipes-connectivity/libuv/libuv/CVE-2024-24806-1.patc=
h b/meta-oe/recipes-connectivity/libuv/libuv/CVE-2024-24806-1.patch
new file mode 100644
index 000000000..426388c3b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libuv/libuv/CVE-2024-24806-1.patch
@@ -0,0 +1,32 @@
+From 40dad53252e82eb4ee6e0c000e0c9ab15c7af312 Mon Sep 17 00:00:00 2001
+From: Ben Noordhuis <info@bnoordhuis.nl>
+Date: Thu, 18 Jan 2024 14:51:40 +0100
+Subject: [PATCH] fix: always zero-terminate idna output
+
+CVE: CVE-2024-24806
+Upstream commit: 0f2d7e784a256b54b2385043438848047bc2a629
+
+Fixes: https://github.com/libuv/libuv/security/advisories/GHSA-f74f-cvh7-c=
6q6
+---
+ src/idna.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/idna.c b/src/idna.c
+index 13ffac6b..874f1caf 100644
+--- a/src/idna.c
++++ b/src/idna.c
+@@ -284,8 +284,9 @@ long uv__idna_toascii(const char* s, const char* se, c=
har* d, char* de) {
+       return rc;
+   }
+=20
+-  if (d < de)
+-    *d++ =3D '\0';
++  if (d >=3D de)
++    return UV_EINVAL;
+=20
++  *d++ =3D '\0';
+   return d - ds;  /* Number of bytes written. */
+ }
+--=20
+2.43.0
+
diff --git a/meta-oe/recipes-connectivity/libuv/libuv/CVE-2024-24806-2.patc=
h b/meta-oe/recipes-connectivity/libuv/libuv/CVE-2024-24806-2.patch
new file mode 100644
index 000000000..f231cf96b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libuv/libuv/CVE-2024-24806-2.patch
@@ -0,0 +1,30 @@
+From 6b8bce71f3ea435fcb286d49df1204c23ef3ea01 Mon Sep 17 00:00:00 2001
+From: Ben Noordhuis <info@bnoordhuis.nl>
+Date: Thu, 18 Jan 2024 14:52:38 +0100
+Subject: [PATCH] fix: reject zero-length idna inputs
+
+CVE: CVE-2024-24806
+Upstream commit: 3530bcc30350d4a6ccf35d2f7b33e23292b9de70
+
+Fixes: https://github.com/libuv/libuv/security/advisories/GHSA-f74f-cvh7-c=
6q6
+---
+ src/idna.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/idna.c b/src/idna.c
+index 874f1caf..97edf06c 100644
+--- a/src/idna.c
++++ b/src/idna.c
+@@ -254,6 +254,9 @@ long uv__idna_toascii(const char* s, const char* se, c=
har* d, char* de) {
+   char* ds;
+   int rc;
+=20
++  if (s =3D=3D se)
++    return UV_EINVAL;
++
+   ds =3D d;
+=20
+   for (si =3D s; si < se; /* empty */) {
+--=20
+2.43.0
+
diff --git a/meta-oe/recipes-connectivity/libuv/libuv_1.36.0.bb b/meta-oe/r=
ecipes-connectivity/libuv/libuv_1.36.0.bb
index 41e95f56a..da99b41fd 100644
--- a/meta-oe/recipes-connectivity/libuv/libuv_1.36.0.bb
+++ b/meta-oe/recipes-connectivity/libuv/libuv_1.36.0.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da68902a430e32200=
263d182d44924d47"
=20
 SRCREV =3D "533b738838ad8407032e14b6772b29ef9af63cfa"
 SRC_URI =3D "git://github.com/libuv/libuv;branch=3Dv1.x;protocol=3Dhttps \
-           file://CVE-2020-8252.patch"
+           file://CVE-2020-8252.patch \
+           file://CVE-2024-24806-1.patch \
+           file://CVE-2024-24806-2.patch"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.25.1


