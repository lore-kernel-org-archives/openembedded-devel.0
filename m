Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NgzT0-0007Sj-C0
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 12:50:21 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id DA0194912A6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2010 12:47:41 +0100 (CET)
Received: from mobil-400-586.intern.dresearch.de ([10.32.11.62]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 15 Feb 2010 11:55:26 +0100
Received: by mobil-400-586.intern.dresearch.de (Postfix, from userid 1000)
	id 0877F2D0CB; Mon, 15 Feb 2010 11:55:11 +0100 (CET)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Feb 2010 11:54:51 +0100
Message-Id: <1266231291-18711-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <20100213132656.GE5364@jama>
References: <20100213132656.GE5364@jama>
X-OriginalArrivalTime: 15 Feb 2010 10:55:26.0064 (UTC)
	FILETIME=[612DE700:01CAAE2D]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] vala-dbus-binding-tool: (mostly) new recipe
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
X-List-Received-Date: Mon, 15 Feb 2010 11:50:21 -0000

New recipes for native and non-native build of Vala DBus Binding Tool
integrating earlier recipe from recipes/freesmartphone.

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 conf/checksums.ini                                 |    4 ++++
 conf/distro/include/fso-autorev.inc                |    1 +
 conf/distro/include/sane-srcrevs-fso.inc           |    1 +
 .../vala-dbus-binding-tool-native_git.bb           |   10 ----------
 .../vala-dbus-binding-tool.inc                     |   10 ++++++++++
 .../vala-dbus-binding-tool_0.1.3.bb                |    4 ++++
 .../vala-dbus-binding-tool_git.bb                  |    7 +++++++
 7 files changed, 27 insertions(+), 10 deletions(-)
 delete mode 100644 recipes/freesmartphone/vala-dbus-binding-tool-native_git.bb
 create mode 100644 recipes/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
 create mode 100644 recipes/vala-dbus-binding-tool/vala-dbus-binding-tool_0.1.3.bb
 create mode 100644 recipes/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index a052162..c700eed 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -27770,6 +27770,10 @@ sha256=46805e1c19707de043820a1474a8b3775ea3b698a0b539eabd7b86f0f3ad888a
 md5=f2f8b2914361db599fd6392ec27f7042
 sha256=a71d59cfed750ff402fece5e7d4b656caf3377d5a6bfe5339894f1b13769d58d
 
+[http://www.freesmartphone.org/sources/vala-dbus-binding-tool-0.1.3.tar.bz2]
+md5=8f92d071d34c218dc163760aaabaed41
+sha256=120db21e8902d12d571cabc4973e343b4308a48873ffb112f84a9f8b75571ad7
+
 [http://www.valgrind.org/downloads/valgrind-3.2.1.tar.bz2]
 md5=9407d33961186814cef0e6ecedfd6318
 sha256=7f9a15d7be16ca03a0912191e8d55a486bf69690e11bb76ccece3eaff3730a33
diff --git a/conf/distro/include/fso-autorev.inc b/conf/distro/include/fso-autorev.inc
index a1dca0e..612d38e 100644
--- a/conf/distro/include/fso-autorev.inc
+++ b/conf/distro/include/fso-autorev.inc
@@ -42,6 +42,7 @@ SRCREV_pn-misc-vapi = "${AUTOREV}"
 SRCREV_pn-msmcommd = "${AUTOREV}"
 SRCREV_pn-python-pytrc = "${AUTOREV}"
 SRCREV_pn-vala-dbus-binding-tool-native = "${AUTOREV}"
+SRCREV_pn-vala-dbus-binding-tool = "${AUTOREV}"
 SRCREV_pn-vala-native = "${AUTOREV}"
 SRCREV_pn-vala = "${AUTOREV}"
 SRCREV_pn-zhone = "${AUTOREV}"
diff --git a/conf/distro/include/sane-srcrevs-fso.inc b/conf/distro/include/sane-srcrevs-fso.inc
index 4f183b5..82ac61c 100644
--- a/conf/distro/include/sane-srcrevs-fso.inc
+++ b/conf/distro/include/sane-srcrevs-fso.inc
@@ -44,6 +44,7 @@ SRCREV_pn-multicat ?= "${FSO_PYTHONHELPERS_SRCREV}"
 SRCREV_pn-python-pyrtc ?= "${FSO_PYTHONHELPERS_SRCREV}"
 SRCREV_pn-pycd ?= "${FSO_PYTHONHELPERS_SRCREV}" 
 SRCREV_pn-vala-dbus-binding-tool-native ?= "8df9b5aab50066d3f5a525518f902dd26f77bbd7"
+SRCREV_pn-vala-dbus-binding-tool ?= "8df9b5aab50066d3f5a525518f902dd26f77bbd7"
 SRCREV_pn-vala-terminal ?= "932285d72e26b965c488f8aa99fe51f7a34231ad"
 SRCREV_pn-vala-native ?= "a8aa50a80bcdc5f6c8183507f87b6c6fdfac8d9f"
 SRCREV_pn-zhone ?= "2638381cf581d167cf5304baf64ae678016428a6"
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
diff --git a/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool.inc b/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
new file mode 100644
index 0000000..0367f42
--- /dev/null
+++ b/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "Vala DBus Binding Tool"
+SECTION = "devel"
+DEPENDS = "vala libgee libxml2 intltool-native"
+HOMEPAGE = "http://www.freesmartphone.org/index.php/Implementations/vala-dbus-binding-tool"
+LICENSE = "GPLv2"
+INC_PR = "r1"
+
+inherit autotools_stage
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool_0.1.3.bb b/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool_0.1.3.bb
new file mode 100644
index 0000000..14e65d8
--- /dev/null
+++ b/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool_0.1.3.bb
@@ -0,0 +1,4 @@
+require vala-dbus-binding-tool.inc
+PR = "${INC_PR}.0"
+
+SRC_URI = "http://www.freesmartphone.org/sources/vala-dbus-binding-tool-${PV}.tar.bz2"
diff --git a/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb b/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
new file mode 100644
index 0000000..178df0b
--- /dev/null
+++ b/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
@@ -0,0 +1,7 @@
+require vala-dbus-binding-tool.inc
+PV = "0.1.0+gitr${SRCREV}"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "${FREESMARTPHONE_GIT}/vala-dbus-binding-tool.git;protocol=git;branch=master"
+S = "${WORKDIR}/git"
-- 
1.6.4.2



