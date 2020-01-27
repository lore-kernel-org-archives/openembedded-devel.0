Return-Path: <andrey.z@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8B55D6BAAB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 17:38:52 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b2so236860wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 09:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Z/8fGbufeYeoFhe9clvfiyon64WcjRNZruR41ODY8Hc=;
	b=eANtorOMA2qagm2/4IxPefeWvvY+QWWk6mI+/64K01ROAr8+49Vb/lwNW0kRVf1iyI
	t2lQF8q1jBt34Eh51P2Kkq3NNuwLOCl8UkqIzxLzfKxSZkvhThQBaKcpHmLGHRJRXc2f
	OixaX4WIkj2Yn7BSPHoeMnEvoRjPhy3FkeYVXWQ8BeCAMlWkBHBXXEifOwR60JIjBOEN
	nW3u6GR7Euz8PW1YA1u8aLc5mJLdhtZP7O2fW2H71+BPRQ5Qmvvwi9S14QBIhajz27yv
	3sjPiOAn8lmsMlbLQhPN4aLJEA6yMjPg5gYVd41auILhtXBjYmACJTmjtSNxuPakSQ+o
	Pciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Z/8fGbufeYeoFhe9clvfiyon64WcjRNZruR41ODY8Hc=;
	b=dRhkl7+M6xYGttIvkBmjrKNYgezEUKMqHea/r2NNuRmjfgWkQeGQaDzlDkrtAjXwql
	CQ6BtCzoTmCX8AswPk5L8L7lLDMPm8b3UdrC7pMxSpgEP9Fylum7tqtSxc0jY2yaz0tX
	rD0svYbUgx4ZyOMJ1Tu36qSuNECTPnsFGirJ+sdd+H6ZZZa8pNo7JePXfNYsOfggCT8N
	9HI6Lq73OU6dUIGG3ucpjeKy6/8+rZQIs72dETsuoGkfdJwMQltcIdTnCChqkI6hGSkt
	uFc9VlWHk7zwNdO7viO5lOaGoB+8yQWdGjaIljhtEUWUD4tevLX+xs6Q9hqmE2hX2418
	yhZQ==
X-Gm-Message-State: APjAAAXrXrGCkDxk8cCFfHGzugCfICW02lvW/vRRpVszpeiNYEv9x1yG
	Wz4F536S0Z76kpW7+8GOfyEtgRA8GiA=
X-Google-Smtp-Source: APXvYqzfC+x1grerx04Lv00eyYqmeaU7rnH2F4mt0P3au2NHF/pXfK1/C5JibN+Jhep79HiA49XQCg==
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr170505wmi.118.1580146733134; 
	Mon, 27 Jan 2020 09:38:53 -0800 (PST)
Received: from aherlnxbspsrv01.lgs-net.com ([193.8.40.126])
	by smtp.gmail.com with ESMTPSA id
	g2sm21119676wrw.76.2020.01.27.09.38.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 09:38:52 -0800 (PST)
From: Andrey Zhizhikin <andrey.z@gmail.com>
X-Google-Original-From: Andrey Zhizhikin
	<andrey.zhizhikin@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jan 2020 17:38:45 +0000
Message-Id: <20200127173845.24921-1-andrey.zhizhikin@leica-geosystems.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] opensaf: update recipe to use python3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Jan 2020 17:38:52 -0000

From: Andrey Zhizhikin <andrey.z@gmail.com>

Update recipe to include support for python3. Introduce a patch which
converts samples to utilize pytho3 on the target.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 ...0001-immom_python-convert-to-python3.patch | 50 +++++++++++++++++++
 .../opensaf/opensaf_5.19.10.bb                |  5 +-
 2 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-immom_python-convert-to-python3.patch

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-immom_python-convert-to-python3.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-immom_python-convert-to-python3.patch
new file mode 100644
index 000000000..f45874680
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-immom_python-convert-to-python3.patch
@@ -0,0 +1,50 @@
+From ffc829603a2c50674c8e04de5221e43f80bfc1b2 Mon Sep 17 00:00:00 2001
+From: Andrey Zhizhikin <andrey.z@gmail.com>
+Date: Mon, 27 Jan 2020 13:00:53 +0000
+Subject: [PATCH] immom_python: convert to python3
+
+Convert immom_python to use python3, python2 is EOL and is not supported
+by all distributions anymore.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
+---
+ samples/immsv/immom_python/immom.py         | 2 +-
+ samples/immsv/immom_python/immomexamples.py | 2 +-
+ samples/immsv/immom_python/immomtest.py     | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/samples/immsv/immom_python/immom.py b/samples/immsv/immom_python/immom.py
+index 4f68625ed..f88197000 100755
+--- a/samples/immsv/immom_python/immom.py
++++ b/samples/immsv/immom_python/immom.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/python
++#!/usr/bin/env python3
+ """
+ immom -- An IMM Object Manager in Python
+ 
+diff --git a/samples/immsv/immom_python/immomexamples.py b/samples/immsv/immom_python/immomexamples.py
+index 70c579265..bd693c25f 100755
+--- a/samples/immsv/immom_python/immomexamples.py
++++ b/samples/immsv/immom_python/immomexamples.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#!/usr/bin/env python3
+ 
+ import immom
+ 
+diff --git a/samples/immsv/immom_python/immomtest.py b/samples/immsv/immom_python/immomtest.py
+index 4b98bea8c..ed2463ba9 100755
+--- a/samples/immsv/immom_python/immomtest.py
++++ b/samples/immsv/immom_python/immomtest.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+ 
+ import immom
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.19.10.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.19.10.bb
index a7eb4c849..d969daac5 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.19.10.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.19.10.bb
@@ -14,7 +14,7 @@ SECTION = "admin"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a916467b91076e631dd8edb7424769c7"
 
-DEPENDS = "libxml2 python"
+DEPENDS = "libxml2 python3"
 TOOLCHAIN = "gcc"
 
 SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
@@ -26,6 +26,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch \
            file://0001-Add-configure-time-check-for-gettid-API.patch \
            file://0001-create_empty_library-Use-CC-variable-intead-of-hardc.patch \
+           file://0001-immom_python-convert-to-python3.patch \
            "
 SRC_URI[md5sum] = "9b61df01d1a092101c4a626692edae19"
 SRC_URI[sha256sum] = "6da9af96e8ee58d11031d305bf4804a00deb6108e12e422722882a2091bd34bd"
@@ -66,7 +67,7 @@ FILES_${PN}-staticdev += "${PKGLIBDIR}/*.a"
 
 INSANE_SKIP_${PN} = "dev-so"
 
-RDEPENDS_${PN} += "bash python"
+RDEPENDS_${PN} += "bash python3"
 
 # http://errors.yoctoproject.org/Errors/Details/186970/
 COMPATIBLE_HOST_libc-musl = 'null'
-- 
2.17.1


