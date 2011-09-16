Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1R4hSN-0001by-DJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Sep 2011 01:04:27 +0200
Received: from mizar.localdomain (87.5.26.159) by smtp208.alice.it (8.5.124.08)
	id 4DE64DF10974B4BE; Sat, 17 Sep 2011 00:59:14 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 17 Sep 2011 00:59:11 +0200
Message-Id: <1316213951-31505-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe][PATCH] tzcode-native, tzdata: remove recipes from meta-oe
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
X-List-Received-Date: Fri, 16 Sep 2011 23:04:27 -0000

* Up-to-date versions are maintained in oe-core.
*
* What is bad is the newer recipes in the oe-core layer
* are masked and bitbake only sees the recipes in meta-oe
* thus -> NOTE: package tzdata-2011g-r10.0: task do_fetch: Failed
*
* For the (mis)feature see
* http://lists.linuxtogo.org/pipermail/bitbake-devel/2011-August/001169.html

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-oe/recipes-extended/tzcode/tzcode-native.inc  |   18 --
 .../recipes-extended/tzcode/tzcode-native_2011i.bb |   20 ---
 meta-oe/recipes-extended/tzdata/tzdata.inc         |  177 --------------------
 meta-oe/recipes-extended/tzdata/tzdata_2011g.bb    |   12 --
 4 files changed, 0 insertions(+), 227 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/tzcode/tzcode-native.inc
 delete mode 100644 meta-oe/recipes-extended/tzcode/tzcode-native_2011i.bb
 delete mode 100644 meta-oe/recipes-extended/tzdata/tzdata.inc
 delete mode 100644 meta-oe/recipes-extended/tzdata/tzdata_2011g.bb

