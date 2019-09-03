Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2AFA77ECCF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 05:45:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x835j6u4020657
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 2 Sep 2019 22:45:06 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 2 Sep 2019 22:45:05 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 3 Sep 2019 01:43:58 -0400
Message-ID: <1567489438-31815-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] lvm2: fix blkdeactivate failed with command not found
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
X-List-Received-Date: Tue, 03 Sep 2019 05:45:07 -0000
Content-Type: text/plain

Run blkdeactivate failed:
...
root@intel-x86-64:~# /usr/sbin/blkdeactivate
Deactivating block devices:
/usr/sbin/blkdeactivate: line 345: /bin/lsblk: No such file or directory
/usr/sbin/blkdeactivate: line 345: /bin/sort: No such file or directory
/usr/sbin/blkdeactivate: line 345: /bin/lsblk: No such file or directory
/usr/sbin/blkdeactivate: line 384: SKIP_DEVICE_LIST: bad array subscript
...

- Add missing runtime depends
- Set location of the commands

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-bin-findmnt-bin-lsblk-bin-sort-not-found.patch | 73 ++++++++++++++++++++++
 meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb       |  8 ++-
 2 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch

diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch
new file mode 100644
index 0000000..16de8c0
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/lvm2/0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch
@@ -0,0 +1,73 @@
+From 27b56cb6b5dfc75ea8ddb395dc9ef41fb7a09c93 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 2 Sep 2019 23:04:50 -0400
+Subject: [PATCH] fix command /bin/findmnt, /bin/lsblk, /bin/sort not found
+
+In oe-core (util-linux and coreutils), the commands locates in
+${bindir} rather than /bin, add BINDIR to configure it
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac                | 3 +++
+ scripts/blkdeactivate.sh.in | 7 ++++---
+ 2 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d1431e2..54e5a7b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1495,6 +1495,8 @@ fi
+ 
+ SYSCONFDIR="$(eval echo $(eval echo $sysconfdir))"
+ 
++BINDIR="$(eval echo $(eval echo $bindir))"
++
+ SBINDIR="$(eval echo $(eval echo $sbindir))"
+ LVM_PATH="$SBINDIR/lvm"
+ AC_DEFINE_UNQUOTED(LVM_PATH, ["$LVM_PATH"], [Path to lvm binary.])
+@@ -1721,6 +1723,7 @@ AC_SUBST(SACKPT_CFLAGS)
+ AC_SUBST(SACKPT_LIBS)
+ AC_SUBST(SALCK_CFLAGS)
+ AC_SUBST(SALCK_LIBS)
++AC_SUBST(BINDIR)
+ AC_SUBST(SBINDIR)
+ AC_SUBST(SELINUX_LIBS)
+ AC_SUBST(SELINUX_PC)
+diff --git a/scripts/blkdeactivate.sh.in b/scripts/blkdeactivate.sh.in
+index a4b8a8f..3db4226 100644
+--- a/scripts/blkdeactivate.sh.in
++++ b/scripts/blkdeactivate.sh.in
+@@ -41,13 +41,14 @@ UMOUNT="/bin/umount"
+ 
+ sbindir="@SBINDIR@"
+ DMSETUP="$sbindir/dmsetup"
++bindir="@BINDIR@"
+ LVM="$sbindir/lvm"
+ 
+ if "$UMOUNT" --help | grep -- "--all-targets" >"$DEV_DIR/null"; then
+ 	UMOUNT_OPTS="--all-targets "
+ else
+ 	UMOUNT_OPTS=""
+-	FINDMNT="/bin/findmnt -r --noheadings -u -o TARGET"
++	FINDMNT="$bindir/findmnt -r --noheadings -u -o TARGET"
+ 	FINDMNT_READ="read -r mnt"
+ fi
+ DMSETUP_OPTS=""
+@@ -55,10 +56,10 @@ LVM_OPTS=""
+ MDADM_OPTS=""
+ MPATHD_OPTS=""
+ 
+-LSBLK="/bin/lsblk -r --noheadings -o TYPE,KNAME,NAME,MOUNTPOINT"
++LSBLK="$bindir/lsblk -r --noheadings -o TYPE,KNAME,NAME,MOUNTPOINT"
+ LSBLK_VARS="local devtype local kname local name local mnt"
+ LSBLK_READ="read -r devtype kname name mnt"
+-SORT_MNT="/bin/sort -r -u -k 4"
++SORT_MNT="$bindir/sort -r -u -k 4"
+ 
+ # Do not show tool errors by default (only done/skipping summary
+ # message provided by this script) and no verbose mode by default.
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb b/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb
index 785c696..f42bd8e 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb
@@ -4,6 +4,7 @@ SRCREV = "913c28917e62577a2ef67152b2e5159237503dda"
 
 SRC_URI += " \
             file://0001-dev-hdc-open-failed-No-medium-found-will-print-out-i.patch \
+            file://0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch \
            "
 
 DEPENDS += "autoconf-archive-native"
@@ -67,7 +68,12 @@ RDEPENDS_${PN}-udevrules = "libdevmapper"
 RDEPENDS_${PN}_append_class-target = " libdevmapper"
 RDEPENDS_${PN}_append_class-nativesdk = " libdevmapper"
 
-RDEPENDS_${PN}-scripts = "${PN} (= ${EXTENDPKGV}) bash"
+RDEPENDS_${PN}-scripts = "${PN} (= ${EXTENDPKGV}) \
+                          bash \
+                          util-linux-lsblk \
+                          util-linux-findmnt \
+                          coreutils \
+"
 RRECOMMENDS_${PN}_class-target = "${PN}-scripts (= ${EXTENDPKGV})"
 
 CONFFILES_${PN} += "${sysconfdir}/lvm/lvm.conf"
-- 
2.8.1


