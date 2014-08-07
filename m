Return-Path: <eduardo@monkey.io>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id A54EA60C19
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Aug 2014 04:51:36 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id la4so5597034vcb.33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 21:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6u6gAROXLX9del8qD2weJyZzZElH0JmoSakYY9Y7BTM=;
	b=PqVoyBPMSWYA6CFIc8wNPdZZDEqGG4B1r7LW5Ci/i/nureeJFNufVX7SnFL5uuM5RX
	gFqRUDbz8uZLqrvjWgv8UNzdVRhIcF6oIniLnm7xWRkzeM6pG7CXengbkUuGQ4ZV9bEn
	hWICY3NsPRdBY9fNKXlQ/T1ddpzzzHV2XPukuBO3AHN8ZiJVCmehZr/WeVSf3KNQD/5s
	WvprZ2ZLis2uMChu/4Z60zpzzSfc0SEZjdc0aqSkUnGNxBZpHq8MYG5g2wBmOMnGk8V5
	uPTWtcDdUPpr1Qa/ioVVzLaR8+vqU/mXAqimzHOJT9Q6Gc4HBrWOtzZ5DDtDqK0EkPJx
	+m4Q==
X-Gm-Message-State: ALoCoQlwP2ttxTzBzuuIUeRP/u243Bpm8rPjdBSnuv2qRYlYgQYled91+mF/GGBkghPudwrY5oIJ
X-Received: by 10.52.160.10 with SMTP id xg10mr455365vdb.1.1407387097370;
	Wed, 06 Aug 2014 21:51:37 -0700 (PDT)
Received: from localhost.localdomain ([186.32.221.184])
	by mx.google.com with ESMTPSA id bm9sm1630871vec.6.2014.08.06.21.51.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Aug 2014 21:51:36 -0700 (PDT)
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Aug 2014 22:49:36 -0600
Message-Id: <1407386976-24889-1-git-send-email-eduardo@monkey.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-webserver][PATCH] monkey: new v1.5.2 release.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Aug 2014 04:51:38 -0000

This patch add the new Monkey HTTP Server v1.5.2. The new Bitbake file
contains the modifications suggested over the patch set for v1.5.1. It
specify each configuration file for CONFFILES_${PN}.

For more details about software changes please visit:

  http://monkey-project.com/Announcements/v1.5.2

=== Build Tests ==

This version and new Bitbake file have been tested on Yocto/Daisy being
packaged and deployed on images based on rpm and ipk successfully.

monkey-yocto/70d57bfd19c01ec055db57e35385ffc4185ae186

