Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DC5C77B6E
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 05:45:06 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.36195.1681278297475792457
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Apr 2023 22:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jorZyaOF;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-94a9606518cso142230366b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Apr 2023 22:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681278296; x=1683870296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TbG9qWauBw3ah20YlP08TOwf/nyBeds+ITuOxhJYndg=;
        b=jorZyaOFtR+CZ6VL5YaWiOTDDMoORweiqQDbaWdkl6M0dYbPVU0/DDA9LLexFDAxrx
         6xFI69S4Vnt/gUL+jsXbWY9hK9YavDQw/FBNw67KgO8ey+BV5WtO6VOTPTHkbKb2ubzJ
         XT9F7aaHvsyAx9XjkCsPqsZdaWsMGsw7dRMUYYoKJIRnkT9Ntf/dFythJ/rmr+QiOFd6
         mYSilh4PWok8f4lPWK3CRT+KyAuj/AaUdpqFceZKv4jGLDDrkPQ3e8Wu81BR50ahoN2B
         plbYXknq73Vm30+rY5m44O6Zxg65xT1bVnLRZlvm18XrfbzX++8/uzV4CnnGV3SLAg5S
         yb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681278296; x=1683870296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TbG9qWauBw3ah20YlP08TOwf/nyBeds+ITuOxhJYndg=;
        b=Vsc/WAzaEPUUn/FQxI4BRKcP3dS3RK8itCBgMBWHLOmSB4AAm3A9uchV0pQJLuAR9u
         sc4FojvRS82Ci9k/cweGrPxmtkHgu9Jl09s0ndwsUiCZbC5EvU/AcYRPnvRGAsV2Lt5B
         SqwcAUoqifeQdSC+qiICvDo0Z8k5oVwZWz+rjnyMgpG1lXFvcwgu9GDsjckuYw1X3m0m
         FQcomq6TGaCmJ3+Rtb6BXWjxpKfAwhd9kHIM0E67B0cB2fDlIAPGkskafkLgMNypeZ/H
         A/AlfZaZ99Q03IMNQ9TZQBJashwKnx4Q0H47qY/WmqOa3tTBcd+IHiqMuBBlW1ztn/Mg
         oX0A==
X-Gm-Message-State: AAQBX9dKGjZaNgwOe40uhHWlMu13RpWlsE9HcHFY1Dt/cp7pNPkgjoVT
	gvy+lYj9LiqJ/zrQXha7YGb3HDJZqSI=
X-Google-Smtp-Source: AKy350YNvwILdJBZ35KWwhtexF6YnOIxLISH/jAIWlrPqQUQ4lL2VD82KRg2FHgf9+gr1rjAKEXBfA==
X-Received: by 2002:a50:ed17:0:b0:504:8173:ec8c with SMTP id j23-20020a50ed17000000b005048173ec8cmr16239730eds.13.1681278295765;
        Tue, 11 Apr 2023 22:44:55 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b13-20020a509f0d000000b00504ecbd5ae2sm512379edf.42.2023.04.11.22.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 22:44:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][mickledore][PATCH 1/2] lirc: fix do_install with multilib
Date: Wed, 12 Apr 2023 07:44:46 +0200
Message-Id: <20230412054447.24461-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Apr 2023 05:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102061

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
2.40.0


