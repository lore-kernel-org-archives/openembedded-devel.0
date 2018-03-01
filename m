Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6D72778914
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:02:09 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id x7so15180741wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Nc8fYdpedXLsAKuq2pKbVcP+hA2d/diEWnVMQIuZKgQ=;
	b=WSLUtYjBaLk/gsmir+5wmEB0Y4Fmx8Xkg8ZvSBrBVAF1KccNmm3R5e+yJ1O6lsKyDS
	tJTmjSS13NCOI2z9+/GV38cUSweg8RS2FN4H+TMPe8A2rPMEQtWDlRxCol2ZU4h4CqmI
	BSqZRL0iiGusN+NHPuiok4Ix9HXxDy2nXqbkW2J0WuwhRy7qaQR87bAlvtjH2Zz/+6YM
	JKnAc7kwkbfxHOTpdM4AMz3bqt35FjaTgGdZpDHEeTVCwjjaCzPGsd96TaEz/iauY4OP
	bi9Q5a/JV13xm+pCSRJ93RazgqDukYRgAsSh8/ryLpdihbozQqo7FZNFUWAQgoat6PPV
	u/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Nc8fYdpedXLsAKuq2pKbVcP+hA2d/diEWnVMQIuZKgQ=;
	b=h3tZxWDCSmuNF4GprotPPAX68eRtyzgtL0MGFV0vLTEXzPdTADgj3Br47j98+QKUF+
	tljguFObXh5mn5f2X33ftI2B+NftIobbsb0dEAP7u+Eski6iz/8l6ImYfLBNpFljSqiy
	N/3grz92DMpBVmSAXqPVyojJxBkgkj6fwOnw5o+3VAgX0pIm0ZrpL3E4McXnWBDrfyrr
	bQAByzJAquOFULeOICViGWsYZ3LQ1yrGzv+rykXRz2DE+5h/mUtXkXDkeCuvTAv8d/y3
	wH+d5wb2bysVtTlNtqEAd0Sjm1Lqt1rfYRmnaDKNL7kpzZCvv8DaIEDBswyu6GouSCum
	+1Gg==
X-Gm-Message-State: APf1xPDRkYfgioIWhN0twNo73D79hrhIBfb2snYjux+g6h3rcbPXasma
	mCN45XSQSl8L1GdjpKOCl3AHVg==
X-Google-Smtp-Source: AG47ELtb70/h2WWswgYUQG9OTfpFdxcRvtVOkIaD/q2pU02L/bZ45OO1e5UcGSokKMyc2ev86iI+gg==
X-Received: by 10.28.165.7 with SMTP id o7mr2766797wme.38.1519945329863;
	Thu, 01 Mar 2018 15:02:09 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC063001E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:6300:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id 8sm5490wmf.13.2018.03.01.15.02.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Mar 2018 15:02:09 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2018 00:01:44 +0100
Message-Id: <20180301230148.2284-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180301230148.2284-1-schnitzeltony@gmail.com>
References: <20180301230148.2284-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/12] menulibre: update 2.1.3 -> 2.1.5
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
X-List-Received-Date: Thu, 01 Mar 2018 23:02:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patches:

* 0001../0003..: They were stolen from Fedora and don't apply no more due to
  major code changes. Fedora has removed them too.
* 0002..: Does not apply no more. Replaced by sed in do_install

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...launcher-Exit-early-if-no-row-is-selected.patch | 37 --------------------
 ...0002-setup.py-avoid-usr-share-share-paths.patch | 40 ----------------------
 ...ulibreXdg.py-fix-loading-of-desktop-files.patch | 36 -------------------
 .../{menulibre_2.1.3.bb => menulibre_2.1.5.bb}     | 21 +++++++-----
 4 files changed, 12 insertions(+), 122 deletions(-)
 delete mode 100644 meta-xfce/recipes-apps/menulibre/files/0001-add_launcher-Exit-early-if-no-row-is-selected.patch
 delete mode 100644 meta-xfce/recipes-apps/menulibre/files/0002-setup.py-avoid-usr-share-share-paths.patch
 delete mode 100644 meta-xfce/recipes-apps/menulibre/files/0003-MenulibreXdg.py-fix-loading-of-desktop-files.patch
 rename meta-xfce/recipes-apps/menulibre/{menulibre_2.1.3.bb => menulibre_2.1.5.bb} (53%)

