Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E77D149EE
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 20:12:33 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.4862.1729887152651389457
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Oct 2024 13:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IxkiO/Q0;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a99f629a7aaso395837866b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Oct 2024 13:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729887151; x=1730491951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RGnO7yFv9szXyJfG4qiWXUt1ZLyZu21PNWV1mKQPBCc=;
        b=IxkiO/Q0RwJ5THBI3nWXq158osjaqSil0WaRkf3O2XrmZDdoGHtj+qNPj5ldSj9Zr+
         UXFENMWOupH/B4uU14dYwNMiNAUTykkFtSHTOQu8OGegp5ewaquJwXzE8Ys83s6CkQP8
         5SvZA8dZLdw8jX2Ry60WtxhF0wr8pOHTf9/TR24Em4+dXYbb9y5qNnFE/aAPvck0nJBl
         9z+Nv0mrm+KqPQDlTV7y4akX60vPmPYdxS++RNa4/HxWiibwJhSTo8XL+sUuEq897eZt
         ToRDi2nIu0B3qhGV2XoQkkG/eoxOm6CoURCnJLRGSXTO1P22uHj1edOeUg15Dekvyq3v
         POWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729887151; x=1730491951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RGnO7yFv9szXyJfG4qiWXUt1ZLyZu21PNWV1mKQPBCc=;
        b=b569JNiMOk5J4j1d5F9h4wsRi2nYR5UWExElnW6GTMi0o35MENhjMOPEavO1UvlgTv
         jkb3LRXLUuXgIovI7p95aJxVTCM8ONixg6LmP3PSb+CmquNPeKo4Ey2bgbIPvDhsBt8h
         nEzILL1/Zthfcyb+HiX7G2KLVOHENYGMvQR3pPJj2/BduoPAjaIf+elyhexoqwie2VnM
         Sgx3yDgcbCZJNXH5lDPzUZrELfgFu0wJCG9Mw81+aV/iTRnlUae4gCNi9TJnqsm8rdFO
         J/e+jQ0KZLMGyKOGCxc/roC8rmmKcmFT+ah9R4RadB3hitkxED3ttrc3Pmmz6Rd+F7oj
         QdOQ==
X-Gm-Message-State: AOJu0YwgG/mjXQV84E2hfXy7cgfPki4szLFAZ1lf+hL/huMewiV1tWci
	0VsFrzmHXMrrwffiHoDHlL2IvTVZlPWjrY5bIySOLdPoAuMRPaCet9NQHQ==
X-Google-Smtp-Source: AGHT+IF0bAGeQkeHJUUyrc47PUhDv3w1KRuAwbnLuUSthoDIe3qknUDe80CQcihYYcovzSqJRLtKtw==
X-Received: by 2002:a17:907:6d1f:b0:a99:f94b:f92e with SMTP id a640c23a62f3a-a9ad1add8e9mr747563766b.27.1729887150854;
        Fri, 25 Oct 2024 13:12:30 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a08496esm101926466b.198.2024.10.25.13.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 13:12:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] flatbuffers: fix native build with gcc-14 on host
Date: Fri, 25 Oct 2024 22:12:23 +0200
Message-ID: <20241025201223.1208803-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Oct 2024 20:12:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113230

In C++ we cannot have both assignment operator and const member. Since
span::operator=3D is defined, span::count_ constness must be removed.

Fixes:

FAILED: CMakeFiles/flatc.dir/src/util.cpp.o
ccache flatbuffers/2.0.0/recipe-sysroot-native/usr/bin/aarch64-webos-linux/=
aarch64-webos-linux-g++ --sysroot=3Dflatbuffers/2.0.0/recipe-sysroot -DFLAT=
BUFFERS_LOCALE_INDEPENDENT=3D1 -Iflatbuffers/2.0.0/git/include -Iflatbuffer=
s/2.0.0/git/grpc -mbranch-protection=3Dstandard -fstack-protector-strong  -=
O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-securi=
ty -Werror=3Dreturn-type -funwind-tables  --sysroot=3Dflatbuffers/2.0.0/rec=
ipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map=
  -fmacro-prefix-map=3Dflatbuffers/2.0.0/git=3D/usr/src/debug/flatbuffers/2=
