Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.8761.1612035472956500425
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jan 2021 11:37:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LIdyTuVU;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id o7so9183923pgl.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Jan 2021 11:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=dVDYuS+JHrzeDcaD0g6rRiG7OzCbPgiLfKSeRI+7bD0=;
        b=LIdyTuVUUjWg5aPap/oeAGWECss1lU2pGd5K2AC5BAKqcPky85opXhOH7CbDDQ8dEM
         Nflx2wJqpHxRlGVfrA7yUkv/APpKKQfw980D7bulbczqZSUWJyUx8DIUPNAdGPzILN7B
         6WPa4lOzKkzDxT9hZOFwnQgaBNyS39SnOAGXWsEo6G85rZTUExLIewCHJD1tvv6GDZOe
         gSZIHLQ867na+dTHptATCPTHyXwngyJ5p6808epBcHiogYe4H1/trm/1aQwANDw4g6pl
         ft8BeSnlUVt1r4crK+ATCz35l3GpxG6P6JkGLzE8PA60UdUsame1Ijx4AHlJ8VKjE/tU
         +MHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=dVDYuS+JHrzeDcaD0g6rRiG7OzCbPgiLfKSeRI+7bD0=;
        b=bUHlmJ06yNzm1WTTtQhNfbzVWzhgjM99LUU58bYB9QrOgDPG5j6rLZ6mLeOsd/Twxm
         oGnCq6Jaxa1EYm6LEe69zlLeAHlmmPY2f34XZDO3mBsdM/xlsTe9Av/gQ7EFH5Mq2FO+
         QRm49eBbXQkI5HqP3NaANGeWk4+B0fZ0vKr+Zy0ctg1XbJg2e+Qap66tBu2BlUWbJ+H8
         hGQni6n8hZ/tY4+M91aChuWEPuZx+GotnB2SR7reaI9Sl1xUKIkBYHzVUMsIMh4z8oq5
         Vl/peuX8w554ucRrWXcoTl3EYL0R3UvCmntS1fhpeAhbG1zHSKJIl9s6thDSW9gJht70
         CeUA==
X-Gm-Message-State: AOAM5309H2hCJI4PsfYQ5kOTgYUfbr+ZVDpnHcQ9xZVP+BlfyLXDFevQ
	Lrt8ak/YNNWmiUkUFzuxnfRXrZZBabtcqw==
X-Google-Smtp-Source: ABdhPJwagDw5wlLsjZCa/BD9Fh9TkMoCsu0LPrnuuXRP1eUW4Usu37hZwEnVCMUbZT7bkEu090quRA==
X-Received: by 2002:a63:704c:: with SMTP id a12mr9788252pgn.360.1612035472345;
        Sat, 30 Jan 2021 11:37:52 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:315d:c5e7:1295:54a9])
        by smtp.gmail.com with ESMTPSA id q197sm12518096pfc.155.2021.01.30.11.37.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 11:37:52 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 07/13] rapidjson: Upgrade SRCREV to latest
Date: Sat, 30 Jan 2021 11:37:32 -0800
Message-Id: <e5499dc4bcbf4ea6456d65fa917547bec7a190a3.1612035229.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612035229.git.akuster808@gmail.com>
References: <cover.1612035229.git.akuster808@gmail.com>

From: Harpritkaur Bhandari <harpritkaur.bhandari@kpit.com>

Upgrade SRCREV to latest as it fixes the below issue:
Running UndefinedBehaviorSanitizer on projects that use
rapidjson triggers 'applying non-zero offset <NN> to null
pointer' findings in 'internal/stack.h' which are hard
to suppress by library users.
Removed "0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch"
as the changes are already incorporated in the latest
codebase.
As per abi-compliance-checker report the source compatibility
and binary compatibility between previous SRCREV
6a905f9311f82d306da77bd963ec5aa5da07da9c and current
SRCREV 0ccdbf364c577803e2a751f5aededce935314313
is 100% and this patch is already tested on 64bit
ARM (aarch64) in a product with on target CI tests.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 04d9ea0ba7ece968244bf049893dd5636675b76f)
Signed-off-by: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
index e3ed9c6a17..5b5c8b2570 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -4,10 +4,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://license.txt;md5=ba04aa8f65de1396a7e59d1d746c2125"
 
-SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1 \
-           file://0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch"
+SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1"
 
-SRCREV = "6a905f9311f82d306da77bd963ec5aa5da07da9c"
+SRCREV = "0ccdbf364c577803e2a751f5aededce935314313"
 
 PV = "1.1.0+git${SRCPV}"
 
-- 
2.17.1

