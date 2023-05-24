Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A46E1C77B7C
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:03 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.3571.1684914781873941301
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BIeYHoKi;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-510db954476so1232241a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 00:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914780; x=1687506780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cmY2MT+8R/ZcMZwHoXlFeb4EgwZ4sz6TOJM4mb7QkUQ=;
        b=BIeYHoKias5DHnYijzue6GzSJvx+yD97U6wjZkYZhJAPHOMvhePM5hFE+3Da6EAj3E
         y9rns0aIPiC7dAyN3288XCqzgdqlFxxLNoPynwC0ZC4+k/KKvVLcdZiWQ3UMyDn9N7JC
         OOCv1eQ47HXFfDUTMtMUA6TbilufIVAOYfGWdLLQFPwbuExr75UAvVBNGsyWeDUTEfhF
         maFqhUsmqIbG6ek6Z5b04w5SFRMkHQFOCABT8xP6kXP+bDNv6IZ3hySmFGAtp6CNNr7I
         +baxzJPn02WtdNHRng1l8rKFl9keyL84HP1r+Bp6Vpbh3Lvvn/6yuJBsCtf6qMCSpz+e
         OWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914780; x=1687506780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cmY2MT+8R/ZcMZwHoXlFeb4EgwZ4sz6TOJM4mb7QkUQ=;
        b=e5EzT63FAOfteyPdlO+6xxSXTO4fVgitfG+/MnO4aJRsinK/PfZCOHzYehJ29fvcFu
         T5cMkyPmkjUFPaEeYdAXCdhYJyZo6dw04BCYsQxsWu57vq/7HIynSvW67liQt2QMM/lg
         9ZjxPwXQp9SvQM9xnfYB/AHWVz7SjGPJ6O8OYdWVN7S538EBXEWC6BQ/EniY54hJ0G5S
         uit2E5GxRVHrStEhifaz9xCDwoJKwExYAOnWM5tUnUbrQlaYFVJfg55QbmNi04xNt3bQ
         WFqU7TRvIp2IYZhLzouRkP2TTF/cCjPNzdgiJnjv4EahEUQ8H2nFsC/SR7oi384KgpfR
         22Cw==
X-Gm-Message-State: AC+VfDyQdqcRkUa6+4Jv1SrifrX1YgZu/pU5ve/6o16MitJ3qc6ptCfo
	ewIx4qF9unHkhkVfWB3xO51+GZfUHh0=
X-Google-Smtp-Source: ACHHUZ69UrAiZLySsATaVhRwZQ4dcpeVbpTXHIB8AoJMmCVaXB8Z2PF5wgoWkRb8pVo8J/ntyBlxqw==
X-Received: by 2002:aa7:c553:0:b0:50b:d57c:2a7c with SMTP id s19-20020aa7c553000000b0050bd57c2a7cmr1228770edr.18.1684914780156;
        Wed, 24 May 2023 00:53:00 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id q5-20020aa7d445000000b00513f680d2a9sm2141915edr.28.2023.05.24.00.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:52:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 01/20] libsquish: remove unused 0001-makefile-Add-LIBDIR.patch
Date: Wed, 24 May 2023 09:52:34 +0200
Message-Id: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 07:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102755

* it was added to meta-multimedia, but not to SRC_URI in:
  https://git.openembedded.org/meta-openembedded/commit/?id=1c23fd7f8b58636983fd0b233c2043e34d3bc3b3

* and later diferent patch was added to the layer as well as SRC_URI in:
  https://git.openembedded.org/meta-openembedded/commit/?id=8df60dc8d69ffa506fd923f8db91a2a8aa33343f

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libsquish/0001-makefile-Add-LIBDIR.patch  | 36 -------------------
 1 file changed, 36 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/libsquish/libsquish/0001-makefile-Add-LIBDIR.patch

diff --git a/meta-multimedia/recipes-multimedia/libsquish/libsquish/0001-makefile-Add-LIBDIR.patch b/meta-multimedia/recipes-multimedia/libsquish/libsquish/0001-makefile-Add-LIBDIR.patch
deleted file mode 100644
index c6eb7ac576..0000000000
--- a/meta-multimedia/recipes-multimedia/libsquish/libsquish/0001-makefile-Add-LIBDIR.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 4fd08c0446ca02917014b63f9080c4205958a130 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 20 Mar 2022 01:15:32 -0700
-Subject: [PATCH] makefile: Add LIBDIR
-
-Avoid hardcoding /lib
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 1c01f89..2b1df5b 100644
---- a/Makefile
-+++ b/Makefile
-@@ -11,12 +11,12 @@ all : $(LIB) squish.pc
- 
- install : $(LIB) squish.pc
- 	install squish.h $(INSTALL_DIR)/include 
--	install libsquish.a $(INSTALL_DIR)/lib
--	install squish.pc $(INSTALL_DIR)/lib/pkgconfig
-+	install libsquish.a $(INSTALL_DIR)/$(LIBDIR)
-+	install squish.pc $(INSTALL_DIR)/$(LIBDIR)/pkgconfig
- 
- uninstall:
- 	$(RM) $(INSTALL_DIR)/include/squish.h
--	$(RM) $(INSTALL_DIR)/lib/libsquish.a
-+	$(RM) $(INSTALL_DIR)/$(LIBDIR)/libsquish.a
- 
- $(LIB) : $(OBJ)
- 	$(AR) cr $@ $?
--- 
-2.35.1
-
-- 
2.40.1


