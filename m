Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4352174897
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 22:24:33 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id j17-v6so1606978pfn.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 15:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M8s7IJ8vtqxHna9T517Q2Bvlb1YZNMsb/pdkuJTW8f4=;
	b=ehEqQjENpxZ+SW85G0jmIJ/M7zGw2fcsU0JLpqa/fb+/aYwJL5eAD7sikgWZfC9fqB
	sWpiMssQ1pqJqXo8hpIrZu+nPTUh7tGHIVPqpJ1Bk0b06cj+lPKlUTTKwkoM+wshUyNU
	OZqFcQnA7NxonlMpqnxDVkavOUZZP+hKxBTmWoFLOzd12Z9V4JmCgCCSEv4eTIaed8YT
	Njeko+fPRhfe0OXMIYFhfMOjim/gV7dEQKicL/594/32evPF0rWqZVmbLyaHD4PUv2N3
	5J7C1MGBJktLDrZefxn0z7zPCNCFMRVebs8NB5QgjZ2cy8G2Q+go7hDWw3yDxQmLTC6X
	+wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M8s7IJ8vtqxHna9T517Q2Bvlb1YZNMsb/pdkuJTW8f4=;
	b=Khvtk7zlIGdW+wPDuqVIGwv5HDTRxylXHN5byxrdXU15GRZcfhm81SPuiQqdme+YG8
	wklhSttZDlpFjMrMcjvPUPo6tLJst1pyWrf8UzoEdi8iwMGakGAjH867mlunz0/MaZVw
	9vYwR3cCyacwCNYUJqepNdooChU9kyfx5HOmy3Z8IZNdl2oYUN0SYOWFEBpmRziX2oX6
	hqif8kR+vH3FMex+LxOwF5WownoOMu5YcFJh5Izb9/fg8V2puHqwJzgbHYyq23C4x9Ph
	A6xV1VNxdZLrHLmX74Pib0+LHMEfihtNjVFFOXHaYsSQjquwYdYpUHDG+Lx+Ug9bbVV1
	e1qQ==
X-Gm-Message-State: APt69E2SvOBCDSsTUImfeJIExakVxmFVjueUCcI0/ZmsD60qlNpbYiUA
	cSKkB//eSIJ0FoWnIYdMqkozaQ==
X-Google-Smtp-Source: AAOMgpduSQuZ2E0F/Qw6RqMP8eLOFRmmjzBo+6w6gH6rhb73NXqttla5RzCKbztqJramAcelI77Jbw==
X-Received: by 2002:a62:8dd1:: with SMTP id
	p78-v6mr7607321pfk.141.1530138274041; 
	Wed, 27 Jun 2018 15:24:34 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	i11-v6sm7112823pgq.23.2018.06.27.15.24.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jun 2018 15:24:33 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Jun 2018 15:24:21 -0700
Message-Id: <1530138261-3656-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] mosquitto: minor recipe cleanups
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
X-List-Received-Date: Wed, 27 Jun 2018 22:24:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

 - Passing prefix, mandir and localedir via the Make command line
   allows patching of config.mk to be dropped.

 - The variable PREFIX isn't used anywhere in the mosquitto 1.4.15
   Makefiles, so doesn't need to be passed on the Make command line.
   That means the default do_compile() from base.bbclass can be used
   and the recipe specific do_compile() can be dropped.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...llow-prefix-mandir-localedir-from-environ.patch | 35 ----------------------
 .../mosquitto/mosquitto_1.4.15.bb                  | 24 ++++++++-------
 2 files changed, 13 insertions(+), 46 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/mosquitto/files/0001-config.mk-allow-prefix-mandir-localedir-from-environ.patch

diff --git a/meta-networking/recipes-connectivity/mosquitto/files/0001-config.mk-allow-prefix-mandir-localedir-from-environ.patch b/meta-networking/recipes-connectivity/mosquitto/files/0001-config.mk-allow-prefix-mandir-localedir-from-environ.patch
deleted file mode 100644
index a5aa277..0000000
--- a/meta-networking/recipes-connectivity/mosquitto/files/0001-config.mk-allow-prefix-mandir-localedir-from-environ.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 0be38301249d797ec1f59071cc868ceda6d4720a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
-Date: Tue, 12 Apr 2016 12:50:32 +0100
-Subject: [PATCH 1/2] config.mk: allow prefix / mandir / localedir from
- environment
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-We want to control them using OE environment variables.
-
-Upstream-Status: Inappropriate [embedded-specific]
-Signed-off-by: André Draszik <andre.draszik@jci.com>
----
- config.mk | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/config.mk b/config.mk
-index 71f17e5..81d9702 100644
---- a/config.mk
-+++ b/config.mk
-@@ -249,7 +249,7 @@ ifeq ($(WITH_DOCS),yes)
- endif
- 
- INSTALL?=install
--prefix=/usr/local
--mandir=${prefix}/share/man
--localedir=${prefix}/share/locale
-+prefix?=/usr/local
-+mandir?=${prefix}/share/man
-+localedir?=${prefix}/share/locale
- STRIP?=strip
--- 
-2.15.1
-
diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
index 8dd2124..f451687 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=62ddc846179e908dc0c8efec4a42ef20 \
 DEPENDS = "uthash"
 
 SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
-           file://0001-config.mk-allow-prefix-mandir-localedir-from-environ.patch \
            file://0002-uthash-remove-in-tree-version.patch \
            file://mosquitto.service \
            file://mosquitto.init \
@@ -27,20 +26,23 @@ PACKAGECONFIG ??= "ssl uuid"
 PACKAGECONFIG[dns-srv] = ",,c-ares"
 PACKAGECONFIG[ssl] = ",,openssl"
 PACKAGECONFIG[uuid] = ",,util-linux"
-EXTRA_OEMAKE = "${@bb.utils.contains('PACKAGECONFIG', 'dns-srv', 'WITH_SRV=yes', 'WITH_SRV=no', d)} \
-                STRIP=/bin/true \
-                WITH_DOCS=no \
-                ${@bb.utils.contains('PACKAGECONFIG', 'ssl', 'WITH_TLS=yes WITH_TLS_PSK=yes', 'WITH_TLS=no WITH_TLS_PSK=no', d)} \
-                ${@bb.utils.contains('PACKAGECONFIG', 'uuid', 'WITH_UUID=yes', 'WITH_UUID=no', d)}"
 
-export LIB_SUFFIX="${@d.getVar('baselib', True).replace('lib', '')}"
+EXTRA_OEMAKE = " \
+    prefix=${prefix} \
+    mandir=${mandir} \
+    localedir=${localedir} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'dns-srv', 'WITH_SRV=yes', 'WITH_SRV=no', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'ssl', 'WITH_TLS=yes WITH_TLS_PSK=yes', 'WITH_TLS=no WITH_TLS_PSK=no', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'uuid', 'WITH_UUID=yes', 'WITH_UUID=no', d)} \
+    STRIP=/bin/true \
+    WITH_DOCS=no \
+"
 
-do_compile() {
-    oe_runmake PREFIX=${prefix}
-}
+export LIB_SUFFIX = "${@d.getVar('baselib', True).replace('lib', '')}"
 
 do_install() {
-    oe_runmake install DESTDIR=${D}
+    oe_runmake 'DESTDIR=${D}' install
+
     install -d ${D}${libdir}
     install -m 0644 lib/libmosquitto.a ${D}${libdir}/
 
-- 
1.9.1


