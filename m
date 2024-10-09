Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEAECEE345
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 18:21:33 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.24248.1728498087051256653
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 11:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ex1dDX2q;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c91e5bf6efso1969479a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 11:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728498085; x=1729102885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1YJZuDmpC3Hv5KsZLcOnf0z0djnSHcZxD5iO6HqhGc=;
        b=Ex1dDX2qO/YbaM4F6sJExBzq1pen/D4DsDC5dIMVF8Mlm/T8thLMzjTiGwWC9ydxw3
         BwO/z7vgkQAP+R1ZiyMDuCHkdawVFK8zFqJ2oCuTa6K/Rpc5rqW3h/ReeNxtVagsuPpm
         2BShDiF6QgZdZxv8+W1uwEF7Em3ZTd2qx+HjzB719oKC0Zhxo7Tu6h7rRyMX42bl3ee5
         DnDjTVFiNDKpqg2RkmCoDWgrwZgkhxzeoHH90Lf3H5XMHWHlJZm2los80P6uGdaflp17
         i27Qa8lIHquL3q6vTzVpKWx+BZJ5qNvLXiGnd4MCw/eOAk5FGSZaqGd7upXxqNB8AlvZ
         qrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728498085; x=1729102885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d1YJZuDmpC3Hv5KsZLcOnf0z0djnSHcZxD5iO6HqhGc=;
        b=V099o1GrYFhVpIuyCApA+SiJkC3FaX6PEUlfnJtCn+ek1KPRfQnkWfIWH4T6sHUAkf
         kHQqXRuOVNDCdE67LyupNXXtcnQLslyS2eBiQ5auNYY1t0rjm2w5yHZd8JYXtww46RKF
         jyypD5tgcpVTRIlFgpDe+lt6gutF34iENRF0xlA0YImhdeb0nXKlQyHwBCE9zbu2IS7h
         V+LeijIkgLhfr30YvZJn5OhR1VekK6aRo8eDYiLYdo3WR6POVWDQ/+2IMxB77wqbK2Vj
         rR/LABYrqGhveOWNNYF59G2EYb5+ToNXdyHwdZNSUgquYq4JSm7bvazeaBA4l2pfHqXj
         wQeQ==
X-Gm-Message-State: AOJu0YxiC+0B35p//tZXb13kLpwdDvGO367NOIwv0fQZnlmpwTZ1+jwH
	JhNuhyW8cLov6NRCUCHZIwZBTuqHs3hVU+/0Ckyn86CaLkvvxVg3vdGweA==
X-Google-Smtp-Source: AGHT+IHFL32xk2h65DrQ4mk6YUaR6wEHfwjmKMASctgbeKoWAK3y6ECkDXlBrXvAyibWKBFenKx+5Q==
X-Received: by 2002:a17:907:7f1b:b0:a8d:2281:94d9 with SMTP id a640c23a62f3a-a99a13ae729mr61947666b.23.1728498084896;
        Wed, 09 Oct 2024 11:21:24 -0700 (PDT)
Received: from localhost.localdomain ([176.33.66.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9954cd8395sm446754466b.30.2024.10.09.11.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 11:21:24 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 6/7] python3-colorclass: switch to PEP-517 build backend
Date: Wed,  9 Oct 2024 21:20:30 +0300
Message-Id: <20241009182031.242045-6-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241009182031.242045-1-alperyasinak1@gmail.com>
References: <20241009182031.242045-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 18:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112742

- The project has a proper pyproject.toml which declares the poetry.masonry=
.api PEP-517 backend.

- The PyPi package name (defaults to PN without the python3- prefix), so th=
ere is no need to set PYPI_PACKAGE as colorclass, it is by default.

Fix:

WARNING: python3-colorclass-2.2.2-r0 do_check_backend: QA Issue: inherits s=
etuptools3 but has pyproject.toml with poetry.masonry.api, use the correct =
class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...poetry-core-for-pyproject-base-build.patch | 29 +++++++++++++++++++
 .../python/python3-colorclass_2.2.2.bb        |  4 +--
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-colorclass/=
0001-use-poetry-core-for-pyproject-base-build.patch

diff --git a/meta-python/recipes-devtools/python/python3-colorclass/0001-us=
e-poetry-core-for-pyproject-base-build.patch b/meta-python/recipes-devtools=
/python/python3-colorclass/0001-use-poetry-core-for-pyproject-base-build.pa=
tch
new file mode 100644
index 000000000..3b4d7d233
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-colorclass/0001-use-poetr=
y-core-for-pyproject-base-build.patch
@@ -0,0 +1,29 @@
+From c44c6ed2dc51c22f72b3153daa1f4b0fc7daaa65 Mon Sep 17 00:00:00 2001=0D=
=0D
+From: alperak <alperyasinak1@gmail.com>=0D=0D
+Date: Wed, 9 Oct 2024 20:56:56 +0300=0D=0D
+Subject: [PATCH] Use poetry-core for pyproject base build=0D=0D
+=0D=0D
+https://github.com/python-poetry/poetry-core#why-is-this-required=0D=0D
+=0D=0D
+Upstream-Status: Pending=0D=0D
+=0D=0D
+Signed-off-by: alperak <alperyasinak1@gmail.com>=0D=0D
+---=0D=0D
+ pyproject.toml | 4 ++--=0D=0D
+ 1 file changed, 2 insertions(+), 2 deletions(-)=0D=0D
+=0D=0D
+diff --git a/pyproject.toml b/pyproject.toml=0D=0D
+index 530e2ed..9257f6c 100644=0D=0D
+--- a/pyproject.toml=0D=0D
++++ b/pyproject.toml=0D=0D
+@@ -62,5 +62,5 @@ python =3D ">=3D2.6 || >=3D3.0"=0D=0D
+ pytest =3D "=3D=3D6.0.1"=0D=0D
+ =0D=0D
+ [build-system]=0D=0D
+-requires =3D ["poetry>=3D0.12"]=0D=0D
+-build-backend =3D "poetry.masonry.api"=0D=0D
++requires =3D ["poetry-core>=3D0.12"]=0D=0D
++build-backend =3D "poetry.core.masonry.api"=0D=0D
+-- =0D=0D
+2.25.1=0D=0D
+=0D=0D
diff --git a/meta-python/recipes-devtools/python/python3-colorclass_2.2.2.b=
b b/meta-python/recipes-devtools/python/python3-colorclass_2.2.2.bb
index ff72f4c2f..56142489a 100644
--- a/meta-python/recipes-devtools/python/python3-colorclass_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-colorclass_2.2.2.bb
@@ -4,11 +4,11 @@ LICENSE =3D "MIT"
 SECTION =3D "devel/python"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1b2a533055839e54558a727657c1c73=
e"
=20
-inherit pypi setuptools3
+inherit pypi python_poetry_core
=20
 SRC_URI[sha256sum] =3D "6d4fe287766166a98ca7bc6f6312daf04a0481b1eda43e7173=
484051c0ab4366"
=20
-PYPI_PACKAGE=3D"colorclass"
+SRC_URI +=3D "file://0001-use-poetry-core-for-pyproject-base-build.patch"
=20
 RDEPENDS:${PN} +=3D "\
     python3-ctypes \
--=20
2.25.1


