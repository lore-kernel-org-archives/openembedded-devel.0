Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B610BC433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 18:17:24 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web08.9502.1636136243337869354
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 11:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A7kyDTns;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id s136so9036541pgs.4
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 11:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pAs24K7faY9+quj5XDUGSEOvR4rCSRSA0qD27Khen0s=;
        b=A7kyDTnspOYKQgJm0FoEStsWpoM45YJeKO8/rSLOAeO8pVGRUZRsrKcZVxfePlL/ep
         KZiTfcRva50i+W9HlI3sCQNHOpvoNgXvDvH75C8wSFZxTlj+DrL1wpXpScJz0MIuHMGx
         VyLFQeDiv7ktHb82mxu+KdVjYr56pU8HHaBbM2l3t9q/K320DWj7PPRAEY8hj3aiGsu8
         t3f1b+4HRn7LZEuiOuTm2hCdxUyMXM1BYnJJZo3QegYu3FqTGo9s8NaCBwjpj5+iZ7do
         Fc/Wdk8ljWsqKtzMBVtO7h5j3cPqYY1symkrBxNuU1TZhgNDLEjfbh3FUCYUBjbIr5fl
         LzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pAs24K7faY9+quj5XDUGSEOvR4rCSRSA0qD27Khen0s=;
        b=Bu6GynOWn21+PJU9mk4y8Fu8WMMVZHQsuA6vph04OpzL3HFtr7U3XRpqbE4+uPE6ql
         7BkfhuMJd3iEDTWsDHr2PH1oJjrexx2d3yM0PXQxr82Uc1/WMDsKZiVQYdXbNjlbenRv
         K1ar/T/Sw+wXFwxh2x5sMwDzs1wWJccjGopgEtWbsSm8G2UGkPwnsuyOgKz4z5oAqubs
         kYSc1Er2GLYdoKdg2fIp64EcY7ay8d+cSp33kLhSLHxUloUikydJH0ahH6y2GldCL3DQ
         Nysnfuz5isQDOE/If36/e+aRlaps/PooVLsU9/91eEcXTgOwM1WZJl8J+6uRjDHaH5f5
         WHFQ==
X-Gm-Message-State: AOAM533gw4i1ptYsmDqODFbGFYvssQ5Nil7C19yjdZGL4mgXVV3xlqel
	R055km2v0xzkzqk77Y0FuQJFhL3yEGc=
X-Google-Smtp-Source: 
 ABdhPJxJN5HkO6o8BXYC0BXE8h0s28dPtd1lX4McAhRl18y0pkBHmU76w7qjUDjXoDs61omkIR6m3Q==
X-Received: by 2002:a63:fc47:: with SMTP id r7mr1653057pgk.149.1636136242447;
        Fri, 05 Nov 2021 11:17:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 b7sm8211219pfm.28.2021.11.05.11.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 11:17:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-oe][PATCH] sdbus-c++-libsystemd: Fix build with kernel 5.15+
Date: Fri,  5 Nov 2021 11:17:20 -0700
Message-Id: <20211105181720.1744827-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Nov 2021 18:17:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93847

Backport a patch from upstream systemd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...-linux-Sync-if_arp.h-with-Linux-5.14.patch | 29 +++++++++++++++++++
 .../sdbus-c++/sdbus-c++-libsystemd_243.bb     |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/0001-basic-linux-Sync-if_arp.h-with-Linux-5.14.patch

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/0001-basic-linux-Sync-if_arp.h-with-Linux-5.14.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/0001-basic-linux-Sync-if_arp.h-with-Linux-5.14.patch
new file mode 100644
index 0000000000..a251e3e6c2
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/0001-basic-linux-Sync-if_arp.h-with-Linux-5.14.patch
@@ -0,0 +1,29 @@
+From 4411a9a3ebff98b6fcf5967c75faa458d219df96 Mon Sep 17 00:00:00 2001
+From: Chris Packham <chris.packham@alliedtelesis.co.nz>
+Date: Fri, 10 Sep 2021 09:51:36 +1200
+Subject: [PATCH] basic/linux: Sync if_arp.h with Linux 5.14
+
+ARPHRD_MCTP was added in 5.14. Sync if_arp.h to pick up the definition
+
+Fixes #20694
+Upstream-Status: Backport [https://github.com/cpackham-atlnz/systemd/commit/67cd626399b0d02882ee00716c8bd31ba764c862]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/basic/linux/if_arp.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/basic/linux/if_arp.h b/src/basic/linux/if_arp.h
+index c3cc5a9e5e..4783af9fe5 100644
+--- a/src/basic/linux/if_arp.h
++++ b/src/basic/linux/if_arp.h
+@@ -54,6 +54,7 @@
+ #define ARPHRD_X25	271		/* CCITT X.25			*/
+ #define ARPHRD_HWX25	272		/* Boards with X.25 in firmware	*/
+ #define ARPHRD_CAN	280		/* Controller Area Network      */
++#define ARPHRD_MCTP	290
+ #define ARPHRD_PPP	512
+ #define ARPHRD_CISCO	513		/* Cisco HDLC	 		*/
+ #define ARPHRD_HDLC	ARPHRD_CISCO
+-- 
+2.33.1
+
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
index a81b57526d..d50681d77b 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
@@ -15,6 +15,7 @@ SRCBRANCH = "v243-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
            file://static-libsystemd-pkgconfig.patch \
            file://7c5fd25119a495009ea62f79e5daec34cc464628.patch \
+           file://0001-basic-linux-Sync-if_arp.h-with-Linux-5.14.patch \
            "
 
 # patches needed by musl
-- 
2.33.1


