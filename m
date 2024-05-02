Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420EFC4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:32 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.6679.1714628965379368270
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mlHGmtLJ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628966; x=1746164966;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cp17fbyTPSpXvZtqJo33cbcL/O1bj8D55hfUWmKN1Qo=;
  b=mlHGmtLJ7d9kd5nZcWTExsBqQryxTHEXxtNYyOGwm1Re4V2JTE9cpggd
   p63x7Jw6MVwojnKPXi2lTLF0K5ILTkGfYrpy6o0MkeE5eHjkNq5KSYCjJ
   DWtU6p2voTpwKSF1BMjC7vUAOSQcDW79p1tnXfzejTi6eqM3F4rKyNyCL
   qyKmovFmZLxGMRxiv8RymILFteNYfHu4IerY4/fq3tc/Wu8uGtobSESoT
   oJvK5vs80eCPD9IQVJUGElAFdnjOWWdlPTKNlzFjITxpmQzKpvNfyp4Pm
   rCEdbIezJebBQeEvoYx1Dje9/BRScdbZNmdCbv0kfTYpK5/lM7H20yE1S
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="136608492"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="136608492"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:23 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6D633D647E
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:20 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 92BAAD5B51
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 152382008BCDC
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:19 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8D2FB1A0002;
	Thu,  2 May 2024 13:49:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 01/30] fping: upgrade 5.1 -> 5.2
Date: Thu,  2 May 2024 10:48:00 -0400
Message-Id: <20240502144829.241208-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10--0.858000-10.000000
X-TMASE-MatchedRID: mL9wGNQYBVujz0nOeth/yULhYg/sa1gskdS3kPlaZyXkABvhO7aBvq4r
	mQIDoB6SgRXUy3f9jsRkaBN1FdSa7Y6tQ+b081RSs/Hes76OTZCW0X7Fb7OFSBgjdVnV+k+fD2V
	MA3hbGfGagRMdpDerUa2ypSgzVO+5K+411kGCtg/vZFvZsQkL7T0TJngLQWHb6Mw4RnkAvRJ+ss
	ezhRNvEM6KEl0Uv1e4m+F4c/a/TS3MwX9gzZBdOQKDWtq/hHcNZO9HMBr2F/jop8fmelLj8NnfJ
	rUSEbFD/9FzCWH6Yv23L0MTVuNYilpCIuRr0RxKP0HVIeixJdDBOVz0Jwcxl0fyM5VfgjG209D6
	Rw2zIrPxq3ixYTmGCwCnFm3MMDgBJXp9VP6Qsno1PRCuPh/FNYd5TLtlbtYCEd+K6O5Nt53gdBm
	c7mMmaOu49W/KrSfZ+n7tqDY7yKjpZnwb/PFSE+9VsdrlGzy3oQhLGoV/WBIPa94jf+HCb9ftCr
	F2sVs+4vM1YF6AJbZT3DhdVcNYJgtuKBGekqUpnH7sbImOEBRlRi+XweknEGXHItKjp/h/lUMFb
	NM4XOnlP8yt3QoNkO9e63oVlRCpBMcrFu0+CBJ1dIRjYzEmA8EXcRMFzZ9SzDFkwDFWRmabDRBq
	S2n66yzP5xAyz9Oenvkw4sh/+PcMX5CwH5DTUmgGZNLBHGNe
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110211

From: Wang Mingyu <wangmy@fujitsu.com>

0001-fping-Initialize-msghdr-struct-in-a-portable-way.patch
removed since it's included in 5.2

