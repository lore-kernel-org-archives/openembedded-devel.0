Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.10728.1593562062964570380
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cJdXLOnt;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id 67so6082929pfg.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+qhK3uHC0s1jdWVYQ1GkU8mzaZwk/eMjot2vwFiqzKc=;
        b=cJdXLOntWrOhALvhT3Sy9BkKHjk3VkNrxcKO/DeRwy0oRUD76wv4zKuY2oYxpM7FoN
         AO4t/A95kMLFhpx5Hp883Uc41Rcjz3PtwTTp9zgl4gokfCEpPSBIrfLon7ujKvN9KJS0
         7HxcvEPpqa4uSy2hC1wk4EwXyos6HOlEoGlfU0qDf8mrfw3vnCPpzdd0rpI6HIkiouKt
         cuEwRZJp+mAl448//o0U1q2BY+yv4gDUD5jZj0lDtzHe41I5fjPCFHmi0ioGbVW378nN
         CzT4yePwVAWt/cazOgxkcKDFcjHOLdMdP7qvNkNHN5JMxsmeRKFJSvbVrVj+UEpyWD5a
         PaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+qhK3uHC0s1jdWVYQ1GkU8mzaZwk/eMjot2vwFiqzKc=;
        b=FFRji3Ns4cgFFqBbPwuWYpc1UTdUaNEN8ct+v5W2P0AyQWvNJCyEiaQ0ZowMw5EtHV
         SACzgFM6hzQGQB6ggVxrvUxgUpPeIikuaQYNhBck9zMtHSCWnpKceaDkiqh9X9ehrFOZ
         Vqc8DIm6MFrQ2O3sDT+Mr8d+jVFg2QKW2gv0/8mkfmuxeSvsM0++JXHwZKwUcKSDqUuW
         MZiXc68lpbl2ZfLaC/aPuLRmX6qW3FdKPf/go77OuuLOF8a+DqQkLP8bPmsdbkU4klD3
         3dnAe8083JcpefISnNziuJcSdeb5J+POJUbX2xucxodZZi/5TnUuvcCBap4R9nrl+Q/m
         omvA==
X-Gm-Message-State: AOAM530RpFh9mb0AymXOuDi/zZzM0vlXL4PhJiY8fFFMFlVnrM7uPIIU
	Z5GLYvAaRdC+1IwjhyBHdDkV5sWY36o=
X-Google-Smtp-Source: ABdhPJz36fns/cK/KTY0PMx5Qf5L2RS/ix6QBumY60BNq3E4UAOaiwLfuMxOxdH2AeB557ZoJGkv0g==
X-Received: by 2002:a63:4b44:: with SMTP id k4mr17863873pgl.305.1593562062098;
        Tue, 30 Jun 2020 17:07:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:41 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 18/32] python-m2crypto: Add RDEPENDS
Date: Tue, 30 Jun 2020 17:07:03 -0700
Message-Id: <690d69d90a7cab558da62d8deca3c8faaa63b368.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Changqing Li <changqing.li@windriver.com>

fix errors:
ModuleNotFoundError: No module named 'distutils'
ModuleNotFoundError: No module named 'asyncore'
ModuleNotFoundError: No module named 'xmlrpc'

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1d6071e97157851dbfbdf26f302fc5ec8f6ee4db)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python-m2crypto.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-m2crypto.inc b/meta-python/recipes-devtools/python/python-m2crypto.inc
index 76dd58ce04..881fdf1cc2 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto.inc
+++ b/meta-python/recipes-devtools/python/python-m2crypto.inc
@@ -17,7 +17,11 @@ PYPI_PACKAGE = "M2Crypto"
 inherit pypi siteinfo
 
 DEPENDS += "openssl swig-native"
-RDEPENDS_${PN} += "${PYTHON_PN}-typing"
+RDEPENDS_${PN} += "${PYTHON_PN}-typing \
+                   ${PYTHON_PN}-distutils \
+                   ${PYTHON_PN}-smtpd \
+                   ${PYTHON_PN}-xmlrpc \
+"
 
 DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR} -I${STAGING_INCDIR}"
 DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR}"
-- 
2.17.1

