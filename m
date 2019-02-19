Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 91C777C9C9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 22:23:32 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y185so3287502wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 14:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=t0eAbnmSxuNmEoyqs5gHT6aXn9xuH1CsClk77mtJXPc=;
	b=vhyyS/dTNgfiMet3jePRa0U5bk8F53OpjOBmesyc3sFI/xNRqyfcnhziytBLZ+rhvS
	bNIxmKYhlJE+9alVAZhktBlALmlGBwzgLpJ4s00gqPHrdqjsuoNlDC7eJQtn/OKz+ngw
	zoWpiDcLyF/r9BPVzJHooAE5ijkSkfPRK+F3EGPHXBBSB5ZG06J0v8SOLQPkd76pXJCE
	h3Ao+l8OvSv0+yNLUgvCrpKBGEciowEuXWEU59iYpCHYDbE8MgsbCqHJ7mlx9uKZGLRm
	Ek2n+SH9uxnHviiY15FLt3s7Ja8X1SYV4C7m+fvoIprxYRoFDpu8WOg/rlc9KwzApMoe
	6FZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=t0eAbnmSxuNmEoyqs5gHT6aXn9xuH1CsClk77mtJXPc=;
	b=MgM34t+LGkB9P/adxUhRf8DtapnfpIe+nr94naoyYqyt8U7EhhYARARQRBYORunFXJ
	6svQK2kuY8Rb1s+OvaZPLfEwviNMDROwdvpsXcwpB/U8xvU/EvelJHmu/OteMFF4sefU
	VNAOCc8Uw1SzYkD7KSVCNR1/bgB0JHNGqaFCjjEI70GoTkNrjRRMJoIZc8X10/sXzhdU
	7QMKYQQKg3AZw9soUfKm6X147f05tXqhBPdDvw+qhgkr0BqSj9RTXc1z0dO1lf8HITGa
	6gYkPz6CbqV5HDslLxc7guxusWTgR68L8gpBZGzkJ84zPksjhcRQ4mweLYzeq6SDZ2Uj
	cmWQ==
X-Gm-Message-State: AHQUAua/ybFChEY5V9o72jSnVSjKBbTpaws2ii4DuQvYRcJjb/QMnKvf
	u+4s1CCDcy2RuQkDiccMUR4lqzAc
X-Google-Smtp-Source: AHgI3IYxQL7hhjmSs6/+K1w19GSgd31LXnKHmzGox8ClSxFHHx8NcB5eoeH4Igob2KY+W7N7HdwoTQ==
X-Received: by 2002:a1c:e489:: with SMTP id b131mr3879520wmh.130.1550615012546;
	Tue, 19 Feb 2019 14:23:32 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F065789FB9A06193E8AB1B8.dip0.t-ipconnect.de.
	[2003:f0:7f06:5789:fb9a:619:3e8a:b1b8])
	by smtp.gmail.com with ESMTPSA id
	d24sm55158896wrb.47.2019.02.19.14.23.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Feb 2019 14:23:31 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Feb 2019 23:23:18 +0100
Message-Id: <20190219222319.21370-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190219222319.21370-1-schnitzeltony@gmail.com>
References: <20190219222319.21370-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] geany-plugins: upgrade 1.31 -> 1.34 and rework
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
X-List-Received-Date: Tue, 19 Feb 2019 22:23:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* geany-plugins-treebrowser/license checksum: Was changed to:
  "TreeBrowser plugin is distributed under the same license as in geany."
  Geany is GPLv2 which is part of geany-plugin's license.

* Remove explicit RDEPENDS:
    * They caused cyclic dependencies making impossible anything but all
      plugins
    * Checked: Dependencies are set correct automatically
    * Add geany-plugins-common to avoid cylcic dependencies

* All plugins that are enabled, build and pack properly. Before adding
  geany-plugins to an image caused errors in do_rootfs due to empty
  packages.

* Some plugins don't build with gtk3 - disable them

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-Use-pkg-config-to-find-gpgme.patch   |  31 +++++
 ...-plugins_1.31.bb => geany-plugins_1.34.bb} | 111 +++++++-----------
 2 files changed, 74 insertions(+), 68 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/geany/geany-plugins/0001-Use-pkg-config-to-find-gpgme.patch
 rename meta-oe/recipes-devtools/geany/{geany-plugins_1.31.bb => geany-plugins_1.34.bb} (75%)

