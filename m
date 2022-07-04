Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01389C43334
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 09:07:50 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.70017.1656925666590076523
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 02:07:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZMnKxShr;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656925664; i=@fujitsu.com;
	bh=hiK79uHg38pK2+ZwLJvv20+ayG8EGvpRwuYIDkL8QHU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ZMnKxShrQ6jdMpSIAwrIiKsoq+HgffH5ir1UYPkPYx8AijLsAYcJh8wkjVyi+pXvx
	 L84znkBNXZqwjckWZkRc2Rvy9wSMHEGDEXWMvSUQRmmM0BI6E5d6JK43hi5Ro3YWEz
	 lu7ISYiUiXJTUj55H3V608J2wjxd6+ijLxkvxwVfMZUPup4UwBWKAcdftemlSi5oC0
	 X3QmHArfIFa2IMk0/DLCDT40HCy0u5BVS6q/zxG4X6ZnrPE9g/xXtOczyuyLGP9CkE
	 4JAv8phlv5kJgH5hdt1FBhVMK0D+RBUcpxSB/g0Sn+U/o+5WihFA2bbmdFC5sEKhYU
	 PmTkTdWsglfRA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8MxSffB2kN
  JBk+3MlpcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBlXHkxhLtghUrF38zvmBsYOoS5GLg4hgSeM
  Ekv+fWGFcK4zSVzYepwZwtnNKNHSfpmli5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBT4kD8/4zgdgsQPEDU9vA6nkFHCXePG1hA7ElBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL1
  4wQ9QoSsy+3MwCYVdIzJixDapXTeLquU3MExj5ZyFpn4WkfQEj0ypGm6SizPSMktzEzBxdQwM
  DXUNDUyBtqGtsoJdYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdcmZuck6KXl1qyiREYminFqXI7
  GA/s+6V3iFGSg0lJlHdq7aEkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8TquBcoJFqempFWmZO
  cA4gUlLcPAoifB+XQSU5i0uSMwtzkyHSJ1i1OXYdPjKXmYhlrz8vFQpcd61a4CKBECKMkrz4E
  bAYvYSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeFJApPJl5JXCbXgEdwQR0xI2qAyBHlCQ
  ipKQamJS3/t6iXZ7a9iiisnviXE0b9qCZXL7VP8sCpRtMdHqmuy8rma7BMY836lmA/bxfKzhE
  7TXZ7WcYdv4q9rH5b/ddYcPnqFVFuR48+9keV9ruks48wOn36+YzTTafzTd3GZ1W4XtwK130v
  IKse9c95z3R0xdsbjpsMiFKfl7jrw3/1969s+bDhfMimov0v9gE3z26/V3MN2MNtrSczWon+n
  uF2O9Ov7bUIu9sYphVxDOPc9ZLn7HUFUn/Upg45ZPLn0tqK5vldsxQrfcM2hti+LC13/jVD/H
  0x7nFpyP574kt0HHTjg69aG14afZi++SM09P4fZfob4vT59a5+UpI4qjSKdc3f058qNvw7dnP
  AiWW4oxEQy3mouJEAEZ9JWhUAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-728.messagelabs.com!1656925663!20717!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23865 invoked from network); 4 Jul 2022 09:07:43 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Jul 2022 09:07:43 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 697181000C0
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  4 Jul 2022 10:07:43 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5CB03100077
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  4 Jul 2022 10:07:43 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 4 Jul 2022 10:07:41 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] abseil-cpp: upgrade 20211102 ->  20220623
Date: Mon, 4 Jul 2022 17:07:20 +0800
Message-ID: <1656925643-8143-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Jul 2022 09:07:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97682

0001-absl-always-use-asm-sgidefs.h.patch
refreshed for new verion.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch  | 9 +++++----
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb    | 6 +++---
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch
index a5bebf5f0..5242b29e0 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch
@@ -10,29 +10,30 @@ that makes it portable.
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  absl/base/internal/direct_mmap.h | 6 +-----
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/absl/base/internal/direct_mmap.h b/absl/base/internal/direct_mmap.h
-index a01d61220376..c8a4fbabbb3a 100644
+index e492bb0..c8a4fba 100644
 --- a/absl/base/internal/direct_mmap.h
 +++ b/absl/base/internal/direct_mmap.h
 @@ -41,13 +41,9 @@
  
  #ifdef __mips__
  // Include definitions of the ABI currently in use.
--#ifdef __BIONIC__
+-#if defined(__BIONIC__) || !defined(__GLIBC__)
 -// Android doesn't have sgidefs.h, but does have asm/sgidefs.h, which has the
 +// bionic/musl C libs don't have sgidefs.h, but do have asm/sgidefs.h, which has the
  // definitions we need.
  #include <asm/sgidefs.h>
 -#else
 -#include <sgidefs.h>
--#endif  // __BIONIC__
+-#endif  // __BIONIC__ || !__GLIBC__
  #endif  // __mips__
  
  // SYS_mmap and SYS_munmap are not defined in Android.
 -- 
-2.36.1
+2.25.1
 
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index b271134fd..b3dc06ca1 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -7,9 +7,9 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
 
-PV = "20211102.1+git${SRCPV}"
-SRCREV = "7c6608d0dbe43cf9bdf7f77787bc6bc89cc42f8b"
-BRANCH = "master"
+PV = "20220623.0"
+SRCREV = "273292d1cfc0a94a65082ee350509af1d113344d"
+BRANCH = "lts_2022_06_23"
 SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0001-absl-always-use-asm-sgidefs.h.patch             \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
-- 
2.25.1


