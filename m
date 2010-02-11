Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NfbMT-0001jX-S0
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 16:53:52 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 8B2DD491283
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2010 16:51:17 +0100 (CET)
Received: from mobil-400-586.intern.dresearch.de ([10.32.11.62]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 11 Feb 2010 16:52:19 +0100
Received: by mobil-400-586.intern.dresearch.de (Postfix, from userid 1000)
	id 32B402C8EB; Thu, 11 Feb 2010 16:51:17 +0100 (CET)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Feb 2010 16:51:05 +0100
Message-Id: <1265903466-22758-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <22B019BE-6BD8-4748-A263-54A1CB919CA4@vanille-media.de>
References: <22B019BE-6BD8-4748-A263-54A1CB919CA4@vanille-media.de>
X-OriginalArrivalTime: 11 Feb 2010 15:52:19.0319 (UTC)
	FILETIME=[310DE870:01CAAB32]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/2] vala-dbus-binding-tool-0.1.3: new recipe
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
X-List-Received-Date: Thu, 11 Feb 2010 15:53:53 -0000

Creates gobject interfaces out of DBus XML specifications.

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 conf/checksums.ini                                 |    4 ++++
 .../vala-dbus-binding-tool.inc                     |   10 ++++++++++
 .../vala-dbus-binding-tool_0.1.3.bb                |    2 ++
 3 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 recipes/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
 create mode 100644 recipes/vala-dbus-binding-tool/vala-dbus-binding-tool_0.1.3.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index bf1bb73..e7ab0cf 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -27790,6 +27790,10 @@ sha256=46805e1c19707de043820a1474a8b3775ea3b698a0b539eabd7b86f0f3ad888a
 md5=f2f8b2914361db599fd6392ec27f7042
 sha256=a71d59cfed750ff402fece5e7d4b656caf3377d5a6bfe5339894f1b13769d58d
 
+[http://www.freesmartphone.org/sources/vala-dbus-binding-tool-0.1.3.tar.bz2]
+md5=8f92d071d34c218dc163760aaabaed41
+sha256=120db21e8902d12d571cabc4973e343b4308a48873ffb112f84a9f8b75571ad7
+
 [http://www.valgrind.org/downloads/valgrind-3.2.1.tar.bz2]
 md5=9407d33961186814cef0e6ecedfd6318
 sha256=7f9a15d7be16ca03a0912191e8d55a486bf69690e11bb76ccece3eaff3730a33
diff --git a/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool.inc b/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
new file mode 100644
index 0000000..a4385aa
--- /dev/null
+++ b/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "Creates gobject interfaces out of DBus XML specifications."
+SECTION = "devel"
+DEPENDS = "glib-2.0 libgee libxml2 dbus vala"
+HOMEPAGE = "http://www.freesmartphone.org/index.php/Implementations/vala-dbus-binding-tool"
+LICENSE = "GPL"
+INC_PR = "r1"
+
+SRC_URI = "http://www.freesmartphone.org/sources/vala-dbus-binding-tool-${PV}.tar.bz2"
+
+inherit autotools_stage
diff --git a/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool_0.1.3.bb b/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool_0.1.3.bb
new file mode 100644
index 0000000..4f696b5
--- /dev/null
+++ b/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool_0.1.3.bb
@@ -0,0 +1,2 @@
+require vala-dbus-binding-tool.inc
+PR = "${INC_PR}.0"
-- 
1.6.4.2



