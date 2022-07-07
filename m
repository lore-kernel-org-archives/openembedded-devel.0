Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 132BDCCA481
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 06:59:33 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.2731.1657177169485969076
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 23:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ELSEEKKN;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657177167; i=@fujitsu.com;
	bh=QiZmUS0xiBRalPK+z1XCNW2y/YYMIGFfawJgFz54w04=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ELSEEKKNcbLQi5ngegKpKe0/kzsCYVF1u4BpSjNfA/cwUq2lP4d/mjVTVt5mhTjWF
	 k5cEJD8fEFyHscz+UXBHX/4dK/VUbVpk6vGasJA2C0w/EneHiTLys7BfJLEAHAdlPd
	 abb1bTtEJkzARfQiVSIcm1mMUUXpPuQVEQoHKZ5tWlnMSSgdEg8P1DsrRPtxS+yFBW
	 4ccVUzi1JG2yWDG3TOnZuqaWiszKhrdfqneHwHvIUYsTHOyVP5SvjEtOZEnoie4243
	 8J+TrbIo3xkYRJUKLk+rGbB3LsouhITNKg0ZDxnUgJugEKko72CJVaKNfXkiOwnyQF
	 mTh/uAnHunYkA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORpOvXciz
  J4Oh1EYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePoxNlMBf/4Kz4+nM7YwHiSt4uRi0NI4CGj
  RPupNlYI5zKTxMFNM6Gc3YwS27fuZe5i5ORgE1CTmH7rBiuILSKgL7F09h6wOLOAisSL3z3sI
  LawgIPE3WnvwWwWkPjRdkYQm1fASeLTrvtgvRICChJTHr4H6+UUcJY4eOouC4gtBFTzeuk/do
  h6QYmTM5+wQMyXkDj44gUzRK+ixOzLzSwQdoXEjBnb2CBsNYmr5zYxT2AUnIWkfRaS9gWMTKs
  YrZKKMtMzSnITM3N0DQ0MdA0NTXUNdI1MjPUSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yorc5Nz
  UvTyUks2MQLDOKWY4fMOxgV9P/UOMUpyMCmJ8nrVH0sS4kvKT6nMSCzOiC8qzUktPsQow8GhJ
  MHL3wSUEyxKTU+tSMvMAcYUTFqCg0dJhJexGSjNW1yQmFucmQ6ROsWoKCXOew8kIQCSyCjNg2
  uDxfElRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8XiBTeDLzSuCmvwJazAS0eFn+EZDFJYk
  IKakGpqQ+g+zYJfkbGQSFThle/a8x81Efq5qoVPWTIyen9z7bVWn6/b3Jlue3Ozw/b2/q3nZg
  xjrmkteVU2qULjrkPtw0SeBIhNvPvF6pw6emPFAR7j1XeEdiv+UOXmFbs9WnLz/jL+Gaaq07Z
  WmXra23H8c+r6k8i3gm3Pu4/l2BZNzlY8suqL/v8OuTzL/z6VOkho7yS/6vfKVLpflN+bYYcR
  iU6O+bzl4z80dwvE7yu3m7KtZ/YzFcs06xsPPumrw6s0VveXzVzOQvfzX6G3h69RvbiscJkQu
  iQk4dLAw5vN9ZwJRHtflH8Y77agXfei6anbwm7J/kvqMrxPb8yT1TLrbsYV7CY7V7gnzHr3kf
  LiqxFGckGmoxFxUnAgCibG0qXgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-587.messagelabs.com!1657177166!4916!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9311 invoked from network); 7 Jul 2022 06:59:26 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-14.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jul 2022 06:59:26 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id F09A01B1
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 07:59:25 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id E57177C
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 07:59:25 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Jul 2022 07:59:24 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libvpx: upgrade 1.11.0 -> 1.12.0
Date: Thu, 7 Jul 2022 14:58:56 +0800
Message-ID: <1657177137-28347-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657177137-28347-1-git-send-email-wangmy@fujitsu.com>
References: <1657177137-28347-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 06:59:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97740

Changelog:
=========
 This release adds optimizations for Loongarch, adds support for vp8 in the
  real-time rate control library, upgrades GoogleTest to v1.11.0, updates
  libwebm to libwebm-1.0.0.28-20-g206d268, and includes numerous bug fixes.

- Upgrading:
    This release is ABI compatible with the previous release.
    vp8 support in the real-time rate control library.
    New codec control VP8E_SET_RTC_EXTERNAL_RATECTRL is added.
    Configure support for darwin21 is added.
    GoogleTest is upgraded to v1.11.0.
    libwebm is updated to libwebm-1.0.0.28-20-g206d268.

- Enhancement:
    Numerous improvements on checking memory allocations.
    Optimizations for Loongarch.
    Code clean-up.

- Bug fixes:
    Fix to a crash related to {vp8/vp9}_set_roi_map.
    Fix to compiling failure with -Wformat-nonliteral.
    Fix to integer overflow with vp9 with high resolution content.
    Fix to AddNoiseTest failure with ARMv7.
    Fix to libvpx Null-dereference READ in vp8.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../webm/{libvpx_1.11.0.bb => libvpx_1.12.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/webm/{libvpx_1.11.0.bb => libvpx_1.12.0.bb} (96%)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.11.0.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb
similarity index 96%
rename from meta-oe/recipes-multimedia/webm/libvpx_1.11.0.bb
rename to meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb
index 8fd4f698d..066d7cc81 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.11.0.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
 
-SRCREV = "626ff35955c2c35b806b3e0ecf551a1a8611cdbf"
+SRCREV = "03265cd42b3783532de72f2ded5436652e6f5ce3"
 SRC_URI += "git://chromium.googlesource.com/webm/libvpx;protocol=https;branch=main \
            file://libvpx-configure-support-blank-prefix.patch \
            "
-- 
2.25.1


