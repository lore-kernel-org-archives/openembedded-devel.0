Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E29BC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:29:00 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web12.1117.1667809732605428816
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:28:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oCsZWvfR;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667809730; i=@fujitsu.com;
	bh=59K3+qIHwjbaY7UAvuEmY1yf9MURwQ7uqfrx0oPwPX8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oCsZWvfRejN6BfOn56cZXKogeCkwQrSfGrNNKOOJlkEI2LbFThqvE8ew4jEm1okcz
	 8aI779bJMiX8kh4rLIgjuDHeCBaj6j/dRoHsaaEQ9Sj45MDyAmn2ZV/3cwBlQUa3ex
	 BGRUcIXuX/c6lLyyCW8/G+yLR5ycc4iZKGqb8R4hGzSWQbWrJ03a+NB9FNUhPi/Coc
	 nVNWZPj0uYU/QZE+TcgbW7iLd8ZLGJDdD+EK3WImw6oc9a3JEsxEzOE+QE1UgIla+S
	 wPidn52KGVnj6JzXkz7Cf34isL31Qv4c7NSrh46/3fMOIbVsRTHmIv9tpBHrp+wgpn
	 dPybMa0tdNYMQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRWlGSWpSXmKPExsViZ8OxWffQwYx
  kg7P/5SwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ox7s5+xF/SIVbx718TSwHhYuIuRi0NI4CGj
  xJoP3SxdjJxAzmUmicOblCDs3YwSa2c6gthsAlISN+7/ZwOxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILC9hIvOjazQpiswDF29p3gtXwCjhJbFr8DcyWEFCQmPLwPZjNKeAs0XN0CTPELieJC7dbWC
  DqBSVOznzCAjFfQuLgixdQvYoSsy83s0DYFRKzZrUxQdhqElfPbWKewCg4C0n7LCTtCxiZVjG
  aFqcWlaUW6ZrqJRVlpmeU5CZm5uglVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibnpOjlpZZs
  YgQGbkoxY9kOxu5lf/QOMUpyMCmJ8v5enpEsxJeUn1KZkVicEV9UmpNafIhRhoNDSYL3xkagn
  GBRanpqRVpmDjCKYNISHDxKIrxh+4DSvMUFibnFmekQqVOMlhxTZ//bz8yxHEzO/Np2gFmIJS
  8/L1VKnPfabqAGAZCGjNI8uHGwSL/EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZiXeQ/QFJ7
  MvBK4ra+ADmICOqi6IA3koJJEhJRUA1P94l2SV+Z93eKUZ+f8++b7W7++FOR9XXBAS5KlK7R7
  5u/if85GXoG/FPZsldaZ8IF5YvqD1WaFV49W86oEcRxceb6KuYrLpTXwSMoq8d93b++51vUw1
  rts55kJT922xde4bODZwXveR61O6/PUtnY5c2X98+/OximzKWx6xRe+RpY5d1OKzkeBeX+v1w
  Ur1i5w7Dw40zWkUCtiUXj7/qST21++duzfxaBZwhw0zchXyW/yx6k3I/9rGU5YNSMr+uDXmGc
  5UfFnvp2Zdfqd9r+fC+f1bM06dkpeie/s7bu57+46MQYWHPyTcvBR6JNCYVWL/lhDTekbZbZu
  WkdcO7J5F1r4HNotd6k06k1f8gElluKMREMt5qLiRAA9OuHObwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-585.messagelabs.com!1667809730!321487!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27064 invoked from network); 7 Nov 2022 08:28:50 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-15.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:28:50 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 1CFD5142
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:28:50 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 1016173
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:28:50 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:28:48 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] mosh: upgrade 1.3.2 -> 1.4.0
Date: Mon, 7 Nov 2022 16:28:22 +0800
Message-ID: <1667809704-30790-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667809704-30790-1-git-send-email-wangmy@fujitsu.com>
References: <1667809704-30790-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:29:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99444

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fix-building-with-libc.patch
removed since it's included in 1.4.0

Changelog:
https://github.com/mobile-shell/mosh/releases/tag/mosh-1.4.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mosh/0001-Fix-building-with-libc.patch    | 24 -------------------
 .../mosh/{mosh_1.3.2.bb => mosh_1.4.0.bb}     |  7 ++----
 2 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/mosh/mosh/0001-Fix-building-with-libc.patch
 rename meta-oe/recipes-connectivity/mosh/{mosh_1.3.2.bb => mosh_1.4.0.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/mosh/mosh/0001-Fix-building-with-libc.patch b/meta-oe/recipes-connectivity/mosh/mosh/0001-Fix-building-with-libc.patch
deleted file mode 100644
index 100ede17b..000000000
--- a/meta-oe/recipes-connectivity/mosh/mosh/0001-Fix-building-with-libc.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From efa9e49714b30d7d9128946a2504c93e10d109b5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 29 Jan 2019 12:20:03 -0800
-Subject: [PATCH] Fix building with libc++
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/network/network.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/network/network.cc b/src/network/network.cc
-index 26da603..e480853 100644
---- a/src/network/network.cc
-+++ b/src/network/network.cc
-@@ -335,7 +335,7 @@ bool Connection::try_bind( const char *addr, int port_low, int port_high )
-       }
-     }
- 
--    if ( bind( sock(), &local_addr.sa, local_addr_len ) == 0 ) {
-+    if ( ::bind( sock(), &local_addr.sa, local_addr_len ) == 0 ) {
-       set_MTU( local_addr.sa.sa_family );
-       return true;
-     } else if ( i == search_high ) { /* last port to search */
diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.3.2.bb b/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/mosh/mosh_1.3.2.bb
rename to meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
index b4b5aa78a..4537a0941 100644
--- a/meta-oe/recipes-connectivity/mosh/mosh_1.3.2.bb
+++ b/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
@@ -14,11 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "protobuf-native protobuf ncurses zlib libio-pty-perl openssl libutempter"
 
-SRC_URI = "http://mosh.mit.edu/mosh-${PV}.tar.gz \
-           file://0001-Fix-building-with-libc.patch \
-           "
-SRC_URI[md5sum] = "5122f4d2b973ab7c38dcdac8c35cb61e"
-SRC_URI[sha256sum] = "da600573dfa827d88ce114e0fed30210689381bbdcff543c931e4d6a2e851216"
+SRC_URI = "http://mosh.mit.edu/mosh-${PV}.tar.gz"
+SRC_URI[sha256sum] = "872e4b134e5df29c8933dff12350785054d2fd2839b5ae6b5587b14db1465ddd"
 
 inherit autotools pkgconfig
 
-- 
2.25.1


