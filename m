Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id A729A7FE9F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 03:23:26 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id d5so499602pjz.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jan 2020 19:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zTcxtv795qZUnH8SaUumm+EUQrse5nlxMk6TXyMUmS0=;
	b=DCSbRTf6bStrk+U+RduR5WkNj1q50QhuB8KrGvN/WlkZLg5h2CR6L9LR0/WqzUrbXk
	nmZSpPO60gLMnL4eKZGcFxRWMnBAa4iap0J6kNY/aSwhAOXVw1si2lhkru7n59M8y+/4
	F3QspO5nAkEPYId7kMsqP99Tcgc7hHFTnn89clKbcosTGI5XNiIyP1x+iFDmXOMaOoIr
	YoJGSGtA2B9XiO2GUyHQo4iIfLrbHrZ1x66efES23YKMLArYsPSnr9F2UakjZOWq3zAl
	X37DyYdFsDy5zdsG4L4aRPTmT7kc3td9wvTYu8oD0nrNw3H1CZuZmzoVazDq5bgwN4Zk
	MdIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zTcxtv795qZUnH8SaUumm+EUQrse5nlxMk6TXyMUmS0=;
	b=ndCOqhS00CBGAAxhwF5cfLxrO6J6XaB8OFtfzUST4R14hW7misFVgpgAIpnLTyqwIl
	vZxXnlwOVFL1/nxrHNatnRs2pk+cgWMrBuoYClRKMr9HONowbhKMy/V+2gFzBaC3lCT2
	BuLdM5XCOuiHoQVM2CSN/mA+6YuhjmaqnRyTkwcQjkK13FyHqLSSxDvYDOTDfJpV66rC
	UzRT01eLg1XsNA/tJY5Q2ArjQnFrIjxZQWTZzydP8omCm0Cdc7et3Mp9XbeJxv1oa63G
	0iANBqFDt+txU7NFj9gLrxXmEbnJvkNjzuw9CepYHnR5l8mtWRzUR8HhtfN1kub1b/kY
	kM4A==
X-Gm-Message-State: APjAAAWhlcsfxwwMxXvAoCKtz4ekXt0yb53ypmnSC2DKeywr6+/+hLqE
	OAnNwwwASOrpUsuQZ/6AobL0JFLScNE=
X-Google-Smtp-Source: APXvYqxb+IMetuiSmn65WfOZsn+ZEdK27mE8LhMFAt8IwK+qDf5mXhSjZxCtUVClGKnNKLI6WbXjpw==
X-Received: by 2002:a17:90a:c211:: with SMTP id
	e17mr2711071pjt.14.1578540207216; 
	Wed, 08 Jan 2020 19:23:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::9bd6])
	by smtp.gmail.com with ESMTPSA id
	r30sm5657182pfl.162.2020.01.08.19.23.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 19:23:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jan 2020 19:23:16 -0800
Message-Id: <20200109032319.3645429-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109032319.3645429-1-raj.khem@gmail.com>
References: <20200109032319.3645429-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/5] cmpi-bindings: Remove the patch to append 'm' suffix to libpython soname
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
X-List-Received-Date: Thu, 09 Jan 2020 03:23:26 -0000
Content-Transfer-Encoding: 8bit

This otherwise fails to build with py3.8

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...BI-suffix-to-the-python-library-name.patch | 27 -------------------
 .../cmpi-bindings/cmpi-bindings_1.0.1.bb      |  1 -
 2 files changed, 28 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Add-PYTHON_ABI-suffix-to-the-python-library-name.patch

diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Add-PYTHON_ABI-suffix-to-the-python-library-name.patch b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Add-PYTHON_ABI-suffix-to-the-python-library-name.patch
deleted file mode 100644
index b2a149b0f4..0000000000
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Add-PYTHON_ABI-suffix-to-the-python-library-name.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From a701ed30ac1bc2f77d063c237d6ae040a2d53f6b Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 16 May 2016 16:52:24 +0300
-Subject: [PATCH] Add 'm' suffix to the python library name.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- swig/python/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/swig/python/CMakeLists.txt b/swig/python/CMakeLists.txt
-index 128798b..391cef7 100644
---- a/swig/python/CMakeLists.txt
-+++ b/swig/python/CMakeLists.txt
-@@ -49,7 +49,7 @@ ADD_DEFINITIONS(-DCMPI_PLATFORM_LINUX_GENERIC_GNU -DCMPI_VERSION=200)
- SET( NAME pyCmpiProvider )
- ADD_LIBRARY( ${NAME} SHARED ${SWIG_OUTPUT})
- #TARGET_LINK_LIBRARIES( ${NAME} ${PYTHON_LIBRARIES} )
--TARGET_LINK_LIBRARIES( ${NAME} python${PYTHON_MAJOR_VERSION}.${PYTHON_MINOR_VERSION} )
-+TARGET_LINK_LIBRARIES( ${NAME} python${PYTHON_MAJOR_VERSION}.${PYTHON_MINOR_VERSION}m )
- TARGET_LINK_LIBRARIES( ${NAME} pthread )
- TARGET_LINK_LIBRARIES( ${NAME} dl )
- TARGET_LINK_LIBRARIES( ${NAME} util )
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb
index 251c5d0f5a..6e387ae453 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/kkaempf/cmpi-bindings.git;protocol=http \
            file://0001-Modify-cmakelist.patch \
            file://0001-Fix-error.patch \
            file://0001-fix-the-build-error-when-python-3.0.patch \
-           file://0001-Add-PYTHON_ABI-suffix-to-the-python-library-name.patch \
           "
 
 SRCREV = "62f60e065aa1b901f826e4f530c0573ae32d065e"
-- 
2.24.1


