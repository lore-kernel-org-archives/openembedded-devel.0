Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C19CCCF2C0
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:23:36 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15654.1792131805734630105
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=cZFoO8J2;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4219; q=dns/txt;
  s=iport01; t=1792131805; x=1793341405;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+h08aWBADljYz9ETtWo20jmf9VXgOMofXo54SeThcd4=;
  b=cZFoO8J28JLwcc/kuqvxgBkyAlOVto7wi3AsWdMBjHxaob+Vpdgg8qDg
   LlSuAcfktgENdP6bqcY5QPUufreTioOAiWd8g+DF26tJBAIwYk7frNXyD
   LhizsQ8fpkivJ5nTeAul91Uy06dkmIvYxbjyIV+jZIIjiZ74wFASJb5le
   4lWFlSAQtdAeBYEQR0nsl1UcvxkSd5w9yuG2c8SUfbJKF0oql78wj+pxi
   yctBOGLB7RvbaXxpb06dB/17J94iJm0Wh2lcMY0nElPHAOmE8slgDmB7W
   4kHv69deRUc5ZOUPyETNvX9tXcfkOA6Q1Un0waofmUkp1x8jYziJfD6Dl
   A==;
X-CSE-ConnectionGUID: NLu0DyUzRPWnhayGngfgjw==
X-CSE-MsgGUID: GHx6uHFvR3esZxbh4HDJ8A==
X-IPAS-Result: =?us-ascii?q?A0BJAgBfwdFq/4v/Ja1aglmCV3VgQ0kDlCaCIQOeHIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCdAMRvHOBeTOBA?=
 =?us-ascii?q?YMpAT8BRFDZSoFoAQsUAYE4hUCII10YAYR8JxuBSUSBFYE7gi6BBYFcAoglB?=
 =?us-ascii?q?IMcEoFalUdIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgg?=
 =?us-ascii?q?hYjGTZ6gQlegSspYRAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiCBIJARMaM?=
 =?us-ascii?q?AuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5IUHoJlAX4PASsFe?=
 =?us-ascii?q?oEtHqM2giGhD4QojCKVOhozhVulFAuYfYs3glOWT4RpgWg8gVkzGggbFYMiC?=
 =?us-ascii?q?UoZD445g2uFZMh2JzICCQMvAQEHAgcOAwuBaJACLYFPAQE?=
IronPort-Data: A9a23:kaHxva+Cau71r8253vKdDrUD1n+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 jAZWGiBPP+PYWbyc9pzPImxoxhUusSBy4VnGQZkqiFEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtajtKs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kQGZBA1vdKE1t2y
 voYISEiaB+NiOCplefTpulE3qzPLeHxN48Z/3UlxjbDALN+G9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZOEwn1lQ/UPrSmM+5m2P2fzBwo1OOrq1x6G/WpOB0+OW2boaFJIPUFK25mG63h
 nKY4kTXHCtBOcet2TCFrlKApL/myHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:FkWXd6rT2PRlS8h4svWRZMQaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:3LQUrGw0DV9vrUZ8gKiFBgUyPt19Xmzg3k3oHEm4AHdGTrKbRl2PrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3Aj+BCaA+5b27WEZP00RQr5rqQf+hI8/qzKG4Tq84?=
 =?us-ascii?q?LoPuUPywsGxu/3B3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536486769"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:23:25 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id CA8761800023D
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:23:24 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 714D8CBF203; Thu, 15 Oct 2026 23:23:24 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 3/9] python3-pillow: Fix CVE-2026-59197
Date: Thu, 15 Oct 2026 23:23:17 -0700
Message-Id: <20261016062323.251925-4-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016062323.251925-1-yurade@cisco.com>
References: <20261016062323.251925-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131057

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/python-pillow/Pillow/commit/cce3bdb867c77a3420261ed1bfdb6b0787ec8fc1
[2] https://github.com/python-pillow/Pillow/security/advisories/GHSA-xj96-63gp-2gmr

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python3-pillow/CVE-2026-59197.patch       | 74 +++++++++++++++++++
 .../python/python3-pillow_12.2.0.bb           |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59197.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59197.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59197.patch
