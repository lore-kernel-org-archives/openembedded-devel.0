Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 32FF37F65C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2019 20:57:50 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q13so1784020pff.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2019 12:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=k0PpbARdHyRhmbcgI/DlHTvBya9mwLUMkgJqlQrT5VA=;
	b=LPawjNODgzxG2Vw7QZSn8Z0n44p97WPPk9Qu8pDmMabRvlPHPEdhcAp1zMGvjY66CB
	yMhiqx7wa7215N3I3/pIJzcqm5e84F7lidZuAww1cXFJbnSMq08M9kl8gfGVNXpC7RtI
	szBPM2eQbsalHn7+TLoc1W25WTWO1+4YmtEIxMI2szDahbzcu+j5xy0UULdxhu1J3NP3
	8yrjB02GZM9jjNRHOJIEWnVeC+GWFLgcADEZGJ9Cr+nKshDrvcuqrGsIaOvY/XsEQJnq
	MQKD/Hi9uwHp1kyVRy/wcrNMsIcSL0WrIvybZrEml+LE4YhM4V2M7SrYR6ryLJIjQvhD
	cHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=k0PpbARdHyRhmbcgI/DlHTvBya9mwLUMkgJqlQrT5VA=;
	b=R4BtvwIOHogiB5BfO5lcNG2famqwa0GTVq5Z7No0bXQqA8TxlAGlF8RQyhsLFp2JfC
	48X14AJTrgZbopFC4VViLneWrHB79ad0vR0l4hckvBqkjX7fL3Lfe9iEwSHZt5HwcEcY
	dgg16IK6I8iLDvLGqxo7s3azEDs3m4m8mbY3A1glt2cSkJUGMPZCcE2BDv4FJ+niEa2H
	LJ5B1urzJa3L0Pj/JUG8A5PHcS9QAGCIfL6+V0165QVi4CLzl7QcXiF45aprAnthCB4o
	EfUzTVBFyBc6FkZWzwFmTuw71+gzSD/i5M1LhavR048NYV9MN7XM54aJKTCzuTmgmQG2
	UtxA==
X-Gm-Message-State: APjAAAUS8SKOPaxqdJ6RoukXm+54CBLL3uIHkPtA3Lnl9sH2a869BFNC
	KViYimQeS1RcMeH80ShBifUVm7vU1ms=
X-Google-Smtp-Source: APXvYqxTMsq/703chhoJCXfS6TZJ2ncoluuz8n8mlGoE6H655NEnuqDVvaCGufI8I5kRhO2bmAgJ+g==
X-Received: by 2002:a17:90a:d155:: with SMTP id
	t21mr8855345pjw.84.1573592271096; 
	Tue, 12 Nov 2019 12:57:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id
	c9sm12471676pfn.65.2019.11.12.12.57.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Nov 2019 12:57:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Nov 2019 12:57:36 -0800
Message-Id: <20191112205738.725884-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] open-vm-tools: Enable tirpc explicitly, fix build with 64bit time_t
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
X-List-Received-Date: Tue, 12 Nov 2019 20:57:52 -0000
Content-Transfer-Encoding: 8bit

These patches ensure that 64bit time_t is printed correctly, and on x86
do not limit time_t to be 4byte long

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...FromNtTimeNsec-aware-of-64-bit-time_.patch | 78 +++++++++++++++++++
 ...ux-Consider-64bit-time_t-possibility.patch | 41 ++++++++++
 .../open-vm-tools/open-vm-tools_11.0.1.bb     |  5 +-
 3 files changed, 123 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
