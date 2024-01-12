Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0D2C4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 10:15:23 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.4200.1705054516625615811
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 02:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MNPIcMQu;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e62425c60so11120815e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 02:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705054515; x=1705659315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y9/zPzV0TPrj92SIyRmnQV4I+jTjwanUpGKeHdB0Bh4=;
        b=MNPIcMQutfqdIQnyC7j4jLkDGdiiIGDmPrdXTHERDHe3KqUgJTAocokftwjp4z7dza
         CeWq1pp8Qn/ZcowePMnqmvl3lIW3Of2K87vxCeFfB0PYlOPVdu62bnkigavuDGSv9fv7
         T4RboTQ/7r25gqDLGpNA0GOfHfpW51mpZ2aZdhvxyHalAhWPe2zu8P9EP/Aow/m+1vMr
         8NSnajA7XJxMOu6X5JzmRxzGfIHuQyrkGOxvdbQiIho8sI8GZpUbzOfivmClB9pZFPX5
         2S10SXHwU3cEYSjg/vunYUxbEMEzhNaqOHs24LmQsvYHHgDqI91TgcLNLWKwz0lE2IQt
         Qn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705054515; x=1705659315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y9/zPzV0TPrj92SIyRmnQV4I+jTjwanUpGKeHdB0Bh4=;
        b=Hdd3rn2cdaoDOqlGyCOhZRGs8akQKTjsA23zwweWepxjiIRU6Ajap5AS0bhwb6QeNt
         t9erD0M7Ej2wpALpByAw+/Qn7uqW1ScC785xmw2VZTTISEhYkijIY5K+JjZuhDuNVCP2
         I6636qiRbY+PjMiXg9RTrPtckK+afMSPr8IuOERODHPsRiJ5FRx0W3s9RshjhbQow9vs
         NbWOKZ5HJlBgozYUqdWOOWUKuJOQtODEOBORBSKZRYfS9mle+3z2AlclbVyPbn9L94+a
         22qsPaPW/WXExXmMtyZCl/mRmnQzkO2vQwMSMZfKIuvGhwUIMtcSDCJ2hTwr7wG6ESx6
         aGxg==
X-Gm-Message-State: AOJu0YxOJBfz3sGUrRtc38YGix+xAL7BdLcZLrdUCLR94JZIpRsCVx58
	ei+U3JhReqlKrdemQhLntqBGs2SivTA=
X-Google-Smtp-Source: AGHT+IF/SUtqqC8V4fE4iOZNUU/iqHMPvzu0BTIWq9r6KG7t72xbZUr8K4VEnL003ZFJY3EaAIXQmQ==
X-Received: by 2002:a05:600c:1d16:b0:40e:6777:2248 with SMTP id l22-20020a05600c1d1600b0040e67772248mr253786wms.100.1705054514444;
        Fri, 12 Jan 2024 02:15:14 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:50b9:4f6a:2337:f981])
        by smtp.gmail.com with ESMTPSA id g14-20020a05600c310e00b0040e398f8cafsm5186937wmo.31.2024.01.12.02.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 02:15:14 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] thin-provisioning-tools: Drop musl fixes (fixed upstream)
Date: Fri, 12 Jan 2024 10:15:10 +0000
Message-Id: <20240112101510.17282-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 10:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108235