new file mode 100644
index 0000000000..415866a19e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59197.patch
@@ -0,0 +1,74 @@
+From cce3bdb867c77a3420261ed1bfdb6b0787ec8fc1 Mon Sep 17 00:00:00 2001
+From: Andrew Murray <radarhere@users.noreply.github.com>
+Date: Sat, 20 Jun 2026 11:53:14 +1000
+Subject: [PATCH] Validate large filter sizes when initializing RankFilter
+ (#9695)
+
+CVE: CVE-2026-59197
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/cce3bdb867c77a3420261ed1bfdb6b0787ec8fc1]
+
+Backport Changes:
+- Adapted the ImagingExpand check to Pillow 12.2.0's two-margin API.
+  It checks the larger margin and guards against zero before division;
+  the regression test passes both margins.
+
+(cherry picked from commit cce3bdb867c77a3420261ed1bfdb6b0787ec8fc1)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ Tests/test_image_filter.py | 5 +++++
+ src/PIL/ImageFilter.py     | 3 +++
+ src/libImaging/Filter.c    | 5 +++++
+ 3 files changed, 13 insertions(+)
+
+diff --git a/Tests/test_image_filter.py b/Tests/test_image_filter.py
+index e566cd055..4bed605 100644
+--- a/Tests/test_image_filter.py
++++ b/Tests/test_image_filter.py
+@@ -141,6 +141,11 @@ def test_rankfilter_properties() -> None:
+     assert rankfilter.size == 1
+     assert rankfilter.rank == 2
+ 
++    with pytest.raises(ValueError, match="filter size too large"):
++        ImageFilter.RankFilter(23171, 1)
++    im = Image.new("1", (1, 1))
++    with pytest.raises(ValueError, match="filter size too large"):
++        im.im.expand(23171, 23171)
+ 
+ def test_builtinfilter_p() -> None:
+     builtin_filter = ImageFilter.BuiltinFilter()
+
+diff --git a/src/PIL/ImageFilter.py b/src/PIL/ImageFilter.py
+index 9326eeeda..2c73c27bc 100644
+--- a/src/PIL/ImageFilter.py
++++ b/src/PIL/ImageFilter.py
+@@ -99,6 +99,9 @@ class RankFilter(Filter):
+     name = "Rank"
+ 
+     def __init__(self, size: int, rank: int) -> None:
++        if size * size * 4 > (2**31 - 1):
++            msg = "filter size too large"
++            raise ValueError(msg)
+         self.size = size
+         self.rank = rank
+
+diff --git a/src/libImaging/Filter.c b/src/libImaging/Filter.c
+index cefb8fc..5288754 100644
+--- a/src/libImaging/Filter.c
++++ b/src/libImaging/Filter.c
+@@ -54,11 +54,16 @@ Imaging
+ ImagingExpand(Imaging imIn, int xmargin, int ymargin) {
+     Imaging imOut;
+     int x, y;
++    int margin;
+     ImagingSectionCookie cookie;
+ 
+     if (xmargin < 0 && ymargin < 0) {
+         return (Imaging)ImagingError_ValueError("bad kernel size");
+     }
++    margin = xmargin > ymargin ? xmargin : ymargin;
++    if (margin > 0 && margin > (INT_MAX / (int)sizeof(FLOAT32)) / margin) {
++        return (Imaging)ImagingError_ValueError("filter size too large");
++    }
+ 
+     imOut = ImagingNewDirty(
+         imIn->mode, imIn->xsize + 2 * xmargin, imIn->ysize + 2 * ymargin
diff --git a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
index d5576560e7..f9d91e0889 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https;
            file://CVE-2026-59204.patch \
            file://CVE-2026-54059_CVE-2026-54060_CVE-2026-55379.patch \
            file://CVE-2026-55380.patch \
+           file://CVE-2026-59197.patch \
            "
 SRCREV = "3c41c095064200a02672d89cc5ff629eaf4b0d4f"
 
-- 
2.35.6


