Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4753.1794448916413920626
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 18:01:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=HeyubVIM;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15ea896ddc8so5776114c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 18:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794448916; x=1795053716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vqec6ibEy/WyTeftIW9xZJSFohezcWASkKCNh9Ooc30=;
        b=HeyubVIMxxSv500iejvt2LYDy2XNneYPYEXBRA8PNr5Oh2436vmWupcUzjCJOFdlIe
         PEep3kdxP2i/D0XvF36BqoXxUM4sadsF7ZTf7iQunCDPHSL0RX1/3xnmr1vCVfpsFE91
         nxSGR1xoibc5MrfILKDO262+WbAsEEGVOzeN6BQOru25EcJW9MXGs/YDoR+tqgQ6+Min
         0KBdbsE2hqyo2P9gjv49eLtPPSTA2Vg1YZ6kGrhsOd3ExDp0NoN1Y0l35Hs9M3PWfFGj
         5OOcaYfGyAB0JfYvyF6sF+vvYxbsg7ain7b0yxvZrswFdsr51k4miUCoMiHXFMVSI9NA
         WlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794448916; x=1795053716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vqec6ibEy/WyTeftIW9xZJSFohezcWASkKCNh9Ooc30=;
        b=stVIHC8AD5y1PZ4by0Cts8ptm2ssBvoX/U6K2tiOMKwy+0ff/VLubWowUkO86oKEqB
         8PCF02hRVF1M/j99FZTnrCe8FMkAIAozrODo5rLpdQPVhtJI7cQjU9z2zZ41m0wllFl0
         y25iUFPlfziT7sFZx53uYWIhq/Lyz4dSocEvC3+4SB49rncUvmtSB/Iqo08S3ASwcGfK
         a+hVoC2WNqIlgPhmqynh7HQrWxUBl0FHFDg3/epGZ5S/lho5ArS4bNCERmuvVjxJMGYL
         yn52xOvkifSKyl/GyPlIsCmdxdckzyjjA/9vpg4CFvCxhx4UqArcABx5FyHzl56laMmQ
         KcCQ==
X-Gm-Message-State: APuU4Z/JFXFmA42XSouJmgqlMjHVK7tFmkzPo7noAHIhmawzC67TFJTR
	0wjQeUO1sFDvX1FGKqCyktTCPYxKvgP2QZZ1sMTXPo8hw4JAIpxiZgnMBRYE842nv5w=
X-Gm-Gg: AYBFou0rxnuzDzrPSwtDEpJIqdpX8NrsAYOQkrKHKEo5c3u6rRFmTnD6jz8SoYEBJc4
	rV6CXXd3uxw9RXkajxrGZNmJZbf12tKtaPlMetqroo5CYuDj4NDx/pekkD5Ps6GcopOjV9JYqPx
	/HYtH/jZVYyoxn1H9wHUnJT8XY28uvmCqBVH/i5fi2Y3EIV4Oiwj8h9tMDIq+L5mq3AU6zRXXsO
	hrFE9X797ep7+ajc42xeJK7EdP8JTbLdfdflEh132Z1v6AnQfQp7t7NPMpwEsRsc2FlisMqHWLO
	pdtBk57kglYny1WcVxLqdYjBnSb3Z0GHBCbT8qkA1V2VxbvwXdh00NHKgYpxiRuMCc+Dxsx1OZm
	riz6r76jObOsAvY3spVTRBGXZw6myNNClq2Q/yENEdLXN0jtHm+mKdzOdZTYq9FEslWa5910aoX
	AqmZQcOnjWCO/wj/pFqjcEZpvt2yuNk5ma8XmzonGMh4f5hcmbMg5NE2XDN1ZB7g4keTUEXYyXz
	3Z0Rx8HGbJP1tRxHq8Zjehfhf9h6XoqK66pTwu75RIjDgEPVAFxz0Ozw5v1AQoUtQZ5oTIs7xZc
	px+nQjjS8OW9AT++b/SLE64CPbsCsrAOmX0/2CRnr7EX//wsEcoRRvZcRIp11nHfitFoho0mHmj
	Y1wX4aV6cLK0iHr/9rU0VhLGd4Lt3CNrmL/aqkUsAnB7mBAL7Hx5yTUBQEb3pdyRzk/FwZtEmzL
	+uQ9KgsdOwG66gnHSM4OZHVfiscRJ19YEl71xrH5XstiOYm8ruoDC26gfXA+Gh2Ob415AZxL2p0
	7QX/82u+xDtB8Qk4PHvW6qzA8xwc+v8aC4koaU8tVzhpFjA96yQNA95R8hS5KZKJK3vKgQ2G8Ic
	i2tQ
