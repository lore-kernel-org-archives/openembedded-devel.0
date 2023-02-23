Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E02C64ED6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 13:45:50 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.10571.1677159940639967521
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 05:45:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iKC1GYKz;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id h16so42424172edz.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 05:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f21+9lnM/xlRfFV8cjA/obCBtr2Mj1OyGQ8SDmmLUrg=;
        b=iKC1GYKzMHPfpWp2lOQ4lL1nkrg4Ys2jlFN7+mPW+tkzH0ep0tlOEcqm9GQOKoV6LF
         7lbdykeJi5CvYFYoVI8I0VXamdm1ecQ5IhHiFaTjM7Kaz5F6Kt/xYVAv2aIL71LHLZYk
         WEzqSRzNxu3X2Rf9VWLKyKtRgQQMPOAvymu7wT553dJvdihR2wZrdoj0+KHLIJSoqlVn
         VrqY+pUf+DtxBcqf5asxXILqqUuHsx6VXTwFi/JNW9+V34I0ubYRdoc2ZP2pGGsoyyri
         pgnaLHxKToV6YvSAXnBGHVbvrvvRmgKa8adfhUrdguWKUBrrfjWtOyBnpTsKTk1Or6Q9
         ruWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f21+9lnM/xlRfFV8cjA/obCBtr2Mj1OyGQ8SDmmLUrg=;
        b=Bd1OaCsJXvHwTzzkR4mueU+S32xX14gctZ5qhfAhe4+78vevglFvQRwiravU8xfNeU
         0+1xIFLAAYX/yOieyZcwzfH3c8ecRu2+KeB1ND9V5wTgfMaKTTB2NL1YfQHkknssbFfY
         O6vIwUczcRyCKzwWH4z5gxVujSCVA57VPWBy/5y9tVPnkASsUbzoismFS7CYoNEy/gXA
         ovyiPrXmECFE8G94tbmh7MVQ92a7V0sBM2OaSTIZ9yKkLGVEiSpWC0pLTDcXTUw+c3e2
         kfGJXBFrPENgpS+9E+mhFLUX87sTdPsbivctM7PkNXp9d1zaYF5YP6pwVkb2A+gPYXaF
         BLkg==
X-Gm-Message-State: AO0yUKVgTZLheE7QG6VnCjyb4auWpiyxy1Z6I7cvgXPQO1t5Is5jSaoR
	+thLUJrvPaxpvCoeJKIxrbh0KaZSUj0=
X-Google-Smtp-Source: AK7set+PQjwEllRNjyDH3UoZ7s32/NvAjjK0g7hxMjBOJ3eqZSpZeTEPuPb5GWKpNGJfJlwJnteg6Q==
X-Received: by 2002:aa7:c54a:0:b0:4ac:c137:4848 with SMTP id s10-20020aa7c54a000000b004acc1374848mr11554743edr.22.1677159938360;
        Thu, 23 Feb 2023 05:45:38 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id c30-20020a50f61e000000b004aee4e2a56esm5249621edn.0.2023.02.23.05.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 05:45:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] .patch: fix Upstream-Status formatting issues reported by patchreview tool from oe-core
Date: Thu, 23 Feb 2023 14:45:29 +0100
Message-Id: <20230223134530.3981942-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 13:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101230

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0004-call-native-helpers.patch            |  2 +-
 ...01-Support-cross-builds-a-bit-better.patch |  2 +-
 ...ot-add-dir-installed-tests-when-inst.patch |  2 +-
 ...eson-fix-invalid-positional-argument.patch |  2 +-
 .../metacity/0001-drop-zenity-detection.patch |  2 +-
 ...n-test-program-while-cross-compiling.patch |  2 +-
 ...n-test-program-while-cross-compiling.patch |  2 +-
 .../files/fix-writing-emtpy-file.patch        |  2 +-
 ...p-hpa-bug-fix-on-separated-CR-and-LF.patch |  2 +-
 .../0001-links.c-Fix-build-with-gcc-12.patch  |  2 +-
 .../files/0001-usr-Makefile-WARNING-fix.patch |  2 +-
 .../netkit-ftp/Add_ARG_MAX_define.patch       |  3 +--
 .../To-aviod-buffer-overflow-in-telnet.patch  |  2 +-
 .../Warning-fix-in-the-step-of-install.patch  |  2 +-
 .../0001-config_os_headers-Error-Fix.patch    |  2 +-
 ...e-modify-CFLAGS-to-aviod-build-error.patch |  2 +-
 .../openl2tp-simplify-gcc-warning-hack.patch  |  2 +-
 .../openl2tpd-initscript-fix-sysconfig.patch  | 14 +++++------
 .../openl2tp/openl2tpd-initscript-fix.patch   | 16 ++++++-------
 ...ify-configure.in-and-etc-Makefile.am.patch |  2 +-
 .../rp-pppoe/configure.in-Error-fix.patch     |  2 +-
 .../chrony/chrony/arm_eabi.patch              | 24 +++++++++----------
 ...vert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch |  2 +-
 .../0001-drbd-utils-support-usrmerge.patch    |  2 +-
 .../0001-Makefile-tweak-install-dir.patch     |  2 +-
 ...01-avoid-gcc-optimize-away-the-loops.patch |  2 +-
 ...lymouth-Add-the-retain-splash-option.patch |  2 +-
 ...e-for-mips-ispeed-ospeed-termios-abs.patch |  2 +-
 ...akeLists.txt-fix-do_populate_sysroot.patch |  2 +-
 .../breakpad/breakpad/mcontext.patch          |  2 +-
 .../doxygen-native-only-check-python3.patch   |  2 +-
 ...python3-instead-of-just-usr-bin-pyth.patch |  2 +-
 ...CheckLib.pm-don-t-execute-the-binary.patch |  2 +-
 ...missing-python-include-dir-for-cross.patch |  2 +-
 ...01-Makefile.am-remove-doc-and-apidoc.patch |  2 +-
 ...move-prog-test-of-xmlto-and-asciidoc.patch |  2 +-
 .../files/0003-without-build-plugins.patch    |  2 +-
 ...gure.ac-remove-prog-test-of-augparse.patch |  2 +-
 .../nana/nana/change-mandir-to-DESTDIR.patch  |  2 +-
 ...modify-acinclude.m4-and-configure.in.patch |  2 +-
 ...-tests-disable-the-check-for-inotify.patch |  2 +-
 .../sgpio/sgpio/Makefile-error-fix.patch      |  2 +-
 ...001-use-pkg-config-to-find-freetype2.patch |  2 +-
 ...1-Fix-compilation-for-disabled-gnome.patch |  2 +-
 .../0002-let-autotools-create-lxdm.conf.patch |  4 +---
 .../sessreg/0001-Makefile.am-Error-Fix.patch  |  2 +-
 ...makedumpfile-replace-hardcode-CFLAGS.patch |  2 +-
 ...raph.py-parse-unfished-cpu-exec-line.patch |  2 +-
 .../id3lib/id3lib/acdefine.patch              |  2 +-
 .../0001-Fix-signature-of-main-function.patch |  2 +-
 .../eject/eject/eject-timeout.patch           |  2 +-
 .../files/0001-cmake-remove-build-flags.patch |  2 +-
 ...1-Use-OE-specific-checks-for-ncurses.patch |  2 +-
 ...configure.ac-Don-t-use-AC_CHECK_FILE.patch |  2 +-
 .../libee/libee/libee-parallel-make.patch     |  2 +-
 .../libharu/libharu-RELEASE_2_3_0_cmake.patch |  2 +-
 .../liboauth/0001-Support-OpenSSL-1.1.0.patch |  2 +-
 ...log-ng.service-the-syslog-ng-service.patch |  2 +-
 .../remove_duplicate_install.patch            |  2 +-
 ...support-authentication-for-kickstart.patch |  2 +-
 ...ions-shutdown-and-environment-in-gen.patch |  2 +-
 ...retry-to-invoke-request-with-timeout.patch |  2 +-
 62 files changed, 86 insertions(+), 89 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0004-call-native-helpers.patch b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0004-call-native-helpers.patch
