Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9DCB56E668
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 05:21:16 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id d203so45662813iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 22:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9uEItmBZ3lXQO4q7KQDruXXPZXnp3N+BZcCNR3ASyuU=;
	b=Wl3DLcWzJJLM1T5q23lgKNvNT33kI9ngrStxnfAaA7I1ohgMWzUUvKKzf6XnW1cHp0
	RiNWj93raSkG+HtnyN88/BEuhjn+OlgXcPNIvD5VSWhDpSyS8wF+QTfCvvqfirY33ORM
	IAFtp5uVImsYPfZOJjkASUoK+w//QKoB5jKuUBH3yoyWE65jQ0se8Z862OtodopojVA5
	FPl2rPjyHEAM7BCsWH288vO5pTMT04q2faOvLj2PmyLFlReOLTPDFuJ4+Pf9ACzPlYnC
	c+wDe2TJsrxjoC+xElMVhn2asKVUPFInVq6NIgToIFXL5N7WQyk+gCRoUtqspdTZvRr0
	Vcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9uEItmBZ3lXQO4q7KQDruXXPZXnp3N+BZcCNR3ASyuU=;
	b=YXDw2TlupAhsA38k6EojT/rE7+zu4LbP/Lj8rVtdg81gUBxt85RlbxVRZ6B1eXMRz2
	LsBUMd9g3KLDtyC8BxofGWhwGcx/+iqpzbLiSnpDKssXAwGWZh2U+qj9pvDZJclmN8bA
	bv1dn7kIJ2lMhosqtKGwUynG0MbeeMc3oM+P85PipMqSRf287/IFN+eZRIx7TaVLk4OH
	dX+ytEfM0VYEc7jx69nyVteUuGIpmduegKXj8xKw0zhXn2HtN+oUmJkxbj6vM5d4LZ2B
	b8X8KZPBvGrtV3Q3JA6EGHvhcMo7Klmh9IKlAFahSTjaJYx2EDlkn5d70bTI+1m37AQD
	hZgw==
X-Gm-Message-State: AN3rC/4gPhJX8kuhN3W9Ty/jF28uuXl6HlhEHuLESpYkcMne88yF95OK
	bDwhqBzSLKVjkQ==
X-Received: by 10.98.202.80 with SMTP id n77mr23307748pfg.158.1493011277057;
	Sun, 23 Apr 2017 22:21:17 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	v13sm24001176pgo.44.2017.04.23.22.21.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Apr 2017 22:21:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Apr 2017 22:20:44 -0700
Message-Id: <20170424052058.4952-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170424052058.4952-1-raj.khem@gmail.com>
References: <20170424052058.4952-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/17] msgpack-c: Upgrade to 2.1.1
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
X-List-Received-Date: Mon, 24 Apr 2017 05:21:16 -0000

