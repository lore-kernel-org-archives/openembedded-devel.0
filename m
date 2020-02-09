Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id C54E660CED
	for <openembedded-devel@openembedded.org>;
	Sun,  9 Feb 2020 16:17:33 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id n7so2439209pfn.0
	for <openembedded-devel@openembedded.org>;
	Sun, 09 Feb 2020 08:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AY35JJvw9sjNnmcFXxre/QjxnVbezLojIiM1GVpDewY=;
	b=i0FW+gG5Y+C8yuTu2hF3szQ+uU4aSNOlmXh+u4aCD187CR7FTiHaGEQgnbUnJbX91j
	J68I9UgOK0SnNSNDgQh07Xo3F8uWNOUdxVRh6KrivWAO9Q/1LepZb9cyqt2PGpmPWnb0
	AqL1/ySiJP3HpsJ6a9Bt52bTPx/BXkrsfX4+5MZiqyAxP6KFqFNZ2PW+Vurlpt32YTLt
	Ut54OtpqJxdu9/llvHOMPpChhO1jG40OveIlfBPV2O2ngGdpv/FC2lce1M7c6G2PY/5Q
	RNUqlcZsBb4mt6BdBFLnPLkOcwZkdrjZ09sf3+BaUcN0ui9MDolAkloxu0GVGJZYAKn8
	rJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AY35JJvw9sjNnmcFXxre/QjxnVbezLojIiM1GVpDewY=;
	b=nRwvl7nutmNiUEDKwfn8qVA+lcTDr2c4Te4W9rdznWnlNBITGQ2X2gR41XdnrfMXRR
	69sfRG7qwK/S+tSlSLh59wjZ7F7Vny+egrB72jAMnmgXZ9OwS2ZFhbzlGungvYei4OiT
	mVqemSQJr0it6E3uWwXT9WTSZWdqQDm/LWTJzH+RqCtvVFsexErApAyMQZGoF3LRQUSD
	1GzK0T13DL7V7mewvIo+xxhuRLNKmFDTmHF5XbLmfLwZTc+SSR+vTbJFnmeBzj5rr5EL
	gmSrwUujEqE9iNIvdbcPzDiAdUDalM0B0xocdU9nc0rXfcFIAc8LYF//yOCIQArojqxk
	WDog==
X-Gm-Message-State: APjAAAV1XzKTK3gSl6RHkKSZTulpjMN7GdXOVKFRBbMnvnpVVSjEhV6K
	tuHDJ01xrS7RB2SlsFKVXvJGP8IL
X-Google-Smtp-Source: APXvYqyXaKwx9WpxfsXGCfXqYVeFhmYvcwN6M8I/N3QGOTO8Rk3OJqAeGadIg0HOFet6ajzYSG6BGA==
X-Received: by 2002:a63:ed49:: with SMTP id m9mr9695395pgk.304.1581265054509; 
	Sun, 09 Feb 2020 08:17:34 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	a19sm8831737pju.11.2020.02.09.08.17.33
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:17:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Sun,  9 Feb 2020 08:17:19 -0800
Message-Id: <bb65c27a772723dfe2c15b5e1b27bcc1a1ed884c.1581264950.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264950.git.akuster808@gmail.com>
References: <cover.1581264950.git.akuster808@gmail.com>
Subject: [zeus 11/11] fluentbit: Fix packaging in multilib env
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
X-List-Received-Date: Sun, 09 Feb 2020 16:17:34 -0000

From: Khem Raj <raj.khem@gmail.com>

Fixes
ERROR: fluentbit-0.12.19-r0 do_package: QA Issue: fluentbit: Files/directories were installed but not shipped in any package:
/usr/lib/libfluent-bit.so
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 99fe1dec83456100e0bc1c02581defa7aaf04a16)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../fluentbit/fluentbit/cmake_multilib.patch   | 18 ++++++++++++++++++
 .../fluentbit/fluentbit_0.12.19.bb             |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/cmake_multilib.patch

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/cmake_multilib.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/cmake_multilib.patch
new file mode 100644
index 0000000000..8fe9f3e703
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/cmake_multilib.patch
@@ -0,0 +1,18 @@
+Use CMAKE_INSTALL_LIBDIR instead of hardcoding lib path
+
+Helps build on platforms where libpaths are not lib/ but say lib64/
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -182,7 +182,7 @@ if(NOT FLB_WITHOUT_SHARED_LIB)
+     PROPERTIES OUTPUT_NAME fluent-bit)
+ 
+   # Library install routines
+-  install(TARGETS fluent-bit-shared LIBRARY DESTINATION lib)
++  install(TARGETS fluent-bit-shared LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ endif()
+ 
+ # Static Library
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.19.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.19.bb
index e50aa71a9f..27b910b8be 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.19.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.19.bb
@@ -4,6 +4,7 @@ BUGTRACKER = "https://github.com/fluent/fluent-bit/issues"
 
 SRC_URI = "http://fluentbit.io/releases/0.12/fluent-bit-${PV}.tar.gz \
            file://jemalloc.patch \
+           file://cmake_multilib.patch \
            "
 SRC_URI[md5sum] = "7c8708312ac9122faacf9e2a4751eb34"
 SRC_URI[sha256sum] = "23a81087edf0e2c6f2d49411c6a82308afc5224f67bbaa45729c057af62e9241"
-- 
2.17.1


