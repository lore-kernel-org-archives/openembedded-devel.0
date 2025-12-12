Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89C9D59F44
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 21:03:43 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14830.1765552520396890372
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 07:15:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=J9uwEn6X;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.28, mailfrom: divyanshu.rathore@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHQ562zcgO5DDE8hyWQX4JPOo48dUaMgFiVVZn5koKQq8Ajb/iTyY8HQ4ZyLAeIgzHBzDyn5UsQm3M3PVOGMzBJAmBNFsy6FBeQ98knB/4cG7upH382Fg8oBsoOnpkf00D4d3QB74twdy7BjUlPRpVRBMp+RLZ0mdELXdpD7T1TeJvV55VuKn+Dn6UF/6K8nRpD5qbl19dFW0dFbfJZFTrcNhmJx26a9x3cXdiRRDKn83ftKpu53mgSTJ3XP1WrD3halXdvIwpN0E+dVn7SbR9il+9iH14iD7uRyZ1Pru0POPC0bmZwWhCeiuF4iYrXSNVGWnUdqUMjXM25aERPlcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pa1yu0KtS6F+sjDDM/iT474TwNusJzzgHZtDLe0kjhI=;
 b=xdiBUVAO2f3omtZXQJgjB8uwlPR9Z0G2w93o3Wc3rIlBFHzIO+aPRHXn4eSe2J5CHY319LC3XY0xQQVzahs8m/BJBeWZptk43ZeWC9htTKjKW+IlpsKOAI/i4hBX8hkFNWdqB7DEkCL9oDkczX/gvTqnIhCAUP4ln1LP7zkAv+ZudmKeOOddbHN6qtdvYgSAiZ16Q+aBgiMd454SX9gwPnAxDYU960PaRDGoy4dZUk/HjZ13vZvRR9GUBvPjAISx+1DszHfgtCxUL9jqj7d7Hh1xulThn7bmzmUoCB5hMChVMyFnAT3S4i6mAYFmDhkEXG124eR907dEUw/aBhBRcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pa1yu0KtS6F+sjDDM/iT474TwNusJzzgHZtDLe0kjhI=;
 b=J9uwEn6X5FknE3hteG8adgpoZ/MR3KPY6JMI8HTDHLsGpaW34nKBXEv/2+ufOuaRMLjxzkQ7/u6MQsG0F/T8Ih1YHdbVaNgwupgmKmrYAuY7UYLDtRZrarVn/RwcRaRsgg8jXR8haG3Ls5QxwwUzYChf1kVjUjIyLm4jIzze3t6lpeD+BPxM4iWBi8YFSBf2GlHqoIJfCbUWKJJAmosPTtoidqZeB9DVu36ECK1eLFvYN2zqn41Ydc0Ck9L4Y1HQERG10Kgd9XXKjN0sI7/F+NizNaOyYJxa8Sa94UPLk7LwCdHAHQJzlNbzrA30DZiDbTw9BbxIPiCuCnJPep9iZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:143::11)
 by PN4P287MB4723.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2c6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 14:59:58 +0000
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483]) by MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 14:59:58 +0000
From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Divyanshu.Rathore@bmwtechworks.in
Subject: [meta-oe][kirkstone][PATCH v2 02/11] ImageMagick: Fix CVE-2025-53101
Date: Fri, 12 Dec 2025 20:29:38 +0530
Message-ID: <20251212145947.7434-2-Divyanshu.Rathore@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212145947.7434-1-Divyanshu.Rathore@bmwtechworks.in>
References: <20251212145947.7434-1-Divyanshu.Rathore@bmwtechworks.in>
X-ClientProxiedBy: PN0PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::14) To MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:143::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3378:EE_|PN4P287MB4723:EE_
X-MS-Office365-Filtering-Correlation-Id: 49527f3d-48ef-4e06-07f7-08de398f1e5b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?loM1WDFwS1pDJJGkcMt7EVnWY8VsGptpBP76T1eJNGP440fw1muUEkMlM4B6?=
 =?us-ascii?Q?ReqjeZUAF6WqO/xSpO0mPt8AOU0vqIguoD+JrrxQV8Chzt5JpmplM/MZE5VD?=
 =?us-ascii?Q?YMsm+RWjKsVj0Do+wZl+CJ0LgURm+7Ab1Fy040+hYidfP/JwbI+VHyU+rmxz?=
 =?us-ascii?Q?KHEPFPamh8xGJLt5LHrmFDSg4pNHJz8gTSWEf8NSjaz5idoWfEOrrxgKKjAV?=
 =?us-ascii?Q?VYtaCchMSJhwrzbBjNEZ1x2ZkE1DPuFkYt3QN06QNq3QkJH6LQu+GxmAoGjE?=
 =?us-ascii?Q?r+RO/cnYfiZv+/fK9hKHZ8eFTF1b3cm+zv0+guYKW0X0/f761lgUYQ1WGGnX?=
 =?us-ascii?Q?PNio0yOz+KBjBGUiZG8IfG18dezqFfZ5aXhRXFSvwPV+GS9qJh3wqZ0rbMBw?=
 =?us-ascii?Q?8v+kxuFm5aw1Q64GCCrf4OdwnP1FRz5UR2bcy23wF5Tcpv1kCZncBTEIU1Vq?=
 =?us-ascii?Q?tpwYrV4Sj+4w5W1E+6PDBecrJhNJQuGTDDUJPj+XxI9+HaDi2th4xkh7uXA3?=
 =?us-ascii?Q?jfBg1o120z81HFn/w8e3qPiIa57jGLiFDIOAAC1rr/3t9C3+T1W9ijZkwycc?=
 =?us-ascii?Q?YnQlFvuyv4kUsbPqe16L70/v5K6noCuRHBHto0FgZOOGsAC2GNe9/Lwk1/RV?=
 =?us-ascii?Q?ZnRu58XZavWJ36FMdH9HzmwZmBXWUyWYTYR+CYZyflUatqe6yfVRbCIDHQ1a?=
 =?us-ascii?Q?GmnftANwp4MmOycadDDYP7ejEAxmPM1NDEi7++McJqBNAt1lDz2XHSu+/B9+?=
 =?us-ascii?Q?WMhLFfoUqMS9SZkXzrSUUOL4GCvKT2N7+HUKlN9ugOzvtSGSsjJORs3uUImr?=
 =?us-ascii?Q?VzFt4RLwdhSj+omoBirfSkkw6hxpA0Ng1rnaPPTjs0GIQCjrzEls02dI/bgO?=
 =?us-ascii?Q?sYLeHW9Zr9doZ3mtxBlHZ0BJUdGmLuVi2Ehdcl7OAlr0lrGsKxdjrWM+QFhh?=
 =?us-ascii?Q?NWKrAJiOh3l9slAwJmtvziGBATdye9cq0RE6mVMFO6AtBoRPzOc1e8VgbILH?=
 =?us-ascii?Q?2gSmyyJn03ibyfwz6dlBkEKYoCP8UNEH3oMAZaJiRSudqJQd1RUZ9uTyXFni?=
 =?us-ascii?Q?VRo7V3HfVES2g0YXbdyxWbYS8Gyz6YI+SbgWW3DzdRJlgydffgOzwFATw+YQ?=
 =?us-ascii?Q?7Wv1crZR6ZQCe1+Z5TYIcui3sfFdROpS8PEDrG51xi/C8OzGyAakDJ6fqDDz?=
 =?us-ascii?Q?x9AdVCIGxFjFcaBYfy/gnXVM/hXgzOwuDtLF2wx6BRmtNdfoSnz8dy9BDb1n?=
 =?us-ascii?Q?UNJTeEpw35AkdKsZpas1gJ78KZ0TuDj/lBu2owTAebzUXFHqxdVIgjxlMqdL?=
 =?us-ascii?Q?xPAaQw1Zocl3AypfeuZWWcjWmTpAcWXn6cZnMdrb8h0VbJxMseMIwY6TrGi9?=
 =?us-ascii?Q?JBh/5m66u9WBF7YEkLnEj/etAcsi+svH+t7pi2zPJhgLXYaOj8P0z3xSEgMU?=
 =?us-ascii?Q?+tBaiH0WF67obdWDHFD7soahkg2MXe0+Qic0N4hd6U9uEL03LpZBwg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3378.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b9WqV8rM6pqiMzCyublM6vmEPXwFcbDQKUqGCgA4XGTf4L2tt36k6bmyWYzA?=
 =?us-ascii?Q?hNXcTW0i0ORBl9WQOxTTXlEdd2TKMX0LCmmeX64IHkq7itVkmiYltIf2ymYq?=
 =?us-ascii?Q?P9whP+XzsJQDE08EvH0Ck2R82pYfI60WwA01yp0McEJc47buXJEEIajZs/gg?=
 =?us-ascii?Q?oN014uGY/VhHVyuUSIojBmR1P6vsljn3O9p1m5DDxoe1h2hj6MAxnd5cP1cP?=
 =?us-ascii?Q?NczzuKcVrxlsCCYAsfkCc9Tajp6mxin+eznzciBXHlBgEmLGGQd3tf6gkbxD?=
 =?us-ascii?Q?aXWDbxE7uTz9c+/efH4HmEnOq9iDC56OcYceZeySsbmLjARPzwdERM5t96R5?=
 =?us-ascii?Q?vuJH3v2LgiWzoBbz7yIWqVd+3oQwXGZjRNe+zrWjFiZ+34GuZb+tFT5sL+4c?=
 =?us-ascii?Q?q1kuw/aOsVMdQ+l3aPYF6hkM2cVnIL3lYAVAqO3b2tv5NM9Zt8JwszvtTlfe?=
 =?us-ascii?Q?dWFtOGj0bV5ikgS5bN1UscawT9OieUGNyTPcixuvIZsp5TrKYtXViFMTaInI?=
 =?us-ascii?Q?zCfF3AGsM9ZOkgPchv0paPSu8Rrc9D8lIiH/Z2QYnL9DuwOBIRfJkEl6onFT?=
 =?us-ascii?Q?CKukH4wusTNUmJaJXGx1fDOO8Qv2A4dKiNxMjr3/9zV5l/wnXheB+ZD1qsMU?=
 =?us-ascii?Q?99rF5UZtC2Lo7+jTlAgScA6AwYZDGJ/JaLDwexPnrdWDWbhSUyaU3/aaEtjH?=
 =?us-ascii?Q?nRQ/gBO7PLWI3CYLyW8ajhDIWxF44aEL1eYTzKGFyqMpEwy7I3ufwJP9PUHX?=
 =?us-ascii?Q?06stnHJYIX5w4ucfDJK7nvBtyr/7gC/cpKLNC3yy6AtxiI/0EY2qSTvkFg7L?=
 =?us-ascii?Q?RLRRAp/yRiTXWDaUY7foHLJNTgb+br54NUeEGunF1JGD4NEp9b5OqNvX9flg?=
 =?us-ascii?Q?okAeP7ZomuFmGLNQZVnc5DuwCsfPgBpSCJ/sX4jxu6En0yM2PqkdPyaWOQ2B?=
 =?us-ascii?Q?G46qUkjq00wyul3ROxRbutl+yxZb124lJNa/XKeplZju4qE1LeyqCR2zWoKI?=
 =?us-ascii?Q?11RC0wYz6uuFvMAFRF8u4H00vvF17nnIFskohcwMRXhejxMzqsebuzptiXn9?=
 =?us-ascii?Q?4VIc4cXyGUN3mc0pLE7nlKi2uOFlBegEp0Bm9fH+t6h2eBXFyNNjqrELyjzB?=
 =?us-ascii?Q?z1O7yzOqGTFsd4LQhL7v+lrXvJ9kRZLqx/3v62cZhQgmt5iPIwaaHbAi388P?=
 =?us-ascii?Q?DRN/EAZxW3v/dOKIpcxJOLDx9NqBPovKqNkvqz8gdmY5elAp1l8FH4VF8GpM?=
 =?us-ascii?Q?TyF0fMMwOGF9sPT5fOBrzKeKCcDsyDw5AKHl37tQvhbuBn/VMgYkRxWZaF6Y?=
 =?us-ascii?Q?q8Lo29uvWRuEmGCuJ5PmpXKfxlTuzmwAoWB87jSz1xuQ0GaICszvz+3DjoXd?=
 =?us-ascii?Q?+AW/m7zx8uciZ409XPsN//WKxo7BP081YznG0ne722B9fk7OxJrLJ6C7dO3a?=
 =?us-ascii?Q?bXwugp0xLYUy4th+wYu3Qr1YJRk1B5vb1vAudNn4X10BuAmvGzoSkK7T5T7M?=
 =?us-ascii?Q?58nj3nA/Z2l79JUJiiVbeytsYMPc9ByM60Ohy5aFr2kID+IjyFgiqBURgR4Y?=
 =?us-ascii?Q?I401IhUC++gJM68jNzTCq0Iz2BNIGlLY5k53BQWHyfH/+aapW0p/qoHk4yIr?=
 =?us-ascii?Q?dCRbR88tZ05Uh1cpXXmhKXY=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 49527f3d-48ef-4e06-07f7-08de398f1e5b
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 14:59:58.6515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YhsUMLyryA/+pj+z8IcNbex8cTvC/Z4+/xPJELZfc73hdBSYEi1lUOD+37CBF6AqE8Z891y9DUhVqid2QLxkTdsrL9+k3eMvASOvF8dky+PJnsDbFt8XNbygYJwHv/Yx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4723
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 21:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122622

