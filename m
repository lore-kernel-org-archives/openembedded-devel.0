Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02582EB64DA
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 21:34:45 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.6703.1688765682504859281
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jul 2023 14:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=sb+8uPE2;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b8062c1ee1so15924755ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 14:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688765682; x=1691357682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/Fw1rAB9h9Wq8+Revc4SP9q6Folk9H6TLprsSIp3Bo=;
        b=sb+8uPE2U5uxhb6TLjrjM0deHhywucwB/xO/KRW2ioKC+VGEN9C9cI/wbQ2gb6TcJ7
         vHWudqdBSCSTf9zwzpgEmofp0MKKEVjJp2Ehnk5u5T2FqmQ2TJNi1qqkQyWSMHHi9tVx
         uImY3YKr1VBdvNF2tzIic0MrhSVfvp5Z1QPEh2Ka/xVfMKOTFshk6uzgZPPoXSNwe8UR
         0c9QAuM5h084jaitviPUndw8jlD9y+s5oYsC2J2UkqL8D77lJXklxL9X6iWjKhFr7aLP
         7oySak36Eba3+dvFRPFyUbrwoL0NA+S/PPOGlMDdhp9K7UfTGOk4HpwWXn/vgG0eiqwi
         ymoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688765682; x=1691357682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/Fw1rAB9h9Wq8+Revc4SP9q6Folk9H6TLprsSIp3Bo=;
        b=GNMSC64/RYlo5VlRXxHdLfQOfYA5DjuSQeGVwGQBH2znpGZKFO6VghWkI1L5b+FsmZ
         DwcHD2GPQuBu/Wu01Xkb45RU6yXUbPnx65TxieBXCaokHhZ+Sdo/PpGndbY0tu1jrJKu
         BLJTdY0ZfDgldrlDJ1iqFmAF5FdLBIEXWDqHCeymdUxKjzvHIaX+EAYMkJJGXED9T9mm
         xameTpgsPMTSSmLbTdhcmI405mW4tdC3W6VzxB7qo5ToXYnH46aXBJvI6KflFu3OnBpQ
         Mdv3Tx2WuX78qvvzdwnMxkLzyTPRt9G1S9vQZ9S3wbn6T4tX5U8C/ArqIfG0g3bL7Aox
         4o4g==
X-Gm-Message-State: ABy/qLakkfSrrPjGjphO90NTdRuxzQuzILQ1PD1+9ltELr/okEDA0MQR
	1Jx79UJzFer75lM/rKY9B/473QQ5u3U=
X-Google-Smtp-Source: APBJJlF6waNo4lS6L96HwT+5YLUT8TNwCGJ7WU55CT8Zfh7/of7Y79dndS9bFtTbZSmgArNIhmj+Zg==
X-Received: by 2002:a17:902:c951:b0:1b8:3e15:46a1 with SMTP id i17-20020a170902c95100b001b83e1546a1mr7932131pla.67.1688765681535;
        Fri, 07 Jul 2023 14:34:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::2823])
        by smtp.gmail.com with ESMTPSA id x19-20020a170902821300b001b23eb0b4bbsm3689687pln.147.2023.07.07.14.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 14:34:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] thin-provisioning-tools: Fix build on musl.
