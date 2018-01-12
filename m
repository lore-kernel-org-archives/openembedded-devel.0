Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0E4B278876
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jan 2018 13:17:00 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id t8so12005690wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jan 2018 05:17:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bhM2NUPv3B4OKcxGM2LRPwfQC+XKagCuepiqWxGv8/g=;
	b=eNZlGkfceTnIVm7HndFwUEzNRCy0w5fvLuOwEgZ1h8vvJPCeSzAKdClgbEX4SdUNdX
	t8vTAT1kuKAgesM3WLwBSkfBeG3wSajQWwKn51vJPY1Av6RkIXFxO/TzuDZMtT0uc/Yp
	rYgFLrORI6Zw+GP2romCReQlJl9zBm6fSceN6DBmplClMWhHd8wsaGJNcdrDLOKAdVho
	YI/5ASwzsI7vZbyYXMoOi0g4rseyejHt5dXaFERZklk4ZNn2YPwcDi8HQRuUjWotqbYF
	5aw1xVwEjR3F8QNS5bZ0oBFRaSPBE1vN//j4ps97N/88SLhNBjJ7ncl8GLKMxvrJG9c9
	KRpA==
X-Gm-Message-State: AKGB3mLmcQMGN/MEhT+Hf/IZvYUYLNk0ySaSDDRFEQGcCJyBhCoShQv/
	N35CWrL/03I4F3GPpa+Zikx1ZE3D
X-Google-Smtp-Source: ACJfBov5YhUSNxUE+ZRtPhoPRdjDEpOAcp1aKAwTq28LslcqB/7N5AowzZPXzJna/83MSVw3mA22Cg==
X-Received: by 10.80.138.198 with SMTP id k6mr36584965edk.181.1515763021395;
	Fri, 12 Jan 2018 05:17:01 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i2sm13209959edb.31.2018.01.12.05.17.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Jan 2018 05:17:00 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Jan 2018 13:16:58 +0000
Message-Id: <20180112131658.2291-2-git@andred.net>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180112131658.2291-1-git@andred.net>
References: <20180112131658.2291-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] mosquitto: simplify build patch
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
X-List-Received-Date: Fri, 12 Jan 2018 13:17:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

By simply allowing to set certain make variables from
the environment, and by specifying the strip program
to use (/bin/true), we can greatly simplify the build
patch.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 ...llow-prefix-mandir-localedir-from-environ.patch | 35 ++++++++
 .../mosquitto/files/build.patch                    | 94 ----------------------
 .../mosquitto/mosquitto_1.4.14.bb                  |  3 +-
 3 files changed, 37 insertions(+), 95 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/mosquitto/files/0001-config.mk-allow-prefix-mandir-localedir-from-environ.patch
 delete mode 100644 meta-oe/recipes-connectivity/mosquitto/files/build.patch