Changelog:
============
-New option -X / --fast-reachable to exit immediately once N hosts have been found
-New option -k / -fwmark to set Linux fwmark mask
-Always output fatal error messages
-Fallback to SO_TIMESTAMP if SO_TIMESTAMPNS is not available
-Fix "not enough sequence numbers available" error on BSD-like systems
-Fix running in unprivileged mode
-Fix build issue for NetBSD/alpha
-Fix build issue for OpenBSD/alpha
-Fix build warning for long int usage
-Fix build error with musl libc
-Fix to guard against division by zero
-Decouple -a/-u effects from -c
-Added contrib/Dockerfile
-Remove host from Netdata chart titles
-Add additional tests
-Update github action os images
-Fix Azure pipeline tests
-Various autoconf fixes
-Extended configure script with --enable-debug and output cpu usage
-Documentation: Update Netdata website link
-Documentation: fix description of --file option
-Documentation: improve exit status description
-Documentation: move description of -i MSEC
-Documentation: improve help output for options -c and -C

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...lize-msghdr-struct-in-a-portable-way.patch | 42 -------------------
 .../fping/{fping_5.1.bb => fping_5.2.bb}      |  6 +--
 2 files changed, 2 insertions(+), 46 deletions(-)
 delete mode 100644 meta-networking/recipes-support/fping/fping/0001-fping-Initialize-msghdr-struct-in-a-portable-way.patch
 rename meta-networking/recipes-support/fping/{fping_5.1.bb => fping_5.2.bb} (80%)

diff --git a/meta-networking/recipes-support/fping/fping/0001-fping-Initialize-msghdr-struct-in-a-portable-way.patch b/meta-networking/recipes-support/fping/fping/0001-fping-Initialize-msghdr-struct-in-a-portable-way.patch
deleted file mode 100644
index 9965d2ec5..000000000
--- a/meta-networking/recipes-support/fping/fping/0001-fping-Initialize-msghdr-struct-in-a-portable-way.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From c3f476a763412be51b4df0e748af04d4150a2c71 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 29 Aug 2022 15:41:51 -0700
-Subject: [PATCH] fping: Initialize msghdr struct in a portable way
-
-Initializing the structure assuming glibc layout results in
-compile errors on musl, therefore do partial intialization and then
-assigning the members individually.
-
-Upstream-Status: Submitted [https://github.com/schweikert/fping/pull/263]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/fping.c | 16 +++++++---------
- 1 file changed, 7 insertions(+), 9 deletions(-)
-
-diff --git a/src/fping.c b/src/fping.c
-index e26b216..81a61d9 100644
---- a/src/fping.c
-+++ b/src/fping.c
-@@ -1951,15 +1951,13 @@ int receive_packet(int64_t wait_time,
-         reply_buf,
-         reply_buf_len
-     };
--    struct msghdr recv_msghdr = {
--        reply_src_addr,
--        reply_src_addr_len,
--        &msg_iov,
--        1,
--        &msg_control,
--        sizeof(msg_control),
--        0
--    };
-+    struct msghdr recv_msghdr = {0};
-+    recv_msghdr.msg_name = reply_src_addr;
-+    recv_msghdr.msg_namelen = reply_src_addr_len;
-+    recv_msghdr.msg_iov = &msg_iov;
-+    recv_msghdr.msg_iovlen = 1;
-+    recv_msghdr.msg_control = &msg_control;
-+    recv_msghdr.msg_controllen = sizeof(msg_control);
- #if HAVE_SO_TIMESTAMPNS
-     struct cmsghdr* cmsg;
- #endif
diff --git a/meta-networking/recipes-support/fping/fping_5.1.bb b/meta-networking/recipes-support/fping/fping_5.2.bb
similarity index 80%
rename from meta-networking/recipes-support/fping/fping_5.1.bb
rename to meta-networking/recipes-support/fping/fping_5.2.bb
index 0682eafa0..f75b6441b 100644
--- a/meta-networking/recipes-support/fping/fping_5.1.bb
+++ b/meta-networking/recipes-support/fping/fping_5.2.bb
@@ -14,10 +14,8 @@ LICENSE = "fping"
 NO_GENERIC_LICENSE[fping] = "COPYING"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c6170fbadddfcd74f011515291d96901"
 
-SRC_URI = "http://www.fping.org/dist/fping-${PV}.tar.gz \
-           file://0001-fping-Initialize-msghdr-struct-in-a-portable-way.patch \
-           "
-SRC_URI[sha256sum] = "1ee5268c063d76646af2b4426052e7d81a42b657e6a77d8e7d3d2e60fd7409fe"
+SRC_URI = "http://www.fping.org/dist/fping-${PV}.tar.gz"
+SRC_URI[sha256sum] = "a7692d10d73fb0bb76e1f7459aa7f19bbcdbfc5adbedef02f468974b18b0e42f"
 
 S = "${WORKDIR}/fping-${PV}"
 
-- 
2.34.1


