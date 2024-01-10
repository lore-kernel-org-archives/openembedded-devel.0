Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 261E9C4707B
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 16:25:30 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.16043.1704903920206390443
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jan 2024 08:25:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d4rmbE0E;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e80d40a41so5448713e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 08:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704903918; x=1705508718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2uNL3HJCR/Xu53IISXGNnhlkLcTVca8po+9iNWj1r3c=;
        b=d4rmbE0EuetswSBkj/TzRlOyoYCjTLP3EqkiZtzb3SYz8pkxctIqqVEXwfumhbxqU7
         aELcWl1Tn9K3o630T/2EhkAn5/cxZfmzUKxE/YtW72c+X6wLdeRAHsnJgl25ThZgz4x9
         ao/K93QYQK2qqFrTxnIvlEDhJ5YYr16IUEcEiRPA+/mHaaBDWuHuEZJCf8xPqd+G7PuR
         TWNTTpfmcyeJiTbwoTg7aWn4ISDleZcokxsBuatxt7Mz4GKWizganHrYVa9cJjhMz3YA
         zBBpNFX92YS0C35rcDDAMH/KpKi1E/L1NsPholSTl6+YQRGBwuwGXE6bvQATq11INFaO
         CXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704903918; x=1705508718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2uNL3HJCR/Xu53IISXGNnhlkLcTVca8po+9iNWj1r3c=;
        b=Ovhv/CebndtizlYCSOHEyf35Gszup53IyeWctCS8lZN39+Mlp6j6ypVav7LcChtJyj
         mubgYTCjaj3ibSSf6/wUx5ZoqA7udBghR/skKugGH3PREfLlWDMdutah5HUJuRt6UMHK
         GnCt344ZbPHf5b3t4kG1KC5Cj+ecLLddI5wbA6yqUPqRQDf+nOEeIe69Z0pECYT7mtI4
         VWeo7NMgOoqEbnLgSIBdH+NcJPoAw6TcavibvULUG5y1vlJbTCpw1ZSsyw0UR/0Zl+dC
         A20e1xQwlrlHE43x5k6RgLX6dqBjmyPuM71iQrTXvFgT/wR1r1c6ZUhTLTgvvWVP9udc
         Ph9A==
X-Gm-Message-State: AOJu0Yzw3Z0EiXbSfF+0LE8HVYHiYhypoE1SADGHq9heSWmIjpfBGUgg
	7jdtew8Lmti0J6At6k4CQ3EzEdKKsvs=
X-Google-Smtp-Source: AGHT+IHxG5buck8J8RvIdqSgQRIi5B7yZiFPkY2+C7phwlJ3wKquRHMKWs4dmFzHlze14D99UhWFeA==
X-Received: by 2002:ac2:5484:0:b0:50e:769b:7163 with SMTP id t4-20020ac25484000000b0050e769b7163mr607167lfk.138.1704903918153;
        Wed, 10 Jan 2024 08:25:18 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id c18-20020a7bc2b2000000b0040d5c58c41dsm2608895wmk.24.2024.01.10.08.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 08:25:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alex@linutronix.de,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] libpwquality: respect PYTHONSITEDIR
Date: Wed, 10 Jan 2024 17:25:10 +0100
Message-ID: <20240110162510.2579251-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 16:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108217

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
 ...02-Makefile.am-respect-PYTHONSITEDIR.patch | 26 +++++++++++++++++++
 .../libpwquality/libpwquality_1.4.5.bb        |  5 ++--
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/libpwquality/files/0002-Makefile.am-respect-PYTHONSITEDIR.patch

diff --git a/meta-oe/recipes-extended/libpwquality/files/0002-Makefile.am-respect-PYTHONSITEDIR.patch b/meta-oe/recipes-extended/libpwquality/files/0002-Makefile.am-respect-PYTHONSITEDIR.patch
new file mode 100644
index 0000000000..3e41c17cc0
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
+Upstream-Status: Submitted [https://github.com/libpwquality/libpwquality/pull/80]
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
++	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV) install --root ${DESTDIR} --prefix=${prefix} --install-lib=${PYTHONSITEDIR}
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


