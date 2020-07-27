Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.50868.1595836880434724277
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2020 01:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VstHA0Zb;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id w9so16064161ejc.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2020 01:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=7J1ieZpEIxvm+G93taRa405KccispbvAlncPXTRLg/s=;
        b=VstHA0ZbKEwJin1D5OdcuCDBwDxQzsia1WFq1gChVb+r3vp8gobCBu0SM8r0Qsq06o
         tmSf0LJC4588/Y8cv1GuHK1R0KscZWxXIKqz25n9rlBIQ5l3nGS/TylMZD3eftYO8JDk
         7FtE9GmX/BFjSsfHSCLGMm6My9yF4Ur7CH5Or3k5YkkOlj5XlKkgT20kfKeS/G7RQfGb
         QxSw/I9x7WVWH8bSdfZpdYN15xJV1oQnQiotbBLWUcxjK2APEsmGpsAGfkwkTmgfvYds
         pAokT24d8efIyKzXqH6UevsFKiL4zOxCyQzsqhT8laMviLmuFJgW19qoaDVVcPDG1HmJ
         IuPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7J1ieZpEIxvm+G93taRa405KccispbvAlncPXTRLg/s=;
        b=oyC3vR4SbtBT2ryf0wYfzoEeQS5Mxy3x8ZZDxSddZcalgZSymAHoGt+BSu1Q6Gsp57
         SuP38dR/yLA8xR/AXacoerILbGYkbCOiEElIaIiWFp26BNnw4A7o83EWdiXw2EEXQRlS
         11wCQtYGUdVidvytBa3nryq9q9aHsbXpJzih4oRuDOwdvZRTK2PquZ1bznJUxjtEgqqC
         vV72AGaVBwUbgBwkp6BSLwhfzqB1djtelWATKT0GKH2PGzvGbtF05krw6nIEwCISTAp3
         qo/dGltxO5hXbfEQFJCZuDLdABgR6JX4fR8xDQAXlqfzoTnfptq+ieePcUwG6LXTlFRk
         br7w==
X-Gm-Message-State: AOAM5325ZO0zJEZ+1J1kKWjOVwmV3NKjSBTQPJtsaLPyo2DahfwxXoPS
	bzrMf5Ah4FA41gThZhNU/rm29ZQC
X-Google-Smtp-Source: ABdhPJy0by3n1o1PD7YvE3sk5lhiS6GzdGksQakLyAXK2NkY1l79Inv/fHmoM8nieJirQZKuR5Tnbg==
X-Received: by 2002:a17:906:c0da:: with SMTP id bn26mr11696541ejb.359.1595836878611;
        Mon, 27 Jul 2020 01:01:18 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from Unimatrix05-Bionic.lan ([2001:b07:5d32:c012:3f:a5ba:1524:a0bb])
        by smtp.gmail.com with ESMTPSA id h24sm6535226ejk.117.2020.07.27.01.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 01:01:17 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vboxguestdrivers: upgrade 6.1.6 -> 6.1.12
Date: Mon, 27 Jul 2020 10:01:16 +0200
Message-Id: <20200727080116.1984-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 ...rs_6.1.6.bb => vboxguestdrivers_6.1.12.bb} |  4 +-
 .../websocketpp/websocketpp_0.8.3.bb          | 38 +++++++++++++++++++
 2 files changed, 40 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.6.bb => vboxguestdrivers_6.1.12.bb} (95%)
 create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp_0.8.3.bb

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.6.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.12.bb
similarity index 95%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.6.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.12.bb
index 89b1ee11e..dfa15da2d 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.6.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.12.bb
@@ -14,8 +14,8 @@ VBOX_NAME = "VirtualBox-${PV}"
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
 "
-SRC_URI[md5sum] = "fe6328d22dfb20ea372daa4b58b12374"
-SRC_URI[sha256sum] = "b031c30d770f28c5f884071ad933e8c1f83e65b93aaba03a4012077c1d90a54f"
+SRC_URI[md5sum] = "3c351f7fd6376e0bb3c8489505a9450c"
+SRC_URI[sha256sum] = "05eff0321daa72f6d00fb121a6b4211f39964778823806fa0b7b751667dec362"
 
 S = "${WORKDIR}/vbox_module"
 
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.3.bb b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.3.bb
new file mode 100644
index 000000000..79a5ac5c4
--- /dev/null
+++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.3.bb
@@ -0,0 +1,38 @@
+SUMMARY = "C++/Boost Asio based websocket client/server library."
+SECTION = "libs/network"
+HOMEPAGE = "https://github.com/zaphoyd/websocketpp"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${S}/COPYING;md5=4d168d763c111f4ffc62249870e4e0ea"
+
+DEPENDS = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'openssl boost zlib', '', d)} "
+
+SRC_URI = "git://github.com/zaphoyd/websocketpp.git;protocol=https \
+           file://0001-cmake-Use-GNUInstallDirs.patch \
+           file://855.patch \
+           file://857.patch \
+           file://0001-Correct-clang-compiler-flags.patch \
+          "
+
+EXTRA_OECMAKE = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '-DBUILD_EXAMPLES=ON -DBUILD_TESTS=ON', '', d)} "
+
+# this is an header only library, do not depend on the main package
+RDEPENDS_${PN}-dev = ""
+
+# to add this package to an SDK, since it isn't a reverse-dependency of anything, just use something like this:
+# TOOLCHAIN_TARGET_TASK_append = " websocketpp-dev"
+
+# tag 0.8.2
+SRCREV= "56123c87598f8b1dd471be83ca841ceae07f95ba"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+PACKAGES =+ "${PN}-examples"
+
+FILES_${PN}-examples = "${docdir}"
+
+do_install_append() {
+	install -d ${D}${docdir}/${BPN}
+	cp -R ${S}/examples ${D}${docdir}/${BPN}
+}
-- 
2.17.1

