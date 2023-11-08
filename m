Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B60C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 12:34:06 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.12438.1699446841026782538
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 04:34:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=MYtxroh0;
 spf=pass (domain: konsulko.com, ip: 209.85.208.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-53dd3f169d8so11393187a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 04:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699446839; x=1700051639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W0SVmtWK5B0nnhznqOQkdePtW455PfJLoW6wEj3wRo4=;
        b=MYtxroh0030r6whFO6y9027vhSgAMWRDbz81MY6iExSwFuo2wwGIB3nd3mXhCz8uwA
         gWvUBGrKUsihnOg5nLf++LCVAVes/VUNcl9LbN4D4zxCckoLpVbylJgLYhv6Y7165YPX
         mnYP1ahezuTcEsnS1/lI58oQqyCZGVJ3SawWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699446839; x=1700051639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W0SVmtWK5B0nnhznqOQkdePtW455PfJLoW6wEj3wRo4=;
        b=IySPraN/rHQi0Ut/6EqV3mR1DDydhYjIVPBsCxc6mkLbQMoxGlg36Z2yNs7gjxCRBy
         GQr4MkkdecfwihQrbAmI2LK5I25891id7CYWZlE15/teiqY3TsyzN7fyMWnCavkrD0j5
         BtHxTDQsz4RVgprDfRsLjnaC8RcWGIKac6/ylS8PtfNDwdwLCRhPrkIaqeLpBqgaONWW
         bHHrGpiJXEUClM7eg42u8mQCHE7JP2A+DpLOcA0r/j3RsZjV+CPEvHdJHD0kAwYBcYX8
         EDhNWnnzUfh+o6yFgqqidQFlLNlpT9zA2bVx/r33fFqVZzG1bAiMoG9R3GyZtWpeWKQN
         fmbg==
X-Gm-Message-State: AOJu0YxHPIG/jEw3bICSOogoBSJmcM/xV0Z6c+mLypSJ4FRa2LaoydkN
	vvg/MZzCAFbaVoppXiRq/YL6qyx/KuZ1ao3g5GI=
X-Google-Smtp-Source: AGHT+IHRggYNDP4psd0drxAt/iQ+bTazgYIogkPtMHJ0eTZ08wKFFiYu8bDpR+DA0rTCSWPnlcO8Pg==
X-Received: by 2002:a17:907:3189:b0:9d6:e1b5:1afa with SMTP id xe9-20020a170907318900b009d6e1b51afamr1359590ejb.46.1699446839146;
        Wed, 08 Nov 2023 04:33:59 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id gz12-20020a170906f2cc00b009adc7733f98sm982964ejb.97.2023.11.08.04.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 04:33:58 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] exiftool: add recipe
Date: Wed,  8 Nov 2023 14:33:56 +0200
Message-Id: <20231108123356.2321371-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 12:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106474

Add ExifTool, a platform-independent Perl library plus a command-line
application for reading, writing and editing meta information in a
wide variety of files. Version 12.69 brings:

- Added support for DNG version 1.7.0.0
- Added a new XMP-GCamera tag
- Added a number of new Nikon Z lenses (thanks Warren Hatch and Stefan)
- Added a number of new XMP-crs tags
- Extract XML metadata from some Hasselblad images
- Tweaked -fast2 option to read metadata from inside mdat atom of HEIC images
- Patched FFF reader to be more tolerant of the mess made by incompetent
  Hasselblad programmers (wrong IFD count for some values)
- Patched WebP reader to be more tolerant of the mess made by incompetent
  Google programmers (EXIF with wrong header and XMP with wrong ID)
- Fixed problem which could cause "use of uninitialized variable" warnings
  when reading images from some Nikon cameras
- Fixed List type for new XMP-photomech:CreatorIdentity tag

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/perl/exiftool_12.69.bb   | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/exiftool_12.69.bb

diff --git a/meta-oe/recipes-devtools/perl/exiftool_12.69.bb b/meta-oe/recipes-devtools/perl/exiftool_12.69.bb
new file mode 100644
index 000000000..09b45ada7
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/exiftool_12.69.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Exiftool"
+DESCRIPTION = "ExifTool is a platform-independent Perl library plus a command-line application for reading, writing and editing meta information in a wide variety of files."
+HOMEPAGE = "https://exiftool.org/"
+SECTION = "libs"
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://perl-Image-ExifTool.spec;beginline=5;endline=5;md5=ffefffc98dab025cb49489bd4d88ee10"
+
+inherit cpan
+
+SRCREV = "d521eba31a3d1753f53ee251cd6879900a0275b5"
+SRC_URI = "git://github.com/exiftool/exiftool;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+
+RDEPENDS:${PN} = " \
+    perl \
+    perl-module-list-util \
+    perl-module-overload \
+    perl-module-file-glob \
+    perl-module-scalar-util \
+    perl-module-compress-zlib \
+"
-- 
2.39.2