Upstream has resolved musl builds differently.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../0001-Replace-LFS-functions.patch          | 91 -------------------
 .../thin-provisioning-tools_1.0.9.bb          |  1 -
 2 files changed, 92 deletions(-)
 delete mode 100644 meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Replace-LFS-functions.patch

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Replace-LFS-functions.patch b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Replace-LFS-functions.patch
deleted file mode 100644
index a9f1c8601d9b..000000000000
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Replace-LFS-functions.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 289105253fbf342fd22cbcde2ccc1127f732ab09 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 7 Jul 2023 14:21:17 -0700
-Subject: [PATCH] Replace LFS functions
-
-The original functions are able to consume 64bit off_t now a days
-therefore *64 equivalents can be replaced, as a side it fixes build with
-musl.
-
-Upstream-Status: Submitted [https://github.com/jthornber/thin-provisioning-tools/pull/267]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/file_utils.rs     | 10 +++++-----
- src/io_engine/base.rs |  4 ++--
- src/thin/trim.rs      |  2 +-
- 3 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/src/file_utils.rs b/src/file_utils.rs
-index 0ca3c0f..d2b3ee9 100644
---- a/src/file_utils.rs
-+++ b/src/file_utils.rs
-@@ -11,18 +11,18 @@ fn test_bit(mode: u32, flag: u32) -> bool {
-     (mode & libc::S_IFMT) == flag
- }
- 
--fn is_file_or_blk_(info: &libc::stat64) -> bool {
-+fn is_file_or_blk_(info: &libc::stat) -> bool {
-     test_bit(info.st_mode, libc::S_IFBLK) || test_bit(info.st_mode, libc::S_IFREG)
- }
- 
- // wrapper of libc::stat64
--fn libc_stat64(path: &Path) -> io::Result<libc::stat64> {
-+fn libc_stat64(path: &Path) -> io::Result<libc::stat> {
-     let c_path = std::ffi::CString::new(path.as_os_str().as_bytes())
-         .map_err(|e| io::Error::new(io::ErrorKind::InvalidInput, e.to_string()))?;
- 
-     unsafe {
--        let mut st: libc::stat64 = std::mem::zeroed();
--        let r = libc::stat64(c_path.as_ptr(), &mut st);
-+        let mut st: libc::stat = std::mem::zeroed();
-+        let r = libc::stat(c_path.as_ptr(), &mut st);
-         if r == 0 {
-             Ok(st)
-         } else {
-@@ -56,7 +56,7 @@ fn get_device_size<P: AsRef<Path>>(path: P) -> io::Result<u64> {
-     let fd = file.as_raw_fd();
-     let mut cap = 0u64;
-     unsafe {
--        if libc::ioctl(fd, BLKGETSIZE64 as libc::c_ulong, &mut cap) == 0 {
-+        if libc::ioctl(fd, BLKGETSIZE64 as libc::c_int, &mut cap) == 0 {
-             Ok(cap)
-         } else {
-             Err(io::Error::last_os_error())
-diff --git a/src/io_engine/base.rs b/src/io_engine/base.rs
-index 725ebf7..db6209f 100644
---- a/src/io_engine/base.rs
-+++ b/src/io_engine/base.rs
-@@ -115,7 +115,7 @@ pub trait VectoredIo {
- 
- fn read_vectored_at(file: &File, bufs: &mut [libc::iovec], pos: u64) -> io::Result<usize> {
-     let ptr = bufs.as_ptr();
--    let ret = match unsafe { libc::preadv64(file.as_raw_fd(), ptr, bufs.len() as i32, pos as i64) }
-+    let ret = match unsafe { libc::preadv(file.as_raw_fd(), ptr, bufs.len() as i32, pos as i64) }
-     {
-         -1 => return Err(io::Error::last_os_error()),
-         n => n,
-@@ -125,7 +125,7 @@ fn read_vectored_at(file: &File, bufs: &mut [libc::iovec], pos: u64) -> io::Resu
- 
- fn write_vectored_at(file: &File, bufs: &[libc::iovec], pos: u64) -> io::Result<usize> {
-     let ptr = bufs.as_ptr();
--    let ret = match unsafe { libc::pwritev64(file.as_raw_fd(), ptr, bufs.len() as i32, pos as i64) }
-+    let ret = match unsafe { libc::pwritev(file.as_raw_fd(), ptr, bufs.len() as i32, pos as i64) }
-     {
-         -1 => return Err(io::Error::last_os_error()),
-         n => n,
-diff --git a/src/thin/trim.rs b/src/thin/trim.rs
-index 3d938ca..91a53dd 100644
---- a/src/thin/trim.rs
-+++ b/src/thin/trim.rs
-@@ -135,7 +135,7 @@ impl<'a> Iterator for RangeIterator<'a> {
- const BLKDISCARD: u32 = 0x1277;
- fn ioctl_blkdiscard(fd: i32, range: &[u64; 2]) -> std::io::Result<()> {
-     unsafe {
--        if libc::ioctl(fd, BLKDISCARD as libc::c_ulong, range) == 0 {
-+        if libc::ioctl(fd, BLKDISCARD as libc::c_int, range) == 0 {
-             Ok(())
-         } else {
-             Err(std::io::Error::last_os_error())
--- 
-2.41.0
-
diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.9.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.9.bb
index b643ad6dc8d3..b79fdb1a0b5b 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.9.bb
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.9.bb
@@ -10,7 +10,6 @@ S = "${WORKDIR}/git"
 SRC_URI = " \
     git://github.com/jthornber/thin-provisioning-tools;branch=main;protocol=https \
     "
-SRC_URI:append:libc-musl = " file://0001-Replace-LFS-functions.patch"
 
 SRCREV = "1d60839b0a920df6476712b80f933854fb32e160"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-- 
2.39.0


