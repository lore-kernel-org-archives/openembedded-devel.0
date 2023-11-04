Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C880CC05021
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 04:20:57 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.4060.1699071648232957800
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 21:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KPRxbt7q;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GA+Ibg2y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b988fdeff-bc232ee9-e4d9-47af-b983-11510de48c62-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699071647;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ShlEfuH7jd+jnug5rxcUCAtIMKjd6FOOYnayeWEqoT4=;
	b=KPRxbt7qetsQ4ORizJy9T99CEqIGtCTJuTrB63Cxs8SzVMUPpT9cXF2qXo0jMSRE
	r9A8pDK2yKgXcZWljeORobsxWeLpHD+SXO5QMob0AXbDw6oDbZt5k+4+KivpOZCQz0y
	TUXomRSgqGRT0M0OmCe7C60exRbNakN65jL2SaWk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699071647;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ShlEfuH7jd+jnug5rxcUCAtIMKjd6FOOYnayeWEqoT4=;
	b=GA+Ibg2ywNn2tMnFIKby1GqWnOdMh1YMEBp8g2UZgsl4P2vuanHRQVv4Kc+u1q3v
	V5z9ippMueqLudgrS0sLiHse22rOrYA9Klue4y1rU84ACsiekIl2czYaNoxIm6r6Tcj
	eVuA6UcbOK/4ELXot8tUH9OJ5b0H+djfnm3Ogiuw=
Content-Type: multipart/mixed; boundary="===============3557819194551502173=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] tinyalsa: upgrading to 2.0.0 FAILED
Message-ID: <0101018b988fdeff-bc232ee9-e4d9-47af-b983-11510de48c62-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 04:20:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 04:20:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106270

--===============3557819194551502173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *tinyalsa* to *2.0.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-tinyalsa-upgrade-1.1.1-2.0.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 99e74e10b293172673215fd4f8a69ed188256c8d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 04:12:13 +0000
Subject: [PATCH] tinyalsa: upgrade 1.1.1 -> 2.0.0

---
 .../recipes-multimedia/tinyalsa/tinyalsa.bb   | 37 ++++++++++++---
 ...L_-path-instead-of-hardcoding-bin-li.patch | 46 -------------------
 2 files changed, 31 insertions(+), 52 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-Use-CMAKE_INSTALL_-path-instead-of-hardcoding-bin-li.patch

diff --git a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb
index 68cf8795a..50a3e33af 100644
--- a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb
+++ b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb
@@ -1,16 +1,41 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- NOTICE
+# +++ NOTICE
+# @@ -1,4 +1,5 @@
+#  Copyright 2011, The Android Open Source Project
+# +
+#  Redistribution and use in source and binary forms, with or without
+#  modification, are permitted provided that the following conditions are met:
+#      * Redistributions of source code must retain the above copyright
+# @@ -9,6 +10,7 @@
+#      * Neither the name of The Android Open Source Project nor the names of
+#        its contributors may be used to endorse or promote products derived
+#        from this software without specific prior written permission.
+# +
+#  THIS SOFTWARE IS PROVIDED BY The Android Open Source Project ``AS IS'' AND
+#  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+#  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+# 
+#
+
 DESCRIPTION = "TinyALSA is a small library to interface with ALSA in \
 the Linux kernel. It is a lightweight alternative to libasound."
 HOMEPAGE = "https://github.com/tinyalsa/tinyalsa"
 SECTION = "libs/multimedia"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://NOTICE;md5=dbdefe400d894b510a9de14813181d0b"
+LIC_FILES_CHKSUM = "file://NOTICE;md5=e04cd6fa58488e016f7fb648ebea1db4"
 
