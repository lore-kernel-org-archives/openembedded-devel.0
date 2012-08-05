Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SxoeH-0002Rs-V7
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 02:24:49 +0200
Received: by wibhq4 with SMTP id hq4so571013wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 17:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=wE5miWncasap6v8/GvxnBCxgziQyTh/oYDKBDkzC66Q=;
	b=TeRywGVEHdW4f/PB6KzPdcVADG5k4MtWUeFSo42VzjpaLt+vzjWVgGrqWjvJk2r6Ez
	wja7U4BnmvIeC2/nEIbMH7GAQR77MeP6Lh4YzW+IQTPiW3VBOSKRQAI1d/Un4b1bLIrf
	LSavLcn1kzmIeWhd9TEaTq9wGYGvbIki+uALlI7/Icaa9fYm6D918kH9BRtd36+sEXNi
	5u1OuGvN91jxY5kyQTgZ5uoLAidDcdVqQn5wuIMgEJBZGUMber/Y4bFkmV3p8ZZw/i3h
	0u6pladler6/ZGrX+Nudf9utIr5C6yXYp0aHTX7V0Uy3FH9/yzju0aHt5Jcm2esh5CeH
	naDg==
Received: by 10.217.3.71 with SMTP id q49mr3327655wes.33.1344125587430;
	Sat, 04 Aug 2012 17:13:07 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0E34.dip.t-dialin.net.
	[91.10.14.52])
	by mx.google.com with ESMTPS id l6sm6430551wiz.4.2012.08.04.17.13.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Aug 2012 17:13:06 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Aug 2012 02:19:48 +0200
Message-Id: <1344126001-19256-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
References: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-angstrom 03/16] angstrom-task-gnome: split out task-gnome
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
X-List-Received-Date: Sun, 05 Aug 2012 00:24:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-angstrom/tasks/angstrom-task-gnome.bb |   23 +--------------------
 recipes-angstrom/tasks/task-gnome.bb          |   26 +++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 21 deletions(-)
 create mode 100644 recipes-angstrom/tasks/task-gnome.bb

diff --git a/recipes-angstrom/tasks/angstrom-task-gnome.bb b/recipes-angstrom/tasks/angstrom-task-gnome.bb
index c3e500a..a2dca0b 100644
--- a/recipes-angstrom/tasks/angstrom-task-gnome.bb
+++ b/recipes-angstrom/tasks/angstrom-task-gnome.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Task for a GNOME based image"
+DESCRIPTION = "Task for a full GNOME based image"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
@@ -9,26 +9,7 @@ inherit task
 # Most of these tasks are arch independant
 PACKAGE_ARCH = "all"
 
-PACKAGES += "task-gnome task-gnome-gstreamer task-gnome-perl task-gnome-cups task-gnome-pulseaudio task-gnome-themes task-gnome-totem task-gnome-xserver-base "
-
-RDEPENDS_task-gnome = " \
-  gnome-settings-daemon gnome-control-center \
-  gnome-keyring \
-  gdm-systemd angstrom-gdm-autologin-hack \
-  gnome-power-manager \
-  gnome-bluetooth \
-  gnome-panel \
-  gtk-engine-clearlooks gtk-theme-clearlooks angstrom-clearlooks-theme-enable \
-  upower udisks \
-  gnome-disk-utility \
-  gnome-system-monitor \
-  nautilus \
-  gpe-scap \
-  bash \ 
-  tzdata \
-"
-
-RRECOMMENDS_task-gnome = "ofono"
+PACKAGES += "task-gnome-gstreamer task-gnome-perl task-gnome-cups task-gnome-pulseaudio task-gnome-themes task-gnome-totem task-gnome-xserver-base "
 
 DEPENDS_task-gnome-gstreamer = " \
   gst-plugins-base \
diff --git a/recipes-angstrom/tasks/task-gnome.bb b/recipes-angstrom/tasks/task-gnome.bb
new file mode 100644
index 0000000..3087533
--- /dev/null
+++ b/recipes-angstrom/tasks/task-gnome.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Task for a GNOME based image"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+PR = "r13"
+
+inherit task
+
+RDEPENDS_${PN} = " \
+  gnome-settings-daemon gnome-control-center \
+  gnome-keyring \
+  gdm-systemd angstrom-gdm-autologin-hack \
+  gnome-power-manager \
+  gnome-bluetooth \
+  gnome-panel \
+  gtk-engine-clearlooks gtk-theme-clearlooks angstrom-clearlooks-theme-enable \
+  upower udisks \
+  gnome-disk-utility \
+  gnome-system-monitor \
+  nautilus \
+  gpe-scap \
+  bash \
+  tzdata \
+"
+
+RRECOMMENDS_${PN} = "ofono"
-- 
1.7.4.4



