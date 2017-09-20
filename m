Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id D2FBA77F7D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 14:19:25 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id b1so1828429qtc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 07:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BYZedNKQygBavdoRh4HM8F6dmQUpvJ14657reaKRMDo=;
	b=hFlZ8F+1hMT+PJPICD1Y0KRU+po49yHwYNGss3eCNJqXX4cKjEa/5VePo/nh2rrMCz
	ypCBSQuoW2p+qPAnd2KxtPnVNAFSDh9oYEC5GRVXrnl7+ZagnOpgvFbnS+mLRHnI2bQu
	sfj8qBSqOJwdqlbbq2BbbdndgC5cjwqgYKv33fylfUBKs+byMNV0qVkuJyuSuIuk5uuo
	Guer+J+9wTn1sWhlOZLlHjXWJ7aSVCZK6x1Hu5dZBxmavEusHoCUL2ln6Klk1vhos3S4
	ZAUdvyHduau9ssn9LDYJ3ISRqHYJsk/aAmmvbKZbq2S0uFmiAJ8ebJ3CgUd71YE0NJC3
	RGvg==
X-Gm-Message-State: AHPjjUiOEzEfZAsUG9XUPvbwUmxaspEAJXnkTqukmFG44Tk8Lzyjqi7V
	V10mtU7+lAuB1odqgu+ZcXPINVMR
X-Google-Smtp-Source: AOwi7QAsW5vzAyAYFwNbTt1H+b8QQWQpCAvCuy2HOSj1EZMiGE+Py3xzBXaieqKsQEE/AjP/tEw09A==
X-Received: by 10.200.15.170 with SMTP id b39mr8330946qtk.52.1505917166696;
	Wed, 20 Sep 2017 07:19:26 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	o17sm1428369qkl.14.2017.09.20.07.19.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Sep 2017 07:19:26 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Sep 2017 10:19:18 -0400
Message-Id: <1505917158-21394-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] msgpack-c: update to version 2.1.5
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
X-List-Received-Date: Wed, 20 Sep 2017 14:19:26 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...ntentional-fallthrough-in-case-statements.patch | 39 ----------------------
 .../{msgpack-c_2.1.1.bb => msgpack-c_2.1.5.bb}     |  3 +-
 2 files changed, 1 insertion(+), 41 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/msgpack/msgpack-c/0001-Comment-intentional-fallthrough-in-case-statements.patch
 rename meta-oe/recipes-devtools/msgpack/{msgpack-c_2.1.1.bb => msgpack-c_2.1.5.bb} (83%)

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c/0001-Comment-intentional-fallthrough-in-case-statements.patch b/meta-oe/recipes-devtools/msgpack/msgpack-c/0001-Comment-intentional-fallthrough-in-case-statements.patch
deleted file mode 100644
index a388297..0000000
--- a/meta-oe/recipes-devtools/msgpack/msgpack-c/0001-Comment-intentional-fallthrough-in-case-statements.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 15d8bb6792c9639d85a9ffe2ac81431f1b986c21 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 22 Apr 2017 08:53:50 -0700
-Subject: [PATCH] Comment intentional fallthrough in case statements
-
-Fixes build with gcc7
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/msgpack/v1/adaptor/detail/cpp03_define_array.hpp | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/include/msgpack/v1/adaptor/detail/cpp03_define_array.hpp b/include/msgpack/v1/adaptor/detail/cpp03_define_array.hpp
-index b35c21a7..4c463a90 100644
---- a/include/msgpack/v1/adaptor/detail/cpp03_define_array.hpp
-+++ b/include/msgpack/v1/adaptor/detail/cpp03_define_array.hpp
-@@ -105,6 +105,7 @@ struct define_array<A0, A1> {
-             switch(size) {
-             default:
-             case 2: ptr[1].convert(a1);
-+            //fallthrough
-             case 1: ptr[0].convert(a0);
-             }
-         }
-@@ -193,8 +194,11 @@ struct define_array<A0, A1, A2, A3> {
-             switch(size) {
-             default:
-             case 4: ptr[3].convert(a3);
-+            //fallthrough
-             case 3: ptr[2].convert(a2);
-+            //fallthrough
-             case 2: ptr[1].convert(a1);
-+            //fallthrough
-             case 1: ptr[0].convert(a0);
-             }
-         }
--- 
-2.12.2
-
diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.1.bb b/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb
similarity index 83%
rename from meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.1.bb
rename to meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb
index 7655d94..d9f6956 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.1.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb
@@ -9,10 +9,9 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=7a858c074723608e08614061dc044352 \
 
 PV .= "+git${SRCPV}"
 
-SRCREV = "20ef1f925b007f170ab1c257e4aa61fdd0927773"
+SRCREV = "7a98138f27f27290e680bf8fbf1f8d1b089bf138"
 
 SRC_URI = "git://github.com/msgpack/msgpack-c \
-           file://0001-Comment-intentional-fallthrough-in-case-statements.patch \
            "
 
 inherit cmake pkgconfig
-- 
2.7.4


