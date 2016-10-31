Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9B77471A31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 22:11:07 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 68so13534943wmz.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 15:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=+IP5iEVhKmoLucfO5w8G1FZHdKtFGoLOylgJP+m+uiI=;
	b=YlXak9fK+gsrAFY8SNYIx8vikslbOUdC+etS8Y8MT46NKWpEOdNfrVGRmUEfQceM1W
	iaaKaDais9VsNo2zuMdGbNBK2rb0fXOshcnY3IEOcaTg9LPA3xS3bJhyyacrUvWtmGUI
	w4UVeKx/3ivZfjJs1n+FvwA8X8MhEbiRM9vSroT0/9AFcdSu9Gj+gsNCo+y0SdRskebs
	3E6ReifJI+RZTWcTeT/pyW4nhvRT4kZVzA4012g0rC03K3vDU+TXhu6uVJkYsyqMWioA
	1/pAW2Dwwhz1/TsZfz8eU80MldVD4Xt9p/y4Uq2uJr0p/CEdvQ5ndUwW055+oT+HuIj7
	ww5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+IP5iEVhKmoLucfO5w8G1FZHdKtFGoLOylgJP+m+uiI=;
	b=HnUjFeOUBMHQ4for4HKraNR41/o39LWcm6COUmztz2XdwTa5UH+lXGJjwP/zVXJIoe
	wa+7eO+rz9+zr6sCInpPFG7WP92Wu9D6uSU2Bg5L0pZMAWnv8PU844tK7cOhcVV+mTD0
	JpjrFdRNpXEG4Ubf9h6pqZSmizNuLYQTvPHtSxj1pxrcAwGTOCZApx99MkaKPT7sJWUy
	yaZLwhQrfIY0WVeeMDjt8OXguG5DWDkLdxjEGjipLuWVIRcbxx4K69fOCaMXyYFEL/Ow
	J926vTOtCv6kLxgfyTAUaNpEgT01xpiVHabg+zD4yo1XFocBDn7ijxOz50nBXgAmaebK
	Gk3g==
X-Gm-Message-State: ABUngvcoS76An9DSyrjkpVQ6RM5gUf88NZ3PvQ+LHs/ztwcfhLjreOrbUp7d42/Th35WDg==
X-Received: by 10.28.10.149 with SMTP id 143mr11979923wmk.12.1477951868424;
	Mon, 31 Oct 2016 15:11:08 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3FE5.dip0.t-ipconnect.de.
	[91.10.63.229]) by smtp.googlemail.com with ESMTPSA id
	129sm26918697wmq.9.2016.10.31.15.11.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Oct 2016 15:11:08 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Oct 2016 23:10:40 +0100
Message-Id: <1477951849-32149-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
References: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 04/13] menulibre: initial add 2.1.3
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
X-List-Received-Date: Mon, 31 Oct 2016 22:11:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

it was added in meta-xfce for two reasons:

* xfce4-whiskermenu-plugin suggests menulibre as menu editor
* meta-xfce requires meta-python already and menulibre requires some recipes
  within meta-python

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...launcher-Exit-early-if-no-row-is-selected.patch | 37 ++++++++++++++++++++
 ...0002-setup.py-avoid-usr-share-share-paths.patch | 40 ++++++++++++++++++++++
 ...ulibreXdg.py-fix-loading-of-desktop-files.patch | 36 +++++++++++++++++++
 .../recipes-apps/menulibre/menulibre_2.1.3.bb      | 36 +++++++++++++++++++
 4 files changed, 149 insertions(+)
 create mode 100644 meta-xfce/recipes-apps/menulibre/files/0001-add_launcher-Exit-early-if-no-row-is-selected.patch
 create mode 100644 meta-xfce/recipes-apps/menulibre/files/0002-setup.py-avoid-usr-share-share-paths.patch
 create mode 100644 meta-xfce/recipes-apps/menulibre/files/0003-MenulibreXdg.py-fix-loading-of-desktop-files.patch
 create mode 100644 meta-xfce/recipes-apps/menulibre/menulibre_2.1.3.bb

