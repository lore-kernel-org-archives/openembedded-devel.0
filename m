Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA3DC43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 14:50:39 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.175049.1783435836542538701
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jul 2026 07:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=J4cllZfQ;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso2630622f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jul 2026 07:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783435834; x=1784040634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/hXGiceq42AD9hg136hDyqy1DzPLGMcxHDx3TCMDS0A=;
        b=J4cllZfQ/Y2McDhdX6jtJdmvukP2IUORF7oduXZEeXaWK1lPhOZro+mdxX7uEfAr5a
         6qh2HWswp/d6TO4GB4KOU/L6zsuVEHhUdKQ/TADmeTVSEutZ9Hf4cncmLSTh40VFV3GW
         FuIhjBF1ZY5UDQ3rZqfny1gYWd64CpcQCCyv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435834; x=1784040634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hXGiceq42AD9hg136hDyqy1DzPLGMcxHDx3TCMDS0A=;
        b=PNiypXIDQ6ihe9YHgc+TrKMVSe9X/P2Uju6F2hTM2f4MHvwKcgl6XhB4M9tLAvP5Az
         trGCWn026trtOw/aCoaLfQT7ndPMb/GH13Tn09kqvgM9Nzs+3x45JpOzU8J19ecZHSM0
         J7DyKdlhtJKLIGUFzZFetjYrptlGGRQthKakVzVzJIIoeeXbxFaxU8RAPX2LV47DwHFB
         lyloeeyR0hfus3hkoIEl4rqvDT6PeWGS5J1UMI8qyrl1RXg+U2oZXaJ7MMIeKvwwlaX8
         aJlK+m76SoKoYdtGg9alLRaQONW2RWMYCAnLmle8CQgJ+sSPdJbNYcVplOGniA8mmAxe
         D/SQ==
X-Gm-Message-State: AOJu0Yz2O2Cq7VW6mHwB2IrrmDlaPvEheIVh1JniuyB4q5POcbiwohek
	gW95t9Et8usO+FGckk/0Iy+Alno8YSdhiweDAM160lB3OA2Di9sHtuFzWAkIU2TG3n5bTNREHK8
	jJh/0
X-Gm-Gg: AfdE7cnBeaTTD2grl4o+uom1P8xtok4E0Uu0P7kPNLAb+bIG8LVGjyyC0KbUcbwUXCG
	Po3tKiLO6xKa6odiOTXfgU4Hvhg/swSMy7yR47+gFpxjIl9XmMBgMjkvdrEa3vp5thjJTX9eLYR
	KMVV+dqVgH67nDnyAKaiq3cReGFAQdxc9BwABjPrPpGC3oRM1G8K7zICJMTIeYkEYWMGlcfgmtF
	REOsAIC1pcPWIQRqoGhHnhNwuefIGycNQjC5vV3TSVIm/5B/wvxTJ6X//xEwTGkF+2phYWPXFvG
	6F3QhIrhP1wgS5EfRlOZdyG4q8nxDZH+9nS6RX4l7CIMsiDyWdjJcUrNjO2BrUK0kYdGwS51rZ3
	lnjcxoRyNxHOO0C/6Ku1KnRG0agWZ9w3aiPA4QfHN9g28Ho8kVcT1vUknXW5ti7FkFL/SXT7J9D
	tZCqdDA9W65Jg2ONxho3wPZ81CheeKRBN6si4rNUxME90AjnZ/dD+Olc4Tr7/7Rt/0xLgbyMOO5
	VfvFGC++QJUwEiplSDXS7sekhv2+3PH9JrY2XPLCg==
X-Received: by 2002:a05:600c:83c9:b0:493:bc31:b2ae with SMTP id 5b1f17b1804b1-493df040597mr64842875e9.10.1783435834190;
        Tue, 07 Jul 2026 07:50:34 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f40912sm58201425e9.4.2026.07.07.07.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:50:33 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-multimedia][PATCH] libheif: Upgrade 1.21.2 -> 1.23.1
Date: Tue,  7 Jul 2026 17:50:28 +0300
Message-ID: <20260707145028.1076950-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jul 2026 14:50:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128068

Upgrade to release 1.23.1.

New features:
- FFmpeg decoder plugin gains AV1, VVC, JPEG, and JPEG 2000/HTJ2K
  decoding
- SVT-AV1 encoder: new tune=iq and ms-ssim tune parameters
- C++ API: added getters/setters for the CLLI and MDCV HDR metadata
  boxes
- Sequence decoder now scales the alpha auxiliary track to the main
  image size

