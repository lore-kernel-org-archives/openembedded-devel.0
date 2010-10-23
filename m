Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fidencio@profusion.mobi>) id 1P9RnS-0007Yq-62
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 02:17:19 +0200
Received: by mail-gw0-f47.google.com with SMTP id a11so1560489gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 17:16:42 -0700 (PDT)
Received: by 10.151.13.20 with SMTP id q20mr1993336ybi.434.1287793002110;
	Fri, 22 Oct 2010 17:16:42 -0700 (PDT)
Received: from localhost.localdomain ([201.82.29.28])
	by mx.google.com with ESMTPS id u3sm4239972ani.19.2010.10.22.17.16.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Oct 2010 17:16:41 -0700 (PDT)
From: fidencio@profusion.mobi
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Oct 2010 22:15:49 -0200
Message-Id: <4cc22969.0311650a.0c4d.ffffaf63@mx.google.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <y>
References: <y>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fidencio@profusion.mobi
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 09/17] Added Expedite and Elementary tests to E17-related tasks
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
X-List-Received-Date: Sat, 23 Oct 2010 00:17:19 -0000

From: Eduardo Lima (Etrunko) <eblima@gmail.com>

Signed-off-by: Eduardo Lima (Etrunko) <eblima@gmail.com>
---
 recipes/angstrom/task-angstrom-e.bb |    4 ++--
 recipes/tasks/task-e-x11.bb         |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/angstrom/task-angstrom-e.bb b/recipes/angstrom/task-angstrom-e.bb
index eb063df..28273c1 100644
--- a/recipes/angstrom/task-angstrom-e.bb
+++ b/recipes/angstrom/task-angstrom-e.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Task packages for the Angstrom distribution"
-PR = "r0"
+PR = "r1"
 ALLOW_EMPTY = "1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -12,7 +12,7 @@ RDEPENDS_angstrom-e-base-depends := "\
     angstrom-x11-base-depends \
     rxvt-unicode xstroke xtscal xrandr xmodmap xdpyinfo \
     ttf-bitstream-vera \
-    e-wm \
+    elementary-tests expedite e-wm \
     glibc-charmap-utf-8 glibc-localedata-i18n"
 #xserver-kdrive-fbdev 
 
diff --git a/recipes/tasks/task-e-x11.bb b/recipes/tasks/task-e-x11.bb
index d691de6..64da9ba 100644
--- a/recipes/tasks/task-e-x11.bb
+++ b/recipes/tasks/task-e-x11.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Tasks for Enlightenment/X11"
-PR = "r10"
+PR = "r11"
 
 inherit task
 
@@ -17,7 +17,7 @@ RDEPENDS_task-e-x11-core = "rxvt-unicode xstroke xtscal xrandr xmodmap xdpyinfo
 #
 # E-core
 #
-RDEPENDS_task-e-x11-core += "e-wm"
+RDEPENDS_task-e-x11-core += "elementary-tests expedite e-wm"
 
 
 RDEPENDS_task-e-x11  = "task-e-x11-core"
-- 
1.7.3.1



