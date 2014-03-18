Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id A85386F09E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 09:09:23 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id x10so6799057pdj.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 02:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rclZ/bxa/Ef6H5/bNbT/IqZx09Px6oi9lKuerkWxFyE=;
	b=YcsTAr2++a8e3kSfRp7UAyNgZeqP3YQAmXf4nCSPIy1+Y1PZTJ4Vnz4whLqIQVAE+U
	k4c3VAK/hjCBMDclE+ayrX0p9iL+tTnlAMz87xhakJ0quWPy+02bcgJESjM074hponC3
	Zmg3W75hazy4jhqWsOqdWCpHz7NnPmxdbz3g6Hqtx/c4O/HkXhfk53MRWSFT58HvD14u
	eFHEnmxG1WSl3KcpdgW3j2Qrg6cn2lOoWSfCeRxo529LDY5HtdyR9kPVWZWfPjzkA3vZ
	U/MHgDVlDIQk4joU4QACJAfEelRk/qXZgoHv7jiBrZhBJ5UMsQnIc3W2IbdIhq8gvF0r
	ei4w==
X-Received: by 10.66.25.203 with SMTP id e11mr31858829pag.76.1395133764469;
	Tue, 18 Mar 2014 02:09:24 -0700 (PDT)
Received: from archimedes.arnolds.bogus
	(dsl-66-59-252-223.static.linkline.com. [66.59.252.223])
	by mx.google.com with ESMTPSA id
	db3sm50619773pbb.10.2014.03.18.02.09.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Mar 2014 02:09:23 -0700 (PDT)
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Mar 2014 02:09:08 -0700
Message-Id: <1395133748-1211-1-git-send-email-stephen.arnold42@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [meta-graphics][PATCH v3] recipes-graphics/lxdm: autotools and config updates
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
X-List-Received-Date: Tue, 18 Mar 2014 09:09:23 -0000

lxdm_git.bb: Upstream changes required autotools and gettext (intl) updates; 
the package autogen script doesn't create the makefile in po, but autotools 
by itself is missing the input file (thus, the configure_prepend). There 
were also missing depends (from upstream docs and configure checks) and 
some configure options were added to ensure the desired X/gtk2 config and 
enable (optional) auto-login.

Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>

---
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
index c12eddf..c602ad3 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
@@ -16,17 +16,24 @@ SRCREV = "07fb151a99ef99318b71f3de0afbba977b1e6267"
 PV = "0.5.0+git${SRCPV}"
 PE = "1"
 
-DEPENDS = "cairo dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb pango"
+DEPENDS = "virtual/libintl intltool-native cairo dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb pango iso-codes"
 DEPENDS += "${@base_contains("DISTRO_FEATURES", "systemd", "", "consolekit", d)}"
 
 # combine oe-core way with angstrom DISTRO_TYPE
 DISTRO_TYPE ?= "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
 
-inherit autotools gettext systemd
+inherit autotools pkgconfig gettext systemd
 
 S = "${WORKDIR}/git"
 
-EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/ --disable-consolekit', '--without-systemdsystemunitdir', d)}"
+CFLAGS_append = " -fno-builtin-fork -fno-builtin-memset -fno-builtin-strstr "
+
+EXTRA_OECONF += "--enable-gtk3=no --enable-password=yes --with-x -with-xconn=xcb \
+    ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/ --disable-consolekit', '--without-systemdsystemunitdir', d)}"
+
+do_configure_prepend() {
+    cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
+}
 
 do_compile_append() {
     # default background configured not available / no password field available / no default screensaver
-- 
1.8.5.3