diff --git a/meta-oe/recipes-devtools/geany/geany-plugins/0001-Use-pkg-config-to-find-gpgme.patch b/meta-oe/recipes-devtools/geany/geany-plugins/0001-Use-pkg-config-to-find-gpgme.patch
new file mode 100644
index 000000000..9030f36d4
--- /dev/null
+++ b/meta-oe/recipes-devtools/geany/geany-plugins/0001-Use-pkg-config-to-find-gpgme.patch
@@ -0,0 +1,31 @@
+From 0c24f99ca4d4f64ea8584347ca6ae0d638d625a8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Mon, 18 Feb 2019 16:13:17 +0100
+Subject: [PATCH] Use pkg-config to find gpgme
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ build/bundled/gpgme.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build/bundled/gpgme.m4 b/build/bundled/gpgme.m4
+index 44bf43c..c9a8ae6 100644
+--- a/build/bundled/gpgme.m4
++++ b/build/bundled/gpgme.m4
+@@ -18,7 +18,7 @@ AC_DEFUN([_AM_PATH_GPGME_CONFIG],
+   if test "x$gpgme_config_prefix" != x ; then
+       GPGME_CONFIG="$gpgme_config_prefix/bin/gpgme-config"
+   fi
+-  AC_PATH_PROG(GPGME_CONFIG, gpgme-config, no)
++  GPGME_CONFIG="pkg-config gpgme"
+ 
+   if test "$GPGME_CONFIG" != "no" ; then
+     gpgme_version=`$GPGME_CONFIG --version`
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.31.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.34.bb
similarity index 75%
rename from meta-oe/recipes-devtools/geany/geany-plugins_1.31.bb
rename to meta-oe/recipes-devtools/geany/geany-plugins_1.34.bb
index d8f2f894b..6c1c1535e 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_1.31.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.34.bb
@@ -11,6 +11,7 @@ python () {
 }
 
 DEPENDS = " \
+    vala-native \
     fribidi \
     geany \
     libxml2 \
@@ -19,7 +20,7 @@ DEPENDS = " \
     intltool-native \
     libassuan \
     gpgme \
-    vte9 \
+    vte \
     libgit2 \
 "
 
@@ -27,9 +28,12 @@ inherit distro_features_check autotools pkgconfig gtk-icon-cache
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "http://plugins.geany.org/${PN}/${PN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "808f9048b77fd9704569ed2ba12a56e9"
-SRC_URI[sha256sum] = "76bd9e803db5a626b86669f08330cf95b8cc35057a1cdf65759bc00aef120e25"
+SRC_URI = " \
+    http://plugins.geany.org/${PN}/${PN}-${PV}.tar.bz2 \
+    file://0001-Use-pkg-config-to-find-gpgme.patch \
+"
+SRC_URI[md5sum] = "bf5fdd50727ad8bbbfe00027ccf2dac5"
+SRC_URI[sha256sum] = "244417c681636e82a63cf6f9901b5b7f3889168f7d9b5ba9b45601767a589c3b"
 
 do_configure_prepend() {
     rm -f ${S}/build/cache/glib-gettext.m4
@@ -41,38 +45,33 @@ FILES_${PN}-dev += "${libdir}/geany/*.la ${libdir}/${PN}/*/*.la"
 PLUGINS += "${PN}-addons"
 LIC_FILES_CHKSUM += "file://addons/COPYING;md5=4325afd396febcb659c36b49533135d4"
 FILES_${PN}-addons = "${libdir}/geany/addons.so"
-RDEPENDS_${PN}-addons = "${PN}"
 
 PLUGINS += "${PN}-autoclose"
 LIC_FILES_CHKSUM += "file://autoclose/COPYING;md5=751419260aa954499f7abaabaa882bbe"
 FILES_${PN}-autoclose = "${libdir}/geany/autoclose.so"
-RDEPENDS_${PN}-autoclose = "${PN}"
 
 PLUGINS += "${PN}-automark"
 LIC_FILES_CHKSUM += "file://automark/COPYING;md5=751419260aa954499f7abaabaa882bbe"
 FILES_${PN}-automark = "${libdir}/geany/automark.so"
-RDEPENDS_${PN}-automark = "${PN}"
 
 PLUGINS += "${PN}-codenav"
 LIC_FILES_CHKSUM += "file://codenav/COPYING;md5=751419260aa954499f7abaabaa882bbe"
 FILES_${PN}-codenav = "${libdir}/geany/codenav.so"
-RDEPENDS_${PN}-codenav = "${PN}"
 
 PLUGINS += "${PN}-commander"
 LIC_FILES_CHKSUM += "file://commander/COPYING;md5=d32239bcb673463ab874e80d47fae504"
 LICENSE_${PN}-commander = "GPLv3"
 FILES_${PN}-commander = "${libdir}/geany/commander.so"
-RDEPENDS_${PN}-commander = "${PN}"
 
-PLUGINS += "${PN}-debugger"
-LIC_FILES_CHKSUM += "file://debugger/COPYING;md5=4325afd396febcb659c36b49533135d4"
-FILES_${PN}-debugger = "${libdir}/geany/debugger.so ${datadir}/${PN}/debugger"
-RDEPENDS_${PN}-debugger = "${PN}"
+# | checking whether the GTK version in use is compatible with plugin Debugger... no
+EXTRA_OECONF += "--disable-debugger"
+#PLUGINS += "${PN}-debugger"
+#LIC_FILES_CHKSUM += "file://debugger/COPYING;md5=4325afd396febcb659c36b49533135d4"
+#FILES_${PN}-debugger = "${libdir}/geany/debugger.so ${datadir}/${PN}/debugger"
 
 PLUGINS += "${PN}-defineformat"
 LIC_FILES_CHKSUM += "file://defineformat/COPYING;md5=751419260aa954499f7abaabaa882bbe"
 FILES_${PN}-defineformat = "${libdir}/geany/defineformat.so"
-RDEPENDS_${PN}-defineformat = "${PN}"
 
 # no gnome devhelp in some common layer
 EXTRA_OECONF += "--disable-devhelp"
@@ -80,178 +79,149 @@ EXTRA_OECONF += "--disable-devhelp"
 #LIC_FILES_CHKSUM += "file://devhelp/COPYING;md5=d32239bcb673463ab874e80d47fae504"
 #LICENSE_${PN}-devhelp = "GPLv3"
 #FILES_${PN}-devhelp = "${libdir}/geany/devhelp.so"
-#RDEPENDS_${PN}-devhelp = "${PN}"
 
 PLUGINS += "${PN}-geanyctags"
 LIC_FILES_CHKSUM += "file://geanyctags/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
 FILES_${PN}-geanyctags = "${libdir}/geany/geanyctags.so"
-RDEPENDS_${PN}-geanyctags = "${PN}"
 
 PLUGINS += "${PN}-geanydoc"
 LIC_FILES_CHKSUM += "file://geanydoc/COPYING;md5=d32239bcb673463ab874e80d47fae504"
 LICENSE_${PN}-geanydoc = "GPLv3"
 FILES_${PN}-geanydoc = "${libdir}/geany/geanydoc.so"
-RDEPENDS_${PN}-geanydoc = "${PN}"
 
 PLUGINS += "${PN}-geanyextrasel"
 LIC_FILES_CHKSUM += "file://geanyextrasel/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
 FILES_${PN}-geanyextrasel = "${libdir}/geany/geanyextrasel.so"
-RDEPENDS_${PN}-geanyextrasel = "${PN}"
 
 PLUGINS += "${PN}-geanyinsertnum"
 LIC_FILES_CHKSUM += "file://geanyinsertnum/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
 FILES_${PN}-geanyinsertnum = "${libdir}/geany/geanyinsertnum.so"
-RDEPENDS_${PN}-geanyinsertnum = "${PN}"
-
-PLUGINS += "${PN}-geanylatex"
-LIC_FILES_CHKSUM += "file://geanylatex/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
-FILES_${PN}-geanylatex = "${libdir}/geany/geanylatex.so"
-RDEPENDS_${PN}-geanylatex = "${PN}"
-
-PLUGINS += "${PN}-geanylipsum"
-LIC_FILES_CHKSUM += "file://lipsum/COPYING;md5=4325afd396febcb659c36b49533135d4"
-FILES_${PN}-geanylipsum = "${libdir}/geany/lipsum.so"
-RDEPENDS_${PN}-geanylipsum = "${PN}"
 
 # no lua: max supported version is 5.2
 EXTRA_OECONF += "--disable-geanylua"
 #PLUGINS += "${PN}-geanylua"
 #LIC_FILES_CHKSUM += "file://geanylua/COPYING;md5=4325afd396febcb659c36b49533135d4"
 #FILES_${PN}-geanylua = "${libdir}/geany/geanylua.so ${libdir}/${PN}/geanylua/*.so"
-#RDEPENDS_${PN}-geanylua = "${PN}"
 
 PLUGINS += "${PN}-geanymacro"
 LIC_FILES_CHKSUM += "file://geanymacro/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
 FILES_${PN}-geanymacro = "${libdir}/geany/geanymacro.so"
-RDEPENDS_${PN}-geanymacro = "${PN}"
 
 PLUGINS += "${PN}-geanyminiscript"
 LIC_FILES_CHKSUM += "file://geanyminiscript/COPYING;md5=4325afd396febcb659c36b49533135d4"
 FILES_${PN}-geanyminiscript = "${libdir}/geany/geanyminiscript.so"
-RDEPENDS_${PN}-geanyminiscript = "${PN}"
 
 PLUGINS += "${PN}-geanynumberedbookmarks"
 LIC_FILES_CHKSUM += "file://geanynumberedbookmarks/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
 FILES_${PN}-geanynumberedbookmarks = "${libdir}/geany/geanynumberedbookmarks.so"
-RDEPENDS_${PN}-geanynumberedbookmarks = "${PN}"
 
 PLUGINS += "${PN}-geanypg"
 LIC_FILES_CHKSUM += "file://geanypg/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 FILES_${PN}-geanypg = "${libdir}/geany/geanypg.so"
-RDEPENDS_${PN}-geanypg = "${PN}"
 
 PLUGINS += "${PN}-geanyprj"
 LIC_FILES_CHKSUM += "file://geanyprj/COPYING;md5=d32239bcb673463ab874e80d47fae504"
 LICENSE_${PN}-geanyprj = "GPLv3"
 FILES_${PN}-geanyprj = "${libdir}/geany/geanyprj.so"
-RDEPENDS_${PN}-geanyprj = "${PN}"
 
-# no gnome pygtk
-EXTRA_OECONF += "--disable-geanypy"
 #PLUGINS += "${PN}-geanypy"
 #LIC_FILES_CHKSUM += "file://geanypy/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 #FILES_${PN}-geanypy = "${libdir}/geany/geanypy.so"
-#RDEPENDS_${PN}-geanypy = "${PN}"
 
 PLUGINS += "${PN}-geanyvc"
 LIC_FILES_CHKSUM += "file://geanyvc/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
 FILES_${PN}-geanyvc = "${libdir}/geany/geanyvc.so"
-RDEPENDS_${PN}-geanyvc = "${PN}"
 
 PLUGINS += "${PN}-geniuspaste"
 LIC_FILES_CHKSUM += "file://geniuspaste/COPYING;md5=bfc203269f8862ebfc1198cdc809a95a"
 FILES_${PN}-geniuspaste = "${libdir}/geany/geniuspaste.so ${datadir}/${PN}/geniuspaste"
-RDEPENDS_${PN}-geniuspaste = "${PN}"
 
 PLUGINS += "${PN}-git-changebar"
 LIC_FILES_CHKSUM += "file://git-changebar/COPYING;md5=d32239bcb673463ab874e80d47fae504"
 LICENSE_${PN}-git-changebar = "GPLv3"
-FILES_${PN}-git-changebar = "${libdir}/geany/git-changebar.so"
-RDEPENDS_${PN}-git-changebar = "${PN}"
+FILES_${PN}-git-changebar = "${datadir}/${BPN}/git-changebar ${libdir}/geany/git-changebar.so"
 
 PLUGINS += "${PN}-keyrecord"
 LIC_FILES_CHKSUM += "file://keyrecord/COPYING;md5=751419260aa954499f7abaabaa882bbe"
 FILES_${PN}-keyrecord = "${libdir}/geany/keyrecord.so"
-RDEPENDS_${PN}-keyrecord = "${PN}"
+
+PLUGINS += "${PN}-latex"
+LIC_FILES_CHKSUM += "file://latex/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
+FILES_${PN}-latex = "${libdir}/geany/latex.so"
 
 PLUGINS += "${PN}-lineoperations"
 LIC_FILES_CHKSUM += "file://lineoperations/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
 FILES_${PN}-lineoperations = "${libdir}/geany/lineoperations.so"
-RDEPENDS_${PN}-lineoperations = "${PN}"
+
+PLUGINS += "${PN}-lipsum"
+LIC_FILES_CHKSUM += "file://lipsum/COPYING;md5=4325afd396febcb659c36b49533135d4"
+FILES_${PN}-lipsum = "${libdir}/geany/lipsum.so"
 
 # no markdown - avoid floating dependencies
-EXTRA_OECONF += " --disable-peg-markdown"
+EXTRA_OECONF += "--disable-peg-markdown"
 #PLUGINS += "${PN}-markdown"
 #LIC_FILES_CHKSUM += "file://markdown/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 #FILES_${PN}-markdown = "${libdir}/geany/markdown.so"
-#RDEPENDS_${PN}-markdown = "${PN}"
 
-PLUGINS += "${PN}-multiterm"
-LIC_FILES_CHKSUM += "file://multiterm/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-FILES_${PN}-multiterm = "${libdir}/geany/multiterm.so"
-RDEPENDS_${PN}-multiterm = "${PN}"
+# | checking whether the GTK version in use is compatible with plugin multiterm... no
+EXTRA_OECONF += "--disable-multiterm"
+#PLUGINS += "${PN}-multiterm"
+#LIC_FILES_CHKSUM += "file://multiterm/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+#FILES_${PN}-multiterm = "${libdir}/geany/multiterm.so"
 
 PLUGINS += "${PN}-overview"
 LIC_FILES_CHKSUM += "file://overview/overview/overviewplugin.c;beginline=4;endline=20;md5=1aa33522916cdeb46cccac0c629da0d0"
 FILES_${PN}-overview = "${libdir}/geany/overview.so ${datadir}/${PN}/overview"
-RDEPENDS_${PN}-overview = "${PN}"
 
 PLUGINS += "${PN}-pairtaghighlighter"
 LICENSE_${PN}-pairtaghighlighter = "BSD-2-Clause"
 LIC_FILES_CHKSUM += "file://pairtaghighlighter/COPYING;md5=d6d927525a612b3a8dbebc4b2e9b47c1"
 FILES_${PN}-pairtaghighlighter = "${libdir}/geany/pairtaghighlighter.so"
-RDEPENDS_${PN}-pairtaghighlighter = "${PN}"
 
 PLUGINS += "${PN}-pohelper"
 LICENSE_${PN}-pohelper = "GPLv3"
 LIC_FILES_CHKSUM += "file://pohelper/COPYING;md5=d32239bcb673463ab874e80d47fae504"
-FILES_${PN}-pohelper = "${libdir}/geany/pohelper.so"
-RDEPENDS_${PN}-pohelper = "${PN}"
+FILES_${PN}-pohelper = "${datadir}/${BPN}/pohelper ${libdir}/geany/pohelper.so"
 
 PLUGINS += "${PN}-pretty-printer"
 LIC_FILES_CHKSUM += "file://pretty-printer/src/PrettyPrinter.c;beginline=1;endline=17;md5=1665115c2fadb17c1b53cdb4e43b2440"
 FILES_${PN}-pretty-printer = "${libdir}/geany/pretty-printer.so"
-RDEPENDS_${PN}-pretty-printer = "${PN}"
 
 PLUGINS += "${PN}-projectorganizer"
 LIC_FILES_CHKSUM += "file://projectorganizer/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
 FILES_${PN}-projectorganizer = "${libdir}/geany/projectorganizer.so"
-RDEPENDS_${PN}-projectorganizer = "${PN}"
 
 PLUGINS += "${PN}-scope"
 LIC_FILES_CHKSUM += "file://scope/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
-FILES_${PN}-scope = "${libdir}/geany/scope.so"
-RDEPENDS_${PN}-scope = "${PN}"
+FILES_${PN}-scope = "${datadir}/${BPN}/scope ${libdir}/geany/scope.so"
 
 PLUGINS += "${PN}-sendmail"
 LIC_FILES_CHKSUM += "file://sendmail/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
 FILES_${PN}-sendmail = "${libdir}/geany/sendmail.so"
-RDEPENDS_${PN}-sendmail = "${PN}"
 
 PLUGINS += "${PN}-shiftcolumn"
 LIC_FILES_CHKSUM += "file://shiftcolumn/COPYING;md5=751419260aa954499f7abaabaa882bbe"
 FILES_${PN}-shiftcolumn = "${libdir}/geany/shiftcolumn.so"
-RDEPENDS_${PN}-shiftcolumn = "${PN}"
 
 PLUGINS += "${PN}-spellcheck"
 LIC_FILES_CHKSUM += "file://spellcheck/COPYING;md5=4325afd396febcb659c36b49533135d4"
 FILES_${PN}-spellcheck = "${libdir}/geany/spellcheck.so"
-RDEPENDS_${PN}-spellcheck = "${PN}"
 
 PLUGINS += "${PN}-tableconvert"
 LIC_FILES_CHKSUM += "file://tableconvert/COPYING;md5=6753686878d090a1f3f9445661d3dfbc"
 FILES_${PN}-tableconvert = "${libdir}/geany/tableconvert.so"
-RDEPENDS_${PN}-tableconvert = "${PN}"
 
 PLUGINS += "${PN}-treebrowser"
-LIC_FILES_CHKSUM += "file://treebrowser/README;beginline=67;endline=67;md5=52f90857fd1a9672111e472dd056a0d8"
+LIC_FILES_CHKSUM += "file://treebrowser/README;beginline=67;endline=67;md5=1f17f0f2abb88e0fa0f1b342112d871c"
 FILES_${PN}-treebrowser = "${libdir}/geany/treebrowser.so"
-RDEPENDS_${PN}-treebrowser = "${PN}"
 
 PLUGINS += "${PN}-updatechecker"
 LIC_FILES_CHKSUM += "file://updatechecker/COPYING;md5=4325afd396febcb659c36b49533135d4"
 FILES_${PN}-updatechecker = "${libdir}/geany/updatechecker.so"
-RDEPENDS_${PN}-updatechecker = "${PN}"
+
+PLUGINS += "${PN}-vimode"
+LIC_FILES_CHKSUM += "file://vimode/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
+FILES_${PN}-vimode = "${libdir}/geany/vimode.so"
 
 # no webkit - lasts ages and is not properly detected
 EXTRA_OECONF += " --disable-webhelper"
@@ -259,13 +229,18 @@ EXTRA_OECONF += " --disable-webhelper"
 #LIC_FILES_CHKSUM += "file://webhelper/COPYING;md5=d32239bcb673463ab874e80d47fae504"
 #LICENSE_${PN}-webhelper = "GPLv3"
 #FILES_${PN}-webhelper = "${libdir}/geany/webhelper.so"
-#RDEPENDS_${PN}-webhelper = "${PN}"
+
+PLUGINS += "${PN}-workbench"
+LIC_FILES_CHKSUM += "file://workbench/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
+FILES_${PN}-workbench = "${libdir}/geany/workbench.so"
 
 PLUGINS += "${PN}-xmlsnippets"
 LIC_FILES_CHKSUM += "file://xmlsnippets/COPYING;md5=4325afd396febcb659c36b49533135d4"
 FILES_${PN}-xmlsnippets = "${libdir}/geany/xmlsnippets.so"
-RDEPENDS_${PN}-xmlsnippets = "${PN}"
 
-PACKAGES =+ "${PLUGINS}"
+PACKAGES =+ "${PN}-common ${PLUGINS}"
+FILES_${PN}-common = "${libdir}/libgeanypluginutils${SOLIBS}"
+
+# geany-plugins is meta package for all plugins
 RDEPENDS_${PN} = "${PLUGINS}"
 ALLOW_EMPTY_${PN} = "1"
-- 
2.20.1


