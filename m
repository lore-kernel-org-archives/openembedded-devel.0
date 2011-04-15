Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <patda293@student.liu.se>) id 1QAm9Q-000794-DD
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Apr 2011 18:45:45 +0200
Received: by bwz5 with SMTP id 5so2589202bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2011 09:43:24 -0700 (PDT)
Received: by 10.204.49.87 with SMTP id u23mr227392bkf.171.1302885804189;
	Fri, 15 Apr 2011 09:43:24 -0700 (PDT)
Received: from localhost.localdomain ([130.236.250.26])
	by mx.google.com with ESMTPS id q18sm1654189bka.15.2011.04.15.09.43.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Apr 2011 09:43:23 -0700 (PDT)
From: =?UTF-8?q?Patrik=20Dahlstr=C3=B6m?= <patda293@student.liu.se>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Apr 2011 18:42:40 +0200
Message-Id: <1302885760-32195-1-git-send-email-patda293@student.liu.se>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH v2] firefox: Added libIDL-2.0 CFLAGS and LIBS
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
X-List-Received-Date: Fri, 15 Apr 2011 16:45:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* autoconf does not fill in any CFLAGS or LIBS for libIDL-2.0. This
  patch sets the appropriate flags in autoconf.mk.in for
  HOST_LIBIDL_CFLAGS and HOST_LIBIDL_LIBS.

Signed-off-by: Patrik Dahlström <patda293@student.liu.se>
---
 recipes/mozilla/firefox_3.6.8.bb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes/mozilla/firefox_3.6.8.bb b/recipes/mozilla/firefox_3.6.8.bb
index 04dde08..828822c 100644
--- a/recipes/mozilla/firefox_3.6.8.bb
+++ b/recipes/mozilla/firefox_3.6.8.bb
@@ -28,6 +28,7 @@ SRC_URI[archive.md5sum] = "0ee5f14fd8be07513d16131027ebcb61"
 SRC_URI[archive.sha256sum] = "fc609cc6a0ddaa2a9ebd8511ec39ae4a404e1107a12e07b233e2afca51d9a10e"
 
 S = "${WORKDIR}/mozilla-1.9.2"
+export PKG_CONFIG=${STAGING_BINDIR_NATIVE}/pkg-config
 
 inherit mozilla
 require firefox.inc
@@ -37,7 +38,9 @@ EXTRA_OECONF += " --enable-official-branding --disable-crashreporter"
 FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
 
 do_compile_prepend() {
-	cp ${WORKDIR}/jsautocfg.h ${S}/js/src/
-	sed -i "s|CPU_ARCH =|CPU_ARCH = ${TARGET_ARCH}|" security/coreconf/Linux.mk
+    cp ${WORKDIR}/jsautocfg.h ${S}/js/src/
+    sed -i "s|CPU_ARCH =|CPU_ARCH = ${TARGET_ARCH}|" security/coreconf/Linux.mk
+    sed -i "s|HOST_LIBIDL_CFLAGS = \@HOST_LIBIDL_CFLAGS\@|HOST_LIBIDL_CFLAGS = $(pkg-config --cflags libIDL-2.0)|" config/autoconf.mk.in
+    sed -i "s|HOST_LIBIDL_LIBS   = @HOST_LIBIDL_LIBS@|HOST_LIBIDL_LIBS = $(pkg-config --libs libIDL-2.0)|" config/autoconf.mk.in
 }
 
-- 
1.7.4.1



