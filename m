Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2CEC77B78
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 17:24:11 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.26204.1683134645399275998
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 May 2023 10:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=msWnPG6y;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3062b101ae1so2862316f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 10:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683134644; x=1685726644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Itq8s7nvXxSR6duwcOL7DYmTk9Kqfg8pPMUyaqWaOdk=;
        b=msWnPG6y9bH/Q95WatAZZMB1ZDD1/9/VXKmJRylfz3fiOjv0zejFVUkS+y5MZHTz4g
         jqZyac2kafxHbZ/gZsg4xGpQYwEwkFUl6wWDAGbqXCKRMbJTDy5kNUNpp6qit3wJw11J
         gF+9JGL9UZN1PQCYsBrLyfYZOMk1Za90Rujl0SfrBfBK3t2e8Px/1PywpFKqELGBEFJ7
         k6REhQKMOeBMuW8fPVmKN4qL86//VtPcor3ODRWlULSdSC04vVOPVyz7wzUNI6gN90cJ
         Tt562Ev18HyHpM+t40L2jg/Ws53+maRzrmpMbUxqHOeAVsyHHwdmDY+HOOaodxVmqZQY
         8wHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683134644; x=1685726644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Itq8s7nvXxSR6duwcOL7DYmTk9Kqfg8pPMUyaqWaOdk=;
        b=cLE/LR8DgTTFval2YmVD+KXvOgsRexgyQsK6CCRiSvnHSlU7m34/0m0gU/TKvyILku
         ImtLAQXT/QktSOx3/VP2j8uEKtemGHkW23XAnjn2fBrCZpvq34Oo1QyUFSt6SsLcKpgX
         c+V4eFqkcn+aZAMf47NQa8GQT3jR6ZI/dInTyVF3DCVPCYJvz+IHMY8X9rQMAQ8tw9pV
         E/G2ps1pWdVPykhXGM34ULmReEsFGQc0SzusZzMSg06GQCxk+iDG4FsFwyzfZO0lPTuD
         j7WCYe07emjdplpROuzKeGheI1/GvhnDYZc6SiClznVWlCKQ1clxS2XLG734MDaxSwkr
         kDog==
X-Gm-Message-State: AC+VfDxEL1CK1HJXTTzZ0ETsxOGkiaRMFmmleJtnbda1YQ49WxiuEa4W
	Ek6TsRzTBdFZK63Demi13zs52ewbfH0=
X-Google-Smtp-Source: ACHHUZ5bEgIlB3TmZOqoRtC0eKOJJEQ0RPF6biIMlWMfkr5MQCi336m9I+pF8YtVivo+3CBKAGRSlw==
X-Received: by 2002:adf:f250:0:b0:306:37a5:447a with SMTP id b16-20020adff250000000b0030637a5447amr586988wrp.60.1683134643929;
        Wed, 03 May 2023 10:24:03 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id u19-20020a7bc053000000b003f09d7b6e20sm2481519wmc.2.2023.05.03.10.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 10:24:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 6/7] rdfind: fix build with -Werror=return-type
Date: Wed,  3 May 2023 19:23:53 +0200
Message-Id: <20230503172354.1439352-6-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230503172354.1439352-1-Martin.Jansa@gmail.com>
References: <20230503172354.1439352-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 17:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102296

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-configure.ac-fix-C-11-support-check.patch | 37 +++++++++++++++++++
 .../recipes-support/rdfind/rdfind_1.5.0.bb    |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-support/rdfind/rdfind/0001-configure.ac=
-fix-C-11-support-check.patch