.0.0  -fdebug-prefix-map=3Dflatbuffers/2.0.0/git=3D/usr/src/debug/flatbuffe=
rs/2.0.0  -fmacro-prefix-map=3Dflatbuffers/2.0.0/build=3D/usr/src/debug/fla=
tbuffers/2.0.0  -fdebug-prefix-map=3Dflatbuffers/2.0.0/build=3D/usr/src/deb=
ug/flatbuffers/2.0.0  -fdebug-prefix-map=3Dflatbuffers/2.0.0/recipe-sysroot=
=3D  -fmacro-prefix-map=3Dflatbuffers/2.0.0/recipe-sysroot=3D  -fdebug-pref=
ix-map=3Dflatbuffers/2.0.0/recipe-sysroot-native=3D  -fvisibility-inlines-h=
idden  -fPIC -DNDEBUG -MD -MT CMakeFiles/flatc.dir/src/util.cpp.o -MF CMake=
Files/flatc.dir/src/util.cpp.o.d -o CMakeFiles/flatc.dir/src/util.cpp.o -c =
flatbuffers/2.0.0/git/src/util.cpp
In file included from ../git/include/flatbuffers/util.h:23,
                 from ../git/src/util.cpp:44:
../git/include/flatbuffers/stl_emulation.h: In member function 'constexpr f=
latbuffers::span<T, Extent>& flatbuffers::span<T, Extent>::operator=3D(cons=
t flatbuffers::span<T, Extent>&)':
../git/include/flatbuffers/stl_emulation.h:549:12: error: assignment of rea=
d-only member 'flatbuffers::span<T, Extent>::count_'
  549 |     count_ =3D other.count_;
      |     ~~~~~~~^~~~~~~~~~~~~~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...span-count_-is-not-const-anymore-722.patch | 27 +++++++++++++++++++
 .../flatbuffers/flatbuffers_2.0.0.bb          |  4 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/flatbuffers/flatbuffers/0001-C=
-stl_emulation-span-count_-is-not-const-anymore-722.patch

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers/0001-C-stl_em=
ulation-span-count_-is-not-const-anymore-722.patch b/meta-oe/recipes-devtoo=
ls/flatbuffers/flatbuffers/0001-C-stl_emulation-span-count_-is-not-const-an=
ymore-722.patch
new file mode 100644
index 0000000000..0a48c665b5
--- /dev/null
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers/0001-C-stl_emulation=
-span-count_-is-not-const-anymore-722.patch
@@ -0,0 +1,27 @@
+From 659def02b6432b62220ed41d7c137dcfd9dfe024 Mon Sep 17 00:00:00 2001
+From: avaliente-bc <56400759+avaliente-bc@users.noreply.github.com>
+Date: Wed, 6 Apr 2022 21:27:37 +0200
+Subject: [PATCH] [C++] stl_emulation span::count_ is not const anymore (#7=
226)
+ (#7227)
+
+In C++ we cannot have both assignment operator and const member. Since
+span::operator=3D is defined, span::count_ constness must be removed.
+---
+Upstream-Status: Backport [https://github.com/google/flatbuffers/commit/20=
aad0c41e1252b04c72111c3eb221280a9c2009]
+
+ include/flatbuffers/stl_emulation.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/flatbuffers/stl_emulation.h b/include/flatbuffers/stl=
_emulation.h
+index 44e9ccbfa..cac87db65 100644
+--- a/include/flatbuffers/stl_emulation.h
++++ b/include/flatbuffers/stl_emulation.h
+@@ -629,7 +629,7 @@ class span FLATBUFFERS_FINAL_CLASS {
+  private:
+   // This is a naive implementation with 'count_' member even if (Extent =
!=3D dynamic_extent).
+   pointer const data_;
+-  const size_type count_;
++  size_type count_;
+ };
+=20
+  #if !defined(FLATBUFFERS_SPAN_MINIMAL)
diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb b/me=
ta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
index 44478ea0b2..1ffb28a198 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
@@ -14,7 +14,9 @@ RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c=
6bd57"
=20
 SRCREV =3D "a9a295fecf3fbd5a4f571f53b01f63202a3e2113"
-SRC_URI =3D "git://github.com/google/flatbuffers.git;branch=3Dmaster;proto=
col=3Dhttps"
+SRC_URI =3D "git://github.com/google/flatbuffers.git;branch=3Dmaster;proto=
col=3Dhttps \
+    file://0001-C-stl_emulation-span-count_-is-not-const-anymore-722.patch=
 \
+"
 S =3D "${WORKDIR}/git"
=20
 CVE_CHECK_IGNORE +=3D "CVE-2020-35864"
--=20
2.47.0


