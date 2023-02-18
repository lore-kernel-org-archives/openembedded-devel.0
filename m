Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8EFCC64ED8
	for <webhook@archiver.kernel.org>; Sat, 18 Feb 2023 06:39:39 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.7776.1676702373004160503
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Feb 2023 22:39:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BUHOlvZg;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676702371; i=@fujitsu.com;
	bh=l5ahEHrY3el8aKmNcNeuCAi5ErWhJYAPyDV+kFJQCm4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BUHOlvZg3aL6/umWO2A2x/oHVFptd3QsZbkrzLRBqEJ8siQpQy0jSZbwPLMEAPa7d
	 ZgP7Q1K8nLNKmkcE4CG74DS199E9DIa/CrcXrE5jenI8wdIAW1x8LzyzRt5BZ1+xvb
	 7aYoYB2uDJHORpZFSVfoayYTW9hkPBqSxpUePKgn5qwhEee7SoDNIukIq/A0ypM0dq
	 wBkWZLHsQ0Wv4LVQKPvKDLu4esct4OAP5wTCbmQmGKTVanN8CoaWEIFvPsr8He0dm1
	 CyK4B2OQQmqKnC83xd/xKIcdF5/WmDcZNaIXLjzaeJnerwA9GUKcqda9AuRF8ZF52b
	 8jvDg1Hpt9TmQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORqLuo6EO
  ywa6d1hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bz41aWgl18FQdvbGJrYPzI08XIxSEk8IRR
  YuHKm4wQzg0miXfdv9m7GDmBnL2MEldmi4DYbAJSEjfu/2cDsUUE9CWWzt7DDGIzC6hIvPjdA
  1YvLGAj0ThpLVCcg4NFQFViwn+wMK+Ak8TsS5+YQGwJAQWJKQ/fg7VyCjhLLHu8mg1ilZPEti
  NnWCHqBSVOznzCAjFeQuLgixfMEL2KErMvN7NA2JUSrR9+QdlqElfPbWKewCg4C0n7LCTtCxi
  ZVjGaFqcWlaUW6ZroJRVlpmeU5CZm5uglVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibnpOjl
  pZZsYgQGbkqx4rEdjP96/+odYpTkYFIS5f287X2yEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQnen
  wUfkoUEi1LTUyvSMnOAUQSTluDgURLhPZ0OlOYtLkjMLc5Mh0idYlSUEudlSAVKCIAkMkrz4N
  pgkXuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvUpDtPJl5JXDTXwEtZgJavID5LcjikkS
  ElFQDk404d83bzyuKO2Z8KywJeXNSV/rI5kvtKRkZf7tCk71d3PV2hUjZlX6yFe7cq3BgR9Wv
  ZElzA8al/9sfqjOFfdx26vYHhYItz4qO/pz146NecqxPwcX2PI/emwyrI1SOz9zLG8fKdSAp8
  sOONVvM9/VfNAhMKre4luh6VW3Okb5jv5+uX5A96aPCN6WGRx4yk7yV4s+8dXy1VmZta9PFTW
  q9Mlc7yvfUOOZf4ZmX27ph1brWp/UbHsxL36L177rN/o2d1k5/siqvy7c+tvw+49DhtLAV73b
  M44hNKfKtSdVqaFv9OV395cqrSSWO7mreUR4rRBJ3O/5O+DZ747nS+BXpnj89DV0k5b/5xin9
  UGIpzkg01GIuKk4EANpRxeNXAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-548.messagelabs.com!1676702370!53138!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1504 invoked from network); 18 Feb 2023 06:39:30 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Feb 2023 06:39:30 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id AB7B110018D
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 06:39:30 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9F0CE100043
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 06:39:30 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 18 Feb 2023 06:39:28 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] liburing: upgrade 2.2 -> 2.3
Date: Sat, 18 Feb 2023 14:39:01 +0800
Message-ID: <1676702342-30766-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676702342-30766-1-git-send-email-wangmy@fujitsu.com>
References: <1676702342-30766-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 06:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101136

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Support non-libc build for aarch64.
- Add io_uring_{enter,enter2,register,setup} syscall functions.
- Add sync cancel interface, io_uring_register_sync_cancel().
- Fix return value of io_uring_submit_and_wait_timeout() to match the
  man page.
- Improvements to the regression tests
- Add support and test case for passthrough IO
- Add recv and recvmsg multishot helpers and support
- Add documentation and support for IORING_SETUP_DEFER_TASKRUN
- Fix potential missing kernel entry with IORING_SETUP_IOPOLL
- Add support and documentation for zero-copy network transmit
- Various optimizations
- Many cleanups
- Many man page additions and updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../liburing/{liburing_2.2.bb => liburing_2.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/liburing/{liburing_2.2.bb => liburing_2.3.bb} (96%)

diff --git a/meta-oe/recipes-support/liburing/liburing_2.2.bb b/meta-oe/recipes-support/liburing/liburing_2.3.bb
similarity index 96%
rename from meta-oe/recipes-support/liburing/liburing_2.2.bb
rename to meta-oe/recipes-support/liburing/liburing_2.3.bb
index 8cc7d74f9..b3da4d5e0 100644
--- a/meta-oe/recipes-support/liburing/liburing_2.2.bb
+++ b/meta-oe/recipes-support/liburing/liburing_2.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=41;endline=44;md5=2b0e9926530c269f5a
 SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https"
 SRC_URI:append:libc-musl:riscv64 = " file://0001-do-not-build-examples.patch "
 SRC_URI:append:libc-musl:riscv32 = " file://0001-do-not-build-examples.patch "
-SRCREV = "dda4848a9911120a903bef6284fb88286f4464c9"
+SRCREV = "4915f2af869876d892a1f591ee2c21be21c6fc5c"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


