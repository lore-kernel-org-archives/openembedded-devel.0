Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C631C7EE26
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 22:44:15 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.94676.1683499448084921584
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 15:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=l4+YaTdA;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so43816428a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 15:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683499446; x=1686091446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rj/uPWISTLqQYWvbU1LZ/pemH4k4NMxOTcDXL5175Ls=;
        b=l4+YaTdADWNdyEcOFUulUrsPecjTylT/rK49AjLOpOgpdSwc3trOhMRe8jKABrsDJ+
         6fCsg1t9751KTQCg/g3xe/drI2kc9zBvX2e5IwOCWt6oJ6NmWsQF57Bwn9X3A62IqrJ6
         75njazHlzzMnMTH54xvS0QYJtUQd1+AvE2+XemWyse9qW3UgQwgxwtjGG9pKKhUleDA7
         7s8lravWSdhEVlbcSD6JCKc/JtJzIT+ibdoCssRHMUzSZZc2t5zZ6r92SU6wB99j0onq
         l/8AjAXzSEbVue61gMQoYr6aE3hrBEwDHeXT+ekNPul/72dEOITFLyEAD2P3zDtvNlyh
         ReTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683499446; x=1686091446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rj/uPWISTLqQYWvbU1LZ/pemH4k4NMxOTcDXL5175Ls=;
        b=YcTuzkebL6769nHLgg4MSxEC2/3ggsMGPzN6uEFehsyag6FKVPRd7Cqwcdi5MCMK8+
         esCs4VZPR4Nwd9bTVFBi0Ubf7HDSooMYsWj6RSJwBAhTxv7W9RR36D7weVRN/in5CQi/
         gBuKfsMZVgPWBgtpf3Tkn/rYYcX6bB2dQrXPvi7UJWVT12bPEkcv3mbRRw6+DZKxXjQo
         VI6qJ5WWej4UHoZg87fUs+12cpTbfbeALMN/xNfoRBIryJh+iRP6lXR0ZHSR5/yqRYMd
         5gzhYdErMu4QYaQd5heOU4VDd3glm5fsh7X0kFUDsj8EWK2mzI6u/Pb0iRL2rpXwM4C6
         04yA==
X-Gm-Message-State: AC+VfDwGKA91hKMGwuGqXbW3WizhfNJFynrqiZANVB8UqI3FI/bgwWFX
	s5e6TTarbwpM6emq33pLYhBvrmIBQgM=
X-Google-Smtp-Source: ACHHUZ6liGPv0XfP6uX7qu5iiFLcXJ5cOKh5MSMXugCpdxuikVaI+ed49g4yGYRXHIv5RKYToE+mng==
X-Received: by 2002:a17:907:62a6:b0:95f:64d8:f795 with SMTP id nd38-20020a17090762a600b0095f64d8f795mr6411405ejc.27.1683499446376;
        Sun, 07 May 2023 15:44:06 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id gv43-20020a1709072beb00b009663cf5dc3bsm1557490ejc.53.2023.05.07.15.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 15:44:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 01/16] lirc: fix do_install with multilib
Date: Mon,  8 May 2023 00:43:39 +0200
Message-Id: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 22:44:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102363

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
index 88e3f0486b..fcb347a2e5 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
@@ -51,9 +51,9 @@ do_configure:append() {
 
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
2.40.1


