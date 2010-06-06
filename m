Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1OLJTc-0000mi-Dw
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jun 2010 19:17:37 +0200
Received: from cpe002275e3273f-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.245.115] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1OLJPS-0000zv-4E for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jun 2010 13:13:18 -0400
Date: Sun, 6 Jun 2010 13:13:13 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@lynx
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.DEB.2.00.1006061312550.2992@lynx>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Remove superfluous "patch=1" parameters from some recipes.
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
X-List-Received-Date: Sun, 06 Jun 2010 17:17:37 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


If a filename has either a ".diff" or ".patch" suffix, then the
"patch=1" parameter is unnecessary.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/recipes/ti/matrix-gui_svn.bb b/recipes/ti/matrix-gui_svn.bb
index 4388d28..4bfe7c2 100644
--- a/recipes/ti/matrix-gui_svn.bb
+++ b/recipes/ti/matrix-gui_svn.bb
@@ -9,7 +9,7 @@ PV = "1.0"
 PR = "r14+svnr${SRCPV}"

 SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd='' \
-    file://0001-Disable-cursor-override-for-X11.patch;patch=1 \
+    file://0001-Disable-cursor-override-for-X11.patch \
 	file://init \
     file://matrix-gui.desktop \
 "
diff --git a/recipes/udev/udev_092.bb b/recipes/udev/udev_092.bb
index 3ed05d1..a3c5521 100644
--- a/recipes/udev/udev_092.bb
+++ b/recipes/udev/udev_092.bb
@@ -9,12 +9,12 @@ LD = "${CC}"

 PR = "${INC_PR}.0"

-SRC_URI += "file://noasmlinkage.patch;patch=1 \
-	    file://flags.patch;patch=1 \
-	    file://udevsynthesize.patch;patch=1 \
+SRC_URI += "file://noasmlinkage.patch \
+	    file://flags.patch \
+	    file://udevsynthesize.patch \
 	    file://udevsynthesize.sh \
-            file://arm_inotify_fix.patch;patch=1 \
-	    file://mtd-exclude-persistent.patch;patch=1 \
+            file://arm_inotify_fix.patch \
+	    file://mtd-exclude-persistent.patch \
 	    file://mount.blacklist \
 	   "

diff --git a/recipes/udev/udev_097.bb b/recipes/udev/udev_097.bb
index 8757794..84d4b61 100644
--- a/recipes/udev/udev_097.bb
+++ b/recipes/udev/udev_097.bb
@@ -14,8 +14,8 @@ PR = "${INC_PR}.0"

 LD = "${CC}"

-SRC_URI += "file://noasmlinkage.patch;patch=1 \
-	    file://flags.patch;patch=1 \
+SRC_URI += "file://noasmlinkage.patch \
+	    file://flags.patch \
 	    file://mount.blacklist \
 	   "

diff --git a/recipes/udev/udev_100.bb b/recipes/udev/udev_100.bb
index 7261483..a6692cf 100644
--- a/recipes/udev/udev_100.bb
+++ b/recipes/udev/udev_100.bb
@@ -15,9 +15,9 @@ PR = "${INC_PR}.0"

 LD = "${CC}"

-SRC_URI += "file://noasmlinkage.patch;patch=1 \
-	    file://flags.patch;patch=1 \
-	    file://mtd-exclude-persistent.patch;patch=1 \
+SRC_URI += "file://noasmlinkage.patch \
+	    file://flags.patch \
+	    file://mtd-exclude-persistent.patch \
 	    file://mount.blacklist \
 	    file://mount.sh \
 	   "


rday

-- 

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


