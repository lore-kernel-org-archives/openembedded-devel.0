Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7480C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:18:47 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.11251.1634656726480934902
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CacVoz7d;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 n40-20020a05600c3ba800b0030da2439b21so3268356wms.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mBz+07Rl9yH7f7IQ6l4kGQp6Ao9A7iZsnomxkSCfKl0=;
        b=CacVoz7dJ8qaUAfb6Ex2R/sxFh13v0vEWp6cXsO+C9beDU9Yvju94vumdmMci4BXCE
         5y7paC1Z1hIhfJOl1MaUfM92j525d2fscjnf63S3EI+5MwTJpy0bzAq8OGa9fOyVV4Ep
         caAoSgyLmzq1/s6UYhcv/X3P3NkmQpiT3U1H4O0XaMm+DiD2W3t8NLhzO3k9Hr8XJX+L
         iEl9zIKDtiFrz5RxJxzVS7Av58EcDvxGD8PUM83TfeOP+Ye3Q5mlsORyUr1AWJLLrxn1
         VAfJhP2rC2Gj5qIHoYye1pXrD1elDJhGBuizkrVyFet9o+gEWmG5WIYgi9q1MXm8dYIE
         FvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mBz+07Rl9yH7f7IQ6l4kGQp6Ao9A7iZsnomxkSCfKl0=;
        b=i2GC2LAGOMrqOKzfpb17k7AFyV+FV04323o8jN1fYrcjxek/5SwlcX2Lv7AGUB6JKF
         ZBIqDynd1+QOtnga/qtmbEjXaPV/HS3Xw1ugBfe1ZkBnUrCh0N7aMKSvJebKwNHI0TR2
         SZpYgF0G4H/QRTawW7qdgzyK21tQfWGlwVhlPolxiccYweIV9Ixgw9svUORuNc8PmXX2
         vydPRfuvSSVauf17jOMJKOXOXDi5YvscfXL6cjOFmOY9BEvztBjyXVatkfz9+QA53Gue
         QkjH3WMYlj+7gvMwW1zUeo/4i4XtvmbJfq27oX+Cr1J0goI75ZWhQ9OU4g1j7HO8fvAJ
         RAvA==
X-Gm-Message-State: AOAM5301fvqsXU0mwXtVy0PVgciV9KmeL5LzJG/kzB91U/0aXCtSlZ9M
	wwnXCfQXM60j6GC+eoP9vICnyb0XMaw=
X-Google-Smtp-Source: 
 ABdhPJzaDjGGj5CHAnR6ctKw6IgdawX8bW7+jWjnh4IOPHijM8KOVZEpeyXN1Oq0BCWxPyLlT4Vtfw==
X-Received: by 2002:adf:a154:: with SMTP id
 r20mr45209014wrr.326.1634656724538;
        Tue, 19 Oct 2021 08:18:44 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 z1sm5444256wre.21.2021.10.19.08.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:18:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] protobuf: import a patch from meta-webosose to
 fix building protobuf-c with gold linker
Date: Tue, 19 Oct 2021 17:18:40 +0200
Message-Id: <20211019151841.306791-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 15:18:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93469

* imported from:
  https://github.com/webosose/meta-webosose/commit/9250cad447658cc6cc431572=
cb3b2c606e3fe257

* fixes:
| make[1]: Entering directory '/OE/build/oe-core/tmp-glibc/work/core2-64-oe=
-linux/protobuf-c/1.4.0-r0/build'
| ./x86_64-oe-linux-libtool  --tag=3DCXX   --mode=3Dlink x86_64-oe-linux-g+=
+  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protect=
or-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Df=
ormat-security --sysroot=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-lin=
ux/protobuf-c/1.4.0-r0/recipe-sysroot -std=3Dc++11  -pthread -O2 -pipe -g -=
feliminate-unused-debug-types -fmacro-prefix-map=3D/OE/build/oe-core/tmp-gl=
ibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0=3D/usr/src/debug/protobuf-c/=
1.4.0-r0                      -fdebug-prefix-map=3D/OE/build/oe-core/tmp-gl=
ibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0=3D/usr/src/debug/protobuf-c/=
1.4.0-r0                      -fdebug-prefix-map=3D/OE/build/oe-core/tmp-gl=
ibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/recipe-sysroot=3D           =
           -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-o=
