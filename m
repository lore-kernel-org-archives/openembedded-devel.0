Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F52DC54E58
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 20:58:09 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.7314.1710363484379142136
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Mar 2024 13:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SfIWC1An;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3662fd7ae8cso1904855ab.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 13:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710363183; x=1710967983; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n+E84cx/ungd37DXiIfjtowiPKcpaSosX/BtdxXZRtQ=;
        b=SfIWC1Ana3iVnorMC268C+2UFbTWrvrpiFReEP6hZE3buW0uimqcYLbM4cc8PdRhnZ
         fwUMKT0OXVqv5+NmAUYdAhuJoTBs5rS7XDfKA+QSnWMtP3KzbCBvHOM66S0mjfZwjgX2
         ta5NtBdx9h1fKu+0Bo+K0Go0EsY9UbMfnzQDGXIhhN2XhYaHjedGoaeYyQUlcNRnZ7LT
         NN7zH5PONiysx7Db3IhAYegNJqUoW+3jVSMpRD2l8YeR+HRM9+iZcEAWKwNCcsGfon9v
         CIG0H73658h/hqDiOc+6O78cxXuLa8glo2xZz9yXy7PbvDNtkQTjEBUeikMYil2Xs9i/
         cQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710363183; x=1710967983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+E84cx/ungd37DXiIfjtowiPKcpaSosX/BtdxXZRtQ=;
        b=thiK2zxo2YeDMrJLx+4ELfLxi/ygeT/lxN6USrmUS8Rw7g9pByZINpqqAR3AZi45+n
         PpBJrBZS9401nieSL+W7nKkpqsQHjzgMDHaVVjAx+rfaNXLwIiVgx95OMKwMge3CWDFq
         t1StlIupj8DHGiQMfY+y90A7cJP7Ld0D1aoKBM/WMztRb7F03ZBvQrLRUxiuNRCPLQ+1
         4YLvbY9+7MoLtRmydZN6xWNE9UZMk0PQV7nFp2dIXu0Ke3djWtlXWQb3x7VL5mGs0fb6
         /SVZZwhZYaEUWe1w0KpUrKCiqKlAYG1R2zUnzR7fHqLrrvhhkXdbRENXP8tFMi5uUEI7
         9XUA==
X-Gm-Message-State: AOJu0YwRYbtp2JCWstyUULfi/jDLzsIC5Lgn47VAfdLK0KWcJAIMLB+H
	mLlKvczzpwR9c0tr9Xjq2OfAyF4oyOgVowphhSWjWGcvUMTAssh9Un8IU6MYJoU=
X-Google-Smtp-Source: AGHT+IGR7qqDuyLCLQtR9HHL0wTRosg0UTqJTZ3mh1IDIKRM9a3Up+0uI0SGWWNNBsjKRHMzHhrVxg==
X-Received: by 2002:a92:cdab:0:b0:366:46d1:ccc3 with SMTP id g11-20020a92cdab000000b0036646d1ccc3mr1277218ild.29.1710363183406;
        Wed, 13 Mar 2024 13:53:03 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id k18-20020a056e0205b200b00363ea5c0fb4sm31022ils.70.2024.03.13.13.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 13:53:02 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@vecima.com>
Subject: [meta-python][PATCH v2] python3-pylint: Update to 3.1.0
Date: Wed, 13 Mar 2024 14:52:31 -0600
Message-ID: <20240313205231.1799380-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 20:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109295

From: Dan McGregor <dan.mcgregor@vecima.com>

PyLint needs to be comapatible with Astroid. It was recently updated
to version 3.1.0, so follow suit with pylint.

Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
---
 ...1-Adjust-test-expectations-for-ptest.patch | 44 +++++++++++++++++++
 ...ylint_3.0.3.bb =3D> python3-pylint_3.1.0.bb} |  5 ++-
 2 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pylint/0001=
