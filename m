Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66525D5E143
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 11:58:45 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20585.1765886320757811680
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 03:58:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RIMDssRG;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso29025125e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 03:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765886319; x=1766491119; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XSycUAaubZ5Dtox2yYUNuZOhVmMrK2MlmSb1bAZLIqU=;
        b=RIMDssRGxUmkySXIqhozbOiROr7m6Ue72o7pzAAibJjVK/Cg8HjR5U/jNHrxpA9YfI
         +erJY25rnx3juIlLmJ2HitUnXTz956hSrnEpzJBXhZsZfBBLG0tqINv9lbc+gV8AIKkP
         9x5Rxgn+MWeAQWcwkJzMtC2isxHKTOQykZE9pZC0fkDV0wyYtUgZ64BczMl6MtpFcJlu
         vng8AChSEPKiMTRS6q0PDcSir/ecofb6sZTOSIYwxJzePKrgOhkBQvNFI3ehOSh+Srop
         25D/3MejcxmmEspqpLJWwV0WjM6HHxMbl0ojrfEMuxBnncEt5aE7LDElGfNV8TxNAKS/
         abLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765886319; x=1766491119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XSycUAaubZ5Dtox2yYUNuZOhVmMrK2MlmSb1bAZLIqU=;
        b=btoAOqrQWqFkZFTHbJGlttrfpIouRblZgLsZ7uMll7d1SZKEJ4srPEe6NYJboqeVXg
         KGf7LkVQNbMBucXj3nGeYFuR+WX0wEsbBwYuek3ksBZEc9fbRd+TlIY8hsgULsnfV3gv
         c+Z0TYPVvwPVRLr6mKODtPXWhS1oT2QeYitSmcqnXv4dhgx/lEYvmDBmLzSVDODpties
         X3XDvNYkRjN+7hqEFHeGYoaEkE6bS9gejDf8+olN/bVmnKtvBHjgMskR6zXBjAIG0Zzk
         nlin6+BdpVQpjekV8qNZQs1t/ut/McCD03YFSfWrHFvgWheoMVXFzJ8+IsSIu9xGjTP2
         Zhuw==
X-Gm-Message-State: AOJu0YzbJsPJiJ48+tg9UCOMug7KbAe/XagJsI77pjLvb8kgLn/+3Mjr
	61pFo0HjVOsJM6w1rbJUaVxspfvnv3yemwcKFbCOC7o7kITN+8HY2FDTNxnxQA==
X-Gm-Gg: AY/fxX7XzMTt7RCllWUT36lS5lvciE/jwKuTTdz9krwymhomG3PYUi/zupuam7INztk
	MXs6eRzgRvAW1GG13M4CNiEDexD+bnTGAL49ouRmeuT/tbU2yY+yK4sXUpTZjG56oiuTDs6DsL1
	KIoP3oqJANccck4BsTHufSVCjDyNKpjukZfTi1fstPg2qurpr9DElHY3Ulj7fqAGWZlBXsb1GJq
	e9exK07f09uzZ4KBcZ+XUrEk6+b9CxRSQ6IPeoK4Tqkrv413P8+BZTQfZObkK2qskv1Phyl48e4
	fl+9QGwEUwLr+p0PvWGlORepk1/wfZVVfTeIEYmMRa9fzEEEM1syQDgZ9rznH1LixgnTK84eqHV
	ga+StEKN5KtKfxBzGWHDBK71PoppvhcmK9hyxC5gxi4zVO5PkTxhkycVmMelkzcm1zfFnr0JATW
	yye5RcXCnW
X-Google-Smtp-Source: AGHT+IGPCH5zZ+6nUCiyzHL3Pe2f7t3XGaPMH9rXLYrd+wA28sIge7AndN9PoUoPALMsvPJTqbx9Dw==
X-Received: by 2002:a05:600c:3b07:b0:477:8a2a:123e with SMTP id 5b1f17b1804b1-47a8f916502mr160684025e9.33.1765886318761;
        Tue, 16 Dec 2025 03:58:38 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4b1347sm261010495e9.8.2025.12.16.03.58.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 03:58:38 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] unbound: upgrade 1.22.0 -> 1.24.2
Date: Tue, 16 Dec 2025 12:58:36 +0100
Message-ID: <20251216115837.1669852-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 11:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122694

Contains fixes for CVE-2025-11411 and CVE-2025-5994.

Drop patch that was incorporated in this release.