e-linux/protobuf-c/1.4.0-r0/recipe-sysroot-native=3D  -fvisibility-inlines-=
hidden  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=
=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0=
=3D/usr/src/debug/protobuf-c/1.4.0-r0                      -fdebug-prefix-m=
ap=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0=
=3D/usr/src/debug/protobuf-c/1.4.0-r0                      -fdebug-prefix-m=
ap=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0=
/recipe-sysroot=3D                      -fdebug-prefix-map=3D/OE/build/oe-c=
ore/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/recipe-sysroot-nat=
ive=3D  -Wl,-z,relro,-z,now  -fuse-ld=3Dbfd  -o protoc-c/protoc-gen-c proto=
c-c/protoc_gen_c-c_bytes_field.o protoc-c/protoc_gen_c-c_enum.o protoc-c/pr=
otoc_gen_c-c_enum_field.o protoc-c/protoc_gen_c-c_extension.o protoc-c/prot=
oc_gen_c-c_field.o protoc-c/protoc_gen_c-c_file.o protoc-c/protoc_gen_c-c_g=
enerator.o protoc-c/protoc_gen_c-c_helpers.o protoc-c/protoc_gen_c-c_messag=
e.o protoc-c/protoc_gen_c-c_message_field.o protoc-c/protoc_gen_c-c_primiti=
ve_field.o protoc-c/protoc_gen_c-c_service.o protoc-c/protoc_gen_c-c_string=
_field.o protobuf-c/protoc_c_protoc_gen_c-protobuf-c.pb.o protoc-c/protoc_g=
en_c-main.o -lprotobuf -lpthread -lprotoc
| x86_64-oe-linux-libtool: link: x86_64-oe-linux-g++ -m64 -march=3Dcore2 -m=
tune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-strong -O2 -D_FORTIFY_=
SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security --sysroot=
=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/r=
ecipe-sysroot -std=3Dc++11 -pthread -O2 -pipe -g -feliminate-unused-debug-t=
ypes -fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linu=
x/protobuf-c/1.4.0-r0=3D/usr/src/debug/protobuf-c/1.4.0-r0 -fdebug-prefix-m=
ap=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0=
=3D/usr/src/debug/protobuf-c/1.4.0-r0 -fdebug-prefix-map=3D/OE/build/oe-cor=
e/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/recipe-sysroot=3D -f=
debug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/proto=
buf-c/1.4.0-r0/recipe-sysroot-native=3D -fvisibility-inlines-hidden -Wl,-O1=
 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=3D/OE/build/oe-c=
