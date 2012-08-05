Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SxoeO-0002TC-FK
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 02:24:56 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1123970wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 17:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=ISp8kBuL0WbFxa1vuCxj+y0MBVeQllDQDxzfUy2PRLM=;
	b=ubBAeX3AEqxOBzQyg2sASxBOeP3xpBdQBVRY94PHLvHbTDz+iaCLSpcQHDZNSTBqmU
	tVbNdu0WvL6GnmefQUwiTU+WYKTMO9aOyvzVTt/rEJ8ITlf0rgMt97CNk9UyOzNMQOgi
	b7qNYrPc7l8g+9oUCOD3S3et1iku/vdN7s9pLvJJCnpcv8ZQq+e4lk0AUYDiJYPlMZ3p
	2DJUtDqftAK/Z7q/luW5w7UT7ICfyzytrmL6VflYch1m40cCpsebWFNsG2NvUEsCk3/C
	z3DhrfxMryhoNj6Akh7Z73S0rQsDbVz9zSDzb8YLJr1E1rD/i1qiF6G6JxDSisacGV6N
	3Tpw==
Received: by 10.216.232.84 with SMTP id m62mr3060729weq.200.1344125594793;
	Sat, 04 Aug 2012 17:13:14 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0E34.dip.t-dialin.net.
	[91.10.14.52])
	by mx.google.com with ESMTPS id l6sm6430551wiz.4.2012.08.04.17.13.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Aug 2012 17:13:14 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Aug 2012 02:19:53 +0200
Message-Id: <1344126001-19256-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
References: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-angstrom 08/16] angstrom-task-gnome: split out task-gnome-xserver-base
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
 recipes-angstrom/tasks/angstrom-task-gnome.bb     |   20 -------------------
 recipes-angstrom/tasks/task-gnome-xserver-base.bb |   22 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 20 deletions(-)
 create mode 100644 recipes-angstrom/tasks/task-gnome-xserver-base.bb

diff --git a/recipes-angstrom/tasks/angstrom-task-gnome.bb b/recipes-angstrom/tasks/angstrom-task-gnome.bb
index 66b00bb..47e114c 100644
--- a/recipes-angstrom/tasks/angstrom-task-gnome.bb
+++ b/recipes-angstrom/tasks/angstrom-task-gnome.bb
@@ -6,26 +6,6 @@ PR = "r13"
 
 inherit task
 
-# Most of these tasks are arch independant
-PACKAGE_ARCH = "all"
-
-PACKAGES += "task-gnome-xserver-base "
-
-RDEPENDS_task-gnome-xserver-base = " \
-  dbus-x11 \
-  iso-codes \
-  mime-support \
-  xauth \
-  xdg-utils \
-  xhost \
-  xinetd \
-  xinit \
-  xrandr \
-  xrdb \
-  xset \
-  xvinfo \
- "
-
 RDEPENDS_${PN} = " \
   task-gnome-fonts \
   task-gnome \
diff --git a/recipes-angstrom/tasks/task-gnome-xserver-base.bb b/recipes-angstrom/tasks/task-gnome-xserver-base.bb
new file mode 100644
index 0000000..e43cfb9
--- /dev/null
+++ b/recipes-angstrom/tasks/task-gnome-xserver-base.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Task for a full GNOME based image"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+PR = "r13"
+
+inherit task
+
+RDEPENDS_${PN} = " \
+  dbus-x11 \
+  iso-codes \
+  mime-support \
+  xauth \
+  xdg-utils \
+  xhost \
+  xinetd \
+  xinit \
+  xrandr \
+  xrdb \
+  xset \
+  xvinfo \
+"
-- 
1.7.4.4