diff --git a/meta-oe/recipes-connectivity/mosquitto/files/0001-config.mk-allow-prefix-mandir-localedir-from-environ.patch b/meta-oe/recipes-connectivity/mosquitto/files/0001-config.mk-allow-prefix-mandir-localedir-from-environ.patch
new file mode 100644
index 000000000..a5aa277a0
--- /dev/null
+++ b/meta-oe/recipes-connectivity/mosquitto/files/0001-config.mk-allow-prefix-mandir-localedir-from-environ.patch
@@ -0,0 +1,35 @@
+From 0be38301249d797ec1f59071cc868ceda6d4720a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
+Date: Tue, 12 Apr 2016 12:50:32 +0100
+Subject: [PATCH 1/2] config.mk: allow prefix / mandir / localedir from
+ environment
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+We want to control them using OE environment variables.
+
+Upstream-Status: Inappropriate [embedded-specific]
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+---
+ config.mk | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/config.mk b/config.mk
+index 71f17e5..81d9702 100644
+--- a/config.mk
++++ b/config.mk
+@@ -249,7 +249,7 @@ ifeq ($(WITH_DOCS),yes)
+ endif
+ 
+ INSTALL?=install
+-prefix=/usr/local
+-mandir=${prefix}/share/man
+-localedir=${prefix}/share/locale
++prefix?=/usr/local
++mandir?=${prefix}/share/man
++localedir?=${prefix}/share/locale
+ STRIP?=strip
+-- 
+2.15.1
+
diff --git a/meta-oe/recipes-connectivity/mosquitto/files/build.patch b/meta-oe/recipes-connectivity/mosquitto/files/build.patch
deleted file mode 100644
index 0d0912b7a..000000000
--- a/meta-oe/recipes-connectivity/mosquitto/files/build.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From ebd7c8e548e9b8e096ee4c390173db9a701f2604 Mon Sep 17 00:00:00 2001
-From: Bruno Bottazzini <bruno.bottazzini@intel.com>
-Date: Wed, 23 Mar 2016 11:18:26 -0300
-Subject: [PATCH] build
-
-Disable stripping and allow easily overriding prefix
-
-Upstream-Status: Pending
-
-Signed-off-by: Bruno Bottazzini <bruno.bottazzini@intel.com>
----
- client/Makefile  | 4 ++--
- config.mk        | 2 +-
- lib/Makefile     | 2 +-
- lib/cpp/Makefile | 2 +-
- src/Makefile     | 4 ++--
- 5 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/client/Makefile b/client/Makefile
-index bd65355..4e5a640 100644
---- a/client/Makefile
-+++ b/client/Makefile
-@@ -24,8 +24,8 @@ client_shared.o : client_shared.c client
- 
- install : all
- 	$(INSTALL) -d ${DESTDIR}$(prefix)/bin
--	$(INSTALL) -s --strip-program=${CROSS_COMPILE}${STRIP} mosquitto_pub ${DESTDIR}${prefix}/bin/mosquitto_pub
--	$(INSTALL) -s --strip-program=${CROSS_COMPILE}${STRIP} mosquitto_sub ${DESTDIR}${prefix}/bin/mosquitto_sub
-+	$(INSTALL) mosquitto_pub ${DESTDIR}${prefix}/bin/mosquitto_pub
-+	$(INSTALL) mosquitto_sub ${DESTDIR}${prefix}/bin/mosquitto_sub
- 
- uninstall :
- 	-rm -f ${DESTDIR}${prefix}/bin/mosquitto_pub
-diff --git a/config.mk b/config.mk
-index c0f175f..3427b83 100644
---- a/config.mk
-+++ b/config.mk
-@@ -241,7 +241,7 @@ ifeq ($(WITH_DOCS),yes)
- endif
- 
- INSTALL?=install
--prefix=/usr/local
-+prefix?=/usr
- mandir=${prefix}/share/man
- localedir=${prefix}/share/locale
- STRIP?=strip
-diff --git a/lib/Makefile b/lib/Makefile
-index 825fcea..9b7c05c 100644
---- a/lib/Makefile
-+++ b/lib/Makefile
-@@ -25,7 +25,7 @@ all : libmosquitto.so.${SOVERSION} libmo
- 
- install : all
- 	$(INSTALL) -d ${DESTDIR}$(prefix)/lib${LIB_SUFFIX}/
--	$(INSTALL) -s --strip-program=${CROSS_COMPILE}${STRIP} libmosquitto.so.${SOVERSION} ${DESTDIR}${prefix}/lib${LIB_SUFFIX}/libmosquitto.so.${SOVERSION}
-+	$(INSTALL) libmosquitto.so.${SOVERSION} ${DESTDIR}${prefix}/lib${LIB_SUFFIX}/libmosquitto.so.${SOVERSION}
- 	ln -sf libmosquitto.so.${SOVERSION} ${DESTDIR}${prefix}/lib${LIB_SUFFIX}/libmosquitto.so
- 	$(INSTALL) -d ${DESTDIR}${prefix}/include/
- 	$(INSTALL) mosquitto.h ${DESTDIR}${prefix}/include/mosquitto.h
-diff --git a/lib/cpp/Makefile b/lib/cpp/Makefile
-index 8b627d3..cdb2923 100644
---- a/lib/cpp/Makefile
-+++ b/lib/cpp/Makefile
-@@ -10,7 +10,7 @@ all : libmosquittopp.so.${SOVERSION}
- 
- install : all
- 	$(INSTALL) -d ${DESTDIR}$(prefix)/lib${LIB_SUFFIX}/
--	$(INSTALL) -s --strip-program=${CROSS_COMPILE}${STRIP} libmosquittopp.so.${SOVERSION} ${DESTDIR}${prefix}/lib${LIB_SUFFIX}/libmosquittopp.so.${SOVERSION}
-+	$(INSTALL) libmosquittopp.so.${SOVERSION} ${DESTDIR}${prefix}/lib${LIB_SUFFIX}/libmosquittopp.so.${SOVERSION}
- 	ln -sf libmosquittopp.so.${SOVERSION} ${DESTDIR}${prefix}/lib${LIB_SUFFIX}/libmosquittopp.so
- 	$(INSTALL) -d ${DESTDIR}${prefix}/include/
- 	$(INSTALL) mosquittopp.h ${DESTDIR}${prefix}/include/mosquittopp.h
-diff --git a/src/Makefile b/src/Makefile
-index 2cfb7d4..9a97644 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -103,12 +103,12 @@ mosquitto_passwd.o : mosquitto_passwd.c
- 
- install : all
- 	$(INSTALL) -d ${DESTDIR}$(prefix)/sbin
--	$(INSTALL) -s --strip-program=${CROSS_COMPILE}${STRIP} mosquitto ${DESTDIR}${prefix}/sbin/mosquitto
-+	$(INSTALL) mosquitto ${DESTDIR}${prefix}/sbin/mosquitto
-	$(INSTALL) -d ${DESTDIR}$(prefix)/include
- 	$(INSTALL) mosquitto_plugin.h ${DESTDIR}${prefix}/include/mosquitto_plugin.h
- ifeq ($(WITH_TLS),yes)
-	$(INSTALL) -d ${DESTDIR}$(prefix)/bin
--	$(INSTALL) -s --strip-program=${CROSS_COMPILE}${STRIP} mosquitto_passwd ${DESTDIR}${prefix}/bin/mosquitto_passwd
-+	$(INSTALL) mosquitto_passwd ${DESTDIR}${prefix}/bin/mosquitto_passwd
- endif
- 
- uninstall :
--- 
-2.7.1
-
diff --git a/meta-oe/recipes-connectivity/mosquitto/mosquitto_1.4.14.bb b/meta-oe/recipes-connectivity/mosquitto/mosquitto_1.4.14.bb
index 07440a241..13ce3811d 100644
--- a/meta-oe/recipes-connectivity/mosquitto/mosquitto_1.4.14.bb
+++ b/meta-oe/recipes-connectivity/mosquitto/mosquitto_1.4.14.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=62ddc846179e908dc0c8efec4a42ef20 \
 DEPENDS = "uthash"
 
 SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
-           file://build.patch \
+           file://0001-config.mk-allow-prefix-mandir-localedir-from-environ.patch \
            file://0002-uthash-remove-in-tree-version.patch \
            file://mosquitto.service \
            file://mosquitto.init \
@@ -28,6 +28,7 @@ PACKAGECONFIG[dns-srv] = ",,c-ares"
 PACKAGECONFIG[ssl] = ",,openssl"
 PACKAGECONFIG[uuid] = ",,util-linux"
 EXTRA_OEMAKE = "${@bb.utils.contains('PACKAGECONFIG', 'dns-srv', 'WITH_SRV=yes', 'WITH_SRV=no', d)} \
+                STRIP=/bin/true \
                 WITH_DOCS=no \
                 ${@bb.utils.contains('PACKAGECONFIG', 'ssl', 'WITH_TLS=yes WITH_TLS_PSK=yes', 'WITH_TLS=no WITH_TLS_PSK=no', d)} \
                 ${@bb.utils.contains('PACKAGECONFIG', 'uuid', 'WITH_UUID=yes', 'WITH_UUID=no', d)}"
-- 
2.15.1


