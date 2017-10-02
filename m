Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id A9ECE71ADD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Oct 2017 16:07:06 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id u27so6415526pgn.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Oct 2017 09:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XkaORZkQj+4zg38KKZrXAYHLZaRCR38ewuISaePIMNA=;
	b=Abh3zKBCVwUFFfKrEwiAFgo5KN35QZGDWwpahhATDWRiSJ9COBuLhDVjoahigWCNop
	yhLbNwqaHdQ/8JDT5pocgbNkqq45zdolHaRIBKMSE941oMytkhs/NUv0pXwyhG576yv2
	friae0an4/ZzV/BiYHNKUKWRL32vw8JT5YZZ1SppqkbNu7rfS8JuyOzh8HHr+7lO7JbT
	jVt1EHqOZ150blXt9NqmESBGPzY6jcHTfthstTHx1wLm/TiXCjG6kU+tFt9paYnR6vdr
	2tvLHM0NoiB0C6YzX8/yl1IfoycapYESPv/4bnjicDee80zn4fcRMj4DvKs7aHbtmGi0
	xrZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XkaORZkQj+4zg38KKZrXAYHLZaRCR38ewuISaePIMNA=;
	b=aOb5JdO9emxlHOZoZIS8VSPs5tq6TecqdqAsoPWwinh0qOWkv8v/9RsZN8Bk7EqD/d
	k/xZmoNQ6CVtBDiemqsm7VkByTDJ5TbjVfjLwpeU9P+xHu/cCwEVNQCRbD8kMjYTGEby
	Ew3FnpRt7z21st13bKo8SmWM2LFiQPw0AirfXFi4tfQzDgs9JdC+RjFP7iIy84yIo78h
	t+gy2kgz1kR8XSBzv9OvLnPBd2XcMHBP4QdKS6Im9O7zJaa1yFen9dEYcoia1EDpYFG5
	3nCkf5ewKT+jguNyOuqHkvXM+EgOpnH6/60Aqspak5LVHY103xfslylVWsm/Ktmk1Rud
	jU7Q==
X-Gm-Message-State: AHPjjUjg0fMGrwO6lfOCI1EF+iicwPKyzGmnadwKmBvHw3zbfOLN+CiO
	jhpGasv9NjpJdxtZm3YZDtRRDg==
X-Google-Smtp-Source: AOwi7QBiQ/VCax74+xWyDpqykB9CG/8xIAQRVwPLv9eKhUMklBMPmLLXsA17paO6O2PdiQz2tWKw3A==
X-Received: by 10.99.180.7 with SMTP id s7mr12583276pgf.171.1506960427735;
	Mon, 02 Oct 2017 09:07:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f76])
	by smtp.gmail.com with ESMTPSA id
	f2sm17329405pfg.135.2017.10.02.09.07.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Oct 2017 09:07:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Oct 2017 09:06:54 -0700
Message-Id: <20171002160657.39576-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171002160657.39576-1-raj.khem@gmail.com>
References: <20171002160657.39576-1-raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/5] python-m2crypto: Upgrade to 0.26.4
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
X-List-Received-Date: Mon, 02 Oct 2017 16:07:06 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../m2crypto-0.26.4-gcc_macros.patch               | 24 ++++++++++++++++++++++
 ...2crypto_0.26.0.bb => python-m2crypto_0.26.4.bb} |  6 +++---
 2 files changed, 27 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
 rename meta-python/recipes-devtools/python/{python-m2crypto_0.26.0.bb => python-m2crypto_0.26.4.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch b/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
new file mode 100644
index 000000000..2d738cc94
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
@@ -0,0 +1,24 @@
+Imported from Fedora
+
+--- M2Crypto/SWIG/_m2crypto.i	2017-09-26 11:26:33.000000000 +0200
++++ M2Crypto-0.26.4/SWIG/_m2crypto.i	2017-09-26 21:04:14.080330741 +0200
+@@ -7,6 +7,7 @@
+  * Copyright (c) 2009-2010 Heikki Toivonen. All rights reserved.
+  *
+  */
++%import "gcc_macros.h"
+ 
+ %module(threads=1) m2crypto
+ /* We really don't need threadblock (PyGILState_Ensure() etc.) anywhere.
+@@ -15,11 +16,6 @@
+ %nothreadblock;
+ %nothreadallow;
+ 
+-#if SWIG_VERSION >= 0x030000
+-#define __WCHAR_MAX__ __WCHAR_MAX
+-#define __WCHAR_MIN__ __WCHAR_MIN
+-#endif
+-
+ %{
+ #if __GNUC__ < 5
+ #pragma GCC diagnostic ignored "-Wunused-label"
diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
rename to meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb
index 4b4fbbb7c..272c76ca1 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
+++ b/meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb
@@ -6,9 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
 
 SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
             file://cross-compile-platform.patch \
+            file://m2crypto-0.26.4-gcc_macros.patch \
            "
-SRC_URI[md5sum] = "9f02f0b88fbe225cc6ea8680945cafa0"
-SRC_URI[sha256sum] = "05d94fd9b2dae2fb8e072819a795f0e05d3611b09ea185f68e1630530ec09ae8"
+SRC_URI[md5sum] = "5c74c25ba8b45122318a165a3a2059ad"
+SRC_URI[sha256sum] = "5cae7acc0b34821f8c0ddf6665e482893fe1f198ad6379e61ffa9d8e65f5c199"
 
 PYPI_PACKAGE = "M2Crypto"
 inherit pypi setuptools siteinfo
@@ -46,5 +47,4 @@ do_compile_prepend() {
     fi
 }
 
-
 BBCLASSEXTEND = "native"
-- 
2.14.2


