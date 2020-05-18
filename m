Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.40997.1589805274667023005
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 05:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@stusta.de header.s=default header.b=O9nF2z97;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=l5hx=7a=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49QdkG3sVvz2f
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 14:34:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589805270;
	bh=3aE302O4FyCVMO1+G23TKgGQD667KJf+wYK627f0BZA=;
	h=From:To:Subject:Date:From;
	b=O9nF2z979TUKeOZ206wl80BY4U9fhk2k6eMrsHUG1DwCN+rxI1EhucjtTXZKXTObz
	 xSo6qtCIPtr4swMSDrB4FpX7JP9iaFf88il75EPZpM3WOOSPplsDv6R8Wk71/HAx7w
	 iEmYEfpznaUQ7zejbnnfNkt1Cj1rm2tizVhrCddNEfAHVd5pbYHgOOgAojkSGRxxi6
	 c83bDUD8aO+CEHX+rFrC9uwmpt2zXNPGwug6EX+oOLpvsJc2CHbo/Zukazszd1faVV
	 zhwGUdy9D1fcwKuUgb8wLSSsM5aak3TyYcWx/NbUOOq5Hj2RF28D1XpsKLxZHPzrT5
	 ilWK2/0YSbta9iJriZOC6qVqm8dp6b72MkBNtEcMQ5FU3/9KHzEYXMGGjBSbbWq5Ec
	 kxhQVnuVx1n0aEqF/E8mGrC6b/iFlj/YjXJUNwurOxcMbEq7QNLLwoywpmnDM8Cx9y
	 gtMDYUZPqChWTBoFSLmV3pnuU7aV7b5Kr0ahZ8zN0ZLnAN+a1PKb8d58ivwB+0O4fk
	 rWauaOxADsAO/fuRtaABlGMms8l83+wMBRFpRvqB9b+CmrPycp0cSSECM3cqL4xNXC
	 CexdNPCSh5gZqipqkW9gZaDeDcGeziBvIdghgfIV+GT0Os+TmnH0sAvPVtdgOc8Grs
	 ZsFRvYQWTXfcKG/beO2nY5mA=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][warrior][PATCH] desktop-file-utils: remove - a more recent version is in oe-core
Date: Mon, 18 May 2020 15:34:28 +0300
Message-Id: <20200518123428.31974-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Andreas M=C3=BCller <schnitzeltony@gmail.com>

Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
[ desktop-file-utils was already in the Yocto 2.7 release of OE-core ]
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../desktop-file-utils_0.18.bb                 | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/desktop-file-utils/desktop-f=
ile-utils_0.18.bb

diff --git a/meta-gnome/recipes-gnome/desktop-file-utils/desktop-file-uti=
ls_0.18.bb b/meta-gnome/recipes-gnome/desktop-file-utils/desktop-file-uti=
ls_0.18.bb
deleted file mode 100644
index 57a8720f2..000000000
--- a/meta-gnome/recipes-gnome/desktop-file-utils/desktop-file-utils_0.18=
.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/desktop-file-util=
s"
-DESCRIPTION =3D "desktop-file-utils contains a few command line utilitie=
s for working with desktop entries:"
-LICENSE =3D "GPLv2+"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
-
-DEPENDS =3D "glib-2.0"
-
-PR =3D "r1"
-
-SRC_URI =3D "http://www.freedesktop.org/software/desktop-file-utils/rele=
ases/desktop-file-utils-${PV}.tar.bz2"
-SRC_URI[md5sum] =3D "d966b743eb394650f98d5dd56b9aece1"
-SRC_URI[sha256sum] =3D "d9449956c1c8caa75281a3322b2bb433db42610942f0ceea=
a65ccd9636c04231"
-
-inherit autotools pkgconfig
-
-CACHED_CONFIGUREVARS +=3D "ac_cv_prog_EMACS=3Dno"
-
-BBCLASSEXTEND =3D "native"
--=20
2.17.1