Changelogs:
https://github.com/NLnetLabs/unbound/releases/tag/release-1.24.2
https://github.com/NLnetLabs/unbound/releases/tag/release-1.24.1
https://github.com/NLnetLabs/unbound/releases/tag/release-1.24.0
https://github.com/NLnetLabs/unbound/releases/tag/release-1.23.1
https://github.com/NLnetLabs/unbound/releases/tag/release-1.23.0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...cc-15-Wbuiltin-declaration-mismatch-.patch | 44 -------------------
 .../{unbound_1.22.0.bb => unbound_1.24.2.bb}  | 10 +----
 2 files changed, 2 insertions(+), 52 deletions(-)
 delete mode 100644 meta-networking/recipes-support/unbound/unbound/0001-fix-build-with-gcc-15-Wbuiltin-declaration-mismatch-.patch
 rename meta-networking/recipes-support/unbound/{unbound_1.22.0.bb => unbound_1.24.2.bb} (84%)

diff --git a/meta-networking/recipes-support/unbound/unbound/0001-fix-build-with-gcc-15-Wbuiltin-declaration-mismatch-.patch b/meta-networking/recipes-support/unbound/unbound/0001-fix-build-with-gcc-15-Wbuiltin-declaration-mismatch-.patch
deleted file mode 100644
index 70a41f7e37..0000000000
--- a/meta-networking/recipes-support/unbound/unbound/0001-fix-build-with-gcc-15-Wbuiltin-declaration-mismatch-.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 1c58ce07919c36e6a11eead67bd6d14cc22acaec Mon Sep 17 00:00:00 2001
-From: "mark.yang" <mark.yang@lge.com>
-Date: Wed, 2 Apr 2025 15:25:42 +0900
-Subject: [PATCH] fix build with gcc-15 -Wbuiltin-declaration-mismatch error
-
-See more details: http://errors.yoctoproject.org/Errors/Details/850313
-../git/compat/malloc.c:9:7: warning: conflicting types for built-in function 'malloc'; expected 'void *(long unsigned int)' [-Wbuiltin-declaration-mismatch]
-    9 | void *malloc ();
-      |       ^~~~~~
-../git/compat/malloc.c:5:1: note: 'malloc' is declared in header '<stdlib.h>'
-    4 | #include "config.h"
-  +++ |+#include <stdlib.h>
-    5 | #undef malloc
-../git/compat/malloc.c: In function 'rpl_malloc_unbound':
-../git/compat/malloc.c:23:10: error: too many arguments to function 'malloc'; expected 0, have 1
-   23 |   return malloc (n);
-      |          ^~~~~~  ~
-../git/compat/malloc.c:9:7: note: declared here
-    9 | void *malloc ();
-      |       ^~~~~~
-
-* Seeing that there is '#undef malloc', it appears they don't want to
-  use the malloc from stdlib.h.
-  Therefore, we need to correctly define the parameters for malloc.
-
-Upstream-Status: Submitted [https://github.com/NLnetLabs/unbound/pull/1262]
-Signed-off-by: mark.yang <mark.yang@lge.com>
----
- compat/malloc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/compat/malloc.c b/compat/malloc.c
-index d8097b13e..af9dcf134 100644
---- a/compat/malloc.c
-+++ b/compat/malloc.c
-@@ -6,7 +6,7 @@
- #include <sys/types.h>
- 
- #ifndef USE_WINSOCK
--void *malloc ();
-+void *malloc (size_t n);
- #else
- /* provide a prototype */
- void *malloc (size_t n);
diff --git a/meta-networking/recipes-support/unbound/unbound_1.22.0.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
similarity index 84%
rename from meta-networking/recipes-support/unbound/unbound_1.22.0.bb
rename to meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index c35148b77e..4ae8db4d08 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.22.0.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -9,17 +9,11 @@ SECTION = "net"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 
-SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;tag=release-${PV} \
            file://run-ptest \
-           file://0001-fix-build-with-gcc-15-Wbuiltin-declaration-mismatch-.patch \
            "
 
-# 17 commits after 1.22.0 tag:
-# https://github.com/NLnetLabs/unbound/compare/release-1.22.0...7985d17b57d25be262de56c29a43ae4b61c1b896
-# to include fix for occasional build failure:
-# https://github.com/NLnetLabs/unbound/commit/46cfbf313d812a6e50614a691e162b171dc91d7b
-PV .= "+git"
-SRCREV = "7985d17b57d25be262de56c29a43ae4b61c1b896"
+SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"
 
 inherit autotools pkgconfig systemd update-rc.d ptest
 

