Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC42C001B0
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 14:11:51 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.47995.1690207907971359537
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jul 2023 07:11:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=N9cTvEjU;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3fd190065a7so34859975e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 07:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690207906; x=1690812706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wMxYCvO6TPj52EdgbsxqVY03oyYcUhDsWoCTdfe67qM=;
        b=N9cTvEjURS9EbEiEJ1tAN1YMJhPdBP0zptRhLtrqBPgt05aELeVWpZelhELFz8AbMJ
         p+CDXem9EyfLcIevxvx8ieyjMcTHxvuy90VA5liCuZ9BIR5eoGLDedRLkqB7Nmjkb8L4
         2cdFiYdMJ7XWzpfyyl1bQQNdjp2yQwzU2EleqW6K4AP+pEsLJbH41vytlzpau4+kasjr
         tFPYhotH1au3yU1hn64pBKVDldVLGboup16qCFEjTZMmNB9KTnH+Cb2U0X8NfqHQW8YT
         BJYItyQ8s3Woy68B+mfwZc/YyR+PBHKJ6IsaLKBmTNesoOLMljL/d2g8z42lEQJudccs
         6sKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690207906; x=1690812706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wMxYCvO6TPj52EdgbsxqVY03oyYcUhDsWoCTdfe67qM=;
        b=a2AqSvqv0H1P00Gy8JcUubQdoV1lbnuP6Owwnhy1hxLnHpM0uYpE87HmB8R2OXXMw2
         TKYCO4aZcqJYI24CGCpCZ5ZrVhcWwnHRRl2099UT97NTTsca5p6lFuCTPXu0RG6Vp9RK
         erqtq1tgOBJ7trjY6WR8WEKsxE+kYlVZ6PaTDn1ar6vuLguscGbbBBWK/eLo0hRqWRmW
         E81rfr533SiVvYs05yaO+/YEdnLsw/HOGcoZIwUcya+dVTdtn+0ZS5TIFh4YL2AOElt2
         o52yue13pKGGLnyQCvxBC0DTnxkKqbbvkwiWDe9CtucpnZHeWVTwLRmg3i31dcw2zAbS
         7ULg==
X-Gm-Message-State: ABy/qLaEh64beG9O/NU1kfGlN8iXGMXkQdRp4w5yvRVcqVwJLk6Mp78s
	qTw4WCuhHGNFaXunpQFgFX6GHgHYfkg=
X-Google-Smtp-Source: APBJJlHYB3V93fTS4T1wD3AVI05eZYO5MNHa5q8KAN7bm4RV3GV1bSCYXm+L4hSwg1g1zP4bFT0QrQ==
X-Received: by 2002:a17:907:7750:b0:992:4250:5462 with SMTP id kx16-20020a170907775000b0099242505462mr9963765ejc.50.1690201362276;
        Mon, 24 Jul 2023 05:22:42 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id op10-20020a170906bcea00b00989027eb30asm6640591ejb.158.2023.07.24.05.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 05:22:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][dunfell][PATCH] nodejs-14: add -fpermissive BUILD_CXXFLAGS to fix build with gcc-13 on host
Date: Mon, 24 Jul 2023 14:22:27 +0200
Message-ID: <20230724122227.1267568-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 14:11:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103993

Fixes nodejs-native build with gcc-13 on host:
http://errors.yoctoproject.org/Errors/Details/728221/

nodejs-12 doesn't need it yet and nodejs-16 doesn't need it as well

'-DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=3D64' '-D__STDC_FORMAT_MACROS' '-DOPENSS=
L_NO_PINSHARED' '-DOPENSSL_THREADS' '-DV8_TARGET_ARCH_X64' '-DV8_EMBEDDER_S=
TRING=3D"-node.84"' '-DENABLE_DISASSEMBLER' '-DV8_PROMISE_INTERNAL_FIELD_CO=
UNT=3D1' '-DENABLE_MINOR_MC' '-DOBJECT_PRINT' '-DV8_INTL_SUPPORT' '-DV8_CON=
CURRENT_MARKING' '-DV8_ARRAY_BUFFER_EXTENSION' '-DV8_ENABLE_LAZY_SOURCE_POS=
ITIONS' '-DV8_USE_SIPHASH' '-DDISABLE_UNTRUSTED_CODE_MITIGATIONS' '-DV8_WIN=
64_UNWINDING_INFO' '-DV8_ENABLE_REGEXP_INTERPRETER_THREADED_DISPATCH' '-DV8=
_SNAPSHOT_COMPRESSION' -ITOPDIR/tmp-glibc/work/x86_64-linux/nodejs-native/1=
4.18.1-r0/recipe-sysroot-native/usr/include -I../deps/v8 -I../deps/v8/inclu=
de -I.//Release/obj/gen/torque-output-root -I.//Release/obj/gen/generate-by=
tecode-output-root  -pthread -Wno-unused-parameter -m64 -Wno-return-type -f=
no-strict-aliasing -m64 -O3 -fno-omit-frame-pointer -fdata-sections -ffunct=
ion-sections -O3 -fno-rtti -fno-exceptions -std=3Dgnu++1y -MMD -MF .//Relea=
se/.deps/Release/obj.host/v8_initializers/gen/torque-output-root/torque-gen=
erated/../../deps/v8/src/builtins/array-find-tq-csa.o.d.raw -isystemTOPDIR/=
tmp-glibc/work/x86_64-linux/nodejs-native/14.18.1-r0/recipe-sysroot-native/=
usr/include -isystemTOPDIR/tmp-glibc/work/x86_64-linux/nodejs-native/14.18.=
1-r0/recipe-sysroot-native/usr/include -O2 -pipe -c
In file included from /usr/lib/gcc/x86_64-pc-linux-gnu/13/include/g++-v13/b=
its/move.h:37,
                 from /usr/lib/gcc/x86_64-pc-linux-gnu/13/include/g++-v13/b=