diff --git a/meta-xfce/recipes-apps/menulibre/files/0001-add_launcher-Exit-early-if-no-row-is-selected.patch b/meta-xfce/recipes-apps/menulibre/files/0001-add_launcher-Exit-early-if-no-row-is-selected.patch
new file mode 100644
index 0000000..fb2dfc9
--- /dev/null
+++ b/meta-xfce/recipes-apps/menulibre/files/0001-add_launcher-Exit-early-if-no-row-is-selected.patch
@@ -0,0 +1,37 @@
+From 1060e7ac8a63b93d56006718f0e9b1d9382b2226 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 31 Oct 2016 08:33:16 +0100
+Subject: [PATCH] add_launcher: Exit early if no row is selected
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Stolen from [1]
+
+[1] http://pkgs.fedoraproject.org/cgit/rpms/menulibre.git/tree/menulibre-add-launcher-none-check.patch
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ menulibre/MenulibreApplication.py | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/menulibre/MenulibreApplication.py b/menulibre/MenulibreApplication.py
+index e234800..ac73b03 100644
+--- a/menulibre/MenulibreApplication.py
++++ b/menulibre/MenulibreApplication.py
+@@ -1418,6 +1418,10 @@ class MenulibreWindow(Gtk.ApplicationWindow):
+         model, parent_data = self.treeview.get_parent_row_data()
+         model, row_data = self.treeview.get_selected_row_data()
+ 
++        # Exit early if no row is selected
++        if not row_data:
++            return
++
+         # Currently selected item is a directory, take its categories.
+         if row_data[2] == MenuItemTypes.DIRECTORY:
+             self.treeview.add_child(new_row_data)
+-- 
+2.5.5
+
diff --git a/meta-xfce/recipes-apps/menulibre/files/0002-setup.py-avoid-usr-share-share-paths.patch b/meta-xfce/recipes-apps/menulibre/files/0002-setup.py-avoid-usr-share-share-paths.patch
new file mode 100644
index 0000000..b63d4dc
--- /dev/null
+++ b/meta-xfce/recipes-apps/menulibre/files/0002-setup.py-avoid-usr-share-share-paths.patch
@@ -0,0 +1,40 @@
+From 99788b4557543c490493ce1b827538c49142c25d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 31 Oct 2016 09:08:51 +0100
+Subject: [PATCH] setup.py: avoid /usr/share/share paths
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ setup.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 5fc237d..c4fbf7c 100644
+--- a/setup.py
++++ b/setup.py
+@@ -143,7 +143,7 @@ class InstallAndUpdateDataDirectory(DistUtilsExtra.auto.install_auto):
+ 
+         if self.root:
+             target_data = os.path.relpath(self.install_data, self.root) + os.sep
+-            target_pkgdata = os.path.join(target_data, 'share', 'menulibre', '')
++            target_pkgdata = os.path.join(target_data, 'menulibre', '')
+             target_scripts = os.path.join(self.install_scripts, '')
+ 
+             data_dir = os.path.join(self.prefix, 'share', 'menulibre', '')
+@@ -152,7 +152,7 @@ class InstallAndUpdateDataDirectory(DistUtilsExtra.auto.install_auto):
+             # --user install
+             self.root = ''
+             target_data = os.path.relpath(self.install_data) + os.sep
+-            target_pkgdata = os.path.join(target_data, 'share', 'menulibre', '')
++            target_pkgdata = os.path.join(target_data, 'menulibre', '')
+             target_scripts = os.path.join(self.install_scripts, '')
+ 
+             # Use absolute paths
+-- 
+2.5.5
+
diff --git a/meta-xfce/recipes-apps/menulibre/files/0003-MenulibreXdg.py-fix-loading-of-desktop-files.patch b/meta-xfce/recipes-apps/menulibre/files/0003-MenulibreXdg.py-fix-loading-of-desktop-files.patch
new file mode 100644
index 0000000..1e92088
--- /dev/null
+++ b/meta-xfce/recipes-apps/menulibre/files/0003-MenulibreXdg.py-fix-loading-of-desktop-files.patch
@@ -0,0 +1,36 @@
+From 90098d835b62b38ac396d55b80a684770dbaacde Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 31 Oct 2016 15:50:52 +0100
+Subject: [PATCH] MenulibreXdg.py: fix loading of desktop files
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+fixes:
+| UnicodeDecodeError: 'ascii' codec can't decode byet 0xd9 in position 235: ordinal not in range(128)
+
+and information display not properly filled.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ menulibre/MenulibreXdg.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/menulibre/MenulibreXdg.py b/menulibre/MenulibreXdg.py
+index e04c5e6..14b2593 100644
+--- a/menulibre/MenulibreXdg.py
++++ b/menulibre/MenulibreXdg.py
+@@ -74,7 +74,7 @@ class MenulibreDesktopEntry:
+ 
+     def load_properties(self, filename):
+         """Load the properties."""
+-        input_file = open(filename)
++        input_file = open(filename, 'rt', encoding='utf-8')
+         self.load_properties_from_text(input_file.read())
+         input_file.close()
+ 
+-- 
+2.5.5
+
diff --git a/meta-xfce/recipes-apps/menulibre/menulibre_2.1.3.bb b/meta-xfce/recipes-apps/menulibre/menulibre_2.1.3.bb
new file mode 100644
index 0000000..e945f01
--- /dev/null
+++ b/meta-xfce/recipes-apps/menulibre/menulibre_2.1.3.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "An advanced menu editor"
+HOMEPAGE = "https://launchpad.net/menulibre"
+SECTION = "x11/graphics"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+DEPENDS = "python3-distutils-extra-native"
+
+inherit distutils3 gtk-icon-cache
+
+SRC_URI = " \
+    https://launchpad.net/menulibre/2.1/${PV}/+download/${PN}-${PV}.tar.gz \
+    file://0001-add_launcher-Exit-early-if-no-row-is-selected.patch \
+    file://0002-setup.py-avoid-usr-share-share-paths.patch \
+    file://0003-MenulibreXdg.py-fix-loading-of-desktop-files.patch \
+"
+SRC_URI[md5sum] = "19d9d3337322eb5513454bb8cdfb739b"
+SRC_URI[sha256sum] = "bdd69740119902f1b1f8c7831155f4428403792a0a6c4287bcbb395c4e71fb31"
+
+do_install_append() {
+    sed -i 's:${D}::g' ${D}${datadir}/applications/menulibre.desktop
+}
+
+FILES_${PN} += " \
+    ${datadir}/applications \
+    ${datadir}/menulibre \
+    ${datadir}/icons \
+"
+
+RDEPENDS_${PN} += " \
+    gtk+3 \
+    python3-pygobject \
+    gnome-menus3 \
+    python3-unixadmin \
+    python3-psutil \
+"
-- 
2.5.5


