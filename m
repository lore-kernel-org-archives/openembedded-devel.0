Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NfbMY-0001jg-EE
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 16:53:57 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 336EF491283
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2010 16:51:22 +0100 (CET)
Received: from mobil-400-586.intern.dresearch.de ([10.32.11.62]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 11 Feb 2010 16:52:23 +0100
Received: by mobil-400-586.intern.dresearch.de (Postfix, from userid 1000)
	id DB5082C8EB; Thu, 11 Feb 2010 16:51:21 +0100 (CET)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Feb 2010 16:51:06 +0100
Message-Id: <1265903466-22758-2-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1265903466-22758-1-git-send-email-sledz@dresearch.de>
References: <22B019BE-6BD8-4748-A263-54A1CB919CA4@vanille-media.de>
	<1265903466-22758-1-git-send-email-sledz@dresearch.de>
X-OriginalArrivalTime: 11 Feb 2010 15:52:23.0960 (UTC)
	FILETIME=[33D21180:01CAAB32]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/2] vala-dbus-binding-tool: relocate native recipe from freesmartphone subdir
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
X-List-Received-Date: Thu, 11 Feb 2010 15:53:57 -0000

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 .../vala-dbus-binding-tool-native_git.bb           |   10 ----------
 .../vala-dbus-binding-tool-native_git.bb           |   10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 recipes/freesmartphone/vala-dbus-binding-tool-native_git.bb
 create mode 100644 recipes/vala-dbus-binding-tool/vala-dbus-binding-tool-native_git.bb

diff --git a/recipes/freesmartphone/vala-dbus-binding-tool-native_git.bb b/recipes/freesmartphone/vala-dbus-binding-tool-native_git.bb
deleted file mode 100644
index ebae18b..0000000
--- a/recipes/freesmartphone/vala-dbus-binding-tool-native_git.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "Vala DBus Binding Tool"
-SECTION = "console"
-LICENSE = "GPLv2"
-DEPENDS = "vala-native libgee-native intltool-native libxml2-native"
-PV = "0.1.0+gitr${SRCREV}"
-
-SRC_URI = "${FREESMARTPHONE_GIT}/vala-dbus-binding-tool.git;protocol=git;branch=master"
-S = "${WORKDIR}/git"
-
-inherit autotools_stage native
diff --git a/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool-native_git.bb b/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool-native_git.bb
new file mode 100644
index 0000000..ebae18b
--- /dev/null
+++ b/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool-native_git.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "Vala DBus Binding Tool"
+SECTION = "console"
+LICENSE = "GPLv2"
+DEPENDS = "vala-native libgee-native intltool-native libxml2-native"
+PV = "0.1.0+gitr${SRCREV}"
+
+SRC_URI = "${FREESMARTPHONE_GIT}/vala-dbus-binding-tool.git;protocol=git;branch=master"
+S = "${WORKDIR}/git"
+
+inherit autotools_stage native
-- 
1.6.4.2