its/stl_function.h:60,
                 from /usr/lib/gcc/x86_64-pc-linux-gnu/13/include/g++-v13/f=
unctional:49,
                 from ../deps/v8/src/codegen/code-stub-assembler.h:8,
                 from ../deps/v8/src/builtins/builtins-promise-gen.h:8,
                 from ../deps/v8/src/builtins/builtins-async-gen.h:8,
                 from ../deps/v8/src/builtins/builtins-async-function-gen.c=
c:5:
/usr/lib/gcc/x86_64-pc-linux-gnu/13/include/g++-v13/type_traits: In instant=
iation of =E2=80=98struct std::is_convertible<v8::internal::Cell, v8::inter=
nal::Object>=E2=80=99:
../deps/v8/src/codegen/tnode.h:262:72:   required from =E2=80=98const bool =
v8::internal::is_subtype<v8::internal::Cell, v8::internal::Cell>::value=E2=
=80=99
../deps/v8/src/codegen/tnode.h:346:75:   required by substitution of =E2=80=
=98template<class U, typename std::enable_if<v8::internal::is_subtype<U, v8=
::internal::Cell>::value, int>::type <anonymous> > v8::internal::TNode<v8::=
internal::Cell>::TNode(const v8::internal::TNode<T>&) [with U =3D v8::inter=
nal::Cell; typename std::enable_if<v8::internal::is_subtype<U, v8::internal=
::Cell>::value, int>::type <anonymous> =3D <missing>]=E2=80=99
../deps/v8/src/codegen/code-stub-assembler.h:1868:33:   required from here
/usr/lib/gcc/x86_64-pc-linux-gnu/13/include/g++-v13/type_traits:1417:30: er=
ror: invalid use of incomplete type =E2=80=98class v8::internal::Cell=E2=80=
=99 [-fpermissive]
 1417 |     : public __bool_constant<__is_convertible(_From, _To)>
      |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../deps/v8/src/objects/objects.h:26,
                 from ../deps/v8/src/objects/fixed-array.h:10,
                 from ../deps/v8/src/objects/contexts.h:8,
                 from ../deps/v8/src/execution/thread-local-top.h:10,
                 from ../deps/v8/src/execution/isolate-data.h:12,
                 from ../deps/v8/src/execution/isolate.h:24,
                 from ../deps/v8/src/codegen/interface-descriptors.h:14,
                 from ../deps/v8/src/codegen/callable.h:8,
                 from ../deps/v8/src/codegen/code-factory.h:8,
                 from ../deps/v8/src/compiler/code-assembler.h:17,
                 from ../deps/v8/src/codegen/code-stub-assembler.h:15:
../deps/v8/src/objects/object-list-macros.h:19:7: note: forward declaration=
 of =E2=80=98class v8::internal::Cell=E2=80=99
   19 | class Cell;
      |       ^~~~
In file included from ../deps/v8/src/codegen/interface-descriptors.h:12:
../deps/v8/src/codegen/tnode.h: In instantiation of =E2=80=98const bool v8:=
:internal::is_subtype<v8::internal::Cell, v8::internal::Cell>::value=E2=80=
=99:
../deps/v8/src/codegen/tnode.h:346:75:   required by substitution of =E2=80=
=98template<class U, typename std::enable_if<v8::internal::is_subtype<U, v8=
::internal::Cell>::value, int>::type <anonymous> > v8::internal::TNode<v8::=
internal::Cell>::TNode(const v8::internal::TNode<T>&) [with U =3D v8::inter=
nal::Cell; typename std::enable_if<v8::internal::is_subtype<U, v8::internal=
::Cell>::value, int>::type <anonymous> =3D <missing>]=E2=80=99
../deps/v8/src/codegen/code-stub-assembler.h:1868:33:   required from here
../deps/v8/src/codegen/tnode.h:262:72: error: =E2=80=98value=E2=80=99 is no=
t a member of =E2=80=98std::is_convertible<v8::internal::Cell, v8::internal=
::Object>=E2=80=99
  262 |                                        std::is_convertible<T, Objec=
t>::value);
      |                                                                    =
    ^~~~~

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb b/meta-oe/re=
cipes-devtools/nodejs/nodejs_14.18.1.bb
index 882d3f6573..1d95e369da 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb
@@ -135,6 +135,9 @@ python do_create_v8_qemu_wrapper () {
 do_create_v8_qemu_wrapper[dirs] =3D "${B}"
 addtask create_v8_qemu_wrapper after do_configure before do_compile
=20
+# Work around compatibility issues with gcc-13 on host
+BUILD_CXXFLAGS +=3D "-fpermissive"
+
 LDFLAGS:append:x86 =3D " -latomic"
=20
 # Node is way too cool to use proper autotools, so we install two wrappers=
 to forcefully inject proper arch cflags to workaround gypi
--=20
2.41.0


