Received: from hrndva-omtalb.mail.rr.com ([71.74.56.125])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ed@hwdebug.com>) id 1NCUFT-00054z-Ia
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 09:26:18 +0100
Received: from hwd4 ([70.114.141.31]) by hrndva-omta01.mail.rr.com with ESMTP
	id <20091123075638760.YHBG4786@hrndva-omta01.mail.rr.com>;
	Mon, 23 Nov 2009 07:56:38 +0000
Received: from ed by hwd4 with local (Exim 4.69)
	(envelope-from <ed@hwd4.local>)
	id 1NCTmp-0001Kk-Gy; Mon, 23 Nov 2009 01:56:39 -0600
From: Ed Swarthout <Ed.Swarthout@hwdebug.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Nov 2009 01:56:39 -0600
Message-Id: <1258962999-5106-1-git-send-email-Ed.Swarthout@hwdebug.com>
X-Mailer: git-send-email 1.5.6.5
X-SA-Exim-Connect-IP: 71.74.56.125
X-SA-Exim-Mail-From: ed@hwdebug.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] x11vnc-0.9.8 fix xshm header
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
X-List-Received-Date: Mon, 23 Nov 2009 08:26:18 -0000

Backport X_ShmAttach fix from 0.9.9

Signed-off-by: Ed Swarthout <Ed.Swarthout@hwdebug.com>
---
 .../vnc/files/x11vnc-0.9.8-xshm-header-fix.patch   |   15 +++++++++++++++
 recipes/vnc/x11vnc_0.9.8.bb                        |    3 ++-
 2 files changed, 17 insertions(+), 1 deletions(-)
 create mode 100644 recipes/vnc/files/x11vnc-0.9.8-xshm-header-fix.patch

diff --git a/recipes/vnc/files/x11vnc-0.9.8-xshm-header-fix.patch b/recipes/vnc/files/x11vnc-0.9.8-xshm-header-fix.patch
new file mode 100644
index 0000000..3383f63
--- /dev/null
+++ b/recipes/vnc/files/x11vnc-0.9.8-xshm-header-fix.patch
@@ -0,0 +1,15 @@
+Looks like X_ShmAttach is considered private to the library and has been removed from its headers.
+Just hardcode the value, it's only usd to print some help in case of an shm attach error.
+--- x11vnc-0.9.8/x11vnc/cleanup.c
++++ x11vnc-0.9.8/x11vnc/cleanup.c
+@@ -276,6 +276,10 @@
+	return 0;
+ }
+
++#ifndef X_ShmAttach
++#define X_ShmAttach 1
++#endif
++
+ static int Xerror(Display *d, XErrorEvent *error) {
+	X_UNLOCK;
+
diff --git a/recipes/vnc/x11vnc_0.9.8.bb b/recipes/vnc/x11vnc_0.9.8.bb
index f3d706b..8c807f2 100644
--- a/recipes/vnc/x11vnc_0.9.8.bb
+++ b/recipes/vnc/x11vnc_0.9.8.bb
@@ -5,6 +5,7 @@ SECTION = "x11/utils"
 LICENSE = "GPL"
 DEPENDS = "openssl virtual/libx11 libxtst libxext avahi jpeg zlib"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/libvncserver/x11vnc-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/libvncserver/x11vnc-${PV}.tar.gz \
+	   file://x11vnc-0.9.8-xshm-header-fix.patch;patch=1"
 
 inherit autotools
-- 
1.5.6.5