diff --git a/meta-oe/recipes-extended/tzcode/tzcode-native.inc b/meta-oe/recipes-extended/tzcode/tzcode-native.inc
deleted file mode 100644
index b946e71..0000000
--- a/meta-oe/recipes-extended/tzcode/tzcode-native.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
-INC_PR = "r4"
-
-SRC_URI = " \
-        ftp://elsie.nci.nih.gov/pub/tzcode${PV}.tar.gz;name=tzcode-${PV};subdir=${BPN}-${PV} \
-        ftp://elsie.nci.nih.gov/pub/tzdata${TZDATA_PV}.tar.gz;name=tzdata-${TZDATA_PV};subdir=${BPN}-${PV} \
-	"
-
-inherit native
-
-do_install () {
-        install -d ${D}${bindir}
-        install -m 755 zic ${D}${bindir}/
-        install -m 755 zdump ${D}${bindir}/
-        install -m 755 tzselect ${D}${bindir}/
-}
-
-NATIVE_INSTALL_WORKS = "1"
diff --git a/meta-oe/recipes-extended/tzcode/tzcode-native_2011i.bb b/meta-oe/recipes-extended/tzcode/tzcode-native_2011i.bb
deleted file mode 100644
index 8ab4504..0000000
--- a/meta-oe/recipes-extended/tzcode/tzcode-native_2011i.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require tzcode-native.inc
-
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://README;md5=3ae8198f82258417ce29066d3b034035"
-
-# Note that elsie.nci.nih.gov removes old versions when new is coming out
-# So if this doesn't build for you because of missing source file, just
-# bump it to the latest available version, removing old one
-# Also, tzdata (and it is needed to build tzcode) version can differ from
-# tzcode version, thus this variable
-
-TZDATA_PV = "2011i"
-
-PR = "${INC_PR}.2"
-
-SRC_URI[tzcode-2011i.md5sum] = "cf7f4335b7c8682899fa2814e711c1b2"
-SRC_URI[tzcode-2011i.sha256sum] = "f0dd991de3f8d6c599c104e294377c9befa1ef40aa5a1d09e2e295a453f3c1ec"
-SRC_URI[tzdata-2011i.md5sum] = "c7a86ec34f30f8d6aa77ef94902a3047"
-SRC_URI[tzdata-2011i.sha256sum] = "f8dde7ca5e61f21ac34c8cdbef5568d00c829981211098f059d8104964c81ffa"
-
diff --git a/meta-oe/recipes-extended/tzdata/tzdata.inc b/meta-oe/recipes-extended/tzdata/tzdata.inc
deleted file mode 100644
index ceec924..0000000
--- a/meta-oe/recipes-extended/tzdata/tzdata.inc
+++ /dev/null
@@ -1,177 +0,0 @@
-DESCRIPTION = "Timezone data"
-SECTION = "base"
-DEPENDS = "tzcode-native"
-
-INC_PR = "r10"
-
-DEFAULT_TIMEZONE ?= "Europe/London"
-
-RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarctica \
-             timezone-arctic timezone-asia timezone-atlantic \
-             timezone-australia timezone-europe timezone-indian \
-             timezone-iso3166.tab timezone-pacific timezone-zone.tab"
-
-SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzdata${PV}.tar.gz;subdir=${BPN}-${PV}"
-
-TZONES= "africa antarctica asia australasia europe northamerica southamerica  \
-         factory solar87 solar88 solar89 etcetera backward systemv \
-        "
-#        pacificnew \
-
-CONFFILES_${PN} = "${sysconfdir}/timezone ${sysconfdir}/localtime"
-
-do_compile () {
-        mkdir -p build
-        for zone in ${TZONES}; do \
-            ${STAGING_BINDIR_NATIVE}/zic -d ${S}/build${datadir}/zoneinfo -L /dev/null \
-                -y ${S}/yearistype.sh ${S}/${zone} ; \
-            ${STAGING_BINDIR_NATIVE}/zic -d ${S}/build${datadir}/zoneinfo/posix -L /dev/null \
-                -y ${S}/yearistype.sh ${S}/${zone} ; \
-            ${STAGING_BINDIR_NATIVE}/zic -d ${S}/build${datadir}/zoneinfo/right -L ${S}/leapseconds \
-                -y ${S}/yearistype.sh ${S}/${zone} ; \
-        done
-}
-
-do_install () {
-        install -d ${D}${prefix} ${D}${datadir}/zoneinfo
-        cp -pPR ${S}/build${prefix}/* ${D}${prefix}
-        # Only eglibc is removing zoneinfo files from package
-        if [ "${LIBC}"x = "eglibc"x ] ; then
-          cp -pP "${S}/zone.tab" ${D}${datadir}/zoneinfo
-          cp -pP "${S}/iso3166.tab" ${D}${datadir}/zoneinfo
-        fi
-
-        # Install a sane default for timezones
-        install -d ${D}${sysconfdir}
-        echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
-        cp -pPR ${S}/build${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ${D}${sysconfdir}/localtime
-}
-
-inherit allarch
-# Packages primarily organized by directory with a major city
-# in most time zones in the base package
-
-PACKAGES = "${PN}-dbg tzdata tzdata-misc tzdata-posix tzdata-right tzdata-africa \
-    tzdata-americas tzdata-antarctica tzdata-arctic tzdata-asia \
-    tzdata-atlantic tzdata-australia tzdata-europe tzdata-pacific"
-
-ALLOW_EMPTY_${PN}-dbg = "1"
-
-FILES_tzdata-africa += "${datadir}/zoneinfo/Africa/*"
-RPROVIDES_tzdata-africa = "tzdata-africa"
-
-FILES_tzdata-americas += "${datadir}/zoneinfo/America/*  \
-                ${datadir}/zoneinfo/US/*                \
-                ${datadir}/zoneinfo/Brazil/*            \
-                ${datadir}/zoneinfo/Canada/*            \
-                ${datadir}/zoneinfo/Mexico/*            \
-                ${datadir}/zoneinfo/Chile/*"
-RPROVIDES_tzdata-americas = "tzdata-americas"
-
-FILES_tzdata-antarctica += "${datadir}/zoneinfo/Antarctica/*"
-RPROVIDES_tzdata-antarctica = "tzdata-antarctica"
-
-FILES_tzdata-arctic += "${datadir}/zoneinfo/Arctic/*"
-RPROVIDES_tzdata-arctic = "tzdata-arctic"
-
-FILES_tzdata-asia += "${datadir}/zoneinfo/Asia/*        \
-                ${datadir}/zoneinfo/Indian/*            \
-                ${datadir}/zoneinfo/Mideast/*"
-RPROVIDES_tzdata-asia = "tzdata-asia"
-
-FILES_tzdata-atlantic += "${datadir}/zoneinfo/Atlantic/*"
-RPROVIDES_tzdata-atlantic = "tzdata-atlantic"
-
-FILES_tzdata-australia += "${datadir}/zoneinfo/Australia/*"
-RPROVIDES_tzdata-australia = "tzdata-australia"
-
-FILES_tzdata-europe += "${datadir}/zoneinfo/Europe/*"
-RPROVIDES_tzdata-europe = "tzdata-europe"
-
-FILES_tzdata-pacific += "${datadir}/zoneinfo/Pacific/*"
-RPROVIDES_tzdata-pacific = "tzdata-pacific"
-
-FILES_tzdata-posix += "${datadir}/zoneinfo/posix/*"
-RPROVIDES_tzdata-posix = "tzdata-posix"
-
-FILES_tzdata-right += "${datadir}/zoneinfo/right/*"
-RPROVIDES_tzdata-right = "tzdata-right"
-
-
-FILES_tzdata-misc += "${datadir}/zoneinfo/Cuba           \
-                ${datadir}/zoneinfo/Egypt                \
-                ${datadir}/zoneinfo/Eire                 \
-                ${datadir}/zoneinfo/Factory              \
-                ${datadir}/zoneinfo/GB-Eire              \
-                ${datadir}/zoneinfo/Hongkong             \
-                ${datadir}/zoneinfo/Iceland              \
-                ${datadir}/zoneinfo/Iran                 \
-                ${datadir}/zoneinfo/Israel               \
-                ${datadir}/zoneinfo/Jamaica              \
-                ${datadir}/zoneinfo/Japan                \
-                ${datadir}/zoneinfo/Kwajalein            \
-                ${datadir}/zoneinfo/Libya                \
-                ${datadir}/zoneinfo/Navajo               \
-                ${datadir}/zoneinfo/Poland               \
-                ${datadir}/zoneinfo/Portugal             \
-                ${datadir}/zoneinfo/Singapore            \
-                ${datadir}/zoneinfo/Turkey"
-RPROVIDES_tzdata-misc = "tzdata-misc"
-
-
-FILES_${PN} += "${datadir}/zoneinfo/Pacific/Honolulu     \
-                ${datadir}/zoneinfo/America/Anchorage    \
-                ${datadir}/zoneinfo/America/Los_Angeles  \
-                ${datadir}/zoneinfo/America/Denver       \
-                ${datadir}/zoneinfo/America/Chicago      \
-                ${datadir}/zoneinfo/America/New_York     \
-                ${datadir}/zoneinfo/America/Caracas      \
-                ${datadir}/zoneinfo/America/Sao_Paulo    \
-                ${datadir}/zoneinfo/Europe/London        \
-                ${datadir}/zoneinfo/Europe/Paris         \
-                ${datadir}/zoneinfo/Africa/Cairo         \
-                ${datadir}/zoneinfo/Europe/Moscow        \
-                ${datadir}/zoneinfo/Asia/Dubai           \
-                ${datadir}/zoneinfo/Asia/Karachi         \
-                ${datadir}/zoneinfo/Asia/Dhaka           \
-                ${datadir}/zoneinfo/Asia/Bankok          \
-                ${datadir}/zoneinfo/Asia/Hong_Kong       \
-                ${datadir}/zoneinfo/Asia/Tokyo           \
-                ${datadir}/zoneinfo/Australia/Perth      \
-                ${datadir}/zoneinfo/Australia/Darwin     \
-                ${datadir}/zoneinfo/Australia/Adelaide   \
-                ${datadir}/zoneinfo/Australia/Brisbane   \
-                ${datadir}/zoneinfo/Australia/Sydney     \
-                ${datadir}/zoneinfo/Pacific/Noumea       \
-                ${datadir}/zoneinfo/CET                  \
-                ${datadir}/zoneinfo/CST6CDT              \
-                ${datadir}/zoneinfo/EET                  \
-                ${datadir}/zoneinfo/EST                  \
-                ${datadir}/zoneinfo/EST5EDT              \
-                ${datadir}/zoneinfo/GB                   \
-                ${datadir}/zoneinfo/GMT                  \
-                ${datadir}/zoneinfo/GMT+0                \
-                ${datadir}/zoneinfo/GMT-0                \
-                ${datadir}/zoneinfo/GMT0                 \
-                ${datadir}/zoneinfo/Greenwich            \
-                ${datadir}/zoneinfo/HST                  \
-                ${datadir}/zoneinfo/MET                  \
-                ${datadir}/zoneinfo/MST                  \
-                ${datadir}/zoneinfo/MST7MDT              \
-                ${datadir}/zoneinfo/NZ                   \
-                ${datadir}/zoneinfo/NZ-CHAT              \
-                ${datadir}/zoneinfo/PRC                  \
-                ${datadir}/zoneinfo/PST8PDT              \
-                ${datadir}/zoneinfo/ROC                  \
-                ${datadir}/zoneinfo/ROK                  \
-                ${datadir}/zoneinfo/UCT                  \
-                ${datadir}/zoneinfo/UTC                  \
-                ${datadir}/zoneinfo/Universal            \
-                ${datadir}/zoneinfo/W-SU                 \
-                ${datadir}/zoneinfo/WET                  \
-                ${datadir}/zoneinfo/Zulu                 \
-                ${datadir}/zoneinfo/Etc/*                \
-                ${datadir}/zoneinfo/iso3166.tab          \
-                ${datadir}/zoneinfo/zone.tab             \
-                ${sysconfdir}/localtime                  \
-                ${sysconfdir}/timezone                   "
diff --git a/meta-oe/recipes-extended/tzdata/tzdata_2011g.bb b/meta-oe/recipes-extended/tzdata/tzdata_2011g.bb
deleted file mode 100644
index 6863b5a..0000000
--- a/meta-oe/recipes-extended/tzdata/tzdata_2011g.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require tzdata.inc
-
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
-
-# Note that elsie.nci.nih.gov removes old archives after a new one is
-# released. So if this doesn't build for you because of missing source file
-# just bump it to the latest available version, removing the old one
-
-PR = "${INC_PR}.0"
-SRC_URI[md5sum] = "a068c27e7e426fdb12ab0c88506df20d"
-SRC_URI[sha256sum] = "01a2a189eeda63baacc5e68e6c13afffc7edce182102fffc53acbf35e8703d3c"
-- 
1.7.3.4



