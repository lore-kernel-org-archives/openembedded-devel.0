Received: from [72.14.220.159] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1L9wx8-0001VF-7t
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Dec 2008 08:24:18 +0100
Received: by fg-out-1718.google.com with SMTP id l26so1116283fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Dec 2008 23:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=7P//l4LsaZu2Jel7s71q/2XI1L/KZDhd4OiRZMqo5AA=;
	b=mNLvG1IEXGNEN1bGcZxzbkeWuMTrB/ahVhlHiR7fN5HTA7VD+Fq09N9LDIo4IoFkvI
	Lu+AdIt2acv4AfPXFku9ikMuKFet9vaGskCFgtaKlGefc/qSN+T8zCbt18g/0ktefOtT
	T3k5xfEd3ja6Z/+fOLSCaloVq3RfPBxlftihw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=FOrWv2CavOv3tFT9JxGb3k3TnUVg2QCTouONvqr+WCQ9zWwQ99p0Aj+iPnYYdmOGRh
	r5EPvLRtuV8dpF2y9+5bEnnbfWOfiR8Ku5ncVvtHU5lbf9cgo/PNicDRKCfdIagZuYTZ
	cH+v//MLT7euwGgW9DRvHIX7eqDf6t6Exr7ZI=
Received: by 10.181.208.15 with SMTP id k15mr1542453bkq.130.1228807223092;
	Mon, 08 Dec 2008 23:20:23 -0800 (PST)
Received: from localhost.localdomain (iap-pxy-mow1.siemens.ru [212.248.25.26])
	by mx.google.com with ESMTPS id
	35sm24282567fkt.34.2008.12.08.23.20.21
	(version=SSLv3 cipher=RC4-MD5); Mon, 08 Dec 2008 23:20:22 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Dec 2008 10:19:06 +0300
Message-Id: <1228807146-4208-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1228807146-4208-1-git-send-email-dbaryshkov@gmail.com>
References: <1228807146-4208-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, fb@kernelconcepts.de
Subject: [RFC][PATCH] fbreader: add 0.8.17 recipe for both fbreader and fbreader-opie
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
X-List-Received-Date: Tue, 09 Dec 2008 07:24:18 -0000

Add new version recipe. Also add fbreader-opie_0.8.17 recipe which will
build fbreader for use with Opie environment.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../fbreader-0.8.17_buildsys_oe.patch              |   37 ++++++++++++++++++++
 .../fbreader-0.8.17_buildsys_oe.patch              |   37 ++++++++++++++++++++
 packages/fbreader/fbreader-opie_0.8.17.bb          |   18 +++++++++
 packages/fbreader/fbreader_0.8.17.bb               |   13 +++++++
 4 files changed, 105 insertions(+), 0 deletions(-)
 create mode 100644 packages/fbreader/fbreader-0.8.17/fbreader-0.8.17_buildsys_oe.patch
 create mode 100644 packages/fbreader/fbreader-opie-0.8.17/fbreader-0.8.17_buildsys_oe.patch
 create mode 100644 packages/fbreader/fbreader-opie_0.8.17.bb
 create mode 100644 packages/fbreader/fbreader_0.8.17.bb

