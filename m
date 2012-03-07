Received: from nk11p03mm-asmtp995.mac.com ([17.158.233.226]
	helo=nk11p99mm-asmtpout005.mac.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel.zauner@me.com>) id 1S56zE-0006Ib-97
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Mar 2012 03:52:20 +0100
MIME-version: 1.0
Received: from [10.0.1.8] (pD9F67E87.dip.t-dialin.net [217.246.126.135])
	by nk11p03mm-asmtp995.mac.com
	(Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit
	(built Aug
	10 2011)) with ESMTPSA id <0M0H00KF7RGN5NB0@nk11p03mm-asmtp995.mac.com>
	for openembedded-devel@lists.openembedded.org; Wed,
	07 Mar 2012 01:43:38 +0000 (GMT)
X-Proofpoint-Virus-Version: vendor=fsecure
	engine=2.50.10432:5.6.7498,1.0.260,0.0.0000
	definitions=2012-03-06_08:2012-03-06, 2012-03-06,
	1970-01-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 suspectscore=1 phishscore=0 bulkscore=0 adultscore=0
	classifier=spam
	adjust=0 reason=mlx scancount=1 engine=6.0.2-1012030000
	definitions=main-1203060293
From: Daniel Zauner <daniel.zauner@me.com>
Date: Wed, 07 Mar 2012 02:43:34 +0100
Message-id: <A57ACED2-3733-4037-ACC9-870532921768@me.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1257)
Subject: [PATCH] opkg-utils recipe: new SOURCE_URI
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
X-List-Received-Date: Wed, 07 Mar 2012 02:52:20 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; CHARSET=US-ASCII

Changed the Source-URI from (currently?) dead openmoko SVN-Server to new git-repository at git.yoctoproject.org / my first submit, be nice :D

dFence
---
 recipes/opkg-utils/opkg-utils_git.bb |   27 +++++++++++++++++++++++++++
 recipes/opkg-utils/opkg-utils_svn.bb |   27 ---------------------------
 2 files changed, 27 insertions(+), 27 deletions(-)
 create mode 100644 recipes/opkg-utils/opkg-utils_git.bb
 delete mode 100644 recipes/opkg-utils/opkg-utils_svn.bb

diff --git a/recipes/opkg-utils/opkg-utils_git.bb b/recipes/opkg-utils/opkg-utils_git.bb
new file mode 100644
index 0000000..6adc7c1
--- /dev/null
+++ b/recipes/opkg-utils/opkg-utils_git.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "OPKG Package Manager Utilities"
+SECTION = "base"
+HOMEPAGE = "http://wiki.openmoko.org/wiki/Opkg"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+RDEPENDS_${PN} = "python"
+RDEPENDS_${PN}_virtclass-native = ""
+SRCREV = "002d29bc605d7c2d02e4cf20a43c5277c15f5597"
+PV = "0.1.8+gitr${SRCPV}"
+PR = "r0"
+
+SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=git \
+           file://index-ignore-filenotfound.patch \
+           file://arfile_header_split.patch \
+           file://mtime-int.patch"
+
+S = "${WORKDIR}/git"
+
+# Avoid circular dependencies from package_ipk.bbclass
+PACKAGES_virtclass-native = ""
+
+do_install() {
+        oe_runmake PREFIX=${prefix} DESTDIR=${D} install
+}
+
+BBCLASSEXTEND = "native"
+TARGET_CC_ARCH += "${LDFLAGS}"
diff --git a/recipes/opkg-utils/opkg-utils_svn.bb b/recipes/opkg-utils/opkg-utils_svn.bb
deleted file mode 100644
index 3ddafdb..0000000
--- a/recipes/opkg-utils/opkg-utils_svn.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "OPKG Package Manager Utilities"
-SECTION = "base"
-HOMEPAGE = "http://wiki.openmoko.org/wiki/Opkg"
-PRIORITY = "optional"
-LICENSE = "GPLv2"
-RDEPENDS_${PN} = "python"
-RDEPENDS_${PN}_virtclass-native = ""
-SRCREV = "4747"
-PV = "0.1.8+svnr${SRCPV}"
-PR = "r7"
-
-SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
-           file://index-ignore-filenotfound.patch \
-           file://arfile_header_split.patch \
-           file://mtime-int.patch"
-
-S = "${WORKDIR}/opkg-utils"
-
-# Avoid circular dependencies from package_ipk.bbclass
-PACKAGES_virtclass-native = ""
-
-do_install() {
-        oe_runmake PREFIX=${prefix} DESTDIR=${D} install
-}
-
-BBCLASSEXTEND = "native"
-TARGET_CC_ARCH += "${LDFLAGS}"
--
1.7.2.5




