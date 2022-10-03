Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40D3C4332F
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 17:06:41 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web12.137.1664816795737409590
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 10:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RFht3voa;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id b2so23571300eja.6
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 10:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=jqbH5kgTqeOK6uVZY1VnXfGIN7mgwOa7H9QXvjeV7QM=;
        b=RFht3voa7+K7p39BEX0tCMS8JXtScw/mg0Hpr176Y/lzOuRTIR4Hqu5SgrCKU0PTih
         4T0fS84Q4glBJBCksYbuIv4Ij5yaOPYg7IlzaDrf6iL+F4T/dCBhCG8Cv8lEDTSx0qyD
         3bzYOe3CKhQfnHtBrf8SB6Yj47+Hp3B2jInd5tSQqz0z1YVH5ginCb/f5KoYAJyBWdn9
         dWTLux4fLnSFNJEpUme7eLSxT07iif2vPB7SydKEA207hmbFFyM8+S/W/3TEW35OTT/H
         GJjC0q87PpqAPiGuGSdXxpo39ZOHP91pEO7nFNZvu0/2OOIgXRMYZAd+L2oI6pVDjTBd
         h9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=jqbH5kgTqeOK6uVZY1VnXfGIN7mgwOa7H9QXvjeV7QM=;
        b=dy5sQLc//xJiKfJrDU/NKgf2lRwHafQA8bCmRyNEni3C09RmuZMkaqEfaIrRnykTLc
         LG4YjiAKdSJPFukd2dBDfKpR9bKo28VEjWVsQzoBRC7Ds46nJJ7RXWPOhRgxLh9FZ3um
         aM5dGtqDCycGOHfcXcYOFEAZrf4aQA2CZLqSLLN7kpZggl09u1HMfYpq+C+j6iFkHiv/
         7rDszCJyZO5Ms1mb3Zk259kmI+VWbLb9i1LKVz+9cNlB7eN2shkWxivzkUSk0kGIezBs
         8B/+oUg0qHGI72lOHX143OuZzfIj4AQH4z/stcKetg2CAsUemAExZU9Zuq0VYvkUDrkT
         fY3A==
X-Gm-Message-State: ACrzQf3LcuU1ZYQcQO7g0bOtAA/Zl4iJfTuWvvLAWpz7oYl+562YFzO1
	OH+bk6Xz5+i7w4u+xXbA/SAjmp9Pqk4=
X-Google-Smtp-Source: 
 AMsMyM5SJG3A/eM/Ryzqppd6xnJiS3dVkxmqUWlFlZQLP/3CHeuHvEiaqnHgSIi+H1rL6gppaLplHw==
X-Received: by 2002:a17:906:6a1a:b0:78c:fa9c:e621 with SMTP id
 qw26-20020a1709066a1a00b0078cfa9ce621mr1128339ejc.160.1664816793859;
        Mon, 03 Oct 2022 10:06:33 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 v1-20020a056402174100b004589ac5d0c9sm6342329edx.45.2022.10.03.10.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 10:06:33 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH 2/3] jansson: Backport linker flag fixes
Date: Mon,  3 Oct 2022 18:06:22 +0100
Message-Id: <20221003170623.26207-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221003170623.26207-1-alex.kiernan@gmail.com>
References: <20221003170623.26207-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Oct 2022 17:06:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99041

Fix overwriting linker flags.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../0001-Fix-overwriting-linker-flags.patch   | 29 +++++++++++++++++++
 .../recipes-extended/jansson/jansson_2.14.bb  |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-extended/jansson/jansson/0001-Fix-overwriting-linker-flags.patch

diff --git a/meta-oe/recipes-extended/jansson/jansson/0001-Fix-overwriting-linker-flags.patch b/meta-oe/recipes-extended/jansson/jansson/0001-Fix-overwriting-linker-flags.patch
new file mode 100644
index 000000000000..5eee6f85aada
--- /dev/null
+++ b/meta-oe/recipes-extended/jansson/jansson/0001-Fix-overwriting-linker-flags.patch
@@ -0,0 +1,29 @@
+From fe6e8eec7e7df4f1e72f0c9d9337b1fe11236687 Mon Sep 17 00:00:00 2001
+From: Thomas Heinrichs <46387399+Thomas1664@users.noreply.github.com>
+Date: Thu, 28 Apr 2022 17:36:54 +0200
+Subject: [PATCH] Fix overwriting linker flags
+
+Upstream-Status: Backport
+[https://github.com/akheron/jansson/commit/fe6e8eec7e7df4f1e72f0c9d9337b1fe11236687]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 39b9ad365f78..ed33e3c47f70 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -342,7 +342,7 @@ if(JANSSON_BUILD_SHARED_LIBS)
+    )
+       list(REMOVE_ITEM CMAKE_REQUIRED_LIBRARIES "-Wl,--version-script,${CMAKE_CURRENT_BINARY_DIR}/jansson.sym")
+       if (VSCRIPT_WORKS)
+-         set(CMAKE_SHARED_LINKER_FLAGS "-Wl,--version-script,${CMAKE_CURRENT_BINARY_DIR}/jansson.sym")
++         set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,--version-script,${CMAKE_CURRENT_BINARY_DIR}/jansson.sym")
+       endif()
+    endif()
+ 
+-- 
+2.35.1
+
diff --git a/meta-oe/recipes-extended/jansson/jansson_2.14.bb b/meta-oe/recipes-extended/jansson/jansson_2.14.bb
index 68e24c890726..39663d1218da 100644
--- a/meta-oe/recipes-extended/jansson/jansson_2.14.bb
+++ b/meta-oe/recipes-extended/jansson/jansson_2.14.bb
@@ -5,6 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=afd92c4cfc08f4896003251b878cc0bf"
 
 SRC_URI = "https://github.com/akheron/${BPN}/releases/download/v${PV}/${BP}.tar.bz2 \
+           file://0001-Fix-overwriting-linker-flags.patch \
            file://0001-Honour-multilib-paths.patch \
            "
 SRC_URI[sha256sum] = "fba956f27c6ae56ce6dfd52fbf9d20254aad42821f74fa52f83957625294afb9"
-- 
2.35.1