-SRCREV = "8449529c7e50f432091539ba7b438e79b04059b5"
-SRC_URI = "git://github.com/tinyalsa/tinyalsa;branch=master;protocol=https \
-           file://0001-Use-CMAKE_INSTALL_-path-instead-of-hardcoding-bin-li.patch \
-          "
-PV = "1.1.1+git${SRCPV}"
+SRCREV = "1c5fb68ced57d838f2b7ecd0c00bc1fefc9ab60d"
+SRC_URI = "git://github.com/tinyalsa/tinyalsa;branch=master;protocol=https"
+PV = "2.0.0"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-Use-CMAKE_INSTALL_-path-instead-of-hardcoding-bin-li.patch b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-Use-CMAKE_INSTALL_-path-instead-of-hardcoding-bin-li.patch
deleted file mode 100644
index 6f9c39996..000000000
--- a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-Use-CMAKE_INSTALL_-path-instead-of-hardcoding-bin-li.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From fe4f3c2a37a81201f463ff962364f014f50c9896 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 16 Dec 2019 22:58:41 -0800
-Subject: [PATCH] Use CMAKE_INSTALL_<path> instead of hardcoding bin/lib/
- install paths
-
-Helps fix build/packaging issues on machines where default libdir is not
-lib but say lib64
-
-Upstream-Status: Submitted [https://github.com/tinyalsa/tinyalsa/pull/143]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 14 +++++++++++---
- 1 file changed, 11 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index cb31c58..1cc4a85 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -41,12 +41,20 @@ add_util("tinymix" "utils/tinymix.c")
- install(FILES ${HDRS}
-     DESTINATION "include/tinyalsa")
- 
-+if(NOT DEFINED CMAKE_INSTALL_LIBDIR)
-+    set(CMAKE_INSTALL_LIBDIR lib)
-+endif()
-+
-+if(NOT DEFINED CMAKE_INSTALL_BINDIR)
-+	set(CMAKE_INSTALL_BINDIR bin)
-+endif()
-+
- install(TARGETS "tinyalsa"
-                 "tinyplay"
-                 "tinycap"
-                 "tinymix"
-                 "tinypcminfo"
--    RUNTIME DESTINATION "bin"
--    ARCHIVE DESTINATION "lib"
--    LIBRARY DESTINATION "lib")
-+    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
-+    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
- 
--- 
-2.24.1
-
-- 
2.39.2


--===============3557819194551502173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4916 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3054 cached, 1 parsed). 4886 targets, 92 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e575f59b82eae78fb1ac8df7198eaa4a7a963259"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:8352a6c0a845a5354a40ddedba3edd079daa775a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 139 Local 130 Mirrors 0 Missed 9 Current 160 (93% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 169 of 299 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb:do_populate_lic_setscene)
NOTE: Running setscene task 171 of 299 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tinyalsa-2.0.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe tinyalsa-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tinyalsa-2.0.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe tinyalsa-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 299 of 299 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb:do_recipe_qa_setscene)
NOTE: recipe tinyalsa-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tinyalsa-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 877 of 897 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb:do_fetch)
NOTE: recipe tinyalsa-2.0.0-r0: task do_fetch: Started
NOTE: recipe tinyalsa-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 878 of 897 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb:do_unpack)
NOTE: Running task 879 of 897 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb:do_prepare_recipe_sysroot)
NOTE: recipe tinyalsa-2.0.0-r0: task do_unpack: Started
NOTE: recipe tinyalsa-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tinyalsa-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tinyalsa-2.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 880 of 897 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb:do_patch)
NOTE: Running task 881 of 897 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb:do_collect_spdx_deps)
NOTE: recipe tinyalsa-2.0.0-r0: task do_patch: Started
NOTE: recipe tinyalsa-2.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe tinyalsa-2.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tinyalsa-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 883 of 897 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb:do_generate_toolchain_file)
NOTE: recipe tinyalsa-2.0.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe tinyalsa-2.0.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 885 of 897 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb:do_configure)
NOTE: recipe tinyalsa-2.0.0-r0: task do_configure: Started
NOTE: recipe tinyalsa-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 886 of 897 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb:do_compile)
NOTE: recipe tinyalsa-2.0.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build --target all --
| Change Dir: '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build'
| 
| Run Build Command(s): ninja -v -j 16 all
| [1/23] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot -D_POSIX_C_SOURCE=200809L -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/bui
 ld/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native=   -fPIC -DPIC  -std=c99 -MD -MT CMakeFiles/pcm-readi.dir/examples/pcm-readi.c.o -MF CMakeFiles/pcm-readi.dir/examples/pcm-readi.c.o.d -o CMakeFiles/pcm-readi.dir/examples/pcm-readi.c.o -c /home/p
 okybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/examples/pcm-readi.c
