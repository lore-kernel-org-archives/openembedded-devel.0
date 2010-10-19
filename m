Received: from mail-bw0-f65.google.com ([209.85.214.65])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P87eS-0001YF-53
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 10:34:36 +0200
Received: by bwz12 with SMTP id 12so524214bwz.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 01:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=xVnfPY00316LBdkocJEdZo02BOAYCbNV4//pcyXvTgQ=;
	b=igW5djvLhoy8CAwrsp0mKMZ5veI1L5MVzh4dimmyBcQCCQJ4sDKs+mxF+XDyouCP5k
	3BZOISUwIyefCv8YTAZhMm5g1q984u+yxb4OwCqByAFzIypzWPFUfu7/d5+X2UqMyqe9
	xkXm5llYqo9TpU4QuM9Ctuq0hQHmXbfF/E7+c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=qAqwxpoI23O7ZgyzyZkdAoDJWHtfIfrG0q8TMaLB6KBWA5pz+yuk7tObLJJT8hiVAt
	5hQh9BHuw2K/DxTwkeh2geWHlSmKvNEqIEMSQhTSArRPQ1i1BUO2ILz4t4vDe7CnsOE8
	sCdp/AA7IKeRS3rpYFIZJp6h4bzfLNME+plWY=
Received: by 10.204.62.209 with SMTP id y17mr199433bkh.88.1287477237634;
	Tue, 19 Oct 2010 01:33:57 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id c40sm576846fay.0.2010.10.19.01.33.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 19 Oct 2010 01:33:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Oct 2010 10:33:21 +0200
Message-Id: <1287477207-27752-8-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
References: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.65
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 07/13] openmoko: obsolete old openmoko classes and recipes using those
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
X-List-Received-Date: Tue, 19 Oct 2010 08:34:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/openmoko-base.bbclass                      |   22 --------
 classes/openmoko.bbclass                           |    3 -
 classes/openmoko2.bbclass                          |   37 -------------
 recipes/obsolete/classes/openmoko-base.bbclass     |   22 ++++++++
 recipes/obsolete/classes/openmoko.bbclass          |    3 +
 recipes/obsolete/classes/openmoko2.bbclass         |   37 +++++++++++++
 .../obsolete/openmoko-base/openmoko-common_svn.bb  |   21 +++++++
 .../openmoko-icon-theme-standard_svn.bb            |   19 +++++++
 .../obsolete/openmoko-base/openmoko-libs_svn.bb    |   32 +++++++++++
 .../openmoko-base/openmoko-sound-system/pulseaudio |   46 ++++++++++++++++
 .../openmoko-base/openmoko-sound-system/session    |   28 ++++++++++
 .../openmoko-base/openmoko-sound-system_0.1.0.bb   |   31 +++++++++++
 .../openmoko-sound-theme-standard_svn.bb           |   23 ++++++++
 .../openmoko-theme-standard-qvga_svn.bb            |   25 +++++++++
 .../openmoko-base/openmoko-theme-standard_svn.bb   |   27 +++++++++
 .../openmoko-examples/openmoko-finger-demo_svn.bb  |    6 ++
 .../openmoko-panel-demo-simple_svn.bb              |   20 +++++++
 .../openmoko-examples/openmoko-panel-demo_svn.bb   |   10 ++++
 .../openmoko-stylus-demo-simple_svn.bb             |    6 ++
 .../openmoko-examples/openmoko-stylus-demo_svn.bb  |    6 ++
 .../diversity-daemon/no-xmmp.patch                 |   24 ++++++++
 .../openmoko-projects/diversity-daemon_svn.bb      |   20 +++++++
 .../openmoko-projects/diversity-radar_svn.bb       |   17 ++++++
 recipes/obsolete/openmoko2/libjana_svn.bb          |   29 ++++++++++
 recipes/obsolete/openmoko2/libmokogsmd2_svn.bb     |    8 +++
 recipes/obsolete/openmoko2/libmokojournal2_svn.bb  |   12 ++++
 recipes/obsolete/openmoko2/libmokopanelui2_svn.bb  |    8 +++
 recipes/obsolete/openmoko2/moko-gtk-engine_svn.bb  |   15 +++++
 recipes/obsolete/openmoko2/neod/htc.patch          |   32 +++++++++++
 recipes/obsolete/openmoko2/neod/ipaq.patch         |   32 +++++++++++
 recipes/obsolete/openmoko2/neod_svn.bb             |   28 ++++++++++
 .../openmoko2/openmoko-asu-om20072-support.bb      |   27 +++++++++
 recipes/obsolete/openmoko2/openmoko-common2_svn.bb |   27 +++++++++
 .../openmoko-icon-theme-standard2-qvga_svn.bb      |   58 ++++++++++++++++++++
 .../openmoko2/openmoko-icon-theme-standard2_svn.bb |   24 ++++++++
 .../openmoko2/openmoko-sound-system2/pulseaudio    |   50 +++++++++++++++++
 .../openmoko2/openmoko-sound-system2/session       |   27 +++++++++
 .../openmoko2/openmoko-sound-system2_0.1.0.bb      |   34 ++++++++++++
 .../openmoko-sound-theme-standard2_svn.bb          |   26 +++++++++
 .../openmoko2/openmoko-theme-standard2-qvga_svn.bb |   27 +++++++++
 .../openmoko2/openmoko-theme-standard2_svn.bb      |   22 ++++++++
 recipes/openmoko-base/openmoko-common_svn.bb       |   21 -------
 .../openmoko-icon-theme-standard_svn.bb            |   19 -------
 recipes/openmoko-base/openmoko-libs_svn.bb         |   32 -----------
 .../openmoko-base/openmoko-sound-system/pulseaudio |   46 ----------------
 .../openmoko-base/openmoko-sound-system/session    |   28 ----------
 .../openmoko-base/openmoko-sound-system_0.1.0.bb   |   31 -----------
 .../openmoko-sound-theme-standard_svn.bb           |   23 --------
 .../openmoko-theme-standard-qvga_svn.bb            |   25 ---------
 .../openmoko-base/openmoko-theme-standard_svn.bb   |   27 ---------
 .../openmoko-examples/openmoko-finger-demo_svn.bb  |    6 --
 .../openmoko-panel-demo-simple_svn.bb              |   20 -------
 .../openmoko-examples/openmoko-panel-demo_svn.bb   |   10 ----
 .../openmoko-stylus-demo-simple_svn.bb             |    6 --
 .../openmoko-examples/openmoko-stylus-demo_svn.bb  |    6 --
 .../diversity-daemon/no-xmmp.patch                 |   24 --------
 recipes/openmoko-projects/diversity-daemon_svn.bb  |   20 -------
 recipes/openmoko-projects/diversity-radar_svn.bb   |   17 ------
 recipes/openmoko2/libjana_svn.bb                   |   29 ----------
 recipes/openmoko2/libmokogsmd2_svn.bb              |    8 ---
 recipes/openmoko2/libmokojournal2_svn.bb           |   12 ----
 recipes/openmoko2/libmokopanelui2_svn.bb           |    8 ---
 recipes/openmoko2/moko-gtk-engine_svn.bb           |   15 -----
 recipes/openmoko2/neod/htc.patch                   |   32 -----------
 recipes/openmoko2/neod/ipaq.patch                  |   32 -----------
 recipes/openmoko2/neod_svn.bb                      |   28 ----------
 recipes/openmoko2/openmoko-asu-om20072-support.bb  |   27 ---------
 recipes/openmoko2/openmoko-common2_svn.bb          |   27 ---------
 .../openmoko-icon-theme-standard2-qvga_svn.bb      |   58 --------------------
 .../openmoko2/openmoko-icon-theme-standard2_svn.bb |   24 --------
 .../openmoko2/openmoko-sound-system2/pulseaudio    |   50 -----------------
 recipes/openmoko2/openmoko-sound-system2/session   |   27 ---------
 recipes/openmoko2/openmoko-sound-system2_0.1.0.bb  |   34 ------------
 .../openmoko-sound-theme-standard2_svn.bb          |   26 ---------
 .../openmoko2/openmoko-theme-standard2-qvga_svn.bb |   27 ---------
 recipes/openmoko2/openmoko-theme-standard2_svn.bb  |   22 --------
 76 files changed, 909 insertions(+), 909 deletions(-)
 delete mode 100644 classes/openmoko-base.bbclass
 delete mode 100644 classes/openmoko.bbclass
 delete mode 100644 classes/openmoko2.bbclass
 create mode 100644 recipes/obsolete/classes/openmoko-base.bbclass
 create mode 100644 recipes/obsolete/classes/openmoko.bbclass
 create mode 100644 recipes/obsolete/classes/openmoko2.bbclass
 create mode 100644 recipes/obsolete/openmoko-base/openmoko-common_svn.bb
 create mode 100644 recipes/obsolete/openmoko-base/openmoko-icon-theme-standard_svn.bb
 create mode 100644 recipes/obsolete/openmoko-base/openmoko-libs_svn.bb
 create mode 100755 recipes/obsolete/openmoko-base/openmoko-sound-system/pulseaudio
 create mode 100644 recipes/obsolete/openmoko-base/openmoko-sound-system/session
 create mode 100644 recipes/obsolete/openmoko-base/openmoko-sound-system_0.1.0.bb
 create mode 100644 recipes/obsolete/openmoko-base/openmoko-sound-theme-standard_svn.bb
 create mode 100644 recipes/obsolete/openmoko-base/openmoko-theme-standard-qvga_svn.bb
 create mode 100644 recipes/obsolete/openmoko-base/openmoko-theme-standard_svn.bb
 create mode 100644 recipes/obsolete/openmoko-examples/openmoko-finger-demo_svn.bb
 create mode 100644 recipes/obsolete/openmoko-examples/openmoko-panel-demo-simple_svn.bb
 create mode 100644 recipes/obsolete/openmoko-examples/openmoko-panel-demo_svn.bb
 create mode 100644 recipes/obsolete/openmoko-examples/openmoko-stylus-demo-simple_svn.bb
 create mode 100644 recipes/obsolete/openmoko-examples/openmoko-stylus-demo_svn.bb
 create mode 100644 recipes/obsolete/openmoko-projects/diversity-daemon/no-xmmp.patch
 create mode 100644 recipes/obsolete/openmoko-projects/diversity-daemon_svn.bb
 create mode 100644 recipes/obsolete/openmoko-projects/diversity-radar_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/libjana_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/libmokogsmd2_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/libmokojournal2_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/libmokopanelui2_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/moko-gtk-engine_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/neod/htc.patch
 create mode 100644 recipes/obsolete/openmoko2/neod/ipaq.patch
 create mode 100644 recipes/obsolete/openmoko2/neod_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/openmoko-asu-om20072-support.bb
 create mode 100644 recipes/obsolete/openmoko2/openmoko-common2_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/openmoko-icon-theme-standard2-qvga_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/openmoko-icon-theme-standard2_svn.bb
 create mode 100755 recipes/obsolete/openmoko2/openmoko-sound-system2/pulseaudio
 create mode 100644 recipes/obsolete/openmoko2/openmoko-sound-system2/session
 create mode 100644 recipes/obsolete/openmoko2/openmoko-sound-system2_0.1.0.bb
 create mode 100644 recipes/obsolete/openmoko2/openmoko-sound-theme-standard2_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/openmoko-theme-standard2-qvga_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/openmoko-theme-standard2_svn.bb
 delete mode 100644 recipes/openmoko-base/openmoko-common_svn.bb
 delete mode 100644 recipes/openmoko-base/openmoko-icon-theme-standard_svn.bb
 delete mode 100644 recipes/openmoko-base/openmoko-libs_svn.bb
 delete mode 100755 recipes/openmoko-base/openmoko-sound-system/pulseaudio
 delete mode 100644 recipes/openmoko-base/openmoko-sound-system/session
 delete mode 100644 recipes/openmoko-base/openmoko-sound-system_0.1.0.bb
 delete mode 100644 recipes/openmoko-base/openmoko-sound-theme-standard_svn.bb
 delete mode 100644 recipes/openmoko-base/openmoko-theme-standard-qvga_svn.bb
 delete mode 100644 recipes/openmoko-base/openmoko-theme-standard_svn.bb
 delete mode 100644 recipes/openmoko-examples/openmoko-finger-demo_svn.bb
 delete mode 100644 recipes/openmoko-examples/openmoko-panel-demo-simple_svn.bb
 delete mode 100644 recipes/openmoko-examples/openmoko-panel-demo_svn.bb
 delete mode 100644 recipes/openmoko-examples/openmoko-stylus-demo-simple_svn.bb
 delete mode 100644 recipes/openmoko-examples/openmoko-stylus-demo_svn.bb
 delete mode 100644 recipes/openmoko-projects/diversity-daemon/no-xmmp.patch
 delete mode 100644 recipes/openmoko-projects/diversity-daemon_svn.bb
 delete mode 100644 recipes/openmoko-projects/diversity-radar_svn.bb
 delete mode 100644 recipes/openmoko2/libjana_svn.bb
 delete mode 100644 recipes/openmoko2/libmokogsmd2_svn.bb
 delete mode 100644 recipes/openmoko2/libmokojournal2_svn.bb
 delete mode 100644 recipes/openmoko2/libmokopanelui2_svn.bb
 delete mode 100644 recipes/openmoko2/moko-gtk-engine_svn.bb
 delete mode 100644 recipes/openmoko2/neod/htc.patch
 delete mode 100644 recipes/openmoko2/neod/ipaq.patch
 delete mode 100644 recipes/openmoko2/neod_svn.bb
 delete mode 100644 recipes/openmoko2/openmoko-asu-om20072-support.bb
 delete mode 100644 recipes/openmoko2/openmoko-common2_svn.bb
 delete mode 100644 recipes/openmoko2/openmoko-icon-theme-standard2-qvga_svn.bb
 delete mode 100644 recipes/openmoko2/openmoko-icon-theme-standard2_svn.bb
 delete mode 100755 recipes/openmoko2/openmoko-sound-system2/pulseaudio
 delete mode 100644 recipes/openmoko2/openmoko-sound-system2/session
 delete mode 100644 recipes/openmoko2/openmoko-sound-system2_0.1.0.bb
 delete mode 100644 recipes/openmoko2/openmoko-sound-theme-standard2_svn.bb
 delete mode 100644 recipes/openmoko2/openmoko-theme-standard2-qvga_svn.bb
 delete mode 100644 recipes/openmoko2/openmoko-theme-standard2_svn.bb

