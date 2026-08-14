Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89AFC5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 00:38:31 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3629.1786667905029540431
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 17:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BBmSoFot;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso290089a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 17:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786667904; x=1787272704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jdY/lOIR1MGExyrnjD8lmIKj2GiCEAhKT789Xir8SuQ=;
        b=BBmSoFota8vmHFk3NZ4k3Wa2WP3zI/bAx5mAEUWRp5X/A+ABG3TlGh8JKNB6VIc6PB
         g01gB2TSj74VSJXptNsKOp8O8a3Pja5gTMzCIYCWie2zuhDNGK/XFD+Lr2zB4uwMeV1h
         HltEuQiDtiA+Vt9QEEwX4Up1JJwRDwZANPD1deYmBlEwKegKJeGbzl2YpTI7MSAoqbuj
         TrmvjXqv1/4ae9zIbT2edOQjzv7ZfGnPqUiJ/1CZHOOWiGK1mQCmVJFbvcPpaIJNY8j/
         QOnBLDiLNgmtupqRXAuuL5GW6g5N5Cff09v/B+bOiq4VZBDh1h4tu93F9hzKMVOTN3FA
         4ebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786667904; x=1787272704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jdY/lOIR1MGExyrnjD8lmIKj2GiCEAhKT789Xir8SuQ=;
        b=LO0hGAy2RdXQXAghLafy5zyTrRaNhgHPKk90Hz2PLTZzD8KpaUxTWIp4VewjcVrctE
         sklsqWyFTy+RlqOweWiZFKA1xs3104tb6JZn03tJFV8R1prKkx+OhC99OPO4i2d8MIBi
         s8zl29EYKg191yxazaJoWOm35HUKEzYxmDF1OjsoMzvC2AILePP5szD5PCBksP/Va4Pd
         jO6rBM5kLVq1t1suOpIH+vdnVcWZPkUV0qmtvJzZmdri56K+SCajbB1D+qlKApREKTSe
         smn1uvfnXElEzrjbdHS85xKln0Gep3H8gjbXNmk/WW9JHg0nZW8H19o89mSDiNpUf5Dp
         kH3A==
X-Gm-Message-State: AOJu0YytMvLVkriZwrHHqmVzD4al09AqKfGs2JKxb5Zcd9yTBXrRdbxS
	9gaSsrOlErFb2KnbCX0lDnmMR5WrF5CzOWiXPkZN8ct88iuTxtzLoYJ4ACzafkyK
X-Gm-Gg: AR+sD13spjj+/b8dLAQLt76Fj6LyTml1nYe5bowOk3B1p4p4ojK7QXVdk/HgajG+6ZQ
	WIa7xj697JyeDhY8zi+0c1oGdIO/l1zgrXk9lVUBnb77UASKI387voCq2T7RGNxg8L1N/K/Mzu6
	r2hPQfwqPFyntKgcRK6/DlxBuvWy1aIEcIEUwSnqEJlATQ5u1qy/B0j2lT72DDEgarWZry+BQsr
	OaK/Inz+QTW3enFtMCKZHRaYfXckrhCg94uT30z8cnXblQKmUrQV4fIQ4wXffubaQ5L81LTt6EU
	r/tRHr+SP/cFxCFQWTEfsMjxsswyPzehztBhFX1Nl75akeBl7kcdmsPZTimBiUl3WtBgvQf3UAD
	OCz394p7iUUkvnYLdV1GeOZzoBHnC9oTgwMMboEDtEGOYMw/zDMwsN2l0TAl3MSHDxsrXbzE1Pt
	CNWH+xjuWw025jUiSfsmDDtNx6uLeHwDzaFASbHOMvkfLQltRaPUMmCgZG5k8Ifqz4s3TcUd5r5
	ien1X+zBa9eDjvO4KJQz3s1AtTechH+HNpOtkVkxZ6JbOLR3X/b0EuPhzHoVy3l0JL7fCAs3u5o
	jCBun3yYfA0NX0bTtLgFhKl5yLgNRxLVknhu6YKLcnbNBII/iwZv5ViM8rdhGhgy2QgLHOGMbRi
	GoHxqP1oouDEdzlVcx/xt3zEEkJzf/p0htLg6RwiHFyvQCw==
