Return-Path: <rapphil@gmail.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2D4ED7258D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 18:15:34 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id x3so10770669qcv.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 10:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cJWNVREgaMNViMhNjV/RorlI3pnOGCABksrFT+9U658=;
	b=WeGbZAf3FyvUO1YUQ5TmSmrdbCH76Z+cj56kBaLnik7JgnRJIapYuILCNBeC6NX0bU
	bj1yTRlYp9vFjqf5DFNH70GeQWlaBRIOtFzopN7iGSKtfYi2cBVBB7Wz7rj7j35Ff22R
	sK27YcNSE/hnhc8Pnq/htJNklGoc1b1y5abLhr3oUp2HHsWBLZgEqDK+g0rffEMyoTcP
	QU8Nbgd72lUR5+j4FyNRCu2kM9Y5mgPbzF3ktV+qzStbkfD1CkicWEldfle57T3oKe5s
	2f6YS7BLNs1bvU+B0DT07yG9a5oDG09mMYYXAmVfBsei8ils6D3bhmPXY1PGb04cSP5C
	g4hg==
X-Received: by 10.224.4.196 with SMTP id 4mr6416111qas.35.1418753735374;
	Tue, 16 Dec 2014 10:15:35 -0800 (PST)
Received: from localhost.localdomain (host29.reason.com.br. [187.49.239.29])
	by mx.google.com with ESMTPSA id h36sm1488696qge.25.2014.12.16.10.15.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Dec 2014 10:15:34 -0800 (PST)
From: Raphael Silva <rapphil@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Dec 2014 16:15:21 -0200
Message-Id: <1418753722-2555-1-git-send-email-rapphil@gmail.com>
X-Mailer: git-send-email 2.2.0
Subject: [meta-oe][PATCH 1/2] omgps: fix do_compile error due to uninitialized variable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Dec 2014 18:15:42 -0000

The problem happended since there was an uninitialized variable
with gcc 4.9 and the parameter -Werror=maybe-uninitialized.
Initialized the variable and checked for side effects.
Removed from blacklist.

Signed-off-by: Raphael Silva <rapphil@gmail.com>
---
 .../omgps/omgps/fix.build.with.gcc.4.9.patch       | 22 ++++++++++++++++++++++
 meta-oe/recipes-navigation/omgps/omgps_svn.bb      |  2 +-
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-navigation/omgps/omgps/fix.build.with.gcc.4.9.patch

diff --git a/meta-oe/recipes-navigation/omgps/omgps/fix.build.with.gcc.4.9.patch b/meta-oe/recipes-navigation/omgps/omgps/fix.build.with.gcc.4.9.patch
new file mode 100644
index 0000000..26eb926
--- /dev/null
+++ b/meta-oe/recipes-navigation/omgps/omgps/fix.build.with.gcc.4.9.patch
@@ -0,0 +1,22 @@
+omgps: omgps fails compilation due to uninitialized variables
+
+omgps does not compile with gcc 4.9 due to uninitialized variables 
+with the option -Werror=maybe-uninitialized
+To solve the problem, just initiated the variable and checked for side
+effects.
+Upstream-Status: Submitted
++https://code.google.com/p/omgps/issues/detail?id=16
+
+Signed-off-by: Raphael Silva <rapphil@gmail.com>
+diff -urpN omgps.orig/src/sound.c omgps/src/sound.c
+--- omgps.orig/src/sound.c	2014-12-14 15:13:29.609243994 -0200
++++ omgps/src/sound.c	2014-12-14 15:14:13.831116745 -0200
+@@ -44,7 +44,7 @@ static gboolean play_sound_files(char *f
+ 		return FALSE;
+ 
+ 	char *bak = strdup(files);
+-	char *saveptr;
++	char *saveptr = NULL;
+ 	char *p = strtok_r(bak, ";", &saveptr);
+ 
+ 	#define MAX_SOUND_FILES 14
diff --git a/meta-oe/recipes-navigation/omgps/omgps_svn.bb b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
index 2304b36..14c5801 100644
--- a/meta-oe/recipes-navigation/omgps/omgps_svn.bb
+++ b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
@@ -9,7 +9,6 @@ PV = "0.1+svnr${SRCPV}"
 PR = "r2"
 S = "${WORKDIR}/${PN}"
 
-PNBLACKLIST[omgps] = "BROKEN: sound.c:61:35: error: 'saveptr' may be used uninitialized in this function [-Werror=maybe-uninitialized]"
 
 do_configure_prepend() {
     sed -i "s#PY_VERSION = 2.6#PY_VERSION = ${PYTHON_BASEVERSION}#g" ${S}/Makefile.am
@@ -24,6 +23,7 @@ SRC_URI = "svn://omgps.googlecode.com/svn/trunk;module=omgps;protocol=http \
            file://fix.build.with.glib.2.34.patch \
            file://gdk-pixbuf-2.26.5.patch \
            file://0001-g_type_init-is-deprecated-for-glib-2.35.0.patch \
+           file://fix.build.with.gcc.4.9.patch \
 "
 
 inherit autotools pkgconfig
-- 
2.2.0