-Adjust-test-expectations-for-ptest.patch
 rename meta-python/recipes-devtools/python/{python3-pylint_3.0.3.bb =3D> p=
ython3-pylint_3.1.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust=
-test-expectations-for-ptest.patch b/meta-python/recipes-devtools/python/py=
thon3-pylint/0001-Adjust-test-expectations-for-ptest.patch
new file mode 100644
index 00000000000..8edecbf1bd1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-e=
xpectations-for-ptest.patch
@@ -0,0 +1,44 @@
+From f3a213cf4922c122e554277ea2031c0c54cd3fe5 Mon Sep 17 00:00:00 2001
+From: Dan McGregor <dan.mcgregor@vecima.com>
+Date: Wed, 13 Mar 2024 14:08:25 -0600
+Subject: [PATCH] Adjust test expectations for ptest
+
+Because of the way we install ptests, some first party imports
+became third party. Reflect that in the test case.
+
+Upstream-Status: Inappropriate (embedded specific)
+Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
+---
+ tests/functional/w/wrong_import_order.txt | 22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/tests/functional/w/wrong_import_order.txt b/tests/functional/=
w/wrong_import_order.txt
+index 068d2140d..9594ff9e0 100644
+--- a/tests/functional/w/wrong_import_order.txt
++++ b/tests/functional/w/wrong_import_order.txt
+@@ -3,14 +3,14 @@ wrong-import-order:14:0:14:10::"standard import ""sys"" =
should be placed before
+ wrong-import-order:15:0:15:15::"standard import ""datetime"" should be pl=
aced before third party imports ""six"", ""astroid.are_exclusive""":UNDEFIN=
ED=0D
+ wrong-import-order:18:0:18:22::"third party import ""totally_missing"" sh=
ould be placed before local import ""package.Class""":UNDEFINED=0D
+ wrong-import-order:20:0:20:14::"third party import ""astroid"" should be =
placed before local imports ""package.Class"", "".package""":UNDEFINED=0D
+-wrong-import-order:22:0:22:22::"first party import ""pylint.checkers"" sh=
ould be placed before local imports ""package.Class"", "".package"", "".pac=
kage2""":UNDEFINED=0D
+-wrong-import-order:23:0:23:25::"first party import ""pylint.config"" shou=
ld be placed before local imports ""package.Class"", "".package"", "".packa=
ge2""":UNDEFINED=0D
+-wrong-import-order:24:0:24:17::"first party import ""pylint.sys"" should =
be placed before local imports ""package.Class"", "".package"", "".package2=
""":UNDEFINED=0D
+-wrong-import-order:25:0:25:28::"first party import ""pylint.pyreverse"" s=
hould be placed before local imports ""package.Class"", "".package"", "".pa=
ckage2""":UNDEFINED=0D
+-wrong-import-order:30:0:30:40::"third party import ""six.moves.urllib.par=
se.quote"" should be placed before first party imports ""pylint.checkers"",=
 ""pylint.config"", ""pylint.sys"", ""pylint.pyreverse"" and local imports =
""package.Class"", "".package"", "".package2"" (...) ""package3.Class3"", "=
".package4"", ""package4.Class4""":UNDEFINED=0D
+-wrong-import-order:31:0:31:23::"first party import ""pylint.constants"" s=
hould be placed before local imports ""package.Class"", "".package"", "".pa=
ckage2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UND=
EFINED=0D
+-wrong-import-order:32:0:32:19::"standard import ""re"" should be placed b=
efore third party imports ""six"", ""astroid.are_exclusive"", ""unused_impo=
rt"", ""totally_missing"", ""astroid"", ""six.moves.urllib.parse.quote"", f=
irst party imports ""pylint.checkers"", ""pylint.config"", ""pylint.sys"", =
""pylint.pyreverse"", ""pylint.constants"", and local imports ""package.Cla=
ss"", "".package"", "".package2"" (...) ""package3.Class3"", "".package4"",=
 ""package4.Class4""":UNDEFINED=0D
+-wrong-import-order:32:0:32:19::"third party import ""requests"" should be=
 placed before first party imports ""pylint.checkers"", ""pylint.config"", =
""pylint.sys"", ""pylint.pyreverse"", ""pylint.constants"" and local import=
s ""package.Class"", "".package"", "".package2"" (...) ""package3.Class3"",=
 "".package4"", ""package4.Class4""":UNDEFINED=0D
+-wrong-import-order:33:0:33:24::"first party import ""pylint.exceptions"" =
should be placed before local imports ""package.Class"", "".package"", "".p=
ackage2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UN=
DEFINED=0D
+-wrong-import-order:34:0:34:21::"first party import ""pylint.message"" sho=
uld be placed before local imports ""package.Class"", "".package"", "".pack=
age2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UNDEF=
INED=0D
+-wrong-import-order:35:0:35:11::"standard import ""time"" should be placed=
 before third party imports ""six"", ""astroid.are_exclusive"", ""unused_im=
port"" (...) ""astroid"", ""six.moves.urllib.parse.quote"", ""requests"", f=
irst party imports ""pylint.checkers"", ""pylint.config"", ""pylint.sys"" (=
...) ""pylint.constants"", ""pylint.exceptions"", ""pylint.message"", and l=
ocal imports ""package.Class"", "".package"", "".package2"" (...) ""package=
3.Class3"", "".package4"", ""package4.Class4""":UNDEFINED=0D
++wrong-import-order:22:0:22:22::"third party import ""pylint.checkers"" sh=
ould be placed before local imports ""package.Class"", "".package"", "".pac=
kage2""":UNDEFINED=0D
++wrong-import-order:23:0:23:25::"third party import ""pylint.config"" shou=
ld be placed before local imports ""package.Class"", "".package"", "".packa=
ge2""":UNDEFINED=0D
++wrong-import-order:24:0:24:17::"third party import ""pylint.sys"" should =
be placed before local imports ""package.Class"", "".package"", "".package2=
""":UNDEFINED=0D
++wrong-import-order:25:0:25:28::"third party import ""pylint.pyreverse"" s=
hould be placed before local imports ""package.Class"", "".package"", "".pa=
ckage2""":UNDEFINED=0D
++wrong-import-order:30:0:30:40::"third party import ""six.moves.urllib.par=
se.quote"" should be placed before local imports ""package.Class"", "".pack=
age"", "".package2"" (...) ""package3.Class3"", "".package4"", ""package4.C=
lass4""":UNDEFINED=0D
++wrong-import-order:31:0:31:23::"third party import ""pylint.constants"" s=
hould be placed before local imports ""package.Class"", "".package"", "".pa=
ckage2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UND=
EFINED=0D
++wrong-import-order:32:0:32:19::"standard import ""re"" should be placed b=
efore third party imports ""six"", ""astroid.are_exclusive"", ""unused_impo=
rt"" (...) ""pylint.pyreverse"", ""six.moves.urllib.parse.quote"", ""pylint=
.constants"" and local imports ""package.Class"", "".package"", "".package2=
"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UNDEFINED=
=0D
++wrong-import-order:32:0:32:19::"third party import ""requests"" should be=
 placed before local imports ""package.Class"", "".package"", "".package2""=
 (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UNDEFINED=0D
++wrong-import-order:33:0:33:24::"third party import ""pylint.exceptions"" =
should be placed before local imports ""package.Class"", "".package"", "".p=
ackage2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UN=
DEFINED=0D
++wrong-import-order:34:0:34:21::"third party import ""pylint.message"" sho=
uld be placed before local imports ""package.Class"", "".package"", "".pack=
age2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UNDEF=
INED=0D
++wrong-import-order:35:0:35:11::"standard import ""time"" should be placed=
 before third party imports ""six"", ""astroid.are_exclusive"", ""unused_im=
port"" (...) ""requests"", ""pylint.exceptions"", ""pylint.message"" and lo=
cal imports ""package.Class"", "".package"", "".package2"" (...) ""package3=
.Class3"", "".package4"", ""package4.Class4""":UNDEFINED=0D
diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.0.3.bb b/=
meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pylint_3.0.3.bb
rename to meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
index eb4b9e897ff..12f4f908af7 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
@@ -3,10 +3,11 @@ HOMEPAGE=3D "http://www.pylint.org/"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc107cf754550e65755c42985a5d4e9c=
9"
=20
-SRC_URI +=3D "git://github.com/pylint-dev/pylint;branch=3Dmaintenance/3.0.=
x;protocol=3Dhttps \
+SRC_URI +=3D "git://github.com/pylint-dev/pylint;branch=3Dmaintenance/3.1.=
x;protocol=3Dhttps \
+           file://0001-Adjust-test-expectations-for-ptest.patch \
            file://run-ptest \
            "
-SRCREV =3D "1a5ffc1f447b77071ffe18a9c6836c09147ee2ed"
+SRCREV =3D "053c2c3a25f97f043e10cdd41d2609e495a68f57"
=20
 inherit python_setuptools_build_meta ptest
=20
--=20
2.41.0


