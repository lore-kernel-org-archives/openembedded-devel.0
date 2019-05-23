Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 264BB7E3F9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:32 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id f8so4899290wrt.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=wxXYv++6TJklKThFHE9/UpbG+8VHa2QWgXCncBswAdY=;
	b=ANPkEAcRnwtM5vvBlwI95ZeYx2SwiIa/bGTGPM5OaXdLqEM8lCRlChPbpRpN7sTfIq
	reeZYux1PwTY6fS2QMvkLCoysZI7v1gpiqqVWDumE8GFogtpVdnaYj3M3Qop4NSFpa8o
	hApEThbfnUivxcq59QWOguMLahjBXQirarZ46RpncE2ao9H0aZqLo6P+RucTKRtyNUtd
	MyAQIX6eR1DLnniHEYCSnxU5MquslQ8ZLPt643c44Gz4MqslPACNlXuWLrDnZGeCw5Uh
	3ZaTvKMHozGdlD2UiDsQcMTLhmCt2XF+vA2hbqS7aSu5lRZT4uXALKKZYUVp9VUvGEG+
	RbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wxXYv++6TJklKThFHE9/UpbG+8VHa2QWgXCncBswAdY=;
	b=PRKMs/k2ahhdpdtkh/kwto3jRHZzaFsl5llnfzK7I+AjZW/xp39BU5HPcMMmOlLnYL
	1A/sQZSnyffd7CMWmS4p8iYeLW0NMJ5DKNlvzDsBqJKcVgbyLojoY6l/yP4TR/Lhdrly
	/a0/4k4hyEFAkoxDISAsJQShN08w3aY5vUKJh1EIltprXALBXLssXLsN7trEvbIAULod
	liUJYWkwP2PyZqCA6s4CReAhXUAga0RNPK+iw1lDpIn03bGjqiIu/h1ymrW2ioeLdf8J
	Tfnz3/3nuEeyBxY/wi0INEzNg4IuB0cAHjNtOYM/dhYwkZtSbzxx8yJlKV29pyWFzKBD
	nwqQ==
X-Gm-Message-State: APjAAAX8+lZrthktQwiCrsojQMLl0RdC097N3lUKI26sKL90pkiiU/Xt
	DGjrq5kkxujKKXAgVT5GNKy0ozzpuGk=
X-Google-Smtp-Source: APXvYqw0UYZNUYfVZbejr7eqUN/XAknd6NxXLsEZ6y7ErpGkLEB4LB9qUnbxubju19a6Irn6jq6GSg==
X-Received: by 2002:adf:8307:: with SMTP id 7mr46960372wrd.86.1558594172478;
	Wed, 22 May 2019 23:49:32 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:31 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:46 +0200
Message-Id: <20190523064859.24336-29-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 28/41] colord: initial add 1.4.4
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
X-List-Received-Date: Thu, 23 May 2019 06:49:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* It is a dependency for upcoming gnome-settings-daemon
* It is used by GNOME and KDE [1] so  move it to meta-oe
* Getting it to build was a bit tricky. Udev (systemd) is a mandatory
  dependency and for native we do not support build. To get around native build
  was stripped down to what's necessary only. Native build is done with the
  help of configuration in recipe and (old-school) Makefile. This solution was
  chosen to avoid massive patching of meson build which tends to be a
  maintenance burden (as experienced at KDE recipes in meta-qt5-extra).

[1] https://www.freedesktop.org/software/colord/intro.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-support/colord/colord-native.bb   |  64 +++++++
 ...n-cd_icc_create_from_edid-to-avoid-u.patch | 166 ++++++++++++++++++
 .../colord/colord-native/Makefile             |  48 +++++
 meta-oe/recipes-support/colord/colord.bb      |  42 +++++
 meta-oe/recipes-support/colord/colord.inc     |  13 ++
 ...Run-native-cd_idt8-cd_create_profile.patch |  59 +++++++
 6 files changed, 392 insertions(+)
 create mode 100644 meta-oe/recipes-support/colord/colord-native.bb
 create mode 100644 meta-oe/recipes-support/colord/colord-native/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch
 create mode 100644 meta-oe/recipes-support/colord/colord-native/Makefile
 create mode 100644 meta-oe/recipes-support/colord/colord.bb
 create mode 100644 meta-oe/recipes-support/colord/colord.inc
 create mode 100644 meta-oe/recipes-support/colord/colord/0001-Run-native-cd_idt8-cd_create_profile.patch

