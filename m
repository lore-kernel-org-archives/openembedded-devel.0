Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 893D7C6FA8E
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:44 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web09.11280.1662276881332047114
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=POFxbb7W;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id fs14so929318pjb.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=kB6eT81CR2ne1+Gd7hkvtqC0ffMiiDFguGqR6YvozEQ=;
        b=POFxbb7W05ASnrT031mbkyE0ukGxCAvZxakDT4dUlgoRH+JQopvzUcMyet/1a0OX8s
         +JW5A4PI+1kzKeNSR03De0SYV1M0Xh38R+k/PsMh54fIK9xpw9mVcelVV3EkoTz/Va6r
         PnxiJ1EWLyKwQVvGWIfTZGoAt/RtMbgTNs8WEg2n+B1yaOkHEBrBIMYBH93ISWY29Qjl
         RsRqrjVWRJWQIJLd0QccFECdrd2zIiPFsDS5SU1uqmJgUsFIrnE1dfCJxg5R3WN+Q6ID
         SKBQWbdVO2ZETiiOjg/ITGB9yh3x7/njFR3pihM0pOpIFpKvP6xPVGyBQJKHAT26VkHj
         dxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kB6eT81CR2ne1+Gd7hkvtqC0ffMiiDFguGqR6YvozEQ=;
        b=bEvjNEpuyjQle0vGjhyNhtvW+LYgW9fmJjMRgjwG0XAgFTxOnHSoqRJjaiQpykB4IZ
         vXmS9mASJGc4sPZuwSOzGzQN9nC73c7PbdPOb2t8L6bnj4EDOEIhVH8A12lGM9IUaxHT
         MJAxsOJVbNjx8haIbmrxWLepHsWVOHZQlp6HmuPabJQWnsE3KPm3eW0Pd8kg8iicUiQD
         /iOVi4P458QswIKYnzqtLzz+bJ0t7BVhsKS+YKlsZfqRnK9JnslmKqBYexxlOtYZ7Ual
         vHB+RtolX6TKJKcuBufNgayVlYNeHHfsnPysgXvZIbUwBbfbnd3xaYyFfOkd1QKDICXD
         wbYA==
X-Gm-Message-State: ACgBeo37qaVXa1lzr6Hr5nAvMgD0W6WBRPjlyV+rz+gcwkmtTqn7tMCC
	HGYPQORr/+eqxsKpMKDYkD/maS5BxIp2vA==
X-Google-Smtp-Source: 
 AA6agR7/uKVcILOUXlr6xue11rgmI4OW9wPmcXCVECA8EffVB/3/uF+RJ9BkIO3AHLOVZGqX7p0wfQ==
X-Received: by 2002:a17:90b:1c8e:b0:1f7:5250:7b44 with SMTP id
 oo14-20020a17090b1c8e00b001f752507b44mr13611016pjb.212.1662276880444;
        Sun, 04 Sep 2022 00:34:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 19/63] zabbix: Upgrade to 6.2.2
Date: Sun,  4 Sep 2022 00:33:33 -0700
Message-Id: <20220904073417.3251865-19-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98613

Fix build on musl while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-initialize-msghdr-portably.patch     | 52 +++++++++++++++++++
 .../{zabbix_6.2.1.bb => zabbix_6.2.2.bb}      |  4 +-
 2 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/0001-initialize-msghdr-portably.patch
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_6.2.1.bb => zabbix_6.2.2.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix/0001-initialize-msghdr-portably.patch b/meta-oe/recipes-connectivity/zabbix/zabbix/0001-initialize-msghdr-portably.patch
new file mode 100644
index 0000000000..a7a1dc1986
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix/0001-initialize-msghdr-portably.patch
@@ -0,0 +1,52 @@
+From 37b662cf44e14b33e93759d4b129d23095b41372 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 31 Aug 2022 23:55:02 -0700
+Subject: [PATCH] initialize msghdr portably
+
+on linux we have musl as an option for system C library and current
+initialization assumes the structure to be same as glibc, therefore
+initialize the elements of structure instead, so it can work on both
+glibc and musl.
+
+Fixes
+net.c:115:79: error: incompatible pointer to integer conversion initializing 'int' with an expression of type 'void *' [-Wint-conversion]
+        struct msghdr           s_msg = { (void *)&s_sa, sizeof(struct sockaddr_nl), s_io, 1, NULL, 0, 0};
+                                                                                              ^~~~
+
+Upstream-Status: Submitted [https://github.com/zabbix/zabbix/pull/77]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libs/zbxsysinfo/linux/net.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/src/libs/zbxsysinfo/linux/net.c b/src/libs/zbxsysinfo/linux/net.c
+index 1425a3604d..98f03de0dd 100644
+--- a/src/libs/zbxsysinfo/linux/net.c
++++ b/src/libs/zbxsysinfo/linux/net.c
+@@ -114,13 +114,21 @@ static int	find_tcp_port_by_state_nl(unsigned short port, int state, int *found)
+ 
+ 	struct sockaddr_nl	s_sa = { AF_NETLINK, 0, 0, 0 };
+ 	struct iovec		s_io[1] = { { &request, sizeof(request) } };
+-	struct msghdr		s_msg = { (void *)&s_sa, sizeof(struct sockaddr_nl), s_io, 1, NULL, 0, 0};
++	struct msghdr		s_msg = { 0 };
++	s_msg.msg_name 		= (void *)&s_sa;
++	s_msg.msg_namelen 	= sizeof(struct sockaddr_nl);
++	s_msg.msg_iov 		= s_io;
++	s_msg.msg_iovlen 	= 1;
+ 
+ 	char			buffer[BUFSIZ] = { 0 };
+ 
+ 	struct sockaddr_nl	r_sa = { AF_NETLINK, 0, 0, 0 };
+ 	struct iovec		r_io[1] = { { buffer, BUFSIZ } };
+-	struct msghdr		r_msg = { (void *)&r_sa, sizeof(struct sockaddr_nl), r_io, 1, NULL, 0, 0};
++	struct msghdr		r_msg = { 0 };
++	r_msg.msg_name 		= (void *)&r_sa;
++	r_msg.msg_namelen 	= sizeof(struct sockaddr_nl);
++	r_msg.msg_iov 		= r_io;
++	r_msg.msg_iovlen 	= 1;
+ 
+ 	struct nlmsghdr		*r_hdr;
+ 
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.1.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.2.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_6.2.1.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_6.2.2.bb
index 9949bd81f1..58ec461745 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.1.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.2.bb
@@ -25,10 +25,10 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/6.2/${BPN}-${PV}.tar.gz \
     file://0001-Fix-configure.ac.patch \
+    file://0001-initialize-msghdr-portably.patch \
     file://zabbix-agent.service \
 "
-
-SRC_URI[sha256sum] = "f3d6b7cf4e67d820ce7d28cd54ac67724f7453f261f668877e6410cd21ab9ea1"
+SRC_URI[sha256sum] = "f0e7a9abb0f65d700f531253b91c31165077a9c94769cc8d238a423ada852773"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
-- 
2.37.3