Fix build with gcc7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ntentional-fallthrough-in-case-statements.patch | 39 +++++++++++++++++++++
 .../304ff96d04599401172568d042723ff507e78cc3.patch | 40 ++++++++++++++++++++++
 .../{msgpack-c_2.0.0.bb => msgpack-c_2.1.1.bb}     | 15 +++++---
 3 files changed, 90 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/msgpack/msgpack-c/0001-Comment-intentional-fallthrough-in-case-statements.patch
 create mode 100644 meta-oe/recipes-devtools/msgpack/msgpack-c/304ff96d04599401172568d042723ff507e78cc3.patch
 rename meta-oe/recipes-devtools/msgpack/{msgpack-c_2.0.0.bb => msgpack-c_2.1.1.bb} (62%)

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c/0001-Comment-intentional-fallthrough-in-case-statements.patch b/meta-oe/recipes-devtools/msgpack/msgpack-c/0001-Comment-intentional-fallthrough-in-case-statements.patch
new file mode 100644
index 000000000..a388297a8
--- /dev/null
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-c/0001-Comment-intentional-fallthrough-in-case-statements.patch
@@ -0,0 +1,39 @@
+From 15d8bb6792c9639d85a9ffe2ac81431f1b986c21 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 22 Apr 2017 08:53:50 -0700
+Subject: [PATCH] Comment intentional fallthrough in case statements
+
+Fixes build with gcc7
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/msgpack/v1/adaptor/detail/cpp03_define_array.hpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/include/msgpack/v1/adaptor/detail/cpp03_define_array.hpp b/include/msgpack/v1/adaptor/detail/cpp03_define_array.hpp
+index b35c21a7..4c463a90 100644
+--- a/include/msgpack/v1/adaptor/detail/cpp03_define_array.hpp
++++ b/include/msgpack/v1/adaptor/detail/cpp03_define_array.hpp
+@@ -105,6 +105,7 @@ struct define_array<A0, A1> {
+             switch(size) {
+             default:
+             case 2: ptr[1].convert(a1);
++            //fallthrough
+             case 1: ptr[0].convert(a0);
+             }
+         }
+@@ -193,8 +194,11 @@ struct define_array<A0, A1, A2, A3> {
+             switch(size) {
+             default:
+             case 4: ptr[3].convert(a3);
++            //fallthrough
+             case 3: ptr[2].convert(a2);
++            //fallthrough
+             case 2: ptr[1].convert(a1);
++            //fallthrough
+             case 1: ptr[0].convert(a0);
+             }
+         }
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c/304ff96d04599401172568d042723ff507e78cc3.patch b/meta-oe/recipes-devtools/msgpack/msgpack-c/304ff96d04599401172568d042723ff507e78cc3.patch
new file mode 100644
index 000000000..b8b3d3187
--- /dev/null
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-c/304ff96d04599401172568d042723ff507e78cc3.patch
@@ -0,0 +1,40 @@
+From 304ff96d04599401172568d042723ff507e78cc3 Mon Sep 17 00:00:00 2001
+From: James McCoy <jamessan@debian.org>
+Date: Thu, 13 Apr 2017 11:38:45 -0400
+Subject: [PATCH] Comment the intentional fallthrough to default from
+ _fixed_trail_again
+
+GCC 7 added a new diagnostic, -Wimplicit-fallthrough, which is enabled
+with -Wextra that warns about implicitly falling through a case
+statement.
+
+    [  4%] Building C object CMakeFiles/msgpackc-static.dir/src/unpack.c.o
+    /usr/lib/gcc-snapshot/bin/gcc   -I/home/jamessan/src/msgpack-c/. -I/home/jamessan/src/msgpack-c/include -I/home/jamessan/src/msgpack-c/build/include  -g -O2 -fdebug-prefix-map=/home/jamessan/src/msgpack-c=. -specs=/usr/share/dpkg/no-pie-compile.specs -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2   -Wall -Wextra -Werror -g -O3 -o CMakeFiles/msgpackc-static.dir/src/unpack.c.o   -c /home/jamessan/src/msgpack-c/src/unpack.c
+    In file included from /home/jamessan/src/msgpack-c/src/unpack.c:283:0:
+    /home/jamessan/src/msgpack-c/include/msgpack/unpack_template.h: In function 'template_execute':
+    /home/jamessan/src/msgpack-c/include/msgpack/unpack_template.h:238:17: error: this statement may fall through [-Werror=implicit-fallthrough=]
+                     ++p;
+                     ^~~
+    /home/jamessan/src/msgpack-c/include/msgpack/unpack_template.h:240:13: note: here
+                 default:
+                 ^~~~~~~
+    cc1: all warnings being treated as errors
+
+Adding the comment makes it explicit that the fallthrough is
+intentional, so gcc doesn't complain.
+---
+ include/msgpack/unpack_template.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/msgpack/unpack_template.h b/include/msgpack/unpack_template.h
+index 8450442..e557bb6 100644
+--- a/include/msgpack/unpack_template.h
++++ b/include/msgpack/unpack_template.h
+@@ -236,6 +236,7 @@ msgpack_unpack_func(int, _execute)(msgpack_unpack_struct(_context)* ctx, const c
+ 
+             _fixed_trail_again:
+                 ++p;
++                // fallthrough
+ 
+             default:
+                 if((size_t)(pe - p) < trail) { goto _out; }
diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c_2.0.0.bb b/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.1.bb
similarity index 62%
rename from meta-oe/recipes-devtools/msgpack/msgpack-c_2.0.0.bb
rename to meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.1.bb
index 14e860d6a..7655d9469 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-c_2.0.0.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.1.bb
@@ -6,10 +6,17 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=7a858c074723608e08614061dc044352 \
                     file://COPYING;md5=0639c4209b6f2abf1437c813b208f2d3 \
                     file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c \
                    "
-SRC_URI = "https://github.com/msgpack/msgpack-c/releases/download/cpp-${PV}/msgpack-${PV}.tar.gz"
-SRC_URI[md5sum] = "55148cd856c72f954a6eb9cc889a7d2a"
-SRC_URI[sha256sum] = "41de0989a3385061ab7307a1005655e780def6fc9c89af0ec942616aa787e136"
+
+PV .= "+git${SRCPV}"
+
+SRCREV = "20ef1f925b007f170ab1c257e4aa61fdd0927773"
+
+SRC_URI = "git://github.com/msgpack/msgpack-c \
+           file://0001-Comment-intentional-fallthrough-in-case-statements.patch \
+           "
 
 inherit cmake pkgconfig
 
-S = "${WORKDIR}/msgpack-${PV}"
+S = "${WORKDIR}/git"
+
+FILES_${PN}-dev += "${libdir}/cmake/msgpack/*.cmake"
-- 
2.12.2