| [2/23] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot -D_POSIX_C_SOURCE=200809L -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/bui
 ld/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native=   -fPIC -DPIC  -std=c99 -MD -MT CMakeFiles/pcm-writei.dir/examples/pcm-writei.c.o -MF CMakeFiles/pcm-writei.dir/examples/pcm-writei.c.o.d -o CMakeFiles/pcm-writei.dir/examples/pcm-writei.c.o -c /
 home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/examples/pcm-writei.c
| [3/23] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot -D_POSIX_C_SOURCE=200809L -Dtinyalsa_EXPORTS -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/au
 h-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native=   -fPIC -DPIC  -std=c99 -fPIC -Wall -Wextra -Wpedantic -Werror -Wfatal-errors -MD -MT CMakeFiles/tinyalsa.dir/src/snd_card_plugin.c.o -MF CMakeFiles/tinyalsa.dir/src/snd_card_p
 lugin.c.o.d -o CMakeFiles/tinyalsa.dir/src/snd_card_plugin.c.o -c /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/src/snd_card_plugin.c
| [4/23] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot -D_POSIX_C_SOURCE=200809L -Dtinyalsa_EXPORTS -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/au
 h-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native=   -fPIC -DPIC  -std=c99 -fPIC -Wall -Wextra -Wpedantic -Werror -Wfatal-errors -MD -MT CMakeFiles/tinyalsa.dir/src/mixer_hw.c.o -MF CMakeFiles/tinyalsa.dir/src/mixer_hw.c.o.d -o
  CMakeFiles/tinyalsa.dir/src/mixer_hw.c.o -c /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/src/mixer_hw.c
| [5/23] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot -D_POSIX_C_SOURCE=200809L -Dtinyalsa_EXPORTS -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/au
 h-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native=   -fPIC -DPIC  -std=c99 -fPIC -Wall -Wextra -Wpedantic -Werror -Wfatal-errors -MD -MT CMakeFiles/tinyalsa.dir/src/pcm_hw.c.o -MF CMakeFiles/tinyalsa.dir/src/pcm_hw.c.o.d -o CMa
 keFiles/tinyalsa.dir/src/pcm_hw.c.o -c /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/src/pcm_hw.c
| [6/23] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot -D_POSIX_C_SOURCE=200809L -Dtinyalsa_EXPORTS -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/au
 h-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native=   -fPIC -DPIC  -std=c99 -fPIC -Wall -Wextra -Wpedantic -Werror -Wfatal-errors -MD -MT CMakeFiles/tinyalsa.dir/src/mixer_plugin.c.o -MF CMakeFiles/tinyalsa.dir/src/mixer_plugin.
 c.o.d -o CMakeFiles/tinyalsa.dir/src/mixer_plugin.c.o -c /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/src/mixer_plugin.c
