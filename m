Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 849507E43F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 11:55:02 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f10so5961045wre.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 04:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1Y90AhDHlthHIYILSFb3/8ef/m68wafcM2+NhNslVu4=;
	b=eugEGcI1PJbu2nEoBjAejHk7pOsWe87TD/eYChesb+7kcgzjLwbOx8biBgSOXIn/AF
	A5PR9Eny3Hn1/O8m05q9Z76YErlwPYloqaa+v88PkKNbKcLo6g6vzMYz5hSgUOJQI8wi
	vngjPGhP3LnLAQTayyYd/5iHnQwQkflndeeQmliSmCsqDqxlUW8egM53GZ49snaz+2x2
	1SjCC16MAkWK5W4roiDtLVJgawtJGX/CM+inrxnOYWYlwwhGn48vWjwQLTAjB3Z2UhJs
	xOuFH0800jHDd9m2Q3ikGEJyBiRAyAvGsd4r+/ekTcjMkxzDhHi3Bfdcm0dCGeGNzpf3
	hcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1Y90AhDHlthHIYILSFb3/8ef/m68wafcM2+NhNslVu4=;
	b=B03TGm42+R/76lsHesNaYvUk3jiOih/CHxqjNy36h7lVs0m1KlWsnwsIIU6I+F9tUZ
	JCMrp7s4YT6jsDos/ZkO4lU49MjwFHwwMQ0+dEgH+R3k1/NJFrUtTy6GoXTVDk/Slz8y
	4g576Q6DcFMbCYCUguRc16vUP2dVJEJpzNwLkvBo1AYT9ve0X6r9tHzDGfNUKntpcZ4D
	E0475pf+63MIF34UrLSlnsISQQubbmZgrArdlyURfoisK30xzd6Cqk7GgtqAMSSUzniM
	OFqffevSFFu5PLeiarnX7sh/TqKgvzgjh7jejgy0jQ7B8AOLmRR23ADh16z3zauy1smR
	j0PA==
X-Gm-Message-State: APjAAAWjC6+/FQ8E+alwUESfq5h8hD/DbyfQfSycqzThqUAMUWZ13lDj
	ZC9AZ5wvBYr+w4kUle8B08utRAbZ
X-Google-Smtp-Source: APXvYqzoNwZPqVxiPZ5QcGqrDWjIldc4icgDmpFSVNFIdSarEoXq/U2PzTbpIKO4R7GPMCZnfm1QQw==
X-Received: by 2002:adf:e4d2:: with SMTP id v18mr19018443wrm.189.1558612503177;
	Thu, 23 May 2019 04:55:03 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	x64sm16525829wmg.17.2019.05.23.04.55.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 May 2019 04:55:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 11:55:03 +0000
Message-Id: <20190523115505.18245-6-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190523115505.18245-1-Martin.Jansa@gmail.com>
References: <20190523115505.18245-1-Martin.Jansa@gmail.com>
Cc: Herman van Hazendonk <github.com@herrie.org>
Subject: [meta-oe][PATCH 6/8] Geoclue: Update to 2.5.3
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
X-List-Received-Date: Thu, 23 May 2019 11:55:02 -0000

From: Herman van Hazendonk <github.com@herrie.org>

* Switch to Meson build system.
* Fix a crash.
* Support for GGA messages from more NMEA sources.
* New API to allow automatic server side deletion of client.
* Automatically delete client on server when using GClueSimple.
* Avoid linking to system-installed library.
* Fix library-only build.
* Add manpage for geoclue.conf file.
* Document usage and building of the project.
* Other fixes and improvements.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../geoclue/geoclue_2.4.4.bb                  | 53 ------------------
 .../geoclue/geoclue_2.5.3.bb                  | 54 +++++++++++++++++++
 2 files changed, 54 insertions(+), 53 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb
 create mode 100644 meta-oe/recipes-navigation/geoclue/geoclue_2.5.3.bb

diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb
deleted file mode 100644
index b31d8eb4ef..0000000000
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-SUMMARY = "The Geolocation Service"
-DESCRIPTION = "Geoclue is a D-Bus service that provides location information. \
-The primary goal of the Geoclue project is to make creating location-aware applications \
-as simple as possible, while the secondary goal is to ensure that no application \
-can access location information without explicit permission from user."
-LICENSE = "GPLv2.0+"
-SECTION = "console/network"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=8114b83a0435d8136b47bd70111ce5cd"
-
-DEPENDS = "glib-2.0 dbus json-glib libsoup-2.4 intltool-native"
-
-inherit autotools pkgconfig gtk-doc gobject-introspection
-
-SRC_URI = " \
-    http://www.freedesktop.org/software/geoclue/releases/2.4/geoclue-${PV}.tar.xz \
-"
-
-SRC_URI[md5sum] = "d2a5b05f4bad032673fe23afbce27926"
-SRC_URI[sha256sum] = "9c43fb9d0c12067ea64400500abb0640194947d4c2c55e38545afe5d9c5c315c"
-
-export BUILD_SYS
-export HOST_SYS
-export STAGING_INCDIR
-export STAGING_LIBDIR
-
-# Without this line, package is delcared a library and named libgeoclue*
-AUTO_LIBNAME_PKGS = ""
-
-PACKAGECONFIG ??= "3g modem-gps cdma nmea lib"
-PACKAGECONFIG[3g] = "--enable-3g-source,--disable-3g-source,modemmanager"
-PACKAGECONFIG[modem-gps] = "--enable-modem-gps-source,--disable-modem-gps-source,modemmanager"
-PACKAGECONFIG[cdma] = "--enable-cdma-source,--disable-cdma-source,modemmanager"
-PACKAGECONFIG[nmea] = "--enable-nmea-source,--disable-nmea-source,avahi"
-PACKAGECONFIG[lib] = "--enable-libgeoclue,--disable-libgeoclue,gobject-introspection"
-
-EXTRA_OECONF += " \
-    --with-dbus-service-user=root \
-    --with-dbus-sys-dir=${sysconfdir}/dbus-1/system.d \
-    --enable-demo-agent=no \
-"
-
-FILES_${PN} += " \
-    ${datadir}/dbus-1/system-services \
-    ${libdir} \
-    ${systemd_unitdir} \
-    ${prefix}/libexec \
-"
-
-FILES_${PN}-dev += " \
-    ${datadir}/dbus-1/interfaces \
-    ${datadir}/gir-1.0 \
-"
diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.5.3.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.5.3.bb
new file mode 100644
index 0000000000..b46445a2ba
--- /dev/null
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.5.3.bb
@@ -0,0 +1,54 @@
+SUMMARY = "The Geolocation Service"
+DESCRIPTION = "Geoclue is a D-Bus service that provides location information. \
+The primary goal of the Geoclue project is to make creating location-aware applications \
+as simple as possible, while the secondary goal is to ensure that no application \
+can access location information without explicit permission from user."
+LICENSE = "GPLv2.0+"
+SECTION = "console/network"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=bdfdd4986a0853eb84eeba85f9d0c4d6"
+
+DEPENDS = "glib-2.0 dbus json-glib libsoup-2.4 intltool-native"
+
+inherit meson pkgconfig gtk-doc gobject-introspection vala
+
+SRC_URI = " \
+    https://gitlab.freedesktop.org/geoclue/geoclue/-/archive/${PV}/geoclue-${PV}.tar \
+"
+
+SRC_URI[md5sum] = "6228301ed62b587ebaa0438b97ce66e4"
+SRC_URI[sha256sum] = "3caa5e10190a34c17a9b3a9d1d8a19797ed197f07f36f6e35ce533a379efe155"
+
+export BUILD_SYS
+export HOST_SYS
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+# Without this line, package is declared a library and named libgeoclue*
+AUTO_LIBNAME_PKGS = ""
+
+PACKAGECONFIG ??= "3g modem-gps cdma nmea lib"
+PACKAGECONFIG[3g] = "-D3g-source=true,-D3g-source=false,modemmanager"
+PACKAGECONFIG[modem-gps] = "-Dmodem-gps-source=true,-Dmodem-gps-source=false,modemmanager"
+PACKAGECONFIG[cdma] = "-Dcdma-source=true,-Dcdma-source=false,modemmanager"
+PACKAGECONFIG[nmea] = "-Dnmea-source=true,-Dnmea-source=false,avahi"
+PACKAGECONFIG[lib] = "-Dlibgeoclue=true,-Dlibgeoclue=false,gobject-introspection"
+
+GTKDOC_MESON_OPTION = "gtk-doc"
+
+EXTRA_OEMESON += " \
+    -Ddbus-sys-dir=${sysconfdir}/dbus-1/system.d \
+    -Ddemo-agent=false \
+"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1/system-services \
+    ${libdir} \
+    ${systemd_unitdir} \
+    ${prefix}/libexec \
+"
+
+FILES_${PN}-dev += " \
+    ${datadir}/dbus-1/interfaces \
+    ${datadir}/gir-1.0 \
+"
-- 
2.17.1