diff --git a/meta-oe/recipes-support/colord/colord-native.bb b/meta-oe/recipes-support/colord/colord-native.bb
new file mode 100644
index 000000000..845041cc4
--- /dev/null
+++ b/meta-oe/recipes-support/colord/colord-native.bb
@@ -0,0 +1,64 @@
+require ${BPN}.inc
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}-native:"
+
+inherit meson native
+
+DEPENDS += " \
+    meson-native \
+    glib-2.0-native \
+    lcms-native \
+"
+
+SRC_URI += " \
+    file://0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch \
+    file://Makefile;subdir=${BPN}-${PV} \
+"
+
+do_configure() {
+    # we expect meson to fail - but before it extracts project's version in log file
+    meson ${MESONOPTS} "${MESON_SOURCEPATH}" "${B}" ${MESON_CROSS_FILE} ${EXTRA_OEMESON} > /dev/null 2>&1 || true
+
+    # extract and split version
+    version=`grep 'Project version:' ${B}/meson-logs/meson-log.txt | sed 's|Project version: ||'`
+    major=`echo $version | cut -d. -f1`
+    minor=`echo $version | cut -d. -f2`
+    micro=`echo $version | cut -d. -f3`
+    echo "Project version: $major.$minor.$micro"
+
+    # extract project name
+    proj_name=`grep 'Project name:' ${B}/meson-logs/meson-log.txt | sed 's|Project name: ||'`
+
+    # create cd-version.h
+    mkdir -p ${B}/colord
+	sed ${S}/lib/colord/cd-version.h.in \
+		-e 's:@CD_MAJOR_VERSION_PRIVATE@:1:g' \
+		-e 's:@CD_MINOR_VERSION_PRIVATE@:4:g' \
+		-e 's:@CD_MICRO_VERSION_PRIVATE@:4:g' \
+		> ${B}/colord/cd-version.h
+
+    # create config.h based on target build and add what's necessary only
+    localedir=`echo ${datadir}/locale | sed 's:${prefix}/::g'`
+    echo "#define LOCALEDIR \"$localedir\"" >> ${B}/config.h
+    echo "#define GETTEXT_PACKAGE \"colord\"" >> ${B}/config.h
+    echo "#define PACKAGE_NAME \"$proj_name\"" >> ${B}/config.h
+    echo "#define PACKAGE_VERSION \"$version\"" >> ${B}/config.h
+}
+
+do_compile() {
+    oe_runmake -C${S} DESTDIR=${B}
+}
+
+do_install() {
+    version=`grep 'Project version:' ${B}/meson-logs/meson-log.txt | sed 's|Project version: ||'`
+    major=`echo $version | cut -d. -f1`
+
+    install -d ${D}${libdir}
+    install -m 755 ${B}/libcolord.so ${D}${libdir}/libcolord.so.$version
+    ln -s libcolord.so.$version "${D}/${libdir}/libcolord.so"
+    ln -s libcolord.so.$version "${D}/${libdir}/libcolord.so.$major"
+
+    install -d ${D}${bindir}
+    install -m 755 ${B}/cd_create_profile ${D}${bindir}/
+    install -m 755 ${B}/cd_idt8 ${D}${bindir}/
+}
diff --git a/meta-oe/recipes-support/colord/colord-native/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch b/meta-oe/recipes-support/colord/colord-native/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch
new file mode 100644
index 000000000..278b90e07
--- /dev/null
+++ b/meta-oe/recipes-support/colord/colord-native/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch
@@ -0,0 +1,166 @@
+From cbb8f5c05fce1d56ae2e5fa9f57fc49c47bed5ab Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sun, 12 May 2019 21:58:02 +0200
+Subject: [PATCH] Move the function cd_icc_create_from_edid to avoid udev
+ dependeny
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+We do not have udev-native so it is a dependeny we cannot satisfy
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ lib/colord/cd-edid.c | 63 ++++++++++++++++++++++++++++++++++++++++++++
+ lib/colord/cd-icc.c  | 62 -------------------------------------------
+ 2 files changed, 63 insertions(+), 62 deletions(-)
+
+diff --git a/lib/colord/cd-edid.c b/lib/colord/cd-edid.c
+index a5e2328..dec509a 100644
+--- a/lib/colord/cd-edid.c
++++ b/lib/colord/cd-edid.c
+@@ -687,3 +687,66 @@ cd_edid_new (void)
+ 	edid = g_object_new (CD_TYPE_EDID, NULL);
+ 	return CD_EDID (edid);
+ }
++
++/**
++ * cd_icc_create_from_edid_data:
++ * @icc: A valid #CdIcc
++ * @edid: EDID data
++ * @error: A #GError, or %NULL
++ *
++ * Creates an ICC profile from EDID data.
++ *
++ * Return value: %TRUE for success
++ *
++ * Since: 1.1.2
++ **/
++gboolean
++cd_icc_create_from_edid_data (CdIcc *icc, CdEdid *edid, GError **error)
++{
++	CdIccPrivate *priv = GET_PRIVATE (icc);
++	const gchar *data;
++
++	/* not loaded */
++	if (priv->lcms_profile != NULL) {
++		g_set_error_literal (error,
++				     CD_ICC_ERROR,
++				     CD_ICC_ERROR_FAILED_TO_CREATE,
++				     "already loaded or generated");
++		return FALSE;
++	}
++
++	/* create from parsed object */
++	if (!cd_icc_create_from_edid (icc,
++				      cd_edid_get_gamma (edid),
++				      cd_edid_get_red (edid),
++				      cd_edid_get_green (edid),
++				      cd_edid_get_blue (edid),
++				      cd_edid_get_white (edid),
++				      error)) {
++		return FALSE;
++	}
++
++	/* set copyright */
++	cd_icc_set_copyright (icc, NULL,
++			      /* deliberately not translated */
++			      "This profile is free of known copyright restrictions.");
++
++	/* set 'ICC meta Tag for Monitor Profiles' data */
++	data = cd_edid_get_checksum (edid);
++	if (data != NULL)
++		cd_icc_add_metadata (icc, CD_PROFILE_METADATA_EDID_MD5, data);
++	data = cd_edid_get_monitor_name (edid);
++	if (data != NULL)
++		cd_icc_add_metadata (icc, CD_PROFILE_METADATA_EDID_MODEL, data);
++	data = cd_edid_get_serial_number (edid);
++	if (data != NULL)
++		cd_icc_add_metadata (icc, CD_PROFILE_METADATA_EDID_SERIAL, data);
++	data = cd_edid_get_pnp_id (edid);
++	if (data != NULL)
++		cd_icc_add_metadata (icc, CD_PROFILE_METADATA_EDID_MNFT, data);
++	data = cd_edid_get_vendor_name (edid);
++	if (data != NULL)
++		cd_icc_add_metadata (icc, CD_PROFILE_METADATA_EDID_VENDOR, data);
++	return TRUE;
++}
++
+diff --git a/lib/colord/cd-icc.c b/lib/colord/cd-icc.c
+index f231814..2c8fe77 100644
+--- a/lib/colord/cd-icc.c
++++ b/lib/colord/cd-icc.c
+@@ -3094,68 +3094,6 @@ out:
+ 	return ret;
+ }
+ 
+-/**
+- * cd_icc_create_from_edid_data:
+- * @icc: A valid #CdIcc
+- * @edid: EDID data
+- * @error: A #GError, or %NULL
+- *
+- * Creates an ICC profile from EDID data.
+- *
+- * Return value: %TRUE for success
+- *
+- * Since: 1.1.2
+- **/
+-gboolean
+-cd_icc_create_from_edid_data (CdIcc *icc, CdEdid *edid, GError **error)
+-{
+-	CdIccPrivate *priv = GET_PRIVATE (icc);
+-	const gchar *data;
+-
+-	/* not loaded */
+-	if (priv->lcms_profile != NULL) {
+-		g_set_error_literal (error,
+-				     CD_ICC_ERROR,
+-				     CD_ICC_ERROR_FAILED_TO_CREATE,
+-				     "already loaded or generated");
+-		return FALSE;
+-	}
+-
+-	/* create from parsed object */
+-	if (!cd_icc_create_from_edid (icc,
+-				      cd_edid_get_gamma (edid),
+-				      cd_edid_get_red (edid),
+-				      cd_edid_get_green (edid),
+-				      cd_edid_get_blue (edid),
+-				      cd_edid_get_white (edid),
+-				      error)) {
+-		return FALSE;
+-	}
+-
+-	/* set copyright */
+-	cd_icc_set_copyright (icc, NULL,
+-			      /* deliberately not translated */
+-			      "This profile is free of known copyright restrictions.");
+-
+-	/* set 'ICC meta Tag for Monitor Profiles' data */
+-	data = cd_edid_get_checksum (edid);
+-	if (data != NULL)
+-		cd_icc_add_metadata (icc, CD_PROFILE_METADATA_EDID_MD5, data);
+-	data = cd_edid_get_monitor_name (edid);
+-	if (data != NULL)
+-		cd_icc_add_metadata (icc, CD_PROFILE_METADATA_EDID_MODEL, data);
+-	data = cd_edid_get_serial_number (edid);
+-	if (data != NULL)
+-		cd_icc_add_metadata (icc, CD_PROFILE_METADATA_EDID_SERIAL, data);
+-	data = cd_edid_get_pnp_id (edid);
+-	if (data != NULL)
+-		cd_icc_add_metadata (icc, CD_PROFILE_METADATA_EDID_MNFT, data);
+-	data = cd_edid_get_vendor_name (edid);
+-	if (data != NULL)
+-		cd_icc_add_metadata (icc, CD_PROFILE_METADATA_EDID_VENDOR, data);
+-	return TRUE;
+-}
+-
+ /**
+  * cd_icc_create_from_edid:
+  * @icc: A valid #CdIcc
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-support/colord/colord-native/Makefile b/meta-oe/recipes-support/colord/colord-native/Makefile
new file mode 100644
index 000000000..ca265ca6f
--- /dev/null
+++ b/meta-oe/recipes-support/colord/colord-native/Makefile
@@ -0,0 +1,48 @@
+# For native build cd_idt8, cd_create_profile and a tiny version of libcolord.so
+# only. By reducing the library to what's necessary, we avoid dependencies on
+# naitve udev and libgudev
+
+CFLAGS+=$(shell pkg-config --cflags gio-2.0)
+CFLAGS+=$(shell pkg-config --cflags lcms2)
+CFLAGS+=-I./lib -I./lib/colord -I$(DESTDIR) -DCD_COMPILATION
+
+LDFLAGS+=$(shell pkg-config --libs gio-2.0)
+LDFLAGS+=$(shell pkg-config --libs lcms2)
+LDFLAGS+=-lm
+
+all: cd_idt8 cd_create_profile
+
+LIBSOURCES = \
+	lib/colord/cd-it8.c \
+	lib/colord/cd-color.c \
+	lib/colord/cd-spectrum.c \
+	lib/colord/cd-math.c \
+	lib/colord/cd-interp-akima.c \
+	lib/colord/cd-context-lcms.c \
+	lib/colord/cd-interp.c \
+	lib/colord/cd-interp-linear.c \
+	lib/colord/cd-it8-utils.c \
+	lib/colord/cd-enum.c \
+    lib/colord/cd-icc.c \
+    lib/colord/cd-icc-utils.c \
+    lib/colord/cd-dom.c
+
+libcolord.so: $(LIBSOURCES)
+	$(CC) $(CFLAGS) -fPIC -shared -Wl,-soname,$@ $^ -o $(DESTDIR)/$@
+
+cd_idt8.o: client/cd-it8.c
+	$(CC) $(CFLAGS) -c $^ -o $(DESTDIR)/$@
+
+cd_idt8: libcolord.so cd_idt8.o
+	$(CC) $(LDFLAGS) -L$(DESTDIR) -lcolord $(DESTDIR)/cd_idt8.o -o $(DESTDIR)/$@
+
+cd_create_profile.o: client/cd-create-profile.c
+	$(CC) $(CFLAGS) -c $^ -o $(DESTDIR)/$@
+
+cd_create_profile: libcolord.so cd_create_profile.o
+	$(CC) $(LDFLAGS) -L$(DESTDIR) -lcolord $(DESTDIR)/cd_create_profile.o -o $(DESTDIR)/$@
+
+.PHONY: clean
+
+clean:
+	rm -f $(DESTDIR)/libcolord.so $(DESTDIR)/*.o $(DESTDIR)/cd_idt8 $(DESTDIR)/cd_create_profile
diff --git a/meta-oe/recipes-support/colord/colord.bb b/meta-oe/recipes-support/colord/colord.bb
new file mode 100644
index 000000000..8eee9dad1
--- /dev/null
+++ b/meta-oe/recipes-support/colord/colord.bb
@@ -0,0 +1,42 @@
+require ${BPN}.inc
+
+inherit meson gobject-introspection gsettings gettext bash-completion systemd distro_features_check
+
+# polkit and gobject-introspection are mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES = "polkit gobject-introspection-data"
+UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
+
+DEPENDS += " \
+    ${BPN}-native \
+    glib-2.0 \
+    lcms \
+    sqlite3 \
+    libgusb \
+    libgudev \
+    polkit \
+"
+
+SRC_URI += " \
+    file://0001-Run-native-cd_idt8-cd_create_profile.patch \
+"
+
+EXTRA_OEMESON = " \
+    -Dman=false \
+    -Ddocs=false \
+"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG[systemd] = "-Dsystemd=true, -Dsystemd=true, systemd"
+
+SYSTEMD_SERVICE_${PN} = "colord.service"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${datadir}/polkit-1 \
+    ${datadir}/glib-2.0 \
+    ${datadir}/color \
+    ${systemd_user_unitdir} \
+    ${libdir}/tmpfiles.d \
+    ${libdir}/colord-plugins \
+    ${libdir}/colord-sensors \
+"
diff --git a/meta-oe/recipes-support/colord/colord.inc b/meta-oe/recipes-support/colord/colord.inc
new file mode 100644
index 000000000..7497fed51
--- /dev/null
+++ b/meta-oe/recipes-support/colord/colord.inc
@@ -0,0 +1,13 @@
+SUMMARY = "Making color management just work"
+HOMEPAGE = "https://www.freedesktop.org/software/colord/"
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://meson.build;beginline=3;endline=3;md5=f42198707d793be58b274d34fd5238c3 \
+"
+
+PV = "1.4.4"
+SRC_URI = "https://www.freedesktop.org/software/colord/releases/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "32c2709a6002d9ee750483aaed6379c8"
+SRC_URI[sha256sum] = "9a0fe80160bf88efddb582a9fc0169f56065276dc3882c47dddb9eecd048c0a5"
+
diff --git a/meta-oe/recipes-support/colord/colord/0001-Run-native-cd_idt8-cd_create_profile.patch b/meta-oe/recipes-support/colord/colord/0001-Run-native-cd_idt8-cd_create_profile.patch
new file mode 100644
index 000000000..4b52aa337
--- /dev/null
+++ b/meta-oe/recipes-support/colord/colord/0001-Run-native-cd_idt8-cd_create_profile.patch
@@ -0,0 +1,59 @@
+From 5aad8831c0fb71940d6c4f982b0b30ffb6ae33b3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sun, 12 May 2019 22:47:05 +0200
+Subject: [PATCH] Run native cd_idt8/cd_create_profile
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ data/cmf/meson.build        | 2 +-
+ data/illuminant/meson.build | 2 +-
+ data/profiles/meson.build   | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/data/cmf/meson.build b/data/cmf/meson.build
+index a693cd7..1ae3613 100644
+--- a/data/cmf/meson.build
++++ b/data/cmf/meson.build
+@@ -2,7 +2,7 @@ foreach arg: [ 'CIE1964-10deg-XYZ', 'CIE1931-2deg-XYZ' ]
+   custom_target(arg,
+     input: arg + '.csv',
+     output: arg + '.cmf',
+-    command: [ cd_idt8, 'create-cmf', '@OUTPUT@', '@INPUT@', '1.0' ],
++    command: [ 'cd_idt8', 'create-cmf', '@OUTPUT@', '@INPUT@', '1.0' ],
+     install: true,
+     install_dir: join_paths(datadir, 'colord', 'cmf')
+   )
+diff --git a/data/illuminant/meson.build b/data/illuminant/meson.build
+index f8dfa07..ad7dced 100644
+--- a/data/illuminant/meson.build
++++ b/data/illuminant/meson.build
+@@ -24,7 +24,7 @@ foreach arg: generated_spectra
+   custom_target(arg,
+     input: arg + '.csv',
+     output: arg + '.sp',
+-    command: [ cd_idt8, 'create-sp', '@OUTPUT@', '@INPUT@', '100.0' ],
++    command: [ 'cd_idt8', 'create-sp', '@OUTPUT@', '@INPUT@', '100.0' ],
+     install: true,
+     install_dir: join_paths(datadir, 'colord', 'illuminant')
+   )
+diff --git a/data/profiles/meson.build b/data/profiles/meson.build
+index 591b97d..2cef011 100644
+--- a/data/profiles/meson.build
++++ b/data/profiles/meson.build
+@@ -59,7 +59,7 @@ foreach arg: icc_profiles
+   generated_icc = custom_target(arg + '.icc',
+     input: xml_i18n,
+     output: arg + '.icc',
+-    command: [ cd_create_profile, '--output=@OUTPUT@', '@INPUT@' ],
++    command: [ 'cd_create_profile', '--output=@OUTPUT@', '@INPUT@' ],
+     install: true,
+     install_dir: join_paths(datadir, 'color', 'icc', 'colord'),
+   )
+-- 
+2.20.1
+
-- 
2.20.1


