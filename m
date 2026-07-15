Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB042C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 17:27:25 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75.1784136439793944080
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 10:27:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YOeCgqqs;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2667; q=dns/txt;
  s=iport01; t=1784136439; x=1785346039;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RI8sCpLl2T/r3StFT2P2APCchCiWMHaE3p1yYff4VCs=;
  b=YOeCgqqsAsI9CdWKd8Tcjw2lSNvMR8mvtlYlAH+h2sbBYD/fqIqMTsF0
   S0PiVYgafdEfmmiAgV9Ei4zpnwyAPhu4YYvD2PmyvR7wq4u07beGV8B1d
   UjR5VAAH78okbDgTJ/gXkOvZV4GFeWBHAtdzn2eOUyosPeUTL1f0B1UL8
   FbuTlYSdLdjbCv70+jPvhEaoEOZivZG4rMSBmPW6Eg8WfD8XrY4PbLy7y
   DgtDgk5NWsYzLFN+FOHIrf1UsNloj7iYl/DURWdMGjhxYI9bKBD9mGjd7
   ydSoEw0Po8yoSg4cMWmD0Dlo+ydNhH2f2gtc00cfh+m+P6TnxMBF+Btfu
   w==;
X-CSE-ConnectionGUID: dBeZ0edoSaCwckxMRn4zhw==
X-CSE-MsgGUID: VB8nTH2fQEadqkn1wbn64w==
X-IPAS-Result: =?us-ascii?q?A0BFAgBqwldq/43/Ja1aglmCV3RfQkmUKYE1bJ4egX4PA?=
 =?us-ascii?q?QEBDy4WDQQBAZJYAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgEEMQFyAwECVgQjGQiDAgGCOgM3AxEGvTaCLIEBg1oCDAJDU?=
 =?us-ascii?q?NhJEIJVAQsUAYE4hT+IIFwYAYR8JxsbgXKEfoEFgVwBAgEBF4ENgQaFeASCI?=
 =?us-ascii?q?oEMgVoYBoIGjXNIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBH?=
 =?us-ascii?q?YFQgQKEdiMfAzl/gTB1SnctahIXgVGCFIEaAwsYDUgRLDcUGwQ+bgeNSiWBc?=
 =?us-ascii?q?k2BDgETFgKoH6ESCiiDdYwhjT6HfBozhASUF5JRC5h9jgqWUIRpgWg8gVlwF?=
 =?us-ascii?q?YMiCUoZD44uCguIc8kFPDUCAQgyAQEHAgcOAwuBaJAAgX4BAQ?=
IronPort-Data: A9a23:FxOXeKvnfZyTYQDWDwHaFoieAOfnVAZfMUV32f8akzHdYApBsoF/q
 tZmKTrQb6rZYWCjedlybI3kpk1U7Z/Xx4VjTwZppCA9RC9DgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/3a9Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw9sx6MzlD+
 fsjIRsSZROTotiwnKC7Vbw57igjBJGD0II3oHpsy3TdSP0hW52GG/mM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtOYH49tL/Aan3XfzBVsluJpa0f6GnIxws327/oWDbQUoHSFJ8PxRnF+
 Qoq+UzHKEEcCPzFxwOo+361hemWgin9Bt4NQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZNJottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:AeIJM6MGYClcRMBcTvGjsMiBIKoaSvp037BN7TESdfU7SKKlfq
 yV8cjztiWE6wr5JktApTnoAsDpKhnhHPVOjrX5U43PYOCfgguVBbAny5f+yDv9HCC73Otc2a
 B8N5VaMrTLfD1HZQKQ2njeLz7mq+P3lJyVuQ==
X-Talos-CUID: =?us-ascii?q?9a23=3ATSae32oZhFvZxIdlb8CV5/bmUcwPf0+FwXvXGEa?=
 =?us-ascii?q?TFm1qWJivTwOC+Lwxxg=3D=3D?=
X-Talos-MUID: 9a23:1ABpAgo09wWmA42se/cezw9IZMFUw/6gMW0EnYwFvZCbPyouZyjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,165,1779148800"; 
   d="scan'208";a="509223757"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jul 2026 17:27:19 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id A4E9418000193
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 17:27:18 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id C7D3ECC037D; Wed, 15 Jul 2026 22:57:16 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][scarthgap][PATCH] libidn: fix CVE-2026-57053
Date: Wed, 15 Jul 2026 22:57:10 +0530
Message-Id: <20260715172710.1153890-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 17:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128226

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream v1.44 backport for
CVE-2026-57053. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://git.savannah.gnu.org/cgit/libidn.git/commit/?id=f57fab06afc1e328bbe197ad3d4a4e83c829593e
[2] https://www.cve.org/CVERecord?id=CVE-2026-57053

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../libidn/libidn/CVE-2026-57053.patch        | 28 +++++++++++++++++++
 .../recipes-extended/libidn/libidn_1.41.bb    |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libidn/libidn/CVE-2026-57053.patch

diff --git a/meta-oe/recipes-extended/libidn/libidn/CVE-2026-57053.patch b/meta-oe/recipes-extended/libidn/libidn/CVE-2026-57053.patch
new file mode 100644
index 0000000..7079f9c
--- /dev/null
+++ b/meta-oe/recipes-extended/libidn/libidn/CVE-2026-57053.patch
@@ -0,0 +1,28 @@
+From f57fab06afc1e328bbe197ad3d4a4e83c829593e Mon Sep 17 00:00:00 2001
+From: Simon Josefsson <simon@josefsson.org>
+Date: Tue, 16 Jun 2026 17:23:38 +0200
+Subject: [PATCH] Guard against read-out-bounds on some xn-- strings
+
+Report and suggested fix by jiami3us@icloud.com in:
+https://lists.gnu.org/archive/html/help-libidn/2026-05/msg00000.html
+
+CVE: CVE-2026-57053
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libidn.git/commit/?id=f57fab06afc1e328bbe197ad3d4a4e83c829593e]
+
+(cherry picked from commit f57fab06afc1e328bbe197ad3d4a4e83c829593e)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/idna.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/idna.c b/lib/idna.c
+index 27de4489..29664245 100644
+--- a/lib/idna.c
++++ b/lib/idna.c
+@@ -388,4 +388,5 @@ step3:
+-  if (c_strcasecmp (utf8in, tmpout + strlen (IDNA_ACE_PREFIX)) != 0)
++  if (c_strncasecmp (tmpout, IDNA_ACE_PREFIX, strlen (IDNA_ACE_PREFIX)) != 0
++      || c_strcasecmp (utf8in, tmpout + strlen (IDNA_ACE_PREFIX)) != 0)
+     {
+       free (utf8in);
+       return IDNA_ROUNDTRIP_VERIFY_ERROR;
diff --git a/meta-oe/recipes-extended/libidn/libidn_1.41.bb b/meta-oe/recipes-extended/libidn/libidn_1.41.bb
index 17ffc6c..281d4cf 100644
--- a/meta-oe/recipes-extended/libidn/libidn_1.41.bb
+++ b/meta-oe/recipes-extended/libidn/libidn_1.41.bb
@@ -19,6 +19,7 @@ inherit pkgconfig autotools gettext texinfo gtk-doc
 SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
            file://0001-largefile.m4-Sync-with-latest-gnulib.patch \
+           file://CVE-2026-57053.patch \
            "
 
 #SRC_URI[md5sum] = "813c7b268d1051ca02c3610986126f38"
-- 
2.35.6


