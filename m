Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 246A4C531DD
	for <webhook@archiver.kernel.org>; Sat, 10 Aug 2024 15:38:40 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.8003.1723304313586509848
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Aug 2024 08:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JwZSDokw;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e0e88873825so2930565276.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 08:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723304312; x=1723909112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlJ93X9srPX+i8Ry+rXLfW7/BgNR3VfXn9L+fF1rPP8=;
        b=JwZSDokwmLd3UuzbKldsQSCd2T5KRi0xIttd2jfxlpkv+BSqS4fVeFZGKhVuqwOsx1
         ff2YOkD39TkCSKEuiSOzqN5HlI6lYAwIWmm3GV3zWzIc6UMAZflLn1BhSXmXcEfiB4sV
         /kFKVwJ9Tuj+fyWJ/iF9DgLYyTj229s8ArtWiaPI1l2DRUWNcaKv2zT3jfBfeyvyLtxN
         J1RAulLu5Gg1W6SSwBME2q5ql++QxbfCPrvFBy7/G8leDtZzUUxDeB672EouyeiBsDrY
         Dhrf68+8cQY1fA2H/dwyTr8ALZVPvR1qgAgnMGP5nZQXTc5BLUYG24FTK5lkTiWVEJpc
         ElrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723304312; x=1723909112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OlJ93X9srPX+i8Ry+rXLfW7/BgNR3VfXn9L+fF1rPP8=;
        b=WbOL2Oi4fOwf8R7cpqvlvDsGtIyaq9v/u026K+MEO4fcNkbEa6+8GIHRmpruffI728
         979p2VvQFAbK4KJHPXo0f1DBCAx9QjQ6IKOlL0US+yk3o+jGMOLsls/dH1OrWqkamR5/
         OdA1/T19GaA2TcEDuwaGYLP7leZXrvBQuugPYw8i8cO+MRt54lNHbUnRZkiaA2Wxo8NM
         VD8Ks9tb/0ZCJ14hbaYl2+Sh061u6GtXKSGoWeuaaDFXtU1kt8YBY11/uoguhtkQ7mpz
         BWY1+Jm4jlaBGeczW8da07WzuoEuyncEBi4fFPZf+/EAGpla40oB2KwWjmyLQ0t+hDe1
         5E6Q==
X-Gm-Message-State: AOJu0YyFHpFAGlA2HO+SZ+Ku8fc+l/U1su2pimbABTVohkw6jDNq6Ubb
	tOwk/DdrX6VJu6QG/gOWE0qKbCKA6Rd1GEVjZSu9OrDLRbgvygC8dUtksw==
X-Google-Smtp-Source: AGHT+IFgtWS0OO/4ZdNU3C1o8FL79QppoJ/yvXRWClZHtFouNJLBxVEBrOOjx683VnX5xXQsB1jCYg==
X-Received: by 2002:a05:6902:2012:b0:e0b:317c:4ae3 with SMTP id 3f1490d57ef6-e0eb9a33735mr4553173276.42.1723304312530;
        Sat, 10 Aug 2024 08:38:32 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:ad:eb2b:7538:7504])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0ec8c0726bsm382526276.39.2024.08.10.08.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Aug 2024 08:38:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 4/5] exiv2: update 0.28.0 -> 0.28.2
Date: Sat, 10 Aug 2024 11:38:29 -0400
Message-Id: <20240810153830.900538-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240810153830.900538-1-akuster808@gmail.com>
References: <20240810153830.900538-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 15:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111748

From: Markus Volk <f_l_k@t-online.de>

- Remove outdated comment
- Switch to git fetcher. Otherwise the official download location leads to:
  WARNING: exiv2-0.28.2-r0 do_recipe_qa: QA Issue: exiv2: SRC_URI uses unstable GitHub/GitLab
  archives, convert recipe to use git protocol [src-uri-bad]
- Remove reproducibility hack. Theres no buildpath leakage in exiv2Config.cmake
  anymore.

Changes from version 0.28.1 to 0.28.2
-------------------------------------

Release Notes:

* https://github.com/Exiv2/exiv2/issues/2914
* https://github.com/Exiv2/exiv2/milestone/13?closed=1

This release also fixes two low-severity security issues in quicktimevideo.cpp:

* [CVE-2024-24826](https://github.com/Exiv2/exiv2/security/advisories/GHSA-g9xm-7538-mq8w):
  out-of-bounds read in QuickTimeVideo::NikonTagsDecoder.
* [CVE-2024-25112](https://github.com/Exiv2/exiv2/security/advisories/GHSA-crmj-qh74-2r36):
  denial of service due to unbounded recursion in QuickTimeVideo::multipleEntriesDecoder.

These vulnerabilities are in a new feature (quicktime video) that was added in version 0.28.0,
so earlier versions of Exiv2 are not affected.

Changes from version 0.28.0 to 0.28.1
-------------------------------------

Release Notes:
https://github.com/Exiv2/exiv2/issues/2813

This release also fixes [CVE-2023-44398](https://github.com/Exiv2/exiv2/security/advisories/GHSA-hrw9-ggg3-3r4r),
an out-of-bounds write in `BmffImage::brotliUncompress`. The vulnerability is in new code that was added in
version 0.28.0, so earlier versions of Exiv2 are not affected.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3a9fc5ba68d8c121e70c018d4f4a782693def40b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb | 19 -------------------
 meta-oe/recipes-support/exiv2/exiv2_0.28.2.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 19 deletions(-)
 delete mode 100644 meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2_0.28.2.bb

diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb b/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb
deleted file mode 100644
index 958810cf7a..0000000000
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Exif, Iptc and XMP metadata manipulation library and tools"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
-
-DEPENDS = "zlib expat brotli libinih"
-
-SRC_URI = "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${BP}-Source.tar.gz"
-SRC_URI[sha256sum] = "89af3b5ef7277753ef7a7b5374ae017c6b9e304db3b688f1948e73e103491f3d"
-# Once patch is obsolete (project should be aware due to PRs), dos2unix can be removed either
-# inherit dos2unix
-S = "${WORKDIR}/${BP}-Source"
-
-inherit cmake gettext
-
-do_install:append:class-target() {
-    # reproducibility: remove build host path
-    sed -i ${D}${libdir}/cmake/exiv2/exiv2Config.cmake \
-        -e 's:${STAGING_DIR_HOST}::g'
-}
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.2.bb b/meta-oe/recipes-support/exiv2/exiv2_0.28.2.bb
new file mode 100644
index 0000000000..faae247998
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.2.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Exif, Iptc and XMP metadata manipulation library and tools"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
+
+DEPENDS = "zlib expat brotli libinih"
+
+SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x"
+SRCREV = "04207b9c39bf7b3b1a7144f7ed4e4f16b4f29ef6"
+S = "${WORKDIR}/git"
+
+inherit cmake gettext
-- 
2.34.1


