Return-Path: <tugrul.kukul@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E58A9C531CB
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 11:24:48 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21262.1784805883250922186
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2026 04:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=PP2jrbtS;
 spf=pass (domain: est.tech, ip: 52.101.69.53, mailfrom: tugrul.kukul@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JED0ENH5fa/r8BoSPNPQUmS7u5gKS8s1x2eNr9zAO76HDMHNIWCBvBR9b9dZ4nVBPYrA//jp1QRFkvfbOOrJhwQPEdbz2RwNsTt01TK3iClYYrleODRrwyMnA2yt8pNzB2Ki8EiVh4GaXJXLfkLK9B+xi4FQz9uKhxHhmpM1oYL730/PimcV9yMngq3VMc/cAhYsWnO9zFCs6wJQ2gFJ0aVdjSF5wT7u5VOko/S2ZARAbLgtqp7NNv2xUkYfUySrgxVUptz+9wm1zbqcvfW72uqsITCOj7/QHIaKoCjM8LxGzeBkcG1z246iAOMH+68WG4gy73P3rThMjdmbG2cOOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLbT6UzGaOwpUgwbyuJ1RYEEonCX15penP9rV+7dGU0=;
 b=Mw6oZLixEIumWWF1J/4hKP5YpHhEr3nZMK+adAjBzxLPwbzXKXhhBuv0PhHHNXSpuuhFgtRavW/uOVpsO/GdKmfnVYyy/XavYX1jQ6iU72poj4zawVmPGFrwCPgJAnQLaBJQCyz68IR1bBEnO2PAMuyppQP/74H1kZBDdSVSE+0SszM02ybo2CV3+tqIjKnrUy7lMX5jSsXEZv9K2yCv2MlXgGQm2HttWe7WKrsd3TQ48gTM7cqog2bRWVhCf5qLFs84HtWqs6d4UnUI2mlxdD3aLv4EyhUtf0qm1dnsnGjDaktVbkBucvmub1t7jTijJO01XiqxS18d8iIdjTAxjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLbT6UzGaOwpUgwbyuJ1RYEEonCX15penP9rV+7dGU0=;
 b=PP2jrbtSZfmCBsWwRdvJH+qFaXtmIqmo//eZIcMXxGQfxy9wQfDo1MnraV5s1KWMvVLNNVyqNAeVi4B4gfA/qub7Vq0gjiQnBrNnOgZ+m5jhL+MMqs42LyAkhGcjR0Rv+7fDjKSQn2gxkB3oKS0E7l4ZKubSFGapRQTDmblmYf7yGvLedG5zmalhnqQV6Nd6EMecTvceynBUjYovOQAlueI7SU85rx/KOseNwc1IGdR5e4wmjPK/c5wwefkTfKc3xXw1H3b7qDWZK0hbT/ShxAWi1++MH7Vx1vX2KN3uyeUTW9StFAUPjxUs1jyq+tXTRyvscztfgfYyOfRgKPJEzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB8P189MB0966.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:16b::8) by
 PA1P189MB3390.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4fa::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5; Thu, 23 Jul 2026 11:24:38 +0000
Received: from DB8P189MB0966.EURP189.PROD.OUTLOOK.COM
 ([fe80::48c:33b2:d870:d0ca]) by DB8P189MB0966.EURP189.PROD.OUTLOOK.COM
 ([fe80::48c:33b2:d870:d0ca%6]) with mapi id 15.21.0270.004; Thu, 23 Jul 2026
 11:24:38 +0000
From: tugrul.kukul@est.tech
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH] jq: fix infinite loop in CVE-2026-47770 backport
Date: Thu, 23 Jul 2026 13:24:36 +0200
Message-ID: <20260723112436.73974-1-tugrul.kukul@est.tech>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0036.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::7) To DB8P189MB0966.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:16b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8P189MB0966:EE_|PA1P189MB3390:EE_
X-MS-Office365-Filtering-Correlation-Id: f3e0c381-08c5-4177-eb3d-08dee8acfb40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|11063799006|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	WvT0eqsR5Lo9M9rx8RiDLsf2Z/EFM43n2rS533okhwMY/eP0dsaH3EUoPPwDy8NZtfYsSM3zTVMQo5Su0TFZMDTAswYLknkqHZol06H8tWEPPP+HvVA+WfWEEgja8Kl9qkCd/dDYlqsCvmG3aa5m//T0+6nExyUiY1CS0w1BrdyxNPBGMsTU/kxOw5+yihFN5X4m8jJ1mAbTpOb3bUqZqqrp6jSkgy6Q/kDTRnSOFMCUjs0PrLUyaos4+SFPQobwlldF22ju03T5tHXmr9GBGqpVE/bLAmX0sD1QbjOg89nZXK/mFa+uwmOjEvUBD5q5Rm66lnNL7KIuvVTbcbDMmfhRRfJrKkdhteka5wJK2DogVxOx56JD6JNEdL3BbP79zuwZIJMUZfZDqV58rYjRd8wuCCU5NKhm2ZsWiqRg4WPlbdxqMd9m3Co3fYjaDAicYYi7YwOzIqz6kSjSLzGZKNLFZHGDgZ7OQXqup06l0kbCnhAcN9wd4SZXcwzUAK2yhXZpXSW1GeGwuFVIe+esht5Nc0TFuWDnSBSIcK7fjl7eVdexw/neRRkPA9g0FdR8A0CA+PS/iNw1rxXvN+YH+CwpdZ/XKXIM3fJFrVcMNWUGtE2nxW6ssxMpDoI61QyGccQhII6PyiOpVqg2hg78t0FDhUQ3UFo3zDvN+kE4T7s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P189MB0966.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(11063799006)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aX8qOWPPddefgEwHxw+/yP0Y4Ubbg2MniAXvyXCVZws3NY0qVeagR9IH21/Y?=
 =?us-ascii?Q?0vE2X/uAsNzAZgg1HMjfnEEglTgbTGg0W22P8YwxgFDzXS662eLlcxKGthgW?=
 =?us-ascii?Q?JbjqEKGzF15FWHV/w3AjOfgAQhzC4KfzqKf+Ctw901fAteC+hU/X0KWAwKm3?=
 =?us-ascii?Q?CmJla4WUBIesVSRx2o3l/lTteAc+JhQzKF4Cqzf7vC9GuFcsyZUjKrHrGAfQ?=
 =?us-ascii?Q?NVWr9UoCmmD3Z1U8iTYsrBfRGi0IPytGw1zcCEBsKTX3BQMj7G67TaPZYROD?=
 =?us-ascii?Q?tc3YtoJXkHExeGqJ3b/aLYbFnv4OJ2h8nfOvF9bXmqyy5cynm9RypoAFO908?=
 =?us-ascii?Q?ajBCbW0FeDBuXp1oF5h9vnjNduZdktaOcKBNar9kM42nK3B3Tp5Qx2RzFwve?=
 =?us-ascii?Q?OKxl6SBD9Lz3VzgktJgo4lEaEv5O5RdzV4e6ueWPmkNWs1rDWqa0nhmX/ktT?=
 =?us-ascii?Q?IvWD5RnnkM67JJ6rxIfDAgM4IG7fpDMgRH5pUSAF8b+zJBD3odsmdPfk+woK?=
 =?us-ascii?Q?8I5x/+1O7nBY7uSV23ZC+CxFotGaw5+7628Eq/OQt2QCDUikU0ICALZ3Ln/d?=
 =?us-ascii?Q?TTjjFm+sbA3qeYvbGrvg2IaVbm+Tu7P/XnCo8Hvid8+R7TpGb5QvAsVlGqbN?=
 =?us-ascii?Q?PN1su8sOfn8I9d2W5CLlEntABszRjxW4L5G0BA/SlLSFK7z5FWFH4clXsT4K?=
 =?us-ascii?Q?r3F04GswQxeQ0FESg6FHuCpAvL2Hy7mXPO5HMTGX2Jds800jj2E7YaWQBxDA?=
 =?us-ascii?Q?Kc5XFcNlRCi5rrYOv5FzHPMkL26kLFOoOi0ZBdfu2GlByVloyc+T1425Kk7i?=
 =?us-ascii?Q?3vuMnk9e+64WFiIWQ+I1F901wHp8QyWuisGtsPePX8zGk0bPXngXIR+jUi91?=
 =?us-ascii?Q?0tByGXy1zPrk733qT2B6+sC3b2PZxAeWQLnxCefHA1D6DjpZk52tJlSvxEiZ?=
 =?us-ascii?Q?kljHEGqkBqc7EEnx8fPkgz7vLbN2VFmnMxGx1RAuaVoV5brB8UJv1QCUWOl8?=
 =?us-ascii?Q?QAynkuK0xNjJ8VcxxLxmC0gxm3SqqIbMUBw3dTXFvPgSBrlCV3aNRV1JAM0x?=
 =?us-ascii?Q?whehR6rINL40tq5qMK876FYFZMPmzVZDneRSMIHjSxYjgoi4v7IpQ3i5X1OR?=
 =?us-ascii?Q?GWM/nPM/xSN2KlvdFh9H0Xz23hg0P+zfMQoqrSVtSI1twWSsefexoy1768Iz?=
 =?us-ascii?Q?KfPjZ0ol9yZYjSUlbdeYhGQfYD9sTAKrkRFjNvjXLFwdoixwdFbaWezroKRg?=
 =?us-ascii?Q?HXqp3PFfyvhDSS7gxBQtsTMPYYE8ZeANIc5qgLgqPhBiW4JlWGTVKKWnhLRv?=
 =?us-ascii?Q?e0x8AFfRiWdpfxBpKoXcf0KMT5ZRdZiDqQQ/XAwOx9Czw1SlQL54a66eoc3E?=
 =?us-ascii?Q?tMqvw5tYWOEkG1Qpp3c/MgDLl/QtDXtQNWbi+S5B5Wry/at/Uss5jhQk6Yhq?=
 =?us-ascii?Q?nhMUtUcm+RXpT0FK3nqhG4En9fKC2bQxv7rZ6gjzBVPN8+UqDelgr49AqKvl?=
 =?us-ascii?Q?ZYLUpsilQAavlYHsWnEb61noRZkM+O2M1psporCRVNy3QQbvoXJaW8oIFnr6?=
 =?us-ascii?Q?bXJGwfRmFwxban0vIwBU5x6Q58pQbVg8D001+JOW2s4q+kqyFbIWTmKWEEY6?=
 =?us-ascii?Q?Equ5bJIWm1CICN/FTOIWM5iPDlgTYwwzoSx0qB14Gl54BIDGz0JsgdHfVkcn?=
 =?us-ascii?Q?GYO16u9wiCYW+2oSMPQqhG4V5OO8GP+lFM7OLT4NuPU0+ehJqlvTY4P524yq?=
 =?us-ascii?Q?5ZQFRgy+sA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e0c381-08c5-4177-eb3d-08dee8acfb40
