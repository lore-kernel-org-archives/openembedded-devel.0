Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Nnzt0-0000jm-GH
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Mar 2010 20:42:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id C54581C612
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Mar 2010 19:39:13 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id q48vG2RGn533
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Mar 2010 19:39:07 +0000 (GMT)
Received: from xora-build.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id BF5D81403D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Mar 2010 19:39:07 +0000 (GMT)
Received: by xora-build.xora.org.uk (Postfix, from userid 500)
	id B49AE43E4A; Sat,  6 Mar 2010 19:39:07 +0000 (GMT)
Date: Sat, 6 Mar 2010 19:39:07 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100306193907.GA5881@xora-build.xora.org.uk>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Possible gtk+-native de-breakage
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
X-List-Received-Date: Sat, 06 Mar 2010 19:42:11 -0000
X-Groupsio-MsgNum: 17383
Content-Type: multipart/mixed; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline

--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, I knocked this up while doing some enterprise java installs this after
noon and Im too brain fried to deal with it and wont have time in next few
days.

So can people checkout the attached patch/improve it.

Graeme


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="gtk-pixbuf.patch"

diff --git a/recipes/gtk+/gdk-pixbuf-csource-native_2.12.11.bb b/recipes/gtk+/gdk-pixbuf-csource-native_2.12.11.bb
deleted file mode 100644
index 22d30bf..0000000
--- a/recipes/gtk+/gdk-pixbuf-csource-native_2.12.11.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-require gtk+_${PV}.bb
-inherit native
-DEPENDS = "jpeg-native libpng-native gettext-native glib-2.0-native libx11-native"
-S = "${WORKDIR}/gtk+-${PV}"
-FILESPATH = "${FILE_DIRNAME}/gdk-pixbuf-csource:${FILE_DIRNAME}/gtk+-${PV}:${FILE_DIRNAME}/files"
-SRC_URI += "file://reduce-dependencies.patch;patch=1"
-
-#clear recommends for uclibc builds
-RRECOMMENDS = " "
-RRECOMMENDS_${PN}_linux = "  "
-RRECOMMENDS_${PN}_linux-gnueabi = " "
-
-EXTRA_OECONF = "\
-  --with-gdktarget=x11 \
-  --without-libtiff \
-  --with-libjpeg \
-  --with-libpng \
-  --disable-cups \
-"
-
-do_compile() {
-	cd gdk-pixbuf && oe_runmake
-}
-
-do_stage() {
-	cd gdk-pixbuf && oe_runmake install
-	find ${libdir} -name "libpixbufloader-*.la" -exec rm \{\} \;
-}
-
-do_install() {
-	:
-}
-
diff --git a/recipes/gtk+/gtk+.inc b/recipes/gtk+/gtk+.inc
index e6a0684..8e822b5 100644
--- a/recipes/gtk+/gtk+.inc
+++ b/recipes/gtk+/gtk+.inc
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "LGPL"
 PRIORITY = "optional"
 DEPENDS = "glib-2.0 tiff pango atk jpeg libpng libxext libxcursor gtk-doc libgcrypt cups \
-	   libxrandr libxdamage libxrender libxcomposite cairo jasper"
+	   libxrandr libxdamage libxrender libxcomposite cairo jasper gtk+-native"
 PROVIDES = "gdk-pixbuf"
 
 MAJ_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
@@ -51,6 +51,7 @@ FILES_${PN}-dbg += " \
 NEATSTUFF = " ttf-dejavu-sans gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg gdk-pixbuf-loader-gif gdk-pixbuf-loader-xpm "
 
 RRECOMMENDS_${PN} = " ${NEATSTUFF} "
+RRECOMMENDS_${PN}_libc-uclibc = " ${NEATSTUFF} "
 RRECOMMENDS_${PN}_linux = " ${NEATSTUFF} glibc-gconv-iso8859-1 "
 RRECOMMENDS_${PN}_linux-gnueabi = " ${NEATSTUFF} glibc-gconv-iso8859-1"
 
diff --git a/recipes/gtk+/gtk+_2.18.6.bb b/recipes/gtk+/gtk+_2.18.6.bb
index 9321b43..8546591 100644
--- a/recipes/gtk+/gtk+_2.18.6.bb
+++ b/recipes/gtk+/gtk+_2.18.6.bb
@@ -8,20 +8,14 @@ PR = "${INC_PR}.3"
 BBCLASSEXTEND = "native"
 
 DEPENDS_virtclass-native = "libpng-native atk-native pango-native cairo-native libxrender-native"
+PROVIDES_virtclass-native = "gdk-pixbuf-csource-native"
 
 # Enable xkb selectively
 XKBTOGGLE = " --disable-xkb"
 XKBTOGGLE_angstrom = ""
 
 EXTRA_OECONF = "--with-libtiff ${XKBTOGGLE} --disable-glibtest gio_can_sniff=yes"
-EXTRA_OECONF_append_virtclass-native = " --without-libtiff --without-libjpeg --disable-modules"
-
-do_install_virtclass-native () {
-	autotools_do_install
-	find ${D}${libdir} -name "libpixbufloader-*.la" -exec rm \{\} \;
-	rm ${D}${bindir}/gdk-pixbuf-csource
-	echo "going native!"
-}
+EXTRA_OECONF_append_virtclass-native = " --without-libtiff --without-libjpeg"
 
 PACKAGES_DYNAMIC = "gtk-module-* gdk-pixbuf-loader-* gtk-immodule-* gtk-printbackend-*"
 

--M9NhX3UHpAaciwkO--
