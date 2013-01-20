Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tx1O5-0007cN-CR
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jan 2013 21:21:14 +0100
Received: from mail-lb0-f200.google.com ([209.85.217.200])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 20 Jan 2013 12:05:35 -0800
Received: by mail-lb0-f200.google.com with SMTP id k6so1172058lbo.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jan 2013 12:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=BE9PVtA1rJ7zZGIGd/uDVruOKLYMuGOIgJ9nsNrQaTw=;
	b=JUrTR7IFrzbKHdubUdO0qUXvhaHvL1I9XZFMLzCYr21uvAIHAkmKJBgrL4+tJvlIiZ
	HDL7Zbn5QEeys9ky8q9EmDfJtUz6gMwr7iIatcsNlJLSllF47TvtXtcNY5X+kHvGLpfp
	kJ+TnL1qVfydPP43GBSlTns2NQwOItukFjQpkBoaoMO7Bf2cLno0fDNqac09eV74sDf6
	wOQAWZALz/D1waSfFTkfYxbm9jm1oBxYex2ARoiRhaeK5GE0XwVq1Fsr642d64AGGcmF
	ZFNcL2/+DOVBfQk5qzCmlGat+idWfC7ArSISiBIaiVyOJh6uqNuU0j1wdWMdm1+VBTbJ
	loVw==
X-Received: by 10.194.71.244 with SMTP id y20mr22859047wju.19.1358712333286;
	Sun, 20 Jan 2013 12:05:33 -0800 (PST)
X-Received: by 10.194.71.244 with SMTP id y20mr22859044wju.19.1358712333098;
	Sun, 20 Jan 2013 12:05:33 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id l5sm15224310wia.10.2013.01.20.12.05.31
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 20 Jan 2013 12:05:32 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jan 2013 20:03:34 +0000
Message-Id: <1358712214-21396-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQljkD6oE+6oafu8HdRqztZRFhvNgyL8onZaLslG0YNHJlDvMBpLD/1agrPPhggkJ5pNhxV1sumv+35fNosV1BvstrLbVcX5bPe0AkYVx6NS0nWY3/Dlx6AihSTLFoTQKKhYqhU6ktuPOBaKD4eolks40V3tIyGwTJ/Y7ofDvfEwwr/ifUvKBo/Z7bt/IZxP4kbuzeCJ
Subject: [meta-gnome][PATCH] metacity: add, from oe-core
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
X-List-Received-Date: Sun, 20 Jan 2013 20:21:15 -0000

Metacity, the GNOME 2 window manager.  Moved from oe-core as it's never used nor
tested there.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../metacity/remove-yelp-help-rules-var.patch      |   28 ++++++++++++++++++
 .../recipes-gnome/metacity/metacity_2.34.13.bb     |   30 ++++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.patch
 create mode 100644 meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb

diff --git a/meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.patch b/meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.patch
new file mode 100644
index 0000000..1970e9a
--- /dev/null
+++ b/meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.patch
@@ -0,0 +1,28 @@
+Remove unused variable (YELP_HELP_RULES)
+
+Upstream-Status: Pending
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+Index: metacity-2.34.13/doc/creating_themes/Makefile.am
+===================================================================
+--- metacity-2.34.13.orig/doc/creating_themes/Makefile.am
++++ metacity-2.34.13/doc/creating_themes/Makefile.am
+@@ -1,6 +1,5 @@
+ ### This part of Makefile.am can be customized by you.
+ 
+-@YELP_HELP_RULES@
+ 
+ # The name of the directory in /usr/share/gnome/help/, 
+ # and the name of the main .xml file:
+Index: metacity-2.34.13/doc/creating_themes/Makefile.in
+===================================================================
+--- metacity-2.34.13.orig/doc/creating_themes/Makefile.in
++++ metacity-2.34.13/doc/creating_themes/Makefile.in
+@@ -455,7 +455,6 @@ uninstall-am:
+ 	mostlyclean-libtool pdf pdf-am ps ps-am uninstall uninstall-am
+ 
+ 
+-@YELP_HELP_RULES@
+ 
+ # Tell versions [3.59,3.63) of GNU make to not export all variables.
+ # Otherwise a system limit (for SysV at least) may be exceeded.
diff --git a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
new file mode 100644
index 0000000..3605201
--- /dev/null
+++ b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
@@ -0,0 +1,30 @@
+SECTION = "x11/wm"
+DESCRIPTION = "Metacity is the boring window manager for the adult in you."
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://src/include/main.h;endline=24;md5=c2242df552c880280315989bab626b90"
+
+DEPENDS = "gsettings-desktop-schemas startup-notification gtk+ gconf gdk-pixbuf-native libcanberra gnome-doc-utils"
+PR = "r0"
+
+inherit gnome update-alternatives
+
+GNOME_COMPRESS_TYPE = "xz"
+
+SRC_URI += "file://remove-yelp-help-rules-var.patch"
+SRC_URI[archive.md5sum] = "6d89b71672d4fa49fc87f83d610d0ef6"
+SRC_URI[archive.sha256sum] = "8cf4dbf0da0a6f36357ce7db7f829ec685908a7792453c662fb8184572b91075"
+
+ALTERNATIVE_${PN} = "x-window-manager"
+ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/metacity"
+ALTERNATIVE_PRIORITY = "10"
+
+EXTRA_OECONF += "--disable-verbose \
+	         --disable-xinerama"
+
+do_configure_prepend() {
+	sed -i -e 's:$ZENITY:$NOZENITY:g' -e 's:-Werror::g' ${S}/configure.in
+}
+
+FILES_${PN} += "${datadir}/themes ${datadir}/gnome-control-center ${datadir}/gnome"
+
-- 
1.7.10.4