Backport the fix for CVE-2025-53101

Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commi=
t/66dc8f51c11b0ae1f1cdeacd381c3e9a4de69774]

Add below patch to fix
0002-ImageMagick-Fix-CVE-2025-53101.patch

Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
---
 .../0002-ImageMagick-Fix-CVE-2025-53101.patch | 60 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0002-ImageMag=
ick-Fix-CVE-2025-53101.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/0002-ImageMagick-Fix=
-CVE-2025-53101.patch b/meta-oe/recipes-support/imagemagick/files/0002-Imag=
eMagick-Fix-CVE-2025-53101.patch
new file mode 100644
index 0000000000..a00beb78f1
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0002-ImageMagick-Fix-CVE-20=
25-53101.patch
@@ -0,0 +1,60 @@
+From 3c6a0eea436afbf5de708b6dda7e9dc7e5189399 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Wed, 5 Nov 2025 12:54:53 +0530
+Subject: [PATCH 02/18] ImageMagick: Fix CVE-2025-53101
+
+CVE: CVE-2025-53101
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/66dc8f51c11b0ae1f1cdeacd381c3e9a4de69774]
+Reference: https://github.com/ImageMagick/ImageMagick/security/advisories/=
GHSA-qh3h-j545-h8c9
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ MagickCore/image.c | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/MagickCore/image.c b/MagickCore/image.c
+index fe2a1cb5f..346285165 100644
+--- a/MagickCore/image.c
++++ b/MagickCore/image.c
+@@ -1650,7 +1650,6 @@ MagickExport size_t InterpretImageFilename(const Ima=
geInfo *image_info,
+     *p;
+=20
+   ssize_t
+-    field_width,
+     offset;
+=20
+   canonical=3DMagickFalse;
+@@ -1664,21 +1663,23 @@ MagickExport size_t InterpretImageFilename(const I=
mageInfo *image_info,
+         p++;
+         continue;
+       }
+-    field_width=3D0;
+-    if (*q =3D=3D '0')
+-      field_width=3D(ssize_t) strtol(q,&q,10);
+     switch (*q)
+     {
+       case 'd':
+       case 'o':
+       case 'x':
+       {
++        ssize_t
++          count;
++
+         q++;
+         c=3D(*q);
+         *q=3D'\0';
+-        (void) FormatLocaleString(filename+(p-format-offset),(size_t)
++        count=3DFormatLocaleString(filename+(p-format-offset),(size_t)
+           (MagickPathExtent-(p-format-offset)),p,value);
+-        offset+=3D(4-field_width);
++        if ((count <=3D 0) || (count > (MagickPathExtent-(p-format-offset=
))))
++          return(0);
++        offset+=3D(ssize_t) ((q-p)-count);
+         *q=3Dc;
+         (void) ConcatenateMagickString(filename,q,MagickPathExtent);
+         canonical=3DMagickTrue;
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/me=
ta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index bdd6dbe955..ade10e1723 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -25,6 +25,7 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git=
;branch=3Dmain;protocol=3Dhtt
     file://CVE-2023-5341.patch \
     file://CVE-2022-28463.patch \
     file://0001-ImageMagick-Fix-CVE-2025-53014.patch \
+    file://0002-ImageMagick-Fix-CVE-2025-53101.patch \
 "
=20
 SRCREV =3D "35b4991eb0939a327f3489988c366e21068b0178"
--=20
2.34.1


