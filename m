Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SxoeR-0002Rs-GR
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 02:24:59 +0200
Received: by mail-wi0-f171.google.com with SMTP id hq4so571013wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 17:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=YcnL6qb7a2p/BCf+jwApjML5MyxNhtZHJiZSpwC3H8c=;
	b=b55qtu0TTrB/L/fDahhaWTBw2SghqUwbgekt421hcDYlrObAOevWiYjZMxxDfsvRik
	X3PvAWHz/6gVqYfic5hMjZLjJkmYNmVa5HBlMPh8tIWoBNiS9AL/3d4G4kfig9bGISYP
	Vx1XNQIu5mWKAW29o1vnS1HwQUf5T5Jdwct39m6Ppt+xPWljWDVkFx6yVBIvECUNF46d
	/dh0d5ixJ7j5v5IA4e7iKYhuigSuZR0VZFHKAjaYSnQg5GCLWYMwijwKk7GRkuV4Zkgb
	oknXrdwK9KTrpXGNF1/Hl+0ulkJbLJ6W0zA7WItoYTHLstIsdfiz+5sVyFGD+X3Zg35V
	AbQw==
Received: by 10.180.20.11 with SMTP id j11mr7334624wie.12.1344125599181;
	Sat, 04 Aug 2012 17:13:19 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0E34.dip.t-dialin.net.
	[91.10.14.52])
	by mx.google.com with ESMTPS id l6sm6430551wiz.4.2012.08.04.17.13.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Aug 2012 17:13:18 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Aug 2012 02:19:56 +0200
Message-Id: <1344126001-19256-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
References: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-angstrom 11/16] angstrom-task-gnome3: split out task-gnome3
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
X-List-Received-Date: Sun, 05 Aug 2012 00:24:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-angstrom/tasks/angstrom-task-gnome3.bb |   18 +-----------------
 recipes-angstrom/tasks/task-gnome3.bb          |   23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+), 17 deletions(-)
 create mode 100644 recipes-angstrom/tasks/task-gnome3.bb

diff --git a/recipes-angstrom/tasks/angstrom-task-gnome3.bb b/recipes-angstrom/tasks/angstrom-task-gnome3.bb
index 3d6dcb2..9e4581e 100644
--- a/recipes-angstrom/tasks/angstrom-task-gnome3.bb
+++ b/recipes-angstrom/tasks/angstrom-task-gnome3.bb
@@ -9,23 +9,7 @@ inherit task
 # Most of these tasks are arch independant
 PACKAGE_ARCH = "all"
 
-PACKAGES += "task-gnome3 task-gnome3-gstreamer task-gnome3-perl task-gnome3-cups task-gnome3-pulseaudio task-gnome3-themes task-gnome3-totem task-gnome3-xserver-base "
-
-RDEPENDS_task-gnome3 = " \
-  gnome-settings-daemon gnome-control-center \
-  gnome-keyring \
-  gdm-systemd angstrom-gdm-autologin-hack \
-  gnome-power-manager3 \
-  gnome-bluetooth \
-  gnome-panel3 \
-  gtk-engine-clearlooks gtk-theme-clearlooks \
-  upower udisks \
-  gnome-disk-utility \
-  nautilus3 \
-  gpe-scap \
-  bash \ 
-  tzdata \
-"
+PACKAGES += "task-gnome3-gstreamer task-gnome3-perl task-gnome3-cups task-gnome3-pulseaudio task-gnome3-themes task-gnome3-totem task-gnome3-xserver-base "
 
 DEPENDS_task-gnome3-gstreamer = " \
   gst-plugins-base \
diff --git a/recipes-angstrom/tasks/task-gnome3.bb b/recipes-angstrom/tasks/task-gnome3.bb
new file mode 100644
index 0000000..0791cd5
--- /dev/null
+++ b/recipes-angstrom/tasks/task-gnome3.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Task for a GNOME based image"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+PR = "r6"
+
+inherit task
+
+RDEPENDS_${PN} = " \
+  gnome-settings-daemon gnome-control-center \
+  gnome-keyring \
+  gdm-systemd angstrom-gdm-autologin-hack \
+  gnome-power-manager3 \
+  gnome-bluetooth \
+  gnome-panel3 \
+  gtk-engine-clearlooks gtk-theme-clearlooks \
+  upower udisks \
+  gnome-disk-utility \
+  nautilus3 \
+  gpe-scap \
+  bash \
+  tzdata \
+"
-- 
1.7.4.4