X-Received: by 2002:a05:6a20:914c:b0:3b4:5c70:ca3e with SMTP id adf61e73a8af0-3cc71da42f8mr1450496637.25.1786667904253;
        Thu, 13 Aug 2026 17:38:24 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm3236209c88.2.2026.08.13.17.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 17:38:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 1/4] python3-fann2: add SWIG py2/py3 C-API compat patch
Date: Thu, 13 Aug 2026 17:38:16 -0700
Message-ID: <20260814003819.1417656-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 00:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129025

fann2.i's HELPER_ARRAY_TEMPLATE typemaps use the Python 2 C-API names
PyInt_Check/PyInt_AsLong/PyInt_FromLong. Python 3.14 no longer ships
any fallback definitions for them, so the SWIG-generated wrapper
fails to compile:

  fann2/fann2_wrap.cxx:10062:41: error: use of undeclared identifier 'PyInt=
_AsLong'; did you mean 'PyLong_AsLong'?

Add a patch mapping them to their PyLong_* equivalents.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...n2.i-add-py2-py3-C-API-compat-macros.patch | 36 +++++++++++++++++++
 .../python/python3-fann2_1.1.2.bb             |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-fann2/0002-=
fann2.i-add-py2-py3-C-API-compat-macros.patch

diff --git a/meta-python/recipes-devtools/python/python3-fann2/0002-fann2.i=
-add-py2-py3-C-API-compat-macros.patch b/meta-python/recipes-devtools/pytho=
n/python3-fann2/0002-fann2.i-add-py2-py3-C-API-compat-macros.patch
new file mode 100644
index 0000000000..03f59b38ba
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-fann2/0002-fann2.i-add-py=
2-py3-C-API-compat-macros.patch
@@ -0,0 +1,36 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Subject: fann2.i: add py2/py3 C-API compat macros
+
+The HELPER_ARRAY_TEMPLATE typemaps in fann2.i use the Python 2 C-API
+names PyInt_Check/PyInt_AsLong/PyInt_FromLong. Python 3.14 no longer
+ships any fallback definitions for them, so the SWIG-generated wrapper
+fails to compile:
+
+  fann2/fann2_wrap.cxx:10062:41: error: use of undeclared identifier 'PyIn=
t_AsLong'; did you mean 'PyLong_AsLong'?
+
+Map them to their PyLong_* equivalents.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+--- a/fann2/fann2.i
++++ b/fann2/fann2.i
+@@ -15,6 +15,18 @@
+ #include "fann_cpp_subclass.h"=0D
+ %}=0D
+=0D
++%{=0D
++#ifndef PyInt_Check=0D
++#define PyInt_Check(x) PyLong_Check(x)=0D
++#endif=0D
++#ifndef PyInt_AsLong=0D
++#define PyInt_AsLong(x) PyLong_AsLong(x)=0D
++#endif=0D
++#ifndef PyInt_FromLong=0D
++#define PyInt_FromLong(x) PyLong_FromLong(x)=0D
++#endif=0D
++%}=0D
++=0D
+ %define HELPER_ARRAY_TEMPLATE( templ , T, GetFunc, SetFunc, cast)=0D
+     %typemap(in) templ<T> *  (templ<T> temp){=0D
+         // templ<T>* type_map in=0D
diff --git a/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb b/m=
eta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
index 3053ca5d71..c2170f6bb0 100644
--- a/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc73b943dc75f6f65=
e007c56ac6515c8f"
 SRC_URI[sha256sum] =3D "cdca0a65ad48e08320672affe38c3dd4ea15e27821e5e1db9f=
a2b34299bdd41e"

 SRC_URI +=3D " file://0001-setup.py-Don-t-hardcode-swig-and-fann2-binary-l=
ocati.patch"
+SRC_URI +=3D " file://0002-fann2.i-add-py2-py3-C-API-compat-macros.patch"

 inherit pypi setuptools3


