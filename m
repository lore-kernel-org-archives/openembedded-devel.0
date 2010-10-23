Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fidencio@profusion.mobi>) id 1P9RnL-0007dV-TE
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 02:17:14 +0200
Received: by gyg13 with SMTP id 13so1138049gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 17:16:33 -0700 (PDT)
Received: by 10.101.71.15 with SMTP id y15mr2413900ank.180.1287792992447;
	Fri, 22 Oct 2010 17:16:32 -0700 (PDT)
Received: from localhost.localdomain ([201.82.29.28])
	by mx.google.com with ESMTPS id u3sm4239972ani.19.2010.10.22.17.16.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Oct 2010 17:16:31 -0700 (PDT)
From: fidencio@profusion.mobi
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Oct 2010 22:15:44 -0200
Message-Id: <4cc2295f.0311650a.0c4d.ffffaf5d@mx.google.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <y>
References: <y>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fidencio@profusion.mobi
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 04/17] Remove entrance from dependency list of recipes
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
X-List-Received-Date: Sat, 23 Oct 2010 00:17:14 -0000

From: Eduardo Lima (Etrunko) <eblima@gmail.com>

Entrance is deprecated, broken and can't even be found on E svn repository
anymore. Removing it from tasks/task-e-x11.bb and angstrom/task-angstrom-e.bb.

Still keeping its recipe though, in case someone brings it back from the dead.

Signed-off-by: Eduardo Lima (Etrunko) <eblima@gmail.com>
---
 recipes/angstrom/task-angstrom-e.bb |    2 +-
 recipes/tasks/task-e-x11.bb         |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/angstrom/task-angstrom-e.bb b/recipes/angstrom/task-angstrom-e.bb
index eb9f025..eb063df 100644
--- a/recipes/angstrom/task-angstrom-e.bb
+++ b/recipes/angstrom/task-angstrom-e.bb
@@ -12,7 +12,7 @@ RDEPENDS_angstrom-e-base-depends := "\
     angstrom-x11-base-depends \
     rxvt-unicode xstroke xtscal xrandr xmodmap xdpyinfo \
     ttf-bitstream-vera \
-    entrance e-wm \
+    e-wm \
     glibc-charmap-utf-8 glibc-localedata-i18n"
 #xserver-kdrive-fbdev 
 
diff --git a/recipes/tasks/task-e-x11.bb b/recipes/tasks/task-e-x11.bb
index 3663532..d691de6 100644
--- a/recipes/tasks/task-e-x11.bb
+++ b/recipes/tasks/task-e-x11.bb
@@ -17,7 +17,7 @@ RDEPENDS_task-e-x11-core = "rxvt-unicode xstroke xtscal xrandr xmodmap xdpyinfo
 #
 # E-core
 #
-RDEPENDS_task-e-x11-core += "entrance e-wm"
+RDEPENDS_task-e-x11-core += "e-wm"
 
 
 RDEPENDS_task-e-x11  = "task-e-x11-core"
-- 
1.7.3.1



