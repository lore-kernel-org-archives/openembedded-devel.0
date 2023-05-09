Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD68CC7EE30
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 07:07:10 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.25848.1683616025088771289
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 00:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PQy8eVcs;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f19afc4f60so35743745e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 00:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683616023; x=1686208023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHO65dUebySbJGGVKSP2ByuOSoq9b8tMZkMCE9rax1E=;
        b=PQy8eVcs+XIECKWbjre+3+Oh6dTiqLiBTvkXCFfOgpIKsiOmJS0UyGrFIpTjr7huft
         uUfmaEssN5yx7toN8kd9i31pgNHXxIuM8xuFZ1CKVh1W2g2st+tYgIkaFV0alnRH8xN+
         b+CU2hybNDUmWU7wHcypf4zVJ1lOHnPKJLHicXD/1mOBfTvh1QOzR2Z6TTHBN0eUF0fe
         mro6iL7IbXaVIlemUT0sgcwzCSc8cERSvRcl6TwwN3R8yLlb5BzgyS2eHjr5NhLcQN9u
         IIDNgwbVaM4SFaYtpFBd6fLzx5NlWDGN2tu9l8bIVGLQSIlbC+WXtgl54ljJC4MBOXwV
         rX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683616023; x=1686208023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHO65dUebySbJGGVKSP2ByuOSoq9b8tMZkMCE9rax1E=;
        b=LqyJyiCD3D8fD/p9lVJL/KaiNbQMZ950Q6b2RUu2VFZZODlg+b+hZbr+i4DmH8MsDE
         4Uyjt+SFVJXY/O/j/9UfS7deQdWmgngmznNU5qplupZZAfiTH+SLUoWOUaXMMAt90iRJ
         MUO+lNTn34zv6qbDhveyR5+wk3Lb5NK7kf/vvsawH/peVzYDKtroRgcKlVITuyyhq67O
         vJeSyxjelfKpmv/kDR/YZOnGIhpHAzwOkScI2Rop22JEqjAK6b5MJWwj5FVrc20alH4B
         nTJV32hTKSie/+hJ17+bR5PfN4hsJayN6fblc7Z9h11aEQqo/yuh+vjMQVaVBU9PLSU6
         iSkw==
X-Gm-Message-State: AC+VfDzdyiLNMYhJ6TpE09iIOVjZqNkPJyDESL+/hW+CuuxijEFJ9gQn
	LI/7CaPyK4UWxWUMRc/BXvB9O/nWCBo=
X-Google-Smtp-Source: ACHHUZ4GDJPwCyM2KDA8bnvDGBZPy7qYTmrUw5a7bjytKjVoGILhY9rl7ecEvD7yxtc/BmTahsIYkA==
X-Received: by 2002:a05:600c:3655:b0:3f4:2cc7:aac5 with SMTP id y21-20020a05600c365500b003f42cc7aac5mr284311wmq.9.1683616023534;
        Tue, 09 May 2023 00:07:03 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id f25-20020a1c6a19000000b003f4290720cbsm2655629wmc.29.2023.05.09.00.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:07:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][mickledore][PATCH 06/16] appstream: fix build without gobject-introspection-data
Date: Tue,  9 May 2023 09:06:45 +0200
Message-Id: <20230509070655.70784-6-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509070655.70784-1-Martin.Jansa@gmail.com>
References: <20230509070655.70784-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 07:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102474

* there is a meson option to disable introspection, it's just called 'gir'
  fix GIR_MESON_OPTION to resolve:
  http://errors.yoctoproject.org/Errors/Details/702780/
  Run-time dependency gobject-introspection-1.0 found: NO (tried pkgconfig)
  ../AppStream-0.16.1/meson.build:173:4: ERROR: Dependency "gobject-introspection-1.0" not found, tried pkgconfig

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/appstream/appstream_0.16.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/appstream/appstream_0.16.1.bb b/meta-oe/recipes-support/appstream/appstream_0.16.1.bb
index 50d8cdb4c2..b8cecec41f 100644
--- a/meta-oe/recipes-support/appstream/appstream_0.16.1.bb
+++ b/meta-oe/recipes-support/appstream/appstream_0.16.1.bb
@@ -21,7 +21,7 @@ DEPENDS = " \
 
 inherit meson gobject-introspection gettext gtk-doc pkgconfig vala
 
-GIR_MESON_OPTION = ""
+GIR_MESON_OPTION = "gir"
 
 SRC_URI = "https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz"
 SRC_URI:append:class-target = " file://0001-fix-crosscompile.patch"
-- 
2.40.1


