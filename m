Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 764A8C77B6F
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 18:58:11 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.52965.1681153083604583877
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 11:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=RWWe3kyt;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-50489d1af35so1600544a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 11:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681153082; x=1683745082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqEFRhjUJbQpSrls+byHeDxH7xYFowQkGs4cnjX9e+Q=;
        b=RWWe3kytp9WKnnlAMC0KzLa9uamEtXJf3gompDwn037JPTvaJIGVtZzktpY1Xn39sR
         vN5/VMEyw28tfPQTm7CS+XQJ8D7KF5sf75uJnA7hXl97X2yiQzK9us3FvJUkc3Ksloo2
         /n51LDJThak2kZmXDQxDGhBjghHJS49dVtIWoknD/4SkwgSjIgWoSgyK/+cbgWG7nw2d
         MX7+LdebaeZlhHTSBg8e+cCRuXO8QiVa0GJbTtpDZBzkXCe+PRmTwKpREudNody+T+xQ
         MlKQbPGmDfrhSBDWXBNd77YuyZNGGC8sQtb7GcLqfdGTXcg1HQeEjdkWBVYAWHzZQwLl
         +axA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681153082; x=1683745082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqEFRhjUJbQpSrls+byHeDxH7xYFowQkGs4cnjX9e+Q=;
        b=mM0YjaW/3JSNWX5C9jNOvWSpSz/ij6XtznvoR/QwZ5+uv4YGkE8aPnvR/Hrd24wVCs
         iND7hVRoPvYEB+K+su4uz0ZECiIZLLZOJE4tQNnu+C6eAlvmGtV16SFi2UGOsa6uW0NV
         c+HUaPlIPQxBA+ONCeVrsD7K2rLZZGQVMhDvc0lDEactLRVvtu8IUkDNzY+jQjvlh7r9
         Wv6B5CuYFSh8qoVowWb9YeXMme+7xz6Tll7tgbh7jYF3DNY/TGs4Y8P0M5yAIC047IwL
         UnVfzeQ4eDxgtf8lCcYkfhBv+vomFTnj+B1N7Bjw27/R50BSF8JXNpc/wfIsBtQRxUDL
         2pGQ==
X-Gm-Message-State: AAQBX9fxcruCUdohIPjHKwsTPpCW4oNFZSwnHk+RW8m9suHl41Gx5Mep
	6npw53bLEmkiM5klLq8nnwgM6+UGr+U=
X-Google-Smtp-Source: AKy350bBFYV7OTjafK2ZPKVnqKakWzQpLfjMaJ6YyKeE95kAFhYOXASaPHc3JRmQVlUA9imLrXvw2g==
X-Received: by 2002:a05:6402:3454:b0:504:8be5:e8c0 with SMTP id l20-20020a056402345400b005048be5e8c0mr6562948edc.21.1681153081798;
        Mon, 10 Apr 2023 11:58:01 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id i13-20020a50c3cd000000b004fa012332ecsm3706706edf.1.2023.04.10.11.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 11:58:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][langdale][PATCH 6/7] lirc: fix do_install with multilib
Date: Mon, 10 Apr 2023 20:57:41 +0200
Message-Id: <20230410185742.2416583-6-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410185742.2416583-1-Martin.Jansa@gmail.com>
References: <20230410185742.2416583-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 18:58:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102041

* use ${S} instead of ${WORKDIR}/${PN}-${PV}
  and ${BP} instead of ${PN}-${PV}
  to fix build with multilib, where PN is lib32-lirc, but S is correctly set
  as ${WORKDIR}/${BP} and do_install fails with:
  mkdir: cannot create directory ‘lib32-lirc/0.10.1-r0/lib32-lirc-0.10.1/python-pkg/dist/’: No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
index 234d347af7..7e975d2c6d 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
@@ -49,9 +49,9 @@ do_configure:append() {
 
 # Create PYTHON_TARBALL which LIRC needs for install-nodist_pkgdataDATA
 do_install:prepend() {
-    rm -rf ${WORKDIR}/${PN}-${PV}/python-pkg/dist/
-    mkdir ${WORKDIR}/${PN}-${PV}/python-pkg/dist/
-    tar --exclude='${WORKDIR}/${PN}-${PV}/python-pkg/*' -czf ${WORKDIR}/${PN}-${PV}/python-pkg/dist/${PN}-${PV}.tar.gz ${S}
+    rm -rf ${S}/python-pkg/dist/
+    mkdir ${S}/python-pkg/dist/
+    tar --exclude='${S}/python-pkg/*' -czf ${S}/python-pkg/dist/${BP}.tar.gz ${S}
 }
 
 # In code, path to python is a variable that is replaced with path to native version of it
-- 
2.40.0


