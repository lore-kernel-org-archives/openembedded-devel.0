Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A93E7719F
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 10:04:55 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.13922.1736762688378122488
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jan 2025 02:04:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DjNSMDku;
 spf=pass (domain: mvista.com, ip: 209.85.214.171, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21654fdd5daso66694065ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 02:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1736762687; x=1737367487; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W5AX7GYbcuSERlFdWDLK1wkUkwyQ/vm0hghwNNDsGjQ=;
        b=DjNSMDkupGiLLPYsXw3gznV6qaZsF8Rh3qPIP5nqO6if8bOVrX8zcYyL/YJe/zqa6x
         SStOiDaoRyudXhlAgzyCiUyCfHSow+qi9aIdRerGvV4oX3UDN/iXiWOcwEl002DfRgT6
         DYljUJDhh7KrYkFNjKbo/3zkGk6xRmjV+RwnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736762687; x=1737367487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5AX7GYbcuSERlFdWDLK1wkUkwyQ/vm0hghwNNDsGjQ=;
        b=JNT4PawZjtmMJwMv1HT7i0a49n2Z1PAQZdmptr8Ad4B6AO3j6q3YgnSU6X2m+Se3Gx
         Y+GB9ju/CMyLaQ207ntYsp6Myl16raPLaqWpl/TvxKg2No8upD+BSHOhXFSROu7iWsXD
         hBzAn1xLRri3mz8K4u7fIU+ITf7CnRcQZZbtgPtxhhBdg/3uX/O4nzXFJcDL3NqS4Pnz
         pAPU00uKz61C6q4AegH6DhMUk441NDNmz5POLOBBsVM2jbnYe8FD4y0fz8+ETwD3ZDG7
         jocVNBTqbs+THIiAyAeaPKUFRZoWRhFX7Y5k2b2ax3h1vVqM0xEy2VIkxX6ND5mrEmTw
         Z70g==
X-Gm-Message-State: AOJu0YzcvIO4zXj+N1a2/SA58dkQjLCeuXa6+05cav83y4orzGkFWNId
	77ibeb1s1bHcXIKawAAIaQgTztfxFFGnpeFMQ9Wc77A1G+Rrx8K11AJ4zlZv1nkxMN4s35F9L2H
	7BMo=
X-Gm-Gg: ASbGncuVdGutRwacavKWi9r/RHBsXCK1d6iP6f5xAoZI/0LGsmeiFtCTyEUIUT3l8ZO
	N0N/UnMa/DyxHbgLGghkzHezw7Dty0ZgxogB5sH0hA96VJ5vF6N6n0dzK3axpnvMKn6r6xpCGEy
	ghXMKPc/aZwT5GVlBw/8M3xwQJN3kWc9ejBNdeduFnLIow/Ebh78n//33JttS2dDRdvUQWvpygR
	N0DF3d3EA1WAmIlauN8AXL9pxjXazf03yZRANyo1zE1WM53nx679xiGVt5fdjvdivb+va0=
X-Google-Smtp-Source: AGHT+IGO6sExI9JCVKPUU+OSttYYbh9UwTS41RFE9QWfjcjXoROBUhhMGay/2cIXx4o9IWsyreUnRg==
X-Received: by 2002:a05:6a21:3d87:b0:1e8:b17a:a556 with SMTP id adf61e73a8af0-1e8b17aaaf4mr15002675637.15.1736762686970;
        Mon, 13 Jan 2025 02:04:46 -0800 (PST)
Received: from MVIN00020.mvista.com ([2405:201:c01c:7015:4cda:bdeb:c2c0:3672])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4065a544sm5805296b3a.96.2025.01.13.02.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 02:04:46 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][scarthgap][PATCH] openjpeg: upgrade 2.5.0 -> 2.5.3
Date: Mon, 13 Jan 2025 15:34:35 +0530
Message-Id: <20250113100435.141849-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 10:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114828

From: Vijay Anusuri <vanusuri@mvista.com>

Includes fix for CVE-2024-56826 and CVE-2024-56827

ChangeLog:
https://github.com/uclouvain/openjpeg/blob/v2.5.3/NEWS.md

* Refresh 0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...sk-cmake-to-export-binaries-they-don-t-make-.patch} | 10 +++++-----
 .../openjpeg/{openjpeg_2.5.0.bb => openjpeg_2.5.3.bb}  |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-graphics/openjpeg/openjpeg/{0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch => 0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch} (75%)
 rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.5.0.bb => openjpeg_2.5.3.bb} (82%)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch
similarity index 75%
rename from meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch
rename to meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch
index 0ba13cf88..2e25ecc7e 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch
@@ -1,4 +1,4 @@
-From 4681de07e21f17aa28710d3a51fabe7da60463f9 Mon Sep 17 00:00:00 2001
+From 805ce4d40c5aaae12aa73452ff07babe8eb43a62 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Fri, 28 Sep 2018 00:38:50 +0200
 Subject: [PATCH] Do not ask cmake to export binaries - they don't make it
@@ -15,17 +15,17 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/src/bin/jp2/CMakeLists.txt b/src/bin/jp2/CMakeLists.txt
-index 4324c36d..2c11fe02 100644
+index 26156bcb..9eff04aa 100644
 --- a/src/bin/jp2/CMakeLists.txt
 +++ b/src/bin/jp2/CMakeLists.txt
-@@ -66,7 +66,6 @@ foreach(exe opj_decompress opj_compress opj_dump)
+@@ -64,7 +64,6 @@ foreach(exe opj_decompress opj_compress opj_dump)
    endif()
    # Install exe
    install(TARGETS ${exe}
 -    EXPORT OpenJPEGTargets
-     DESTINATION ${OPENJPEG_INSTALL_BIN_DIR} COMPONENT Applications
+     DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT Applications
    )
    if(OPJ_USE_DSYMUTIL)
 -- 
-2.14.4
+2.25.1
 
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
similarity index 82%
rename from meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb
rename to meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
index f2d74078e..231bf8457 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c648878b4840d7babaade1303e7f108c"
 DEPENDS = "libpng tiff lcms zlib"
 
 SRC_URI = "git://github.com/uclouvain/openjpeg.git;branch=master;protocol=https \
-           file://0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
+           file://0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
            "
-SRCREV = "a5891555eb49ed7cc26b2901ea680acda136d811"
+SRCREV = "210a8a5690d0da66f02d49420d7176a21ef409dc"
 S = "${WORKDIR}/git"
 
 inherit cmake
-- 
2.25.1


