Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979F7C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:49:42 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.6363.1659448181301755122
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jyueiToD;
 spf=pass (domain: gmail.com, ip: 209.85.216.42,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 f11-20020a17090a4a8b00b001f2f7e32d03so1639943pjh.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+boqYV0pygKthFXwPzA3vrvjGjaC2H7/usIcbCRzjn8=;
        b=jyueiToD2xxB8fUAVr9fYhthCrLNa6qaUxWjMWjWX46r4lbd7prXjC0r7NXSHwpmIl
         G7YbHSpvgNahUWcVqaB1E+q6PRj34r7eLCFl8t5BnTbKyaGxZ4uqkHMuT3fIBtPQ5uC9
         /6DD/U8igtLXIXqBFaQcp+igKIgfAF0pzlmc2JPzpZYGiigOubzbb2dXzUwsZjrYiZDK
         OkBzCEz/u8ICZYnvQAb//C302TFvkNxeKgi1Jyro+SSJV15hkGoyoXExp33jLC6OQKeH
         ErAOquL2DDso8b+Gv+RygTeLJc2MF435/u9plTE/UMZCvUmhVmYrupBEuKRBBK0G38Xk
         EMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+boqYV0pygKthFXwPzA3vrvjGjaC2H7/usIcbCRzjn8=;
        b=xFfRaI6cSYiSLsE9k3Zvq4dK8MsBwyCAL5rmqHVvIdTCDpuGyt20iG1torbhWcvWOt
         m8gmuBZobWeGP2YqGRItC9NDlvkHDdpmU/+4S5DriVLemtCLA62bDMlBs+QsiYSyXfz+
         /Xk+XzNfpzNs7eDjEfb6QZpBfZFjpy9COAgezDK7R+6yCVINMwOnQeNmK27wqaxNIWUM
         iW4x1DIy2k+CBWeqWFjuWd0RjqAmBitAaAxHIOwF1LkQiaAmWCPNCctWZol9B9w7BXHO
         hMQJuH+MkgYB40L9JFJjaVDaXURPnzd43H4B8ipo7PAZ1kzQhYWylLsdXJZZ73+B8BPV
         k4/A==
X-Gm-Message-State: ACgBeo3kvyn4VXvecoP9Ol9X/StsAXkJrjOKE6weohDdcDNhpoXryB8V
	CZCFTFp/kSklrzrgC59XBp8o318CIp8=
X-Google-Smtp-Source: 
 AA6agR74qxK2E889q8AmKUiD0TubiSWaj/b51U7CJGI6ZAeGBOxxw7mmRo3QJuxRIzQKplGXNW8mWA==
X-Received: by 2002:a17:90b:4cc4:b0:1f4:eec1:e168 with SMTP id
 nd4-20020a17090b4cc400b001f4eec1e168mr13984399pjb.116.1659448180239;
        Tue, 02 Aug 2022 06:49:40 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 u8-20020a170902e80800b001635b86a790sm12042286plg.44.2022.08.02.06.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 06:49:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH] meta-oe: Add leading whitespace for append
 operator
Date: Tue,  2 Aug 2022 06:47:38 -0700
Message-Id: <20220802134738.954567-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 13:49:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98100

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 92441f9d6a958c245a03f89ec44ef2c17dd6b0ee)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb | 2 +-
 meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb                  | 2 +-
 meta-oe/recipes-devtools/lua/lua_5.3.6.bb                     | 2 +-
 meta-oe/recipes-extended/gnuplot/gnuplot_5.2.8.bb             | 2 +-
 meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb      | 2 +-
 meta-oe/recipes-support/anthy/anthy_9100h.bb                  | 4 ++--
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
index db7a8d7933..d1b7134b83 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://github.com/ubinux/dnf-plugin-tui.git;branch=master;protocol=htt
 SRCREV = "c5416adeb210154dc4ccc4c3e1c5297d83ebd41e"
 PV = "1.1"
 
-SRC_URI_append_class-target = "file://oe-remote.repo.sample"
+SRC_URI_append_class-target = " file://oe-remote.repo.sample"
 
 inherit distutils3-base
 
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb b/meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb
index fa20941dfc..8a055412f2 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb
@@ -63,6 +63,6 @@ do_configure_prepend_toolchain-clang_x86() {
 
 BBCLASSEXTEND = "native nativesdk"
 
-SYSROOT_DIRS_BLACKLIST_append_class-target = "${baselib}/cmake/grpc"
+SYSROOT_DIRS_BLACKLIST_append_class-target = " ${baselib}/cmake/grpc"
 
 FILES_${PN}-dev += "${bindir}"
diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.6.bb b/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
index 0137cc3c5b..d46d402aa3 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
@@ -32,7 +32,7 @@ PACKAGECONFIG ??= "readline"
 PACKAGECONFIG[readline] = ",,readline"
 
 UCLIBC_PATCHES += "file://uclibc-pthread.patch"
-SRC_URI_append_libc-uclibc = "${UCLIBC_PATCHES}"
+SRC_URI_append_libc-uclibc = " ${UCLIBC_PATCHES}"
 
 TARGET_CC_ARCH += " -fPIC ${LDFLAGS}"
 EXTRA_OEMAKE = "'CC=${CC} -fPIC' 'MYCFLAGS=${CFLAGS} -fPIC' MYLDFLAGS='${LDFLAGS}'"
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.8.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.8.bb
index 926d8851d2..b2c41756e5 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.8.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.8.bb
@@ -32,7 +32,7 @@ BBCLASSEXTEND = "native"
 DEPENDS_class-native = "readline-native"
 PACKAGECONFIG_class-native = ""
 
-SRC_URI_append_class-native = "file://0001-reduce-build-to-conversion-tools-for-native-build.patch"
+SRC_URI_append_class-native = " file://0001-reduce-build-to-conversion-tools-for-native-build.patch"
 
 do_install_class-native() {
     install -d ${D}${bindir}
diff --git a/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb b/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb
index a081cb17a8..27fe0e2c40 100644
--- a/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb
+++ b/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb
@@ -31,4 +31,4 @@ FILES_statgrab-dbg = "${bindir}/.debug/statgrab"
 FILES_saidar = "${bindir}/saidar"
 FILES_saidar-dbg = "${bindir}/.debug/saidar"
 FILES_${PN}-mrtg = "${bindir}/statgrab-make-mrtg-config ${bindir}/statgrab-make-mrtg-index"
-RDEPENDS_${PN}-mrtg_append = "perl statgrab"
+RDEPENDS_${PN}-mrtg_append = " perl statgrab"
diff --git a/meta-oe/recipes-support/anthy/anthy_9100h.bb b/meta-oe/recipes-support/anthy/anthy_9100h.bb
index a65d324eae..b464c00003 100644
--- a/meta-oe/recipes-support/anthy/anthy_9100h.bb
+++ b/meta-oe/recipes-support/anthy/anthy_9100h.bb
@@ -10,8 +10,8 @@ SRC_URI = "http://osdn.dl.sourceforge.jp/anthy/37536/anthy-9100h.tar.gz \
     file://2ch_t.patch \
 "
 
-SRC_URI_append_class-target = "file://target-helpers.patch"
-SRC_URI_append_class-native = "file://native-helpers.patch"
+SRC_URI_append_class-target = " file://target-helpers.patch"
+SRC_URI_append_class-native = " file://native-helpers.patch"
 
 SRC_URI[md5sum] = "1f558ff7ed296787b55bb1c6cf131108"
 SRC_URI[sha256sum] = "d256f075f018b4a3cb0d165ed6151fda4ba7db1621727e0eb54569b6e2275547"
-- 
2.25.1


