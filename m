Received: from compulab.co.il ([67.18.134.219])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mike@compulab.co.il>) id 1NI83v-0003qK-TY
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Dec 2009 22:57:43 +0100
Received: from [62.90.235.247] (helo=zimbra-mta.compulab.co.il)
	by compulab.site5.com with esmtp (Exim 4.69)
	(envelope-from <mike@compulab.co.il>) id 1NI82I-00064t-NB
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Dec 2009 15:55:59 -0600
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra-mta.compulab.co.il (Postfix) with ESMTP id EABFA9A0369
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Dec 2009 23:55:53 +0200 (IST)
X-Virus-Scanned: amavisd-new at compulab.co.il
Received: from zimbra-mta.compulab.co.il ([127.0.0.1])
	by localhost (zimbra-mta.compulab.co.il [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id iNcHgn8KIWCB; Tue,  8 Dec 2009 23:55:48 +0200 (IST)
Received: from droid.compulab.local (droid.compulab.local [10.1.1.77])
	by zimbra-mta.compulab.co.il (Postfix) with ESMTP id 636CB9A034F;
	Tue,  8 Dec 2009 23:55:48 +0200 (IST)
Received: from droid.compulab.local (localhost [127.0.0.1])
	by droid.compulab.local (8.14.0/8.14.0) with ESMTP id nB8Lthj7022585;
	Tue, 8 Dec 2009 23:55:43 +0200
Received: (from mike@localhost)
	by droid.compulab.local (8.14.0/8.14.0/Submit) id nB8LBJbT022426;
	Tue, 8 Dec 2009 23:11:19 +0200
X-Authentication-Warning: droid.compulab.local: mike set sender to
	mike@compulab.co.il using -f
From: Mike Rapoport <mike@compulab.co.il>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Dec 2009 23:11:14 +0200
Message-Id: <1ce97f9476510fe1408d15b18e6e2911fe721d14.1260305960.git.mike@compulab.co.il>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <cover.1260305960.git.mike@compulab.co.il>
References: <cover.1260305960.git.mike@compulab.co.il>
X-ACL-Warn: {
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - compulab.site5.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - compulab.co.il
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 67.18.134.219
X-SA-Exim-Mail-From: mike@compulab.co.il
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 5/5] xserver-xorg-conf: add cm-t35 support
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
X-List-Received-Date: Tue, 08 Dec 2009 21:57:43 -0000

Signed-off-by: Mike Rapoport <mike@compulab.co.il>
---
 .../xserver-xorg-conf/cm-t35/xorg.conf             |   29 ++++++++++++++++++++
 recipes/xorg-xserver/xserver-xorg-conf_0.1.bb      |    2 +-
 2 files changed, 30 insertions(+), 1 deletions(-)
 create mode 100644 recipes/xorg-xserver/xserver-xorg-conf/cm-t35/xorg.conf

diff --git a/recipes/xorg-xserver/xserver-xorg-conf/cm-t35/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/cm-t35/xorg.conf
new file mode 100644
index 0000000..07d849d
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-conf/cm-t35/xorg.conf
@@ -0,0 +1,29 @@
+Section "Module"
+        Load    "extmod"
+        Load    "dbe"
+        Load    "glx"
+        Load    "freetype"
+        Load    "type1"
+        Load    "record"
+        Load    "dri"
+EndSection
+
+Section "Monitor"
+        Identifier      "Builtin Default Monitor"
+EndSection
+
+Section "Device"
+        Identifier      "Builtin Default fbdev Device 0"
+        Driver  "omapfb"
+EndSection
+
+Section "Screen"
+        Identifier      "Builtin Default fbdev Screen 0"
+        Device  "Builtin Default fbdev Device 0"
+        Monitor "Builtin Default Monitor"
+EndSection
+
+Section "ServerLayout"
+        Identifier      "Builtin Default Layout"
+        Screen  "Builtin Default fbdev Screen 0"
+EndSection
diff --git a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
index 8945e1e..77e0f8d 100644
--- a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
+++ b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Machine specific xorg.conf files"
-PR = "r16"
+PR = "r17"
 
 SRC_URI = "file://xorg.conf"
 
-- 
1.6.4.4



