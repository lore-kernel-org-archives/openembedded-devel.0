Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9D0C7EE2C
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:23 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.3708.1684914796120340886
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=nJe2TN72;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-510d8d7f8eeso1570215a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 00:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914794; x=1687506794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qt/5gyoPi14eD88HF0Y0TNApevjvbP4A79VveBv4inQ=;
        b=nJe2TN72bye2bnGNYQEzn9jJ+m7QstXZdiri4Hnj7T8p4OalvTUBNh1Bkx40PIgjII
         UTavFOxjPZc8WVW7DT07ngNKCcD0RVAPvj/U8VkrYF7t1pZJKNw1LnEhC00R2MvUw5tG
         VymyD8L6/KlSVOdNrIR+YTju42eRILZ8gNu3zQxu+ha/POpW3pNVrFvzBHF0vVvI7QBz
         y50AbGNVTDFyVoaTTATCHZIfsou3pjkaw8GVqnIIonqSzPnJcz2lz5ZoEx9LMPMtr9nS
         zBffy5rgCIWUzqClFB1ZsK7WJVEeIZ4+Mlk9cTu7uIjz/5eSxRmxjYYVSRebP52anmim
         GwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914794; x=1687506794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qt/5gyoPi14eD88HF0Y0TNApevjvbP4A79VveBv4inQ=;
        b=WlYjpq4rU7Of+MFyUw2nSORchWn9r5NkgSNP3x2HTJXojlkDKAXvlNpm2Kwa8wdfXr
         R6ZW4aVTQDtMCT+8GgN1XehsNgp8b6THGPOuXfWTKC2fy4bjKfJFzEVOU/BeKCBWpg+S
         ga8Pv7yMtpUqB16QfhDpneYbQV7eiRuTzJHtTmyIovFjDJU0VvUA0qffzu/Qut28fyOg
         JlaJaCQytVMUTxuCSX5TDGZdvK7UK+tedO+UjpPiDKsPUZr5gWAR6AJfE99NbkOQl/i4
         uDMyCHa8FqZQUo8Idmr8+sKN+geNdQj+JAKxzRX2F4Cu2ZSzy0WLy3HOEeEKbaSAROPM
         oQWA==
X-Gm-Message-State: AC+VfDyhawdXVW1cPQhGIsCMvI3P/lpH365mx/7mD/D8oMHXF6tzRKej
	b0YLbDlYK1bu0Nxv7Ec6M0sHWfK2bC4=
X-Google-Smtp-Source: ACHHUZ6We9jf3ZZCdeh0Nk6B/LSkpBe7LYjadFfzVA31HrUF8aT5skHn8wqj0aejGy4HCuohpVQ6dw==
X-Received: by 2002:aa7:c252:0:b0:510:6217:9994 with SMTP id y18-20020aa7c252000000b0051062179994mr1131720edo.39.1684914794592;
        Wed, 24 May 2023 00:53:14 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g24-20020a50d0d8000000b0050cc4461fc5sm5018696edf.92.2023.05.24.00.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 19/20] fbida: remove unused use-jpeg-turbo.patch
Date: Wed, 24 May 2023 09:52:52 +0200
Message-Id: <20230524075253.1033593-19-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
References: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 07:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102773

* it was removed from SRC_URI in:
  https://git.openembedded.org/meta-openembedded/commit/?id=c93035a0fe085aab6d3d674ce2cb1da3f03e76fd

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../fbida/files/use-jpeg-turbo.patch                | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/fbida/files/use-jpeg-turbo.patch

diff --git a/meta-oe/recipes-graphics/fbida/files/use-jpeg-turbo.patch b/meta-oe/recipes-graphics/fbida/files/use-jpeg-turbo.patch
deleted file mode 100644
index 99639554c2..0000000000
--- a/meta-oe/recipes-graphics/fbida/files/use-jpeg-turbo.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: fbida-2.10/GNUmakefile
-===================================================================
---- fbida-2.10.orig/GNUmakefile
-+++ fbida-2.10/GNUmakefile
-@@ -51,7 +51,7 @@ HAVE_LIBSANE	:= $(call ac_lib,sane_init,
- HAVE_LIBCURL	:= $(call ac_lib,curl_easy_init,curl)
- HAVE_LIBLIRC	:= $(call ac_lib,lirc_init,lirc_client)
- HAVE_MOTIF	:= $(call ac_lib,XmStringGenerate,Xm,-L/usr/X11R6/$(LIB) -lXpm -lXt -lXext -lX11)
--JPEG_VER        := $(call ac_jpeg_ver)
-+JPEG_VER        := 62
- endef
- 
- # transposing
-- 
2.40.1


