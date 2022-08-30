Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D218FC0502F
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 07:14:22 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.8673.1661843657362085351
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y9ofPpWx;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id t5so10310641pjs.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=7fHkG1LNKFI6ZaoR/XTtmRDk10vQcG8/p6FFTM8pY+o=;
        b=Y9ofPpWxMV0L3SzNkqLj3bIpfSFJ5D1V6SYJmIoXm94+wUog88fb3V60UoEKffxgiF
         PGHUH8W2lj/FU3p80GAOrCKtggEH/OMzANxgjpd1rrJTQAHivEYGjJA+Ckcf9Kz5hdkG
         YrJe3nLE98See9gR5pqmgMxZRmDVauH+/qKl2NOn2BjR6lQ8rePoa940LwrzWnshyg0a
         9TIariwcNjnTYWbMsA7VBNkVYaOZgbaTCDSuXUWOwUeXdQmPVMcuvQ0cSJOxS+k6wPAz
         DtAfjoyVpm3tFT7Ub1RJZqQCpfUS9bMqd8ic3NqbHqx/3gNvJBv4QbLnbVWGYd2C069U
         Iodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=7fHkG1LNKFI6ZaoR/XTtmRDk10vQcG8/p6FFTM8pY+o=;
        b=f4TlfsNZnPy4Jke1yvlex1TAK9DzHkgjWGXnsUM9wnzZP0mN429JKlRGnii9nXyrDT
         sZuQC5jK5Hn+6ltkj1tzGFSOfGyhttE+M16nwAwRuAtYHwZw6A74T7HtgW824W0Wygcp
         qF12Ihn+n/+04vFLKv6A66Sg01n0wZeAtmsKeM1z/86vYBbrbYJx3LFMWjICOg5/20Nk
         Piw7Pj8iJ692tRhGCX1NYPNuYqnfBxHqHIFEv2hT4My/kYbYwQbEfLRJT0rLObGJNnLD
         KMtMekiphXf+KXWmMNge24yuMpwcbHD8jOgN/7Mr7MTpOEG22NxJ0c+A749mesKow1DP
         wHww==
X-Gm-Message-State: ACgBeo2iF3VWCbt/Nq3nM3tPLSk9AniHrbSnXIk1ZHnpyn3NUTD4XZ2d
	FqBOg+mbGod+HRHcddYLRBRshGAsx0lUjg==
X-Google-Smtp-Source: 
 AA6agR73gBh+57IVpTCcZOluy3TJULn6javJouzpKV0ZkY/Rn84x0QYFN0B8NYEfsoY6ZtADdWXUwg==
X-Received: by 2002:a17:903:185:b0:172:fb7a:d9c7 with SMTP id
 z5-20020a170903018500b00172fb7ad9c7mr19968328plg.103.1661843656486;
        Tue, 30 Aug 2022 00:14:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 z24-20020aa79f98000000b00537f9e32b00sm6041616pfr.37.2022.08.30.00.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 00:14:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 02/21] ippool: Fix build with clang15
Date: Tue, 30 Aug 2022 00:13:54 -0700
Message-Id: <20220830071413.3887189-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830071413.3887189-1-raj.khem@gmail.com>
References: <20220830071413.3887189-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 07:14:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98539

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...x-type-casting-issues-between-in_add.patch | 72 +++++++++++++++++++
 ...r.c-Add-missing-prototype-for-ippool.patch | 22 ++++++
 .../recipes-daemons/ippool/ippool_1.3.bb      |  2 +
 3 files changed, 96 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/ippool/ippool/0001-pppd-ippool.c-Fix-type-casting-issues-between-in_add.patch
 create mode 100644 meta-networking/recipes-daemons/ippool/ippool/0002-ippool_rpc_server.c-Add-missing-prototype-for-ippool.patch

