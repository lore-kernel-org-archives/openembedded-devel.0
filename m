Return-Path: <zoltan.kuscsik@linaro.org>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 070B260111
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jul 2016 08:48:47 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id v199so17389293wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jul 2016 01:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=rcflcD2ZKBZarpZ+bdJvcz/MqbsVjIc7c4bcw/yWNrc=;
	b=RJU799+OS6JFpb7Ubt5t/7eT+E/OACHC9y6JyJo3ZRI32dDDi1L8+e1/CrjZIjHrD0
	O/2tggvlNIsNLjNNHwX7hnOMdJjD0e5w2PBA1mpqBMDJNufrUOOfAVMHaVGyXgyqDzXK
	aeWJrDfRpKmzMlBC16hp7SotUfWlmPGtyXZLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rcflcD2ZKBZarpZ+bdJvcz/MqbsVjIc7c4bcw/yWNrc=;
	b=lEfy4kg7W5NgfJio30ovD+Yt9yetCpg8lFdRnePaz6qLKPJmx2hggX1atPTmSdyfgr
	wPbwDMRhlpW75DrsRZ/aeqYcMWoiZOgWYVPIsoQoUtisNqh2eJ9tvqmcoCxIaxViHZSQ
	wAskWCS5hFUVuflhPvLj8rYGy5SAuZMO3RJVDTRpuiGMFIViBe9/lF1Q3rnCU85A8fLL
	VuJVgqS7zeVUSCxQk8VUBGIzf2wESGAHiPDbPNNdOYuLn5Q4Efsapppf13NXK+makOo4
	RYVHA96Rk1Kc1qD9RzmUeIJOxg+7oCMVVTgjmtk5n5uV37s4MB8i0WQs1tihFfHoc+IB
	Ctcg==
X-Gm-Message-State: ALyK8tJA4O5UUUKBswoth33MeZvohdiCFlDLm3pxE4xAZq1obFzsxNend9i8NwoDYIE1kcmc
X-Received: by 10.194.119.164 with SMTP id kv4mr2301085wjb.179.1467362927182; 
	Fri, 01 Jul 2016 01:48:47 -0700 (PDT)
Received: from static.71.106.40.188.clients.your-server.de
	(static.71.106.40.188.clients.your-server.de. [188.40.106.71])
	by smtp.gmail.com with ESMTPSA id wo9sm1804238wjb.8.2016.07.01.01.48.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Jul 2016 01:48:46 -0700 (PDT)
From: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Jul 2016 10:48:39 +0200
Message-Id: <1467362919-23262-1-git-send-email-zoltan.kuscsik@linaro.org>
X-Mailer: git-send-email 1.9.1
Subject: [meta-filesystems][master][PATCHv2] sshfs-fuse: update to 2.8
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
X-List-Received-Date: Fri, 01 Jul 2016 08:48:49 -0000

Update SRC_URI, upstream project was
moved from SF to github.

Fix building issue when build and source
directory differs.

Upstream-Status: Submitted

https://github.com/libfuse/sshfs/pull/24

Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
---
 .../files/0001-Makefile-fix-path-for-sshfs.1.patch | 27 ++++++++++++++++++++++
 .../{sshfs-fuse_2.5.bb => sshfs-fuse_2.8.bb}       |  9 ++++----
 2 files changed, 31 insertions(+), 5 deletions(-)
 create mode 100644 meta-filesystems/recipes-filesystems/sshfs-fuse/files/0001-Makefile-fix-path-for-sshfs.1.patch
 rename meta-filesystems/recipes-filesystems/sshfs-fuse/{sshfs-fuse_2.5.bb => sshfs-fuse_2.8.bb} (65%)

diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/files/0001-Makefile-fix-path-for-sshfs.1.patch b/meta-filesystems/recipes-filesystems/sshfs-fuse/files/0001-Makefile-fix-path-for-sshfs.1.patch
new file mode 100644
index 0000000..39c1f04
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/files/0001-Makefile-fix-path-for-sshfs.1.patch
@@ -0,0 +1,27 @@
+From e3cd445a4ee44a16faa646d7b642d02eea62b1f8 Mon Sep 17 00:00:00 2001
+From: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
+Date: Fri, 1 Jul 2016 09:30:31 +0200
+Subject: [PATCH] Makefile: fix path for sshfs.1
+
+Fix source path when build directory differs
+from the source dir.
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