X-MS-Exchange-CrossTenant-AuthSource: DB8P189MB0966.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 11:24:38.1462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIrvBz3ePK2TvLXgKReFiAYc2aKnGExXoVkDB5KsEvFfRrCx4NbG7p/dhjN7nmeZLPoDg5s3FaRUD3FaBmdxsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3390
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2026 11:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128418

From: Tugrul Kukul <tugrul.kukul@est.tech>

The backport dropped the "j++" body of the delpaths_sorted() grouping
loop while adding the "=3D=3D 1" guard, turning "while (...) j++;" into an
empty-bodied "while (...);". The index never advances, so any update
that produces "empty" (which reaches _modify() -> delpaths()) hangs,
e.g. "map_values(. // empty)" and ".a |=3D empty". This also hangs the jq
ptest suite.

Restore the "j++" body while keeping the "=3D=3D 1" guard.

Assisted-by: kiro:claude-opus-4.8
Signed-off-by: Tugrul Kukul <tugrul.kukul@est.tech>
---
 meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2026-47770.patch
index 1d6664e842..9865de86cb 100644
--- a/meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch
@@ -13,6 +13,7 @@ Fixes CVE-2026-47770.
=20
 Signed-off-by: Anton Skorup <antonsk@axis.com>
 Upstream-Status: Backport [https://github.com/jqlang/jq/commit/71228668699=
60b55cea3646bc91334ef55787831]
+Signed-off-by: Tugrul Kukul <tugrul.kukul@est.tech>
 ---
  src/builtin.c |  36 +++++++++++++++--
  src/jv.c      |  46 +++++++++++++++++-----
