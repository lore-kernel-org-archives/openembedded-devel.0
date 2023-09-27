Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE611E80A8B
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 05:29:55 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.11478.1695792593852130129
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 22:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: straka.derek@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6588cc0e238so55412876d6.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 22:29:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695792592; x=1696397392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBFuKRIv4qy3pKbgEt+fbmQr4Z5NxjEyLmJiEUlRSr4=;
        b=fb6E3CoPOQpGDnuDRfiZLknAL4JsFggIIwZSN0jRXVIaQBbarw4tU0DMeMkMVRmJHx
         s/w5s5iGL/uPp1BbfY9ncTa6KN3NpLh2Lh49JJCAcUNgNDsL2OzsAJHJd0vEo0XQDLa4
         xA0igFvncP7OGcOOdJ7YNqv6/ySU9tHLlAXkIfS7X7OzzenmjtkDI6bd+Iik7DCofVzz
         5FuCQOMl6dWoBvSvqnOok54ewchSWQ4FcicdCKOGO7G9nC4Lx7ZlGPd+TSbqN2reuy0q
         Rj5ORog8J4mr6yPOPc4PAz535TJOzUkv3YgRCOaY65oP2uBBWVG3XF9LAZI5Y8lzl+T6
         9PLg==
X-Gm-Message-State: AOJu0YwvJFjj6KZRSLI5lPML8rhx3PUWurT6jitzZO1h58NCT4EUXy5j
	ruRv2rmPLk1Hl20HB4Ne3ij47i8rFsT+Lw==
X-Google-Smtp-Source: AGHT+IHVLAxUHxJ81sT1ZkuM0W3Zsbp4Ds0mA99AB42Df9woNVIXMGNJriNcUkbQPMBazCeC6glP7w==
X-Received: by 2002:a0c:da85:0:b0:64f:42e8:6f2 with SMTP id z5-20020a0cda85000000b0064f42e806f2mr1222498qvj.10.1695792592496;
        Tue, 26 Sep 2023 22:29:52 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id y7-20020a0cd987000000b006581e82a628sm1729660qvj.134.2023.09.26.22.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 22:29:52 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-flask-babel: update version 2.0.0 -> 3.1.0
Date: Wed, 27 Sep 2023 05:29:44 +0000
Message-Id: <20230927052944.1699146-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 05:29:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105166

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...3-flask-babel_2.0.0.bb => python3-flask-babel_3.1.0.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-babel_2.0.0.bb => python3-flask-babel_3.1.0.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-babel_2.0.0.bb b/meta-python/recipes-devtools/python/python3-flask-babel_3.1.0.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-flask-babel_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-babel_3.1.0.bb
index 657c190ec..610c40f84 100644
--- a/meta-python/recipes-devtools/python/python3-flask-babel_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-babel_3.1.0.bb
@@ -2,12 +2,11 @@ DESCRIPTION = "i18n and l10n support for Flask based on babel and pytz"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51917f3e8e858f5ae295a7d0e2eb3cc9"
 
-SRC_URI[md5sum] = "50d5e92d96ef58787bf85b5a1b0a5567"
-SRC_URI[sha256sum] = "f9faf45cdb2e1a32ea2ec14403587d4295108f35017a7821a2b1acb8cfd9257d"
+SRC_URI[sha256sum] = "be015772c5d7f046f3b99c508dcf618636eb93d21b713b356db79f3e79f69f39"
 
-PYPI_PACKAGE = "Flask-Babel"
+PYPI_PACKAGE = "flask_babel"
 
-inherit pypi setuptools3
+inherit pypi python_poetry_core
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-speaklater \
-- 
2.34.1


