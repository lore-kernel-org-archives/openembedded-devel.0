Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RSEO0-0007nl-PZ
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Nov 2011 21:53:12 +0100
Received: (qmail invoked by alias); 20 Nov 2011 20:46:43 -0000
Received: from p5B0A3816.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.56.22]
	by mail.gmx.net (mp068) with SMTP; 20 Nov 2011 21:46:43 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18aS0Na7pIaJ3LSWw4yaG2pfrAcGR9QLp2kiGnZse
	ufXh05VPWJXuxj
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Nov 2011 21:46:39 +0100
Message-Id: <1321822001-3647-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-oe 1/3] iw: update to 3.2
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
X-List-Received-Date: Sun, 20 Nov 2011 20:53:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

to prepare support for libnl-3 we need to update iw.

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../iw/iw/kill-git-version-check.patch             |   26 --------------------
 .../iw/{iw_0.9.20.bb => iw_3.2.bb}                 |   15 +++--------
 2 files changed, 4 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/iw/iw/kill-git-version-check.patch
 rename meta-oe/recipes-connectivity/iw/{iw_0.9.20.bb => iw_3.2.bb} (51%)

diff --git a/meta-oe/recipes-connectivity/iw/iw/kill-git-version-check.patch b/meta-oe/recipes-connectivity/iw/iw/kill-git-version-check.patch
deleted file mode 100644
index 93aad02..0000000
--- a/meta-oe/recipes-connectivity/iw/iw/kill-git-version-check.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Index: iw-0.9.18/version.sh
-===================================================================
---- iw-0.9.18.orig/version.sh	2010-09-14 13:50:27.000000000 +0400
-+++ iw-0.9.18/version.sh	2010-09-14 13:50:40.000000000 +0400
-@@ -5,20 +5,6 @@
- 
- echo '#include "iw.h"' > "$OUT"
- 
--if head=`git rev-parse --verify HEAD 2>/dev/null`; then
--	git update-index --refresh --unmerged > /dev/null
--	descr=$(git describe)
--
--	# on git builds check that the version number above
--	# is correct...
--	[ "${descr%%-*}" = "v$VERSION" ] || exit 2
--
--	v="${descr#v}"
--	if git diff-index --name-only HEAD | read dummy ; then
--		v="$v"-dirty
--	fi
--else
--	v="$VERSION"
--fi
-+v="$VERSION"
- 
- echo "const char iw_version[] = \"$v\";" >> "$OUT"
diff --git a/meta-oe/recipes-connectivity/iw/iw_0.9.20.bb b/meta-oe/recipes-connectivity/iw/iw_3.2.bb
similarity index 51%
rename from meta-oe/recipes-connectivity/iw/iw_0.9.20.bb
rename to meta-oe/recipes-connectivity/iw/iw_3.2.bb
index 0b66e8d..ba7afdd 100644
--- a/meta-oe/recipes-connectivity/iw/iw_0.9.20.bb
+++ b/meta-oe/recipes-connectivity/iw/iw_3.2.bb
@@ -6,19 +6,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=878618a5c4af25e9b93ef0be1a93f774"
 
 DEPENDS = "libnl pkgconfig"
 
-SRC_URI = " \
-	http://wireless.kernel.org/download/iw/${P}.tar.bz2 \
-	file://kill-git-version-check.patch \
-	"
+SRC_URI = "http://wireless.kernel.org/download/iw/${P}.tar.bz2"
 
-SRC_URI[md5sum] = "1055799b544b3e08169d155bb6c21bb0"
-SRC_URI[sha256sum] = "2d665fbfbe4fd6a40159fb821518fc5337da37448416405b936a393a14cbc7d3"
+SRC_URI[md5sum] = "80615c972a287dcd50890735469b0d1c"
+SRC_URI[sha256sum] = "370edabe6f73cc55be77a7502a3a25d23ec2aea900ae4ca3cec19d55bf8bdb12"
 
-CFLAGS += "-DCONFIG_LIBNL20"
-
-do_compile() {
-	oe_runmake
-}
+CFLAGS += "-DCONFIG_LIBNL30"
 
 do_install() {
 	oe_runmake DESTDIR=${D} install
-- 
1.7.4.4