| FAILED: CMakeFiles/tinyalsa.dir/src/mixer_plugin.c.o
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot -D_POSIX_C_SOURCE=200809L -Dtinyalsa_EXPORTS -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-
 oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native=   -fPIC -DPIC  -std=c99 -fPIC -Wall -Wextra -Wpedantic -Werror -Wfatal-errors -MD -MT CMakeFiles/tinyalsa.dir/src/mixer_plugin.c.o -MF CMakeFiles/tinyalsa.dir/src/mixer_plugin.c.o.d -
 o CMakeFiles/tinyalsa.dir/src/mixer_plugin.c.o -c /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/src/mixer_plugin.c
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/src/mixer_plugin.c: In function 'mixer_plug_get_elem_id.isra':
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/src/mixer_plugin.c:84:5: error: '__builtin_strncpy' specified bound 44 equals destination size [-Werror=stringop-truncation]
|    84 |     strncpy((char *)id->name, (char *)ctl->name,
|       |     ^
| compilation terminated due to -Wfatal-errors.
| cc1: all warnings being treated as errors
| [7/23] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot -D_POSIX_C_SOURCE=200809L -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/bui
 ld/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native=   -fPIC -DPIC  -std=c99 -Wall -Wextra -Wpedantic -Werror -Wfatal-errors -MD -MT CMakeFiles/tinywavinfo.dir/utils/tinywavinfo.c.o -MF CMakeFiles/tinywavinfo.dir/utils/tinywavinfo.c.o.d -o CMakeFil
 es/tinywavinfo.dir/utils/tinywavinfo.c.o -c /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/utils/tinywavinfo.c
| [8/23] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot -D_POSIX_C_SOURCE=200809L -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/bui
 ld/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native=   -fPIC -DPIC  -std=c99 -Wall -Wextra -Wpedantic -Werror -Wfatal-errors -MD -MT CMakeFiles/tinypcminfo.dir/utils/tinypcminfo.c.o -MF CMakeFiles/tinypcminfo.dir/utils/tinypcminfo.c.o.d -o CMakeFil
 es/tinypcminfo.dir/utils/tinypcminfo.c.o -c /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/utils/tinypcminfo.c
| [9/23] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot -D_POSIX_C_SOURCE=200809L -Dtinyalsa_EXPORTS -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/au
 h-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native=   -fPIC -DPIC  -std=c99 -fPIC -Wall -Wextra -Wpedantic -Werror -Wfatal-errors -MD -MT CMakeFiles/tinyalsa.dir/src/pcm_plugin.c.o -MF CMakeFiles/tinyalsa.dir/src/pcm_plugin.c.o.
 d -o CMakeFiles/tinyalsa.dir/src/pcm_plugin.c.o -c /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/src/pcm_plugin.c
| FAILED: CMakeFiles/tinyalsa.dir/src/pcm_plugin.c.o
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot -D_POSIX_C_SOURCE=200809L -Dtinyalsa_EXPORTS -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-
 oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native=   -fPIC -DPIC  -std=c99 -fPIC -Wall -Wextra -Wpedantic -Werror -Wfatal-errors -MD -MT CMakeFiles/tinyalsa.dir/src/pcm_plugin.c.o -MF CMakeFiles/tinyalsa.dir/src/pcm_plugin.c.o.d -o CM
 akeFiles/tinyalsa.dir/src/pcm_plugin.c.o -c /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/src/pcm_plugin.c
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/src/pcm_plugin.c: In function 'pcm_plug_ioctl':
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/src/pcm_plugin.c:156:5: error: '__builtin_strncpy' specified bound 64 equals destination size [-Werror=stringop-truncation]
|   156 |     strncpy((char *)info->id, name, sizeof(info->id));
|       |     ^
| compilation terminated due to -Wfatal-errors.
| cc1: all warnings being treated as errors
| [10/23] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot -D_POSIX_C_SOURCE=200809L -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/bu
 ild/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native=   -fPIC -DPIC  -std=c99 -Wall -Wextra -Wpedantic -Werror -Wfatal-errors -MD -MT CMakeFiles/tinycap.dir/utils/tinycap.c.o -MF CMakeFiles/tinycap.dir/utils/tinycap.c.o.d -o CMakeFiles/tinycap.dir/
 utils/tinycap.c.o -c /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/utils/tinycap.c
| [11/23] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot -D_POSIX_C_SOURCE=200809L -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/bu
 ild/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native=   -fPIC -DPIC  -std=c99 -Wall -Wextra -Wpedantic -Werror -Wfatal-errors -MD -MT CMakeFiles/tinyplay.dir/utils/tinyplay.c.o -MF CMakeFiles/tinyplay.dir/utils/tinyplay.c.o.d -o CMakeFiles/tinyplay
 .dir/utils/tinyplay.c.o -c /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/utils/tinyplay.c
| [12/23] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot -D_POSIX_C_SOURCE=200809L -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/bu
 ild/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native=   -fPIC -DPIC  -std=c99 -Wall -Wextra -Wpedantic -Werror -Wfatal-errors -MD -MT CMakeFiles/tinymix.dir/utils/tinymix.c.o -MF CMakeFiles/tinymix.dir/utils/tinymix.c.o.d -o CMakeFiles/tinymix.dir/
 utils/tinymix.c.o -c /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/utils/tinymix.c
| [13/23] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot -D_POSIX_C_SOURCE=200809L -Dtinyalsa_EXPORTS -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/a
 uh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native=   -fPIC -DPIC  -std=c99 -fPIC -Wall -Wextra -Wpedantic -Werror -Wfatal-errors -MD -MT CMakeFiles/tinyalsa.dir/src/mixer.c.o -MF CMakeFiles/tinyalsa.dir/src/mixer.c.o.d -o CMak
 eFiles/tinyalsa.dir/src/mixer.c.o -c /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/src/mixer.c
| [14/23] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot -D_POSIX_C_SOURCE=200809L -Dtinyalsa_EXPORTS -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/a
 uh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git=/usr/src/debug/tinyalsa/2.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build=/usr/src/debug/tinyalsa/2.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/recipe-sysroot-native=   -fPIC -DPIC  -std=c99 -fPIC -Wall -Wextra -Wpedantic -Werror -Wfatal-errors -MD -MT CMakeFiles/tinyalsa.dir/src/pcm.c.o -MF CMakeFiles/tinyalsa.dir/src/pcm.c.o.d -o CMakeFil
 es/tinyalsa.dir/src/pcm.c.o -c /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/git/src/pcm.c
| ninja: build stopped: subcommand failed.
| 
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/temp/run.do_compile.1280376:153 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/temp/run.do_compile.1280376, line 153
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/temp/run.do_compile.1280376, line 147
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/temp/run.do_compile.1280376, line 142
| 	#4: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/temp/run.do_compile.1280376, line 166
NOTE: recipe tinyalsa-2.0.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 886 tasks of which 878 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104041154.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104041154.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: tinyalsa-2.0.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/temp/run.do_compile.1280376', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/tinyalsa/2.0.0/temp/log.do_compile.1280376
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb:do_compile) failed with exit code '1'

