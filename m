Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOkLC-0004oZ-Tt
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:44:10 +0200
Received: by wibhj13 with SMTP id hj13so2042856wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=9aIMNWGn42/8TwVLFgAwV/WiSMxxPJLYmdSHslF0BLI=;
	b=FKoKA7AhLrv0hr4HwxQBIyYCbi8uSMqe2fJlRCWTwPXuawJRC/mncLlTwGUpTa3PLQ
	HZcGVbuehy5n0gV4AgPV+YjR2LjophepObsOHGq7HHa6Uth3/sGxBxOOsoVtFPJLmY8w
	LfMKko59dFHC3rLxcCBFlmj3hbwv8foTUnkYj5f2BxKE409VCCZJP+LCLA5IRPEwY1LQ
	2yhWRbmbAeqOuHvRloTGkoWZJDD8/Bp2d4hEgjRJQyGFDmfuHBHlbNf8rFlwYjcbfdxB
	mVt+svhAizlTPQXAhC1dQ1XzckJeJUQTr2Y4sAtG3V3m7XC+TPEE9ntBZfFGvoo7DkW0
	yy0g==
Received: by 10.180.101.65 with SMTP id fe1mr25994011wib.21.1335767669624;
	Sun, 29 Apr 2012 23:34:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ff9sm26405561wib.2.2012.04.29.23.34.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 23:34:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 08:33:06 +0200
Message-Id: <c11555a5906577ce02d5569023d2025548334839.1335767139.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 09/16] gpsd: replace whole do_install from scons.bbclass
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
X-List-Received-Date: Mon, 30 Apr 2012 06:44:11 -0000

* prefix was wrong, because SConstruct expects prefix usable as RPATH and DESTDIR
  not DESTDIR/prefix combined together in prefix variable

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
index d139091..fae3492 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
@@ -46,13 +46,18 @@ do_compile_prepend() {
     export HOST_SYS="${HOST_SYS}"
 }
 
-do_install_prepend() {
+do_install() {
     export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
     export PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\" pkg-config"
     export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
 
     export BUILD_SYS="${BUILD_SYS}"
     export HOST_SYS="${HOST_SYS}"
+
+    export DESTDIR="${D}"
+    # prefix is used for RPATH and DESTDIR/prefix for instalation
+    ${STAGING_BINDIR_NATIVE}/scons prefix=${prefix} install ${EXTRA_OESCONS}|| \
+      bbfatal "scons install execution failed."
 }
 
 do_install_append() {
-- 
1.7.8.6



