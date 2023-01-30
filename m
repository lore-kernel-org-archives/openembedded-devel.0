Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED93C636D3
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 05:09:25 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.34387.1675055359032261044
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 21:09:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EBYCltQo;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id z1so2860591plg.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 21:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKghWzo9InU6SNndoX5N2d0xDLnWqNcOcCr0GoKPFK0=;
        b=EBYCltQo3hl5pu94+Zi32/pGg2y1sn0PBjp/ccuSvZyZ+f3f0Tsow+Dmec7VOLdf/b
         esPu17DlItCoah/+olOz/raK9c+90yzR/lzbq2ndxVl42ixI9o/TVxfWs64cjUTWUEUB
         NH+IeGZMnoleDf1KTP0ZO6yH3r95k85Za2bTkOutkCp4IucpcXIWU7x1kW9zDEXnBdRe
         VEXgKCWhz6bP7gRMGSDpbvjrQxdksSGHtKlWWbmgLOKNrnabHYjJ0YXnQNfbp9UBbpEg
         e6i3gva2lW/u79dn1pVr2JzAXnL2ONiCMv32buKu3CAtfPuAXYckUc36g8F9qo4DIlBS
         vkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKghWzo9InU6SNndoX5N2d0xDLnWqNcOcCr0GoKPFK0=;
        b=YtyrDeyQvduRFGGxNVVJ7/OwwRd5fCSOJ+btNcsdoCLArUcvGOYOypYYGNfvMlgFEi
         3OLOSxH/Eb9wJwN40iM5HX53DxMdy9swgTTuyyUWSMkb8lWmbfBnqFQf7ANmFXsieBXE
         hP3MNTbSubAPsDGDTbCe7rCLD7/ndvmdrlr1BbmHePFCjbnTXKz6/G4aWxZnzORIxX3I
         Ud91M2nVLzZ4LLagwx2pDgdNs7XXJcoKXDkIo63KNdhPEuYfBFeJSANLgHDragFEVb/D
         0IWRXHuKaoLEuP20MTVvU5XQaGSw8zsSca7PQKeHPeIFB2ilGQbBFSNvu/LzKTwoQ1fX
         AxAw==
X-Gm-Message-State: AFqh2kqQPVpezp+DFPbto8W9Qevma2vW77YB7IEZ0sAwJwQ8Q5z5bYLB
	Rf2RZU7mW+knakWTRS8hbDAWX6IqQXUHZw==
X-Google-Smtp-Source: AMrXdXtp4qToKQnBEAYXo3E4PMn6TsJ1u0PnXzVLnOqqo3NgSRb3bKU3iYTtrYMPMBqBlYCPs/ri4g==
X-Received: by 2002:a17:902:a405:b0:194:8b10:3bcf with SMTP id p5-20020a170902a40500b001948b103bcfmr42444196plq.49.1675055358143;
        Sun, 29 Jan 2023 21:09:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id ju20-20020a170903429400b0019493c84880sm6671467plb.188.2023.01.29.21.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 21:09:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 08/12] mongodb: Fix build with gcc13
Date: Sun, 29 Jan 2023 21:09:05 -0800
Message-Id: <20230130050909.133727-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130050909.133727-1-raj.khem@gmail.com>
References: <20230130050909.133727-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 05:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100852

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-free_mon-Include-missing-cstdint.patch | 26 +++++++++++++++++++
 .../recipes-dbs/mongodb/mongodb_git.bb        |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch
new file mode 100644
index 0000000000..1373d1a794
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch
@@ -0,0 +1,26 @@
+From 5d8218b8a1b5bc71e2a0cf543a000e194daba599 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 29 Jan 2023 17:15:30 -0800
+Subject: [PATCH] free_mon: Include missing <cstdint>
+
+gcc 13 moved some includes around and as a result <cstdint> is no
+longer transitively included [1]. Explicitly include it
+for uintXX_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/mongo/db/free_mon/free_mon_options.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+--- a/src/mongo/db/free_mon/free_mon_options.h
++++ b/src/mongo/db/free_mon/free_mon_options.h
+@@ -29,6 +29,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ 
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 6e93ec9b0c..b4567d098a 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -33,6 +33,7 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0001-add-explict-static_cast-size_t-to-maxMemoryUsageByte.patch \
            file://0001-server-Adjust-the-cache-alignment-assumptions.patch \
            file://0001-The-std-lib-unary-binary_function-base-classes-are-d.patch \
+           file://0001-free_mon-Include-missing-cstdint.patch \
            "
 SRC_URI:append:libc-musl ="\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
-- 
2.39.1


