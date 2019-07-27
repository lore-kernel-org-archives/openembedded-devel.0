Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id EA03E7F1E3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jul 2019 20:06:23 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id r7so26069129pfl.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jul 2019 13:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BIw8drt8FfGvh93+urmRhNPW7U7XaJN62Dw+e8TXT8k=;
	b=AXWb+oqB9TvmRBz5zV06dyVOtUS9ZDjlzNMO5av55NY4jWVcdUWyNQlPkLN8EoA6up
	zGXe+eMKvliqsy/W0CzPP0x0+pTOnKC2GfrXi0UkMQhkDiIOkAstjYQMJ3lLoGTpSHDR
	SYHfYjUQ96Eb++9BwixH0XtTgTbqGbUuDTIf5sPC+gc5ZAtFaE5sJch4OsH9TMLChdX+
	XzlpyYQ+/cDL2LtV8FHX6YnbyTakGfzdbf4wgi8v/A/BItLZpKtSnAUrG6ZZT5R3nvdF
	Kcn5nReUOVjEw1vZ/17OizhrYhHJ/ILJjsBgFicKS78EV3o3r85hQIZgll801HYBc2ig
	DKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BIw8drt8FfGvh93+urmRhNPW7U7XaJN62Dw+e8TXT8k=;
	b=bvmJ8FTy13pNI32CPLMz2VE+VQOp24fNzd8UCYh/b/xr5Pt1rO+24NaaSt3JO1/dEf
	zCWvQ9+2LC/ji4XwCXiPe0yICKw7UPFFSWL+jGew0kruay5dK12k4EmE03sSJeTqhIcn
	lBrrmw5FN/Z0BIGK2NE/tWp2cBIwKiYtKF3Xq+kMFce2pppiYAgUYXtY2DVw6IoGE89L
	r6HvFBtSCuoNWM//USzKA9bgB7fbbR87KSxrBjdufmq4A19KOwrDylze13yAuAx91qUv
	waTuK7PmDofWrSObqgmPhCuCY2GFg2OaUQUKO9s0pVJ2LGr6SZrW9iopRVS6ZLn3rSBI
	EeGg==
X-Gm-Message-State: APjAAAVzsRBVNhT1QZgjfHDRmqL3HuXYC9jOv2SsH8PIHziPkTF7EO7T
	w4bS6wLbJOFs25uhLItvT/ml+Sfc98Y=
X-Google-Smtp-Source: APXvYqysSJblIbqbVhAbm9ekbyesqgyqEVaSQiu975bVGLMoc5g93UYPVuVUA1MkRJsZnkSaZHJRow==
X-Received: by 2002:aa7:9531:: with SMTP id c17mr29807207pfp.130.1564257984505;
	Sat, 27 Jul 2019 13:06:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	q24sm50850554pjp.14.2019.07.27.13.06.23
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 27 Jul 2019 13:06:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Jul 2019 13:06:14 -0700
Message-Id: <20190727200614.5661-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190727200614.5661-1-raj.khem@gmail.com>
References: <20190727200614.5661-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] pegtl: Fix build with clang/libc++
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
X-List-Received-Date: Sat, 27 Jul 2019 20:06:24 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ayoub Zaki <ayoub.zaki@embexus.com>
---
 .../0001-add-missing-virtual-dtors.patch      | 72 +++++++++++++++++++
 meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb |  4 +-
 2 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/pegtl/pegtl/0001-add-missing-virtual-dtors.patch

diff --git a/meta-oe/recipes-extended/pegtl/pegtl/0001-add-missing-virtual-dtors.patch b/meta-oe/recipes-extended/pegtl/pegtl/0001-add-missing-virtual-dtors.patch
new file mode 100644
index 0000000000..829c8ae5cb
--- /dev/null
+++ b/meta-oe/recipes-extended/pegtl/pegtl/0001-add-missing-virtual-dtors.patch
@@ -0,0 +1,72 @@
+From 2c7cc8c669e513154e98762d6ed7c6d1bf338505 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 Jul 2019 12:54:49 -0700
+Subject: [PATCH] add missing virtual dtors
+
+Fixes clang warnings
+/usr/include/c++/v1/memory:3710:5: error: destructor called on non-final 'examples::null_json' that has virtual functions but non-virtual destructor [-Werror,-Wdelete-non-abstract-non-virtual-dtor]
+__data_.second().~_Tp();
+^
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Submitted [https://github.com/taocpp/PEGTL/pull/181]
+---
+ src/example/pegtl/json_classes.hpp | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/example/pegtl/json_classes.hpp b/src/example/pegtl/json_classes.hpp
+index 7227870c..9ea66ce7 100644
+--- a/src/example/pegtl/json_classes.hpp
++++ b/src/example/pegtl/json_classes.hpp
+@@ -58,6 +58,7 @@ namespace examples
+          : json_base( json_type::ARRAY )
+       {
+       }
++      virtual ~array_json() {}
+ 
+       std::vector< std::shared_ptr< json_base > > data;
+ 
+@@ -83,6 +84,7 @@ namespace examples
+            data( in_data )
+       {
+       }
++      virtual ~boolean_json() {}
+ 
+       bool data;
+ 
+@@ -99,7 +101,7 @@ namespace examples
+          : json_base( json_type::NULL_ )
+       {
+       }
+-
++      virtual ~null_json() {}
+       virtual void stream( std::ostream& o ) const override
+       {
+          o << "null";
+@@ -114,6 +116,7 @@ namespace examples
+            data( in_data )
+       {
+       }
++      virtual ~number_json() {}
+ 
+       long double data;
+ 
+@@ -179,6 +182,7 @@ namespace examples
+            data( in_data )
+       {
+       }
++      virtual ~string_json() {}
+ 
+       std::string data;
+ 
+@@ -195,6 +199,7 @@ namespace examples
+          : json_base( json_type::OBJECT )
+       {
+       }
++      virtual ~object_json() {}
+ 
+       std::map< std::string, std::shared_ptr< json_base > > data;
+ 
+-- 
+2.22.0
+
diff --git a/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb b/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb
index f41eef2a01..5cea295c5a 100644
--- a/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb
+++ b/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb
@@ -4,7 +4,9 @@ LICENSE="MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=80cb066ab204c7fe022f1cfe0c2c6818"
 
 SRCREV = "776fa4a1e8bda860008524f6dd9473967c8375b1"
-SRC_URI = "git://git@github.com/taocpp/PEGTL.git;protocol=https;branch=master"
+SRC_URI = "git://git@github.com/taocpp/PEGTL.git;protocol=https;branch=master \
+           file://0001-add-missing-virtual-dtors.patch \
+          "
 
 inherit cmake
 
-- 
2.22.0


