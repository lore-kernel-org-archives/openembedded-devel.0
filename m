Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F273C369AE
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 04:17:35 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.4482.1744431440380095585
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Apr 2025 21:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zp/0+2E7;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-225df540edcso38350915ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 21:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744431439; x=1745036239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MacpWD+0PGcPdge0skPFTBn4AbRRrxrX3J94eSk5fqs=;
        b=Zp/0+2E7ELbeHPTBnx938tXKBHbyY/cUrdLvvifj+L1NE8RSG5MdVS3Va+XKe+iqfA
         dmBQ1+McF3MAfo/MtORjtq3pi9/YWJ81CL0NvjlGVbIqhlmX2DB41gEH5ITqXQlkw7WU
         dg6sLEjZs7j+S94lRNWOCX2yf64XhGnjolNGQgT+DaPYa3cx9xrZaf5TmkAJIkHXn1tt
         shi8RuE0Pfw+yq9HRY9f8ph+kfDHwtraDxxGnFdmrPW9u+CagKd8OWKEgOPeka37Okk6
         w+Wq2goxg6Dik9MJASYyKlE2fr3JfqBBDy36Jldr8Q1bnBsnmOscIKxuK/cARCSu51ms
         PAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744431439; x=1745036239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MacpWD+0PGcPdge0skPFTBn4AbRRrxrX3J94eSk5fqs=;
        b=oqDVAEq6F1JDrBKy0LmQjfHRbZKKNwd1DqCNZJQIo0ZGluAEi7USa+tyS5cWeDZoKC
         9erTh8nfuoYL2HXTTargItu1cMDGr/y/MhdppjQ5303VVhPZK34QCapq+hmuo8sQ7o7f
         +bUZ5oljOD1mq35w3MpXliaQDFVEDfNC9l/0JHo0Vn0VfebqDIUnByQUIUNb29f6xXr8
         j6J0X6Wzw/oY1gp4TXQmGrxWddJafZ1py3xPpNzoUzF+uKBFu8r0mR7SlWqe6oPFbyFK
         K/FlwTm+vy76iR2vqUODJ7o2Uv1xMf4zonfSuQ07IU4R9+RfNGt+lUzSWDQDWgA+VPTz
         BF0g==
X-Gm-Message-State: AOJu0Yw6cVPflEh4JiYlzG9hW1REwT1Tw6QkeyZapIKu7gek1JVW4hPA
	3T7cyGNgq6oofvB+owfufXcMk1VI/k7qwT+2PRB3xjstiVEr3ztuDxt4R2zb
X-Gm-Gg: ASbGncsdcEqrbpgY+ojM2NupTv90hJPDTsR8QdbVwWxRob51n3Si55oKQbngJg4/Q5J
	uTd3gmi8rBIfZSEm5ow9++EQBmgGdZjtkNl7zyOXqSkPJdFmfO2NckUipIOYOEDDpYOOApi09Gj
	aJ2syZRvj3jV8Ld6EKJnvhjheuwo+8tLnFySX0giGeMgyxzdHgGo26vWR0sDGP79LWYNy7AXQ+E
	cV3Kk8fY8tl5QfdSAGV/TdnV3wa6VvaXZQGOyZslna1BmUxpcSg3xHbPc1/hOpy3DVVeYjjLiGS
	yz6rajhNxWjFmcqwsIPe6bfV+NMMJZiV
X-Google-Smtp-Source: AGHT+IE1ig7jqPEprlzHpzGvtWQgVZZgMQiCtr58V3IL2q6Gy2QUFfSJGGJe1CgDs+gGjpsYMA5p/g==
X-Received: by 2002:a17:903:1ab0:b0:224:3610:bef4 with SMTP id d9443c01a7336-22b7f9221a9mr143054005ad.25.1744431439169;
        Fri, 11 Apr 2025 21:17:19 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::7ceb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2198c0bsm2501410b3a.23.2025.04.11.21.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 21:17:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-colorclass: Switch to PEP-517 build backend
Date: Fri, 11 Apr 2025 21:17:16 -0700
Message-ID: <20250412041717.4076589-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 04:17:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116806

Use poetry build system

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-pyproject.toml-Use-poetry-core.patch | 30 +++++++++++++++++++
 .../python/python3-colorclass_2.2.2.bb        |  3 +-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-colorclass/=
0001-pyproject.toml-Use-poetry-core.patch

diff --git a/meta-python/recipes-devtools/python/python3-colorclass/0001-py=
project.toml-Use-poetry-core.patch b/meta-python/recipes-devtools/python/py=
thon3-colorclass/0001-pyproject.toml-Use-poetry-core.patch
new file mode 100644
index 0000000000..d3e29d0a15
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-colorclass/0001-pyproject=
.toml-Use-poetry-core.patch
@@ -0,0 +1,30 @@
+From 32a8a6bff42dfa493ae3c4a722109f2d3a32108e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 11 Apr 2025 19:14:16 -0700
+Subject: [PATCH] pyproject.toml: Use poetry-core
+
+Needed for using latest poetry infrastructure
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pyproject.toml | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 65eaec9..50d26cc 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -58,9 +58,9 @@ documentation =3D "https://github.com/matthewdeanmartin/=
colorclass"
+ # per vermin's estimation=0D
+ python =3D ">=3D2.6 || >=3D3.0"=0D
+ =0D
+-[tool.poetry.dev-dependencies]=0D
++[tool.poetry.group.dev.dependencies]=0D
+ pytest =3D "=3D=3D6.0.1"=0D
+ =0D
+ [build-system]=0D
+-requires =3D ["poetry>=3D0.12"]=0D
+-build-backend =3D "poetry.masonry.api"=0D
++requires =3D ["poetry-core"]=0D
++build-backend =3D "poetry.core.masonry.api"=0D
diff --git a/meta-python/recipes-devtools/python/python3-colorclass_2.2.2.b=
b b/meta-python/recipes-devtools/python/python3-colorclass_2.2.2.bb
index e605b459ce..498682cd6d 100644
--- a/meta-python/recipes-devtools/python/python3-colorclass_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-colorclass_2.2.2.bb
@@ -4,8 +4,9 @@ LICENSE =3D "MIT"
 SECTION =3D "devel/python"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1b2a533055839e54558a727657c1c73=
e"
=20
-inherit pypi setuptools3
+inherit pypi python_poetry_core
=20
+SRC_URI +=3D "file://0001-pyproject.toml-Use-poetry-core.patch"
 SRC_URI[sha256sum] =3D "6d4fe287766166a98ca7bc6f6312daf04a0481b1eda43e7173=
484051c0ab4366"
=20
 PYPI_PACKAGE =3D "colorclass"

