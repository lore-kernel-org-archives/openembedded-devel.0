Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q23HV-000339-FN
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 16:14:01 +0100
Received: by gxk3 with SMTP id 3so1617603gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 08:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=C1EvLX/PVTBZgAAu5f74PA4PfktyIQ0ezkOG+ir4qso=;
	b=k+cEQZX5+5J59U2jTk9byuE+kjHNKtYJ5GTtHTDRfJugIKJhQYmZLEPOMDvBO7gCXQ
	PI7T50qGfw281tXmsmW3tPeZrxU4BPnrPo8kD+NsGg0pHKiGxlM6czfGOBeQOx2fv8b6
	2lXF3Sj177lu/YSLiHgL+6IHoWwpdU4D4ymf8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=WCcID/SPeLP40RWJvUl02g7murHhCuZ/OJRg6m61dUzIFYUI6ehbPszVNk9Fkf8waU
	TQiWUCvBbFuFT1yrJv3OfUYfQYabP/yNHrcGU6zwsaPsJxRuaiLxsBGZZihmBI9BEJvx
	cmH90qtcx2HptO0o66PvEpofKesbmUvdSqC4I=
Received: by 10.151.143.14 with SMTP id v14mr5150226ybn.132.1300806731086;
	Tue, 22 Mar 2011 08:12:11 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id o2sm1732487ybn.21.2011.03.22.08.12.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2011 08:12:09 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Mar 2011 15:11:21 +0000
Message-Id: <1300806683-17244-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1300806683-17244-1-git-send-email-otavio@ossystems.com.br>
References: <1300806683-17244-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/4] flash-plugin: update to 10.2.153.1
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
X-List-Received-Date: Tue, 22 Mar 2011 15:14:01 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/adobe-flash/flash-plugin_10.0.22.87.bb |   35 --------------------
 recipes/adobe-flash/flash-plugin_10.2.153.1.bb |   41 ++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 35 deletions(-)
 delete mode 100644 recipes/adobe-flash/flash-plugin_10.0.22.87.bb
 create mode 100644 recipes/adobe-flash/flash-plugin_10.2.153.1.bb

diff --git a/recipes/adobe-flash/flash-plugin_10.0.22.87.bb b/recipes/adobe-flash/flash-plugin_10.0.22.87.bb
deleted file mode 100644
index d6cde60..0000000
--- a/recipes/adobe-flash/flash-plugin_10.0.22.87.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-# Adobe provides two versions of flash player packages
-#
-# One "unversioned" download at :
-#
-#     ${ADOBE_MIRROR}/install_flash_player_9_linux.tar.gz
-#
-# And the other, versioned, which is encapsulated in RPM.
-#
-# We use the versioned one to make sure we can keep track of the
-# version and thus do repeatable builds at the cost of future download
-# failures when adobe updates.
-DESCRIPTION = "Adobe Flash 9 plugin for Mozilla/Firefox web browsers"
-LICENSE = "AdobeFlash"
-DEPENDS = "rpm2cpio-native"
-PR = "r1"
-
-SRC_URI = "${ADOBE_MIRROR}/flash-plugin-${PV}-release.i386.rpm"
-
-do_configure() {
-        rpm=${WORKDIR}/flash-plugin-${PV}-release.i386.rpm
-        if [ -f "$rpm" ]; then
-                rpm2cpio.pl $rpm | cpio -id
-                find . -type f -exec mv -i {} "`pwd`" \;
-        fi
-}
-do_install() {
-        mkdir -p ${D}${libdir}/mozilla/plugins/
-        install -m 0755 libflashplayer.so ${D}${libdir}/mozilla/plugins/
-        # AFAIK this is not needed
-        # install -m 0644 flashplayer.xpt ${D}${libdir}/mozilla/plugins/
-}
-
-FILES_${PN} = "${libdir}/* ${libdir}/X11/*"
-
-COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/adobe-flash/flash-plugin_10.2.153.1.bb b/recipes/adobe-flash/flash-plugin_10.2.153.1.bb
new file mode 100644
index 0000000..af9df0a
--- /dev/null
+++ b/recipes/adobe-flash/flash-plugin_10.2.153.1.bb
@@ -0,0 +1,41 @@
+# Adobe provides two versions of flash player packages
+#
+# One "unversioned" download at :
+#
+#     ${ADOBE_MIRROR}/install_flash_player_9_linux.tar.gz
+#
+# And the other, versioned, which is encapsulated in RPM.
+#
+# We use the versioned one to make sure we can keep track of the
+# version and thus do repeatable builds at the cost of future download
+# failures when adobe updates.
+DESCRIPTION = "Adobe Flash 9 plugin for Mozilla/Firefox web browsers"
+LICENSE = "AdobeFlash"
+DEPENDS = "rpm2cpio-native"
+PR = "r1"
+
+# it lacks GNU_HASH but we can't fix it, so ignore it
+INSANE_SKIP_${PN} = "1"
+
+SRC_URI = "${ADOBE_MIRROR}/flash-plugin-${PV}-release.i386.rpm"
+
+SRC_URI[md5sum] = "4ef7c931c442aef19c920580de0e1c42"
+SRC_URI[sha256sum] = "9899252732cc94b3bc0ae7e145c6c5e94255e123bd8d5298f9ec40cb10f63568"
+
+do_configure() {
+        rpm=${WORKDIR}/flash-plugin-${PV}-release.i386.rpm
+        if [ -f "$rpm" ]; then
+                rpm2cpio.pl $rpm | cpio -id
+                find . -type f -exec mv -i {} "`pwd`" \;
+        fi
+}
+do_install() {
+        mkdir -p ${D}${libdir}/mozilla/plugins/
+        install -m 0755 libflashplayer.so ${D}${libdir}/mozilla/plugins/
+        # AFAIK this is not needed
+        # install -m 0644 flashplayer.xpt ${D}${libdir}/mozilla/plugins/
+}
+
+FILES_${PN} = "${libdir}/* ${libdir}/X11/*"
+
+COMPATIBLE_HOST = "i.86.*-linux"
-- 
1.7.2.3



