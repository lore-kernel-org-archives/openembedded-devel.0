Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 0934361088
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 16:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=axis.com; l=4410; q=dns/txt; s=axis-central1;
	t=1581698576; x=1613234576;
	h=from:to:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=Q1LWSVgOf+k3PO3vmn3osnU8qfbQaVg4A7H9bMoPH0Y=;
	b=eZYV2HijVquroRQWPXdh4h4PqkBfw8kiBRItueAqisNHZ1Hx1oS1y06V
	8ur480HOTHDW2TqMcKvDO1TDjQI2rFQSWLk66Q+T82KuQLSgQSGbw0g7m
	4b843Uy/0JYnTFsrx5J+yP6xGxyYrN/299Xyu/XmwLNrp11T8I12MY7aW
	bR7065wYM4lM2tdgJVEQ45gjgWNWzQ0NVD/eareLPlC4/5gmefV+Nh5d0
	Cc2fYk3ArzFn4cyz6GBmC36ed/gOyYeqAPsP6cOuB2rQV4IwYksjbDq3K
	JqBy4YAS1u/20rSdx5PHYcpCSjOhJ9rjiGCdtx6LVBSNYjIyNgf33tfm6 A==;
IronPort-SDR: kB/sugJoecg4UG/qgs2BwErod8NGLo4cHDd7c64dxbuuQlWr6m+KYC/3lPJWr/Jy+MQ7OR4FYM
	PUK+cKlqrmDA4unbuYgvp/LQR0up5Bw2JyQmuZPMJq40or7BqXySXlQ9CzRBP7i09DyhJmcduF
	4nsMXy7oCP35pFFGi8R51rWLYWdnp2uuxhWfPWpqWEv/NYA0AhSef27VbEY8OS7i7Z2HyogJGH
	ozXto/pH8TVOKjTSwt3rAOEfGS+XjheYwxS/4i+A2l9HHOJJ3S40CVaUbCUEZ33f06WaS3iQM1
	gDg=
X-IronPort-AV: E=Sophos;i="5.70,441,1574118000"; 
   d="scan'208";a="5288524"
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Feb 2020 17:42:52 +0100
Message-ID: <20200214164252.2607-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [meta-filesystems][master][zeus][PATCHv2] ntfs-3g-ntfsprogs: Make it support usrmerge properly
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
X-List-Received-Date: Fri, 14 Feb 2020 16:42:54 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

An attempt to solve the problem that some files are installed to /sbin
even though the usrmerge distro feature is enabled was made in commit
97c0af59 ("ntfs-3g-ntfsprogs: support usrmerge"). However, it merely
just removed the problematic files, which meant that the package was
rendered unusable.

Solve the problem properly by moving all files that are installed in
/sbin to ${base_sbindir} instead.

Also clear up a cryptic comment.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Correct [meta-oe] to [meta-filesystems] in the subject.

 .../0001-Make-build-support-usrmerge.patch    | 43 -------------------
 .../ntfs-3g-ntfsprogs_2017.3.23.bb            | 15 +++++--
 2 files changed, 11 insertions(+), 47 deletions(-)
 delete mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-Make-build-support-usrmerge.patch

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-Make-build-support-usrmerge.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-Make-build-support-usrmerge.patch
deleted file mode 100644
index fce10b999..000000000
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-Make-build-support-usrmerge.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 33f678bf74367aab8ddc2858a9f7797455ea9b9f Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 29 Aug 2019 10:21:58 +0800
-Subject: [PATCH] Make build support usrmerge
-
-Upstream-Status: Inappropriate[oe-specific]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- ntfsprogs/Makefile.am | 2 --
- src/Makefile.am       | 3 ---
- 2 files changed, 5 deletions(-)
-
-diff --git a/ntfsprogs/Makefile.am b/ntfsprogs/Makefile.am
-index f4f9d1b..1f6a673 100644
---- a/ntfsprogs/Makefile.am
-+++ b/ntfsprogs/Makefile.am
-@@ -165,8 +165,6 @@ extras:	libs $(EXTRA_PROGRAMS)
- 
- if ENABLE_MOUNT_HELPER
- install-exec-hook:
--	$(INSTALL) -d $(DESTDIR)/sbin
--	$(LN_S) -f $(sbindir)/mkntfs $(DESTDIR)/sbin/mkfs.ntfs
- 
- install-data-hook:
- 	$(INSTALL) -d $(DESTDIR)$(man8dir)
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 8d98408..d0a6a45 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -66,9 +66,6 @@ endif
- 
- if ENABLE_MOUNT_HELPER
- install-exec-local:	install-rootbinPROGRAMS
--	$(MKDIR_P) "$(DESTDIR)/sbin"
--	$(LN_S) -f "$(rootbindir)/ntfs-3g" "$(DESTDIR)/sbin/mount.ntfs-3g"
--	$(LN_S) -f "$(rootbindir)/lowntfs-3g" "$(DESTDIR)/sbin/mount.lowntfs-3g"
- 
- install-data-local:	install-man8
- 	$(LN_S) -f ntfs-3g.8 "$(DESTDIR)$(man8dir)/mount.ntfs-3g.8"
--- 
-2.7.4
-
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb
index 1559bfd3f..6f5cb6cee 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
-           ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-Make-build-support-usrmerge.patch','',d)} \
 "
 S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
 SRC_URI[md5sum] = "d97474ae1954f772c6d2fa386a6f462c"
@@ -35,10 +34,18 @@ FILES_ntfsprogs = "${base_sbindir}/* ${bindir}/* ${sbindir}/*"
 FILES_libntfs-3g = "${libdir}/*${SOLIBS}"
 
 do_install_append() {
-    # Standard mount will execute the program /sbin/mount.TYPE
-    # when called. Add the symbolic to let mount could find ntfs.
-    ln -sf mount.ntfs-3g ${D}/${base_sbindir}/mount.ntfs
+    # Standard mount will execute the program /sbin/mount.TYPE when called.
+    # Add a symbolic link to let mount find ntfs.
+    ln -sf mount.ntfs-3g ${D}${base_sbindir}/mount.ntfs
     rmdir ${D}${libdir}/ntfs-3g
+
+    # Handle when usrmerge is in effect. Some files are installed to /sbin
+    # regardless of the value of ${base_sbindir}.
+    if [ "${base_sbindir}" != /sbin ] && [ -d ${D}/sbin ]; then
+        mkdir -p ${D}${base_sbindir}
+        mv ${D}/sbin/* ${D}${base_sbindir}
+        rmdir ${D}/sbin
+    fi
 }
 
 # Satisfy the -dev runtime dependency
-- 
2.21.1