@@ -237,13 +238,14 @@ index 594a21f..a39f1f1 100644
  static jv parse_slice(jv j, jv slice, int* pstart, int* pend) {
    // Array slices
    jv start_jv =3D jv_object_get(jv_copy(slice), jv_string("start"));
-@@ -471,8 +489,7 @@ static jv delpaths_sorted(jv object, jv paths, int sta=
rt) {
+@@ -471,8 +489,8 @@ static jv delpaths_sorted(jv object, jv paths, int sta=
rt) {
      int delkey =3D jv_array_length(jv_array_get(jv_copy(paths), i)) =3D=
=3D start + 1;
      jv key =3D jv_array_get(jv_array_get(jv_copy(paths), i), start);
      while (j < jv_array_length(jv_copy(paths)) &&
 -           jv_equal(jv_copy(key), jv_array_get(jv_array_get(jv_copy(paths=
), j), start)))
 -      j++;
-+           jv_equal(jv_copy(key), jv_array_get(jv_array_get(jv_copy(paths=
), j), start)) =3D=3D 1);
++           jv_equal(jv_copy(key), jv_array_get(jv_array_get(jv_copy(paths=
), j), start)) =3D=3D 1)
++      j++;
      // if i <=3D entry < j, then entry starts with key
      if (delkey) {
        // deleting this entire key, we don't care about any more specific =
deletions
--=20
2.34.1


