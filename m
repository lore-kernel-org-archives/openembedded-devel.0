Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 88E5A65E0C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Oct 2014 06:49:53 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id hi2so8756791wib.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Oct 2014 23:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=3zmAz8QpDdSyskUs03gz95teU1ieqG6YsZ+rS8a/cc8=;
	b=urTh4gkqieF6cOJ6ZUasOBF/xJpxH2KBGrICmeXJCBtNqPC831zI160lJ99t3oDES2
	8iQvhrTGmeef3QzrKqrEXCaibZVhQeNXoxrNs7g11uXzyRjk8PXDIfk6ZMuRFQF65/Dv
	oLoLHxN6XtsTcslx7qiqs0MPsghuth05ZLVUEA6zrioQ4Gm+jTG6v661liLzhm7d4C7m
	3vtMgW6QiheVk2Cbwy20xs9ptWZaX6LQQLquvXPsy5gGAXzBtg2sfLu21Hd1UzSYUGq9
	JMKN0rziLolC2VCOyrnSJ8z0PXmNqXh2v1Qe3IExWMTBA0J4TL25ec17nKyKEY/ZQbze
	7DZg==
X-Received: by 10.180.186.1 with SMTP id fg1mr2156600wic.22.1412664594579;
	Mon, 06 Oct 2014 23:49:54 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-251.hsi05.unitymediagroup.de. [176.198.252.251])
	by mx.google.com with ESMTPSA id u8sm5882757wjq.1.2014.10.06.23.49.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Oct 2014 23:49:53 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Oct 2014 08:49:45 +0200
Message-Id: <1412664585-21664-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] lxdm: update to latest sources and fixes
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
X-List-Received-Date: Tue, 07 Oct 2014 06:49:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* /etc/lxdm/lxdm.conf was empty since out of tree build causing greeter not started
* pam is now an option to configure - set it based upon distro feature
* bash was added to RDEPENDS - it is required by /etc/lxdm/Xsession

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../lxdm/0002-let-autotools-create-lxdm.conf.patch | 62 ++++++++++++++++++++++
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb          | 24 +++++----
 2 files changed, 75 insertions(+), 11 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0002-let-autotools-create-lxdm.conf.patch

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0002-let-autotools-create-lxdm.conf.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0002-let-autotools-create-lxdm.conf.patch
new file mode 100644
index 0000000..43f542a
--- /dev/null
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/0002-let-autotools-create-lxdm.conf.patch
@@ -0,0 +1,62 @@
+From 0ea0329f2c19a43acdc8444fa89e233ba617973d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 6 Oct 2014 13:06:24 +0200
+Subject: [PATCH] let autotools create lxdm.conf
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+in out of tree builds lxdm.conf is empty
+
+Upstream-Status: submitted [1]
+
+[1] http://sourceforge.net/p/lxde/mailman/message/32901417/
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.ac      | 1 +
+ data/Makefile.am  | 5 -----
+ data/lxdm.conf.in | 2 +-
+ 3 files changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f28c89a..a2fff5b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -183,6 +183,7 @@ AC_CONFIG_FILES([
+ 	data/PreReboot
+ 	data/PreShutdown
+ 	data/LoginReady
++	data/lxdm.conf
+ ])
+ AC_CONFIG_FILES([data/lxdm], [chmod +x data/lxdm])
+ AC_OUTPUT
+diff --git a/data/Makefile.am b/data/Makefile.am
+index 9500da9..ad64b11 100644
+--- a/data/Makefile.am
++++ b/data/Makefile.am
+@@ -1,8 +1,3 @@
+-FULL_LIBEXECDIR=$(libexecdir)
+-
+-lxdm.conf: lxdm.conf.in
+-	cat lxdm.conf.in | sed 's,@FULL_LIBEXECDIR@,$(FULL_LIBEXECDIR),' > $@
+-
+ NULL=
+ 
+ sbin_SCRIPTS = lxdm
+diff --git a/data/lxdm.conf.in b/data/lxdm.conf.in
+index d93f280..6206262 100644
+--- a/data/lxdm.conf.in
++++ b/data/lxdm.conf.in
+@@ -19,7 +19,7 @@
+ # skip_password=1
+ 
+ ## greeter used to welcome the user
+-greeter=@FULL_LIBEXECDIR@/lxdm-greeter-gtk
++greeter=@libexecdir@/lxdm-greeter-gtk
+ 
+ [server]
+ ## arg used to start xserver, not fully function
+-- 
+1.8.3.1
+
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
index dc40fb2..a3dcc1b 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
@@ -5,14 +5,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = " \
     git://lxde.git.sourceforge.net/gitroot/lxde/${BPN};branch=master \
     file://lxdm.conf \
-    file://lxdm-pam \
-    file://lxdm-pam-debug \
+    ${@base_contains('DISTRO_FEATURES', 'pam', 'file://lxdm-pam file://lxdm-pam-debug', '', d)} \
     ${@base_contains("DISTRO_TYPE", "debug", "", "file://0001-lxdm.conf.in-blacklist-root-for-release-images.patch",d)} \
+    file://0002-let-autotools-create-lxdm.conf.patch \
 "
 
-LXDM_PAM = "${@base_contains("DISTRO_TYPE", "debug", "lxdm-pam-debug", "lxdm-pam",d)}"
-
-SRCREV = "07fb151a99ef99318b71f3de0afbba977b1e6267"
+SRCREV = "bf90ec7df5ff6745f703500c5792c344fbaef301"
 PV = "0.5.0+git${SRCPV}"
 PE = "1"
 
@@ -29,7 +27,9 @@ S = "${WORKDIR}/git"
 CFLAGS_append = " -fno-builtin-fork -fno-builtin-memset -fno-builtin-strstr "
 
 EXTRA_OECONF += "--enable-gtk3=no --enable-password=yes --with-x -with-xconn=xcb \
-    ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/ --disable-consolekit', '--without-systemdsystemunitdir', d)}"
+    ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/ --disable-consolekit', '--without-systemdsystemunitdir', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
+"
 
 do_configure_prepend() {
     cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
@@ -48,10 +48,12 @@ do_compile_append() {
 do_install_append() {
     install -d ${D}${localstatedir}/lib/lxdm
     install -m 644 ${WORKDIR}/lxdm.conf ${D}${localstatedir}/lib/lxdm
-    # ArchLinux version of pam config has the following advantages:
-    # * simple setup of passwordless login
-    # * in XFCE powerdown/restart enabled in logoff dialog
-    install -m 644 ${WORKDIR}/${LXDM_PAM} ${D}${sysconfdir}/pam.d/lxdm
+    if ${@base_contains('DISTRO_FEATURES', 'pam', 'true', 'false', d)}; then
+        # ArchLinux version of pam config has the following advantages:
+        # * simple setup of passwordless login
+        # * in XFCE powerdown/restart enabled in logoff dialog
+        install -m 644 ${WORKDIR}/${@base_contains("DISTRO_TYPE", "debug", "lxdm-pam-debug", "lxdm-pam",d)} ${D}${sysconfdir}/pam.d/lxdm
+    fi
 }
 
 # make installed languages choosable
@@ -68,7 +70,7 @@ done
 sed -i "s:last_langs=.*$:last_langs=$langs:g" $D${localstatedir}/lib/lxdm/lxdm.conf
 }
 
-RDEPENDS_${PN} = "pam-plugin-loginuid setxkbmap"
+RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-loginuid', '', d)} setxkbmap bash"
 
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
-- 
1.8.3.1