diff --git a/meta-networking/recipes-daemons/ippool/ippool/0001-pppd-ippool.c-Fix-type-casting-issues-between-in_add.patch b/meta-networking/recipes-daemons/ippool/ippool/0001-pppd-ippool.c-Fix-type-casting-issues-between-in_add.patch
new file mode 100644
index 0000000000..a98c179290
--- /dev/null
+++ b/meta-networking/recipes-daemons/ippool/ippool/0001-pppd-ippool.c-Fix-type-casting-issues-between-in_add.patch
@@ -0,0 +1,72 @@
+From da67444994bde603c7ff1483a6803bdab24e1f14 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 29 Aug 2022 09:36:55 -0700
+Subject: [PATCH 1/2] pppd/ippool.c: Fix type casting issues between in_addr
+ and ippool_api_ip_addr
+
+Also remove unused variabled
+
+Upstream-Status: Inappropriate [No upstream]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pppd/ippool.c | 13 ++++++-------
+ 1 file changed, 6 insertions(+), 7 deletions(-)
+
+--- a/pppd/ippool.c
++++ b/pppd/ippool.c
+@@ -16,6 +16,7 @@
+ #include <sys/ioctl.h>
+ #include <sys/socket.h>
+ #include <netinet/in.h>
++#include <arpa/inet.h>
+ #include <signal.h>
+ 
+ #include <linux/types.h>
+@@ -24,7 +25,6 @@
+ 
+ const char pppd_version[] = VERSION;
+ 
+-static int ippool_fd = -1;
+ static char *ippool_pool_name = NULL;
+ static char *ippool_pool_name2 = NULL;
+ static char *ippool_server = "localhost";
+@@ -64,9 +64,9 @@ static int ippool_addr_alloc(CLIENT *cl,
+ 	}
+ 
+ 	*addr = clnt_res.addr.s_addr;
+-
++	struct in_addr temp_addr = {*addr};
+ 	if (ippool_debug) {
+-		dbglog("Allocated address %s from pool %s", inet_ntoa(clnt_res.addr.s_addr), pool_name);
++		dbglog("Allocated address %s from pool %s", inet_ntoa(temp_addr), pool_name);
+ 	}
+ out:
+ 	return result;
+@@ -85,14 +85,16 @@ static void ippool_addr_free(CLIENT *cl,
+ 	}
+ 	if (clnt_res < 0) {
+ 		if (ippool_debug) {
++			struct in_addr temp_addr = {free_addr.s_addr};
+ 			warn("IP address %s free to pool %s failed: %s", 
+-			     inet_ntoa(free_addr), pool_name, strerror(-clnt_res));
++			     inet_ntoa(temp_addr), pool_name, strerror(-clnt_res));
+ 		}
+ 		goto out;
+ 	}
+ 
+ 	if (ippool_debug) {
+-		dbglog("Freed address %s to pool %s", inet_ntoa(free_addr), pool_name);
++		struct in_addr temp_addr = {free_addr.s_addr};
++		dbglog("Freed address %s to pool %s", inet_ntoa(temp_addr), pool_name);
+ 	}
+ out:
+ 	return;
+@@ -138,8 +140,6 @@ static void ippool_choose_ip(u_int32_t *
+ {
+ 	ipcp_options *wo = &ipcp_wantoptions[0];
+ 	ipcp_options *go = &ipcp_gotoptions[0];
+-	ipcp_options *ao = &ipcp_allowoptions[0];
+-	ipcp_options *ho = &ipcp_hisoptions[0];
+ 	CLIENT *cl;
+ 	int result = 0;
+ 
diff --git a/meta-networking/recipes-daemons/ippool/ippool/0002-ippool_rpc_server.c-Add-missing-prototype-for-ippool.patch b/meta-networking/recipes-daemons/ippool/ippool/0002-ippool_rpc_server.c-Add-missing-prototype-for-ippool.patch
new file mode 100644
index 0000000000..b8fdedf0c8
--- /dev/null
+++ b/meta-networking/recipes-daemons/ippool/ippool/0002-ippool_rpc_server.c-Add-missing-prototype-for-ippool.patch
@@ -0,0 +1,22 @@
+From f9ea91771f0d3c984e7d5fe9e15962db1ee686ad Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 29 Aug 2022 09:39:16 -0700
+Subject: [PATCH 2/2] ippool_rpc_server.c: Add missing prototype for
+ ippool_api_rpc_check_request
+
+Upstream-Status: Inappropriate [no upstream]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ippool_rpc_server.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+--- a/Makefile
++++ b/Makefile
+@@ -123,6 +123,7 @@ $(IPPOOL_RPC_STEM)_server.c:	$(IPPOOL_RP
+ 			-$(RM) $@ $@.tmp
+ 			rpcgen $(RPCGENFLAGS) -m -o $@.tmp $<
+ 			cat $@.tmp | sed -e 's/switch (rqstp->rq_proc) {/if (ippool_api_rpc_check_request(transp) < 0) return; switch (rqstp->rq_proc) {/' > $@
++			sed -i '20i int ippool_api_rpc_check_request(SVCXPRT *xprt);' $@
+ 
+ $(IPPOOL_RPC_STEM)_client.c:	$(IPPOOL_RPC_STEM).x
+ 			-$(RM) $@
diff --git a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
index b91ca53682..984acac76e 100644
--- a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
+++ b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
@@ -27,6 +27,8 @@ SRC_URI = "https://sourceforge.net/projects/openl2tp/files/${BPN}/${PV}/${BPN}-$
            file://0002-link-with-libtirpc.patch \
            file://0003-musl-fixes.patch \
            file://strncpy-truncation.patch \
+           file://0001-pppd-ippool.c-Fix-type-casting-issues-between-in_add.patch \
+           file://0002-ippool_rpc_server.c-Add-missing-prototype-for-ippool.patch \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4c59283b82fc2b166455e0fc23c71c6f"
-- 
2.37.2


