Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A80FD7D42D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 20:37:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44zBHX2mvpz5Q
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 22:37:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557261448;
	bh=1T+krWNSLS38C8I1W37CuN/sA8fNC/+MGfmiWdTMIo8=;
	h=From:To:Subject:Date:From;
	b=KPHwsf/rVX3eZWOIEe4ZCxGzgjq5C3g1eqB9uk4oCAAflmboVn0+Tiyeoo9l8OsJI
	r3X7OeBupiYuurSLRln2QnXmLRJW5IiXUNHJcBzUl5do4A0BwMHntZ36H8syOttZl3
	bo7U7aGQ33FnWtQmLnAqEwe/un+BmkczeZPY3CBltuNudp6w5ggJmVm85KSx+OORHD
	llJEYYdh4+S4th1mweVVM2/UeHYBY30GyiZ07wzkIa4PV3E+LU/spiTfqz2VoVHgXu
	LUs3NS2CRgeYKVA6Fkj6zu7ohecpSQdBlxJE7h6NAP0lmv1xULpigmP7+GjkE4gKZh
	uUBX4ANeGRULgkom+WcY8XUgC46eOxyHFcF8fASQc6YcTla62inLWubz8cTP3IGlOF
	aYKGeHSLSr7Fc8Y0/Sf320ngFi7BygTd5d2A69gMZamUlOHUsiyUWkdwRXTQ/BB4R4
	X3UxlxL0WVFfz/UYLQ2I9ikuDtFi4NbWAwjSigUxn9gOyxhUj2aFik7aCbbLOu+zif
	aaWZefKtOmMW5ujYfr33L5PlTDraVXuAqkw6lM/unSjOo6gSgCOoNBgMlxLwYnsVuN
	Ztrz6ZficqVNh48Jy0dd12M9xnjevUJEFZl3w9GWmK0QabgzExd1v203da8LI0yrlU
	iIQqm8f5bEfaKOvAYkg6WoPc=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 May 2019 23:37:26 +0300
Message-Id: <20190507203726.3448-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-filesystems][PATCH] sshfs-fuse: upgrade 2.8 -> 2.10
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
X-List-Received-Date: Tue, 07 May 2019 20:37:29 -0000

Remove patch applied upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../0001-Makefile-fix-path-for-sshfs.1.patch  | 32 -------------------
 .../{sshfs-fuse_2.8.bb => sshfs-fuse_2.10.bb} |  6 ++--
 2 files changed, 3 insertions(+), 35 deletions(-)
 delete mode 100644 meta-filesystems/recipes-filesystems/sshfs-fuse/files/0001-Makefile-fix-path-for-sshfs.1.patch
 rename meta-filesystems/recipes-filesystems/sshfs-fuse/{sshfs-fuse_2.8.bb => sshfs-fuse_2.10.bb} (74%)

diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/files/0001-Makefile-fix-path-for-sshfs.1.patch b/meta-filesystems/recipes-filesystems/sshfs-fuse/files/0001-Makefile-fix-path-for-sshfs.1.patch
deleted file mode 100644
index c434a03f0..000000000
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/files/0001-Makefile-fix-path-for-sshfs.1.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From e3cd445a4ee44a16faa646d7b642d02eea62b1f8 Mon Sep 17 00:00:00 2001
-From: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
-Date: Fri, 1 Jul 2016 09:30:31 +0200
-Subject: [PATCH] Makefile: fix path for sshfs.1
-
-Fix source path when build directory differs
-from the source dir.
-
-Upstream-Status: Accepted
-
-https://github.com/libfuse/sshfs/pull/24
-
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index f003bae..3d8f9cb 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -24,7 +24,7 @@ sshfs.1: sshfs.1.in
- 	$(AM_V_GEN)sed \
- 	    -e 's,__IDMAP_DEFAULT__,$(IDMAP_DEFAULT),g' \
- 	    -e 's,__UNMOUNT_COMMAND__,$(UNMOUNT_COMMAND),g' \
--	    <sshfs.1.in >sshfs.1.tmp || exit 1; \
-+	    <$(srcdir)/sshfs.1.in >sshfs.1.tmp || exit 1; \
- 	mv sshfs.1.tmp sshfs.1
- 
- if SSH_NODELAY_SO
--- 
-1.9.1
-
diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.8.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.10.bb
similarity index 74%
rename from meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.8.bb
rename to meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.10.bb
index 64ccdace1..582e21846 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.8.bb
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.10.bb
@@ -6,9 +6,9 @@ LICENSE = "GPLv2"
 DEPENDS = "glib-2.0 fuse"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/libfuse/sshfs;tag=b2fa7593586b141298e6159f40f521d2b0f4f894 \
-           file://0001-Makefile-fix-path-for-sshfs.1.patch"
-
+SRC_URI = "git://github.com/libfuse/sshfs;branch=sshfs_2.x \
+"
+SRCREV = "42dfaf9a5bdc1ee429c7718e8788ca37a5763e0d"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-- 
2.17.1