Bug fixes:
- Fixed pixi box writing for multi-channel images
- Corrected the placement of the TAI clock_type field into the top
  2 bits
- Empty/unset plugin directory is no longer scanned

Security fixes:
- CVE-TBD (GHSA-jc8f-p23p-5hjg) Integer underflow in Fraction
  constructor via double clap transform application
- CVE-TBD (GHSA-73p7-m7gg-w2jv) Out-of-bounds read in uncompressed
  unci tile range slicing
= CVE-TBD (GHSA-xpw3-9rhw-482x) Heap out of bounds write in libheif
  uncompressed encoder when writing images with mismatched
  auxiliary alpha dimensions
- CVE-TBD (GHSA-9ww4-9v47-m7pj) Reachable assertion in
  HeifContext::get_track() aborts on a valid-but-empty HEIF
  sequence file
- (GHSA-46rp-pcq2-rpmr) Heap out-of-bounds write in the
  uncompressed encoder for RRGGBB images with interleaved bit-depth
  lower or equal to 8

Remove CVE-2026-3949.patch because the fix has been included in
the source code for this release of libheif.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../libheif/libheif/CVE-2026-3949.patch       | 50 -------------------
 .../{libheif_1.21.2.bb => libheif_1.23.1.bb}  |  6 +--
 2 files changed, 2 insertions(+), 54 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-3949.patch
 rename meta-multimedia/recipes-multimedia/libheif/{libheif_1.21.2.bb => libheif_1.23.1.bb} (90%)

diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-3949.patch b/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-3949.patch
deleted file mode 100644
index ef5d9c1ee4..0000000000
--- a/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-3949.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From cba59e7671a36a78e31c0490efe74ec226918580 Mon Sep 17 00:00:00 2001
-From: Dirk Farin <dirk.farin@gmail.com>
-Date: Tue, 24 Feb 2026 00:32:48 +0100
-Subject: [PATCH] vvdec: check that NAL size does not exceed data size (#1712)
-
-CVE: CVE-2026-3949
-Upstream-Status: Backport [https://github.com/strukturag/libheif/commit/b97c8b5f198b27f375127cd597a35f2113544d03]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- libheif/plugins/decoder_vvdec.cc | 17 +++++++++++++++++
- 1 file changed, 17 insertions(+)
-
-diff --git a/libheif/plugins/decoder_vvdec.cc b/libheif/plugins/decoder_vvdec.cc
-index 09515720..14b3e9fd 100644
---- a/libheif/plugins/decoder_vvdec.cc
-+++ b/libheif/plugins/decoder_vvdec.cc
-@@ -55,6 +55,7 @@ struct vvdec_decoder
-   std::string error_message;
- };
- 
-+static const char kEmptyString[] = "";
- static const char kSuccess[] = "Success";
- 
- static const int VVDEC_PLUGIN_PRIORITY = 100;
-@@ -179,9 +180,25 @@ heif_error vvdec_push_data2(void* decoder_raw, const void* frame_data, size_t fr
- 
-   const auto* data = (const uint8_t*) frame_data;
- 
-+  if (frame_size < 4) {
-+    return {
-+      heif_error_Decoder_plugin_error,
-+      heif_suberror_End_of_data,
-+      kEmptyString
-+    };
-+  }
-+
-   for (;;) {
-     uint32_t size = four_bytes_to_uint32(data[0], data[1], data[2], data[3]);
- 
-+    if (frame_size < 4 + size) {
-+      return {
-+        heif_error_Decoder_plugin_error,
-+        heif_suberror_End_of_data,
-+        kEmptyString
-+      };
-+    }
-+
-     data += 4;
- 
-     std::vector<uint8_t> nalu;
diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb b/meta-multimedia/recipes-multimedia/libheif/libheif_1.23.1.bb
similarity index 90%
rename from meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
rename to meta-multimedia/recipes-multimedia/libheif/libheif_1.23.1.bb
index ab29fa3b02..ee86fd3bc5 100644
--- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.23.1.bb
@@ -6,11 +6,9 @@ LICENSE_FLAGS = "commercial"
 
 COMPATIBLE_MACHINE:powerpc64le = "null"
 
-SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=master;tag=v${PV} \
-           file://CVE-2026-3949.patch \
-           "
+SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "62f1b8c76ed4d8305071fdacbe74ef9717bacac5"
+SRCREV = "2c4bbb54c2738d4a5efbbe3e5fa1d5d76bb88eb0"
 
 inherit cmake pkgconfig
 
-- 
2.47.3


