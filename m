Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 246CAC02198
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 08:49:38 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.17038.1739522964410046089
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Feb 2025 00:49:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=b86L8tEv;
 spf=pass (domain: mvista.com, ip: 209.85.214.178, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21f61b01630so46345765ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 00:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1739522963; x=1740127763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W5AX7GYbcuSERlFdWDLK1wkUkwyQ/vm0hghwNNDsGjQ=;
        b=b86L8tEvzZuJM9Xq7ZvbgxQmlWti2UY7NChMy9UrFOVIja6EdyhC7PzQppn3HvmNPQ
         NyLpt8ed4RyGLBQ1iOzWkZtNFtSNklRSbpYLlT4ZsSqd6oE+mi5PNfTFScnDT1SYpc5u
         3KMOUmFnTCeySM2InpkNk0zCpUUKNWD8oFk/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739522963; x=1740127763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5AX7GYbcuSERlFdWDLK1wkUkwyQ/vm0hghwNNDsGjQ=;
        b=jkGYO8BA9fP/3wGKigHh0yNjQIuLeH1gUFevr151n27C39RpSsb0ZIgPs+bp67U1uf
         p2dCHfxLC6d7+0Y9+LypKOA7U+fKupDPAX8UxK4A2suEW5z3aMQjy3O5VIjBnY9h2cbJ
         lHmTJbnwmg2wVDPMStSt3aHm10Jf/zK4KnakD/H0+oK5CXJr2lFRW50jHvzsoMoi9ybe
         yPsCJtOcJn+WQhcYDLSUHkA4DgmRmSGw6Weopx6LCZ48av58Bz0OK0fAEfLVZbsAeohc
         ep49xp+2YFml8l25wlhfqy8QPR1SeVgBy5vEqU34dQMBbCd6EfTc+rgZ/5z+0eGUaBK5
         Nbmg==
X-Gm-Message-State: AOJu0YzgpIsBG4t9nVS/L5lNf7JVCGImqkfBLpk13eAzBVp2lvOh4fxt
	9KKxpnOQ87b+ZiXO/wk+eHBX+AHkCz3NSW0c9+MqsFnS1EbBI05i7xXbqg8d5KbP66Mqn2pASDs
	tC14=
X-Gm-Gg: ASbGncvfrFRJuY0GlXRmh4voE7aBFr5UvKQ0gvuNLMXAcOQ1rTaU21F6F3VrXw7EDnx
	ykjAskjriznWqY2MZknKuF91g6JhPG+v5wB7y5yJDrIiCPg7mHnGJ4WQLQuLZokg5v5f6tB3t1A
	re8zIO9ly0zMwv1QRAoVH51VaCE0c2pcF/syb+yoh/MXg2GVeagJKELxejo9NyUCnQRGHFHyewV
	u3e8aVa8dF7M12lG29idFPaJFzr3+e4YxeJICzH+E+/4d4NKlooaulu8vaWlPAB8E0ZfO7ELxGY
	Q3M5ynYVO2h3HL06t14DYvJ6XCYgcQ==
X-Google-Smtp-Source: AGHT+IElTN4caVHrNCzjDNYcVAMABPHSNvI580WEvkolxL89m3vBcvVHPVwTHyqybuM/eaOGyqyGhw==
X-Received: by 2002:a05:6a00:6187:b0:727:39a4:30cc with SMTP id d2e1a72fcca58-7323c45a4f4mr8288360b3a.1.1739522962508;
        Fri, 14 Feb 2025 00:49:22 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:882c:7b82:62b9:1b34:c9f8:f260])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324275bbb0sm2610719b3a.121.2025.02.14.00.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 00:49:21 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH RESEND] openjpeg: upgrade 2.5.0 -> 2.5.3
Date: Fri, 14 Feb 2025 14:19:05 +0530
Message-Id: <20250214084905.19009-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 08:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115481

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