X-Received: by 2002:a05:7022:1e06:b0:1b3:b3de:9231 with SMTP id a92af1059eb24-1b3c02f5747mr3762804c88.14.1794448910711;
        Wed, 11 Nov 2026 18:01:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm41812537c88.10.2026.11.11.18.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 18:01:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] fastfetch: Fix build with lld
Date: Wed, 11 Nov 2026 18:01:46 -0800
Message-ID: <20261112020146.3625290-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 02:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132147
Content-Type: text/plain; charset="utf-8"

Since the link type was switched to dynamic, fastfetch adds
-Wl,--copy-dt-needed-entries to the exe linker flags. LLD does not
support it, so every CMake check that links fails; utmpx.h is then
reported missing and the utmp.h fallback breaks the build:

error: use of undeclared identifier 'endutxent'; did you mean 'endutent'?

Only add the flag when the linker accepts it, map endutxent in the
utmp.h fallback as well, and link libxcb and libX11 explicitly since
LLD cannot pick them up through xcb-randr/xrandr DT_NEEDED entries.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
AI-Generated: Uses Claude Code
---
 ...opy-dt-needed-entries-if-the-linker-.patch | 37 +++++++++++++++
 ...ent-to-endutent-when-utmpx.h-is-unav.patch | 29 ++++++++++++
 ...cb-and-libX11-explicitly-when-not-us.patch | 45 +++++++++++++++++++
 .../fastfetch/fastfetch_2.71.0.bb             |  6 ++-
 4 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/fastfetch/fastfetch/0001-CMake-Only-use-copy-dt-needed-entries-if-the-linker-.patch
 create mode 100644 meta-oe/recipes-support/fastfetch/fastfetch/0002-users-Map-endutxent-to-endutent-when-utmpx.h-is-unav.patch
 create mode 100644 meta-oe/recipes-support/fastfetch/fastfetch/0003-CMake-links-libxcb-and-libX11-explicitly-when-not-us.patch

