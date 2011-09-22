Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R6ktB-0007Hc-FP
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Sep 2011 17:08:40 +0200
Received: (qmail invoked by alias); 22 Sep 2011 15:03:17 -0000
Received: from p5B0A1554.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.21.84]
	by mail.gmx.net (mp069) with SMTP; 22 Sep 2011 17:03:17 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+CFSRlWF+CYdADBHWsvQZXGBTY78id91198MPKMh
	lqZLxsTzcTJIoc
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Sep 2011 17:06:36 +0200
Message-Id: <1316704004-19647-6-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1316704004-19647-1-git-send-email-schnitzeltony@gmx.de>
References: <1316704004-19647-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce V2 05/13] xfce4-session: Bump to version 4.8.2
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
X-List-Received-Date: Thu, 22 Sep 2011 15:08:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

relative-symlinks-docs.patch is now mainline [1]

[1] http://git.xfce.org/xfce/xfce4-session/commit/?id=00159a379b8b192615137e59b66d5317493f57f3

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../xfce4-session/relative-symlinks-docs.patch     |   11 -----------
 ...ce4-session_4.8.1.bb => xfce4-session_4.8.2.bb} |    9 ++-------
 2 files changed, 2 insertions(+), 18 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session/relative-symlinks-docs.patch
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.8.1.bb => xfce4-session_4.8.2.bb} (77%)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/relative-symlinks-docs.patch b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/relative-symlinks-docs.patch
deleted file mode 100644
index fb78c57..0000000
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/relative-symlinks-docs.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/doc/manual/Makefile.am	2010-09-08 18:37:19.000000000 +0200
-+++ b/doc/manual/Makefile.am	2011-07-17 23:17:28.602626999 +0200
-@@ -20,7 +20,7 @@
- 			done; \
- 			if test x"$$lang" != x"C" -a ! -d $(srcdir)/images/$$lang; then \
- 				echo "--- Creating symlink to C images for $$lang"; \
--				ln -sf $(docdir)/html/C/images $(DESTDIR)$(docdir)/html/$$lang/images; \
-+				ln -sf ../C/images $(DESTDIR)$(docdir)/html/$$lang/images; \
- 			fi \
- 		fi \
- 	done;
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.1.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.2.bb
similarity index 77%
rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.1.bb
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.2.bb
index bedd35f..65b1add 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.2.bb
@@ -9,11 +9,6 @@ PR = "r0"
 
 inherit xfce
 
-# SRC_URI must follow inherited one
-SRC_URI += " \
-    file://relative-symlinks-docs.patch \
-"
-
 # protect from frightening message that xfce might not work correctly
 pkg_postinst_${PN} () {
     echo 127.0.0.1    ${MACHINE} >> /etc/hosts
@@ -28,5 +23,5 @@ FILES_${PN}-dbg += "${libdir}/xfce4/*/*/.debug"
 
 FILES_${PN}-dev += "${libdir}/xfce4/*/*/*.*a"
 
-SRC_URI[md5sum] = "478080ff666fdd36786a243829663efd"
-SRC_URI[sha256sum] = "1df52a77d87ed4d27b4f40a2f03a0b6334422d64bdc4e31b9aac22e25e68b829"
+SRC_URI[md5sum] = "48780cbcf784ab64debc9312f17765f2"
+SRC_URI[sha256sum] = "31bca2a559e05a8a859f150394a901517e5842414ef171a85c5da234e344c0d0"
-- 
1.7.4.4



