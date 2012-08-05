Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SxoeG-0002Re-KW
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 02:24:48 +0200
Received: by wgbdr1 with SMTP id dr1so1458795wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 17:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=nzxy4E+E5v9txczDVg6savmRHMDQBmjMOkVyRepvlL0=;
	b=Iw2K7JGIh+016CdzUP9uUkx4Um5fKCywozikxtUIwbuOrJ1rG0ThXrefU1stkMiAqH
	RV5MAGpKPPru2v39roiD8q8cOvctuw52Wc6SsD7KXaaSJmbBbXd3cYQNZJ9eSrXpDOY3
	V6iN17lIPFyI6PdsdtwKy4LhO5VpOTLziD04mGK1YT/kEqsJgO91nUavCrMrr+lzPJTu
	WhnuzTft/epLShGWz2a5qrZ6rCRyqhC5y1OdNwQ/Bv4VeNxkhtmkqpKbfZZySxeEYPnK
	yn9gwqhEf+vVHhoiFWBLWiTFJL/plss70cP7lBz5yxZ4xlZUQ8S69FiqHHlpkF5KeneX
	rf0Q==
Received: by 10.216.233.208 with SMTP id p58mr2996142weq.56.1344125585944;
	Sat, 04 Aug 2012 17:13:05 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0E34.dip.t-dialin.net.
	[91.10.14.52])
	by mx.google.com with ESMTPS id l6sm6430551wiz.4.2012.08.04.17.13.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Aug 2012 17:13:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Aug 2012 02:19:47 +0200
Message-Id: <1344126001-19256-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
References: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-angstrom 02/16] angstrom-task-gnome: split out task-gnome-fonts
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
X-List-Received-Date: Sun, 05 Aug 2012 00:24:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-angstrom/tasks/angstrom-task-gnome.bb |    9 +--------
 recipes-angstrom/tasks/task-gnome-fonts.bb    |   14 ++++++++++++++
 2 files changed, 15 insertions(+), 8 deletions(-)
 create mode 100644 recipes-angstrom/tasks/task-gnome-fonts.bb

diff --git a/recipes-angstrom/tasks/angstrom-task-gnome.bb b/recipes-angstrom/tasks/angstrom-task-gnome.bb
index cb4dde5..c3e500a 100644
--- a/recipes-angstrom/tasks/angstrom-task-gnome.bb
+++ b/recipes-angstrom/tasks/angstrom-task-gnome.bb
@@ -9,14 +9,7 @@ inherit task
 # Most of these tasks are arch independant
 PACKAGE_ARCH = "all"
 
-PACKAGES += "task-gnome-fonts task-gnome task-gnome-gstreamer task-gnome-perl task-gnome-cups task-gnome-pulseaudio task-gnome-themes task-gnome-totem task-gnome-xserver-base "
-
-RDEPENDS_task-gnome-fonts = " \
-  fontconfig fontconfig-utils font-util \
-  ttf-liberation-sans \
-  ttf-liberation-serif \
-  ttf-liberation-mono \
- "  
+PACKAGES += "task-gnome task-gnome-gstreamer task-gnome-perl task-gnome-cups task-gnome-pulseaudio task-gnome-themes task-gnome-totem task-gnome-xserver-base "
 
 RDEPENDS_task-gnome = " \
   gnome-settings-daemon gnome-control-center \
diff --git a/recipes-angstrom/tasks/task-gnome-fonts.bb b/recipes-angstrom/tasks/task-gnome-fonts.bb
new file mode 100644
index 0000000..772dcf1
--- /dev/null
+++ b/recipes-angstrom/tasks/task-gnome-fonts.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Task for a GNOME fonts"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+PR = "r13"
+
+inherit task
+
+RDEPENDS_${PN} = " \
+  fontconfig fontconfig-utils font-util \
+  ttf-liberation-sans \
+  ttf-liberation-serif \
+  ttf-liberation-mono \
+"
-- 
1.7.4.4



