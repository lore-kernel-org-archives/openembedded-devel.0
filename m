Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEDECCCA46D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:23:35 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15945.1792131805649821057
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=eFz1PsR0;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4140; q=dns/txt;
  s=iport01; t=1792131805; x=1793341405;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=5gXpAin5fgoSX+IWw63mDs+vFJsYhW7BAUKVRZ7rZmA=;
  b=eFz1PsR02nhhyBvoWoWJRIjhSdDbHnkauPAiKlcEJMuk2jHsgSo+1fhk
   o6j6a7c62SmIuoPGzLMJPVYHRzwi2Nbv1FP5x2WLHA/8RjABjYHo/05Zb
   ZHan9xidSXZZqGrJQbthPAsQ57MHWa1OIkyp9i6FkBxZ7CsfyYrdSZ9h+
   UTXR4IT7EFVz6PEl+dlvbpaLdgVL5c5chdYLOCCYWSAG5iXo4vhP+2XBe
   DHjaWN/kSbS3rJPCrQAj5s1BdeP7Dl1f01IJ7/h2+YCzoK3bKUzwbQOZ0
   bH+9QycZFmrR1UAh6XzTrgtx1Sh0R/5sZGJ8u7ZacAB5bDvmAcsagkb5i
   Q==;
X-CSE-ConnectionGUID: OwIrLxqzRVKwJwUgqzD3Ew==
X-CSE-MsgGUID: Es1vXA/4QNy4Ena0HIu6Xw==
X-IPAS-Result: =?us-ascii?q?A0BJAgBfwdFq/5X/Ja1aglmCV3VgQ0kDlCaCIQOeHIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCdAMRvHOBeTOBA?=
 =?us-ascii?q?YMpAYFU2UqBaAELFAGBOIVAiCNdGAGEfCcbgUlEgRWBO4IugQWBXAKIJQSDH?=
 =?us-ascii?q?BKBWpVHSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BIIIWI?=
 =?us-ascii?q?xk2eoEJXoErKWEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALg?=
 =?us-ascii?q?Rs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSFB6CZXsTASsFeoEtH?=
 =?us-ascii?q?pMXkkChD4QojCKVOhozhVulFAuYfYs3glOJD41AhGmBaDyBWTMaCBsVgyIJS?=
 =?us-ascii?q?hkPjjmDa4JZgwvIdicyAgkDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:OMP3a6DjWL1zIhVW/3/iw5YqxClBgxIJ4kV8jS/XYbTApDolhTVWm
 jFLUGyDafaDZ2qnLd1zaYuz/RtUu5/Vn4VjOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQf8hWYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE5OpPFmUmJJ8ixMVoI35z+
 uUKBGsgcUXW7w626OrTpuhEnM8vKozveYgYoHwllGufBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY+BPjDS0Un1lM/GY8kleulrnL+aDZf7lmSoMLb5kCOl1IogeS8bIO9ltqiaN4MgHax4
 T7/2XWlLxcTbPy+1GS17Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTWValrP2Rjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWspBUQXZ9UVuY98gzIk/CS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:+rGyZquTbiCuQvOTz+ncvYNh7skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:pLXnDWNRPPujU+5DfzZG7moEA9IfTF7C7mjtLFaqJT1EV+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AiIZVjw2UQMC/K01/V491PxBZODUjzr/3FnAk1sk?=
 =?us-ascii?q?/ndjYGCp5Yxe8kWqHXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536194941"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:23:25 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 3231618000336
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:23:25 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 8A610CBEFAB; Thu, 15 Oct 2026 23:23:24 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 8/9] python3-pillow: Fix CVE-2026-59205
Date: Thu, 15 Oct 2026 23:23:22 -0700
Message-Id: <20261016062323.251925-9-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016062323.251925-1-yurade@cisco.com>
References: <20261016062323.251925-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:23:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131060

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/python-pillow/Pillow/commit/a9ffc42bedf4fc0a7ef8d6486e7f9e81e3397721
[2] https://github.com/python-pillow/Pillow/security/advisories/GHSA-9hw9-ch79-4vh6

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python3-pillow/CVE-2026-59205.patch       | 66 +++++++++++++++++++
 .../python/python3-pillow_12.2.0.bb           |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59205.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59205.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59205.patch
