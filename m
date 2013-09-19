Return-Path: <eu@felipetonello.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id D345B6A564
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 19:09:27 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id k4so3878998qaq.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 12:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NWUnxBUcurzuVQlKfNw6klcJEuMI6v9D1O/XUgk2U2g=;
	b=OcCIJYKbRRt2PDhuLMUbRzJpCli2z32sL0IcahKGOb5emEv4yLNJcRTUC4pdEgjdDQ
	sK5lmOuOTELIGmbc9P1scaMzRvJkl2zW0PVzXkEvu/gE68+z5lSzV4/er5EL9xPzd9HI
	aRH1njx97bv2lQ5BEEk+6/nZfbHApd98wEigXoechInw59ecZsR9uYrR1a8BzMNmK0dp
	bIz4bzA/wx1LntA6DzQ/bRz5eTn9A7WaI4K4HynT4NRVYwGqcR0xA1sM6PQ7JRf1kBDg
	mfsXXQMtTiDWC+HCyE1/9qp5cutM1HbGmco5ZoYfPlcLgv+I7Vst1EWSNWA8bE0PA/So
	ekLg==
X-Gm-Message-State: ALoCoQlIMGrR0pnayo4Zi92pepfuT4CpTekk5KPCS5uTnuB770VEduRmBtc+cb6Jh+8MlMHOQ3ln
X-Received: by 10.224.36.201 with SMTP id u9mr339774qad.76.1379617769547;
	Thu, 19 Sep 2013 12:09:29 -0700 (PDT)
Received: from localhost.localdomain.com (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id k3sm13345014qaz.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 12:09:28 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Sep 2013 12:09:13 -0700
Message-Id: <1379617754-6342-2-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1379617754-6342-1-git-send-email-eu@felipetonello.com>
References: <1379617754-6342-1-git-send-email-eu@felipetonello.com>
Subject: [PATCH 1/2] gypsy: Improvements in recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Sep 2013 19:09:28 -0000

From: "Felipe F. Tonello" <eu@felipetonello.com>

Some improvements were made:
* Fix recipes to use .inc file
* Fix git recipe that was not passing do_configure step
* Separeted gypsy daemon from libgypsy in different packages

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta-oe/recipes-navigation/gypsy/gypsy.inc    | 16 +++++++++++++---
 meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb | 21 +++++----------------
 meta-oe/recipes-navigation/gypsy/gypsy_git.bb | 12 ++++++++----
 3 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/meta-oe/recipes-navigation/gypsy/gypsy.inc b/meta-oe/recipes-navigation/gypsy/gypsy.inc
index ba54356..747b61d 100644
--- a/meta-oe/recipes-navigation/gypsy/gypsy.inc
+++ b/meta-oe/recipes-navigation/gypsy/gypsy.inc
@@ -5,11 +5,21 @@ concurrently.  Gypsy also hides the details of parsing NMEA from the \
 client applications, passing the data as simple values for the clients \
 to use."
 LICENSE = "GPLv2.0 & LGPLv2.1"
-SECTION = "x11"
-DEPENDS = "glib-2.0 dbus bluez4 dbus-glib libxslt-native"
+SECTION = "console/network"
+DEPENDS = "glib-2.0 dbus bluez4 dbus-glib libxslt-native libxslt"
 
 inherit autotools pkgconfig gtk-doc
+PACKAGES += "libgypsy"
 
 EXTRA_OECONF += "--with-distro=debian"
 
-FILES_${PN} += "/usr/share/dbus-1/services/"
+FILES_${PN} = " \
+  ${sysconfdir}/gypsy.conf \
+  ${sysconfdir}/dbus-1 \
+  ${libexecdir}/gypsy-daemon \
+  ${datadir}/dbus-1 \
+"
+
+FILES_libgypsy = " \
+  ${libdir}/libgypsy${SOLIBS} \
+"
diff --git a/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb b/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb
index 564d3d9..24c8987 100644
--- a/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb
+++ b/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb
@@ -1,26 +1,15 @@
-SUMMARY = "GPS Multiplexing Daemon"
-DESCRIPTION = "Gypsy is a GPS multiplexing daemon which allows \
-multiple clients to access GPS data from multiple GPS sources \
-concurrently.  Gypsy also hides the details of parsing NMEA from the \
-client applications, passing the data as simple values for the clients \
-to use."
-LICENSE = "GPLv2+ & LGPLv2+"
+require gypsy.inc
+
+PR = "r2"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYING.lib;md5=7fbc338309ac38fefcd64b04bb903e34 \
                     file://src/main.c;beginline=1;endline=25;md5=3fe64e27e61b289b77383a54a982cbdd \
                     file://gypsy/gypsy-time.h;beginline=1;endline=24;md5=06432ea19a7b6607428d04d9dadc37fd"
 
-SECTION = "x11"
-DEPENDS = "glib-2.0 dbus bluez4 dbus-glib libxslt"
-
-SRC_URI = "http://gypsy.freedesktop.org/releases/gypsy-${PV}.tar.gz \
+SRC_URI += "http://gypsy.freedesktop.org/releases/gypsy-${PV}.tar.gz \
            file://0001-g_type_init-is-deprecated-for-glib-2.35.0.patch \
           "
-PR = "r1"
-
-inherit autotools pkgconfig
-
-FILES_${PN} += "/usr/share/dbus-1/system-services/"
 
 SRC_URI[md5sum] = "e2d186df9c2cc3b70a027043e22acf1a"
 SRC_URI[sha256sum] = "14e1cbe17351f408538e033ca370b4bf51ccf9c88744e236ddfb271904f154d6"
diff --git a/meta-oe/recipes-navigation/gypsy/gypsy_git.bb b/meta-oe/recipes-navigation/gypsy/gypsy_git.bb
index 5431c68..6ab16e6 100644
--- a/meta-oe/recipes-navigation/gypsy/gypsy_git.bb
+++ b/meta-oe/recipes-navigation/gypsy/gypsy_git.bb
@@ -4,15 +4,19 @@ DEFAULT_PREFERENCE = "-1"
 
 SRCREV = "be8c9c382d2d1d37b51d29b0843045121ec90213"
 PV = "0.9+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 S = "${WORKDIR}/git"
 
-LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYING.lib;md5=7fbc338309ac38fefcd64b04bb903e34 \
                     file://src/main.c;beginline=1;endline=25;md5=3fe64e27e61b289b77383a54a982cbdd \
                     file://gypsy/gypsy-time.h;beginline=1;endline=24;md5=06432ea19a7b6607428d04d9dadc37fd"
 
-SRC_URI = "git://anongit.freedesktop.org/gypsy \
-           file://fixups.patch"
+SRC_URI += "git://anongit.freedesktop.org/gypsy \
+            file://fixups.patch"
+
+do_configure_prepend() {
+  # from patch 563716fc596d53f1085949a9dd11a62f39b2d624
+  test -d ${S}/m4 || mkdir -p ${S}/m4
+}
-- 
1.8.3.1