diff --git a/meta-xfce/recipes-apps/menulibre/files/0001-add_launcher-Exit-early-if-no-row-is-selected.patch b/meta-xfce/recipes-apps/menulibre/files/0001-add_launcher-Exit-early-if-no-row-is-selected.patch
deleted file mode 100644
index fb2dfc90a..000000000
--- a/meta-xfce/recipes-apps/menulibre/files/0001-add_launcher-Exit-early-if-no-row-is-selected.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 1060e7ac8a63b93d56006718f0e9b1d9382b2226 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Mon, 31 Oct 2016 08:33:16 +0100
-Subject: [PATCH] add_launcher: Exit early if no row is selected
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Stolen from [1]
-
-[1] http://pkgs.fedoraproject.org/cgit/rpms/menulibre.git/tree/menulibre-add-launcher-none-check.patch
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- menulibre/MenulibreApplication.py | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/menulibre/MenulibreApplication.py b/menulibre/MenulibreApplication.py
-index e234800..ac73b03 100644
---- a/menulibre/MenulibreApplication.py
-+++ b/menulibre/MenulibreApplication.py
-@@ -1418,6 +1418,10 @@ class MenulibreWindow(Gtk.ApplicationWindow):
-         model, parent_data = self.treeview.get_parent_row_data()
-         model, row_data = self.treeview.get_selected_row_data()
- 
-+        # Exit early if no row is selected
-+        if not row_data:
-+            return
-+
-         # Currently selected item is a directory, take its categories.
-         if row_data[2] == MenuItemTypes.DIRECTORY:
-             self.treeview.add_child(new_row_data)
--- 
-2.5.5
-
diff --git a/meta-xfce/recipes-apps/menulibre/files/0002-setup.py-avoid-usr-share-share-paths.patch b/meta-xfce/recipes-apps/menulibre/files/0002-setup.py-avoid-usr-share-share-paths.patch
deleted file mode 100644
index b63d4dc3b..000000000
--- a/meta-xfce/recipes-apps/menulibre/files/0002-setup.py-avoid-usr-share-share-paths.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 99788b4557543c490493ce1b827538c49142c25d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Mon, 31 Oct 2016 09:08:51 +0100
-Subject: [PATCH] setup.py: avoid /usr/share/share paths
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- setup.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 5fc237d..c4fbf7c 100644
---- a/setup.py
-+++ b/setup.py
-@@ -143,7 +143,7 @@ class InstallAndUpdateDataDirectory(DistUtilsExtra.auto.install_auto):
- 
-         if self.root:
-             target_data = os.path.relpath(self.install_data, self.root) + os.sep
--            target_pkgdata = os.path.join(target_data, 'share', 'menulibre', '')
-+            target_pkgdata = os.path.join(target_data, 'menulibre', '')
-             target_scripts = os.path.join(self.install_scripts, '')
- 
-             data_dir = os.path.join(self.prefix, 'share', 'menulibre', '')
-@@ -152,7 +152,7 @@ class InstallAndUpdateDataDirectory(DistUtilsExtra.auto.install_auto):
-             # --user install
-             self.root = ''
-             target_data = os.path.relpath(self.install_data) + os.sep
--            target_pkgdata = os.path.join(target_data, 'share', 'menulibre', '')
-+            target_pkgdata = os.path.join(target_data, 'menulibre', '')
-             target_scripts = os.path.join(self.install_scripts, '')
- 
-             # Use absolute paths
--- 
-2.5.5
-
diff --git a/meta-xfce/recipes-apps/menulibre/files/0003-MenulibreXdg.py-fix-loading-of-desktop-files.patch b/meta-xfce/recipes-apps/menulibre/files/0003-MenulibreXdg.py-fix-loading-of-desktop-files.patch
deleted file mode 100644
index 1e92088e1..000000000
--- a/meta-xfce/recipes-apps/menulibre/files/0003-MenulibreXdg.py-fix-loading-of-desktop-files.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 90098d835b62b38ac396d55b80a684770dbaacde Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Mon, 31 Oct 2016 15:50:52 +0100
-Subject: [PATCH] MenulibreXdg.py: fix loading of desktop files
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-fixes:
-| UnicodeDecodeError: 'ascii' codec can't decode byet 0xd9 in position 235: ordinal not in range(128)
-
-and information display not properly filled.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- menulibre/MenulibreXdg.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/menulibre/MenulibreXdg.py b/menulibre/MenulibreXdg.py
-index e04c5e6..14b2593 100644
---- a/menulibre/MenulibreXdg.py
-+++ b/menulibre/MenulibreXdg.py
-@@ -74,7 +74,7 @@ class MenulibreDesktopEntry:
- 
-     def load_properties(self, filename):
-         """Load the properties."""
--        input_file = open(filename)
-+        input_file = open(filename, 'rt', encoding='utf-8')
-         self.load_properties_from_text(input_file.read())
-         input_file.close()
- 
--- 
-2.5.5
-
diff --git a/meta-xfce/recipes-apps/menulibre/menulibre_2.1.3.bb b/meta-xfce/recipes-apps/menulibre/menulibre_2.1.5.bb
similarity index 53%
rename from meta-xfce/recipes-apps/menulibre/menulibre_2.1.3.bb
rename to meta-xfce/recipes-apps/menulibre/menulibre_2.1.5.bb
index 69e52fe4a..cc7b29164 100644
--- a/meta-xfce/recipes-apps/menulibre/menulibre_2.1.3.bb
+++ b/meta-xfce/recipes-apps/menulibre/menulibre_2.1.5.bb
@@ -4,21 +4,23 @@ SECTION = "x11/graphics"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "python3-distutils-extra-native intltool-native"
+DEPENDS = " \
+    python3-distutils-extra-native \
+    intltool-native \
+"
 
 inherit distutils3 gtk-icon-cache
 