new file mode 100644
index 0000000000..61a681f17f
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
@@ -0,0 +1,78 @@
+From caf80e220b055dbce259078be96e899dc78ec1d2 Mon Sep 17 00:00:00 2001
+From: Bartosz Brachaczek <b.brachaczek@gmail.com>
+Date: Tue, 12 Nov 2019 14:31:08 +0100
+Subject: [PATCH] Make HgfsConvertFromNtTimeNsec aware of 64-bit time_t on i386
+
+I verified that this function behaves as expected on x86_64, i386 with
+32-bit time_t, and i386 with 64-bit time_t for the following values of
+ntTtime:
+
+UNIX_EPOCH-1, UNIX_EPOCH, UNIX_EPOCH+1, UNIX_S32_MAX-1, UNIX_S32_MAX,
+UNIX_S32_MAX+1, UNIX_S32_MAX*2+1
+
+I did not verify whether the use of Div643264 is optimal, performance
+wise.
+
+Upstream-Status: Submitted [https://github.com/vmware/open-vm-tools/pull/387]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ open-vm-tools/lib/hgfs/hgfsUtil.c | 34 +++++++++++++++++--------------
+ 1 file changed, 19 insertions(+), 15 deletions(-)
+
+diff --git a/open-vm-tools/lib/hgfs/hgfsUtil.c b/open-vm-tools/lib/hgfs/hgfsUtil.c
+index cc580ab8..49b10040 100644
+--- a/open-vm-tools/lib/hgfs/hgfsUtil.c
++++ b/open-vm-tools/lib/hgfs/hgfsUtil.c
+@@ -110,23 +110,21 @@ HgfsConvertFromNtTimeNsec(struct timespec *unixTime, // OUT: Time in UNIX format
+ 			  uint64 ntTime) // IN: Time in Windows NT format
+ {
+ #ifdef __i386__
+-   uint32 sec;
+-   uint32 nsec;
++   uint64 sec64;
++   uint32 sec32, nsec;
++#endif
+ 
+    ASSERT(unixTime);
+-   /* We assume that time_t is 32bit */
+-   ASSERT_ON_COMPILE(sizeof (unixTime->tv_sec) == 4);
+ 
+-   /* Cap NT time values that are outside of Unix time's range */
++   if (sizeof (unixTime->tv_sec) == 4) {
++      /* Cap NT time values that are outside of Unix time's range */
+ 
+-   if (ntTime >= UNIX_S32_MAX) {
+-      unixTime->tv_sec = 0x7FFFFFFF;
+-      unixTime->tv_nsec = 0;
+-      return 1;
++      if (ntTime >= UNIX_S32_MAX) {
++         unixTime->tv_sec = 0x7FFFFFFF;
++         unixTime->tv_nsec = 0;
++         return 1;
++      }
+    }
+-#else
+-   ASSERT(unixTime);
+-#endif
+ 
+    if (ntTime < UNIX_EPOCH) {
+       unixTime->tv_sec = 0;
+@@ -135,9 +133,15 @@ HgfsConvertFromNtTimeNsec(struct timespec *unixTime, // OUT: Time in UNIX format
+    }
+ 
+ #ifdef __i386__
+-   Div643232(ntTime - UNIX_EPOCH, 10000000, &sec, &nsec);
+-   unixTime->tv_sec = sec;
+-   unixTime->tv_nsec = nsec * 100;
++   if (sizeof (unixTime->tv_sec) == 4) {
++      Div643232(ntTime - UNIX_EPOCH, 10000000, &sec32, &nsec);
++      unixTime->tv_sec = sec32;
++      unixTime->tv_nsec = nsec * 100;
++   } else {
++      Div643264(ntTime - UNIX_EPOCH, 10000000, &sec64, &nsec);
++      unixTime->tv_sec = sec64;
++      unixTime->tv_nsec = nsec * 100;
++   }
+ #else
+    unixTime->tv_sec = (ntTime - UNIX_EPOCH) / 10000000;
+    unixTime->tv_nsec = ((ntTime - UNIX_EPOCH) % 10000000) * 100;
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch
new file mode 100644
index 0000000000..0f64eabc94
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch
@@ -0,0 +1,41 @@
+From fe56b67a2915a8632ea30604c14241f335dd3c15 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 12 Nov 2019 10:49:46 -0800
+Subject: [PATCH] hgfsServerLinux: Consider 64bit time_t possibility
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../lib/hgfsServer/hgfsServerLinux.c          | 19 +++++--------------
+ 1 file changed, 5 insertions(+), 14 deletions(-)
+
+diff --git a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
+index 03175623..554da67f 100644
+--- a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
++++ b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
+@@ -2561,20 +2561,11 @@ HgfsStatToFileAttr(struct stat *stats,       // IN: stat information
+    LOG(4, ("%s: done, permissions %o%o%o%o, size %"FMT64"u\n", __FUNCTION__,
+            attr->specialPerms, attr->ownerPerms, attr->groupPerms,
+            attr->otherPerms, attr->size));
+-#ifdef __FreeBSD__
+-#   if !defined(VM_X86_64) && __FreeBSD_version >= 500043
+-#      define FMTTIMET ""
+-#   else
+-#      define FMTTIMET "l"
+-#   endif
+-#else
+-#   define FMTTIMET "l"
+-#endif
+-   LOG(4, ("access: %"FMTTIMET"d/%"FMT64"u \nwrite: %"FMTTIMET"d/%"FMT64"u \n"
+-           "attr: %"FMTTIMET"d/%"FMT64"u\n",
+-           stats->st_atime, attr->accessTime, stats->st_mtime, attr->writeTime,
+-           stats->st_ctime, attr->attrChangeTime));
+-#undef FMTTIMET
++   LOG(4, ("access: %jd/%"FMT64"u \nwrite: %jd/%"FMT64"u \n"
++           "attr: %jd/%"FMT64"u\n",
++           (intmax_t)stats->st_atime, attr->accessTime,
++	   (intmax_t)stats->st_mtime, attr->writeTime,
++           (intmax_t)stats->st_ctime, attr->attrChangeTime));
+ 
+    attr->userId = stats->st_uid;
+    attr->groupId = stats->st_gid;
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
index e43a39b613..9e4aa4881a 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
@@ -39,7 +39,10 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
     file://0012-Use-off64_t-instead-of-__off64_t.patch;patchdir=.. \
     file://0013-misc-Do-not-print-NULL-string-into-logs.patch;patchdir=.. \
     file://0001-GitHub-Issue-367.-Remove-references-to-deprecated-G_.patch;patchdir=.. \
+    file://0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch;patchdir=.. \
+    file://0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;patchdir=.. \
 "
+
 SRCREV = "d3edfd142a81096f9f58aff17d84219b457f4987"
 
 S = "${WORKDIR}/git/open-vm-tools"
@@ -56,7 +59,7 @@ SYSTEMD_SERVICE_${PN} = "vmtoolsd.service"
 EXTRA_OECONF = "--without-icu --disable-multimon --disable-docs \
          --disable-tests --without-gtkmm --without-xerces --without-pam \
          --disable-vgauth --disable-deploypkg \
-         --without-root-privileges --without-kernel-modules"
+         --without-root-privileges --without-kernel-modules --with-tirpc"
 
 NO_X11_FLAGS = "--without-x --without-gtk2 --without-gtk3"
 X11_DEPENDS = "libxext libxi libxrender libxrandr libxtst gtk+ gdk-pixbuf"
-- 
2.24.0


