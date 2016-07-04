Return-Path: <zoltan.kuscsik@linaro.org>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3EFA16013D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jul 2016 06:15:21 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id r201so100620839wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jul 2016 23:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=8NioC/JP8tr0algXPykhU1ehRodfrIKPDcZ+GRoV4H0=;
	b=Vxl19ZN+ViuoG0OwIaCnGCdo8PIcm+8puShL2G0XXpQLi3cyS4jNjxb3o7fRgXjuRA
	6o5jk1n0LOHIwZUl2334jXbsDzMUlj5P+laIUmcGxcw08PGrNrk7ryGiVUh2tYI0rMh1
	xROwqpzYP+o0D7y5jckdUfI5obunPbw+uqNGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8NioC/JP8tr0algXPykhU1ehRodfrIKPDcZ+GRoV4H0=;
	b=bEkN/ZSTR4aBEL56G/kpQ9mn0SX9Ld0H2r2V27N7EzzydAZ6veETtC0F6oagxUIvRs
	uAmCzGdNZqohbq5n3WglvaDE1GjNTV4jxXNdRf1zjRGiMfAHmmI6AK45x2VzIfNd+zOH
	4qBk6FvOctTv/GF63+inefnKBAtllTlxYnjhvizcVeXH5y/EoAZ/y4IQ+mVxsbwcXLsL
	QuRgZcSfeFnnWICW8/qbk3M/f0WyNCi8XtYezsQgew8V4VhriFQXV1QI+x7hzW8UR84v
	+nRx8pXF5KQ9RZebyCtuxDORCOw0R25+C2XVh4vNsgYXL9N2ronxcgFKAPY475C9SgNO
	aXaw==
X-Gm-Message-State: ALyK8tIgJI+IguAuWW6febKMR4J1A/S1U38N4blCVTfF+k30LSCk40q89nU3fmGrFKlDKzCd
X-Received: by 10.194.0.4 with SMTP id 4mr1536020wja.127.1467612921237;
	Sun, 03 Jul 2016 23:15:21 -0700 (PDT)
Received: from static.71.106.40.188.clients.your-server.de
	(static.71.106.40.188.clients.your-server.de. [188.40.106.71])
	by smtp.gmail.com with ESMTPSA id
	ze10sm4632606wjb.2.2016.07.03.23.15.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jul 2016 23:15:20 -0700 (PDT)
From: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Jul 2016 08:15:04 +0200
Message-Id: <1467612904-14148-1-git-send-email-zoltan.kuscsik@linaro.org>
X-Mailer: git-send-email 1.9.1
Subject: [meta-filesystems][master][PATCHv4] sshfs-fuse: update to 2.8
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
X-List-Received-Date: Mon, 04 Jul 2016 06:15:22 -0000

Update SRC_URI, upstream project was
moved from SF to github.

Fix building issue when build and source
directory differs.

Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
---
 .../files/0001-Makefile-fix-path-for-sshfs.1.patch | 32 ++++++++++++++++++++++
 .../{sshfs-fuse_2.5.bb => sshfs-fuse_2.8.bb}       |  9 +++---
 2 files changed, 36 insertions(+), 5 deletions(-)
 create mode 100644 meta-filesystems/recipes-filesystems/sshfs-fuse/files/0001-Makefile-fix-path-for-sshfs.1.patch
 rename meta-filesystems/recipes-filesystems/sshfs-fuse/{sshfs-fuse_2.5.bb => sshfs-fuse_2.8.bb} (65%)

diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/files/0001-Makefile-fix-path-for-sshfs.1.patch b/meta-filesystems/recipes-filesystems/sshfs-fuse/files/0001-Makefile-fix-path-for-sshfs.1.patch
new file mode 100644
index 0000000..c434a03
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/files/0001-Makefile-fix-path-for-sshfs.1.patch
@@ -0,0 +1,32 @@
+From e3cd445a4ee44a16faa646d7b642d02eea62b1f8 Mon Sep 17 00:00:00 2001
+From: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
+Date: Fri, 1 Jul 2016 09:30:31 +0200
+Subject: [PATCH] Makefile: fix path for sshfs.1
+
+Fix source path when build directory differs
+from the source dir.
+
+Upstream-Status: Accepted
+
+https://github.com/libfuse/sshfs/pull/24
+
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index f003bae..3d8f9cb 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -24,7 +24,7 @@ sshfs.1: sshfs.1.in
+ 	$(AM_V_GEN)sed \
+ 	    -e 's,__IDMAP_DEFAULT__,$(IDMAP_DEFAULT),g' \
+ 	    -e 's,__UNMOUNT_COMMAND__,$(UNMOUNT_COMMAND),g' \
+-	    <sshfs.1.in >sshfs.1.tmp || exit 1; \
++	    <$(srcdir)/sshfs.1.in >sshfs.1.tmp || exit 1; \
+ 	mv sshfs.1.tmp sshfs.1
+ 
+ if SSH_NODELAY_SO
+-- 
+1.9.1
+
diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.5.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.8.bb
similarity index 65%
rename from meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.5.bb
rename to meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.8.bb
index c54cfcb..64ccdac 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.5.bb
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.8.bb
@@ -6,12 +6,11 @@ LICENSE = "GPLv2"
 DEPENDS = "glib-2.0 fuse"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/${BP}.tar.gz"
-S = "${WORKDIR}/${BP}"
+SRC_URI = "git://github.com/libfuse/sshfs;tag=b2fa7593586b141298e6159f40f521d2b0f4f894 \
+           file://0001-Makefile-fix-path-for-sshfs.1.patch"
+
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
 FILES_${PN} += "${libdir}/sshnodelay.so"
-
-SRC_URI[md5sum] = "17494910db8383a366b1301e5f5148a9"
-SRC_URI[sha256sum] = "e9171452e5d0150b9c6a2158fd2e2dcefb5d5d03ba4d208949e00a3a46c6e63e"
-- 
1.9.1


