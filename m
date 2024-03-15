Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C17DFC54E67
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 18:52:18 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.1274.1710528730105916183
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Mar 2024 11:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VJ0I7e+u;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d944e8f367so19167885ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 11:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710528729; x=1711133529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfARUWO5Ntor6uHndembmdJMlH6cVM7oNYNOx1zOXIE=;
        b=VJ0I7e+uGSwUTPo6IC//6emSaSzReVFmWVDH0OhYrPWqIpICIh9RN6+omWKyfFUVub
         /yVzjsG0OVlwM5xuGdMT6bIc7m0kqfR4Emb9hOvEgNdAAf94ACpK+Jvr+3oFp8p04cJe
         if4ngM7Pt6ETeVpsaRtg4HvhsJ1ttHywZp/Awry/LvaGtIyWTMRwqdm9edn96W0cQtSO
         P3TmM1NWTKJPCn2FLo5fkm/MGj2lzMzk2bLA6IVI3K6/qOsmmtryMQxjSuw/WgOZeLQu
         ODiIqKKWx3ke56EbPZjng5zjsh9Z+FuuE1p8gZnF68GWQ4ww4kPxXBSu9bzthD6K5Wq4
         9LYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710528729; x=1711133529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hfARUWO5Ntor6uHndembmdJMlH6cVM7oNYNOx1zOXIE=;
        b=P6kStGcfq0L/9ADMFKcAxAxSCAqj5r+h49CMEQ5F4dCjC0r3v1v4oS4ZDzpCXFtGTB
         DRNwF8p+KTT2mvWibJ3jfFspNksmJzRCw6rgCjFfNXypOv1IHeXMKbTTCIly8UTMI3Dp
         luNI+tWdCaGlegrVwzi6srbnTD7Qy2VpIl5FlydlIMBMmm+D1130utGJyuhTb57YylPq
         FkZuGLMtDBI4tm6Q+fPxf+DvVbhpYrilZrveNfj7j1yjKJPaPsAUwHYqkiL9o7ZXOcyU
         d/U+Mph9x+o1QcsgdJmgjMeUHlrRouZqYATITKWDgS2dSfv98ZQRcnzCK545xOMycwTc
         eCOA==
X-Gm-Message-State: AOJu0YxsqOt+UN6VHwxCbJ8Wx6MNhG43UsUVhjCkRG+XExQHtzS3JasY
	Yyb56Cs7v1n3PYLBbjok5F0WeLzoIcEroa6Muds9zFYAESuk0yGd0SyFWGr2
X-Google-Smtp-Source: AGHT+IHSj+7h9tlW5n6oNP1Cg4mgk+9a8pQyERo9mpPKV9pWtGSnElGAZJOnptIrVZBE7RcHJ6q02w==
X-Received: by 2002:a17:902:fc4c:b0:1de:ddc6:27a4 with SMTP id me12-20020a170902fc4c00b001deddc627a4mr6589533plb.0.1710528729160;
        Fri, 15 Mar 2024 11:52:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c6db])
        by smtp.gmail.com with ESMTPSA id o6-20020a170902d4c600b001dbcfb4766csm4202158plg.226.2024.03.15.11.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 11:52:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] frr: Upgrade to latest on 9.1 stable
Date: Fri, 15 Mar 2024 11:52:00 -0700
Message-ID: <20240315185200.3967095-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315185200.3967095-1-raj.khem@gmail.com>
References: <20240315185200.3967095-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 18:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109346

Fix build with latest musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...me-API-for-non-glibc-library-e.g.-mu.patch | 35 +++++++++++++++++++
 .../recipes-protocols/frr/frr_9.1.bb          |  3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/0001-Mimic-GNU-basename-API-for-non-glibc-library-e.g.-mu.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/0001-Mimic-GNU-basename-API-for-non-glibc-library-e.g.-mu.patch b/meta-networking/recipes-protocols/frr/frr/0001-Mimic-GNU-basename-API-for-non-glibc-library-e.g.-mu.patch
new file mode 100644
index 0000000000..215d6b4137
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/0001-Mimic-GNU-basename-API-for-non-glibc-library-e.g.-mu.patch
@@ -0,0 +1,35 @@
+From 73c21bafc7065f0ab1d40fee2c6ce0c140d1b859 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 15 Mar 2024 11:31:02 -0700
+Subject: [PATCH] Mimic GNU basename() API for non-glibc library e.g. musl
+
+musl only provides POSIX version of basename and it has also removed
+providing it via string.h header [1] which now results in compile errors
+with newer compilers e.g. clang-18
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Submitted [https://github.com/FRRouting/frr/pull/15561]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/zebra.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/zebra.h b/lib/zebra.h
+index 15a54f6cdf..cc40b48339 100644
+--- a/lib/zebra.h
++++ b/lib/zebra.h
+@@ -226,6 +226,10 @@ struct in_pktinfo {
+ 
+ #define strmatch(a,b) (!strcmp((a), (b)))
+ 
++#if !defined(__GLIBC__)
++#define basename(src) (strrchr(src,'/') ? strrchr(src,'/')+1 : src)
++#endif
++
+ #if BYTE_ORDER == LITTLE_ENDIAN
+ #define htonll(x) (((uint64_t)htonl((x)&0xFFFFFFFF) << 32) | htonl((x) >> 32))
+ #define ntohll(x) (((uint64_t)ntohl((x)&0xFFFFFFFF) << 32) | ntohl((x) >> 32))
+-- 
+2.44.0
+
diff --git a/meta-networking/recipes-protocols/frr/frr_9.1.bb b/meta-networking/recipes-protocols/frr/frr_9.1.bb
index 8ea917afaa..4510c27060 100644
--- a/meta-networking/recipes-protocols/frr/frr_9.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_9.1.bb
@@ -12,9 +12,10 @@ LIC_FILES_CHKSUM = "file://doc/licenses/GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a
 
 SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/9.1 \
            file://frr.pam \
+           file://0001-Mimic-GNU-basename-API-for-non-glibc-library-e.g.-mu.patch \
            "
 
-SRCREV = "312faf8008bb4f3b9e84b8e2758cd2cbdf5742b5"
+SRCREV = "ca2d6f0f1e000951224a18973cc1827f7f5215b5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"
 
-- 
2.44.0


