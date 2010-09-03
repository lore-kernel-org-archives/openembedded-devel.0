Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OrKex-0003Ki-Gv
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 03:04:47 +0200
Received: (qmail invoked by alias); 03 Sep 2010 01:01:03 -0000
Received: from p508829C6.dip.t-dialin.net (EHLO [192.168.142.128])
	[80.136.41.198]
	by mail.gmx.net (mp036) with SMTP; 03 Sep 2010 03:01:03 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19CEIV+OqZCAG2Ry/nxF2SHcBJAg7Tlh/K1K2LC0r
	hisQINgx7NL4dS
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 3 Sep 2010 02:48:28 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
MIME-Version: 1.0
Message-Id: <201009030248.28858.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.22
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/5] libchamplain(-gtk): Bumped to 0.7.1 to meat actual clutter
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Sep 2010 01:07:20 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


* builds separate packages for libchamplain and libchamplain-gtk
* libchamplain_0.2.8 removed because it tries to configure against
  clutter-cairo which is no more available
* libchamplain-gtk_0.2.8 removed because it configures against
  very old clutter revision which do not build for GLES environments

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 recipes/gnome/libchamplain-gtk_0.2.8.bb |   12 ------------
 recipes/gnome/libchamplain_0.2.8.bb     |   13 -------------
 recipes/gnome/libchamplain_0.7.1.bb     |   15 +++++++++++++++
 3 files changed, 15 insertions(+), 25 deletions(-)
 delete mode 100644 recipes/gnome/libchamplain-gtk_0.2.8.bb
 delete mode 100644 recipes/gnome/libchamplain_0.2.8.bb
 create mode 100644 recipes/gnome/libchamplain_0.7.1.bb

diff --git a/recipes/gnome/libchamplain-gtk_0.2.8.bb b/recipes/gnome/libchamplain-gtk_0.2.8.bb
deleted file mode 100644
index e403da6..0000000
--- a/recipes/gnome/libchamplain-gtk_0.2.8.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Libchamplain is a C library aimed to provide a Gtk+ widget to display rasterized maps. "
-LICENSE = "LGPL"
-DEPENDS = "libchamplain clutter-gtk-0.8"
-
-inherit gnome autotools
-
-SRC_URI = "http://libchamplain.pierlux.com/release/${PV}/libchamplain-gtk-${PV}.tar.gz"
-
-
-
-SRC_URI[md5sum] = "c3e62c1912c0dba013c8f3df28fc809d"
-SRC_URI[sha256sum] = "03d751bd836174e2d6766d8036fc72e130dd090b13256d40a58ba6ab659475ef"
diff --git a/recipes/gnome/libchamplain_0.2.8.bb b/recipes/gnome/libchamplain_0.2.8.bb
deleted file mode 100644
index 4e2b6b4..0000000
--- a/recipes/gnome/libchamplain_0.2.8.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "Libchamplain is a C library aimed to provide a Gtk+ widget to display rasterized maps. "
-LICENSE = "LGPL"
-DEPENDS = "clutter-cairo libsoup-2.4 clutter gtk+"
-
-inherit gnome autotools
-
-SRC_URI = "http://libchamplain.pierlux.com/release/${PV}/libchamplain-${PV}.tar.gz"
-
-FILES_${PN} += "${datadir}/champlain/error.svg"
-
-
-SRC_URI[md5sum] = "fa4a620efa1a1c1036b6701b7d4dafe1"
-SRC_URI[sha256sum] = "01e17811a85e93e5158f5d721b9b1b249db44683735a172fa0debd9759d3175c"
diff --git a/recipes/gnome/libchamplain_0.7.1.bb b/recipes/gnome/libchamplain_0.7.1.bb
new file mode 100644
index 0000000..da67636
--- /dev/null
+++ b/recipes/gnome/libchamplain_0.7.1.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Libchamplain is a C library aimed to provide a Gtk+ widget to display rasterized maps. "
+LICENSE = "LGPLv2.1"
+DEPENDS = "cairo libsoup-2.4 clutter gtk+"
+PR = "r1"
+
+inherit gnome autotools
+
+FILES_${PN} += "${datadir}/champlain/error.svg"
+
+PACKAGES =+ "${PN}-gtk"
+RDEPENDS_${PN}-gtk = "clutter-gtk"
+FILES_${PN}-gtk = "${libdir}/libchamplain-gtk*so.*"
+
+SRC_URI[archive.md5sum] = "48bbaa2ab5b9b74c7dbffb81381e3020"
+SRC_URI[archive.sha256sum] = "c1669cbfc0d1b01950d9740fd5d3f9f57cdfaf37df855392bdd214210d2f4601"
-- 
1.5.3.4


