Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71EEC77B7C
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 07:07:10 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.25899.1683616021633306345
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 00:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=IlxSyntc;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f41d087b3bso28766635e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 00:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683616020; x=1686208020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rj/uPWISTLqQYWvbU1LZ/pemH4k4NMxOTcDXL5175Ls=;
        b=IlxSyntcAzD9H8cZ/LYR9JYvgPTpLhMF8eGbLtQ73QnT5ETuegCGb8p9DSOAQ9m41M
         fRsOvw8avRQd/WwH9kW0iVWj/3WyAr1VxRPjlya88ui8idx8hX4u1kVBZL5MJqND1Fki
         868YZ9XDkm6Lk+WqB+2s+XrFQOLGwlzesMoAHKS9Qdf5rddE83HFBbSER38zNQqTZEnW
         WW+uEH28glpNAD81APxLel9E7N2V89SwQ27bxFALFbgbZjoOq5S5qizc60gsVDWG/iIx
         tMCEJmqhy91iPAhUTXW/dEFoD3ZBlzmXRUCwM7ecAX5xLxCiCEb+VZa/EKYriLx882+u
         WE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683616020; x=1686208020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rj/uPWISTLqQYWvbU1LZ/pemH4k4NMxOTcDXL5175Ls=;
        b=hTbvuW3pVtZEylx/rpP2Hu+L32UI4KgIGTTnMKYh4x8gfA5ke9smq1E8Kfam3oyMF/
         OLx8ezj0E2kNkGpqMoIi3qRD9hbDEbLjRVphw0pPfb703NXVhfaXGGNA7gszNL1glHon
         SgJOidNiToZY3ha4HtV2UnlolFBFllgDdASBITC4QLHmWJeR+Ytd+k46FDs6lMJW6KDy
         jXoCG3T2f1vu5pGdAbTcwiJu/nmIewwvtEZa+bkTe8UNU+7jZCwUkj9GlvUGWa6Te+ak
         wYUr06zaGTITsxBG9EC0Frn9fuG0y6FazrXoeKPibOxz0hDpIufcapq+12JjXnkkvdq5
         2DBg==
X-Gm-Message-State: AC+VfDzWSQj8Gzl6odleN+usPKN/48QPxMixos4DqnqTyaBW9tQ/GvWL
	p7FV8d6qhYM7bZRJmT5s+ouCLw86Y8U=
X-Google-Smtp-Source: ACHHUZ4EcEAq8lEJlPuc+e/UENtcwGTshZZGwQslIFRrRlksycysNPJA3SgbYqj/pXgJERtyrBUU8A==
X-Received: by 2002:a05:600c:243:b0:3f4:28db:f60b with SMTP id 3-20020a05600c024300b003f428dbf60bmr2132235wmj.29.1683616020010;
        Tue, 09 May 2023 00:07:00 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id q14-20020a7bce8e000000b003f182a10106sm18917107wmj.8.2023.05.09.00.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:06:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][mickledore][PATCH 01/16] lirc: fix do_install with multilib
Date: Tue,  9 May 2023 09:06:40 +0200
Message-Id: <20230509070655.70784-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 07:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102469

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


