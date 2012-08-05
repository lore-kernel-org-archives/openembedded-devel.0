Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sxoea-00039L-RE
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 02:25:09 +0200
Received: by wibhm11 with SMTP id hm11so570600wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 17:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=27ZNI0ByQDlOFcJ8FLzJx2KCPJ66XkTKOb6UzqACGCM=;
	b=s0Vi8InnHJLTLZyJg6Mcr4L0o4CUB+89fpCeqp3GuJ+G4QLhaw22mLdgzl/qUUPEer
	k+1yczOiutVsR7f0E3ULHMgWER0zl3G4FnWOKETSQacGd/aRTH3OjwWzJt6whgl2WKVh
	XM8NGkgipKYuv7/ory0DJdg0g6m1ihiHo1K/rJY+t1MGJHHjWahe5qWTL1rB3anhc5Gr
	ksk/QeaomtES15lTnqn14HsVJFtjne+S+s2yT6rNZCANG9zBHdtIJXgjO7JaXftmH4H8
	5ohGxzyIfGnHLNO1uxGzGV1nEYjIy+HWKdZiC5jbCDmX+xznmlsBgd8VU+ZGtXQzdJQ/
	BQSw==
Received: by 10.216.237.149 with SMTP id y21mr3347958weq.102.1344125606417;
	Sat, 04 Aug 2012 17:13:26 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0E34.dip.t-dialin.net.
	[91.10.14.52])
	by mx.google.com with ESMTPS id l6sm6430551wiz.4.2012.08.04.17.13.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Aug 2012 17:13:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Aug 2012 02:20:01 +0200
Message-Id: <1344126001-19256-17-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
References: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-angstrom 16/16] angstrom-task-gnome3: split out task-gnome3-xserver-base
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
X-List-Received-Date: Sun, 05 Aug 2012 00:25:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-angstrom/tasks/angstrom-task-gnome3.bb    |   20 --------------------
 recipes-angstrom/tasks/task-gnome-xserver-base.bb |    3 +++
 2 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/recipes-angstrom/tasks/angstrom-task-gnome3.bb b/recipes-angstrom/tasks/angstrom-task-gnome3.bb
index 7a4fabd..ec25c3e 100644
--- a/recipes-angstrom/tasks/angstrom-task-gnome3.bb
+++ b/recipes-angstrom/tasks/angstrom-task-gnome3.bb
@@ -6,26 +6,6 @@ PR = "r6"
 
 inherit task
 
-# Most of these tasks are arch independant
-PACKAGE_ARCH = "all"
-
-PACKAGES += "task-gnome3-xserver-base "
-
-RDEPENDS_task-gnome3-xserver-base = " \
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
   task-gnome3-fonts \
   task-gnome3 \
diff --git a/recipes-angstrom/tasks/task-gnome-xserver-base.bb b/recipes-angstrom/tasks/task-gnome-xserver-base.bb
index e43cfb9..1b3a070 100644
--- a/recipes-angstrom/tasks/task-gnome-xserver-base.bb
+++ b/recipes-angstrom/tasks/task-gnome-xserver-base.bb
@@ -6,6 +6,9 @@ PR = "r13"
 
 inherit task
 
+# for backwards compatibility
+RPROVIDES_${PN} += "task-gnome3-xserver-base"
+
 RDEPENDS_${PN} = " \
   dbus-x11 \
   iso-codes \
-- 
1.7.4.4



