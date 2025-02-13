Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EC5C021A4
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 06:56:39 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.5548.1739429798691869416
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Feb 2025 22:56:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RUJHalFI;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739429799; x=1770965799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0ollwSb8u7HDZk1kXxsfqdLSiIMhJZMZj3S0BTOj3jw=;
  b=RUJHalFIgQi5Q/9qUTWkrIkdU3VGBoq5fjSCjKD9+QtjnUQ8+qvjw1el
   oHeBZOnTh8hWQS9h4HMphXVRKWxUs8T4lphXoqCRpOQRbog34r93CFmv6
   /c2pi9FuUZC8/nSqutHpuoiwAmngQkVN051LuK/qnltVmzhe3b74qE+OI
   Qzghk6H3nkeiJMwf0AyC0YnYJSqe7ZrZwCGZQ782IBjI/YNW43tqt1j2T
   HPLtUGk6Zj2vwwMDOUhEgXwbw5qS6odT+jMjyj3YtbVhUG41d5WfxqkP8
   w21A1wsGOqXuJVQ/0gcBt8bxIIax6Xpen/MJ0JfLr+5Di/sNAr2Re00JF
   w==;
X-CSE-ConnectionGUID: lyJmByoZRC25OgHeGreyVQ==
X-CSE-MsgGUID: tY38PZaEQ4O0H6l2J23a8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="189812763"
X-IronPort-AV: E=Sophos;i="6.13,282,1732546800"; 
   d="scan'208";a="189812763"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 15:56:37 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D9981D5078
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 15:56:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9ADBCF0F5C
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 15:56:33 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3D3111A000B;
	Thu, 13 Feb 2025 14:56:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] zabbix: upgrade 6.2.7 -> 6.4.21
Date: Thu, 13 Feb 2025 14:56:25 +0800
Message-Id: <1739429785-11694-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739429785-11694-1-git-send-email-wangmy@fujitsu.com>
References: <1739429785-11694-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 06:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115453

From: Wang Mingyu <wangmy@fujitsu.com>

0001-initialize-msghdr-portably.patch
removed since it's included in 6.4.21

releasenote:
 https://www.zabbix.com/rn/rn6.4.21

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-initialize-msghdr-portably.patch     | 52 -------------------
 .../{zabbix_6.2.7.bb => zabbix_6.4.21.bb}     |  5 +-
 2 files changed, 2 insertions(+), 55 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/0001-initialize-msghdr-portably.patch
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_6.2.7.bb => zabbix_6.4.21.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix/0001-initialize-msghdr-portably.patch b/meta-oe/recipes-connectivity/zabbix/zabbix/0001-initialize-msghdr-portably.patch
deleted file mode 100644
index a7a1dc1986..0000000000
--- a/meta-oe/recipes-connectivity/zabbix/zabbix/0001-initialize-msghdr-portably.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 37b662cf44e14b33e93759d4b129d23095b41372 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 31 Aug 2022 23:55:02 -0700
-Subject: [PATCH] initialize msghdr portably
-
-on linux we have musl as an option for system C library and current
-initialization assumes the structure to be same as glibc, therefore
-initialize the elements of structure instead, so it can work on both
-glibc and musl.
-
-Fixes
-net.c:115:79: error: incompatible pointer to integer conversion initializing 'int' with an expression of type 'void *' [-Wint-conversion]
-        struct msghdr           s_msg = { (void *)&s_sa, sizeof(struct sockaddr_nl), s_io, 1, NULL, 0, 0};
-                                                                                              ^~~~
-
-Upstream-Status: Submitted [https://github.com/zabbix/zabbix/pull/77]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/libs/zbxsysinfo/linux/net.c | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/src/libs/zbxsysinfo/linux/net.c b/src/libs/zbxsysinfo/linux/net.c
-index 1425a3604d..98f03de0dd 100644
---- a/src/libs/zbxsysinfo/linux/net.c
-+++ b/src/libs/zbxsysinfo/linux/net.c
-@@ -114,13 +114,21 @@ static int	find_tcp_port_by_state_nl(unsigned short port, int state, int *found)
- 
- 	struct sockaddr_nl	s_sa = { AF_NETLINK, 0, 0, 0 };
- 	struct iovec		s_io[1] = { { &request, sizeof(request) } };
--	struct msghdr		s_msg = { (void *)&s_sa, sizeof(struct sockaddr_nl), s_io, 1, NULL, 0, 0};
-+	struct msghdr		s_msg = { 0 };
-+	s_msg.msg_name 		= (void *)&s_sa;
-+	s_msg.msg_namelen 	= sizeof(struct sockaddr_nl);
-+	s_msg.msg_iov 		= s_io;
-+	s_msg.msg_iovlen 	= 1;
- 
- 	char			buffer[BUFSIZ] = { 0 };
- 
- 	struct sockaddr_nl	r_sa = { AF_NETLINK, 0, 0, 0 };
- 	struct iovec		r_io[1] = { { buffer, BUFSIZ } };
--	struct msghdr		r_msg = { (void *)&r_sa, sizeof(struct sockaddr_nl), r_io, 1, NULL, 0, 0};
-+	struct msghdr		r_msg = { 0 };
-+	r_msg.msg_name 		= (void *)&r_sa;
-+	r_msg.msg_namelen 	= sizeof(struct sockaddr_nl);
-+	r_msg.msg_iov 		= r_io;
-+	r_msg.msg_iovlen 	= 1;
- 
- 	struct nlmsghdr		*r_hdr;
- 
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.7.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_6.4.21.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_6.2.7.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_6.4.21.bb
index 46c09a02a5..4bfdecbf6d 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.7.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_6.4.21.bb
@@ -23,12 +23,11 @@ DEPENDS  = "libevent libpcre openldap virtual/libiconv zlib"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/6.2/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/6.4/${BPN}-${PV}.tar.gz \
     file://0001-Fix-configure.ac.patch \
-    file://0001-initialize-msghdr-portably.patch \
     file://zabbix-agent.service \
 "
-SRC_URI[sha256sum] = "6d423810667b948ed22052d9aa84a035e2d4b92cbe8efdb669cac529806b722d"
+SRC_URI[sha256sum] = "527010dbd45cf204dcd3b38e82df696b908b74f38e8d1ab9bbbb1292e784f394"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
-- 
2.43.0


