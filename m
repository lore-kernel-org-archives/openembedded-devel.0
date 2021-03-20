Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web09.179.1616282462441935186
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Mar 2021 16:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UU0rcnDx;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id h20so4669128plr.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Mar 2021 16:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1TdRwgs+6vJBZdwcOxRFSfZJFjHUNQUjuHhmfgjYkTs=;
        b=UU0rcnDxoeANouVO/bXK/2OtoC9r5ILweAqodIYdBU/AUKB3qCxeWCvXqpZTxDzYPx
         qeoPTcdRUOzIUiCuRShJLLvq3OFf3dCvRwtf3r/b0CseZ04/ifV5EsHPbNXotVZrglWI
         I2sRCMSC1BhRO0zuZSkm2HKhDgMb+96uinRP1lZJOdF2MM1TIrnw9ObeHCPM4mWnzfmT
         qOD/U5Do2nCrf32MFUlU5H8UagQdMykwFBUE/8qLUBYWaT8JCAuv5ua8kxnmOvRKBxO9
         rqqkB4aklV7b62OMl76xEdOcE26fwaPX3/c1ZQzQwaJeS3iMOEhHaQyuTtZRPGLK2qWL
         ydsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1TdRwgs+6vJBZdwcOxRFSfZJFjHUNQUjuHhmfgjYkTs=;
        b=rpozMT4AWyQTWkp/1oD4vNxDXw+ipam+qr6zTFK/q55/QBKT7H8FciMUZ6Vb1RLaoc
         dvcg/xPPKzZVHI+2XBP+J/dZMi+2saPaOlI/GYk27FK5RgKYZRnxZ0dFXPU+70oEausc
         zFdSfR7cISEwZycLqt1GDGQWDE3H/d87Eys27CIFvP5tjAgDrv35v+p2o+QuCAg8OMnQ
         P69ndRGJvXCy7N+M+VEJEVOhjwOsKnmaKxnUa59KzDLVGxrSBnSP6ijhULMt1kzHe6qC
         yObWpmBnNCaLR68JCFu82BccV/fQ35LEq24zMQ2cTKYVIFZKWlYx+lkhZ7nSbCkB9tT/
         bLrg==
X-Gm-Message-State: AOAM5328RRNyXbfPwoH3Vkz2zhlGClUa5ag8V7A+R/xGFpueEa2dRdW+
	/8kQJibqvh8hut2emJL0+f/d6NU2ICqnWQ==
X-Google-Smtp-Source: ABdhPJzw6hGKQHZFKVB5gddz1wG6iaBUzmWM63M/0ZtFlKHdH/RWfEoOTA4oadVJiWqVgRrD8WGSeQ==
X-Received: by 2002:a17:90a:14c3:: with SMTP id k61mr5459035pja.206.1616282461563;
        Sat, 20 Mar 2021 16:21:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b117])
        by smtp.gmail.com with ESMTPSA id s194sm9599494pfs.57.2021.03.20.16.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 16:21:01 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] xxhash: Remove recipe
Date: Sat, 20 Mar 2021 16:20:59 -0700
Message-Id: <20210320232059.2685047-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It has been moved to oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/xxhash/xxhash_0.8.0.bb    | 21 -------------------
 1 file changed, 21 deletions(-)
 delete mode 100644 meta-oe/recipes-support/xxhash/xxhash_0.8.0.bb

diff --git a/meta-oe/recipes-support/xxhash/xxhash_0.8.0.bb b/meta-oe/recipes-support/xxhash/xxhash_0.8.0.bb
deleted file mode 100644
index e437d4d15b..0000000000
--- a/meta-oe/recipes-support/xxhash/xxhash_0.8.0.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Extremely fast non-cryptographic hash algorithm"
-DESCRIPTION = "xxHash is an extremely fast non-cryptographic hash algorithm, \
-working at speeds close to RAM limits."
-HOMEPAGE = "http://www.xxhash.com/"
-LICENSE = "BSD-2-Clause & GPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b335320506abb0505437e39295e799cb"
-
-SRC_URI = "git://github.com/Cyan4973/xxHash.git;branch=release;protocol=git"
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-
-SRCREV = "94e5f23e736f2bb67ebdf90727353e65344f9fc0"
-
-S = "${WORKDIR}/git"
-
-do_compile () {
-	oe_runmake all
-}
-
-do_install () {
-	oe_runmake DESTDIR=${D} install
-}
-- 
2.31.0