new file mode 100644
index 0000000000..5cac7e05d1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59205.patch
@@ -0,0 +1,66 @@
+From a9ffc42bedf4fc0a7ef8d6486e7f9e81e3397721 Mon Sep 17 00:00:00 2001
+From: Andrew Murray <radarhere@users.noreply.github.com>
+Date: Sat, 20 Jun 2026 21:18:14 +1000
+Subject: [PATCH] Raise error if image modes do not match ImageCms transform
+ modes (#9715)
+
+CVE: CVE-2026-59205
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/a9ffc42bedf4fc0a7ef8d6486e7f9e81e3397721]
+
+(cherry picked from commit 066e349b8e20f6e0400683ff988ac72eea24c049)
+(cherry picked from commit 7f6e9d696913bba9fd1a6cf0b53f4a313dc25329)
+(cherry picked from commit 642d806703c62d4160f3eb8ff25fb63cbedadd98)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ Tests/test_imagecms.py | 4 ++++
+ src/PIL/ImageCms.py    | 16 +++++++++-------
+ 2 files changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/Tests/test_imagecms.py b/Tests/test_imagecms.py
+index d73ab34282b..3382a34e47c 100644
+--- a/Tests/test_imagecms.py
++++ b/Tests/test_imagecms.py
+@@ -196,6 +196,10 @@ def test_exceptions() -> None:
+     psRGB = ImageCms.createProfile("sRGB")
+     pLab = ImageCms.createProfile("LAB")
+     t = ImageCms.buildTransform(pLab, psRGB, "LAB", "RGB")
++    with pytest.raises(ValueError, match="mode mismatch"):
++        t.apply(hopper("RGBA"))
++    with pytest.raises(ValueError, match="mode mismatch"):
++        t.apply(hopper("LAB"), hopper("RGBA"))
+     with pytest.raises(ValueError, match="mode mismatch"):
+         t.apply_in_place(hopper("RGBA"))
+ 
+diff --git a/src/PIL/ImageCms.py b/src/PIL/ImageCms.py
+index 513e28acf..388a9296f 100644
+--- a/src/PIL/ImageCms.py
++++ b/src/PIL/ImageCms.py
+@@ -317,19 +317,21 @@ class ImageCmsTransform(Image.ImagePointHandler):
+         return self.apply(im)
+ 
+     def apply(self, im: Image.Image, imOut: Image.Image | None = None) -> Image.Image:
+-        if imOut is None:
++        if im.mode != self.input_mode:
++            msg = "mode mismatch"
++            raise ValueError(msg)
++        if imOut is not None:
++            if imOut.mode != self.output_mode:
++                msg = "mode mismatch"
++                raise ValueError(msg)
++        else:
+             imOut = Image.new(self.output_mode, im.size, None)
+         self.transform.apply(im.getim(), imOut.getim())
+         imOut.info["icc_profile"] = self.output_profile.tobytes()
+         return imOut
+ 
+     def apply_in_place(self, im: Image.Image) -> Image.Image:
+-        if im.mode != self.output_mode:
+-            msg = "mode mismatch"
+-            raise ValueError(msg)  # wrong output mode
+-        self.transform.apply(im.getim(), im.getim())
+-        im.info["icc_profile"] = self.output_profile.tobytes()
+-        return im
++        return self.apply(im, im)
+ 
+ 
+ def get_display_profile(handle: SupportsInt | None = None) -> ImageCmsProfile | None:
diff --git a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
index c9926ba076..e5ef7b34bf 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https;
            file://CVE-2026-59199.patch \
            file://CVE-2026-59200.patch \
            file://CVE-2026-59203.patch \
+           file://CVE-2026-59205.patch \
            "
 SRCREV = "3c41c095064200a02672d89cc5ff629eaf4b0d4f"
 
-- 
2.35.6


