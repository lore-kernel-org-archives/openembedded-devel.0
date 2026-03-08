Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382DEEA853E
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 17:58:35 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44456.1772992705203742207
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Mar 2026 10:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bbca64tK;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso88352025e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 10:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772992703; x=1773597503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eAnG35ul8NdwE+/gyQ56izL9EtZVv1ny4xo0WHOQP1s=;
        b=bbca64tKr/yrxTI8N9SI7QFkYYrZ5+XYrvish66IYz/RLV70fyY4HdlTAWkbDb3upp
         g99MJo+7uTtqAZ9em0Lakok4wboYrRfgKF4cXNL5egmHgVZgXXXwMjA1kyRJUQcy+NjZ
         o+Nlsim2yQByQdCiWlSvyjD9pTluKP7r04u0+AK9Vol7TLLc0w/WbeWNZket6VRkcUf8
         /dEoNsdXlVbYgQnjONLlEMjuSuv08HTH9ykFy0ydR3O+mb9O8CRdlaM0KvZk8HeyQEKD
         yPmcbsg+CTaG0W0fCm3Z0Vv4VbwWA3sIZUI3tagSQn3S496R4WYIaPkVX+/Nign+qS8J
         YLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772992703; x=1773597503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eAnG35ul8NdwE+/gyQ56izL9EtZVv1ny4xo0WHOQP1s=;
        b=HHS0rZnIdLL1yiZ0a2ePrXOOg2MR1hHNFEwWrGF3w+qABM6pTgsFJ7xqt3S2vkj6Bo
         HUYmT1tb1s5vEqgMk4lNhzqINySrzfzrRF654ZrsVDGqThLLLoNCms5UM3iAcqvNnUtg
         zWBarCLkH2o84qgx2F1p5HJr0LonzFxudEnxS1rb+1ztCGoPJYi77au27ev4GZb42PYd
         2B64K8zMS5+uum+owhzCf680jnU8cpPdm7WjN3/npuFTIpcPxZdtER9NvdGStG/wed4T
         kNnhASy6ZJ55sbkXmy0tTOsKIHvWBHZQS2Eo+URYsr4Caegd0Nlv6pHVF5ZFb7bfi0dd
         nzwA==
X-Gm-Message-State: AOJu0Yz2JcJ/aPy4VcNhTzLMYTAH3Sc9MM0GTLiO2nzzl6kqrUL0TVfp
	tPorp9Q5Pf2XE5PJCsbWgmaYW/xKTQdLV9BphGpl0DE40xypDSlGdu6HluWGtg==
X-Gm-Gg: ATEYQzytZiBkUBpQSIQl7baMFvURP3rh6FIsNt6ctYzX+VCB7PMRkSQmvXBfz1SXP/K
	420hNQPtNG7d4acUsG0oh84nwJwDa69E7hMZ6x43cGNcYvQNHaY2jEqQ9xlY5dHxWQchvX7xHci
	SE5d4BPzbAS8CsYdXFQjYaLdANaRsRCAjwgqAq1jdCNYzXNCXsvstOAUwl5on6EsZKQekWBav7T
	t+r4BkosFMUn5cY6F6VV0Z1h4JSFG9mjY8PtkXRD9ljSlXrCcbhqojI1wdsnS7x0/UJL4uU7gRx
	HTwi6UYEVNSkX1PCe7e/n6ZEU8JK64uVIvSbpdAbi3BuZeKroDaLRN0DDM1JkoOMnnHHdWoFWpB
	h8Edx/ioBlf8W8F9XhWOFZATXJIgZqZby7LwbBBmmBXnQiS1wjUyN7DDRnOpirFjsX4HLX9q2Wc
	jkEEYPCXbyoPWG+293n9OQ
X-Received: by 2002:a05:600c:6091:b0:483:348a:d3f3 with SMTP id 5b1f17b1804b1-48526951407mr148275575e9.18.1772992703284;
        Sun, 08 Mar 2026 10:58:23 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48539e574b5sm44914455e9.8.2026.03.08.10.58.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 10:58:22 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] exiftool: upgrade 13.48 -> 13.52
Date: Sun,  8 Mar 2026 18:58:22 +0100
Message-ID: <20260308175822.3614638-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 17:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124945

Also fixes CVE-2026-3102

Changelog:

13.52:
  - Added a number of new XMP tags written by Adobe software
  - Added UTF-16 support for a few different metadata types in which only UCS-2
    was previously implemented
  - Added a few more Canon FlashModel values and decode FlashModel for the
    5DmkII
  - Added a new Canon LensType
  - Added some missing file attribute bits to two of the new LNK tags
  - Decode internal serial number for the 5DmkII
  - Decode another OwnerName for the 5DmkII
  - Decode some timed GPS for a couple of new DJI drones
  - Enable WindowsLongPath by default only if Win32::API is available
  - Renamed the Pentax K3III AFInfo tag to AFInfoK3III

13.51:
  - Added a new Nikon LensID
  - Decode more tags from Windows LNK files
  - Decode another LIGOGPSINFO variant
  - Decode some new Canon tags
  - Decode some new Nikon tags
  - Split decoding on Nikon BurstGroupID into separate tags
  - Fixed round-off error in GPSDateTime seconds for camm6 metadata in MP4
    videos introduced in 13.45
  - Fixed bug generating the default-language version of
    QuickTime:LocationInformation

13.50:
  - Added a few new Sony lenses
  - Added a couple of new Canon lenses
  - Decode another Samsung trailer tag
  - Decode BlackLevels from some Canon CRW files
  - Updated Sony maker note decoding for the ILCE-7M5
  - Patched potential MacOS security issue
  - Fixed -list options so reading image files beforehand doesn't add tags to
    the output when running multiple commands using the -execute feature

13.49:
  - Decode a couple of new Samsung trailer tags
  - Disabled decoding of MenuSettings for the Nikon Z6III firmware 2.0 until the
    changes can be worked through in detail
  - Fixed problem where Google Photos had problems displaying ExifTool-edited
    HEIC MotionPhoto images.  Files written by older versions of ExifTool may be
    repaired by re-writing with 13.49 or later

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../perl/{exiftool_13.48.bb => exiftool_13.52.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{exiftool_13.48.bb => exiftool_13.52.bb} (94%)

diff --git a/meta-oe/recipes-devtools/perl/exiftool_13.48.bb b/meta-oe/recipes-devtools/perl/exiftool_13.52.bb
similarity index 94%
rename from meta-oe/recipes-devtools/perl/exiftool_13.48.bb
rename to meta-oe/recipes-devtools/perl/exiftool_13.52.bb
index 0ace1e10eb..f40116144e 100644
--- a/meta-oe/recipes-devtools/perl/exiftool_13.48.bb
+++ b/meta-oe/recipes-devtools/perl/exiftool_13.52.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://perl-Image-ExifTool.spec;beginline=5;endline=5;md5=ff
 
 inherit cpan
 
-SRCREV = "5a760372fadf23effe370ab5e9ca8e2df9448411"
+SRCREV = "02c78a2e051894b57ad8a11024f8cfa05957e725"
 SRC_URI = "git://github.com/exiftool/exiftool;protocol=https;branch=master;tag=${PV}"
 
 RDEPENDS:${PN} = " \