--===============3557819194551502173==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tinyalsa-upgrade-1.1.1-2.0.0.patch"

RnJvbSA5OWU3NGUxMGIyOTMxNzI2NzMyMTVmZDRmOGE2OWVkMTg4MjU2YzhkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNDoxMjoxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHRp
bnlhbHNhOiB1cGdyYWRlIDEuMS4xIC0+IDIuMC4wCgotLS0KIC4uLi9yZWNpcGVzLW11bHRpbWVk
aWEvdGlueWFsc2EvdGlueWFsc2EuYmIgICB8IDM3ICsrKysrKysrKysrKy0tLQogLi4uTF8tcGF0
aC1pbnN0ZWFkLW9mLWhhcmRjb2RpbmctYmluLWxpLnBhdGNoIHwgNDYgLS0tLS0tLS0tLS0tLS0t
LS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCA1MiBkZWxldGlvbnMoLSkK
IGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL3Rp
bnlhbHNhL3RpbnlhbHNhLzAwMDEtVXNlLUNNQUtFX0lOU1RBTExfLXBhdGgtaW5zdGVhZC1vZi1o
YXJkY29kaW5nLWJpbi1saS5wYXRjaAoKZGlmZiAtLWdpdCBhL21ldGEtbXVsdGltZWRpYS9yZWNp
cGVzLW11bHRpbWVkaWEvdGlueWFsc2EvdGlueWFsc2EuYmIgYi9tZXRhLW11bHRpbWVkaWEvcmVj
aXBlcy1tdWx0aW1lZGlhL3RpbnlhbHNhL3RpbnlhbHNhLmJiCmluZGV4IDY4Y2Y4Nzk1YS4uNTBh
M2UzM2FmIDEwMDY0NAotLS0gYS9tZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL3Rp
bnlhbHNhL3RpbnlhbHNhLmJiCisrKyBiL21ldGEtbXVsdGltZWRpYS9yZWNpcGVzLW11bHRpbWVk
aWEvdGlueWFsc2EvdGlueWFsc2EuYmIKQEAgLTEsMTYgKzEsNDEgQEAKKyMgRklYTUU6IHRoZSBM
SUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdy
YWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQg
YW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZh
bHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0
IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNl
LVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6Cisj
CisjIC0tLSBOT1RJQ0UKKyMgKysrIE5PVElDRQorIyBAQCAtMSw0ICsxLDUgQEAKKyMgIENvcHly
aWdodCAyMDExLCBUaGUgQW5kcm9pZCBPcGVuIFNvdXJjZSBQcm9qZWN0CisjICsKKyMgIFJlZGlz
dHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0
aG91dAorIyAgbW9kaWZpY2F0aW9uLCBhcmUgcGVybWl0dGVkIHByb3ZpZGVkIHRoYXQgdGhlIGZv
bGxvd2luZyBjb25kaXRpb25zIGFyZSBtZXQ6CisjICAgICAgKiBSZWRpc3RyaWJ1dGlvbnMgb2Yg
c291cmNlIGNvZGUgbXVzdCByZXRhaW4gdGhlIGFib3ZlIGNvcHlyaWdodAorIyBAQCAtOSw2ICsx
MCw3IEBACisjICAgICAgKiBOZWl0aGVyIHRoZSBuYW1lIG9mIFRoZSBBbmRyb2lkIE9wZW4gU291
cmNlIFByb2plY3Qgbm9yIHRoZSBuYW1lcyBvZgorIyAgICAgICAgaXRzIGNvbnRyaWJ1dG9ycyBt
YXkgYmUgdXNlZCB0byBlbmRvcnNlIG9yIHByb21vdGUgcHJvZHVjdHMgZGVyaXZlZAorIyAgICAg
ICAgZnJvbSB0aGlzIHNvZnR3YXJlIHdpdGhvdXQgc3BlY2lmaWMgcHJpb3Igd3JpdHRlbiBwZXJt
aXNzaW9uLgorIyArCisjICBUSElTIFNPRlRXQVJFIElTIFBST1ZJREVEIEJZIFRoZSBBbmRyb2lk
IE9wZW4gU291cmNlIFByb2plY3QgYGBBUyBJUycnIEFORAorIyAgQU5ZIEVYUFJFU1MgT1IgSU1Q
TElFRCBXQVJSQU5USUVTLCBJTkNMVURJTkcsIEJVVCBOT1QgTElNSVRFRCBUTywgVEhFCisjICBJ
TVBMSUVEIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZIEFORCBGSVRORVNTIEZPUiBBIFBB
UlRJQ1VMQVIgUFVSUE9TRQorIyAKKyMKKwogREVTQ1JJUFRJT04gPSAiVGlueUFMU0EgaXMgYSBz
bWFsbCBsaWJyYXJ5IHRvIGludGVyZmFjZSB3aXRoIEFMU0EgaW4gXAogdGhlIExpbnV4IGtlcm5l
bC4gSXQgaXMgYSBsaWdodHdlaWdodCBhbHRlcm5hdGl2ZSB0byBsaWJhc291bmQuIgogSE9NRVBB
R0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3RpbnlhbHNhL3RpbnlhbHNhIgogU0VDVElPTiA9ICJs
aWJzL211bHRpbWVkaWEiCiAKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIgotTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTk9USUNFO21kNT1kYmRlZmU0MDBkODk0YjUxMGE5ZGUxNDgxMzE4MWQw
YiIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL05PVElDRTttZDU9ZTA0Y2Q2ZmE1ODQ4OGUw
MTZmN2ZiNjQ4ZWJlYTFkYjQiCiAKLVNSQ1JFViA9ICI4NDQ5NTI5YzdlNTBmNDMyMDkxNTM5YmE3
YjQzOGU3OWIwNDA1OWI1IgotU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3RpbnlhbHNhL3Rp
bnlhbHNhO2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAotICAgICAgICAgICBmaWxlOi8v
MDAwMS1Vc2UtQ01BS0VfSU5TVEFMTF8tcGF0aC1pbnN0ZWFkLW9mLWhhcmRjb2RpbmctYmluLWxp
LnBhdGNoIFwKLSAgICAgICAgICAiCi1QViA9ICIxLjEuMStnaXQke1NSQ1BWfSIKK1NSQ1JFViA9
ICIxYzVmYjY4Y2VkNTdkODM4ZjJiN2VjZDBjMDBiYzFmZWZjOWFiNjBkIgorU1JDX1VSSSA9ICJn
aXQ6Ly9naXRodWIuY29tL3RpbnlhbHNhL3RpbnlhbHNhO2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9
aHR0cHMiCitQViA9ICIyLjAuMCIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIApkaWZmIC0tZ2l0
IGEvbWV0YS1tdWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS90aW55YWxzYS90aW55YWxzYS8w
MDAxLVVzZS1DTUFLRV9JTlNUQUxMXy1wYXRoLWluc3RlYWQtb2YtaGFyZGNvZGluZy1iaW4tbGku
cGF0Y2ggYi9tZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL3RpbnlhbHNhL3Rpbnlh
bHNhLzAwMDEtVXNlLUNNQUtFX0lOU1RBTExfLXBhdGgtaW5zdGVhZC1vZi1oYXJkY29kaW5nLWJp
bi1saS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNmY5YzM5OTk2Li4wMDAw
MDAwMDAKLS0tIGEvbWV0YS1tdWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS90aW55YWxzYS90
aW55YWxzYS8wMDAxLVVzZS1DTUFLRV9JTlNUQUxMXy1wYXRoLWluc3RlYWQtb2YtaGFyZGNvZGlu
Zy1iaW4tbGkucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw0NiArMCwwIEBACi1Gcm9tIGZlNGYz
YzJhMzdhODEyMDFmNDYzZmY5NjIzNjRmMDE0ZjUwYzk4OTYgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCi1Gcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotRGF0ZTogTW9uLCAxNiBE
ZWMgMjAxOSAyMjo1ODo0MSAtMDgwMAotU3ViamVjdDogW1BBVENIXSBVc2UgQ01BS0VfSU5TVEFM
TF88cGF0aD4gaW5zdGVhZCBvZiBoYXJkY29kaW5nIGJpbi9saWIvCi0gaW5zdGFsbCBwYXRocwot
Ci1IZWxwcyBmaXggYnVpbGQvcGFja2FnaW5nIGlzc3VlcyBvbiBtYWNoaW5lcyB3aGVyZSBkZWZh
dWx0IGxpYmRpciBpcyBub3QKLWxpYiBidXQgc2F5IGxpYjY0Ci0KLVVwc3RyZWFtLVN0YXR1czog
U3VibWl0dGVkIFtodHRwczovL2dpdGh1Yi5jb20vdGlueWFsc2EvdGlueWFsc2EvcHVsbC8xNDNd
Ci1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0gQ01h
a2VMaXN0cy50eHQgfCAxNCArKysrKysrKysrKy0tLQotIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvQ01ha2VMaXN0cy50eHQg
Yi9DTWFrZUxpc3RzLnR4dAotaW5kZXggY2IzMWM1OC4uMWNjNGE4NSAxMDA2NDQKLS0tLSBhL0NN
YWtlTGlzdHMudHh0Ci0rKysgYi9DTWFrZUxpc3RzLnR4dAotQEAgLTQxLDEyICs0MSwyMCBAQCBh
ZGRfdXRpbCgidGlueW1peCIgInV0aWxzL3RpbnltaXguYyIpCi0gaW5zdGFsbChGSUxFUyAke0hE
UlN9Ci0gICAgIERFU1RJTkFUSU9OICJpbmNsdWRlL3RpbnlhbHNhIikKLSAKLStpZihOT1QgREVG
SU5FRCBDTUFLRV9JTlNUQUxMX0xJQkRJUikKLSsgICAgc2V0KENNQUtFX0lOU1RBTExfTElCRElS
IGxpYikKLStlbmRpZigpCi0rCi0raWYoTk9UIERFRklORUQgQ01BS0VfSU5TVEFMTF9CSU5ESVIp
Ci0rCXNldChDTUFLRV9JTlNUQUxMX0JJTkRJUiBiaW4pCi0rZW5kaWYoKQotKwotIGluc3RhbGwo
VEFSR0VUUyAidGlueWFsc2EiCi0gICAgICAgICAgICAgICAgICJ0aW55cGxheSIKLSAgICAgICAg
ICAgICAgICAgInRpbnljYXAiCi0gICAgICAgICAgICAgICAgICJ0aW55bWl4IgotICAgICAgICAg
ICAgICAgICAidGlueXBjbWluZm8iCi0tICAgIFJVTlRJTUUgREVTVElOQVRJT04gImJpbiIKLS0g
ICAgQVJDSElWRSBERVNUSU5BVElPTiAibGliIgotLSAgICBMSUJSQVJZIERFU1RJTkFUSU9OICJs
aWIiKQotKyAgICBSVU5USU1FIERFU1RJTkFUSU9OICR7Q01BS0VfSU5TVEFMTF9CSU5ESVJ9Ci0r
ICAgIEFSQ0hJVkUgREVTVElOQVRJT04gJHtDTUFLRV9JTlNUQUxMX0xJQkRJUn0KLSsgICAgTElC
UkFSWSBERVNUSU5BVElPTiAke0NNQUtFX0lOU1RBTExfTElCRElSfSkKLSAKLS0tIAotMi4yNC4x
Ci0KLS0gCjIuMzkuMgoK

--===============3557819194551502173==--

