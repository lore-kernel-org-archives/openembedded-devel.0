Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RIQnp-0003Cw-NF
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Oct 2011 22:07:21 +0200
Received: (qmail invoked by alias); 24 Oct 2011 20:01:19 -0000
Received: from p4FDF19E4.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.25.228]
	by mail.gmx.net (mp023) with SMTP; 24 Oct 2011 22:01:19 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+FIbUOesqFOZDqyUIOMaMYnFPvQ2paxkcLrLfQbB
	U8Tu2+3Q9/hrls
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Oct 2011 22:05:58 +0200
Message-Id: <1319486758-31956-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce] xfce-utils: update to 4.8.3
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
X-List-Received-Date: Mon, 24 Oct 2011 20:07:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* relative-symlinks-docs.patch was applied mainline [1]
* run tested on overo

[1] http://git.xfce.org/xfce/xfce-utils/commit/?id=6d76b3625dd5ad2206a9c17575e22d99d43c8ecc

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../xfce-utils/relative-symlinks-docs.patch        |   11 -----------
 .../{xfce-utils_4.8.2.bb => xfce-utils_4.8.3.bb}   |   11 ++---------
 2 files changed, 2 insertions(+), 20 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfce-utils/xfce-utils/relative-symlinks-docs.patch
 rename meta-xfce/recipes-xfce/xfce-utils/{xfce-utils_4.8.2.bb => xfce-utils_4.8.3.bb} (66%)

diff --git a/meta-xfce/recipes-xfce/xfce-utils/xfce-utils/relative-symlinks-docs.patch b/meta-xfce/recipes-xfce/xfce-utils/xfce-utils/relative-symlinks-docs.patch
deleted file mode 100644
index d0d80fe..0000000
--- a/meta-xfce/recipes-xfce/xfce-utils/xfce-utils/relative-symlinks-docs.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/doc/manual/Makefile.am	2011-06-18 08:05:25.000000000 +0200
-+++ b/doc/manual/Makefile.am	2011-07-13 21:45:17.079143002 +0200
-@@ -21,7 +21,7 @@
- 			done; \
- 			if test x"$$lang" != x"C" -a ! -d $(srcdir)/images/$$lang; then \
- 				echo "--- Creating symlink to C images for $$lang"; \
--				ln -sf $(docdir)/html/C/images $$dest/images; \
-+				ln -sf ../C/images $$dest/images; \
- 			fi \
- 		fi \
- 	done;
diff --git a/meta-xfce/recipes-xfce/xfce-utils/xfce-utils_4.8.2.bb b/meta-xfce/recipes-xfce/xfce-utils/xfce-utils_4.8.3.bb
similarity index 66%
rename from meta-xfce/recipes-xfce/xfce-utils/xfce-utils_4.8.2.bb
rename to meta-xfce/recipes-xfce/xfce-utils/xfce-utils_4.8.3.bb
index 34d87d2..e4b8686 100644
--- a/meta-xfce/recipes-xfce/xfce-utils/xfce-utils_4.8.2.bb
+++ b/meta-xfce/recipes-xfce/xfce-utils/xfce-utils_4.8.3.bb
@@ -4,15 +4,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 DEPENDS = "gtk+ virtual/libx11 dbus libxfce4util libxfce4ui"
 
-PR = "r1"
-
 inherit xfce
 
-# SRC_URI must follow inherited one
-SRC_URI += " \
-    file://relative-symlinks-docs.patch \
-"
-
 # usually we do not migrate (requires perl on target)
 EXTRA_OECONF += "--disable-xfconf-migration"
 
@@ -23,5 +16,5 @@ FILES_${PN} += " \
 "
 RDEPENDS_${PN} = "xrdb openssh-misc"
 
-SRC_URI[md5sum] = "7f48198f4bee3edf7869064c2922c609"
-SRC_URI[sha256sum] = "a12b708b0cd19ffa07afb2ab2cd1bf9377ff7fbbfbe16d7493a5bb973bcb0aa5"
+SRC_URI[md5sum] = "03b5fba5f63f4f1a31cc7d3728f3c87e"
+SRC_URI[sha256sum] = "035070d7e608b29dbaeeb6ec541d8c2edbd28152d3ef111316c33871ab02b926"
-- 
1.7.4.4