diff --git a/meta-oe/recipes-support/rdfind/rdfind/0001-configure.ac-fix-C-=
11-support-check.patch b/meta-oe/recipes-support/rdfind/rdfind/0001-configu=
re.ac-fix-C-11-support-check.patch
new file mode 100644
index 0000000000..815939b82d
--- /dev/null
+++ b/meta-oe/recipes-support/rdfind/rdfind/0001-configure.ac-fix-C-11-supp=
ort-check.patch
@@ -0,0 +1,37 @@
+From 9070bc210b2ecff641b73e4ade30040c1461969c Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 3 May 2023 18:31:57 +0200
+Subject: [PATCH] configure.ac: fix C++11 support check
+
+* with -Werror=3Dreturn-type in CFLAGS this test fails with:
+
+  configure:4290: checking for C++11 support or better
+  configure:4303: x86_64-webos-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcor=
e2 -msse3 -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D=
2 -Wformat -Wformat-security -Werror=3Dformat-security -Werror=3Dreturn-typ=
e --sysroot=3D/OE/lge/build/webos/mickledore/BUILD/work/qemux86_64-webos-li=
nux/rdfind/1.5.0-r0/recipe-sysroot -c  -O2 -pipe -g -feliminate-unused-debu=
g-types -fmacro-prefix-map=3D/OE/lge/build/webos/mickledore/BUILD/work/qemu=
x86_64-webos-linux/rdfind/1.5.0-r0/rdfind-1.5.0=3D/usr/src/debug/rdfind/1.5=
.0-r0  -fdebug-prefix-map=3D/OE/lge/build/webos/mickledore/BUILD/work/qemux=
86_64-webos-linux/rdfind/1.5.0-r0/rdfind-1.5.0=3D/usr/src/debug/rdfind/1.5.=
0-r0  -fmacro-prefix-map=3D/OE/lge/build/webos/mickledore/BUILD/work/qemux8=
6_64-webos-linux/rdfind/1.5.0-r0/build=3D/usr/src/debug/rdfind/1.5.0-r0  -f=
debug-prefix-map=3D/OE/lge/build/webos/mickledore/BUILD/work/qemux86_64-web=
os-linux/rdfind/1.5.0-r0/build=3D/usr/src/debug/rdfind/1.5.0-r0  -fdebug-pr=
efix-map=3D/OE/lge/build/webos/mickledore/BUILD/work/qemux86_64-webos-linux=
/rdfind/1.5.0-r0/recipe-sysroot=3D  -fmacro-prefix-map=3D/OE/lge/build/webo=
s/mickledore/BUILD/work/qemux86_64-webos-linux/rdfind/1.5.0-r0/recipe-sysro=
ot=3D  -fdebug-prefix-map=3D/OE/lge/build/webos/mickledore/BUILD/work/qemux=
86_64-webos-linux/rdfind/1.5.0-r0/recipe-sysroot-native=3D  -fvisibility-in=
lines-hidden   conftest.cpp >&5
+  conftest.cpp: In function 'int f()':
+  conftest.cpp:22:20: error: no return statement in function returning non=
-void [-Werror=3Dreturn-type]
+     22 | int f() { auto a=3D1;}                                          =
                                                                           =
                                                                           =
                        |                    ^
+  cc1plus: some warnings being treated as errors
+  ...
+  configure:4308: error: no c++11 support, please set CXXFLAGS properly
+
+* fix the test to pass
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Upstream-Status: Submitted [https://github.com/pauldreik/rdfind/pull/132]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index be1b2fd..9c3513c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -64,7 +64,7 @@ AC_SYS_LARGEFILE
+=20
+ dnl make sure we have c++11 or better,
+ AC_MSG_CHECKING([for C++11 support or better])
+-AC_COMPILE_IFELSE([AC_LANG_PROGRAM([int f() { auto a=3D1;}])],
++AC_COMPILE_IFELSE([AC_LANG_PROGRAM([int f() { auto a=3D1;return a;}])],
+                   [AC_MSG_RESULT([yes])],
+ 		  [AC_MSG_ERROR([no c++11 support, please set CXXFLAGS properly])])
+=20
diff --git a/meta-oe/recipes-support/rdfind/rdfind_1.5.0.bb b/meta-oe/recip=
es-support/rdfind/rdfind_1.5.0.bb
index 8f2c5e8852..dab66c3827 100644
--- a/meta-oe/recipes-support/rdfind/rdfind_1.5.0.bb
+++ b/meta-oe/recipes-support/rdfind/rdfind_1.5.0.bb
@@ -8,6 +8,7 @@ DEPENDS =3D "nettle autoconf-archive"
 SRC_URI =3D "https://rdfind.pauldreik.se/${BP}.tar.gz \
            file://0001-configure-Fix-check-for-AC_CHECK_LIB.patch \
            file://0001-include-standard-headers-limits-and-cstdint.patch \
+           file://0001-configure.ac-fix-C-11-support-check.patch \
 "
=20
 SRC_URI[sha256sum] =3D "4150ed1256f7b12b928c65113c485761552b9496c433778aac=
3f9afc3e767080"
--=20
2.40.1


