Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web09.9411.1614696574215199028
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 06:49:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: hongxu.jia@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 122EnGoJ017722
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 Mar 2021 06:49:16 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 2 Mar 2021 06:49:16 -0800
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Tue, 2 Mar 2021 06:49:16 -0800
From: "hongxu" <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] lvm2/libdevmapper: 2.03.06 -> 2.03.11
Date: Tue, 2 Mar 2021 06:49:15 -0800
Message-ID: <20210302144915.63848-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Drop backport patch:
- 0001-dev-hdc-open-failed-No-medium-found-will-print-out-i.patch

Refresh:
- 0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...per_2.03.06.bb => libdevmapper_2.03.11.bb} |  0
 meta-oe/recipes-support/lvm2/lvm2.inc         |  2 +-
 ...led-No-medium-found-will-print-out-i.patch | 32 -------------------
 ...findmnt-bin-lsblk-bin-sort-not-found.patch | 20 ++++++------
 .../lvm2/{lvm2_2.03.06.bb => lvm2_2.03.11.bb} |  1 -
 5 files changed, 11 insertions(+), 44 deletions(-)
 rename meta-oe/recipes-support/lvm2/{libdevmapper_2.03.06.bb => libdevmapper_2.03.11.bb} (100%)
 delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-dev-hdc-open-failed-No-medium-found-will-print-out-i.patch
 rename meta-oe/recipes-support/lvm2/{lvm2_2.03.06.bb => lvm2_2.03.11.bb} (97%)

diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.06.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb
similarity index 100%
rename from meta-oe/recipes-support/lvm2/libdevmapper_2.03.06.bb
rename to meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 11ee7ca8b..6618e21f3 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -18,7 +18,7 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
            file://reproducible-build.patch \
            "
 
-SRCREV = "b9391b1b9f0b73303fa21f8f92574d17ce4c2b02"
+SRCREV = "3e8bd8d1bd70691f09a170785836aeb4f83154e6"
 S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig systemd license
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-dev-hdc-open-failed-No-medium-found-will-print-out-i.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-dev-hdc-open-failed-No-medium-found-will-print-out-i.patch
deleted file mode 100644
index 24d5b1b48..000000000
--- a/meta-oe/recipes-support/lvm2/lvm2/0001-dev-hdc-open-failed-No-medium-found-will-print-out-i.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 93c93e3b85492e58f9451841e6079d00c497efa4 Mon Sep 17 00:00:00 2001
-From: Jiping Ma <jiping.ma2@windriver.com>
-Date: Mon, 25 Feb 2019 13:29:12 +0800
-Subject: [PATCH] "/dev/hdc: open failed: No medium found" will print out in
- lvmdiskscan.
-
-commit [57bb46c5e7f8] introduce this issue.
-"/dev/hdc: open failed: No medium found" will be print out
-after run lvmdiskscan. change dev_open_readonly()
-to dev_open_readonly_quiet() in fuction _dev_get_size_dev().
-
-Signed-off-by: Jiping Ma <jiping.ma2@windriver.com>
----
- lib/device/dev-io.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/device/dev-io.c b/lib/device/dev-io.c
-index dc95131..81a66b0 100644
---- a/lib/device/dev-io.c
-+++ b/lib/device/dev-io.c
-@@ -338,7 +338,7 @@ static int _dev_get_size_dev(struct device *dev, uint64_t *size)
- 	}
- 
- 	if (fd <= 0) {
--		if (!dev_open_readonly(dev))
-+		if (!dev_open_readonly_quiet(dev))
- 			return_0;
- 		fd = dev_fd(dev);
- 		do_close = 1;
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch
index 16de8c0a1..34e0620a1 100644
--- a/meta-oe/recipes-support/lvm2/lvm2/0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch
+++ b/meta-oe/recipes-support/lvm2/lvm2/0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch
@@ -1,6 +1,6 @@
-From 27b56cb6b5dfc75ea8ddb395dc9ef41fb7a09c93 Mon Sep 17 00:00:00 2001
+From ddf36613f3408ce42f15b03b4e9c6ad8478b97f8 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 2 Sep 2019 23:04:50 -0400
+Date: Tue, 2 Mar 2021 01:33:05 -0800
 Subject: [PATCH] fix command /bin/findmnt, /bin/lsblk, /bin/sort not found
 
 In oe-core (util-linux and coreutils), the commands locates in
@@ -15,10 +15,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  2 files changed, 7 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index d1431e2..54e5a7b 100644
+index 4811d4a3d..137b31a82 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1495,6 +1495,8 @@ fi
+@@ -1611,6 +1611,8 @@ fi
  
  SYSCONFDIR="$(eval echo $(eval echo $sysconfdir))"
  
@@ -27,7 +27,7 @@ index d1431e2..54e5a7b 100644
  SBINDIR="$(eval echo $(eval echo $sbindir))"
  LVM_PATH="$SBINDIR/lvm"
  AC_DEFINE_UNQUOTED(LVM_PATH, ["$LVM_PATH"], [Path to lvm binary.])
-@@ -1721,6 +1723,7 @@ AC_SUBST(SACKPT_CFLAGS)
+@@ -1829,6 +1831,7 @@ AC_SUBST(SACKPT_CFLAGS)
  AC_SUBST(SACKPT_LIBS)
  AC_SUBST(SALCK_CFLAGS)
  AC_SUBST(SALCK_LIBS)
@@ -36,10 +36,10 @@ index d1431e2..54e5a7b 100644
  AC_SUBST(SELINUX_LIBS)
  AC_SUBST(SELINUX_PC)
 diff --git a/scripts/blkdeactivate.sh.in b/scripts/blkdeactivate.sh.in
-index a4b8a8f..3db4226 100644
+index 7c517b87b..7ef1bb766 100644
 --- a/scripts/blkdeactivate.sh.in
 +++ b/scripts/blkdeactivate.sh.in
-@@ -41,13 +41,14 @@ UMOUNT="/bin/umount"
+@@ -42,13 +42,14 @@ VDO="/bin/vdo"
  
  sbindir="@SBINDIR@"
  DMSETUP="$sbindir/dmsetup"
@@ -55,9 +55,9 @@ index a4b8a8f..3db4226 100644
  	FINDMNT_READ="read -r mnt"
  fi
  DMSETUP_OPTS=""
-@@ -55,10 +56,10 @@ LVM_OPTS=""
- MDADM_OPTS=""
+@@ -57,10 +58,10 @@ MDADM_OPTS=""
  MPATHD_OPTS=""
+ VDO_OPTS=""
  
 -LSBLK="/bin/lsblk -r --noheadings -o TYPE,KNAME,NAME,MOUNTPOINT"
 +LSBLK="$bindir/lsblk -r --noheadings -o TYPE,KNAME,NAME,MOUNTPOINT"
@@ -69,5 +69,5 @@ index a4b8a8f..3db4226 100644
  # Do not show tool errors by default (only done/skipping summary
  # message provided by this script) and no verbose mode by default.
 -- 
-2.8.1
+2.29.2
 
diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.06.bb b/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
similarity index 97%
rename from meta-oe/recipes-support/lvm2/lvm2_2.03.06.bb
rename to meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
index bc86810ec..7f3f000e0 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.03.06.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
@@ -1,7 +1,6 @@
 require lvm2.inc
 
 SRC_URI += " \
-            file://0001-dev-hdc-open-failed-No-medium-found-will-print-out-i.patch \
             file://0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch \
            "
 
-- 
2.29.2

