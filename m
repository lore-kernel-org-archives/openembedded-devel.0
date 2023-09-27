Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E66AE80A85
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 04:53:45 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.10966.1695790418786498303
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 21:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: straka.derek@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-65b2463d663so16781626d6.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 21:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695790417; x=1696395217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4LasVRMCnr0L5HIIBADKelKgfBIOGKxNRPGU4SjftQ8=;
        b=HxYpfL1XAsfhPM5bPL9Cckb8bJgDpTZjsNClCqm+nvaXzeOdayHHZ8m7ugJKl59w+E
         cAYyboWgYagYdbqaK1KddpZfOFvVFjsgraU/FaHQ+Yf1/WAYzVzt19cSBEG3yaX0OCxl
         V/a8iWB/s1tWWMFsXrjZ477i/LKXW+cbk7BadM8VEUPLYcJbySr5X/TTcVj8sGN6x9CU
         xEn2tNEt6kq2uUiTFXhdD7RTVVaqxFSBJvWymrSTrI38koJPISYtJL90945OQxzNOsdM
         3kEsN+MvWyLkrPlttTRw5hMmBYIpZogxvxBC7jVxIQQCiowkgM1SHCWZu+5rdgvpIhUQ
         /ESQ==
X-Gm-Message-State: AOJu0YzL7Enc++2+v36tN/3MvSjxIXVCtU3JaD4/nKCZ2PG0JzhMK9TO
	ElSEyD5X6sfIsXDU3Hy4zxv8imCsK3ut7Q==
X-Google-Smtp-Source: AGHT+IHfh4BoHe5TD1DT+VKtrPASmGxB4pKtNDzDmhMWtISZLDKBAjoEUeoMWmmMivhGe/3ptPwUnQ==
X-Received: by 2002:a0c:e503:0:b0:649:384f:edc with SMTP id l3-20020a0ce503000000b00649384f0edcmr878764qvm.2.1695790417361;
        Tue, 26 Sep 2023 21:53:37 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id b13-20020a0cb3cd000000b0065b129ec0e8sm74285qvf.57.2023.09.26.21.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 21:53:37 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-pyzmq: update version 25.0.0 -> 25.1.1
Date: Wed, 27 Sep 2023 04:53:28 +0000
Message-Id: <20230927045328.1685006-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 04:53:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105162

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-pyzmq_25.0.0.bb => python3-pyzmq_25.1.1.bb}  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_25.0.0.bb => python3-pyzmq_25.1.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_25.0.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_25.1.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pyzmq_25.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_25.1.1.bb
index 39a7614fc..504ef7abc 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_25.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_25.1.1.bb
@@ -3,17 +3,17 @@ DESCRIPTION = "This package contains Python bindings for ZeroMQ. ZMQ is a lightw
 HOMEPAGE = "http://zeromq.org/bindings:python"
 LICENSE = "BSD-3-Clause & LGPL-3.0-only"
 LIC_FILES_CHKSUM = "\
-    file://COPYING.BSD;md5=11c65680f637c3df7f58bbc8d133e96e \
-    file://COPYING.LESSER;md5=12c592fa0bcfff3fb0977b066e9cb69e \
+    file://LICENSE.BSD;md5=1787206f198344195a671b60326c59dc \
+    file://LICENSE.LESSER;md5=0e99bfbdd8b9d33b0221986fe3be89ed \
 "
 
-DEPENDS = "python3-packaging-native zeromq"
+DEPENDS = "python3-packaging-native python3-cython-native python3-setuptools-scm-native zeromq"
 
 SRC_URI:append = " \
     file://club-rpath-out.patch \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "f330a1a2c7f89fd4b0aa4dcb7bf50243bf1c8da9a2f1efc31daf57a2046b31f2"
+SRC_URI[sha256sum] = "259c22485b71abacdfa8bf79720cd7bcf4b9d128b30ea554f01ae71fdbfdaa23"
 
 inherit pypi pkgconfig python_setuptools_build_meta ptest
 
-- 
2.34.1


