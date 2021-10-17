Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 938B8C433F5
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 23:12:27 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.29549.1634512346436167054
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Oct 2021 16:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gp67+Hei;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id 187so13256036pfc.10
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Oct 2021 16:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fco4ZSQ0LHuowrJSkfItossyjtFmliRS1aGz9/UBW7k=;
        b=gp67+HeihqK9pYwxpdyOULP6aeAFkUmeJx1AZh/nga/2iNvvHr3AzDCS37I7IXkkjh
         DgLhFQI20QUIkYcqn2IvcAqaWuUJkYhU/lSkqyklx30iiK8/t5RwISv+akCR1spZe44F
         kSPfXri7NfbkiGDTpawrTvFLiA9pq1oiLA/JQD3P0iW//2jzpBreBP1xAy2wPRAeP6S2
         9pOye2xVB+QwJEGgbkS6kssK/B9xX1qOopH1S88GrUGA28MKSJpkrkq9b/C9S9/ovGSa
         eJZTqI+Dk4BEh75IvALbWUmoO7TA94yBbj4I80SUXBB+ylL4QVSuZEXhIonZZxGkXz1J
         ffYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fco4ZSQ0LHuowrJSkfItossyjtFmliRS1aGz9/UBW7k=;
        b=2KCBvG02Xtb8a+JY87E/e5YO43k9NlxRBw3BSr4qO1XbYIQZnn9xXmmm5t1qE/6xbc
         uQdm24uMQVGHqUpJahBAs4CIxssB1LP4D2Cfl4x8pUud/vqCjQmkRzS6Vsx/EtjoAj5v
         1qJQbO4Cfct/XSzjhcSTqdZmquKfjl1XqJ21MJqIltEAtTR+FR4+JPVF71eYE6KFpt6D
         ZW9KFdEtzPcespshDGnSzF4lOm88DJCUaQz3MVtwNjYx2lLJLejaF3AW2/+QbE9mlPhr
         NsDY3a2JuQYYWb+PNl3vwbhRbKYN2LQcc8k8ouKG/rwR5r+bNUawfT/8hsEWyP+q7jMw
         s8dQ==
X-Gm-Message-State: AOAM533P7olAdLmD1HX/HEK7CFQrDytpkvvmXZen48hrIqekCBfpCTRj
	ya8dBN0OhZIJ07ZJ5RAOaZFmtjqvqw1xoQ==
X-Google-Smtp-Source: 
 ABdhPJzIfwxv+jtUZfqy1SQVwzcZnUFkTeqHtto7+Pqxc3KRi8gPJw1kMLeXZ8/oVygfrlm0fiTNTA==
X-Received: by 2002:a05:6a00:1255:b0:44c:dd49:b39a with SMTP id
 u21-20020a056a00125500b0044cdd49b39amr25495117pfi.66.1634512345712;
        Sun, 17 Oct 2021 16:12:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3fd8])
        by smtp.gmail.com with ESMTPSA id
 mi8sm11651857pjb.20.2021.10.17.16.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 16:12:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] iwd: Fix  build with musl
Date: Sun, 17 Oct 2021 16:12:22 -0700
Message-Id: <20211017231222.2249477-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Oct 2021 23:12:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93414

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...6_addr-instead-of-__in6_u.__u6_addr8.patch | 38 +++++++++++++++++++
 meta-oe/recipes-connectivity/iwd/iwd_1.18.bb  |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/iwd/iwd/0001-netconfig-Use-s6_addr-instead-of-__in6_u.__u6_addr8.patch

diff --git a/meta-oe/recipes-connectivity/iwd/iwd/0001-netconfig-Use-s6_addr-instead-of-__in6_u.__u6_addr8.patch b/meta-oe/recipes-connectivity/iwd/iwd/0001-netconfig-Use-s6_addr-instead-of-__in6_u.__u6_addr8.patch
new file mode 100644
index 0000000000..a9f2393532
--- /dev/null
+++ b/meta-oe/recipes-connectivity/iwd/iwd/0001-netconfig-Use-s6_addr-instead-of-__in6_u.__u6_addr8.patch
@@ -0,0 +1,38 @@
+From 36c74f974eba6f276ed4dd04c2077e6f23ebec37 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 17 Oct 2021 16:09:03 -0700
+Subject: [PATCH] netconfig: Use s6_addr instead of __in6_u.__u6_addr8
+
+Building fails with:
+
+../iwd-1.18/src/netconfig.c: In function 'netconfig_ipv6_to_string':
+../iwd-1.18/src/netconfig.c:188:25: error: 'struct in6_addr' has no member named '__in6_u'; did you mean '__in6_union'?
+  188 |         memcpy(in6_addr.__in6_u.__u6_addr8, addr, 16);
+      |                         ^~~~~~~
+      |                         __in6_union
+
+Can be fixed by changing &this_ip.__in6_u.__u6_addr8[0] with &this_ip.s6_addr[0].
+For references: in6_addr is declared in /usr/include/linux/in6.h
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/netconfig.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/netconfig.c b/src/netconfig.c
+index c748630..ab51c3d 100644
+--- a/src/netconfig.c
++++ b/src/netconfig.c
+@@ -185,7 +185,7 @@ static inline char *netconfig_ipv6_to_string(const uint8_t *addr)
+ 	struct in6_addr in6_addr;
+ 	char *addr_str = l_malloc(INET6_ADDRSTRLEN);
+ 
+-	memcpy(in6_addr.__in6_u.__u6_addr8, addr, 16);
++	memcpy(in6_addr.s6_addr, addr, 16);
+ 
+ 	if (L_WARN_ON(unlikely(!inet_ntop(AF_INET6, &in6_addr, addr_str,
+ 						INET6_ADDRSTRLEN)))) {
+-- 
+2.33.1
+
diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.18.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.18.bb
index 8d58a7a84b..4136de84fa 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.18.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.18.bb
@@ -7,6 +7,7 @@ DEPENDS = "ell"
 
 SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
+           file://0001-netconfig-Use-s6_addr-instead-of-__in6_u.__u6_addr8.patch \
           "
 SRC_URI[sha256sum] = "0225ab81579f027e0fcbf255517f432fcf355d14f3645c36813c71a441dfab55"
 
-- 
2.33.1