diff --git a/packages/fbreader/fbreader-0.8.17/fbreader-0.8.17_buildsys_oe.patch b/packages/fbreader/fbreader-0.8.17/fbreader-0.8.17_buildsys_oe.patch
new file mode 100644
index 0000000..9c18118
--- /dev/null
+++ b/packages/fbreader/fbreader-0.8.17/fbreader-0.8.17_buildsys_oe.patch
@@ -0,0 +1,37 @@
+Index: fbreader-0.8.17/makefiles/arch/openzaurus.mk
+===================================================================
+--- fbreader-0.8.17.orig/makefiles/arch/openzaurus.mk	2008-11-23 14:44:17.149701776 +0300
++++ fbreader-0.8.17/makefiles/arch/openzaurus.mk	2008-11-23 14:56:41.825702915 +0300
+@@ -1,7 +1,7 @@
+ include $(ROOTDIR)/makefiles/arch/unix.mk
+ 
+ ifeq "$(UI_TYPE)" "opie"
+-  INSTALLDIR = /opt/QtPalmtop
++  INSTALLDIR = /usr/lib/opie
+   IMAGEDIR = $(INSTALLDIR)/pics
+ else # UI_TYPE == gpe
+   INSTALLDIR = /usr
+@@ -17,7 +17,7 @@ LIBPATH = $(BASEPATH)/arm-linux/lib
+ RM = rm -rvf
+ RM_QUIET = rm -rf
+ QTINCLUDE = -I $(INCPATH)/qt2
+-GTKINCLUDE = -I$(LIBPATH)/glib-2.0/include -I$(LIBPATH)/gtk-2.0/include -I$(INCPATH)/glib-2.0 -I$(INCPATH)/gtk-2.0 -I$(INCPATH)/pango-1.0 -I$(INCPATH)/atk-1.0
++GTKINCLUDE = -I$(LIBPATH)/glib-2.0/include -I$(LIBPATH)/gtk-2.0/include -I$(INCPATH)/cairo -I$(INCPATH)/glib-2.0 -I$(INCPATH)/gtk-2.0 -I$(INCPATH)/pango-1.0 -I$(INCPATH)/atk-1.0
+ MOC = $(TOOLSPATH)/moc
+ CC = $(TOOLSPATH)/arm-linux-gcc
+ AR = $(TOOLSPATH)/arm-linux-ar rsu
+@@ -27,10 +27,10 @@ XML_LIB = -lexpat
+ ARCHIVER_LIB = -lz -lbz2
+ 
+ ifeq "$(UI_TYPE)" "opie"
+-	UILIBS = -lqte -lqpe
++	UILIBS = -lqte-mt
+ else
+-	UILIBS = -lgpewidget -lgtk-x11-2.0 -lgdk-x11-2.0 -lgdk_pixbuf-2.0
++	UILIBS = $(shell pkg-config --libs gtk+-2.0) -lgpewidget
+ endif
+ 
+-CFLAGS = -pipe -DOPIE_NO_DEBUG -DQT_NO_DEBUG -DQWS -fno-exceptions -fno-rtti -march=armv4 -mtune=xscale --param inline-unit-growth=200 --param large-function-growth=400 -Wall -Wno-ctor-dtor-privacy -W -Winline
+-LDFLAGS = -Wl,-rpath,$(LIBDIR)
++CFLAGS = -pipe -DOPIE_NO_DEBUG -DQT_NO_DEBUG -DQWS -fno-exceptions -fno-rtti $(OE_CFLAGS)
++LDFLAGS = -Wl,-rpath,$(LIBDIR) -Wl,-rpath,$(LIBPATH) -L$(LIBPATH)
diff --git a/packages/fbreader/fbreader-opie-0.8.17/fbreader-0.8.17_buildsys_oe.patch b/packages/fbreader/fbreader-opie-0.8.17/fbreader-0.8.17_buildsys_oe.patch
new file mode 100644
index 0000000..ab48513
--- /dev/null
+++ b/packages/fbreader/fbreader-opie-0.8.17/fbreader-0.8.17_buildsys_oe.patch
@@ -0,0 +1,37 @@
+Index: fbreader-0.8.17/makefiles/arch/openzaurus.mk
+===================================================================
+--- fbreader-0.8.17.orig/makefiles/arch/openzaurus.mk	2008-11-23 14:44:17.149701776 +0300
++++ fbreader-0.8.17/makefiles/arch/openzaurus.mk	2008-11-23 14:56:41.825702915 +0300
+@@ -1,7 +1,7 @@
+ include $(ROOTDIR)/makefiles/arch/unix.mk
+ 
+ ifeq "$(UI_TYPE)" "opie"
+-  INSTALLDIR = /opt/QtPalmtop
++  INSTALLDIR = /usr/lib/opie
+   IMAGEDIR = $(INSTALLDIR)/pics
+ else # UI_TYPE == gpe
+   INSTALLDIR = /usr
+@@ -17,7 +17,7 @@ LIBPATH = $(BASEPATH)/arm-linux/lib
+ RM = rm -rvf
+ RM_QUIET = rm -rf
+ QTINCLUDE = -I $(INCPATH)/qt2
+-GTKINCLUDE = -I$(LIBPATH)/glib-2.0/include -I$(LIBPATH)/gtk-2.0/include -I$(INCPATH)/glib-2.0 -I$(INCPATH)/gtk-2.0 -I$(INCPATH)/pango-1.0 -I$(INCPATH)/atk-1.0
++GTKINCLUDE = -I$(LIBPATH)/glib-2.0/include -I$(LIBPATH)/gtk-2.0/include -I$(INCPATH)/cairo -I$(INCPATH)/glib-2.0 -I$(INCPATH)/gtk-2.0 -I$(INCPATH)/pango-1.0 -I$(INCPATH)/atk-1.0
+ MOC = $(TOOLSPATH)/moc
+ CC = $(TOOLSPATH)/arm-linux-gcc
+ AR = $(TOOLSPATH)/arm-linux-ar rsu
+@@ -27,10 +27,10 @@ XML_LIB = -lexpat
+ ARCHIVER_LIB = -lz -lbz2
+ 
+ ifeq "$(UI_TYPE)" "opie"
+-	UILIBS = -lqte -lqpe
++	UILIBS = -lqte-mt -lqpe
+ else
+-	UILIBS = -lgpewidget -lgtk-x11-2.0 -lgdk-x11-2.0 -lgdk_pixbuf-2.0
++	UILIBS = $(shell pkg-config --libs gtk+-2.0) -lgpewidget
+ endif
+ 
+-CFLAGS = -pipe -DOPIE_NO_DEBUG -DQT_NO_DEBUG -DQWS -fno-exceptions -fno-rtti -march=armv4 -mtune=xscale --param inline-unit-growth=200 --param large-function-growth=400 -Wall -Wno-ctor-dtor-privacy -W -Winline
+-LDFLAGS = -Wl,-rpath,$(LIBDIR)
++CFLAGS = -pipe -DOPIE_NO_DEBUG -DQT_NO_DEBUG -DQWS -fno-exceptions -fno-rtti $(OE_CFLAGS)
++LDFLAGS = -Wl,-rpath,$(LIBDIR) -Wl,-rpath,$(LIBPATH) -L$(LIBPATH)
diff --git a/packages/fbreader/fbreader-opie_0.8.17.bb b/packages/fbreader/fbreader-opie_0.8.17.bb
new file mode 100644
index 0000000..55728f8
--- /dev/null
+++ b/packages/fbreader/fbreader-opie_0.8.17.bb
@@ -0,0 +1,18 @@
+require fbreader.inc
+
+SECTION = "opie/applications"
+DEPENDS += "virtual/libqte2 liblinebreak"
+PR = "r0"
+
+SRC_URI += "file://fbreader-0.8.17_buildsys_oe.patch;patch=1"
+EXTRA_OEMAKE = "CC='${CXX}' LD='${CXX}' OE_CFLAGS='-fno-exceptions -fno-rtti ${CXXFLAGS} -I${STAGING_DIR_HOST}/qt2/include/' MOC='${STAGING_BINDIR_NATIVE}/moc' INCPATH='${STAGING_INCDIR}' LIBPATH='${STAGING_DIR_HOST}/qt2/lib'"
+
+READER_GUI = "opie"
+FILES_${PN} += " ${libdir}/opie/ "
+FILES_${PN}-dbg += " ${libdir}/opie/.debug "
+
+do_install () {
+        oe_runmake install 'DESTDIR=${D}' RESOLUTION=${READER_RESOLUTION}
+}
+
+S = "${WORKDIR}/fbreader-${PV}"
diff --git a/packages/fbreader/fbreader_0.8.17.bb b/packages/fbreader/fbreader_0.8.17.bb
new file mode 100644
index 0000000..ac10960
--- /dev/null
+++ b/packages/fbreader/fbreader_0.8.17.bb
@@ -0,0 +1,13 @@
+require fbreader.inc
+
+SECTION = "x11/utils"
+DEPENDS += "gtk+ libgpewidget liblinebreak"
+PR = "r0"
+
+SRC_URI += "file://fbreader-0.8.17_buildsys_oe.patch;patch=1"
+
+inherit pkgconfig
+
+do_install () {
+        oe_runmake install 'DESTDIR=${D}' RESOLUTION=${READER_RESOLUTION}
+}
-- 
1.5.6.5