Signed-off-by: Eduardo Silva <eduardo@monkey.io>
---
 .../recipes-httpd/monkey/monkey_1.5.1.bb           | 50 -----------------
 .../recipes-httpd/monkey/monkey_1.5.2.bb           | 64 ++++++++++++++++++++++
 2 files changed, 64 insertions(+), 50 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
 create mode 100644 meta-webserver/recipes-httpd/monkey/monkey_1.5.2.bb

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
deleted file mode 100644
index 2de98f4..0000000
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
+++ /dev/null
@@ -1,50 +0,0 @@
-SUMMARY = "Fast and Lightweight HTTP Server for Linux"
-HOMEPAGE = "http://monkey-project.com"
-BUGTRACKER = "https://github.com/monkey/monkey/issues"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
-
-SECTION = "net"
-
-SRC_URI = "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz \
-           file://monkey.service \
-           file://monkey.init"
-
-SRC_URI[md5sum] = "2fe04135728f5c3a86c3a412059e0da3"
-SRC_URI[sha256sum] = "28dfc5e57bbcd305727e7af6a1a0587868db1c1286498757bfeb72edddf457e7"
-
-EXTRA_OECONF = " \
-             --plugdir=${libdir}/monkey/ \
-             --logdir=${localstatedir}/log/monkey/ \
-             --pidfile=${localstatedir}/run/monkey.pid \
-             --default-user=www-data \
-             --datadir=${localstatedir}/www/monkey/ \
-             --sysconfdir=${sysconfdir}/monkey/ \
-             --enable-plugins=* \
-             --disable-plugins=polarssl \
-             --debug \
-             --malloc-libc"
-
-inherit autotools-brokensep pkgconfig update-rc.d systemd
-
-INITSCRIPT_NAME = "monkey"
-INITSCRIPT_PARAMS = "defaults 70"
-
-SYSTEMD_SERVICE_${PN} = "monkey.service"
-
-FILES_${PN} += "${localstatedir}/www/monkey/"
-
-# temporarily remove, because ipk doesn't allow directories in CONFFILES
-# CONFFILES_${PN} = "${sysconfdir}/monkey/"
-
-do_install_append() {
-
-    mkdir -p ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/monkey.init ${D}${sysconfdir}/init.d/monkey
-
-    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d ${D}${systemd_unitdir}/system
-        install -m 644 ${WORKDIR}/monkey.service ${D}/${systemd_unitdir}/system
-    fi
-}
diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.2.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.5.2.bb
new file mode 100644
index 0000000..fcd40e0
--- /dev/null
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.2.bb
@@ -0,0 +1,64 @@
+SUMMARY = "Fast and Lightweight HTTP Server for Linux"
+HOMEPAGE = "http://monkey-project.com"
+BUGTRACKER = "https://github.com/monkey/monkey/issues"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+
+SECTION = "net"
+
+SRC_URI = "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz \
+           file://monkey.service \
+           file://monkey.init"
+
+SRC_URI[md5sum] = "c90ccba23a814265c7e0fd3a75f883fd"
+SRC_URI[sha256sum] = "2048d49662895f83df475e22d87c45ea8022c0b1565bba222bda2192fd02c349"
+
+EXTRA_OECONF = "--plugdir=${libdir}/monkey/ \
+                --logdir=${localstatedir}/log/monkey/ \
+                --pidfile=${localstatedir}/run/monkey.pid \
+                --default-user=www-data \
+                --datadir=${localstatedir}/www/monkey/ \
+                --sysconfdir=${sysconfdir}/monkey/ \
+                --enable-plugins=* \
+                --disable-plugins=polarssl \
+                --debug \
+                --malloc-libc"
+
+inherit autotools-brokensep pkgconfig update-rc.d systemd
+
+INITSCRIPT_NAME = "monkey"
+INITSCRIPT_PARAMS = "defaults 70"
+
+SYSTEMD_SERVICE_${PN} = "monkey.service"
+
+FILES_${PN} += "${localstatedir}/www/monkey/"
+
+CONFFILES_${PN} = "${sysconfdir}/monkey/monkey.conf \
+                   ${sysconfdir}/monkey/sites/default \
+                   ${sysconfdir}/monkey/monkey.mime \
+                   ${sysconfdir}/monkey/plugins.load \
+                   ${sysconfdir}/monkey/plugins/proxy_reverse/proxy_reverse.conf \
+                   ${sysconfdir}/monkey/plugins/mandril/mandril.conf \
+                   ${sysconfdir}/monkey/plugins/fastcgi/fastcgi.conf \
+                   ${sysconfdir}/monkey/plugins/logger/logger.conf \
+                   ${sysconfdir}/monkey/plugins/cgi/cgi.conf \
+                   ${sysconfdir}/monkey/plugins/cheetah/cheetah.conf \
+                   ${sysconfdir}/monkey/plugins/dirlisting/dirhtml.conf \
+                   ${sysconfdir}/monkey/plugins/dirlisting/themes/guineo/header.theme \
+                   ${sysconfdir}/monkey/plugins/dirlisting/themes/guineo/footer.theme \
+                   ${sysconfdir}/monkey/plugins/dirlisting/themes/guineo/entry.theme \
+                   ${sysconfdir}/monkey/plugins/auth/README \
+                   ${sysconfdir}/monkey/plugins/auth/monkey.users \
+                   "
+
+do_install_append() {
+
+    mkdir -p ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/monkey.init ${D}${sysconfdir}/init.d/monkey
+
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 644 ${WORKDIR}/monkey.service ${D}/${systemd_unitdir}/system
+    fi
+}
-- 
1.9.1