diff --git a/meta-oe/recipes-support/fastfetch/fastfetch/0001-CMake-Only-use-copy-dt-needed-entries-if-the-linker-.patch b/meta-oe/recipes-support/fastfetch/fastfetch/0001-CMake-Only-use-copy-dt-needed-entries-if-the-linker-.patch
new file mode 100644
index 0000000000..5327a11eca
--- /dev/null
+++ b/meta-oe/recipes-support/fastfetch/fastfetch/0001-CMake-Only-use-copy-dt-needed-entries-if-the-linker-.patch
@@ -0,0 +1,37 @@
+From ded9ccd14cb81e19a3d9335f21f68bf76f0c5ebe Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 11 Nov 2026 17:50:38 -0800
+Subject: [PATCH 1/3] CMake: Only use --copy-dt-needed-entries if the linker
+ supports it
+
+LLD does not implement --copy-dt-needed-entries. With
+BINARY_LINK_TYPE=dynamic the flag is added to CMAKE_EXE_LINKER_FLAGS
+before the configure checks run, so every check that links (utmpx.h,
+glob, wordexp, pthread_timedjoin_np, ...) fails and fastfetch is built
+with those features silently disabled.
+
+Check that the linker accepts the flag before adding it.
+
+Upstream-Status: Submitted [https://github.com/fastfetch-cli/fastfetch/pull/2714]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a2723050..93cb984f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1732,7 +1732,11 @@ if(NOT BINARY_LINK_TYPE STREQUAL "dlopen")
+     message(STATUS "Enabling custom link type: ${BINARY_LINK_TYPE}")
+     target_compile_definitions(libfastfetch PUBLIC FF_DISABLE_DLOPEN=1)
+     if(NOT WIN32)
+-        set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--copy-dt-needed-entries")
++        include(CheckLinkerFlag)
++        check_linker_flag(C "-Wl,--copy-dt-needed-entries" HAVE_LINKER_COPY_DT_NEEDED_ENTRIES)
++        if(HAVE_LINKER_COPY_DT_NEEDED_ENTRIES)
++            set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--copy-dt-needed-entries")
++        endif()
+     endif()
+ endif()
+
diff --git a/meta-oe/recipes-support/fastfetch/fastfetch/0002-users-Map-endutxent-to-endutent-when-utmpx.h-is-unav.patch b/meta-oe/recipes-support/fastfetch/fastfetch/0002-users-Map-endutxent-to-endutent-when-utmpx.h-is-unav.patch
new file mode 100644
index 0000000000..b96285fe5f
--- /dev/null
+++ b/meta-oe/recipes-support/fastfetch/fastfetch/0002-users-Map-endutxent-to-endutent-when-utmpx.h-is-unav.patch
@@ -0,0 +1,29 @@
+From e1bd0ad4ce45a612db3db27687836036a3e76581 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 11 Nov 2026 17:50:39 -0800
+Subject: [PATCH 2/3] users: Map endutxent to endutent when utmpx.h is
+ unavailable
+
+The utmp.h fallback maps setutxent and getutxent but not endutxent,
+which is called unconditionally, so the build fails with:
+
+error: use of undeclared identifier 'endutxent'; did you mean 'endutent'?
+
+Upstream-Status: Submitted [https://github.com/fastfetch-cli/fastfetch/pull/2714]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/detection/users/users_linux.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/detection/users/users_linux.c b/src/detection/users/users_linux.c
+index e304b29c..d39fb765 100644
+--- a/src/detection/users/users_linux.c
++++ b/src/detection/users/users_linux.c
+@@ -15,6 +15,7 @@
+     #define utmpx utmp
+     #define setutxent setutent
+     #define getutxent getutent
++    #define endutxent endutent
+ #endif
+ #if __linux__ || __GNU__
+     #include <netinet/in.h>
diff --git a/meta-oe/recipes-support/fastfetch/fastfetch/0003-CMake-links-libxcb-and-libX11-explicitly-when-not-us.patch b/meta-oe/recipes-support/fastfetch/fastfetch/0003-CMake-links-libxcb-and-libX11-explicitly-when-not-us.patch
new file mode 100644
index 0000000000..5b39e94846
--- /dev/null
+++ b/meta-oe/recipes-support/fastfetch/fastfetch/0003-CMake-links-libxcb-and-libX11-explicitly-when-not-us.patch
@@ -0,0 +1,45 @@
+From 43d0a65e74b2198b53e66b87499e2eb73c8701c4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 11 Nov 2026 17:57:05 -0800
+Subject: [PATCH 3/3] CMake: links libxcb and libX11 explicitly when not using
+ dlopen
+
+fastfetch calls libxcb and libX11 functions directly, but only links
+xcb-randr and xrandr, whose pkg-config files list the core libraries in
+Requires.private. GNU ld resolves them through
+--copy-dt-needed-entries; LLD has no such option and fails with
+undefined symbols such as xcb_connect and XOpenDisplay.
+
+Link libxcb and libX11 explicitly in the dynamic and static link modes.
+
+Upstream-Status: Submitted [https://github.com/fastfetch-cli/fastfetch/pull/2714]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 93cb984f..de6864a2 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1926,6 +1926,20 @@ ff_lib_enable(ELF
+     "libelf"
+     "libelf"
+ )
++# xcb-randr and xrandr only list libxcb and libX11 in Requires.private, but
++# fastfetch calls into them directly, so link them explicitly.
++if(NOT BINARY_LINK_TYPE STREQUAL "dlopen" AND PKG_CONFIG_FOUND)
++    if(XCB_RANDR_FOUND)
++        pkg_check_modules(XCB QUIET xcb)
++        target_link_directories(libfastfetch PRIVATE ${XCB_LIBRARY_DIRS})
++        target_link_libraries(libfastfetch PRIVATE ${XCB_LIBRARIES})
++    endif()
++    if(XRANDR_FOUND OR GLX_FOUND OR VAX11_FOUND)
++        pkg_check_modules(X11 QUIET x11)
++        target_link_directories(libfastfetch PRIVATE ${X11_LIBRARY_DIRS})
++        target_link_libraries(libfastfetch PRIVATE ${X11_LIBRARIES})
++    endif()
++endif()
+ if(ENABLE_LUA)
+     # Lua is a special case since its CMake config does not follow the usual pattern
+     find_package(Lua QUIET)
diff --git a/meta-oe/recipes-support/fastfetch/fastfetch_2.71.0.bb b/meta-oe/recipes-support/fastfetch/fastfetch_2.71.0.bb
index c9ba3519b0..359736e7c0 100644
--- a/meta-oe/recipes-support/fastfetch/fastfetch_2.71.0.bb
+++ b/meta-oe/recipes-support/fastfetch/fastfetch_2.71.0.bb
@@ -10,7 +10,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2090e7d93df7ad5a3d41f6fb4226ac76"

 DEPENDS = "yyjson"

-SRC_URI = "git://github.com/fastfetch-cli/fastfetch.git;protocol=https;branch=master;tag=${PV}"
+SRC_URI = "git://github.com/fastfetch-cli/fastfetch.git;protocol=https;branch=master;tag=${PV} \
+           file://0001-CMake-Only-use-copy-dt-needed-entries-if-the-linker-.patch \
+           file://0002-users-Map-endutxent-to-endutent-when-utmpx.h-is-unav.patch \
+           file://0003-CMake-links-libxcb-and-libX11-explicitly-when-not-us.patch \
+           "
 SRCREV = "8c9d9c0449dd515e0088c4a60a38d2dc40c5ccd0"

 inherit cmake pkgconfig
