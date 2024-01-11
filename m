Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44140C47077
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 10:18:20 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.8593.1704968289858137959
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jan 2024 02:18:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VUGF36Vd;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a28bd9ca247so579329966b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jan 2024 02:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704968288; x=1705573088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JuNLElfaRFk8qllJR1Ntx0zJn3dijk/9cwB5TyvkggU=;
        b=VUGF36VdcFLjpznBgXiySWcRQVZ5uDKP+++nwNxnJdkcMRFsjJZTr8gUfxlxAGXn2w
         jGdDqEFUtUSOZJG779Rhtdm4xBPB2GuITHNdrvsdHmtz4K9FfD5qv8QqPh5UB3XvQFGI
         Vns363Ufu9n8cOALoqPYwYJ4dbCAeL3hTX7J1FW8KakqQkTW1jQdRwSdVC1K1NcCG8H0
         iU9tuXgzPwXOPf+MdIe5Ef/FNfmCQAtV3DT9r1/SFdZ66a6HXbGbeYI+GR0TD8GvQALq
         cfB3YijJ1k4xFToKZBqdCUmwLz8hRAPtrnBWzD/cgt1yW3R32WQMKRAGVepL9upQPFkO
         9F2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704968288; x=1705573088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuNLElfaRFk8qllJR1Ntx0zJn3dijk/9cwB5TyvkggU=;
        b=Kteim2NVKcxFNv7Zt6HIP/t5Pj7G95OYM/OroxOu5wIxKjyz21RDi5UlvsmHlGTvbP
         tLyMxO/MEkcO6x/9BVSKZRZyuaOwFnmxfFQPDNM4PXDOrDatPUDgYqs0iO/2mbllRLEx
         gMq4R2iQ41OnKgDkt6RTZc/cokm4CiThP5vgfYCkqXheZxd0FZah7zEqkR3F6FQODUzn
         ISVpWbGZAPCD5d0C6j8d0Ae+ExQn4eV1ujNPaq6qz7WVjIEQxtBNbYXk6SMr7+wCEyK4
         GFQfflrt3knd+c1kRXResAGKpptesfb1OQiJAe6A+wHiDmsgfabPP/5ekMc6PcoTGGJp
         CTaA==
X-Gm-Message-State: AOJu0YyvAfS990Y0U92Jhve7Ixbk/EPp9olBiTaBfg9Z+jTw+Ny53BSp
	Qn2sCiw44Z84lOnRM4ur5L0r3UcgQ/E=
X-Google-Smtp-Source: AGHT+IEOCBRLlnVXJjpeg3YFLY51ZcGWXYqoontqe9Ioryb3JxWHpkbxCOMh6etN5iNWnqjMBBjt7Q==
X-Received: by 2002:a17:906:4694:b0:a28:b9a7:c787 with SMTP id a20-20020a170906469400b00a28b9a7c787mr391698ejr.54.1704968288086;
        Thu, 11 Jan 2024 02:18:08 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ca23-20020a170906a3d700b00a2bd01c2349sm388954ejb.169.2024.01.11.02.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 02:18:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alex@linutronix.de,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCHv2] libpwquality: respect PYTHONSITEDIR
Date: Thu, 11 Jan 2024 11:18:02 +0100
Message-ID: <20240111101802.34013-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jan 2024 10:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108222

* fixes installed-vs-shipped e.g. in multilib builds with libdir set to /usr/lib32:

ERROR: QA Issue: lib32-libpwquality: Files/directories were installed but not shipped in any package:
  /usr/lib/python3.11/site-packages/pwquality.cpython-311-arm-linux-gnueabi.so
  /usr/lib/python3.11/site-packages/pwquality-1.4.5-py3.11.egg-info
  /usr/lib/python3.11/site-packages/pwquality-1.4.5-py3.11.egg-info/SOURCES.txt
  /usr/lib/python3.11/site-packages/pwquality-1.4.5-py3.11.egg-info/PKG-INFO
  /usr/lib/python3.11/site-packages/pwquality-1.4.5-py3.11.egg-info/dependency_links.txt
  /usr/lib/python3.11/site-packages/pwquality-1.4.5-py3.11.egg-info/top_level.txt
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
lib32-libpwquality: 6 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
v2: Update Upstream-Status to Backport and use slightly updated
    version already merged upstream

 ...02-Makefile.am-respect-PYTHONSITEDIR.patch | 26 +++++++++++++++++++
 .../libpwquality/libpwquality_1.4.5.bb        |  5 ++--
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/libpwquality/files/0002-Makefile.am-respect-PYTHONSITEDIR.patch

diff --git a/meta-oe/recipes-extended/libpwquality/files/0002-Makefile.am-respect-PYTHONSITEDIR.patch b/meta-oe/recipes-extended/libpwquality/files/0002-Makefile.am-respect-PYTHONSITEDIR.patch
new file mode 100644
index 0000000000..cd59a6d887
--- /dev/null
+++ b/meta-oe/recipes-extended/libpwquality/files/0002-Makefile.am-respect-PYTHONSITEDIR.patch
@@ -0,0 +1,26 @@
+From edc51ba1b446913232cdf2945f485392bca72dc7 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 3 Aug 2015 13:43:14 +0800
+Subject: [PATCH] Makefile.am: respect ${PYTHONSITEDIR}
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+Upstream-Status: Backport [https://github.com/libpwquality/libpwquality/commit/5192eab011ada47b0157f8d0524bf5b18bba3bd0]
+
+ python/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/python/Makefile.am b/python/Makefile.am
+index 6e51744..0a3bad5 100644
+--- a/python/Makefile.am
++++ b/python/Makefile.am
+@@ -14,7 +14,7 @@ all-local:
+ 	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV)
+ 
+ install-exec-local:
+-	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV) install --root ${DESTDIR} --prefix=${prefix}
++	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV) install --root ${DESTDIR} --prefix=${prefix} --install-lib=$(pythonsitedir)
+ 
+ clean-local:
+ 	rm -rf py$(PYTHONREV)
diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
index 91afedcb67..4454496f6c 100644
--- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
+++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
@@ -8,8 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bd2f1386df813a459a0c34fde676fc2"
 DEPENDS = "cracklib python3-setuptools-native"
 
 SRC_URI = "git://github.com/libpwquality/libpwquality;branch=master;protocol=https \
-           file://0001-Use-setuptools-instead-of-distutils.patch \
-           "
+    file://0001-Use-setuptools-instead-of-distutils.patch \
+    file://0002-Makefile.am-respect-PYTHONSITEDIR.patch \
+"
 SRCREV = "5490e96a3dd6ed7371435ca5b3ccef98bdb48b5a"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


