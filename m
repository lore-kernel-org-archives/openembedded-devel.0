Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SxoeJ-0002S2-DF
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 02:24:51 +0200
Received: by wgbds1 with SMTP id ds1so538186wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 17:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=0o49+CGZB3uJsVpCaKsMTbC3z1GRuOOleKG7gLDKMxo=;
	b=ha2l2UjbBEGblOMl/o5JPb8ePJKFlcD0M37ASbRYjmh1Tp3XiRLKAJbddSM+uPhq2h
	B0FfMWtYkgQCPlWdjtawVydiaUNpA6BQ2WZeUNGQ+Xo5OuMTtDxLCwwMgxwaPjBbhxYP
	Y98/25dK4ux6fZ+4HLbfype6ix+YP7sMAywDHzWwPx0j0chlnEVd5CY0wg7OXNmQTV6R
	XCPxOfeYDHB9b6U/NFq/2wbsEYa3+tAj6KbFsQ4RMn2SMh9QjIzlNs6HnBydbC/h+s3m
	YA85HKcOE/L0hQBr45eG6r+/FSQse5Dcvan9PkTwkYB76ykPWbv1o5c/RwwtmXQ+rU/A
	qS6g==
Received: by 10.180.89.235 with SMTP id br11mr7391420wib.3.1344125588976;
	Sat, 04 Aug 2012 17:13:08 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0E34.dip.t-dialin.net.
	[91.10.14.52])
	by mx.google.com with ESMTPS id l6sm6430551wiz.4.2012.08.04.17.13.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Aug 2012 17:13:08 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Aug 2012 02:19:49 +0200
Message-Id: <1344126001-19256-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
References: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-angstrom 04/16] angstrom-task-gnome: split out task-gnome-gstreamer
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
X-List-Received-Date: Sun, 05 Aug 2012 00:24:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-angstrom/tasks/angstrom-task-gnome.bb  |   14 +-------------
 recipes-angstrom/tasks/task-gnome-gstreamer.bb |   19 +++++++++++++++++++
 2 files changed, 20 insertions(+), 13 deletions(-)
 create mode 100644 recipes-angstrom/tasks/task-gnome-gstreamer.bb

diff --git a/recipes-angstrom/tasks/angstrom-task-gnome.bb b/recipes-angstrom/tasks/angstrom-task-gnome.bb
index a2dca0b..3ba3b7c 100644
--- a/recipes-angstrom/tasks/angstrom-task-gnome.bb
+++ b/recipes-angstrom/tasks/angstrom-task-gnome.bb
@@ -9,19 +9,7 @@ inherit task
 # Most of these tasks are arch independant
 PACKAGE_ARCH = "all"
 
-PACKAGES += "task-gnome-gstreamer task-gnome-perl task-gnome-cups task-gnome-pulseaudio task-gnome-themes task-gnome-totem task-gnome-xserver-base "
-
-DEPENDS_task-gnome-gstreamer = " \
-  gst-plugins-base \
-  gst-plugins-good \
-  gst-plugins-bad \
-  gst-plugins-ugly \
-"
-
-RDEPENDS_task-gnome-gstreamer = " \
-  gst-ffmpeg \
-  gst-plugins-base-meta \
-"
+PACKAGES += "task-gnome-perl task-gnome-cups task-gnome-pulseaudio task-gnome-themes task-gnome-totem task-gnome-xserver-base "
 
 RDEPENDS_task-gnome-perl = " \
   perl \
diff --git a/recipes-angstrom/tasks/task-gnome-gstreamer.bb b/recipes-angstrom/tasks/task-gnome-gstreamer.bb
new file mode 100644
index 0000000..e0a520c
--- /dev/null
+++ b/recipes-angstrom/tasks/task-gnome-gstreamer.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Task for a image with gstreamer"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+PR = "r13"
+
+inherit task
+
+DEPENDS_${PN} = " \
+  gst-plugins-base \
+  gst-plugins-good \
+  gst-plugins-bad \
+  gst-plugins-ugly \
+"
+
+RDEPENDS_${PN} = " \
+  gst-ffmpeg \
+  gst-plugins-base-meta \
+"
-- 
1.7.4.4