-SRC_URI = " \
-    https://launchpad.net/menulibre/2.1/${PV}/+download/${PN}-${PV}.tar.gz \
-    file://0001-add_launcher-Exit-early-if-no-row-is-selected.patch \
-    file://0002-setup.py-avoid-usr-share-share-paths.patch \
-    file://0003-MenulibreXdg.py-fix-loading-of-desktop-files.patch \
-"
-SRC_URI[md5sum] = "19d9d3337322eb5513454bb8cdfb739b"
-SRC_URI[sha256sum] = "bdd69740119902f1b1f8c7831155f4428403792a0a6c4287bcbb395c4e71fb31"
+SRC_URI = "https://launchpad.net/menulibre/2.1/${PV}/+download/${PN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "efc7edb49bb0e5fea49e158b40573334"
+SRC_URI[sha256sum] = "ef05b2722bab2acb7070d6c8ed0e7bd58bd4a4540bf498af9e889944f9da08b5"
+
+do_compile() {
+}
 
 do_install_append() {
     sed -i 's:${D}::g' ${D}${datadir}/applications/menulibre.desktop
+    sed -i 's:share/share:share:g' ${D}${PYTHON_SITEPACKAGES_DIR}/menulibre_lib/menulibreconfig.py
 }
 
 FILES_${PN} += " \
@@ -29,6 +31,7 @@ FILES_${PN} += " \
 
 RDEPENDS_${PN} += " \
     gtk+3 \
+    gtksourceview3 \
     python3-pygobject \
     gnome-menus3 \
     python3-unixadmin \
-- 
2.14.3