Date: Fri,  7 Jul 2023 14:34:38 -0700
Message-ID: <20230707213438.4112432-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230707213438.4112432-1-raj.khem@gmail.com>
References: <20230707213438.4112432-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 21:34:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103716

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Replace-LFS-functions.patch          | 91 +++++++++++++++++++
 .../thin-provisioning-tools_1.0.4.bb          |  2 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Replace-LFS-functions.patch

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Replace-LFS-functions.patch b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Replace-LFS-functions.patch
new file mode 100644
index 0000000000..a9f1c8601d
--- /dev/null
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Replace-LFS-functions.patch
@@ -0,0 +1,91 @@
+From 289105253fbf342fd22cbcde2ccc1127f732ab09 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Jul 2023 14:21:17 -0700
+Subject: [PATCH] Replace LFS functions
+
+The original functions are able to consume 64bit off_t now a days
+therefore *64 equivalents can be replaced, as a side it fixes build with
+musl.
+
+Upstream-Status: Submitted [https://github.com/jthornber/thin-provisioning-tools/pull/267]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/file_utils.rs     | 10 +++++-----
+ src/io_engine/base.rs |  4 ++--
+ src/thin/trim.rs      |  2 +-
+ 3 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/file_utils.rs b/src/file_utils.rs
+index 0ca3c0f..d2b3ee9 100644
+--- a/src/file_utils.rs
++++ b/src/file_utils.rs
+@@ -11,18 +11,18 @@ fn test_bit(mode: u32, flag: u32) -> bool {
+     (mode & libc::S_IFMT) == flag
+ }
+ 
+-fn is_file_or_blk_(info: &libc::stat64) -> bool {
++fn is_file_or_blk_(info: &libc::stat) -> bool {
+     test_bit(info.st_mode, libc::S_IFBLK) || test_bit(info.st_mode, libc::S_IFREG)
+ }
+ 
+ // wrapper of libc::stat64
+-fn libc_stat64(path: &Path) -> io::Result<libc::stat64> {
++fn libc_stat64(path: &Path) -> io::Result<libc::stat> {
+     let c_path = std::ffi::CString::new(path.as_os_str().as_bytes())
+         .map_err(|e| io::Error::new(io::ErrorKind::InvalidInput, e.to_string()))?;
+ 
+     unsafe {
+-        let mut st: libc::stat64 = std::mem::zeroed();
+-        let r = libc::stat64(c_path.as_ptr(), &mut st);
++        let mut st: libc::stat = std::mem::zeroed();
++        let r = libc::stat(c_path.as_ptr(), &mut st);
+         if r == 0 {
+             Ok(st)
+         } else {
+@@ -56,7 +56,7 @@ fn get_device_size<P: AsRef<Path>>(path: P) -> io::Result<u64> {
+     let fd = file.as_raw_fd();
+     let mut cap = 0u64;
+     unsafe {
+-        if libc::ioctl(fd, BLKGETSIZE64 as libc::c_ulong, &mut cap) == 0 {
++        if libc::ioctl(fd, BLKGETSIZE64 as libc::c_int, &mut cap) == 0 {
+             Ok(cap)
+         } else {
+             Err(io::Error::last_os_error())
+diff --git a/src/io_engine/base.rs b/src/io_engine/base.rs
+index 725ebf7..db6209f 100644
+--- a/src/io_engine/base.rs
++++ b/src/io_engine/base.rs
+@@ -115,7 +115,7 @@ pub trait VectoredIo {
+ 
+ fn read_vectored_at(file: &File, bufs: &mut [libc::iovec], pos: u64) -> io::Result<usize> {
+     let ptr = bufs.as_ptr();
+-    let ret = match unsafe { libc::preadv64(file.as_raw_fd(), ptr, bufs.len() as i32, pos as i64) }
++    let ret = match unsafe { libc::preadv(file.as_raw_fd(), ptr, bufs.len() as i32, pos as i64) }
+     {
+         -1 => return Err(io::Error::last_os_error()),
+         n => n,
+@@ -125,7 +125,7 @@ fn read_vectored_at(file: &File, bufs: &mut [libc::iovec], pos: u64) -> io::Resu
+ 
+ fn write_vectored_at(file: &File, bufs: &[libc::iovec], pos: u64) -> io::Result<usize> {
+     let ptr = bufs.as_ptr();
+-    let ret = match unsafe { libc::pwritev64(file.as_raw_fd(), ptr, bufs.len() as i32, pos as i64) }
++    let ret = match unsafe { libc::pwritev(file.as_raw_fd(), ptr, bufs.len() as i32, pos as i64) }
+     {
+         -1 => return Err(io::Error::last_os_error()),
+         n => n,
+diff --git a/src/thin/trim.rs b/src/thin/trim.rs
+index 3d938ca..91a53dd 100644
+--- a/src/thin/trim.rs
++++ b/src/thin/trim.rs
+@@ -135,7 +135,7 @@ impl<'a> Iterator for RangeIterator<'a> {
+ const BLKDISCARD: u32 = 0x1277;
+ fn ioctl_blkdiscard(fd: i32, range: &[u64; 2]) -> std::io::Result<()> {
+     unsafe {
+-        if libc::ioctl(fd, BLKDISCARD as libc::c_ulong, range) == 0 {
++        if libc::ioctl(fd, BLKDISCARD as libc::c_int, range) == 0 {
+             Ok(())
+         } else {
+             Err(std::io::Error::last_os_error())
+-- 
+2.41.0
+
diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.4.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.4.bb
index 5a73024289..e79f62ff6e 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.4.bb
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.4.bb
@@ -10,6 +10,8 @@ S = "${WORKDIR}/git"
 SRC_URI = " \
     git://github.com/jthornber/thin-provisioning-tools;branch=main;protocol=https \
     "
+SRC_URI:append:libc-musl = " file://0001-Replace-LFS-functions.patch"
+
 SRCREV = "3baa3fa3a3e4f714e6170a4152b186f0fa1d76e1"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.41.0


