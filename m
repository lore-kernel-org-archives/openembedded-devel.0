Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SxoeO-0002Re-Vr
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 02:24:57 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1458795wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 17:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=EktjAOcexGReR0rPN5DZxZj19BxjSDayLwMfG2ggN3Q=;
	b=b3SPXkrGkXEh2wuXim5X5fzfGUJA8ZPt/2ZjmUjubDAzcMxY4Z8AsEnXYqF9Qrft7O
	yMXn7BwTCYzTCda8q7G4lGflnKRNPdw3s6n1xa4wlmuLrTWT+IISgZjvXXIk5ZrvBmWx
	fesilpHdYi/obyeJptKOL0YNjbsw8TNM24a2w7cDJAhvAN9DUixrsJ1YAG+b2v+5nvON
	KapbnxRooa6XZ94mkcpoWPnCyYguBuWlIFrPoj8+3tVzDDaZgYy9FMkh7A/lsQkHMbHM
	6F47HuFX/oPXiVnEEg4NOXCcvgEi2MlB05egJwWNMpy+bcnYbE9QawEThse0LKP4b66l
	a8LQ==
Received: by 10.216.132.135 with SMTP id o7mr3057942wei.6.1344125596322;
	Sat, 04 Aug 2012 17:13:16 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0E34.dip.t-dialin.net.
	[91.10.14.52])
	by mx.google.com with ESMTPS id l6sm6430551wiz.4.2012.08.04.17.13.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Aug 2012 17:13:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Aug 2012 02:19:54 +0200
Message-Id: <1344126001-19256-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
References: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-angstrom 09/16] angstrom-task-gnome3: split out task-gnome3-apps
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
X-List-Received-Date: Sun, 05 Aug 2012 00:24:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-angstrom/tasks/angstrom-task-gnome3.bb |   11 ++---------
 recipes-angstrom/tasks/task-gnome3-apps.bb     |   13 +++++++++++++
 2 files changed, 15 insertions(+), 9 deletions(-)
 create mode 100644 recipes-angstrom/tasks/task-gnome3-apps.bb

diff --git a/recipes-angstrom/tasks/angstrom-task-gnome3.bb b/recipes-angstrom/tasks/angstrom-task-gnome3.bb
index 0db00fa..7564339 100644
--- a/recipes-angstrom/tasks/angstrom-task-gnome3.bb
+++ b/recipes-angstrom/tasks/angstrom-task-gnome3.bb
@@ -2,21 +2,14 @@ DESCRIPTION = "Task for a GNOME based image"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r5"
+PR = "r6"
 
 inherit task
 
 # Most of these tasks are arch independant
 PACKAGE_ARCH = "all"
 
-PACKAGES += "task-gnome3-apps task-gnome3-fonts task-gnome3 task-gnome3-gstreamer task-gnome3-perl task-gnome3-cups task-gnome3-pulseaudio task-gnome3-themes task-gnome3-totem task-gnome3-xserver-base "
-
-
-RDEPENDS_task-gnome3-apps = " \
-  x11vnc \
-  matchbox-terminal \
-  epiphany \
- "
+PACKAGES += "task-gnome3-fonts task-gnome3 task-gnome3-gstreamer task-gnome3-perl task-gnome3-cups task-gnome3-pulseaudio task-gnome3-themes task-gnome3-totem task-gnome3-xserver-base "
 
 RDEPENDS_task-gnome3-fonts = " \
   fontconfig fontconfig-utils font-util \
diff --git a/recipes-angstrom/tasks/task-gnome3-apps.bb b/recipes-angstrom/tasks/task-gnome3-apps.bb
new file mode 100644
index 0000000..c55c345
--- /dev/null
+++ b/recipes-angstrom/tasks/task-gnome3-apps.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Task for a GNOME based image"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+PR = "r6"
+
+inherit task
+
+RDEPENDS_${PN} = " \
+  x11vnc \
+  matchbox-terminal \
+  epiphany \
+"
-- 
1.7.4.4



