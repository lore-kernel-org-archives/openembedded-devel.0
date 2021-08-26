Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.35221.1630002603377956376
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Aug 2021 11:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SJ0NOud7;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so7201156pjr.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Aug 2021 11:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EWGO1MtPLEZLPvhvVGziqSL/XU2wd/1FaohD/wEZnFE=;
        b=SJ0NOud7C1qCng3FBbH1j/FTggwdMv/LrulgYzCvg2yJoZH1fDkGlAAMh/9rDCAJyv
         hvUHRMKPRzVFXhb9zXhvy5IqFgs6DI6YpFTsT2/Kbv/g+PBT98J73cuHnFsJGlk/Uvqc
         LiQ0s6QRESkxqD5v57ZKaZmG6sTkTmvpne6RtguusT4PuUQrtA/DCgUy26F37WfsDFOZ
         FK5kdvktMak+4zcgmZB5ggBRcHiSMMrCZZEpt6O+J+II6zXlhJb2pH1SLLupjaIQ52px
         /KS6fe4loL4RAtDBlMR16HXO4XclhzCT5Rf8vm6/alKPXhwuQIPguZm7IShlDM7P6vw4
         anbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EWGO1MtPLEZLPvhvVGziqSL/XU2wd/1FaohD/wEZnFE=;
        b=grU+HtiCbUP7sKcia3gMP9tsxnqCM5kpmTn9RJfjEPvSBfsm/jmaQ8RKiFZ22CPr3h
         hswcpTS81epuw0tg8Es5Jw0ikwXqYvCMH1wjGM4HtopKr9dZym7+/cyK8KhX6wCg0LAL
         TyO+ORCscPQurhtrl3wGnV2+6E1IbMovSOmcaEdTxK6MDjh4cCUzwISyCq2HihvkUfEq
         7csEfJFDw6fk8MalliAqc+e0KN/RC4wkea9k4TarySRXwqe/G+N7cM1EHzW88zzGIMM+
         shR61bZFXi+7I+OWFXZuYX2mn4Xq50uzp+ryexggNQrIC5vULz+Ow6RZwOiEBWTF8uYj
         stCw==
X-Gm-Message-State: AOAM532GtP98+s99qS2VDKS/LDC7JYlTtZ5a5Za5q//UK9yR4wvR/qBd
	h6poJzzjF7z/lpkV6hIxn9llmlcTHqmXgA==
X-Google-Smtp-Source: ABdhPJw/rhsW8DQ6aC8WEvojNuckjSdlPIUzD9uQY3M8oxmgn7sLyA1XzfV+SxNLKlbhKT5olA4jaQ==
X-Received: by 2002:a17:90a:3fca:: with SMTP id u10mr15074580pjm.148.1630002602669;
        Thu, 26 Aug 2021 11:30:02 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1d09])
        by smtp.gmail.com with ESMTPSA id w9sm9732711pjc.14.2021.08.26.11.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 11:30:02 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ruslan Bilovol <rbilovol@cisco.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [meta-oe][PATCH] libnss-nisplus: Remove
Date: Thu, 26 Aug 2021 11:29:57 -0700
Message-Id: <20210826182957.3558448-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The support for NIS+ has been dropped in libnsl2 [1]
moreover the upstream repository has been archived [2] which indicates that
this component is no more actively maintained

[1] https://github.com/thkukuk/libnsl/commit/74c9cdf0ee0cc1a21936a20dd4eb4542faa03867
[2] https://github.com/thkukuk/libnss_nisplus

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ruslan Bilovol <rbilovol@cisco.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  3 +-
 .../libnss-nisplus/libnss-nisplus.bb          | 31 -------------------
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libnss-nisplus/libnss-nisplus.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index c3f4867071..f58905f0bc 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -395,7 +395,6 @@ RDEPENDS:packagegroup-meta-oe-extended ="\
     libusbmuxd \
     liblockfile \
     liblogging \
-    libnss-nisplus \
     libpwquality \
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "libreport", "", d)} \
     libserialport \
@@ -434,7 +433,7 @@ RDEPENDS:packagegroup-meta-oe-extended:append:libc-musl = " libexecinfo"
 RDEPENDS:packagegroup-meta-oe-extended:append:x86-64 = " pmdk libx86-1"
 RDEPENDS:packagegroup-meta-oe-extended:append:x86 = " libx86-1"

-RDEPENDS:packagegroup-meta-oe-extended:remove:libc-musl = "libnss-nisplus sysdig"
+RDEPENDS:packagegroup-meta-oe-extended:remove:libc-musl = "sysdig"
 RDEPENDS:packagegroup-meta-oe-extended:remove:mipsarch = "upm mraa minifi-cpp tiptop"
 RDEPENDS:packagegroup-meta-oe-extended:remove:mips = "sysdig"
 RDEPENDS:packagegroup-meta-oe-extended:remove:powerpc = "upm mraa minifi-cpp"
diff --git a/meta-oe/recipes-extended/libnss-nisplus/libnss-nisplus.bb b/meta-oe/recipes-extended/libnss-nisplus/libnss-nisplus.bb
deleted file mode 100644
index 602e963752..0000000000
--- a/meta-oe/recipes-extended/libnss-nisplus/libnss-nisplus.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-# Copyright (C) 2019 Ruslan Bilovol <rbilovol@cisco.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-SUMMARY = "NSS module for glibc, to provide NIS+ support for glibc"
-
-DESCRIPTION = "This package contains the NSS NIS+ plugin for glibc.\
-This code was formerly part of glibc, but is now standalone to\
-be able to link against TI-RPC for IPv6 support."
-
-HOMEPAGE = "https://github.com/thkukuk/libnss_nisplus"
-LICENSE = "LGPL-2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-SECTION = "libs"
-DEPENDS += "libtirpc libnsl2"
-
-PV = "1.3+git${SRCPV}"
-
-SRCREV = "116219e215858f4af9370171d3ead63baca8fdb4"
-
-SRC_URI = "git://github.com/thkukuk/libnss_nisplus \
-          "
-
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-
-BBCLASSEXTEND += "native nativesdk"
-#
-# We will skip parsing this packagegeoup for non-glibc systems
-#
-COMPATIBLE_HOST:libc-musl = 'null'
--
2.33.0
