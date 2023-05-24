Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2479C83003
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:13 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.3581.1684914793329719629
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SivQQTie;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-510b4e488e4so1466231a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 00:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914792; x=1687506792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9emp//3/7jOQO1zoaL/yZjJiI189/HBWTrx7K6juWo=;
        b=SivQQTiePwwIFX1aSrzjJyOGh6ku9UuOo5b7eSPmDNXKdjVLxif/IAeWX/cnAkmURS
         DnOL8fvea5kKefFMKDvXgpVTZMPGlLdEV47tjb5kRvIeXUhTlgQc3nMVNRC0a4Qx9VYf
         QHRqFqacp6e9LZrd/bX/hOPfh8Yv3xTGdkcJNE92t5veTaYzMGMEqI9/P82ZXnDEFD7K
         YkvGnmdva5GUEBNgKiKRToOfA8/hZ1tBEKirVyIZ/Xkq0dIA9dcK2F5amjZ8Xa9sOAk1
         jWgw8mPE1lmKvLMZXFfZ2uieJsTEyZQxdlouWmmdxPZLWv3O5P+5Llg4duZ0t1wsX3t7
         dA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914792; x=1687506792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9emp//3/7jOQO1zoaL/yZjJiI189/HBWTrx7K6juWo=;
        b=XQIW0Ct5hsg1lQutuc48iGMHwIX7ADDocHUSQF0k5Ib47htZpk2Hh2vSW9Ad6vXSqu
         NDO3pHmEfI6H6ZKmPevSTOWZQXV9DbJbGj61PGkXO6Ck+UMLvzgFukSiqsa01isdDUel
         wWbzBYAMTkjZ+IgQ/D4dGQZiZAfs0khg/7/eatgxYXJgrUdi03MYUhALAlznIuTEIrqv
         R97PNhWPetl4vi7SJQGgVZlVfAGIJr7qm+4p0F0fzuJ84I0nauq6Sm8X3BCPKSyWPrRe
         3OcjSnj6r5gPUbffkvImKbJ1NECoh9xsS2RgLqwjMFVrU34ghL0qPhW8oDblR1nFqj+R
         zxVA==
X-Gm-Message-State: AC+VfDzMDydJwIInqRxBLoT/3f6rFMlXnsVTCLwNpsLrEQ6Fd7gJb3xx
	ZANgGtdCHuhdVBjw1ocC8mODklfKDfs=
X-Google-Smtp-Source: ACHHUZ7849Kyw2eIU36iVPZz7xntvXLte1fpyjY2y72uHO255uHOHm4ncJPIb8SqIG6bNCDlGGnBsA==
X-Received: by 2002:a17:906:5d06:b0:96f:f809:1394 with SMTP id g6-20020a1709065d0600b0096ff8091394mr8627440ejt.53.1684914791702;
        Wed, 24 May 2023 00:53:11 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id og34-20020a1709071de200b0096f7e6d0063sm5390133ejc.75.2023.05.24.00.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 15/20] libinih: remove unused patch file
Date: Wed, 24 May 2023 09:52:48 +0200
Message-Id: <20230524075253.1033593-15-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
References: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 07:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102769

* it was removed from SRC_URI with git recipe in:
  https://git.openembedded.org/meta-openembedded/commit/?id=da03785ff19c2db4210318759a011c6919692876

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...header-files-without-prefix-dir-inih.patch | 24 -------------------
 1 file changed, 24 deletions(-)
 delete mode 100644 meta-oe/recipes-support/inih/files/0001-include-install-header-files-without-prefix-dir-inih.patch

diff --git a/meta-oe/recipes-support/inih/files/0001-include-install-header-files-without-prefix-dir-inih.patch b/meta-oe/recipes-support/inih/files/0001-include-install-header-files-without-prefix-dir-inih.patch
deleted file mode 100644
index fb7b85cfd4..0000000000
--- a/meta-oe/recipes-support/inih/files/0001-include-install-header-files-without-prefix-dir-inih.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-include: install header files without prefix dir inih
-
-The other flavor of inih which adapted by Fedora and Ubuntu installs
-header files to /usr/include directly. And xfsprogs 5.10.0 also checks
-ini.h without extra search path and fails. So install header files
-without prefix dir inih.
-
-Upstream-Status: Submitted [https://github.com/OSSystems/inih/pull/4]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- include/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/CMakeLists.txt b/include/CMakeLists.txt
-index 7a46ee7..4a9033f 100644
---- a/include/CMakeLists.txt
-+++ b/include/CMakeLists.txt
-@@ -1 +1 @@
--install(FILES ini.h INIReader.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include/inih)
-+install(FILES ini.h INIReader.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include)
--- 
-2.17.1
-
-- 
2.40.1


