Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB588CF8577
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 09:25:24 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30603.1763630711745416084
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 01:25:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=MOSfSU+5;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b38de7940so291667f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 01:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1763630710; x=1764235510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5fTfVN1TzK7NhPaOlQ1n4Afu1d9GJ5bqlVMaZev9Fc0=;
        b=MOSfSU+5QqmPghEUo4A6Xfbq+ckZuRCJE1xfwl6X15AB1qhmA09PLf7GHVH/fYtLxz
         vKP2sU5cTU3eQ3OdWWSYyiGgsQgzML6sNdfigQ6aFYcTUuslFkQ48Sf0X5F6hkIdob74
         YGl1rmKma3QRsNAd2Y4Lfb30eh5X43Sltb+rE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763630710; x=1764235510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fTfVN1TzK7NhPaOlQ1n4Afu1d9GJ5bqlVMaZev9Fc0=;
        b=hOnwGdjFzevZ2YeJrEvuOCFhjo2LAQyrOeubjOp8X0S/V+hkKa3yoO0xyoeQyKpT00
         4r0pjadNXJPkYkicRVLFjqmsxvIlvNDIDVCm6T6mrmK1iz/AleQ1e6Ua+MGTi6DMgyiF
         vqoKsmG9k3T+nyGOVyB+giiynSCSkfhtSZh/ch+c1QJAeCq0TTGuugnSv25QislBQgbv
         eFj+At5IGbmSyYHxhHF4D3z7Rk2Pnj9gfIMBu6QGNqUPbEym3jpip6dTCeca426zwSWV
         7ZJR1dQXnbgVr0D4guMY3e4vitbVDfBsxrksPjDv1iovB5DrYMFmpTzN+4bE2LJyom0X
         pk/w==
X-Gm-Message-State: AOJu0Yx9jVThWQrpFbnpQ5uNFVuaWVbaIBWU84hKe+f0aIs730ddXoju
	z+DaKPOVWe2spUKxcxXJhkufzrwbIuN5gBK6ShroFEZPC3Hcs90fvZy77hkEuQM6tm0CBbcLezf
	cGOmo
X-Gm-Gg: ASbGncus77VzfAdPhzOQ25uNBhPIF4SNwOHpT4zACN3P0vk57P1B8SCW7Za9z9AsuOn
	YldvR2iJDRsKxQuCsbbu0jBDmbzZHfRjeih0kDocwnHkadlSAB2HQ1t1QaxV0mwwMj/y3aRQuGI
	BV4zwaGYe08vn0Q0sH/c0d8io8GrYEtKYtV270/8Ev+J8tMHZ2MYk7xYtIiZopPPZuwChHkDV8N
	3PJwcjuM+k8dUPJPlbGQuzkcCtGAhoTXmvHOVeaxBVcnDqNrwLNEoqxO00Lg8k7BWBCKeJJaMg4
	JZEVsY/5IQ/1Vg2Jcus3LKJWegVGQq/cG1E+d6/YCYsTDFdJs6/w2LuVz70iJROazvl+uNaQy6m
	/L4sQZs0D5j6wdPq6DdsMc6cT2uhPsxZ3voHofazU/EhzpSuLxfj9c+Rrn7ouQeR7B3a+KF4Uzo
	Ap7Q7x85ZGUTjdVfu6xXCeXHig
X-Google-Smtp-Source: AGHT+IFiNyoeDI1RjMEacUXWzFrd2ZrwZH67a6kyYE01eKVQWz5YsvPvBajgblaqLNEurTRVH2h1mA==
X-Received: by 2002:a05:6000:2406:b0:42b:2a09:2e59 with SMTP id ffacd0b85a97d-42cb96a9249mr1975552f8f.0.1763630709093;
        Thu, 20 Nov 2025 01:25:09 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fd1sm4374372f8f.11.2025.11.20.01.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 01:25:08 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] exiftool: Upgrade 12.89 -> 13.42
Date: Thu, 20 Nov 2025 11:24:54 +0200
Message-ID: <20251120092454.2543738-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 09:25:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121934

Upgrade to release 13.42:

  - Added warning if tag arguments come before -csv= or -json= in
    a command
  - Added a new CanonModelID and RFLensType (thanks Norbert Wasser)
  - Added ability to read XML as a block from Sony MP4 videos
  - Added "EOS" to the R5 Mark II CanonModelID string
  - Decode ReEditData in Samsung trailer
  - Decode a couple more Sony rtmd tags from MP4 videos
  - Tolerate some types of trailer corruption as caused by Samsung
    Gallery
  - Restrict decoding of MetaImageSize to HEIC files only
  - Fixed issue writing Keys tags to Sony PMW-EX1R videos
  - Fixed behaviour of CSV/JSON import when specifying tags to import
    into an existing list, or when importing ValueConv values (ie.
    "TAG#"), or when specifying a group name of "All"

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../perl/{exiftool_12.89.bb => exiftool_13.42.bb}     | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/perl/{exiftool_12.89.bb => exiftool_13.42.bb} (66%)

diff --git a/meta-oe/recipes-devtools/perl/exiftool_12.89.bb b/meta-oe/recipes-devtools/perl/exiftool_13.42.bb
similarity index 66%
rename from meta-oe/recipes-devtools/perl/exiftool_12.89.bb
rename to meta-oe/recipes-devtools/perl/exiftool_13.42.bb
index 69a4f79815..5d97cf5838 100644
--- a/meta-oe/recipes-devtools/perl/exiftool_12.89.bb
+++ b/meta-oe/recipes-devtools/perl/exiftool_13.42.bb
@@ -7,10 +7,9 @@ LIC_FILES_CHKSUM = "file://perl-Image-ExifTool.spec;beginline=5;endline=5;md5=ff
 
 inherit cpan
 
-SRCREV = "e04534a40925354187e8432d44248229d774f34a"
+SRCREV = "a162a723be10dac03b3037f7cc64c1f9c480448e"
 SRC_URI = "git://github.com/exiftool/exiftool;protocol=https;branch=master"
 
-
 RDEPENDS:${PN} = " \
     perl \
     perl-module-list-util \
@@ -19,3 +18,11 @@ RDEPENDS:${PN} = " \
     perl-module-scalar-util \
     perl-module-compress-zlib \
 "
+
+do_install:append() {
+    # Remove reference to TMPDIR [buildpaths]
+    sed -i -e 's,${TMPDIR},,g' ${D}${bindir}/exiftool
+
+    # Fix shebang and QA Issue [file-rdeps] to use target /usr/bin/env
+    sed -i -e '1s|^#!.*env perl|#!/usr/bin/env perl|' ${D}${bindir}/exiftool
+}
-- 
2.47.3


