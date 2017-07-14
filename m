Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id D5DBD7822C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 18:35:09 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id z6so11828976pfk.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 11:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GMtE9YmiUcbvjoELTLqHnw17PYILm+V0CjdlYjvZn9Y=;
	b=JVPc12v6QifEl1SFvlrLYDY8b9gOOtFL/zIxMhVWBNM6pnK/Wp95J70I6S4KzNdpXf
	7jGgfCTBb/KysVn6eE5cty4SP0kX+U4x5E5UY6Z15GsqX7GySkpQCii3zxeqg2m1NU7V
	BzyPckwpsGu9y8L/jwPZTVNAbxJ1tumAAPgCRgbPM0DAtmcUHi/ydhJEN3WZWJakaMMk
	QCNaZF95mmPu8N1VHARley3Sn8CviJ/ovpLVjTk7EYNOQGP7Bg28Xw4zLFNp2AuIHkDj
	1XRMor2UXoTIxSP3UQsWQdl7th2FMdO2cfvAS+Q43RVF+LczZvrPqIXXAJxvLq1tKDcJ
	X2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GMtE9YmiUcbvjoELTLqHnw17PYILm+V0CjdlYjvZn9Y=;
	b=KGuu3u4oJDaxiaDw+C+AyZpJORdRDADy50b+sEE1LNSasMfaGn5KhEmV/E13PzANSe
	Iydu1iCoT3sURwr33ggmriIUw1wv9Mc8rsY69lxHYLJZM/SY5MhVKPCsXdnLLhgYI899
	fHYOZkl2jf1b9/j0WThQcirp/jnSgVNRLre2pUqp2szSgM1hZTXx8VbhxsvKu6Ohx1WH
	hMAH+nTp63wVLFkjt/B+TSwo6eMdLFFmLGw2rnhkdBdzL2GYVp0fX7cn+CpMoyfYQ6Qt
	uoArUiAgJ0Kupw2Ql0KApJZ/bEO7l0hGdRDwaRt9eh2YN5XKdakelIHCUIwQKAKg29zS
	zo6w==
X-Gm-Message-State: AIVw111wKBUeJMeuO3k1oRjfVrGACdf4ridupgBux5JUcvoAug8mNGrO
	bAOcO6kSZ0hd7Y0f
X-Received: by 10.98.11.4 with SMTP id t4mr6796925pfi.104.1500057310720;
	Fri, 14 Jul 2017 11:35:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	70sm18639581pft.104.2017.07.14.11.35.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 11:35:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Jul 2017 11:34:53 -0700
Message-Id: <20170714183456.22548-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170714183456.22548-1-raj.khem@gmail.com>
References: <20170714183456.22548-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/6] nmon: Upgrade to 16g
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Jul 2017 18:35:09 -0000

Fix build with musl while here.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-lmon16g.c-Adjust-system-headers.patch     | 46 ++++++++++++++++++++++
 .../nmon/{nmon_13g.bb => nmon_16g.bb}              | 14 ++++---
 2 files changed, 54 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-support/nmon/nmon/0001-lmon16g.c-Adjust-system-headers.patch
 rename meta-oe/recipes-support/nmon/{nmon_13g.bb => nmon_16g.bb} (62%)

diff --git a/meta-oe/recipes-support/nmon/nmon/0001-lmon16g.c-Adjust-system-headers.patch b/meta-oe/recipes-support/nmon/nmon/0001-lmon16g.c-Adjust-system-headers.patch
new file mode 100644
index 000000000..e8debe56a
--- /dev/null
+++ b/meta-oe/recipes-support/nmon/nmon/0001-lmon16g.c-Adjust-system-headers.patch
@@ -0,0 +1,46 @@
+From d977b5170027926eb97ab9742ddc51d2a5555a34 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 14 Jul 2017 10:06:49 -0700
+Subject: [PATCH] lmon16g.c: Adjust system headers
+
+fstab.h is unused
+errno.h is in /usr/include
+defines from sys/cdefs.h is used
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lmon16g.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lmon16g.c b/lmon16g.c
+index cb27e09..d2a11c5 100644
+--- a/lmon16g.c
++++ b/lmon16g.c
+@@ -63,7 +63,7 @@ static char *SccsId = "nmon " VERSION;
+ #include <fcntl.h>
+ #include <math.h>
+ #include <time.h>
+-#include <sys/errno.h>
++#include <errno.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/ioctl.h>
+@@ -71,6 +71,7 @@ static char *SccsId = "nmon " VERSION;
+ #include <sys/time.h>
+ #include <sys/socket.h>
+ #include <sys/wait.h>
++#include <sys/cdefs.h>
+ 
+ /* Windows moved here so they can be cleared when the screen mode changes */
+ WINDOW *padwelcome = NULL;
+@@ -576,7 +577,6 @@ struct procsinfo {
+ int isroot = 0;
+ 
+ #include <mntent.h>
+-#include <fstab.h>
+ #include <sys/stat.h>
+ #include <sys/statfs.h>
+ #include <net/if.h>
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-support/nmon/nmon_13g.bb b/meta-oe/recipes-support/nmon/nmon_16g.bb
similarity index 62%
rename from meta-oe/recipes-support/nmon/nmon_13g.bb
rename to meta-oe/recipes-support/nmon/nmon_16g.bb
index 1f7518972..6232f8626 100644
--- a/meta-oe/recipes-support/nmon/nmon_13g.bb
+++ b/meta-oe/recipes-support/nmon/nmon_16g.bb
@@ -4,14 +4,14 @@ SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/Documentation.txt;md5=dbb13658cf55d687c4f2ff771a696d4a"
 DEPENDS = "ncurses"
-PR = "r2"
+DEPENDS_append_libc-musl = " bsd-headers"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/nmon/lmon13g.c;name=lmon \
+SRC_URI = "${SOURCEFORGE_MIRROR}/nmon/lmon${PV}.c;name=lmon \
            ${SOURCEFORGE_MIRROR}/nmon/Documentation.txt;name=doc \
+           file://0001-lmon16g.c-Adjust-system-headers.patch \
 "
-
-SRC_URI[lmon.md5sum] = "b1b8e6c0123ad232394991f2d4f40494"
-SRC_URI[lmon.sha256sum] = "456ab2a342b31d1a352d0d940af5962fa65a12ae8757ff73e6e73210832ae8b5"
+SRC_URI[lmon.md5sum] = "246ccfc74d5af55d992601fc4d3d4a72"
+SRC_URI[lmon.sha256sum] = "da82dd693b503b062854dfe7dbb5d36b347872ab44a4aa05b97e9d577747f688"
 SRC_URI[doc.md5sum] = "dbb13658cf55d687c4f2ff771a696d4a"
 SRC_URI[doc.sha256sum] = "1f7f83afe62a7210be5e83cd24157adb854c14599efe0b377a7ecca933869278"
 
@@ -19,8 +19,10 @@ CFLAGS += "-D JFS -D GETUSER -Wall -D LARGEMEM"
 LDFLAGS += "-ltinfo -lncursesw"
 ASNEEDED_pn-nmon = ""
 
+S = "${WORKDIR}"
+
 do_compile() {
-    ${CC} ${CFLAGS} ${LDFLAGS} ${WORKDIR}/lmon13g.c -o nmon
+    ${CC} ${CFLAGS} ${LDFLAGS} lmon${PV}.c -o nmon
 }
 
 do_install() {
-- 
2.13.3