index e320f6342d..82f6972501 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0004-call-native-helpers.patch
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0004-call-native-helpers.patch
@@ -6,7 +6,7 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
-Upstream-Status: Inappropriate[oe-specific]
+Upstream-Status: Inappropriate [oe-specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-builds-a-bit-better.patch b/meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-builds-a-bit-better.patch
index 0c45e60957..c46f85b7dc 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-builds-a-bit-better.patch
+++ b/meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-builds-a-bit-better.patch
@@ -9,7 +9,7 @@ Content-Transfer-Encoding: 8bit
 * Do not build/run mozjs-linked program
 * Do not try to run test applications
 
-Upstream-Status: Submitted[https://gitlab.gnome.org/GNOME/gjs/-/merge_requests/690]
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gjs/-/merge_requests/690]
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch b/meta-gnome/recipes-gnome/gjs/gjs/0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch
index 6e7b5504e8..e281717ea1 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs/0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch
+++ b/meta-gnome/recipes-gnome/gjs/gjs/0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch
@@ -7,7 +7,7 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
-Upstream-Status: Submitted[https://gitlab.gnome.org/GNOME/gjs/-/merge_requests/690]
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gjs/-/merge_requests/690]
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
diff --git a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch
index dfa4615a3d..bd7e76f208 100644
--- a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch
+++ b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch
@@ -3,7 +3,7 @@ From: Mae Dartmann <hello@maedartmann.name>
 Date: Wed, 16 Feb 2022 06:08:41 +0000
 Subject: [PATCH] meson: fix invalid positional argument
 
-Upstream-Status: Accepted[https://gitlab.gnome.org/GNOME/gnome-tweaks/-/commit/dc9701e18775c01d0b69fabaa350147f70096da8]
+Upstream-Status: Accepted [https://gitlab.gnome.org/GNOME/gnome-tweaks/-/commit/dc9701e18775c01d0b69fabaa350147f70096da8]
 ---
  data/meson.build | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
diff --git a/meta-gnome/recipes-gnome/metacity/metacity/0001-drop-zenity-detection.patch b/meta-gnome/recipes-gnome/metacity/metacity/0001-drop-zenity-detection.patch
index 315d4e4366..6bebaaba8f 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity/0001-drop-zenity-detection.patch
+++ b/meta-gnome/recipes-gnome/metacity/metacity/0001-drop-zenity-detection.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] drop zenity detection
 
 OE does not support zenity
 
-Upstream-Status: inappropriate [OE specific]
+Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
diff --git a/meta-networking/recipes-connectivity/daq/files/disable-run-test-program-while-cross-compiling.patch b/meta-networking/recipes-connectivity/daq/files/disable-run-test-program-while-cross-compiling.patch
index a100b7cb83..cb986b85da 100644
--- a/meta-networking/recipes-connectivity/daq/files/disable-run-test-program-while-cross-compiling.patch
+++ b/meta-networking/recipes-connectivity/daq/files/disable-run-test-program-while-cross-compiling.patch
@@ -1,4 +1,4 @@
-Upstream-Status:Inappropriate [embedded specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 fix the below error:
 configure: error: cannot run test program while cross compiling
diff --git a/meta-networking/recipes-connectivity/snort/snort/disable-run-test-program-while-cross-compiling.patch b/meta-networking/recipes-connectivity/snort/snort/disable-run-test-program-while-cross-compiling.patch
index 30ec174395..98c20b6ecf 100644
--- a/meta-networking/recipes-connectivity/snort/snort/disable-run-test-program-while-cross-compiling.patch
+++ b/meta-networking/recipes-connectivity/snort/snort/disable-run-test-program-while-cross-compiling.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Disable run test program while cross compiling
 fix configure error:
 configure: error: cannot run test program while cross compiling
 
-Upstream-Status:Inappropriate [embedded specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/fix-writing-emtpy-file.patch b/meta-networking/recipes-daemons/tftp-hpa/files/fix-writing-emtpy-file.patch
index 452aa05f81..4f3dcd7767 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/files/fix-writing-emtpy-file.patch
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/fix-writing-emtpy-file.patch
@@ -1,6 +1,6 @@
 [PATCH] fix the empty file writting
 
-Upstream-Status: pending
+Upstream-Status: Pending
 
 With the feature that checking the disk filled up, the return
 value of function write_behind was checked and used to detect
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-bug-fix-on-separated-CR-and-LF.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-bug-fix-on-separated-CR-and-LF.patch
index 3e220ec385..e994f28402 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-bug-fix-on-separated-CR-and-LF.patch
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-bug-fix-on-separated-CR-and-LF.patch
@@ -7,7 +7,7 @@ In ascii mode, if the CR and LF was separated into different transfer
 blocks, LF will be just dropped instead of replacing the previous CR.
 Add a checking on the first character to fix it.
 
-Upstream-Status: pending
+Upstream-Status: Pending
 
 Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
 ---
diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet/0001-links.c-Fix-build-with-gcc-12.patch b/meta-networking/recipes-extended/kronosnet/kronosnet/0001-links.c-Fix-build-with-gcc-12.patch
index e59501cc49..d57d0e61b5 100644
--- a/meta-networking/recipes-extended/kronosnet/kronosnet/0001-links.c-Fix-build-with-gcc-12.patch
+++ b/meta-networking/recipes-extended/kronosnet/kronosnet/0001-links.c-Fix-build-with-gcc-12.patch
@@ -15,7 +15,7 @@ Fixes:
   |       |                           ^~~~
   | cc1: all warnings being treated as errors
 
-Upstream-Status: Submitted[https://github.com/kronosnet/kronosnet/pull/382]
+Upstream-Status: Submitted [https://github.com/kronosnet/kronosnet/pull/382]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
diff --git a/meta-networking/recipes-extended/tgt/files/0001-usr-Makefile-WARNING-fix.patch b/meta-networking/recipes-extended/tgt/files/0001-usr-Makefile-WARNING-fix.patch
index 078ba9ef50..a3ea604086 100644
--- a/meta-networking/recipes-extended/tgt/files/0001-usr-Makefile-WARNING-fix.patch
+++ b/meta-networking/recipes-extended/tgt/files/0001-usr-Makefile-WARNING-fix.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] usr/Makefile: WARNING fix WARNING: QA Issue: tgt:
  packages-split/tgt/usr/sbin/tgtd contains probably-redundant RPATH /usr/lib
  [useless-rpaths]
 
-Upstream-Status: pending
+Upstream-Status: Pending
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 
diff --git a/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp/Add_ARG_MAX_define.patch b/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp/Add_ARG_MAX_define.patch
index 5a47fd9175..5db004865f 100644
--- a/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp/Add_ARG_MAX_define.patch
+++ b/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp/Add_ARG_MAX_define.patch
@@ -1,7 +1,6 @@
 This adds ARG_MAX define to be _SC_ARG_MAX
 
-Upstream-Status: Inappropriate.
-Most distros have their own verion for this fix.
+Upstream-Status: Inappropriate [Most distros have their own verion for this fix]
 
 Signed-off-by: Armin Kuster <akuster808@gmail.com>
 
diff --git a/meta-networking/recipes-netkit/netkit-telnet/files/To-aviod-buffer-overflow-in-telnet.patch b/meta-networking/recipes-netkit/netkit-telnet/files/To-aviod-buffer-overflow-in-telnet.patch
index 7fff8cffc4..34a6479790 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/files/To-aviod-buffer-overflow-in-telnet.patch
+++ b/meta-networking/recipes-netkit/netkit-telnet/files/To-aviod-buffer-overflow-in-telnet.patch
@@ -5,7 +5,7 @@ Subject: [PATCH 1/2] To aviod buffer overflow in telnet
 
 This patch is from Fedora.
 
-Upstream-Status: pending
+Upstream-Status: Pending
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
diff --git a/meta-networking/recipes-netkit/netkit-telnet/files/Warning-fix-in-the-step-of-install.patch b/meta-networking/recipes-netkit/netkit-telnet/files/Warning-fix-in-the-step-of-install.patch
index b9a98f1d6f..9ac75439da 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/files/Warning-fix-in-the-step-of-install.patch
+++ b/meta-networking/recipes-netkit/netkit-telnet/files/Warning-fix-in-the-step-of-install.patch
@@ -6,7 +6,7 @@ Subject: [PATCH 2/2] WARNING Fix and modify "CFLAGS"
 WARNING: QA Issue: File '/usr/sbin/in.telnetd' from netkit-telnet was 
 already stripped, this will prevent future debugging! [already-stripped]
 
-Upstream-Status: pending
+Upstream-Status: Pending
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch
index f8a52a63f5..5aea52788c 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch
@@ -10,7 +10,7 @@ conftest.c:168:17: fatal error: pkg.h: No such file or directory
  #include <pkg.h>
                  ^
 
-Upstream-Status: pending
+Upstream-Status: Pending
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/Makefile-modify-CFLAGS-to-aviod-build-error.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/Makefile-modify-CFLAGS-to-aviod-build-error.patch
index 96dbc7551d..8e9bd1e9ee 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp/Makefile-modify-CFLAGS-to-aviod-build-error.patch
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/Makefile-modify-CFLAGS-to-aviod-build-error.patch
@@ -3,7 +3,7 @@ From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Mon, 1 Dec 2014 01:53:41 +0900
 Subject: [PATCH] Makefile:modify CFLAGS to aviod build error.
 
-Upstream-Status: pending
+Upstream-Status: Pending
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tp-simplify-gcc-warning-hack.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tp-simplify-gcc-warning-hack.patch
index c9cf15c1db..2a7435963e 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tp-simplify-gcc-warning-hack.patch
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tp-simplify-gcc-warning-hack.patch
@@ -10,7 +10,7 @@ it in place but remove the #if guard since it is only there to ensure that
 the l2tp_private.h file is updated if the rpc source file is changed and
 the two get out of sync.
 
-Upstream-Status: pending
+Upstream-Status: Pending
 
 Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
 ---
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-initscript-fix-sysconfig.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-initscript-fix-sysconfig.patch
index 3119425e69..c094e3859b 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-initscript-fix-sysconfig.patch
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-initscript-fix-sysconfig.patch
@@ -2,17 +2,17 @@ commit 6ea3125e2bec15004f312814022335d94cdf7e94
 Author: Aws Ismail <aws.ismail@windriver.com>
 Date:   Wed Sep 19 11:34:48 2012 -0400
 
-    Fix openl2tp config script location
+Fix openl2tp config script location
     
-    Correct the location of the sysconfig
-    script. Use /etc/default/ instead of
-    /etc/sysconfig/
+Correct the location of the sysconfig
+script. Use /etc/default/ instead of
+/etc/sysconfig/
     
-    Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
+Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
 
-    Upstream-Status: Inappropriate [configuration]
+Upstream-Status: Inappropriate [configuration]
 
-    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 
 diff --git a/etc/rc.d/init.d/openl2tpd b/etc/rc.d/init.d/openl2tpd
 index 7f27bb7..4194f63 100755
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-initscript-fix.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-initscript-fix.patch
index 9ecd4b072f..51bddb8942 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-initscript-fix.patch
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-initscript-fix.patch
@@ -2,16 +2,16 @@ commit 7c58a1e244ea83a9e7bbd51a6d354cee25cdbd33
 Author: Aws Ismail <aws.ismail@windriver.com>
 Date:   Wed Sep 12 23:35:40 2012 -0400
 
-    Fix openl2tpd initscript
-    
-    - Correct the location of the retval statement.
-    - use start-stop-daemon instead of daemon.
-    
-    Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
+Fix openl2tpd initscript
 
-    Upstream-Status: Inappropriate [OE specific]
+- Correct the location of the retval statement.
+- use start-stop-daemon instead of daemon.
 
-    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 
 diff --git a/etc/rc.d/init.d/openl2tpd b/etc/rc.d/init.d/openl2tpd
 index ce21b50..7f27bb7 100755
diff --git a/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng/Modify-configure.in-and-etc-Makefile.am.patch b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng/Modify-configure.in-and-etc-Makefile.am.patch
index ecc2d74e74..fd9961b9e8 100644
--- a/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng/Modify-configure.in-and-etc-Makefile.am.patch
+++ b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng/Modify-configure.in-and-etc-Makefile.am.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Modify configure.in and etc/Makefile.am
 this patch is from Fedora to fix error:
 "conftest.c:26:9: error: unknown type name 'not'"
 
-Upstream-Status: pending
+Upstream-Status: Pending
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure.in-Error-fix.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure.in-Error-fix.patch
index bbd516fde9..9e60b98fd3 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure.in-Error-fix.patch
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure.in-Error-fix.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] configure.in: Error fix.
 the error is: conftest.c:9:28: fatal error: ac_nonexistent.h:
 No such file or directory #include <ac_nonexistent.h>
 
-Upstream-Status: pending
+Upstream-Status: Pending
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 
diff --git a/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch b/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
index 5ba2081262..82c0e1b68b 100644
--- a/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
+++ b/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
@@ -3,25 +3,25 @@ From: Joe Slater <jslater@windriver.com>
 Date: Thu, 9 Mar 2017 10:58:06 -0800
 Subject: [PATCH] chrony: fix build failure for arma9
 
-    Eliminate references to syscalls not available
-    for ARM_EABI.  Also add a dependency on libseccomp
-    which is needed for scfilter to work.
+Eliminate references to syscalls not available
+for ARM_EABI.  Also add a dependency on libseccomp
+which is needed for scfilter to work.
 
-    Set PACKAGECONFIG to not enable scfilter, since
-    kernel CONFIG_SECCOMP is unlikely to be set.  This
-    aligns the usage of libseccomp with that of other packages.
+Set PACKAGECONFIG to not enable scfilter, since
+kernel CONFIG_SECCOMP is unlikely to be set.  This
+aligns the usage of libseccomp with that of other packages.
 
-    Upstream-Status: Pending
+Upstream-Status: Pending
 
-    Signed-off-by: Joe Slater <jslater@windriver.com>
+Signed-off-by: Joe Slater <jslater@windriver.com>
 
-    Refresh patch for new upstream version.
+Refresh patch for new upstream version.
 
-    Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
 
-    Refreshed for 4.0
+Refreshed for 4.0
 
-    Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
  sys_linux.c | 15 +++++++++------
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch
index f16f687f24..4fcfa48b99 100644
--- a/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch
+++ b/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] configure.ac: convert AC_TRY_RUN to AC_TRY_LINK statements
 
 This is not completely safe, but it's the least invasive fix.
 
-Upstream-Status: pending
+Upstream-Status: Pending
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch
index 84e3ad0968..4e1f68be09 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch
+++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch
@@ -3,7 +3,7 @@ From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 21 Apr 2022 17:22:35 +0800
 Subject: [PATCH] drbd-utils: support usermerge
 
-Upstream-Status: Inappropriate[oe-specific]
+Upstream-Status: Inappropriate [oe-specific]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
diff --git a/meta-networking/recipes-support/ssmping/files/0001-Makefile-tweak-install-dir.patch b/meta-networking/recipes-support/ssmping/files/0001-Makefile-tweak-install-dir.patch
index 0cb981cf7a..4e1498a366 100644
--- a/meta-networking/recipes-support/ssmping/files/0001-Makefile-tweak-install-dir.patch
+++ b/meta-networking/recipes-support/ssmping/files/0001-Makefile-tweak-install-dir.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Makefile: tweak install dir
 For oe-core, the man doc should be installed to /usr/share/man
 rather than /usr/locale/man.
 
-Upstream-Status: inappropriate (oe specific)
+Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench/0001-avoid-gcc-optimize-away-the-loops.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-avoid-gcc-optimize-away-the-loops.patch
index b964bef1f0..ff926548b6 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench/0001-avoid-gcc-optimize-away-the-loops.patch
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-avoid-gcc-optimize-away-the-loops.patch
@@ -3,7 +3,7 @@ From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 5 May 2016 09:52:01 +0800
 Subject: [PATCH] [PATCH] avoid gcc optimize-away the loops
 
-Upstream-Status: pending
+Upstream-Status: Pending
 
 Change expression used in do_integer_mul and do_uint64_mul
 benchmarks so GCC doesn't optimize-away the loops, other
diff --git a/meta-oe/recipes-core/plymouth/files/0001-plymouth-Add-the-retain-splash-option.patch b/meta-oe/recipes-core/plymouth/files/0001-plymouth-Add-the-retain-splash-option.patch
index ba2bf224a6..58838500bf 100644
--- a/meta-oe/recipes-core/plymouth/files/0001-plymouth-Add-the-retain-splash-option.patch
+++ b/meta-oe/recipes-core/plymouth/files/0001-plymouth-Add-the-retain-splash-option.patch
@@ -10,7 +10,7 @@ Adding the "retain-splash” option to tell plymouth to keep the boot
 splash’s contents on screen even after plymouth exits to make the
 splash screen show more friendly on the system which boots so fast.
 
-Upstream-Status: Inappropriate[embedded specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
diff --git a/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch b/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch
index b8d355706c..b05fd3666b 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch
+++ b/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch
@@ -3,7 +3,7 @@ From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 11 Jan 2021 15:16:57 -0800
 Subject: [PATCH] patch term module for mips ispeed/ospeed termios absense
 
-Upstream-Status: OE-Specific [needed on mips]
+Upstream-Status: Inappropriate [OE-Specific needed on mips]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_populate_sysroot.patch b/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_populate_sysroot.patch
index 4f9a4e9b0e..233d9e6af6 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_populate_sysroot.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_populate_sysroot.patch
@@ -7,7 +7,7 @@ Comment out the logic which for suse as it introduces
 below do_populate_sysroot error:
 ERROR: mariadb-native-10.3.13-r0 do_populate_sysroot: sstate found an absolute path symlink /build/tmp/work/x86_64-linux/mariadb-native/10.3.13-r0/sysroot-destdir/build/tmp/work/x86_64-linux/mariadb-native/10.3.13-r0/recipe-sysroot-native/usr/sbin/rcmysql pointing at /build/tmp/work/x86_64-linux/mariadb-native/10.3.13-r0/recipe-sysroot-native/etc/init.d/mysql. Please replace this with a relative link.
 
-Upstream-Status: Inappropriate[oe build specific]
+Upstream-Status: Inappropriate [oe build specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/mcontext.patch b/meta-oe/recipes-devtools/breakpad/breakpad/mcontext.patch
index 51393967bc..3449973629 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/mcontext.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/mcontext.patch
@@ -1,6 +1,6 @@
 map the mcontext_t structure for musl
 
-Upstream-Status: Inappropriate[need to consider Android]
+Upstream-Status: Inappropriate [need to consider Android]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Index: git/src/client/linux/minidump_writer/linux_core_dumper.cc
diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-python3.patch b/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-python3.patch
index b6d007d8df..796bc61ddc 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-python3.patch
+++ b/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-python3.patch
@@ -34,7 +34,7 @@ This patch is only needded by doxygen-native.
 
 Updated to apply to release 1.9.1.
 
-Upstream-Status: Inappropriate[oe specific]
+Upstream-Status: Inappropriate [oe specific]
 
 Co-Authored-By: Kai Kang <kai.kang@windriver.com>
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
diff --git a/meta-oe/recipes-devtools/pahole/files/0002-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch b/meta-oe/recipes-devtools/pahole/files/0002-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
index 54cd096e4f..4f7dfd4cca 100644
--- a/meta-oe/recipes-devtools/pahole/files/0002-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
+++ b/meta-oe/recipes-devtools/pahole/files/0002-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
@@ -3,7 +3,7 @@ From: Matteo Croce <mcroce@microsoft.com>
 Date: Wed, 15 Sep 2021 17:54:01 +0200
 Subject: [PATCH] Use /usr/bin/env python3 instead of just /usr/bin/python3
 
-Upstream-Status: inappropriate [OE specific]
+Upstream-Status: Inappropriate [OE specific]
 
 ---
  ostra/ostra-cg        | 2 +-
diff --git a/meta-oe/recipes-devtools/perl/libdev-checklib-perl/0001-CheckLib.pm-don-t-execute-the-binary.patch b/meta-oe/recipes-devtools/perl/libdev-checklib-perl/0001-CheckLib.pm-don-t-execute-the-binary.patch
index 8d4920b390..f79b158114 100644
--- a/meta-oe/recipes-devtools/perl/libdev-checklib-perl/0001-CheckLib.pm-don-t-execute-the-binary.patch
+++ b/meta-oe/recipes-devtools/perl/libdev-checklib-perl/0001-CheckLib.pm-don-t-execute-the-binary.patch
@@ -21,7 +21,7 @@ and use the return status to determine the lib's
 checking status is not appropriate in cross compile env.
  $ /yocto/builds/upgrade1/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/4.050-r0/git/assertlibCOw_eujb
 
-Upstream-Status: Inappropriate[oe specific]
+Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
diff --git a/meta-oe/recipes-extended/libpwquality/files/add-missing-python-include-dir-for-cross.patch b/meta-oe/recipes-extended/libpwquality/files/add-missing-python-include-dir-for-cross.patch
index ec8672107f..636b294073 100644
--- a/meta-oe/recipes-extended/libpwquality/files/add-missing-python-include-dir-for-cross.patch
+++ b/meta-oe/recipes-extended/libpwquality/files/add-missing-python-include-dir-for-cross.patch
@@ -4,7 +4,7 @@ Date: Mon, 3 Aug 2015 13:43:14 +0800
 Subject: [PATCH] setup.py.in: add missing python include dir for cross
  compiling
 
-Upstream-Status: inappropriate [oe-core specific]
+Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
diff --git a/meta-oe/recipes-extended/libreport/files/0001-Makefile.am-remove-doc-and-apidoc.patch b/meta-oe/recipes-extended/libreport/files/0001-Makefile.am-remove-doc-and-apidoc.patch
index 97fb097fef..1ee0dd2f55 100644
--- a/meta-oe/recipes-extended/libreport/files/0001-Makefile.am-remove-doc-and-apidoc.patch
+++ b/meta-oe/recipes-extended/libreport/files/0001-Makefile.am-remove-doc-and-apidoc.patch
@@ -5,7 +5,7 @@ Subject: [PATCH 1/4] Makefile.am: remove doc and apidoc
 
 There was a failure at do_install time, so remove doc to workaround.
 
-Upstream-Status:  Inappropriate workaround
+Upstream-Status: Inappropriate [workaround]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
diff --git a/meta-oe/recipes-extended/libreport/files/0002-configure.ac-remove-prog-test-of-xmlto-and-asciidoc.patch b/meta-oe/recipes-extended/libreport/files/0002-configure.ac-remove-prog-test-of-xmlto-and-asciidoc.patch
index 7f5895ea12..2e691e95fe 100644
--- a/meta-oe/recipes-extended/libreport/files/0002-configure.ac-remove-prog-test-of-xmlto-and-asciidoc.patch
+++ b/meta-oe/recipes-extended/libreport/files/0002-configure.ac-remove-prog-test-of-xmlto-and-asciidoc.patch
@@ -7,7 +7,7 @@ The prog of xmlto and asciidoc were used to generate documents,
 and since the doc module has already been disabled, so we should
 remove the prog test.
 
-Upstream-Status:  Inappropriate workaround
+Upstream-Status: Inappropriate [workaround]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
diff --git a/meta-oe/recipes-extended/libreport/files/0003-without-build-plugins.patch b/meta-oe/recipes-extended/libreport/files/0003-without-build-plugins.patch
index 2ff1731be6..c331677d8d 100644
--- a/meta-oe/recipes-extended/libreport/files/0003-without-build-plugins.patch
+++ b/meta-oe/recipes-extended/libreport/files/0003-without-build-plugins.patch
@@ -3,7 +3,7 @@ From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 26 Apr 2017 03:51:03 -0400
 Subject: [PATCH 3/4] without build plugins
 
-Upstream-Status:  Inappropriate workaround
+Upstream-Status: Inappropriate [workaround]
 
 Rebase to 2.9.1
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
diff --git a/meta-oe/recipes-extended/libreport/files/0004-configure.ac-remove-prog-test-of-augparse.patch b/meta-oe/recipes-extended/libreport/files/0004-configure.ac-remove-prog-test-of-augparse.patch
index 4ba69c793d..986e7ec419 100644
--- a/meta-oe/recipes-extended/libreport/files/0004-configure.ac-remove-prog-test-of-augparse.patch
+++ b/meta-oe/recipes-extended/libreport/files/0004-configure.ac-remove-prog-test-of-augparse.patch
@@ -5,7 +5,7 @@ Subject: [PATCH 4/4] configure.ac: remove prog test of augparse
 
 The build time does not require it.
 
-Upstream-Status:  Inappropriate workaround
+Upstream-Status: Inappropriate [workaround]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
diff --git a/meta-oe/recipes-extended/nana/nana/change-mandir-to-DESTDIR.patch b/meta-oe/recipes-extended/nana/nana/change-mandir-to-DESTDIR.patch
index 653a7e44c1..54098f721d 100644
--- a/meta-oe/recipes-extended/nana/nana/change-mandir-to-DESTDIR.patch
+++ b/meta-oe/recipes-extended/nana/nana/change-mandir-to-DESTDIR.patch
@@ -3,7 +3,7 @@ From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Thu, 4 Dec 2014 03:50:19 +0900
 Subject: [PATCH 1/2] change mandir to DESTDIR
 
-Upstream-Status: pending
+Upstream-Status: Pending
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
diff --git a/meta-oe/recipes-extended/nana/nana/modify-acinclude.m4-and-configure.in.patch b/meta-oe/recipes-extended/nana/nana/modify-acinclude.m4-and-configure.in.patch
index aeb25466ca..043fd85500 100644
--- a/meta-oe/recipes-extended/nana/nana/modify-acinclude.m4-and-configure.in.patch
+++ b/meta-oe/recipes-extended/nana/nana/modify-acinclude.m4-and-configure.in.patch
@@ -7,7 +7,7 @@ this patch is from Debian to fix build errors.
 "acinclude.m4:34: error: automatic de-ANSI-fication
 support has been removed"
 
-Upstream-Status: pending
+Upstream-Status: Pending
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
index 552172d397..c1480406fe 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
@@ -12,7 +12,7 @@ since 2.6.13 [1].
 (it would require installing the libc headers otherwise,
  for the test  to detect /usr/include/sys/inotify.h.)
 
-Upstream-Status: Inappropriate[OE-specific]
+Upstream-Status: Inappropriate [OE-specific]
 
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
 ---
diff --git a/meta-oe/recipes-extended/sgpio/sgpio/Makefile-error-fix.patch b/meta-oe/recipes-extended/sgpio/sgpio/Makefile-error-fix.patch
index 709f8316f1..40c85e2ce8 100644
--- a/meta-oe/recipes-extended/sgpio/sgpio/Makefile-error-fix.patch
+++ b/meta-oe/recipes-extended/sgpio/sgpio/Makefile-error-fix.patch
@@ -3,7 +3,7 @@ Fix Makefile:
 * change the file format from dos to unix to avoid do_patch failed.
 * override gcc,SBIN_DIR and INSTALL for cross-compilation.
 
-Upstream-Status: pending
+Upstream-Status: Pending
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
diff --git a/meta-oe/recipes-graphics/ftgl/ftgl/0001-use-pkg-config-to-find-freetype2.patch b/meta-oe/recipes-graphics/ftgl/ftgl/0001-use-pkg-config-to-find-freetype2.patch
index cf03cd0f29..e5ed0bdb86 100644
--- a/meta-oe/recipes-graphics/ftgl/ftgl/0001-use-pkg-config-to-find-freetype2.patch
+++ b/meta-oe/recipes-graphics/ftgl/ftgl/0001-use-pkg-config-to-find-freetype2.patch
@@ -6,7 +6,7 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
-Upstream-Status: inappropriate [OE specific]
+Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
diff --git a/meta-oe/recipes-graphics/fvwm/fvwm/0001-Fix-compilation-for-disabled-gnome.patch b/meta-oe/recipes-graphics/fvwm/fvwm/0001-Fix-compilation-for-disabled-gnome.patch
index 50003e3318..4886248233 100644
--- a/meta-oe/recipes-graphics/fvwm/fvwm/0001-Fix-compilation-for-disabled-gnome.patch
+++ b/meta-oe/recipes-graphics/fvwm/fvwm/0001-Fix-compilation-for-disabled-gnome.patch
@@ -10,7 +10,7 @@ COMPAT_OLD_KEYSYMDEF is a check for a legacy system, which our system
 most definitely is not.  It is accomplished by trying to execute
 a program, which does not work when cross compiling.
 
-Upstream-Status: inappropriate [OE specific]
+Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Jarmo Jaakkola <jarmo.jaakkola@vincit.fi>
 Signed-off-by: Riku Hämäläinen <riku.hamalainen@ge.com>
 Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0002-let-autotools-create-lxdm.conf.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0002-let-autotools-create-lxdm.conf.patch
index 75dc10c979..5af4e5233c 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm/0002-let-autotools-create-lxdm.conf.patch
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/0002-let-autotools-create-lxdm.conf.patch
@@ -8,9 +8,7 @@ Content-Transfer-Encoding: 8bit
 
 in out of tree builds lxdm.conf is empty
 
-Upstream-Status: submitted [1]
-
-[1] http://sourceforge.net/p/lxde/mailman/message/32901417/
+Upstream-Status: Submitted [http://sourceforge.net/p/lxde/mailman/message/32901417/]
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
diff --git a/meta-oe/recipes-graphics/xorg-app/sessreg/0001-Makefile.am-Error-Fix.patch b/meta-oe/recipes-graphics/xorg-app/sessreg/0001-Makefile.am-Error-Fix.patch
index c5a70f5d08..bfda2dfe71 100644
--- a/meta-oe/recipes-graphics/xorg-app/sessreg/0001-Makefile.am-Error-Fix.patch
+++ b/meta-oe/recipes-graphics/xorg-app/sessreg/0001-Makefile.am-Error-Fix.patch
@@ -8,7 +8,7 @@ Do not compile man dir since error always occur.
  | make[2]: *** [sessreg.1] Error 1
 It is not a good way.But can remove it from SKIP_RECIPE.
 
-Upstream-Status: pending
+Upstream-Status: Pending
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
index f3dc8a466a..15ced551db 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
@@ -10,7 +10,7 @@ Subject: [PATCH] makedumpfile: replace hardcode CFLAGS
 * Forcibly to link dynamic library as the poky build
   system doesn't build static library by default
 
-Upstream-Status: Inappropriate[oe specific]
+Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 
diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph.py-parse-unfished-cpu-exec-line.patch b/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph.py-parse-unfished-cpu-exec-line.patch
index 33557275fb..fc5991d464 100644
--- a/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph.py-parse-unfished-cpu-exec-line.patch
+++ b/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph.py-parse-unfished-cpu-exec-line.patch
@@ -11,7 +11,7 @@ lock_torture_wr-96 was split to different line due to limited buffer
 size(1k) set in kernel, check this case and re-parse the unfinished
 line.
 
-Upstream-Status: [Submitted: https://github.com/intel/pm-graph/pull/20]
+Upstream-Status: Submitted [https://github.com/intel/pm-graph/pull/20]
 
 Signed-off-by: Liwei Song <liwei.song@windriver.com>
 ---
diff --git a/meta-oe/recipes-multimedia/id3lib/id3lib/acdefine.patch b/meta-oe/recipes-multimedia/id3lib/id3lib/acdefine.patch
index 09edecc964..c8b546b179 100644
--- a/meta-oe/recipes-multimedia/id3lib/id3lib/acdefine.patch
+++ b/meta-oe/recipes-multimedia/id3lib/id3lib/acdefine.patch
@@ -1,6 +1,6 @@
 Add a description to the AC_DEFINE statements so that it appears in config.h and silences a fatal warning.
 
-Upstream-Status:Pending
+Upstream-Status: Pending
 Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
 ---
  configure.in | 6 +++---
diff --git a/meta-oe/recipes-support/daemontools/daemontools/0001-Fix-signature-of-main-function.patch b/meta-oe/recipes-support/daemontools/daemontools/0001-Fix-signature-of-main-function.patch
index 19f0ae7f21..4b332a000e 100644
--- a/meta-oe/recipes-support/daemontools/daemontools/0001-Fix-signature-of-main-function.patch
+++ b/meta-oe/recipes-support/daemontools/daemontools/0001-Fix-signature-of-main-function.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Fix signature of main function
 Clang-15 errors out otherewise.
 Include needed headers for missing functions
 
-Upstream-Status:Pending
+Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/chkshsgr.c    | 2 +-
diff --git a/meta-oe/recipes-support/eject/eject/eject-timeout.patch b/meta-oe/recipes-support/eject/eject/eject-timeout.patch
index de8146f32a..4511e17069 100644
--- a/meta-oe/recipes-support/eject/eject/eject-timeout.patch
+++ b/meta-oe/recipes-support/eject/eject/eject-timeout.patch
@@ -1,6 +1,6 @@
 allow a longer timeout
 
-Upstream-Status: Backport 
+Upstream-Status: Backport
 
 Signed-off-by: Morgan Little <morgan.little@windriver.com>
 
diff --git a/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch b/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
index b896770d91..642d7d1662 100644
--- a/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
+++ b/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] cmake: remove build flags
 
 Remove the build flags to improve reproducibility.
 
-Upstream-Status: Inappropriate[oe specific]
+Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
diff --git a/meta-oe/recipes-support/hstr/files/0001-Use-OE-specific-checks-for-ncurses.patch b/meta-oe/recipes-support/hstr/files/0001-Use-OE-specific-checks-for-ncurses.patch
index d7eb558a9f..421d824ee0 100644
--- a/meta-oe/recipes-support/hstr/files/0001-Use-OE-specific-checks-for-ncurses.patch
+++ b/meta-oe/recipes-support/hstr/files/0001-Use-OE-specific-checks-for-ncurses.patch
@@ -3,7 +3,7 @@ From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 2 Mar 2022 06:22:15 +0000
 Subject: [PATCH] Use OE-specific checks for ncurses
 
-Upstream-Status: Inappropriate[oe specific]
+Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
diff --git a/meta-oe/recipes-support/hstr/files/0001-configure.ac-Don-t-use-AC_CHECK_FILE.patch b/meta-oe/recipes-support/hstr/files/0001-configure.ac-Don-t-use-AC_CHECK_FILE.patch
index e9b44c4c91..832d768ff3 100644
--- a/meta-oe/recipes-support/hstr/files/0001-configure.ac-Don-t-use-AC_CHECK_FILE.patch
+++ b/meta-oe/recipes-support/hstr/files/0001-configure.ac-Don-t-use-AC_CHECK_FILE.patch
@@ -7,7 +7,7 @@ AC_CHECK_FILE is not suitable for cross-compile, so
 remove it to fix configure error:
 cannot check for file existence when cross compiling
 
-Upstream-Status: Inappropriate[oe specific]
+Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
diff --git a/meta-oe/recipes-support/libee/libee/libee-parallel-make.patch b/meta-oe/recipes-support/libee/libee/libee-parallel-make.patch
index 25e5c6ae02..8bb23aafca 100644
--- a/meta-oe/recipes-support/libee/libee/libee-parallel-make.patch
+++ b/meta-oe/recipes-support/libee/libee/libee-parallel-make.patch
@@ -3,7 +3,7 @@ fix parallel compiling problem
 without specifying libee_convert_DEPENDENCIES = libee.la, libee_convert
 can't find libee.la when linking as libee is not generated yet.
  
-Upstream-Status: pending
+Upstream-Status: Pending
 
 Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
 ---
diff --git a/meta-oe/recipes-support/libharu/libharu/libharu-RELEASE_2_3_0_cmake.patch b/meta-oe/recipes-support/libharu/libharu/libharu-RELEASE_2_3_0_cmake.patch
index 332be1b3f7..05f78ed735 100644
--- a/meta-oe/recipes-support/libharu/libharu/libharu-RELEASE_2_3_0_cmake.patch
+++ b/meta-oe/recipes-support/libharu/libharu/libharu-RELEASE_2_3_0_cmake.patch
@@ -3,7 +3,7 @@ https://src.fedoraproject.org/rpms/libharu
 
 Fix the install destination of some files.
 
-Upstream-Status: inappropriate
+Upstream-Status: Inappropriate
 
 Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 
diff --git a/meta-oe/recipes-support/liboauth/liboauth/0001-Support-OpenSSL-1.1.0.patch b/meta-oe/recipes-support/liboauth/liboauth/0001-Support-OpenSSL-1.1.0.patch
index 8691eae2b5..2631f4ae73 100644
--- a/meta-oe/recipes-support/liboauth/liboauth/0001-Support-OpenSSL-1.1.0.patch
+++ b/meta-oe/recipes-support/liboauth/liboauth/0001-Support-OpenSSL-1.1.0.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] Support OpenSSL 1.1.0
 
 Taken from https://github.com/x42/liboauth/issues/9
 
-Upstream-Status: Submitted[https://github.com/x42/liboauth/issues/9]
+Upstream-Status: Submitted [https://github.com/x42/liboauth/issues/9]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/hash.c | 65 ++++++++++++++++++++++++++++++++++++------------------
diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
index 7334800304..c80e91244f 100644
--- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
@@ -1,7 +1,7 @@
 Subject: [PATCH] syslog-ng.service: the syslog-ng service can not start 
  successfully,so modify it.
 
-Upstream-Status: pending
+Upstream-Status: Pending
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 Updated-by: Andrej Valek <andrej.valek@siemens.com>
diff --git a/meta-python/recipes-connectivity/telepathy/telepathy-python3-0.15.19/remove_duplicate_install.patch b/meta-python/recipes-connectivity/telepathy/telepathy-python3-0.15.19/remove_duplicate_install.patch
index 7b1dc8c6b3..04d2da8ef2 100644
--- a/meta-python/recipes-connectivity/telepathy/telepathy-python3-0.15.19/remove_duplicate_install.patch
+++ b/meta-python/recipes-connectivity/telepathy/telepathy-python3-0.15.19/remove_duplicate_install.patch
@@ -9,7 +9,7 @@ twice. Remove one errors.py from the installation list.
     
 Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
     
-Upstream-Status: Inappropirate [upstream inactive]
+Upstream-Status: Inappropriate [upstream inactive]
     
 diff --git a/src/Makefile.am b/src/Makefile.am
 index 5c27dfe..7536e43 100644
diff --git a/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch b/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
index 23a06bf622..309a00122a 100644
--- a/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
+++ b/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
@@ -9,7 +9,7 @@ we support basic/digest authentication.
 Add KickstartAuthError to report authentication failure,
 which the invoker could parse this specific error.
 
-Upstream-Status: inappropriate [oe specific]
+Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
diff --git a/meta-python/recipes-extended/python-pykickstart/files/0003-comment-out-sections-shutdown-and-environment-in-gen.patch b/meta-python/recipes-extended/python-pykickstart/files/0003-comment-out-sections-shutdown-and-environment-in-gen.patch
index 7ab7346860..6242e23b9c 100644
--- a/meta-python/recipes-extended/python-pykickstart/files/0003-comment-out-sections-shutdown-and-environment-in-gen.patch
+++ b/meta-python/recipes-extended/python-pykickstart/files/0003-comment-out-sections-shutdown-and-environment-in-gen.patch
@@ -6,7 +6,7 @@ Subject: [PATCH 3/4] comment out sections shutdown and environment in
 
 Both of them is disabled by default.
 
-Upstream-Status: Inappropriate[oe specific]
+Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
diff --git a/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch b/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch
index b09bb74df8..abe2c87e00 100644
--- a/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch
+++ b/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch
@@ -8,7 +8,7 @@ network, it failed and wait 300s to break, we should retry
 to invoke request with timeout explicitly. So if it the
 network is up, the fetch works.
 
-Upstream-Status: inappropriate [oe specific]
+Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
-- 
2.39.2


