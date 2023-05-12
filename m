Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62534C77B7C
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 00:28:09 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.12925.1683851288406630293
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 May 2023 17:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=g9GftDbi;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-51b33c72686so6251902a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 17:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683851288; x=1686443288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cMkRDrQCKypd5jM/IjGT7oTfpyTEYf64b8aqeATzXcg=;
        b=g9GftDbiTpNVkW002RIoMmZyIOH+U5SeuuCkTX12NTxw9Bc564sgkDDUwYMv9fBZrR
         HLHVfulE26mC8XnHuOEpVbMCCDSm8D9gNkSrW/LQ5+d+gItYghJ43aivebBSiYYlia7a
         UlOeB56vTyCiYGHgKBLfd7+rOcSqRUoL543iArZwEwam1ijamZ7w3YsWgVzLYYQvsnWU
         7KqmmvxLCQ6A7x+qA6VFbXPZTuV9He47pHRJ75+bL5VqJtlokmqnQGVcm3DnTRat5Pul
         9vAJYDPK9rq/ar40ByggjLi819o8TQBM/Xjlwvk9A9PT2Or/3/B2IeBMTCQAUfaaPPj/
         HRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683851288; x=1686443288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cMkRDrQCKypd5jM/IjGT7oTfpyTEYf64b8aqeATzXcg=;
        b=c3bSiIu2q2WPQq6qMRb4lZI1EsERV8Yjiv6Jr46pqcJ5ihaYhlYBDEOZzyYG4ysWe3
         QukpPPTOmwe9J2DVkQYOM+Qg3pz49aiyQlZIzmV0KZ24JVBE12e0lDGE5q4qZ2gzbHXJ
         kzTqZrHvLSjdozEbAQLoemgd9ha3m2SlY3jdqyy5SluowwI6NxAPmqnr0WxKhFN/OJga
         O0zg95c054WUcqs/zE5uJocOMRNTXpvHlTfzGwCgKIVaKd2q/yv1fNVXA3RUDyra2aLH
         5G1Y1P4tQBVAt7TZLK/XRtqmLqPZMyltRzW/oZ5OiH1eEpiXX1H5YNebuU+GTOOZwLrH
         ZWDw==
X-Gm-Message-State: AC+VfDxtOTS5qjsPGVHpilQRXL7aNz88j3z9l31X/NKzaaqFxgUSpp7q
	R7TWfUEtAnV+i7iCIcLNSY8XAC9cL4ekTg==
X-Google-Smtp-Source: ACHHUZ42Jw4OiqXP9ycFbYjJ2LQJIZWO0BHErrB41H1wO7JQedxNx4tV+G7ZGUxXwuW+BTFHkuNfew==
X-Received: by 2002:a05:6a20:7d97:b0:100:cb5f:5b91 with SMTP id v23-20020a056a207d9700b00100cb5f5b91mr18523476pzj.25.1683851287412;
        Thu, 11 May 2023 17:28:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id n22-20020aa79056000000b0063d24fcc2b7sm5901341pfo.1.2023.05.11.17.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 17:28:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] ippool: Port to using ppp 2.5.x
Date: Thu, 11 May 2023 17:28:04 -0700
Message-Id: <20230512002804.3662492-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 May 2023 00:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102554

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-ippool-Port-to-ppp-2.5-APIs.patch    | 60 +++++++++++++++++++
 .../recipes-daemons/ippool/ippool_1.3.bb      |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/ippool/ippool/0001-ippool-Port-to-ppp-2.5-APIs.patch

diff --git a/meta-networking/recipes-daemons/ippool/ippool/0001-ippool-Port-to-ppp-2.5-APIs.patch b/meta-networking/recipes-daemons/ippool/ippool/0001-ippool-Port-to-ppp-2.5-APIs.patch
new file mode 100644
index 0000000000..59d7b1e847
--- /dev/null
+++ b/meta-networking/recipes-daemons/ippool/ippool/0001-ippool-Port-to-ppp-2.5-APIs.patch
@@ -0,0 +1,60 @@
+From e1b93db6a13d955c6bab6358a7fa27fecb59479f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 11 May 2023 17:24:46 -0700
+Subject: [PATCH] ippool: Port to ppp 2.5 APIs
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pppd/ippool.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/pppd/ippool.c b/pppd/ippool.c
+index 88cb901..d4b5c97 100644
+--- a/pppd/ippool.c
++++ b/pppd/ippool.c
+@@ -6,7 +6,7 @@
+ #include <stdlib.h>
+ #include <errno.h>
+ #include "pppd.h"
+-#include "pathnames.h"
++#include "options.h"
+ #include "fsm.h" /* Needed for lcp.h to include cleanly */
+ #include "lcp.h"
+ #include "ccp.h"
+@@ -23,7 +23,7 @@
+ 
+ #include "ippool_rpc.h"
+ 
+-const char pppd_version[] = VERSION;
++const char pppd_version[] = PPPD_VERSION;
+ 
+ static char *ippool_pool_name = NULL;
+ static char *ippool_pool_name2 = NULL;
+@@ -205,13 +205,13 @@ void plugin_init(void)
+ {
+ #if defined(__linux__)
+ 	extern int new_style_driver;	/* From sys-linux.c */
+-	if (!ppp_available() && !new_style_driver)
++	if (!ppp_check_kernel_support() && !new_style_driver)
+ 		fatal("Kernel doesn't support ppp_generic - "
+ 		    "needed for Ippool");
+ #else
+ 	fatal("No IP pool support on this OS");
+ #endif
+-	add_options(ippool_options);
++	ppp_add_options(ippool_options);
+ 
+ 	memset(&ippool_addr, 0, sizeof(ippool_addr));
+ 
+@@ -219,6 +219,6 @@ void plugin_init(void)
+ 	ip_down_hook = ippool_release_ip;
+ 
+ 	/* brute force, just in case ip_down_hook doesn't get called */
+-	add_notifier(&exitnotify, ippool_cleanup, 0);
++	ppp_add_notify(NF_EXIT, ippool_cleanup, 0);
+ }
+ 
+-- 
+2.40.1
+
diff --git a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
index 26b03814d6..f592912f9b 100644
--- a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
+++ b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://sourceforge.net/projects/openl2tp/files/${BPN}/${PV}/${BPN}-$
            file://0001-pppd-ippool.c-Fix-type-casting-issues-between-in_add.patch \
            file://0002-ippool_rpc_server.c-Add-missing-prototype-for-ippool.patch \
            file://0001-Use-unsigned-int-type-for-1-bit-integer-bitfield.patch \
+           file://0001-ippool-Port-to-ppp-2.5-APIs.patch \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4c59283b82fc2b166455e0fc23c71c6f"
-- 
2.40.1


