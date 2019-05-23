Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6EDF07E442
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 11:54:59 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 198so5515658wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 04:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZeBsY68o3hkfPk18Ays8399Ja+iiNUNjUUmh5EWHj68=;
	b=bfJhDAUrEYe0H+1NWpaVDAEhCCrqDkho+tOLP7EOg7yEZ7TF5JXpiNhsywQVBHKuyO
	6EtYyAQiRgJlA/WyvXOPzGbacH7JBep63wNBka6yjNaENhA6b6RWj37jo+XPGLX27HtE
	yaq+q3sR7anvTzcqVokY6d7IgU2rStnG1gQ7JBXvCbHG0WjwatwpECpywtAGn3+GElVc
	9ZZjS5Bn2aSmh9b/vwZ1/GdOglvWl4XHfVLDGQeaeBCYgNZpJ1ig525SgqdhgXu2+WWT
	/QeWkoX9vqtbG/+Cv2Lsl2qSj/2hErdciWY4HFS4FTVA0hTPI3qNhJlqyI9zT/eH1efn
	2LIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZeBsY68o3hkfPk18Ays8399Ja+iiNUNjUUmh5EWHj68=;
	b=gIL2fehiqoips4U8SdcwIvSzffzuyfd6wSsQhfXx3efoAcimMaNbpVY+Bc1UopuSoy
	uVT1lotyo4yOecEOKCIIwK4PsZ0HEPfTFNwM5X6PlV4M3Pq2c97OIq9Gm1GeKXR82rSM
	+7sWLqAlmLJ5B+LIraKeAWvR68iNM2hgCXsW+aRJ1JG+6nBYnq2IV6FmblEE7muVJurY
	TZQN9maFlF3OzcKWVggc5r5tJ5N6ra+kmc5Kn04XfT3WxXAockZTi55+Y/sYzmAj/qdT
	QSZoeALdkeIqKTAHyMf3YyH7LjcbLG5+DVXh67KM5JT6zKzRyodulotCX1XpwacZu3I3
	Q5GA==
X-Gm-Message-State: APjAAAVgEdKbfexxPnqrLgoz/dKDUY/KNkTujZyyVs5SYpK6eM3zRbvG
	laPBDKp02BY7bmKZcqKhOCY21zPx
X-Google-Smtp-Source: APXvYqwAFC016Vz+xoZG66zsFhGqiyYpDF41AeNqKECiMSCr+M+bUbJ3Jelgg1X6ebJfu86X0NDX9g==
X-Received: by 2002:a1c:800f:: with SMTP id b15mr12068192wmd.46.1558612499913; 
	Thu, 23 May 2019 04:54:59 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	x187sm11010015wmg.11.2019.05.23.04.54.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 May 2019 04:54:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 11:55:00 +0000
Message-Id: <20190523115505.18245-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190523115505.18245-1-Martin.Jansa@gmail.com>
References: <20190523115505.18245-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/8] funyahoo-plusplus, icyque, pidgin-sipe, purple-skypeweb: add couple plugins for pidgin
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
X-List-Received-Date: Thu, 23 May 2019 11:54:59 -0000

* import from luneos to make pidgin here in meta-oe a bit more useful

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../pidgin/funyahoo-plusplus_git.bb           | 25 ++++++++++++++
 meta-oe/recipes-support/pidgin/icyque_git.bb  | 27 +++++++++++++++
 .../pidgin/pidgin-sipe_1.24.0.bb              | 34 +++++++++++++++++++
 .../pidgin/purple-skypeweb_git.bb             | 26 ++++++++++++++
 4 files changed, 112 insertions(+)
 create mode 100644 meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
 create mode 100644 meta-oe/recipes-support/pidgin/icyque_git.bb
 create mode 100644 meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb
 create mode 100644 meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb

