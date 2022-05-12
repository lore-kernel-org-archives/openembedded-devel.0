Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99AEC4707A
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 08:42:11 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.1831.1652344928813827505
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=o7ISD+ZM;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.52,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f52.google.com with SMTP id b19so6180310wrh.11
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zCKENPJb885T3GIWXCKW2bURil+kg+xShpugyoS+S1A=;
        b=o7ISD+ZMxetiDrpBGVFasiihrOAllCjGRueObcZfCXmurDzESNKfm9+O1F48Dweylu
         iOcT67vSyLFkJFyWLhc2pCDkC0bgTx17ooqKm7B24UN0+g49CNVymrAo4/RdD/pg0CJk
         dvOfZ+QK27wkufHZwQ0Ue/pzoM8Bev7u8mbmyeWtKcKi5NbG03K4gb+OBVc5B9/MC2Fw
         47SDRhCJ7HHZVHJVMxgefNPEsvYTIbvkVlnkCkdLsEhcsA7MMDABanpgu8JwqdNXDM/y
         G5KO4gfod8LWUMDK+RNuuxtfmSnlrQ7J7US03uImsmA3BYM24DscIqG71Uty5Oz3080K
         WIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zCKENPJb885T3GIWXCKW2bURil+kg+xShpugyoS+S1A=;
        b=EKBKerWufJx8aU7MoI/6nJ+JAPtwgiL9DrykY7hvl7gGSxf9UGgR0nVyMjAmVgEz3i
         EDYzCuVwhKUAWFDsWB+TVgrChkjiyH9hK/5xnlWszrLOR9vZeybYYYGvuFSYUlqFElAD
         oTClPuLbHGo2qCIRp91MfyAjKJEB/QYp8ZvmteVEaJ2sPXWyy2LAf/VVa2+jolEPEuXY
         ZW+ii3AKqJGB4jZIyBKQCDkcoVWXZxxctIeZDYnJsBmS+N/RU6HegPgXq3pKhVg34U1O
         6INGXXTiG3+S1ld89Gl2mpHYoNZha/7II1xFmtvj1F3j4ww1GlLsn77WyhuOBqsKc8DM
         wVQw==
X-Gm-Message-State: AOAM533+4Nc1maGnX2quho8P64qKJ7zuVEYVDR8ZPpLXPFo6GjsFptOe
	vvXe+Ko0jbzFJpyW5V0uoIIW5LBctUbMBpg2
X-Google-Smtp-Source: 
 ABdhPJz8tiwkBgAQMvmeP+XMpLFcND3FqCl7T26wZivK9KeVpaC/1MFWrCLjG1kshuhLKrXt0yVhbg==
X-Received: by 2002:a5d:584a:0:b0:20c:5bad:11c1 with SMTP id
 i10-20020a5d584a000000b0020c5bad11c1mr26418512wrf.62.1652344927396;
        Thu, 12 May 2022 01:42:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:167a:c5b3:9ce9:8648])
        by smtp.gmail.com with ESMTPSA id
 m7-20020a5d6247000000b0020c5253d914sm3531898wrv.96.2022.05.12.01.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 01:42:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 10/16] python3-rlp: new package
Date: Thu, 12 May 2022 10:41:46 +0200
Message-Id: <20220512084152.1388464-11-brgl@bgdev.pl>
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
 https://lists.openembedded.org/g/openembedded-devel/message/97059

Add a recipe for rlp: a Python implementation of Recursive Length
Prefix encoding (RLP).

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 ...-setup-don-t-use-setuptools-markdown.patch | 35 +++++++++++++++++++
 .../python/python3-rlp_3.0.0.bb               | 14 ++++++++
 3 files changed, 50 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-rlp/0001-setup-don-t-use-setuptools-markdown.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-rlp_3.0.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 0a96e4005..d7d119d18 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -372,6 +372,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-rfc3339-validator \
     python3-rfc3986-validator \
     python3-rfc3987 \
+    python3-rlp \
     python3-robotframework \
     python3-robotframework-seriallibrary \
     python3-rsa \
diff --git a/meta-python/recipes-devtools/python/python3-rlp/0001-setup-don-t-use-setuptools-markdown.patch b/meta-python/recipes-devtools/python/python3-rlp/0001-setup-don-t-use-setuptools-markdown.patch
new file mode 100644
index 000000000..643d29639
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-rlp/0001-setup-don-t-use-setuptools-markdown.patch
@@ -0,0 +1,35 @@
+From 5a2db801c6520be296cee9cba0e0e4ffac68430c Mon Sep 17 00:00:00 2001
+From: Bartosz Golaszewski <brgl@bgdev.pl>
+Date: Wed, 11 May 2022 15:11:19 +0200
+Subject: [PATCH] setup: don't use setuptools-markdown
+
+This project is deprecated and irrelevant for the functionality of
+pyrlp. We don't support it in meta-python so just drop it from the
+dependencies.
+
+Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
+---
+ setup.py | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 1055fb1..55fca24 100755
+--- a/setup.py
++++ b/setup.py
+@@ -46,13 +46,11 @@ setup(
+     # *IMPORTANT*: Don't manually change the version here. See README for more.
+     version='3.0.0',
+     description="A package for Recursive Length Prefix encoding and decoding",
+-    long_description_markdown_filename='README.md',
+     author="jnnk",
+     author_email='jnnknnj@gmail.com',
+     url='https://github.com/ethereum/pyrlp',
+     packages=find_packages(exclude=["tests", "tests.*"]),
+     include_package_data=True,
+-    setup_requires=['setuptools-markdown'],
+     install_requires=[
+         "eth-utils>=2.0.0,<3",
+     ],
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-rlp_3.0.0.bb b/meta-python/recipes-devtools/python/python3-rlp_3.0.0.bb
new file mode 100644
index 000000000..e747ae33b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-rlp_3.0.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "A Python implementation of Recursive Length Prefix encoding (RLP)."
+HOMEPAGE = "https://github.com/ethereum/pyrlp"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=00854fa80a84236706b11f47f23e61e7"
+
+SRC_URI[sha256sum] = "63b0465d2948cd9f01de449d7adfb92d207c1aef3982f20310f8009be4a507e8"
+SRC_URI += "file://0001-setup-don-t-use-setuptools-markdown.patch"
+
+inherit pypi setuptools3
+
+DEPENDS += "python3-pip-native"
+
+RDEPENDS:${PN} += "python3-eth-utils"
-- 
2.34.1


