Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id DDA007909B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 22:58:06 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id j26-v6so28471wre.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 15:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u3gPtoQJJiN5YK42Xcps1f0I50YA/MhdprBtb4MgznU=;
	b=USgGUk/QsrgCyYVCs/elyfU4ns4aUNGIoG22moEPIqFpy0GFKy+QJ10RY4NEhlMnFt
	BsP8P7aqSR7IsHQeV2avdIJ7aOzEnGHmjXFGZb4N2XrahTPowpJctw6I9qQAqRCwOIRD
	n6uhNze6AmVHU87fcGmXsmW+Kh8BisNUWRrfDoDqaVDag4KFxeEd+bcDof4S4UURuWhc
	6HUnpToevr2h2GopIiFSp4Ng2TdCS15dInpLWf3iCmbbVVm/fkiJoU6u0/f5CR8gPMv9
	bvbchQuf6lnzqQJq/ZTKfS2TxiZq2ixlCLVcUFcAynXPAxAAYiFQPpJDDKJfNbVUbcw8
	RBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u3gPtoQJJiN5YK42Xcps1f0I50YA/MhdprBtb4MgznU=;
	b=FjOo33pJo/xnjCRXOzBZLmyEmslRtAQGZA54VGL/oAeL1TWABKYdGkEE56KHWi3t4R
	Wc6mFE7SEhQEURTkjaFqryn22ES15PCSmTlGiG/VdOU6BIP2fUJ1Y6Eg+NKBnkYV7Qdv
	lYjEveflZiUZxfqEwiwL3BtbyQdmlA9lLL5Kwmlos6akYqt0nTeGeCaFodsXqGSm4n2R
	0VmnRJLIxc+yEZTwIeHjulXmhZFRxKouhKcSKXBA3lbmUJlXUTUiWIS+A+gNprjZcOPq
	cm1VqMahvJc8T0RvpDgW/Uz+u9sRbdh+EPxOQq+lCpXaLkK/T3kU8GrEYmfcBdQyAOr5
	hEww==
X-Gm-Message-State: AOUpUlHosZZqkweLDJ8glfMaR4e14tgrmsvQ2G+P+UtfMJdWtSL2ZwgE
	dTFHQ7oj/xsTq3WuXpUDDfMlJLS0
X-Google-Smtp-Source: AA+uWPzXIeVY3joS8UMFYyxsphVULHBpiELPo8cTatyC/greJEs9CSGi762JvmGC12uOOSZHxWMwaQ==
X-Received: by 2002:adf:9051:: with SMTP id
	h75-v6mr35289149wrh.65.1534892286912; 
	Tue, 21 Aug 2018 15:58:06 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC993951E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc9:9395:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	e12-v6sm28659wrt.29.2018.08.21.15.58.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 Aug 2018 15:58:06 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Aug 2018 00:57:53 +0200
Message-Id: <20180821225755.19796-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [PATCH 1/3] lxdm: Let greeter use gtk3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2018 22:58:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* one more gtk2->gtk3 transit
* greater looks way better now
* while at it: sort patches

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...for-libexecinfo-providing-backtrace-APIs.patch} |  0
 .../lxdm/lxdm/0004-fix-css-under-gtk-3.20.patch    | 27 ++++++++++++++++++++++
 meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb        |  7 +++---
 3 files changed, 31 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/lxdm/lxdm/{0001-check-for-libexecinfo-providing-backtrace-APIs.patch => 0003-check-for-libexecinfo-providing-backtrace-APIs.patch} (100%)
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.patch

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0001-check-for-libexecinfo-providing-backtrace-APIs.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0003-check-for-libexecinfo-providing-backtrace-APIs.patch
similarity index 100%
rename from meta-oe/recipes-graphics/lxdm/lxdm/0001-check-for-libexecinfo-providing-backtrace-APIs.patch
rename to meta-oe/recipes-graphics/lxdm/lxdm/0003-check-for-libexecinfo-providing-backtrace-APIs.patch
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.patch
new file mode 100644
index 000000000..afe11f353
--- /dev/null
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.patch
@@ -0,0 +1,27 @@
+From 72812894cfd9454d70e4b0753531e46580416771 Mon Sep 17 00:00:00 2001
+From: dgod <dgod.osa@gmail.com>
+Date: Mon, 21 Mar 2016 19:25:25 +0800
+Subject: [PATCH] fix css under gtk 3.20
+
+Upstream-Status: Applied [1]
+
+[1] https://git.lxde.org/gitweb/?p=lxde/lxdm.git;a=patch;h=72812894cfd9454d70e4b0753531e46580416771
+---
+ data/themes/Industrial/gtk.css | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/data/themes/Industrial/gtk.css b/data/themes/Industrial/gtk.css
+index 179f0d6..f8e6432 100644
+--- a/data/themes/Industrial/gtk.css
++++ b/data/themes/Industrial/gtk.css
+@@ -17,6 +17,7 @@
+ 	color: #000000;
+ }
+ 
++#bottom_pane label,
+ #bottom_pane GtkLabel {
+ 	font: Sans 12;
+ 	color: #9E9D9B;
+-- 
+2.14.4
+
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
index 8e7efcdad..701266bcc 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
@@ -7,14 +7,15 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}%20${PV}/${BPN}-${PV}.tar.
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'file://lxdm-pam file://lxdm-pam-debug', '', d)} \
            ${@bb.utils.contains("DISTRO_TYPE", "debug", "", "file://0001-lxdm.conf.in-blacklist-root-for-release-images.patch",d)} \
            file://0002-let-autotools-create-lxdm.conf.patch \
-           file://0001-check-for-libexecinfo-providing-backtrace-APIs.patch \
+           file://0003-check-for-libexecinfo-providing-backtrace-APIs.patch \
+           file://0004-fix-css-under-gtk-3.20.patch \
            "
 SRC_URI[md5sum] = "061caae432634e6db38bbdc84bc6ffa0"
 SRC_URI[sha256sum] = "4891efee81c72a400cc6703e40aa76f3f3853833d048b72ec805da0f93567f2f"
 
 PE = "1"
 
-DEPENDS = "virtual/libintl intltool-native cairo dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb pango iso-codes"
+DEPENDS = "virtual/libintl intltool-native cairo dbus gdk-pixbuf glib-2.0 gtk+3 virtual/libx11 libxcb pango iso-codes"
 DEPENDS += "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "", "consolekit", d)}"
 DEPENDS_append_libc-musl = " libexecinfo"
 
@@ -28,7 +29,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 CFLAGS_append = " -fno-builtin-fork -fno-builtin-memset -fno-builtin-strstr "
 LDFLAGS_append_libc-musl = " -lexecinfo"
 
-EXTRA_OECONF += "--enable-gtk3=no --enable-password=yes --with-x -with-xconn=xcb \
+EXTRA_OECONF += "--enable-gtk3=yes --enable-password=yes --with-x -with-xconn=xcb \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/ --disable-consolekit', '--without-systemdsystemunitdir', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
 "
-- 
2.14.4


