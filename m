Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id EE9BD6F4EE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Mar 2014 22:58:57 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id uo5so4895825pbc.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Mar 2014 15:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FCJyfAmHAIG0NJ/wcqlnShs8+WcFe6X59YedjI96Jvg=;
	b=EcB6i6eX92v9ONMYQgu+JhdBJI5NLO3IKEsabAft3ZhNvqZfF/9KTzD9VQ/Ye7e/kl
	/l+LVZjszJlg2PoauIdaakZ4A9iIlUPFXWSiihQgpeNqIlDBbF/oA3kmwZThbvppg/Ba
	MS0hyhDuGrvXW/kZujb0XU9rbdeT0LGe3eIA96Ll0ZMK8IW/S9gBo0xMMyOlYE+DySbk
	VAUdYldcJY/ccP+8BgVixqKzfC6z/OM6Cm6vGOvBE6twaNi6yX6VsanNMjQueWgSRQGJ
	ddkiss3qtWof4vRYUGmM9XARyjzKovkT3Tt0BZ/4sZFV0UgQxsnxIYAvz/jqwOFxO7m3
	UKuA==
X-Received: by 10.67.4.169 with SMTP id cf9mr22232642pad.45.1395010739096;
	Sun, 16 Mar 2014 15:58:59 -0700 (PDT)
Received: from archimedes.arnolds.bogus
	(dsl-66-59-252-223.static.linkline.com. [66.59.252.223])
	by mx.google.com with ESMTPSA id
	vb7sm37476353pbc.13.2014.03.16.15.58.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Mar 2014 15:58:57 -0700 (PDT)
From: "stephen.arnold42" <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Mar 2014 15:58:37 -0700
Message-Id: <1395010717-15721-1-git-send-email-stephen.arnold42@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [meta-oe][PATCH] updated lxdm recipe depends and build config
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
X-List-Received-Date: Sun, 16 Mar 2014 22:58:59 -0000

---
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
index c12eddf..6ef014f 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
@@ -16,18 +16,27 @@ SRCREV = "07fb151a99ef99318b71f3de0afbba977b1e6267"
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
 
+CFLAGS_append = " -fno-builtin-fork -fno-builtin-memset -fno-builtin-strstr "
+
+EXTRA_OECONF += "--enable-gtk3=no --enable-password=yes --with-x -with-xconn=xcb"
 EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/ --disable-consolekit', '--without-systemdsystemunitdir', d)}"
 
+do_patch_extra() {
+    cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
+}
+
+addtask do_patch_extra before do_configure after do_patch
+
 do_compile_append() {
     # default background configured not available / no password field available / no default screensaver
     sed -i     -e 's,bg=,# bg=,g' \
-- 
1.8.5.3


