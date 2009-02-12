Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@ossystems.com.br>) id 1LXebR-0008Ei-72
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 17:39:53 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id D8E5C4035F;
	Thu, 12 Feb 2009 12:38:49 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 62D41740DE;
	Thu, 12 Feb 2009 14:38:48 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id CD706610136; Thu, 12 Feb 2009 14:38:35 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2009 14:38:35 -0200
Message-Id: <1234456715-23618-7-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.2.rc0
In-Reply-To: <1234456715-23618-6-git-send-email-otavio@ossystems.com.br>
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-3-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-4-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-5-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-6-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 6/6] flash-plugin: add 10.0.12.36
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
X-List-Received-Date: Thu, 12 Feb 2009 16:39:53 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/checksums.ini                              |    5 ++
 packages/adobe-flash/flash-plugin_10.0.12.36.bb |   57 +++++++++++++++++++++++
 2 files changed, 62 insertions(+), 0 deletions(-)
 create mode 100644 packages/adobe-flash/flash-plugin_10.0.12.36.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 4742b61..a4e7ff3 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -5494,6 +5494,10 @@ sha256=ce4f7d11b3c04a7368c916ca4abc284dd0c0256f461dfb7f07df1ab445e7a5c0
 md5=2bfc127cdda02834d0491ab531a20960
 sha256=ce4f7d11b3c04a7368c916ca4abc284dd0c0256f461dfb7f07df1ab445e7a5c0
 
+[http://fpdownload.macromedia.com/get/flashplayer/current//flash-plugin-10.0.12.36-release.i386.rpm]
+md5=8845d4536fcd3a329690c93bce9bbf8e
+sha256=c7345faf10b269b3556f2e1373c4afc35f08891f8bbd54e45d49151a8c8e4ac0
+
 [http://downloads.sourceforge.net/flex/flex-2.5.31.tar.bz2]
 md5=363dcc4afc917dc51306eb9d3de0152f
 sha256=701353279a17655d78e3b3678ad78d0375f5bf45877ad8b3507d589c42427f26
@@ -25249,3 +25253,4 @@ sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
 [http://heanet.dl.sourceforge.net/zziplib/zziplib-0.13.49.tar.bz2]
 md5=5f7b88ebb2bcd7e8044328482d079661
 sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
+
diff --git a/packages/adobe-flash/flash-plugin_10.0.12.36.bb b/packages/adobe-flash/flash-plugin_10.0.12.36.bb
new file mode 100644
index 0000000..3d618f2
--- /dev/null
+++ b/packages/adobe-flash/flash-plugin_10.0.12.36.bb
@@ -0,0 +1,57 @@
+DESCRIPTION = "Adobe Flash 9 plugin for Mozilla/Firefox web browsers"
+LICENSE = "AdobeFlash"
+
+PR="r1"
+
+DEPENDS = "rpm2cpio-native"
+
+ADOBE_MIRROR = "http://fpdownload.macromedia.com/get/flashplayer/current/"
+
+# Adobe provides two versions of flash player packages
+# One "unversioned" download at :
+# ${ADOBE_MIRROR}/install_flash_player_9_linux.tar.gz
+# And the other, versioned, which is encapsulated in RPM
+# We use the versioned one to make sure we can keep track of the version
+# and thus do repeatable builds at the cost of future download failures 
+# when adobe updates.
+
+SRC_URI ="${ADOBE_MIRROR}/flash-plugin-${PV}-release.i386.rpm"
+
+# SRC_URI ="${ADOBE_MIRROR}/install_flash_player_9_linux.tar.gz"
+# S = "${WORKDIR}/install_flash_player_9_linux"
+
+do_configure() {
+	rpm=${WORKDIR}/flash-plugin-${PV}-release.i386.rpm
+	if [ -f "$rpm" ]; then
+		rpm2cpio.pl $rpm | cpio -id
+		find . -type f -exec mv -i {} "`pwd`" \;
+	fi
+}
+
+# Is this necessary ?
+# do_compile () {
+# 	WE_DO_NOT_COMPILE="yes"
+# }
+
+do_install() {
+	mkdir -p ${D}${libdir}/mozilla/plugins/
+	install -m 0755 libflashplayer.so ${D}${libdir}/mozilla/plugins/
+	# AFAIK this is not needed
+	# install -m 0644 flashplayer.xpt ${D}${libdir}/mozilla/plugins/
+}
+
+FILES_${PN} = "${libdir}/* ${libdir}/X11/*"
+
+pkg_postinst() {
+	test -n "$D" && exit 1
+	mkdir -p ${libdir}/X11/fonts/misc
+	cat >> ${libdir}/X11/fonts/misc/fonts.alias <<_PUNT
+-*-*-medium-r-normal-*-10-*              -misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-iso8859-1
+-*-helvetica-medium-r-normal-*-10-*      -misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-iso8859-1
+-*-serf-medium-r-normal-*-10-*           -misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-iso8859-1
+-*-*-*-*-*-*-*-*-*-*-*-*-big5-*          -misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-iso8859-1
+-*-*-*-*-*-*-*-*-*-*-*-*-gb2312.1980-*   -misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-iso8859-1
+-*-*-medium-r-normal-*-14-*-*-*-*-*-*-*  -misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-iso8859-1
+-*-fixed-*--14-*                         -misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-iso8859-1
+_PUNT
+}
-- 
1.6.2.rc0