diff --git a/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb b/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
new file mode 100644
index 0000000000..3a437659e7
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Protocol plugin for New Yahoo (2016) for Adium, Pidgin, Miranda and Telepathy IM Framework"
+SECTION = "webos/services"
+LICENSE = "GPLv3.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
+
+DEPENDS = "pidgin json-glib glib-2.0"
+
+inherit pkgconfig
+
+SRC_URI = "git://github.com/EionRobb/funyahoo-plusplus;branch=master;protocol=git"
+SRCREV = "fbbd9c591100aa00a0487738ec7b6acd3d924b3f"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+    oe_runmake CC="${CC}" CXX="${CXX}" EXTRA_INCLUDES="${TARGET_CFLAGS}" AR="${AR}";
+}
+
+do_install() {
+    oe_runmake DESTDIR="${D}" install;
+}
+
+FILES_${PN} += " \
+    ${libdir} \
+"
diff --git a/meta-oe/recipes-support/pidgin/icyque_git.bb b/meta-oe/recipes-support/pidgin/icyque_git.bb
new file mode 100644
index 0000000000..0f32dc3a39
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/icyque_git.bb
@@ -0,0 +1,27 @@
+SUMMARY = "WIM Protocol plugin for ICQ for Adium, Pidgin, Miranda and Telepathy IM Framework"
+SECTION = "webos/services"
+LICENSE = "GPLv3.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"
+
+DEPENDS = "pidgin json-glib"
+
+PV = "0.1+gitr${SRCPV}"
+
+inherit pkgconfig
+
+SRC_URI = "git://github.com/EionRobb/icyque"
+SRCREV = "513fc162d5d1a201c2b044e2b42941436d1069d5"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+    oe_runmake;
+}
+
+do_install() {
+    oe_runmake DESTDIR="${D}" install;
+}
+
+FILES_${PN} += " \
+    ${libdir} \
+"
diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb
new file mode 100644
index 0000000000..beae281a30
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Protocol plugin for Office 365/Lync/OCS for Adium, Pidgin, Miranda and Telepathy IM Framework"
+SECTION = "webos/services"
+LICENSE = "GPLv2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "pidgin intltool-native glib-2.0-native"
+
+inherit pkgconfig
+inherit autotools
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/sipe/pidgin-sipe-${PV}.tar.xz \
+"
+
+SRC_URI[md5sum] = "b91106d28c235b347a63dcb676f7b66a"
+SRC_URI[sha256sum] = "958803722b23d869131f76bd90df9da19116d4ca5a873e5253371479b7390f43"
+
+PACKAGECONFIG ??= "nss krb5"
+PACKAGECONFIG[nss] = "--enable-nss=yes,--enable-nss=no,nss"
+PACKAGECONFIG[openssl] = "--enable-openssl=yes,--enable-openssl=no,openssl"
+PACKAGECONFIG[krb5] = "--with-krb5=yes,--with-krb5=no,krb5"
+#PACKAGECONFIG[voice_and_video] = "--with-vv=yes,--with-vv=no,libnice gstreamer"
+PACKAGECONFIG[telepathy] = "--enable-telepathy=yes,--enable-telepathy=no,telepathy-glib gmime"
+#PACKAGECONFIG[gssapi_only] = "--enable-gssapi-only=yes,--enable-gssapi-only=no,krb5"
+PACKAGECONFIG[debug] = "--enable-debug=yes,--enable-debug=no,valgrind"
+
+FILES_${PN}-dev += " \
+    ${libdir}/purple-2/*.la \
+"
+
+FILES_${PN} += " \
+    ${libdir}/purple-2/libsipe.so \
+    ${datadir}/appdata \
+    ${datadir}/metainfo \
+"
diff --git a/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb b/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
new file mode 100644
index 0000000000..092e6059b8
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Skype protocol plug-in for libpurple"
+SECTION = "webos/services"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://skypeweb/gpl3.txt;md5=d90260d32cef39f3c8d6c0f05d3adb8e"
+
+DEPENDS = "pidgin json-glib glib-2.0 zlib"
+
+inherit pkgconfig
+
+SRC_URI = "git://github.com/EionRobb/skype4pidgin;branch=master;protocol=git"
+SRCREV = "14f1b69b6292bbdc98cca484b050ec8359394c4e"
+
+S = "${WORKDIR}/git"
+PV = "1.5+git${SRCPV}"
+
+do_compile() {
+    oe_runmake -C skypeweb;
+}
+
+do_install() {
+    oe_runmake -C skypeweb DESTDIR="${D}" install;
+}
+
+FILES_${PN} += " \
+    ${libdir} \
+"
-- 
2.17.1


