Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6765C46CCD
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 15:44:50 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.54215.1703173490303121199
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 07:44:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-35fd04ede25so3773755ab.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 07:44:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703173488; x=1703778288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zr1ht9TmJiuAWbg11T/CZkdTrQ95HfCpxuSsVyFrt3k=;
        b=nglfrXFSodCqdq0IE6uvdCAFqVBr8FClEms5WiM4Y4HJ5qoFNz6O3FvVFqXHIFzdUL
         CqYgttOdlBiysTsMZwGk2zmkJpVvkZ+QPIrGjeZ912wofKZDbvzJkOk5m0dbFo66FoB7
         lWJBX9DzfGSbJaj6+YcuWj1sMALxw78thZYsPu8CE764JDQgA6T84sdz/RPDxeERNLcd
         6kARoq9tCRMcstjZMgBcjhBeXcGr3bj75AGryXWFUtIdCk9ISpKDqO2wz/sqelg4yKxa
         iK4+X2I5Ta8b1iF+YC0vUF23+RlDUKuiMfuf2uIj61TZKmwwkHs4/7vjgpFoGcioxvxz
         /cdg==
X-Gm-Message-State: AOJu0YxA5I8I4EcT6QGipMv52Yo4kKlgEENBWl6EQONTELmrGRHP1wZi
	Z1Zc9hV5yz3y9ge1ECy1ceN+qiQ8h7Bp7w==
X-Google-Smtp-Source: AGHT+IEwL3MlMBcaT1YbvYrF9HsBrWt4ma9+L1HcOEzkRS/4+8yUIOWH5fSjghsQBjCJA3hVAl/vog==
X-Received: by 2002:a05:6e02:180c:b0:35f:d00b:236b with SMTP id a12-20020a056e02180c00b0035fd00b236bmr2388433ilv.49.1703173488524;
        Thu, 21 Dec 2023 07:44:48 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id k28-20020a02ccdc000000b00469328386c8sm530578jaq.162.2023.12.21.07.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 07:44:48 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 2/5] python3-bitarray: update to version 2.9.0
Date: Thu, 21 Dec 2023 15:44:32 +0000
Message-Id: <20231221154435.3874910-2-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231221154435.3874910-1-derek@asterius.io>
References: <20231221154435.3874910-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 15:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107716

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-bitarray_2.8.5.bb => python3-bitarray_2.9.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.8.5.bb => python3-bitarray_2.9.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.8.5.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.9.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.8.5.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.9.0.bb
index 5047784ab..e899c800b 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.8.5.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.9.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "b7564fd218cc4479f7f0106d341e096f78907b47865aeeff702c807df1927c01"
+SRC_URI[sha256sum] = "41f6b46f01bc59abfc38653d203565113b6e7dd04d0ec688774ed28e6d9755db"
 
 inherit setuptools3 pypi
 
-- 
2.34.1


