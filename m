Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C568AC4167E
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 08:42:11 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.1862.1652344927358569220
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=7p+rHqD0;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.41,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f41.google.com with SMTP id i5so6174437wrc.13
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dS+BDO2SrLN3+xqJdK7015bNbHnrBpzuAm/NCeRON8Q=;
        b=7p+rHqD0tqUz10RX9MF2JzSvfZyrV057tPaaZwsB9NE51KM8ZHIrWqzlsv6O9i/eU3
         gEmGv005ItyBiKCwHp5BaLVsCdmjr7OoWIrOE3QwD6pY999CQzWC0JvXnbkt5i5k5lqS
         3lSIQ3ItXuJDCSLmqviE2UE7311/XHGQJVGBOkXEqMhmkIguHcRGZ7M3DeIWJksdk8Gx
         N+5If2eArHCmbvBT0SqwWOY41YNipjeRA33zJB69cDXbpuJYdfbXimebz5Qh29gpoyVp
         Rk6aQQlQJll3qbqzTqoGQ0WmL1lWm9Vo5p50VjoBc0zDXnXLMc7IeFAs/ZH8hsQvwsAw
         OOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dS+BDO2SrLN3+xqJdK7015bNbHnrBpzuAm/NCeRON8Q=;
        b=rpHuUVX7wIgssWE8YKeuk/5y19Mu6MhuOZxOpi1xvqJKSeXGlIYk7CJJc/ACOJIDCc
         UUUsaBdSyD1npP7I4iKMSlYnna0Cp+aVHHmfnLt/bj+kKiyxJp/5Ct9cULv4zWb3Gpvq
         bgqzenr8nGpfszqWcMQ8HrWVeaUzXx2Yxdv0+jj6nToYSiVGe0wyKGJagDKj7yhY3G4r
         oUm59MVVgfiqS49vqqzCkbJVLFEmBkWh8zb1GnKj4SV/b2Fv34+DoKIrb1kRPGbzIAGD
         jy1Z30tkQfpOEkntrmV/r41TtL2XkPV7sIugSXxVgtwIYaE6lqdRdn4TtVoHjfqnEXp6
         QhNg==
X-Gm-Message-State: AOAM532W5qCUymwkqdy8MvkYTKJ2lKKt0pFsrDXAcc/hpqrL5aWk1sNd
	3Ko20RQeYniHrU/NYyWyIB5yjwLgbMBGWMdV
X-Google-Smtp-Source: 
 ABdhPJwF6MO6PbnYGtJn1N5YukDPV/YnpDDfhq6ki9nXB+O2EIMGUWNQwddu7bOMpt/lIS3C4Z4Z5g==
X-Received: by 2002:a5d:4cc6:0:b0:20c:6b0b:b060 with SMTP id
 c6-20020a5d4cc6000000b0020c6b0bb060mr25671809wrt.50.1652344925929;
        Thu, 12 May 2022 01:42:05 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:167a:c5b3:9ce9:8648])
        by smtp.gmail.com with ESMTPSA id
 m7-20020a5d6247000000b0020c5253d914sm3531898wrv.96.2022.05.12.01.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 01:42:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 08/16] python3-eth-keyfile: new package
Date: Thu, 12 May 2022 10:41:44 +0200
Message-Id: <20220512084152.1388464-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220512084152.1388464-1-brgl@bgdev.pl>
References: <20220512084152.1388464-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 08:42:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97056

Add a recipe for eth-keyfile: a library for handling the encrypted
keyfiles used to store ethereum private keys.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 ...-setup-don-t-use-setuptools-markdown.patch | 36 +++++++++++++++++++
 .../python/python3-eth-keyfile_0.6.0.bb       | 16 +++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-eth-keyfile/0001-setup-don-t-use-setuptools-markdown.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-eth-keyfile_0.6.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 41bb24b32..5e41d92c1 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -111,6 +111,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-engineio \
     python3-et-xmlfile \
     python3-eth-hash \
+    python3-eth-keyfile \
     python3-eth-keys \
     python3-eth-typing \
     python3-eth-utils \
diff --git a/meta-python/recipes-devtools/python/python3-eth-keyfile/0001-setup-don-t-use-setuptools-markdown.patch b/meta-python/recipes-devtools/python/python3-eth-keyfile/0001-setup-don-t-use-setuptools-markdown.patch
new file mode 100644
index 000000000..7b8120380
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-eth-keyfile/0001-setup-don-t-use-setuptools-markdown.patch
@@ -0,0 +1,36 @@
+From 4348c72877e049804c7cdb7eec7a6bcd7ac2ea1d Mon Sep 17 00:00:00 2001
+From: Bartosz Golaszewski <brgl@bgdev.pl>
+Date: Wed, 11 May 2022 13:21:30 +0200
+Subject: [PATCH] setup: don't use setuptools-markdown
+
+This project is deprecated and irrelevant for the functionality of
+eth-keyfile. We don't support it in meta-python so just drop it from
+the dependencies.
+
+Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
+---
+ setup.py | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index cbb7f4c..7702aa4 100644
+--- a/setup.py
++++ b/setup.py
+@@ -51,14 +51,12 @@ setup(
+         "A library for handling the encrypted keyfiles used to store ethereum "
+         "private keys."
+     ),
+-    long_description_markdown_filename='README.md',
+     author='Piper Merriam',
+     author_email='pipermerriam@gmail.com',
+     url='https://github.com/ethereum/eth-keyfile',
+     include_package_data=True,
+     install_requires=install_requires,
+     extras_require=deps,
+-    setup_requires=['setuptools-markdown'],
+     py_modules=['eth_keyfile'],
+     license="MIT",
+     zip_safe=False,
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-eth-keyfile_0.6.0.bb b/meta-python/recipes-devtools/python/python3-eth-keyfile_0.6.0.bb
new file mode 100644
index 000000000..9477632e2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-eth-keyfile_0.6.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A library for handling the encrypted keyfiles used to store ethereum private keys."
+HOMEPAGE = "https://github.com/ethereum/eth-keyfile"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2beaef1b1764f4d6b46084c885b4bcad"
+
+SRC_URI[sha256sum] = "d30597cdecb8ccd3b56bb275cd86fcdc7a279f86eafa92ddc49f66512f0bff67"
+SRC_URI += "file://0001-setup-don-t-use-setuptools-markdown.patch"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-eth-keys \
+    python3-pycryptodome \
+    python3-setuptools \
+"
-- 
2.34.1