ore/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0=3D/usr/src/debug/p=
rotobuf-c/1.4.0-r0 -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/co=
re2-64-oe-linux/protobuf-c/1.4.0-r0=3D/usr/src/debug/protobuf-c/1.4.0-r0 -f=
debug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/proto=
buf-c/1.4.0-r0/recipe-sysroot=3D -fdebug-prefix-map=3D/OE/build/oe-core/tmp=
-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/recipe-sysroot-native=3D =
-Wl,-z -Wl,relro -Wl,-z -Wl,now -fuse-ld=3Dbfd -o protoc-c/protoc-gen-c pro=
toc-c/protoc_gen_c-c_bytes_field.o protoc-c/protoc_gen_c-c_enum.o protoc-c/=
protoc_gen_c-c_enum_field.o protoc-c/protoc_gen_c-c_extension.o protoc-c/pr=
otoc_gen_c-c_field.o protoc-c/protoc_gen_c-c_file.o protoc-c/protoc_gen_c-c=
_generator.o protoc-c/protoc_gen_c-c_helpers.o protoc-c/protoc_gen_c-c_mess=
age.o protoc-c/protoc_gen_c-c_message_field.o protoc-c/protoc_gen_c-c_primi=
tive_field.o protoc-c/protoc_gen_c-c_service.o protoc-c/protoc_gen_c-c_stri=
ng_field.o protobuf-c/protoc_c_protoc_gen_c-protobuf-c.pb.o protoc-c/protoc=
_gen_c-main.o  -lprotobuf -lpthread -lprotoc -pthread
| /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/re=
cipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/g=
cc/x86_64-oe-linux/11.2.0/ld.bfd: protobuf-c/protoc_c_protoc_gen_c-protobuf=
-c.pb.o:(.data.rel.ro+0x30): undefined reference to `descriptor_table_googl=
e_2fprotobuf_2fdescriptor_2eproto'
| collect2: error: ld returned 1 exit status

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-Fix-linking-error-with-ld-gold.patch | 69 +++++++++++++++++++
 .../protobuf/protobuf_3.18.0.bb               |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-lin=
king-error-with-ld-gold.patch

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-linking-er=
ror-with-ld-gold.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fi=
x-linking-error-with-ld-gold.patch
new file mode 100644
index 0000000000..488c1f6ff9
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-linking-error-wit=
h-ld-gold.patch
@@ -0,0 +1,69 @@
+From ddb9c5147883f8b27b4205450139e4a115d9961f Mon Sep 17 00:00:00 2001
+From: Kyungjik Min <dp.min@lge.com>
+Date: Mon, 28 Dec 2020 15:56:09 +0900
+Subject: [PATCH] Fix linking error with ld-gold
+
+:Release Notes:
+
+:Detailed Notes:
+https://github.com/protocolbuffers/protobuf/issues/6113
+There's a bug in the CMake build leading it to not use the version
+scripts, which hides the problem (because all symbols are now public)
+but doesn't solve it properly.
+
+:Testing Performed:
+
+:QA Notes:
+N/A
+
+:Issues Addressed:
+[PLAT-130467] Fix build error for libgoogleassistant with latest
+              protobuf-3.11.4
+---
+ src/libprotobuf-lite.map | 2 ++
+ src/libprotobuf.map      | 2 ++
+ src/libprotoc.map        | 2 ++
+ 3 files changed, 6 insertions(+)
+
+diff --git a/src/libprotobuf-lite.map b/src/libprotobuf-lite.map
+index 391554669..a1853ca6c 100644
+--- a/src/libprotobuf-lite.map
++++ b/src/libprotobuf-lite.map
+@@ -3,6 +3,8 @@
+     extern "C++" {
+       *google*;
+     };
++    scc_info_*;
++    descriptor_table_*;
+=20
+   local:
+     *;
+diff --git a/src/libprotobuf.map b/src/libprotobuf.map
+index 391554669..a1853ca6c 100644
+--- a/src/libprotobuf.map
++++ b/src/libprotobuf.map
+@@ -3,6 +3,8 @@
+     extern "C++" {
+       *google*;
+     };
++    scc_info_*;
++    descriptor_table_*;
+=20
+   local:
+     *;
+diff --git a/src/libprotoc.map b/src/libprotoc.map
+index 391554669..a1853ca6c 100644
+--- a/src/libprotoc.map
++++ b/src/libprotoc.map
+@@ -3,6 +3,8 @@
+     extern "C++" {
+       *google*;
+     };
++    scc_info_*;
++    descriptor_table_*;
+=20
+   local:
+     *;
+--=20
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.18.0.bb b/meta-oe=
/recipes-devtools/protobuf/protobuf_3.18.0.bb
index 9f501124a0..46ebef9785 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.18.0.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.18.0.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "git://github.com/protocolbuffers/protobuf.gi=
t;branch=3D3.18.x \
            file://0001-protobuf-fix-configure-error.patch \
            file://0001-Makefile.am-include-descriptor.cc-when-building-lib=
p.patch \
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix=
-.patch \
+           file://0001-Fix-linking-error-with-ld-gold.patch \
            "
 S =3D "${WORKDIR}/git"
=20
--=20
2.32.0