diff --git a/classes/openmoko-base.bbclass b/classes/openmoko-base.bbclass
deleted file mode 100644
index b5459d5..0000000
--- a/classes/openmoko-base.bbclass
+++ /dev/null
@@ -1,22 +0,0 @@
-HOMEPAGE = "http://www.openmoko.org"
-LICENSE ?= "GPL"
-OPENMOKO_RELEASE ?= "OM-2007.2"
-OPENMOKO_MIRROR ?= "svn://svn.openmoko.org/trunk"
-
-def openmoko_base_get_subdir(d):
-    if bb.data.getVar('SECTION', d, 1).find("/") != -1:
-        openmoko, section = bb.data.getVar('SECTION', d, 1).split("/")
-    else:
-        section = bb.data.getVar('SECTION', d, 1)
-    if section == 'base' or section == 'libs': return ""
-    elif section in 'apps tools pim'.split(): return "applications"
-    elif section == "panel-plugin": return "panel-plugins"
-    elif section == "inputmethods": return "inputmethods"
-    else: return section
-
-SUBDIR = "${@openmoko_base_get_subdir(d)}"
-
-SRC_URI = "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE}/${SUBDIR};module=${PN};proto=http"
-S = "${WORKDIR}/${PN}"
-
-FILES_${PN} += "${datadir}/icons"
diff --git a/classes/openmoko.bbclass b/classes/openmoko.bbclass
deleted file mode 100644
index 808ab8f..0000000
--- a/classes/openmoko.bbclass
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit openmoko-base autotools pkgconfig
-
-DEPENDS_prepend = "${@["openmoko-libs ", ""][(bb.data.getVar('PN', d, 1) == 'openmoko-libs')]}"
diff --git a/classes/openmoko2.bbclass b/classes/openmoko2.bbclass
deleted file mode 100644
index 25dea82..0000000
--- a/classes/openmoko2.bbclass
+++ /dev/null
@@ -1,37 +0,0 @@
-inherit autotools pkgconfig
-
-HOMEPAGE = "http://www.openmoko.org"
-OPENMOKO_RELEASE ?= "OM-2007.2"
-OPENMOKO_MIRROR ?= "svn://svn.openmoko.org/trunk"
-
-def openmoko_two_get_license(d):
-    if bb.data.getVar('SECTION', d, 1).find("/") != -1:
-    	openmoko, section = bb.data.getVar('SECTION', d, 1).split("/")
-    else:
-        section = bb.data.getVar('SECTION', d, 1)	
-    return "LGPL GPL".split()[section != "libs"]
-
-def openmoko_two_get_subdir(d):
-    if bb.data.getVar('SECTION', d, 1).find("/") != -1:
-        openmoko, section = bb.data.getVar('SECTION', d, 1).split("/")
-    else:
-        section = bb.data.getVar('SECTION', d, 1)
-    if section == 'base': return ""
-    elif section == 'libs': return "libraries"
-    elif section in 'apps tools pim'.split(): return "applications"
-    elif section == "panel-plugin": return "panel-plugins"
-    elif section == "inputmethods": return "inputmethods"
-    elif section == "daemons": return "daemons"
-    elif section == "misc": return "misc"
-    else: return section
-
-LICENSE = "${@openmoko_two_get_license(d)}"
-SUBDIR = "${@openmoko_two_get_subdir(d)}"
-
-SRC_URI = "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE}/${SUBDIR};module=${PN};proto=http"
-S = "${WORKDIR}/${PN}"
-
-FILES_${PN} += "${datadir}/icons"
-
-SVNREV = "r${SRCREV}"
-#SVNREV = "${SRCDATE}"
diff --git a/recipes/obsolete/classes/openmoko-base.bbclass b/recipes/obsolete/classes/openmoko-base.bbclass
new file mode 100644
index 0000000..b5459d5
--- /dev/null
+++ b/recipes/obsolete/classes/openmoko-base.bbclass
@@ -0,0 +1,22 @@
+HOMEPAGE = "http://www.openmoko.org"
+LICENSE ?= "GPL"
+OPENMOKO_RELEASE ?= "OM-2007.2"
+OPENMOKO_MIRROR ?= "svn://svn.openmoko.org/trunk"
+
+def openmoko_base_get_subdir(d):
+    if bb.data.getVar('SECTION', d, 1).find("/") != -1:
+        openmoko, section = bb.data.getVar('SECTION', d, 1).split("/")
+    else:
+        section = bb.data.getVar('SECTION', d, 1)
+    if section == 'base' or section == 'libs': return ""
+    elif section in 'apps tools pim'.split(): return "applications"
+    elif section == "panel-plugin": return "panel-plugins"
+    elif section == "inputmethods": return "inputmethods"
+    else: return section
+
+SUBDIR = "${@openmoko_base_get_subdir(d)}"
+
+SRC_URI = "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE}/${SUBDIR};module=${PN};proto=http"
+S = "${WORKDIR}/${PN}"
+
+FILES_${PN} += "${datadir}/icons"
diff --git a/recipes/obsolete/classes/openmoko.bbclass b/recipes/obsolete/classes/openmoko.bbclass
new file mode 100644
index 0000000..808ab8f
--- /dev/null
+++ b/recipes/obsolete/classes/openmoko.bbclass
@@ -0,0 +1,3 @@
+inherit openmoko-base autotools pkgconfig
+
+DEPENDS_prepend = "${@["openmoko-libs ", ""][(bb.data.getVar('PN', d, 1) == 'openmoko-libs')]}"
diff --git a/recipes/obsolete/classes/openmoko2.bbclass b/recipes/obsolete/classes/openmoko2.bbclass
new file mode 100644
index 0000000..25dea82
--- /dev/null
+++ b/recipes/obsolete/classes/openmoko2.bbclass
@@ -0,0 +1,37 @@
+inherit autotools pkgconfig
+
+HOMEPAGE = "http://www.openmoko.org"
+OPENMOKO_RELEASE ?= "OM-2007.2"
+OPENMOKO_MIRROR ?= "svn://svn.openmoko.org/trunk"
+
+def openmoko_two_get_license(d):
+    if bb.data.getVar('SECTION', d, 1).find("/") != -1:
+    	openmoko, section = bb.data.getVar('SECTION', d, 1).split("/")
+    else:
+        section = bb.data.getVar('SECTION', d, 1)	
+    return "LGPL GPL".split()[section != "libs"]
+
+def openmoko_two_get_subdir(d):
+    if bb.data.getVar('SECTION', d, 1).find("/") != -1:
+        openmoko, section = bb.data.getVar('SECTION', d, 1).split("/")
+    else:
+        section = bb.data.getVar('SECTION', d, 1)
+    if section == 'base': return ""
+    elif section == 'libs': return "libraries"
+    elif section in 'apps tools pim'.split(): return "applications"
+    elif section == "panel-plugin": return "panel-plugins"
+    elif section == "inputmethods": return "inputmethods"
+    elif section == "daemons": return "daemons"
+    elif section == "misc": return "misc"
+    else: return section
+
+LICENSE = "${@openmoko_two_get_license(d)}"
+SUBDIR = "${@openmoko_two_get_subdir(d)}"
+
+SRC_URI = "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE}/${SUBDIR};module=${PN};proto=http"
+S = "${WORKDIR}/${PN}"
+
+FILES_${PN} += "${datadir}/icons"
+
+SVNREV = "r${SRCREV}"
+#SVNREV = "${SRCDATE}"
diff --git a/recipes/obsolete/openmoko-base/openmoko-common_svn.bb b/recipes/obsolete/openmoko-base/openmoko-common_svn.bb
new file mode 100644
index 0000000..7f1be74
--- /dev/null
+++ b/recipes/obsolete/openmoko-base/openmoko-common_svn.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Common files for the Openmoko distribution"
+SECTION = "openmoko/base"
+PV = "0.0+svnr${SRCPV}"
+PR = "r1"
+
+inherit openmoko-base
+
+SRC_URI = "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE}/artwork;module=images;proto=http"
+S = "${WORKDIR}"
+
+dirs = "images/pixmaps"
+
+do_install() {
+	find ${WORKDIR} -name ".svn" | xargs rm -rf
+	install -d ${D}${datadir}/openmoko/
+	for i in ${dirs}; do
+		cp -fpPR ${S}/$i ${D}${datadir}/openmoko/
+	done
+}
+
+FILES_${PN} = "${datadir}"
diff --git a/recipes/obsolete/openmoko-base/openmoko-icon-theme-standard_svn.bb b/recipes/obsolete/openmoko-base/openmoko-icon-theme-standard_svn.bb
new file mode 100644
index 0000000..0d8a627
--- /dev/null
+++ b/recipes/obsolete/openmoko-base/openmoko-icon-theme-standard_svn.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Standard Gtk+ icon theme for the Openmoko distribution"
+SECTION = "openmoko/base"
+PV = "0.1+svnr${SRCPV}"
+PR = "r1"
+
+inherit openmoko-base autotools
+
+SRC_URI = "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE}/artwork;module=icons;proto=http"
+S = "${WORKDIR}/icons"
+
+pkg_postinst_openmoko-icon-theme-standard () {
+#!/bin/sh -e
+if [ "x$D" != "x" ]; then
+    exit 1
+fi
+gtk-update-icon-cache ${datadir}/icons/openmoko-standard/
+}
+
+PACKAGE_ARCH = "all"
diff --git a/recipes/obsolete/openmoko-base/openmoko-libs_svn.bb b/recipes/obsolete/openmoko-base/openmoko-libs_svn.bb
new file mode 100644
index 0000000..42d6b8f
--- /dev/null
+++ b/recipes/obsolete/openmoko-base/openmoko-libs_svn.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "openmoko-libs is a set of libraries implementing a Gtk+ based application framework for mobile communication applications"
+SECTION = "openmoko/libs"
+LICENSE = "LGPL"
+DEPENDS += "gtk+ eds-dbus libgsmd libxosd"
+PV = "0.4+svnr${SRCPV}"
+PR = "r0"
+
+inherit openmoko
+
+PACKAGES =+ "\
+  libmokojournal libmokojournal-dev libmokojournal-dbg \
+  libmokogsmd libmokogsmd-dev libmokogsmd-dbg \
+  libmokocore libmokocore-dev libmokocore-dbg \
+  libmokoui libmokoui-dev libmokoui-dbg \
+"
+
+FILES_libmokojournal = "${libdir}/libmokojournal.so.*"
+FILES_libmokojournal-dev = "${libdir}/libmokojournal.so ${libdir}/libmokojournal.*a ${includedir}/${PN}/libmokojournal"
+FILES_libmokojournal-dbg += "${libdir}/.debug/libmokojournal.so.*"
+
+FILES_libmokogsmd = "${libdir}/libmokogsmd.so.*"
+FILES_libmokogsmd-dev = "${libdir}/libmokogsmd.so ${libdir}/libmokogsmd.*a ${includedir}/${PN}/libmokogsmd"
+FILES_libmokogsmd-dbg += "${libdir}/.debug/libmokogsmd.so.*"
+
+FILES_libmokocore = "${libdir}/libmokocore.so.*"
+FILES_libmokocore-dev = "${libdir}/libmokocore.so ${libdir}/libmokocore.*a ${includedir}/${PN}/libmokocore"
+FILES_libmokocore-dbg += "${libdir}/.debug/libmokocore.so.*"
+ 	 
+FILES_libmokoui = "${libdir}/libmokoui.so.*"
+FILES_libmokoui-dev = "${libdir}/libmokoui.so ${libdir}/libmokoui.*a ${includedir}/${PN}/libmokoui"
+FILES_libmokoui-dbg += "${libdir}/.debug/libmokoui.so.*"
+  	 
diff --git a/recipes/obsolete/openmoko-base/openmoko-sound-system/pulseaudio b/recipes/obsolete/openmoko-base/openmoko-sound-system/pulseaudio
new file mode 100755
index 0000000..76daacd
--- /dev/null
+++ b/recipes/obsolete/openmoko-base/openmoko-sound-system/pulseaudio
@@ -0,0 +1,46 @@
+#!/bin/sh
+#
+# pulseaudio	This shell script starts and stops pulseaudio.
+#
+# chkconfig: 345 90 40
+# description: Pulseaudio manages the sound input/output
+# processname: pulseaudio
+
+# Source function library.
+#. /etc/rc.d/init.d/functions
+
+RETVAL=0
+prog="pulseaudio"
+
+start() {
+    echo -n "Starting the audio server..."
+    # FIXME once alsa/shm permissions have been fixed, supply --system
+	pulseaudio --resample-method=trivial -D -nF /etc/pulse/session
+	echo $prog
+}
+
+stop() {
+	# Stop daemons.
+	echo -n "Shutting down $prog: "
+	killall pulseaudio
+    echo "done"
+}
+
+# See how we were called.
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  restart|reload)
+	stop
+	start
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $RETVAL
diff --git a/recipes/obsolete/openmoko-base/openmoko-sound-system/session b/recipes/obsolete/openmoko-base/openmoko-sound-system/session
new file mode 100644
index 0000000..ed2346d
--- /dev/null
+++ b/recipes/obsolete/openmoko-base/openmoko-sound-system/session
@@ -0,0 +1,28 @@
+#!/usr/bin/pulseaudio -nF
+
+# Create autoload entries for the device drivers
+add-autoload-sink output module-alsa-sink fragment_size=2048 sink_name=output
+add-autoload-source input module-alsa-source source_name=input
+
+# Load several protocols
+load-module module-esound-protocol-unix
+load-module module-simple-protocol-tcp
+load-module module-native-protocol-unix
+load-module module-cli-protocol-unix
+
+# Make some devices default
+set-default-sink output
+set-default-source input
+
+# Don't fail if the audio files referred to below don't exist
+.nofail
+
+# Load an audio to the sample cache for usage with module-x11-bell
+load-sample-lazy x11-bell /usr/share/openmoko/sounds/notify_doorbell.wav
+load-module module-x11-bell sample=x11-bell
+
+# Load samples
+load-sample startup /usr/share/openmoko/sounds/startup_unintrusive.wav
+load-sample touchscreen /usr/share/openmoko/sounds/touchscreen_click.wav
+load-sample ringtone /usr/share/openmoko/sounds/ringtone_classy.wav
+
diff --git a/recipes/obsolete/openmoko-base/openmoko-sound-system_0.1.0.bb b/recipes/obsolete/openmoko-base/openmoko-sound-system_0.1.0.bb
new file mode 100644
index 0000000..2ada84f
--- /dev/null
+++ b/recipes/obsolete/openmoko-base/openmoko-sound-system_0.1.0.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Openmoko Sound System"
+SECTION = "openmoko/base"
+RDEPENDS_${PN} = "\
+  pulseaudio-server \
+  pulseaudio-module-alsa-sink \
+  pulseaudio-module-alsa-source \
+  pulseaudio-module-cli \
+  pulseaudio-module-esound-protocol-unix \
+  pulseaudio-module-simple-protocol-tcp \
+  pulseaudio-module-native-protocol-unix \
+  pulseaudio-module-cli-protocol-unix \
+"
+PR = "r7"
+
+inherit openmoko-base update-rc.d
+
+INITSCRIPT_NAME = "pulseaudio"
+INITSCRIPT_PARAMS = "defaults 35"
+
+SRC_URI = "file://pulseaudio \
+           file://session"
+S = "${WORKDIR}"
+
+do_install() {
+    install -d ${D}/${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/pulseaudio ${D}/${sysconfdir}/init.d/
+    install -d ${D}/${sysconfdir}/pulse
+	install -m 0755 ${WORKDIR}/session ${D}/${sysconfdir}/pulse/session
+}
+
+PACKAGE_ARCH = "all"
diff --git a/recipes/obsolete/openmoko-base/openmoko-sound-theme-standard_svn.bb b/recipes/obsolete/openmoko-base/openmoko-sound-theme-standard_svn.bb
new file mode 100644
index 0000000..2c61036
--- /dev/null
+++ b/recipes/obsolete/openmoko-base/openmoko-sound-theme-standard_svn.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Standard sound theme for the Openmoko distribution"
+SECTION = "openmoko/base"
+PV = "0.1+svnr${SRCPV}"
+PR = "r2"
+
+inherit openmoko-base autotools
+
+SRC_URI = "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE}/artwork;module=sounds;proto=http"
+S = "${WORKDIR}/sounds"
+
+do_install() {
+        find ${WORKDIR} -name ".svn" | xargs rm -rf
+        install -d ${D}${datadir}/openmoko/sounds
+        for i in *.mp3; do
+                cp -fpPR ${S}/$i ${D}${datadir}/openmoko/sounds/
+        done
+        for i in touchscreen_click.wav ringtone_classy.wav notify_doorbell.wav startup_unintrusive.wav; do
+                cp -f ${S}/$i ${D}${datadir}/openmoko/sounds/
+        done
+}
+
+FILES_${PN} = "${datadir}"
+
diff --git a/recipes/obsolete/openmoko-base/openmoko-theme-standard-qvga_svn.bb b/recipes/obsolete/openmoko-base/openmoko-theme-standard-qvga_svn.bb
new file mode 100644
index 0000000..c7256a9
--- /dev/null
+++ b/recipes/obsolete/openmoko-base/openmoko-theme-standard-qvga_svn.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Standard Gtk+ theme for the Openmoko distribution, qvga version"
+SECTION = "openmoko/base"
+PV = "0.0+svnr${SRCPV}"
+PR = "r0"
+
+inherit openmoko-base
+
+SRC_URI = "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE}/artwork;module=themes;proto=http"
+S = "${WORKDIR}"
+
+dirs = "themes/openmoko-standard-qvga"
+
+do_install() {
+	find ${WORKDIR} -name ".svn" | xargs rm -rf
+	install -d ${D}${datadir}/themes/
+	for i in ${dirs}; do
+		cp -fpPR ${WORKDIR}/$i ${D}${datadir}/themes/
+	done
+	
+	install -d ${D}${sysconfdir}/gtk-2.0
+	echo 'include "${datadir}/themes/openmoko-standard-qvga/gtk-2.0/gtkrc"' >> ${D}${sysconfdir}/gtk-2.0/gtkrc
+}
+
+PACKAGE_ARCH = "all"
+FILES_${PN} = "${datadir} ${sysconfdir}"
diff --git a/recipes/obsolete/openmoko-base/openmoko-theme-standard_svn.bb b/recipes/obsolete/openmoko-base/openmoko-theme-standard_svn.bb
new file mode 100644
index 0000000..606d6a03
--- /dev/null
+++ b/recipes/obsolete/openmoko-base/openmoko-theme-standard_svn.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Standard Gtk+ theme for the Openmoko distribution"
+SECTION = "openmoko/base"
+PV = "0.0+svnr${SRCPV}"
+PR = "r5"
+
+inherit openmoko-base
+
+SRC_URI = "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE}/artwork;module=themes;proto=http"
+S = "${WORKDIR}"
+
+dirs = "themes/openmoko-standard"
+
+do_install() {
+	find ${WORKDIR} -name ".svn" | xargs rm -rf
+	install -d ${D}${datadir}/themes/
+	for i in ${dirs}; do
+		cp -fpPR ${WORKDIR}/$i ${D}${datadir}/themes/
+	done
+	
+	install -d ${D}${sysconfdir}/gtk-2.0
+	echo 'include "${datadir}/themes/openmoko-standard/gtk-2.0/gtkrc"' >> ${D}${sysconfdir}/gtk-2.0/gtkrc
+}
+
+CONFFILES_${PN} = "${sysconfdir}/gtk-2.0/gtkrc"
+
+PACKAGE_ARCH = "all"
+FILES_${PN} = "${datadir} ${sysconfdir}"
diff --git a/recipes/obsolete/openmoko-examples/openmoko-finger-demo_svn.bb b/recipes/obsolete/openmoko-examples/openmoko-finger-demo_svn.bb
new file mode 100644
index 0000000..a5c7c62
--- /dev/null
+++ b/recipes/obsolete/openmoko-examples/openmoko-finger-demo_svn.bb
@@ -0,0 +1,6 @@
+DESCRIPTION = "An example finger application for Openmoko"
+SECTION = "openmoko/examples"
+PV = "0.0.1+svnr${SRCPV}"
+
+inherit openmoko
+
diff --git a/recipes/obsolete/openmoko-examples/openmoko-panel-demo-simple_svn.bb b/recipes/obsolete/openmoko-examples/openmoko-panel-demo-simple_svn.bb
new file mode 100644
index 0000000..82e5c61
--- /dev/null
+++ b/recipes/obsolete/openmoko-examples/openmoko-panel-demo-simple_svn.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "A simple example panel plugin for Openmoko"
+SECTION = "openmoko/examples"
+DEPENDS += "libmatchbox"
+SRCREV = "1328"
+PV = "0.0.1+svnr${SRCPV}"
+
+PR = "r1"
+
+inherit openmoko
+
+do_configure_prepend() {
+	sed -i -e s:-Werror::g src/Makefile.am
+}	
+
+
+FILES_${PN} += "${libdir}/matchbox-panel/*.so.*"
+FILES_${PN}-dev += "${libdir}/matchbox-panel/*.so \
+                    ${libdir}/matchbox-panel/*.la"
+FILES_${PN}-dbg += "${libdir}/matchbox-panel/.debug"
+
diff --git a/recipes/obsolete/openmoko-examples/openmoko-panel-demo_svn.bb b/recipes/obsolete/openmoko-examples/openmoko-panel-demo_svn.bb
new file mode 100644
index 0000000..8e9a501
--- /dev/null
+++ b/recipes/obsolete/openmoko-examples/openmoko-panel-demo_svn.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "An example panel plugin for Openmoko"
+SECTION = "openmoko/examples"
+DEPENDS += "libmatchbox"
+SRCREV = "1622"
+PV = "0.0.1+svnr${SRCPV}"
+
+inherit openmoko
+
+PARALLEL_MAKE = ""
+
diff --git a/recipes/obsolete/openmoko-examples/openmoko-stylus-demo-simple_svn.bb b/recipes/obsolete/openmoko-examples/openmoko-stylus-demo-simple_svn.bb
new file mode 100644
index 0000000..08b72f8
--- /dev/null
+++ b/recipes/obsolete/openmoko-examples/openmoko-stylus-demo-simple_svn.bb
@@ -0,0 +1,6 @@
+DESCRIPTION = "A simple stylus application example for Openmoko"
+SECTION = "openmoko/examples"
+PV = "0.0.1+svnr${SRCPV}"
+
+inherit openmoko
+
diff --git a/recipes/obsolete/openmoko-examples/openmoko-stylus-demo_svn.bb b/recipes/obsolete/openmoko-examples/openmoko-stylus-demo_svn.bb
new file mode 100644
index 0000000..550324a
--- /dev/null
+++ b/recipes/obsolete/openmoko-examples/openmoko-stylus-demo_svn.bb
@@ -0,0 +1,6 @@
+DESCRIPTION = "An example stylus application for Openmoko"
+SECTION = "openmoko/examples"
+PV = "0.0.1+svnr${SRCPV}"
+
+inherit openmoko
+
diff --git a/recipes/obsolete/openmoko-projects/diversity-daemon/no-xmmp.patch b/recipes/obsolete/openmoko-projects/diversity-daemon/no-xmmp.patch
new file mode 100644
index 0000000..2065e97
--- /dev/null
+++ b/recipes/obsolete/openmoko-projects/diversity-daemon/no-xmmp.patch
@@ -0,0 +1,24 @@
+Index: diversity-xmpp-backend/Makefile.am
+===================================================================
+--- a/diversity-xmpp-backend/Makefile.am	(revision 276)
++++ a/diversity-xmpp-backend/Makefile.am	(working copy)
+@@ -1,3 +1,4 @@
++if HAVE_XMPP
+ INCLUDES = -I${top_srcdir}/include
+ 
+ AM_CPPFLAGS =			\
+@@ -4,9 +5,7 @@
+ 	$(GLIB_CFLAGS)		\
+ 	$(LM_CFLAGS)
+ 
+-if HAVE_XMPP
+ noinst_LTLIBRARIES = libdiversity-xmpp-backend.la
+-endif
+ 
+ noinst_HEADERS = diversity-xmpp-backend.h
+ 
+@@ -48,3 +47,4 @@
+ 
+ xmpp-marshal.h: xmpp-marshal.list
+ 	$(GLIB_GENMARSHAL) --prefix xmpp_marshal --header $< > $@
++endif
diff --git a/recipes/obsolete/openmoko-projects/diversity-daemon_svn.bb b/recipes/obsolete/openmoko-projects/diversity-daemon_svn.bb
new file mode 100644
index 0000000..ab06fde
--- /dev/null
+++ b/recipes/obsolete/openmoko-projects/diversity-daemon_svn.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Diversity Daemon"
+HOMEPAGE = "http://diversity.projects.openmoko.org/"
+SECTION = "network/misc"
+LICENSE = "GPL"
+DEPENDS = "glib-2.0 dbus dbus-glib eds-dbus libjana curl"
+RDEPENDS_${PN} = "eds-dbus"
+SRCREV = "571"
+PV = "0.0+svnr${SRCPV}"
+PR = "r3"
+
+SRC_URI = "svn://svn.projects.openmoko.org/svnroot/diversity/trunk;module=diversity-daemon;proto=http \
+           file://no-xmmp.patch;minrev=276;maxrev=568"
+S = "${WORKDIR}/diversity-daemon"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--disable-nm --disable-xmpp --enable-session-bus"
+
+FILES_${PN} += "${datadir}/dbus-1/"
+FILES_${PN} += "${sysconfdir}/dbus-1/"
diff --git a/recipes/obsolete/openmoko-projects/diversity-radar_svn.bb b/recipes/obsolete/openmoko-projects/diversity-radar_svn.bb
new file mode 100644
index 0000000..b5f4e77
--- /dev/null
+++ b/recipes/obsolete/openmoko-projects/diversity-radar_svn.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Diversity Radar is a GPS location based communicative application"
+HOMEPAGE = "http://diversity.projects.openmoko.org/"
+SECTION = "openmoko/applications"
+LICENSE = "GPL"
+DEPENDS = "python-evas python-edje python-ecore python-edbus python-dbus"
+RDEPENDS_${PN} = "diversity-daemon"
+SRCREV = "510"
+PV = "0.0.4+svnr${SRCPV}"
+PR = "r0.02"
+
+SRC_URI = "svn://svn.projects.openmoko.org/svnroot/diversity/toys;module=diversity-radar;proto=http"
+
+S = "${WORKDIR}/${PN}"
+
+inherit setuptools
+
+FILES_${PN} += "${prefix}/share/*"
diff --git a/recipes/obsolete/openmoko2/libjana_svn.bb b/recipes/obsolete/openmoko2/libjana_svn.bb
new file mode 100644
index 0000000..c73a319
--- /dev/null
+++ b/recipes/obsolete/openmoko2/libjana_svn.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "O-Hand Jana Library"
+DEPENDS = "libmokojournal2"
+DEPENDS = "gtk+ eds-dbus gconf" 
+SRCREV = "749"
+PV = "0.1.0+svnr${SRCPV}"
+PR = "r5"
+
+inherit autotools pkgconfig lib_package
+
+SRC_URI = "svn://svn.gnome.org/svn/jana/;module=trunk;proto=http"
+S = "${WORKDIR}/trunk/"
+
+EXTRA_OECONF = "--enable-examples "
+
+do_configure_prepend() {
+	touch gtk-doc.make
+}
+
+PACKAGES =+ "libjana-ecal libjana-ecal-dbg \
+             libjana-gtk libjana-gtk-dbg \ 
+            "
+
+LEAD_SONAME = "libjana.so"
+
+FILES_libjana-ecal = "${libdir}/libjana-ecal.so.*"
+FILES_libjana-ecal-dbg += "${libdir}/.debug/libjana-ecal*"
+FILES_libjana-gtk = "${libdir}/libjana-gtk.so.* ${datadir}/jana/landwater.vmf"
+FILES_libjana-gtk-dbg += "${libdir}/.debug/libjana-gtk.so.*"
+FILES_libjana-bin_append = " ${datadir}/jana/flag-uk.png "
diff --git a/recipes/obsolete/openmoko2/libmokogsmd2_svn.bb b/recipes/obsolete/openmoko2/libmokogsmd2_svn.bb
new file mode 100644
index 0000000..3fa20e9
--- /dev/null
+++ b/recipes/obsolete/openmoko2/libmokogsmd2_svn.bb
@@ -0,0 +1,8 @@
+SECTION = "openmoko/libs"
+DEPENDS = "libgsmd glib-2.0"
+SRCREV = "4334"
+PV = "0.1.0+svnr${SRCPV}"
+PR = "r2"
+
+inherit openmoko2
+
diff --git a/recipes/obsolete/openmoko2/libmokojournal2_svn.bb b/recipes/obsolete/openmoko2/libmokojournal2_svn.bb
new file mode 100644
index 0000000..ea56046
--- /dev/null
+++ b/recipes/obsolete/openmoko2/libmokojournal2_svn.bb
@@ -0,0 +1,12 @@
+SECTION = "openmoko/libs"
+DEPENDS = "eds-dbus"
+SRCREV = "3473"
+PV = "0.1.0+svnr${SRCPV}"
+PR = "r2"
+
+inherit openmoko2 lib_package
+
+do_configure_prepend() {
+        touch gtk-doc.make
+}
+
diff --git a/recipes/obsolete/openmoko2/libmokopanelui2_svn.bb b/recipes/obsolete/openmoko2/libmokopanelui2_svn.bb
new file mode 100644
index 0000000..2a3a1c5
--- /dev/null
+++ b/recipes/obsolete/openmoko2/libmokopanelui2_svn.bb
@@ -0,0 +1,8 @@
+SECTION = "openmoko/libs"
+DEPENDS = "gtk+ matchbox-panel-2"
+SRCREV = "4568"
+PV = "0.3.0+svnr${SRCPV}"
+PR = "r0"
+
+inherit openmoko2
+
diff --git a/recipes/obsolete/openmoko2/moko-gtk-engine_svn.bb b/recipes/obsolete/openmoko2/moko-gtk-engine_svn.bb
new file mode 100644
index 0000000..72c0c23
--- /dev/null
+++ b/recipes/obsolete/openmoko2/moko-gtk-engine_svn.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Moko GTK+ theme engine"
+SECTION = "openmoko/libs"
+SRCREV = "4734"
+PV = "0.1.0+svnr${SRCPV}"
+PR = "r0"
+
+inherit openmoko2
+
+PACKAGES += "moko-gtk-theme"
+FILES_${PN} = "${libdir}/gtk-2.0/*/engines/*.so "
+FILES_${PN}-dev = "${libdir}/gtk-2.0/*/engines/*"
+FILES_${PN}-dbg += "${libdir}/gtk-2.0/*/engines/.debug"
+FILES_moko-gtk-theme = "${datadir}/themes"
+RDEPENDS_${PN} = "moko-gtk-theme"
+
diff --git a/recipes/obsolete/openmoko2/neod/htc.patch b/recipes/obsolete/openmoko2/neod/htc.patch
new file mode 100644
index 0000000..0ced894
--- /dev/null
+++ b/recipes/obsolete/openmoko2/neod/htc.patch
@@ -0,0 +1,32 @@
+Index: neod/configure.ac
+===================================================================
+--- neod.orig/configure.ac	2007-09-15 23:01:30.000000000 +0200
++++ neod/configure.ac	2007-09-15 23:02:01.000000000 +0200
+@@ -32,6 +32,10 @@
+         NEOD_CFLAGS="$NEOD_CFLAGS -DNEOD_PLATFORM_MOTOROLA_EZX"
+ fi
+ 
++if test x"$neod_platform" = x"htc"; then
++	NEOD_CFLAGS="$NEOD_CFLAGS -DNEOD_PLATFORM_HTC"
++fi
++
+ CFLAGS=$NEOD_CFLAGS
+ 
+ AC_OUTPUT([
+Index: neod/src/buttonactions.c
+===================================================================
+--- neod.orig/src/buttonactions.c	2007-09-15 23:02:15.000000000 +0200
++++ neod/src/buttonactions.c	2007-09-15 23:04:16.000000000 +0200
+@@ -63,6 +63,12 @@
+     #define TOUCHSCREEN_BUTTON_KEYCODE 0x14a
+ #endif
+ 
++#ifdef NEOD_PLATFORM_HTC
++    #define AUX_BUTTON_KEYCODE 0xd4   /* camera */
++    #define POWER_BUTTON_KEYCODE 0x74 /* power */
++    #define TOUCHSCREEN_BUTTON_KEYCODE 0x14a
++#endif
++
+ #define HEADPHONE_INSERTION_SWITCHCODE 0x02
+ 
+ GPollFD input_fd[10];
diff --git a/recipes/obsolete/openmoko2/neod/ipaq.patch b/recipes/obsolete/openmoko2/neod/ipaq.patch
new file mode 100644
index 0000000..19b61ab
--- /dev/null
+++ b/recipes/obsolete/openmoko2/neod/ipaq.patch
@@ -0,0 +1,32 @@
+Index: neod/src/buttonactions.c
+===================================================================
+--- neod.orig/src/buttonactions.c	2007-09-29 17:24:43.000000000 +0200
++++ neod/src/buttonactions.c	2007-09-29 17:24:49.000000000 +0200
+@@ -69,6 +69,12 @@
+     #define TOUCHSCREEN_BUTTON_KEYCODE 0x14a
+ #endif
+ 
++#ifdef NEOD_PLATFORM_IPAQ
++    #define AUX_BUTTON_KEYCODE 89   /* _KEY_RECORD */
++    #define POWER_BUTTON_KEYCODE 0x74 /* KEY_POWER */
++    #define TOUCHSCREEN_BUTTON_KEYCODE 0x14a
++#endif
++
+ #define HEADPHONE_INSERTION_SWITCHCODE 0x02
+ 
+ GPollFD input_fd[10];
+Index: neod/configure.ac
+===================================================================
+--- neod.orig/configure.ac	2007-09-29 17:25:12.000000000 +0200
++++ neod/configure.ac	2007-09-29 17:25:48.000000000 +0200
+@@ -36,6 +36,10 @@
+ 	NEOD_CFLAGS="$NEOD_CFLAGS -DNEOD_PLATFORM_HTC"
+ fi
+ 
++if test x"$neod_platform" = x"ipaq"; then
++	NEOD_CFLAGS="$NEOD_CFLAGS -DNEOD_PLATFORM_IPAQ"
++fi
++
+ CFLAGS=$NEOD_CFLAGS
+ 
+ AC_OUTPUT([
diff --git a/recipes/obsolete/openmoko2/neod_svn.bb b/recipes/obsolete/openmoko2/neod_svn.bb
new file mode 100644
index 0000000..d3e4cd9
--- /dev/null
+++ b/recipes/obsolete/openmoko2/neod_svn.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Simple Neo1973 Daemon for Button Handling and Power Management"
+SECTION = "openmoko/daemons"
+
+DISTRO_APM ?= "apm"
+DEPENDS = "gtk+ pulseaudio apmd"
+RDEPENDS_${PN} = "gpe-scap xrandr alsa-utils-amixer ${DISTRO_APM} dbus"
+SRCREV = "4617"
+PV = "0.1.0+svnr${SRCPV}"
+PR = "r8"
+
+inherit openmoko2 gconf
+
+SRC_URI += "file://htc.patch;maxrev=3348 \
+            file://ipaq.patch;maxrev=3348"
+
+EXTRA_OECONF_om-gta01 = "--with-platform=neo1973"
+EXTRA_OECONF_om-gta02 = "--with-platform=neo1973"
+EXTRA_OECONF_a780      = "--with-platform=ezx"
+EXTRA_OECONF_a1200     = "--with-platform=ezx"
+EXTRA_OECONF_e680      = "--with-platform=ezx"
+EXTRA_OECONF_rokre2    = "--with-platform=ezx"
+EXTRA_OECONF_rokre6    = "--with-platform=ezx"
+EXTRA_OECONF_magician  = "--with-platform=htc"
+EXTRA_OECONF_hx4700    = "--with-platform=ipaq"
+EXTRA_OECONF_htcuniversal = "--with-platform=htc"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
diff --git a/recipes/obsolete/openmoko2/openmoko-asu-om20072-support.bb b/recipes/obsolete/openmoko2/openmoko-asu-om20072-support.bb
new file mode 100644
index 0000000..9b0847f
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-asu-om20072-support.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Theme support and defaults to integrate OM2007.2 in the April Software Update"
+LICENSE = "GPL"
+SECTION = "x11"
+RDEPENDS_${PN} = "openmoko-common2"
+
+ALLOW_EMPTY_${PN} = "1"
+PACKAGE_ARCH = "all"
+
+pkg_postinst_${PN} () {
+#!/bin/sh -e
+if [ "x$D" != "x" ]; then
+    exit 1
+fi
+
+gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/theme Moko
+gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/icon_theme openmoko-standard
+gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/font_name "Sans 5"
+gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/wallpaper ${datadir}/pixmaps/wallpaper.png
+gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type bool --set /desktop/poky/interface/digital_clock 1
+gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type int --set /desktop/poky/peripherals/mouse/drag_threshold 8
+gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type int --set /desktop/openmoko/neod/power_management 2
+# gstreamer audio settings
+#gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct -t string --set /system/gstreamer/0.10/default/audiosink pulsesink
+#gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct -t string --set /system/gstreamer/0.10/default/audiosrc pulsesrc
+
+}
+
diff --git a/recipes/obsolete/openmoko2/openmoko-common2_svn.bb b/recipes/obsolete/openmoko2/openmoko-common2_svn.bb
new file mode 100644
index 0000000..5558e4f
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-common2_svn.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Common files for the Openmoko framework"
+SECTION = "openmoko/base"
+SRCREV = "3259"
+PV = "0.1.0+svnr${SRCPV}"
+PR = "r0"
+
+inherit openmoko2
+
+SRC_URI = "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE}/artwork;module=pixmaps;proto=http"
+S = "${WORKDIR}"
+
+ALLOW_EMPTY = "1"
+
+dirs = "pixmaps"
+
+do_install() {
+	find . -name .svn | xargs rm -rf
+	install -d ${D}${datadir}
+	for i in ${dirs}; do
+		cp -fR $i ${D}${datadir}/$i;
+	done
+	# moved to xserver-kdrive-common
+	rm -f ${D}${datadir}/pixmaps/xsplash*
+}
+
+PACKAGE_ARCH = "all"
+FILES_${PN} = "${datadir}"
diff --git a/recipes/obsolete/openmoko2/openmoko-icon-theme-standard2-qvga_svn.bb b/recipes/obsolete/openmoko2/openmoko-icon-theme-standard2-qvga_svn.bb
new file mode 100644
index 0000000..4f37324
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-icon-theme-standard2-qvga_svn.bb
@@ -0,0 +1,58 @@
+DESCRIPTION = "Standard Gtk+ icon theme for the Openmoko framework, QVGA edition"
+SECTION = "openmoko/base"
+DEPENDS = "imagemagick-native librsvg-native"
+SRCREV = "4232"
+PV = "0.1.0+svnr${SRCPV}"
+PR = "r2"
+
+EXCLUDE_FROM_WORLD = "1"
+
+inherit openmoko2
+
+SRC_URI = "svn://svn.openmoko.org/trunk/src/target/OM-2007.2/artwork/;module=icons;proto=http"
+S = "${WORKDIR}/icons"
+
+pkg_postinst_${PN} () {
+    if [ "x$D" != "x" ]; then
+        exit 1
+    fi
+    gtk-update-icon-cache -q /usr/share/icons/openmoko-standard
+}
+
+do_configure_prepend () {
+	cd ${S}
+	#
+	# don't include 36x36 and 128x128 icons, 32x32 and 48x48 stock icons
+	#
+	sed -i -e "/\(36\|128\)/d" -e "/\(32\|48\)\/stock/d" configure.ac
+	cd openmoko-standard
+	sed -i -e "s/\(36x36\|128x128\) //g" Makefile.am
+	sed -i "/^SUBDIRS=/s/ stock//" {32x32,48x48}/Makefile.am 
+	#
+	# rescale stock icons to 22x22
+	#
+	for png in $(ls */stock/*.png | sed "s,.*/,," | sort | uniq); do
+		svg=scalable/stock/$(basename $png .png).svg
+		out=22x22/stock/$png
+		if [ -f $svg ]; then
+			#
+			# if there are vector graphics, rerender
+			#
+			rsvg -w 22 -h 22 $svg $out
+		else
+			#
+			# otherwise rescale biggest existing bitmap
+			#
+			png=$(echo */stock/$png | sed "s/.* //")
+			convert -scale 22x22 $png $out
+		fi
+	done
+	#
+	# register the rescaled icons with automake
+	#
+	cd 22x22/stock
+	sed -i "/^icons_DATA/s/=.*/= $(echo *.png)/" Makefile.am
+	cd ${S}
+}
+
+PACKAGE_ARCH = "all"
diff --git a/recipes/obsolete/openmoko2/openmoko-icon-theme-standard2_svn.bb b/recipes/obsolete/openmoko2/openmoko-icon-theme-standard2_svn.bb
new file mode 100644
index 0000000..c184445
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-icon-theme-standard2_svn.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Standard Gtk+ icon theme for the Openmoko framework"
+HOMEPAGE = "http://www.openmoko.org"
+SECTION = "openmoko/base"
+LICENSE = "GPL"
+
+SRCREV = "4232"
+PV = "0.1.0+svnr${SRCPV}"
+PR = "r3"
+
+inherit autotools pkgconfig
+
+SRC_URI = "svn://svn.openmoko.org/trunk/src/target/OM-2007.2/artwork/;module=icons;proto=http"
+S = "${WORKDIR}/icons"
+
+FILES_${PN} += "${datadir}/icons"
+
+pkg_postinst_${PN} () {
+    if [ "x$D" != "x" ]; then
+        exit 1
+    fi
+    gtk-update-icon-cache -q /usr/share/icons/openmoko-standard
+}
+
+PACKAGE_ARCH = "all"
diff --git a/recipes/obsolete/openmoko2/openmoko-sound-system2/pulseaudio b/recipes/obsolete/openmoko2/openmoko-sound-system2/pulseaudio
new file mode 100755
index 0000000..9649473
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-sound-system2/pulseaudio
@@ -0,0 +1,50 @@
+#!/bin/sh
+#
+# pulseaudio	This shell script starts and stops pulseaudio.
+#
+# chkconfig: 345 90 40
+# description: Pulseaudio manages the sound input/output
+# processname: pulseaudio
+
+# Source function library.
+#. /etc/rc.d/init.d/functions
+
+RETVAL=0
+prog="pulseaudio"
+
+start() {
+    echo -n "Starting audio server: "
+    # FIXME once alsa/shm permissions have been fixed, supply --system
+    start-stop-daemon -S -x /usr/bin/pulseaudio -- --no-cpu-limit --resample-method=trivial -D -nF /etc/pulse/session
+
+    if [ $? = 0 ]; then
+        echo "$prog (warning ignores)." # FIXME remove comment on warning
+    else
+        echo "(failed.)"
+    fi
+}
+
+stop() {
+    echo -n "Stopping audio server: "
+    start-stop-daemon -K -x /usr/bin/pulseaudio
+    echo "pulseaudio."
+}
+
+# See how we were called.
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  restart|reload)
+	stop
+	start
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $RETVAL
diff --git a/recipes/obsolete/openmoko2/openmoko-sound-system2/session b/recipes/obsolete/openmoko2/openmoko-sound-system2/session
new file mode 100644
index 0000000..7cc4d49
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-sound-system2/session
@@ -0,0 +1,27 @@
+#!/usr/bin/pulseaudio -nF
+
+# Create autoload entries for the device drivers
+add-autoload-sink output module-alsa-sink sink_name=output
+add-autoload-source input module-alsa-source source_name=input
+
+# Load several protocols
+load-module module-esound-protocol-unix
+load-module module-native-protocol-unix
+load-module module-cli-protocol-unix
+
+# Make some devices default
+set-default-sink output
+set-default-source input
+
+# Don't fail if the audio files referred to below don't exist
+.nofail
+
+# Load an audio to the sample cache for usage with module-x11-bell
+load-sample-lazy x11-bell /usr/share/openmoko/sounds/notify_doorbell.wav
+load-module module-x11-bell sample=x11-bell
+
+# Load samples
+load-sample startup /usr/share/openmoko/sounds/startup_unintrusive.wav
+load-sample touchscreen /usr/share/openmoko/sounds/touchscreen_click.wav
+load-sample ringtone /usr/share/openmoko/sounds/ringtone_classy.wav
+
diff --git a/recipes/obsolete/openmoko2/openmoko-sound-system2_0.1.0.bb b/recipes/obsolete/openmoko2/openmoko-sound-system2_0.1.0.bb
new file mode 100644
index 0000000..c947e32
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-sound-system2_0.1.0.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Openmoko Sound System"
+SECTION = "openmoko/base"
+RDEPENDS_${PN} = "\
+  pulseaudio-server \
+  pulseaudio-module-alsa-sink \
+  pulseaudio-module-alsa-source \
+  pulseaudio-module-cli \
+  pulseaudio-module-esound-protocol-unix \
+  pulseaudio-module-simple-protocol-tcp \
+  pulseaudio-module-native-protocol-unix \
+  pulseaudio-module-cli-protocol-unix \
+  gst-plugin-pulse \
+"
+RREPLACES_${PN} = "openmoko-sound-system"
+RPROVIDES_${PN} = "openmoko-sound-system"
+PR = "r6"
+
+inherit openmoko-base update-rc.d
+
+INITSCRIPT_NAME = "pulseaudio"
+INITSCRIPT_PARAMS = "defaults 35"
+
+SRC_URI = "file://pulseaudio \
+           file://session"
+S = "${WORKDIR}"
+
+do_install() {
+    install -d ${D}/${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/pulseaudio ${D}/${sysconfdir}/init.d/
+    install -d ${D}/${sysconfdir}/pulse
+    install -m 0755 ${WORKDIR}/session ${D}/${sysconfdir}/pulse/session
+}
+
+PACKAGE_ARCH = "all"
diff --git a/recipes/obsolete/openmoko2/openmoko-sound-theme-standard2_svn.bb b/recipes/obsolete/openmoko2/openmoko-sound-theme-standard2_svn.bb
new file mode 100644
index 0000000..a7687d8
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-sound-theme-standard2_svn.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Standard sound theme for the Openmoko framework"
+SECTION = "openmoko/base"
+RREPLACES_${PN} = "openmoko-sound-theme-standard"
+RPROVIDES_${PN} = "openmoko-sound-theme-standard"
+SRCREV = "4271"
+PV = "0.1+svnr${SRCPV}"
+PR = "r4"
+
+inherit openmoko2 autotools
+
+SRC_URI = "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE}/artwork;module=sounds;proto=http"
+S = "${WORKDIR}/sounds"
+
+do_install() {
+        find ${WORKDIR} -name ".svn" | xargs rm -rf
+        install -d ${D}${datadir}/openmoko/sounds
+        for i in *.mp3; do
+                cp -fpPR ${S}/$i ${D}${datadir}/openmoko/sounds/
+        done
+        for i in touchscreen_click.wav ringtone_classy.wav notify_doorbell.wav startup_unintrusive.wav; do
+                cp -f ${S}/$i ${D}${datadir}/openmoko/sounds/
+        done
+}
+
+FILES_${PN} = "${datadir}"
+
diff --git a/recipes/obsolete/openmoko2/openmoko-theme-standard2-qvga_svn.bb b/recipes/obsolete/openmoko2/openmoko-theme-standard2-qvga_svn.bb
new file mode 100644
index 0000000..a4e13b4
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-theme-standard2-qvga_svn.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Standard Gtk+ theme for the Openmoko framework, QVGA edition"
+SECTION = "openmoko/base"
+RCONFLICTS_${PN} = "openmoko-theme-standard"
+RPROVIDES_${PN} = "openmoko-theme-standard-2"
+SRCREV = "3425"
+PV = "0.1.1+svnr${SRCPV}"
+PR = "r2"
+
+inherit openmoko2
+
+SRC_URI = "svn://svn.openmoko.org/trunk/src/target/OM-2007.2/artwork/themes;module=openmoko-standard-2-qvga;proto=http"
+S = "${WORKDIR}/openmoko-standard-2-qvga"
+
+do_install() {
+	find ${WORKDIR} -name ".svn" | xargs rm -rf
+	install -d ${D}${datadir}/themes/openmoko-standard-2/gtk-2.0
+	cp -fpPR ${S}/* ${D}${datadir}/themes/openmoko-standard-2/
+	rm -rf ${D}${datadir}/themes/openmoko-standard-2/patches/
+	
+	install -d ${D}${sysconfdir}/gtk-2.0
+	echo 'include "${datadir}/themes/openmoko-standard-2/gtk-2.0/gtkrc"' >> ${D}${sysconfdir}/gtk-2.0/gtkrc
+}
+
+CONFFILES_${PN} = "${sysconfdir}/gtk-2.0/gtkrc"
+
+PACKAGE_ARCH = "all"
+FILES_${PN} = "${datadir} ${sysconfdir}"
diff --git a/recipes/obsolete/openmoko2/openmoko-theme-standard2_svn.bb b/recipes/obsolete/openmoko2/openmoko-theme-standard2_svn.bb
new file mode 100644
index 0000000..cff0bbc
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-theme-standard2_svn.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Standard Gtk+ theme for the Openmoko framework"
+SECTION = "openmoko/base"
+RCONFLICTS_${PN} = "openmoko-theme-standard"
+SRCREV = "4338"
+PV = "0.1.1+svnr${SRCPV}"
+PR = "r6"
+
+inherit openmoko2
+
+SRC_URI = "svn://svn.openmoko.org/trunk/src/target/OM-2007.2/artwork/themes;module=openmoko-standard-2;proto=http"
+S = "${WORKDIR}/openmoko-standard-2"
+
+do_install() {
+	find ${WORKDIR} -name ".svn" | xargs rm -rf
+	install -d ${D}${datadir}/themes/openmoko-standard-2/gtk-2.0
+	cp -fpPR ${S}/* ${D}${datadir}/themes/openmoko-standard-2/
+	rm -rf ${D}${datadir}/themes/openmoko-standard-2/patches/
+	
+}
+
+PACKAGE_ARCH = "all"
+FILES_${PN} = "${datadir}"
diff --git a/recipes/openmoko-base/openmoko-common_svn.bb b/recipes/openmoko-base/openmoko-common_svn.bb
deleted file mode 100644
index 7f1be74..0000000
--- a/recipes/openmoko-base/openmoko-common_svn.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "Common files for the Openmoko distribution"
-SECTION = "openmoko/base"
-PV = "0.0+svnr${SRCPV}"
-PR = "r1"
-
-inherit openmoko-base
-
-SRC_URI = "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE}/artwork;module=images;proto=http"
-S = "${WORKDIR}"
-
-dirs = "images/pixmaps"
-
-do_install() {
-	find ${WORKDIR} -name ".svn" | xargs rm -rf
-	install -d ${D}${datadir}/openmoko/
-	for i in ${dirs}; do
-		cp -fpPR ${S}/$i ${D}${datadir}/openmoko/
-	done
-}
-
-FILES_${PN} = "${datadir}"
diff --git a/recipes/openmoko-base/openmoko-icon-theme-standard_svn.bb b/recipes/openmoko-base/openmoko-icon-theme-standard_svn.bb
deleted file mode 100644
index 0d8a627..0000000
--- a/recipes/openmoko-base/openmoko-icon-theme-standard_svn.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Standard Gtk+ icon theme for the Openmoko distribution"
-SECTION = "openmoko/base"
-PV = "0.1+svnr${SRCPV}"
-PR = "r1"
-
-inherit openmoko-base autotools
-
-SRC_URI = "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE}/artwork;module=icons;proto=http"
-S = "${WORKDIR}/icons"
-
-pkg_postinst_openmoko-icon-theme-standard () {
-#!/bin/sh -e
-if [ "x$D" != "x" ]; then
-    exit 1
-fi
-gtk-update-icon-cache ${datadir}/icons/openmoko-standard/
-}
-
-PACKAGE_ARCH = "all"
diff --git a/recipes/openmoko-base/openmoko-libs_svn.bb b/recipes/openmoko-base/openmoko-libs_svn.bb
deleted file mode 100644
index 42d6b8f..0000000
--- a/recipes/openmoko-base/openmoko-libs_svn.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-DESCRIPTION = "openmoko-libs is a set of libraries implementing a Gtk+ based application framework for mobile communication applications"
-SECTION = "openmoko/libs"
-LICENSE = "LGPL"
-DEPENDS += "gtk+ eds-dbus libgsmd libxosd"
-PV = "0.4+svnr${SRCPV}"
-PR = "r0"
-
-inherit openmoko
-
-PACKAGES =+ "\
-  libmokojournal libmokojournal-dev libmokojournal-dbg \
-  libmokogsmd libmokogsmd-dev libmokogsmd-dbg \
-  libmokocore libmokocore-dev libmokocore-dbg \
-  libmokoui libmokoui-dev libmokoui-dbg \
-"
-
-FILES_libmokojournal = "${libdir}/libmokojournal.so.*"
-FILES_libmokojournal-dev = "${libdir}/libmokojournal.so ${libdir}/libmokojournal.*a ${includedir}/${PN}/libmokojournal"
-FILES_libmokojournal-dbg += "${libdir}/.debug/libmokojournal.so.*"
-
-FILES_libmokogsmd = "${libdir}/libmokogsmd.so.*"
-FILES_libmokogsmd-dev = "${libdir}/libmokogsmd.so ${libdir}/libmokogsmd.*a ${includedir}/${PN}/libmokogsmd"
-FILES_libmokogsmd-dbg += "${libdir}/.debug/libmokogsmd.so.*"
-
-FILES_libmokocore = "${libdir}/libmokocore.so.*"
-FILES_libmokocore-dev = "${libdir}/libmokocore.so ${libdir}/libmokocore.*a ${includedir}/${PN}/libmokocore"
-FILES_libmokocore-dbg += "${libdir}/.debug/libmokocore.so.*"
- 	 
-FILES_libmokoui = "${libdir}/libmokoui.so.*"
-FILES_libmokoui-dev = "${libdir}/libmokoui.so ${libdir}/libmokoui.*a ${includedir}/${PN}/libmokoui"
-FILES_libmokoui-dbg += "${libdir}/.debug/libmokoui.so.*"
-  	 
diff --git a/recipes/openmoko-base/openmoko-sound-system/pulseaudio b/recipes/openmoko-base/openmoko-sound-system/pulseaudio
deleted file mode 100755
index 76daacd..0000000
--- a/recipes/openmoko-base/openmoko-sound-system/pulseaudio
+++ /dev/null
@@ -1,46 +0,0 @@
-#!/bin/sh
-#
-# pulseaudio	This shell script starts and stops pulseaudio.
-#
-# chkconfig: 345 90 40
-# description: Pulseaudio manages the sound input/output
-# processname: pulseaudio
-
-# Source function library.
-#. /etc/rc.d/init.d/functions
-
-RETVAL=0
-prog="pulseaudio"
-
-start() {
-    echo -n "Starting the audio server..."
-    # FIXME once alsa/shm permissions have been fixed, supply --system
-	pulseaudio --resample-method=trivial -D -nF /etc/pulse/session
-	echo $prog
-}
-
-stop() {
-	# Stop daemons.
-	echo -n "Shutting down $prog: "
-	killall pulseaudio
-    echo "done"
-}
-
-# See how we were called.
-case "$1" in
-  start)
-	start
-	;;
-  stop)
-	stop
-	;;
-  restart|reload)
-	stop
-	start
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart}"
-	exit 1
-esac
-
-exit $RETVAL
diff --git a/recipes/openmoko-base/openmoko-sound-system/session b/recipes/openmoko-base/openmoko-sound-system/session
deleted file mode 100644
index ed2346d..0000000
--- a/recipes/openmoko-base/openmoko-sound-system/session
+++ /dev/null
@@ -1,28 +0,0 @@
-#!/usr/bin/pulseaudio -nF
-
-# Create autoload entries for the device drivers
-add-autoload-sink output module-alsa-sink fragment_size=2048 sink_name=output
-add-autoload-source input module-alsa-source source_name=input
-
-# Load several protocols
-load-module module-esound-protocol-unix
-load-module module-simple-protocol-tcp
-load-module module-native-protocol-unix
-load-module module-cli-protocol-unix
-
-# Make some devices default
-set-default-sink output
-set-default-source input
-
-# Don't fail if the audio files referred to below don't exist
-.nofail
-
-# Load an audio to the sample cache for usage with module-x11-bell
-load-sample-lazy x11-bell /usr/share/openmoko/sounds/notify_doorbell.wav
-load-module module-x11-bell sample=x11-bell
-
-# Load samples
-load-sample startup /usr/share/openmoko/sounds/startup_unintrusive.wav
-load-sample touchscreen /usr/share/openmoko/sounds/touchscreen_click.wav
-load-sample ringtone /usr/share/openmoko/sounds/ringtone_classy.wav
-
diff --git a/recipes/openmoko-base/openmoko-sound-system_0.1.0.bb b/recipes/openmoko-base/openmoko-sound-system_0.1.0.bb
deleted file mode 100644
index 2ada84f..0000000
--- a/recipes/openmoko-base/openmoko-sound-system_0.1.0.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION = "Openmoko Sound System"
-SECTION = "openmoko/base"
-RDEPENDS_${PN} = "\
-  pulseaudio-server \
-  pulseaudio-module-alsa-sink \
-  pulseaudio-module-alsa-source \
-  pulseaudio-module-cli \
-  pulseaudio-module-esound-protocol-unix \
-  pulseaudio-module-simple-protocol-tcp \
-  pulseaudio-module-native-protocol-unix \
-  pulseaudio-module-cli-protocol-unix \
-"
-PR = "r7"
-
-inherit openmoko-base update-rc.d
-
-INITSCRIPT_NAME = "pulseaudio"
-INITSCRIPT_PARAMS = "defaults 35"
-
-SRC_URI = "file://pulseaudio \
-           file://session"
-S = "${WORKDIR}"
-
-do_install() {
-    install -d ${D}/${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/pulseaudio ${D}/${sysconfdir}/init.d/
-    install -d ${D}/${sysconfdir}/pulse
-	install -m 0755 ${WORKDIR}/session ${D}/${sysconfdir}/pulse/session
-}
-
-PACKAGE_ARCH = "all"
diff --git a/recipes/openmoko-base/openmoko-sound-theme-standard_svn.bb b/recipes/openmoko-base/openmoko-sound-theme-standard_svn.bb
deleted file mode 100644
index 2c61036..0000000
--- a/recipes/openmoko-base/openmoko-sound-theme-standard_svn.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Standard sound theme for the Openmoko distribution"
-SECTION = "openmoko/base"
-PV = "0.1+svnr${SRCPV}"
-PR = "r2"
-
-inherit openmoko-base autotools
-
-SRC_URI = "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE}/artwork;module=sounds;proto=http"
-S = "${WORKDIR}/sounds"
-
-do_install() {
-        find ${WORKDIR} -name ".svn" | xargs rm -rf
-        install -d ${D}${datadir}/openmoko/sounds
-        for i in *.mp3; do
-                cp -fpPR ${S}/$i ${D}${datadir}/openmoko/sounds/
-        done
-        for i in touchscreen_click.wav ringtone_classy.wav notify_doorbell.wav startup_unintrusive.wav; do
-                cp -f ${S}/$i ${D}${datadir}/openmoko/sounds/
-        done
-}
-
-FILES_${PN} = "${datadir}"
-
diff --git a/recipes/openmoko-base/openmoko-theme-standard-qvga_svn.bb b/recipes/openmoko-base/openmoko-theme-standard-qvga_svn.bb
deleted file mode 100644
index c7256a9..0000000
--- a/recipes/openmoko-base/openmoko-theme-standard-qvga_svn.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "Standard Gtk+ theme for the Openmoko distribution, qvga version"
-SECTION = "openmoko/base"
-PV = "0.0+svnr${SRCPV}"
-PR = "r0"
-
-inherit openmoko-base
-
-SRC_URI = "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE}/artwork;module=themes;proto=http"
-S = "${WORKDIR}"
-
-dirs = "themes/openmoko-standard-qvga"
-
-do_install() {
-	find ${WORKDIR} -name ".svn" | xargs rm -rf
-	install -d ${D}${datadir}/themes/
-	for i in ${dirs}; do
-		cp -fpPR ${WORKDIR}/$i ${D}${datadir}/themes/
-	done
-	
-	install -d ${D}${sysconfdir}/gtk-2.0
-	echo 'include "${datadir}/themes/openmoko-standard-qvga/gtk-2.0/gtkrc"' >> ${D}${sysconfdir}/gtk-2.0/gtkrc
-}
-
-PACKAGE_ARCH = "all"
-FILES_${PN} = "${datadir} ${sysconfdir}"
diff --git a/recipes/openmoko-base/openmoko-theme-standard_svn.bb b/recipes/openmoko-base/openmoko-theme-standard_svn.bb
deleted file mode 100644
index 606d6a03..0000000
--- a/recipes/openmoko-base/openmoko-theme-standard_svn.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "Standard Gtk+ theme for the Openmoko distribution"
-SECTION = "openmoko/base"
-PV = "0.0+svnr${SRCPV}"
-PR = "r5"
-
-inherit openmoko-base
-
-SRC_URI = "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE}/artwork;module=themes;proto=http"
-S = "${WORKDIR}"
-
-dirs = "themes/openmoko-standard"
-
-do_install() {
-	find ${WORKDIR} -name ".svn" | xargs rm -rf
-	install -d ${D}${datadir}/themes/
-	for i in ${dirs}; do
-		cp -fpPR ${WORKDIR}/$i ${D}${datadir}/themes/
-	done
-	
-	install -d ${D}${sysconfdir}/gtk-2.0
-	echo 'include "${datadir}/themes/openmoko-standard/gtk-2.0/gtkrc"' >> ${D}${sysconfdir}/gtk-2.0/gtkrc
-}
-
-CONFFILES_${PN} = "${sysconfdir}/gtk-2.0/gtkrc"
-
-PACKAGE_ARCH = "all"
-FILES_${PN} = "${datadir} ${sysconfdir}"
diff --git a/recipes/openmoko-examples/openmoko-finger-demo_svn.bb b/recipes/openmoko-examples/openmoko-finger-demo_svn.bb
deleted file mode 100644
index a5c7c62..0000000
--- a/recipes/openmoko-examples/openmoko-finger-demo_svn.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-DESCRIPTION = "An example finger application for Openmoko"
-SECTION = "openmoko/examples"
-PV = "0.0.1+svnr${SRCPV}"
-
-inherit openmoko
-
diff --git a/recipes/openmoko-examples/openmoko-panel-demo-simple_svn.bb b/recipes/openmoko-examples/openmoko-panel-demo-simple_svn.bb
deleted file mode 100644
index 82e5c61..0000000
--- a/recipes/openmoko-examples/openmoko-panel-demo-simple_svn.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "A simple example panel plugin for Openmoko"
-SECTION = "openmoko/examples"
-DEPENDS += "libmatchbox"
-SRCREV = "1328"
-PV = "0.0.1+svnr${SRCPV}"
-
-PR = "r1"
-
-inherit openmoko
-
-do_configure_prepend() {
-	sed -i -e s:-Werror::g src/Makefile.am
-}	
-
-
-FILES_${PN} += "${libdir}/matchbox-panel/*.so.*"
-FILES_${PN}-dev += "${libdir}/matchbox-panel/*.so \
-                    ${libdir}/matchbox-panel/*.la"
-FILES_${PN}-dbg += "${libdir}/matchbox-panel/.debug"
-
diff --git a/recipes/openmoko-examples/openmoko-panel-demo_svn.bb b/recipes/openmoko-examples/openmoko-panel-demo_svn.bb
deleted file mode 100644
index 8e9a501..0000000
--- a/recipes/openmoko-examples/openmoko-panel-demo_svn.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "An example panel plugin for Openmoko"
-SECTION = "openmoko/examples"
-DEPENDS += "libmatchbox"
-SRCREV = "1622"
-PV = "0.0.1+svnr${SRCPV}"
-
-inherit openmoko
-
-PARALLEL_MAKE = ""
-
diff --git a/recipes/openmoko-examples/openmoko-stylus-demo-simple_svn.bb b/recipes/openmoko-examples/openmoko-stylus-demo-simple_svn.bb
deleted file mode 100644
index 08b72f8..0000000
--- a/recipes/openmoko-examples/openmoko-stylus-demo-simple_svn.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-DESCRIPTION = "A simple stylus application example for Openmoko"
-SECTION = "openmoko/examples"
-PV = "0.0.1+svnr${SRCPV}"
-
-inherit openmoko
-
diff --git a/recipes/openmoko-examples/openmoko-stylus-demo_svn.bb b/recipes/openmoko-examples/openmoko-stylus-demo_svn.bb
deleted file mode 100644
index 550324a..0000000
--- a/recipes/openmoko-examples/openmoko-stylus-demo_svn.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-DESCRIPTION = "An example stylus application for Openmoko"
-SECTION = "openmoko/examples"
-PV = "0.0.1+svnr${SRCPV}"
-
-inherit openmoko
-
diff --git a/recipes/openmoko-projects/diversity-daemon/no-xmmp.patch b/recipes/openmoko-projects/diversity-daemon/no-xmmp.patch
deleted file mode 100644
index 2065e97..0000000
--- a/recipes/openmoko-projects/diversity-daemon/no-xmmp.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Index: diversity-xmpp-backend/Makefile.am
-===================================================================
---- a/diversity-xmpp-backend/Makefile.am	(revision 276)
-+++ a/diversity-xmpp-backend/Makefile.am	(working copy)
-@@ -1,3 +1,4 @@
-+if HAVE_XMPP
- INCLUDES = -I${top_srcdir}/include
- 
- AM_CPPFLAGS =			\
-@@ -4,9 +5,7 @@
- 	$(GLIB_CFLAGS)		\
- 	$(LM_CFLAGS)
- 
--if HAVE_XMPP
- noinst_LTLIBRARIES = libdiversity-xmpp-backend.la
--endif
- 
- noinst_HEADERS = diversity-xmpp-backend.h
- 
-@@ -48,3 +47,4 @@
- 
- xmpp-marshal.h: xmpp-marshal.list
- 	$(GLIB_GENMARSHAL) --prefix xmpp_marshal --header $< > $@
-+endif
diff --git a/recipes/openmoko-projects/diversity-daemon_svn.bb b/recipes/openmoko-projects/diversity-daemon_svn.bb
deleted file mode 100644
index ab06fde..0000000
--- a/recipes/openmoko-projects/diversity-daemon_svn.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Diversity Daemon"
-HOMEPAGE = "http://diversity.projects.openmoko.org/"
-SECTION = "network/misc"
-LICENSE = "GPL"
-DEPENDS = "glib-2.0 dbus dbus-glib eds-dbus libjana curl"
-RDEPENDS_${PN} = "eds-dbus"
-SRCREV = "571"
-PV = "0.0+svnr${SRCPV}"
-PR = "r3"
-
-SRC_URI = "svn://svn.projects.openmoko.org/svnroot/diversity/trunk;module=diversity-daemon;proto=http \
-           file://no-xmmp.patch;minrev=276;maxrev=568"
-S = "${WORKDIR}/diversity-daemon"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "--disable-nm --disable-xmpp --enable-session-bus"
-
-FILES_${PN} += "${datadir}/dbus-1/"
-FILES_${PN} += "${sysconfdir}/dbus-1/"
diff --git a/recipes/openmoko-projects/diversity-radar_svn.bb b/recipes/openmoko-projects/diversity-radar_svn.bb
deleted file mode 100644
index b5f4e77..0000000
--- a/recipes/openmoko-projects/diversity-radar_svn.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Diversity Radar is a GPS location based communicative application"
-HOMEPAGE = "http://diversity.projects.openmoko.org/"
-SECTION = "openmoko/applications"
-LICENSE = "GPL"
-DEPENDS = "python-evas python-edje python-ecore python-edbus python-dbus"
-RDEPENDS_${PN} = "diversity-daemon"
-SRCREV = "510"
-PV = "0.0.4+svnr${SRCPV}"
-PR = "r0.02"
-
-SRC_URI = "svn://svn.projects.openmoko.org/svnroot/diversity/toys;module=diversity-radar;proto=http"
-
-S = "${WORKDIR}/${PN}"
-
-inherit setuptools
-
-FILES_${PN} += "${prefix}/share/*"
diff --git a/recipes/openmoko2/libjana_svn.bb b/recipes/openmoko2/libjana_svn.bb
deleted file mode 100644
index c73a319..0000000
--- a/recipes/openmoko2/libjana_svn.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "O-Hand Jana Library"
-DEPENDS = "libmokojournal2"
-DEPENDS = "gtk+ eds-dbus gconf" 
-SRCREV = "749"
-PV = "0.1.0+svnr${SRCPV}"
-PR = "r5"
-
-inherit autotools pkgconfig lib_package
-
-SRC_URI = "svn://svn.gnome.org/svn/jana/;module=trunk;proto=http"
-S = "${WORKDIR}/trunk/"
-
-EXTRA_OECONF = "--enable-examples "
-
-do_configure_prepend() {
-	touch gtk-doc.make
-}
-
-PACKAGES =+ "libjana-ecal libjana-ecal-dbg \
-             libjana-gtk libjana-gtk-dbg \ 
-            "
-
-LEAD_SONAME = "libjana.so"
-
-FILES_libjana-ecal = "${libdir}/libjana-ecal.so.*"
-FILES_libjana-ecal-dbg += "${libdir}/.debug/libjana-ecal*"
-FILES_libjana-gtk = "${libdir}/libjana-gtk.so.* ${datadir}/jana/landwater.vmf"
-FILES_libjana-gtk-dbg += "${libdir}/.debug/libjana-gtk.so.*"
-FILES_libjana-bin_append = " ${datadir}/jana/flag-uk.png "
diff --git a/recipes/openmoko2/libmokogsmd2_svn.bb b/recipes/openmoko2/libmokogsmd2_svn.bb
deleted file mode 100644
index 3fa20e9..0000000
--- a/recipes/openmoko2/libmokogsmd2_svn.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-SECTION = "openmoko/libs"
-DEPENDS = "libgsmd glib-2.0"
-SRCREV = "4334"
-PV = "0.1.0+svnr${SRCPV}"
-PR = "r2"
-
-inherit openmoko2
-
diff --git a/recipes/openmoko2/libmokojournal2_svn.bb b/recipes/openmoko2/libmokojournal2_svn.bb
deleted file mode 100644
index ea56046..0000000
--- a/recipes/openmoko2/libmokojournal2_svn.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SECTION = "openmoko/libs"
-DEPENDS = "eds-dbus"
-SRCREV = "3473"
-PV = "0.1.0+svnr${SRCPV}"
-PR = "r2"
-
-inherit openmoko2 lib_package
-
-do_configure_prepend() {
-        touch gtk-doc.make
-}
-
diff --git a/recipes/openmoko2/libmokopanelui2_svn.bb b/recipes/openmoko2/libmokopanelui2_svn.bb
deleted file mode 100644
index 2a3a1c5..0000000
--- a/recipes/openmoko2/libmokopanelui2_svn.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-SECTION = "openmoko/libs"
-DEPENDS = "gtk+ matchbox-panel-2"
-SRCREV = "4568"
-PV = "0.3.0+svnr${SRCPV}"
-PR = "r0"
-
-inherit openmoko2
-
diff --git a/recipes/openmoko2/moko-gtk-engine_svn.bb b/recipes/openmoko2/moko-gtk-engine_svn.bb
deleted file mode 100644
index 72c0c23..0000000
--- a/recipes/openmoko2/moko-gtk-engine_svn.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Moko GTK+ theme engine"
-SECTION = "openmoko/libs"
-SRCREV = "4734"
-PV = "0.1.0+svnr${SRCPV}"
-PR = "r0"
-
-inherit openmoko2
-
-PACKAGES += "moko-gtk-theme"
-FILES_${PN} = "${libdir}/gtk-2.0/*/engines/*.so "
-FILES_${PN}-dev = "${libdir}/gtk-2.0/*/engines/*"
-FILES_${PN}-dbg += "${libdir}/gtk-2.0/*/engines/.debug"
-FILES_moko-gtk-theme = "${datadir}/themes"
-RDEPENDS_${PN} = "moko-gtk-theme"
-
diff --git a/recipes/openmoko2/neod/htc.patch b/recipes/openmoko2/neod/htc.patch
deleted file mode 100644
index 0ced894..0000000
--- a/recipes/openmoko2/neod/htc.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Index: neod/configure.ac
-===================================================================
---- neod.orig/configure.ac	2007-09-15 23:01:30.000000000 +0200
-+++ neod/configure.ac	2007-09-15 23:02:01.000000000 +0200
-@@ -32,6 +32,10 @@
-         NEOD_CFLAGS="$NEOD_CFLAGS -DNEOD_PLATFORM_MOTOROLA_EZX"
- fi
- 
-+if test x"$neod_platform" = x"htc"; then
-+	NEOD_CFLAGS="$NEOD_CFLAGS -DNEOD_PLATFORM_HTC"
-+fi
-+
- CFLAGS=$NEOD_CFLAGS
- 
- AC_OUTPUT([
-Index: neod/src/buttonactions.c
-===================================================================
---- neod.orig/src/buttonactions.c	2007-09-15 23:02:15.000000000 +0200
-+++ neod/src/buttonactions.c	2007-09-15 23:04:16.000000000 +0200
-@@ -63,6 +63,12 @@
-     #define TOUCHSCREEN_BUTTON_KEYCODE 0x14a
- #endif
- 
-+#ifdef NEOD_PLATFORM_HTC
-+    #define AUX_BUTTON_KEYCODE 0xd4   /* camera */
-+    #define POWER_BUTTON_KEYCODE 0x74 /* power */
-+    #define TOUCHSCREEN_BUTTON_KEYCODE 0x14a
-+#endif
-+
- #define HEADPHONE_INSERTION_SWITCHCODE 0x02
- 
- GPollFD input_fd[10];
diff --git a/recipes/openmoko2/neod/ipaq.patch b/recipes/openmoko2/neod/ipaq.patch
deleted file mode 100644
index 19b61ab..0000000
--- a/recipes/openmoko2/neod/ipaq.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Index: neod/src/buttonactions.c
-===================================================================
---- neod.orig/src/buttonactions.c	2007-09-29 17:24:43.000000000 +0200
-+++ neod/src/buttonactions.c	2007-09-29 17:24:49.000000000 +0200
-@@ -69,6 +69,12 @@
-     #define TOUCHSCREEN_BUTTON_KEYCODE 0x14a
- #endif
- 
-+#ifdef NEOD_PLATFORM_IPAQ
-+    #define AUX_BUTTON_KEYCODE 89   /* _KEY_RECORD */
-+    #define POWER_BUTTON_KEYCODE 0x74 /* KEY_POWER */
-+    #define TOUCHSCREEN_BUTTON_KEYCODE 0x14a
-+#endif
-+
- #define HEADPHONE_INSERTION_SWITCHCODE 0x02
- 
- GPollFD input_fd[10];
-Index: neod/configure.ac
-===================================================================
---- neod.orig/configure.ac	2007-09-29 17:25:12.000000000 +0200
-+++ neod/configure.ac	2007-09-29 17:25:48.000000000 +0200
-@@ -36,6 +36,10 @@
- 	NEOD_CFLAGS="$NEOD_CFLAGS -DNEOD_PLATFORM_HTC"
- fi
- 
-+if test x"$neod_platform" = x"ipaq"; then
-+	NEOD_CFLAGS="$NEOD_CFLAGS -DNEOD_PLATFORM_IPAQ"
-+fi
-+
- CFLAGS=$NEOD_CFLAGS
- 
- AC_OUTPUT([
diff --git a/recipes/openmoko2/neod_svn.bb b/recipes/openmoko2/neod_svn.bb
deleted file mode 100644
index d3e4cd9..0000000
--- a/recipes/openmoko2/neod_svn.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "Simple Neo1973 Daemon for Button Handling and Power Management"
-SECTION = "openmoko/daemons"
-
-DISTRO_APM ?= "apm"
-DEPENDS = "gtk+ pulseaudio apmd"
-RDEPENDS_${PN} = "gpe-scap xrandr alsa-utils-amixer ${DISTRO_APM} dbus"
-SRCREV = "4617"
-PV = "0.1.0+svnr${SRCPV}"
-PR = "r8"
-
-inherit openmoko2 gconf
-
-SRC_URI += "file://htc.patch;maxrev=3348 \
-            file://ipaq.patch;maxrev=3348"
-
-EXTRA_OECONF_om-gta01 = "--with-platform=neo1973"
-EXTRA_OECONF_om-gta02 = "--with-platform=neo1973"
-EXTRA_OECONF_a780      = "--with-platform=ezx"
-EXTRA_OECONF_a1200     = "--with-platform=ezx"
-EXTRA_OECONF_e680      = "--with-platform=ezx"
-EXTRA_OECONF_rokre2    = "--with-platform=ezx"
-EXTRA_OECONF_rokre6    = "--with-platform=ezx"
-EXTRA_OECONF_magician  = "--with-platform=htc"
-EXTRA_OECONF_hx4700    = "--with-platform=ipaq"
-EXTRA_OECONF_htcuniversal = "--with-platform=htc"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
diff --git a/recipes/openmoko2/openmoko-asu-om20072-support.bb b/recipes/openmoko2/openmoko-asu-om20072-support.bb
deleted file mode 100644
index 9b0847f..0000000
--- a/recipes/openmoko2/openmoko-asu-om20072-support.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "Theme support and defaults to integrate OM2007.2 in the April Software Update"
-LICENSE = "GPL"
-SECTION = "x11"
-RDEPENDS_${PN} = "openmoko-common2"
-
-ALLOW_EMPTY_${PN} = "1"
-PACKAGE_ARCH = "all"
-
-pkg_postinst_${PN} () {
-#!/bin/sh -e
-if [ "x$D" != "x" ]; then
-    exit 1
-fi
-
-gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/theme Moko
-gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/icon_theme openmoko-standard
-gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/font_name "Sans 5"
-gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/wallpaper ${datadir}/pixmaps/wallpaper.png
-gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type bool --set /desktop/poky/interface/digital_clock 1
-gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type int --set /desktop/poky/peripherals/mouse/drag_threshold 8
-gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type int --set /desktop/openmoko/neod/power_management 2
-# gstreamer audio settings
-#gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct -t string --set /system/gstreamer/0.10/default/audiosink pulsesink
-#gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct -t string --set /system/gstreamer/0.10/default/audiosrc pulsesrc
-
-}
-
diff --git a/recipes/openmoko2/openmoko-common2_svn.bb b/recipes/openmoko2/openmoko-common2_svn.bb
deleted file mode 100644
index 5558e4f..0000000
--- a/recipes/openmoko2/openmoko-common2_svn.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "Common files for the Openmoko framework"
-SECTION = "openmoko/base"
-SRCREV = "3259"
-PV = "0.1.0+svnr${SRCPV}"
-PR = "r0"
-
-inherit openmoko2
-
-SRC_URI = "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE}/artwork;module=pixmaps;proto=http"
-S = "${WORKDIR}"
-
-ALLOW_EMPTY = "1"
-
-dirs = "pixmaps"
-
-do_install() {
-	find . -name .svn | xargs rm -rf
-	install -d ${D}${datadir}
-	for i in ${dirs}; do
-		cp -fR $i ${D}${datadir}/$i;
-	done
-	# moved to xserver-kdrive-common
-	rm -f ${D}${datadir}/pixmaps/xsplash*
-}
-
-PACKAGE_ARCH = "all"
-FILES_${PN} = "${datadir}"
diff --git a/recipes/openmoko2/openmoko-icon-theme-standard2-qvga_svn.bb b/recipes/openmoko2/openmoko-icon-theme-standard2-qvga_svn.bb
deleted file mode 100644
index 4f37324..0000000
--- a/recipes/openmoko2/openmoko-icon-theme-standard2-qvga_svn.bb
+++ /dev/null
@@ -1,58 +0,0 @@
-DESCRIPTION = "Standard Gtk+ icon theme for the Openmoko framework, QVGA edition"
-SECTION = "openmoko/base"
-DEPENDS = "imagemagick-native librsvg-native"
-SRCREV = "4232"
-PV = "0.1.0+svnr${SRCPV}"
-PR = "r2"
-
-EXCLUDE_FROM_WORLD = "1"
-
-inherit openmoko2
-
-SRC_URI = "svn://svn.openmoko.org/trunk/src/target/OM-2007.2/artwork/;module=icons;proto=http"
-S = "${WORKDIR}/icons"
-
-pkg_postinst_${PN} () {
-    if [ "x$D" != "x" ]; then
-        exit 1
-    fi
-    gtk-update-icon-cache -q /usr/share/icons/openmoko-standard
-}
-
-do_configure_prepend () {
-	cd ${S}
-	#
-	# don't include 36x36 and 128x128 icons, 32x32 and 48x48 stock icons
-	#
-	sed -i -e "/\(36\|128\)/d" -e "/\(32\|48\)\/stock/d" configure.ac
-	cd openmoko-standard
-	sed -i -e "s/\(36x36\|128x128\) //g" Makefile.am
-	sed -i "/^SUBDIRS=/s/ stock//" {32x32,48x48}/Makefile.am 
-	#
-	# rescale stock icons to 22x22
-	#
-	for png in $(ls */stock/*.png | sed "s,.*/,," | sort | uniq); do
-		svg=scalable/stock/$(basename $png .png).svg
-		out=22x22/stock/$png
-		if [ -f $svg ]; then
-			#
-			# if there are vector graphics, rerender
-			#
-			rsvg -w 22 -h 22 $svg $out
-		else
-			#
-			# otherwise rescale biggest existing bitmap
-			#
-			png=$(echo */stock/$png | sed "s/.* //")
-			convert -scale 22x22 $png $out
-		fi
-	done
-	#
-	# register the rescaled icons with automake
-	#
-	cd 22x22/stock
-	sed -i "/^icons_DATA/s/=.*/= $(echo *.png)/" Makefile.am
-	cd ${S}
-}
-
-PACKAGE_ARCH = "all"
diff --git a/recipes/openmoko2/openmoko-icon-theme-standard2_svn.bb b/recipes/openmoko2/openmoko-icon-theme-standard2_svn.bb
deleted file mode 100644
index c184445..0000000
--- a/recipes/openmoko2/openmoko-icon-theme-standard2_svn.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "Standard Gtk+ icon theme for the Openmoko framework"
-HOMEPAGE = "http://www.openmoko.org"
-SECTION = "openmoko/base"
-LICENSE = "GPL"
-
-SRCREV = "4232"
-PV = "0.1.0+svnr${SRCPV}"
-PR = "r3"
-
-inherit autotools pkgconfig
-
-SRC_URI = "svn://svn.openmoko.org/trunk/src/target/OM-2007.2/artwork/;module=icons;proto=http"
-S = "${WORKDIR}/icons"
-
-FILES_${PN} += "${datadir}/icons"
-
-pkg_postinst_${PN} () {
-    if [ "x$D" != "x" ]; then
-        exit 1
-    fi
-    gtk-update-icon-cache -q /usr/share/icons/openmoko-standard
-}
-
-PACKAGE_ARCH = "all"
diff --git a/recipes/openmoko2/openmoko-sound-system2/pulseaudio b/recipes/openmoko2/openmoko-sound-system2/pulseaudio
deleted file mode 100755
index 9649473..0000000
--- a/recipes/openmoko2/openmoko-sound-system2/pulseaudio
+++ /dev/null
@@ -1,50 +0,0 @@
-#!/bin/sh
-#
-# pulseaudio	This shell script starts and stops pulseaudio.
-#
-# chkconfig: 345 90 40
-# description: Pulseaudio manages the sound input/output
-# processname: pulseaudio
-
-# Source function library.
-#. /etc/rc.d/init.d/functions
-
-RETVAL=0
-prog="pulseaudio"
-
-start() {
-    echo -n "Starting audio server: "
-    # FIXME once alsa/shm permissions have been fixed, supply --system
-    start-stop-daemon -S -x /usr/bin/pulseaudio -- --no-cpu-limit --resample-method=trivial -D -nF /etc/pulse/session
-
-    if [ $? = 0 ]; then
-        echo "$prog (warning ignores)." # FIXME remove comment on warning
-    else
-        echo "(failed.)"
-    fi
-}
-
-stop() {
-    echo -n "Stopping audio server: "
-    start-stop-daemon -K -x /usr/bin/pulseaudio
-    echo "pulseaudio."
-}
-
-# See how we were called.
-case "$1" in
-  start)
-	start
-	;;
-  stop)
-	stop
-	;;
-  restart|reload)
-	stop
-	start
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart}"
-	exit 1
-esac
-
-exit $RETVAL
diff --git a/recipes/openmoko2/openmoko-sound-system2/session b/recipes/openmoko2/openmoko-sound-system2/session
deleted file mode 100644
index 7cc4d49..0000000
--- a/recipes/openmoko2/openmoko-sound-system2/session
+++ /dev/null
@@ -1,27 +0,0 @@
-#!/usr/bin/pulseaudio -nF
-
-# Create autoload entries for the device drivers
-add-autoload-sink output module-alsa-sink sink_name=output
-add-autoload-source input module-alsa-source source_name=input
-
-# Load several protocols
-load-module module-esound-protocol-unix
-load-module module-native-protocol-unix
-load-module module-cli-protocol-unix
-
-# Make some devices default
-set-default-sink output
-set-default-source input
-
-# Don't fail if the audio files referred to below don't exist
-.nofail
-
-# Load an audio to the sample cache for usage with module-x11-bell
-load-sample-lazy x11-bell /usr/share/openmoko/sounds/notify_doorbell.wav
-load-module module-x11-bell sample=x11-bell
-
-# Load samples
-load-sample startup /usr/share/openmoko/sounds/startup_unintrusive.wav
-load-sample touchscreen /usr/share/openmoko/sounds/touchscreen_click.wav
-load-sample ringtone /usr/share/openmoko/sounds/ringtone_classy.wav
-
diff --git a/recipes/openmoko2/openmoko-sound-system2_0.1.0.bb b/recipes/openmoko2/openmoko-sound-system2_0.1.0.bb
deleted file mode 100644
index c947e32..0000000
--- a/recipes/openmoko2/openmoko-sound-system2_0.1.0.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-DESCRIPTION = "Openmoko Sound System"
-SECTION = "openmoko/base"
-RDEPENDS_${PN} = "\
-  pulseaudio-server \
-  pulseaudio-module-alsa-sink \
-  pulseaudio-module-alsa-source \
-  pulseaudio-module-cli \
-  pulseaudio-module-esound-protocol-unix \
-  pulseaudio-module-simple-protocol-tcp \
-  pulseaudio-module-native-protocol-unix \
-  pulseaudio-module-cli-protocol-unix \
-  gst-plugin-pulse \
-"
-RREPLACES_${PN} = "openmoko-sound-system"
-RPROVIDES_${PN} = "openmoko-sound-system"
-PR = "r6"
-
-inherit openmoko-base update-rc.d
-
-INITSCRIPT_NAME = "pulseaudio"
-INITSCRIPT_PARAMS = "defaults 35"
-
-SRC_URI = "file://pulseaudio \
-           file://session"
-S = "${WORKDIR}"
-
-do_install() {
-    install -d ${D}/${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/pulseaudio ${D}/${sysconfdir}/init.d/
-    install -d ${D}/${sysconfdir}/pulse
-    install -m 0755 ${WORKDIR}/session ${D}/${sysconfdir}/pulse/session
-}
-
-PACKAGE_ARCH = "all"
diff --git a/recipes/openmoko2/openmoko-sound-theme-standard2_svn.bb b/recipes/openmoko2/openmoko-sound-theme-standard2_svn.bb
deleted file mode 100644
index a7687d8..0000000
--- a/recipes/openmoko2/openmoko-sound-theme-standard2_svn.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION = "Standard sound theme for the Openmoko framework"
-SECTION = "openmoko/base"
-RREPLACES_${PN} = "openmoko-sound-theme-standard"
-RPROVIDES_${PN} = "openmoko-sound-theme-standard"
-SRCREV = "4271"
-PV = "0.1+svnr${SRCPV}"
-PR = "r4"
-
-inherit openmoko2 autotools
-
-SRC_URI = "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE}/artwork;module=sounds;proto=http"
-S = "${WORKDIR}/sounds"
-
-do_install() {
-        find ${WORKDIR} -name ".svn" | xargs rm -rf
-        install -d ${D}${datadir}/openmoko/sounds
-        for i in *.mp3; do
-                cp -fpPR ${S}/$i ${D}${datadir}/openmoko/sounds/
-        done
-        for i in touchscreen_click.wav ringtone_classy.wav notify_doorbell.wav startup_unintrusive.wav; do
-                cp -f ${S}/$i ${D}${datadir}/openmoko/sounds/
-        done
-}
-
-FILES_${PN} = "${datadir}"
-
diff --git a/recipes/openmoko2/openmoko-theme-standard2-qvga_svn.bb b/recipes/openmoko2/openmoko-theme-standard2-qvga_svn.bb
deleted file mode 100644
index a4e13b4..0000000
--- a/recipes/openmoko2/openmoko-theme-standard2-qvga_svn.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "Standard Gtk+ theme for the Openmoko framework, QVGA edition"
-SECTION = "openmoko/base"
-RCONFLICTS_${PN} = "openmoko-theme-standard"
-RPROVIDES_${PN} = "openmoko-theme-standard-2"
-SRCREV = "3425"
-PV = "0.1.1+svnr${SRCPV}"
-PR = "r2"
-
-inherit openmoko2
-
-SRC_URI = "svn://svn.openmoko.org/trunk/src/target/OM-2007.2/artwork/themes;module=openmoko-standard-2-qvga;proto=http"
-S = "${WORKDIR}/openmoko-standard-2-qvga"
-
-do_install() {
-	find ${WORKDIR} -name ".svn" | xargs rm -rf
-	install -d ${D}${datadir}/themes/openmoko-standard-2/gtk-2.0
-	cp -fpPR ${S}/* ${D}${datadir}/themes/openmoko-standard-2/
-	rm -rf ${D}${datadir}/themes/openmoko-standard-2/patches/
-	
-	install -d ${D}${sysconfdir}/gtk-2.0
-	echo 'include "${datadir}/themes/openmoko-standard-2/gtk-2.0/gtkrc"' >> ${D}${sysconfdir}/gtk-2.0/gtkrc
-}
-
-CONFFILES_${PN} = "${sysconfdir}/gtk-2.0/gtkrc"
-
-PACKAGE_ARCH = "all"
-FILES_${PN} = "${datadir} ${sysconfdir}"
diff --git a/recipes/openmoko2/openmoko-theme-standard2_svn.bb b/recipes/openmoko2/openmoko-theme-standard2_svn.bb
deleted file mode 100644
index cff0bbc..0000000
--- a/recipes/openmoko2/openmoko-theme-standard2_svn.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Standard Gtk+ theme for the Openmoko framework"
-SECTION = "openmoko/base"
-RCONFLICTS_${PN} = "openmoko-theme-standard"
-SRCREV = "4338"
-PV = "0.1.1+svnr${SRCPV}"
-PR = "r6"
-
-inherit openmoko2
-
-SRC_URI = "svn://svn.openmoko.org/trunk/src/target/OM-2007.2/artwork/themes;module=openmoko-standard-2;proto=http"
-S = "${WORKDIR}/openmoko-standard-2"
-
-do_install() {
-	find ${WORKDIR} -name ".svn" | xargs rm -rf
-	install -d ${D}${datadir}/themes/openmoko-standard-2/gtk-2.0
-	cp -fpPR ${S}/* ${D}${datadir}/themes/openmoko-standard-2/
-	rm -rf ${D}${datadir}/themes/openmoko-standard-2/patches/
-	
-}
-
-PACKAGE_ARCH = "all"
-FILES_${PN} = "${datadir}"
-- 
1.7.3.1



