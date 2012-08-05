Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SxoeI-0002RW-Po
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 02:24:50 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1458788wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 17:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=tFRJPd7BGGpBg2nLwMjFe1fkohungESkL0r+i6yIaME=;
	b=viRnX5xjDoSkWh9T6owa/iEUz41Un6uAulJMRW5SOFBd5v2S9NGVjtWcc7zldSclZ/
	taa/ToUjPblKxM4Ro2pr/pa2ev0E6vcrkQGUnSTb4DHMlcwM57vmqdz7ok1bsPnrlODa
	no7uGFd5LKAbEFtxhNYrVlbbDjjvqs5S4Ec4i6NCudc8D8acSuV1V7QtRkPyf/VwzEDe
	nvv3AoYCyVDdA7K+DMN469maxVhgDL/fwb7PPc97VKK28hOlG4Sj4NUoYXY5lbcqAe0U
	MbpUNONDairuCc+6nPBrU6ADOpJSnGmlxZmTpGXGVMtr3yWP17ryHCiK/XC5ZYFUK9xX
	znwg==
Received: by 10.180.84.164 with SMTP id a4mr7337096wiz.12.1344125590468;
	Sat, 04 Aug 2012 17:13:10 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0E34.dip.t-dialin.net.
	[91.10.14.52])
	by mx.google.com with ESMTPS id l6sm6430551wiz.4.2012.08.04.17.13.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Aug 2012 17:13:09 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Aug 2012 02:19:50 +0200
Message-Id: <1344126001-19256-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
References: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-angstrom 05/16] angstrom-task-gnome: split out task-gnome-perl
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
 recipes-angstrom/tasks/angstrom-task-gnome.bb |    7 +------
 recipes-angstrom/tasks/task-gnome-perl.bb     |   12 ++++++++++++
 2 files changed, 13 insertions(+), 6 deletions(-)
 create mode 100644 recipes-angstrom/tasks/task-gnome-perl.bb

diff --git a/recipes-angstrom/tasks/angstrom-task-gnome.bb b/recipes-angstrom/tasks/angstrom-task-gnome.bb
index 3ba3b7c..9488d1d 100644
--- a/recipes-angstrom/tasks/angstrom-task-gnome.bb
+++ b/recipes-angstrom/tasks/angstrom-task-gnome.bb
@@ -9,12 +9,7 @@ inherit task
 # Most of these tasks are arch independant
 PACKAGE_ARCH = "all"
 
-PACKAGES += "task-gnome-perl task-gnome-cups task-gnome-pulseaudio task-gnome-themes task-gnome-totem task-gnome-xserver-base "
-
-RDEPENDS_task-gnome-perl = " \
-  perl \
-  libxml-parser-perl \
-"
+PACKAGES += "task-gnome-cups task-gnome-pulseaudio task-gnome-themes task-gnome-totem task-gnome-xserver-base "
 
 RDEPENDS_task-gnome-themes = " \
   angstrom-gnome-icon-theme-enable \
diff --git a/recipes-angstrom/tasks/task-gnome-perl.bb b/recipes-angstrom/tasks/task-gnome-perl.bb
new file mode 100644
index 0000000..8c24f0d
--- /dev/null
+++ b/recipes-angstrom/tasks/task-gnome-perl.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Task for images with perl"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+PR = "r13"
+
+inherit task
+
+RDEPENDS_${PN} = " \
+  perl \
+  libxml-parser-perl \
+"
-- 
1.7.4.4



