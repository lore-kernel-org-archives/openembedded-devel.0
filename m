Received: from mail-yw0-f188.google.com ([209.85.211.188])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ricardo.salveti@openbossa.org>) id 1NCcYS-00056e-Ai
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 18:18:27 +0100
Received: by ywh26 with SMTP id 26so4941008ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 09:16:55 -0800 (PST)
Received: by 10.101.165.11 with SMTP id s11mr580071ano.4.1258996614482;
	Mon, 23 Nov 2009 09:16:54 -0800 (PST)
Received: from localhost.localdomain ([200.184.118.130])
	by mx.google.com with ESMTPS id 7sm1538770ywf.25.2009.11.23.09.16.52
	(version=SSLv3 cipher=RC4-MD5); Mon, 23 Nov 2009 09:16:53 -0800 (PST)
From: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Nov 2009 14:10:30 -0300
Message-Id: <1258996230-20010-1-git-send-email-ricardo.salveti@openbossa.org>
X-Mailer: git-send-email 1.6.5
X-SA-Exim-Connect-IP: 209.85.211.188
X-SA-Exim-Mail-From: ricardo.salveti@openbossa.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] obexd-0.19: adding new version and start using obexd.inc
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
X-List-Received-Date: Mon, 23 Nov 2009 17:18:27 -0000

Signed-off-by: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
---
 recipes/bluez/obexd.inc     |   10 ++++++++++
 recipes/bluez/obexd_0.10.bb |   11 +----------
 recipes/bluez/obexd_0.13.bb |   11 +----------
 recipes/bluez/obexd_0.15.bb |   11 +----------
 recipes/bluez/obexd_0.19.bb |    4 ++++
 5 files changed, 17 insertions(+), 30 deletions(-)
 create mode 100644 recipes/bluez/obexd.inc
 create mode 100644 recipes/bluez/obexd_0.19.bb

diff --git a/recipes/bluez/obexd.inc b/recipes/bluez/obexd.inc
new file mode 100644
index 0000000..a10a557
--- /dev/null
+++ b/recipes/bluez/obexd.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "OBEX Server and Client"
+DEPENDS = "openobex glib-2.0 dbus bluez4"
+HOMEPAGE = "http://www.bluez.org/"
+LICENSE = "GPLv2"
+
+SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz;name=tarball"
+
+inherit autotools_stage
+
+FILES_${PN} += "${datadir}/dbus-1/"
diff --git a/recipes/bluez/obexd_0.10.bb b/recipes/bluez/obexd_0.10.bb
index e1cc6ce..aa4d494 100644
--- a/recipes/bluez/obexd_0.10.bb
+++ b/recipes/bluez/obexd_0.10.bb
@@ -1,10 +1 @@
-DESCRIPTION = "OBEX Server and Client"
-DEPENDS = "openobex glib-2.0 dbus bluez4"
-
-LICENSE = "GPLv2"
-
-SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz"
-
-inherit autotools_stage
-
-FILES_${PN} += "${datadir}/dbus-1/"
+require obexd.inc
diff --git a/recipes/bluez/obexd_0.13.bb b/recipes/bluez/obexd_0.13.bb
index e1cc6ce..aa4d494 100644
--- a/recipes/bluez/obexd_0.13.bb
+++ b/recipes/bluez/obexd_0.13.bb
@@ -1,10 +1 @@
-DESCRIPTION = "OBEX Server and Client"
-DEPENDS = "openobex glib-2.0 dbus bluez4"
-
-LICENSE = "GPLv2"
-
-SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz"
-
-inherit autotools_stage
-
-FILES_${PN} += "${datadir}/dbus-1/"
+require obexd.inc
diff --git a/recipes/bluez/obexd_0.15.bb b/recipes/bluez/obexd_0.15.bb
index e1cc6ce..aa4d494 100644
--- a/recipes/bluez/obexd_0.15.bb
+++ b/recipes/bluez/obexd_0.15.bb
@@ -1,10 +1 @@
-DESCRIPTION = "OBEX Server and Client"
-DEPENDS = "openobex glib-2.0 dbus bluez4"
-
-LICENSE = "GPLv2"
-
-SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz"
-
-inherit autotools_stage
-
-FILES_${PN} += "${datadir}/dbus-1/"
+require obexd.inc
diff --git a/recipes/bluez/obexd_0.19.bb b/recipes/bluez/obexd_0.19.bb
new file mode 100644
index 0000000..afa6878
--- /dev/null
+++ b/recipes/bluez/obexd_0.19.bb
@@ -0,0 +1,4 @@
+require obexd.inc
+
+SRC_URI[tarball.md5sum] = "2f03b81411a1f7c359ada35459d946a5"
+SRC_URI[tarball.sha256sum] = "37fb4cffad7e361daffa9915ee6a37e615d0bf4d1f24760e585d5ac922515ca8"
-- 
1.6.5



