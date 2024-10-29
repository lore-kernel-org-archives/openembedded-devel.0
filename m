Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CCED5B874
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 04:25:08 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.11998.1730175902552262030
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 21:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bER4Y3bg;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7180dc76075so2575419a34.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 21:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730175901; x=1730780701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrpmqpEi8YqQU0/U6SQZfPLA3UCiCI9p2vwxgif2nUw=;
        b=bER4Y3bg2DHpMyd2XPUnFj9EnlUyQCJQiv+HINsE5JwjVSYh998sNeKpTEnmsFbxKz
         tOnqaOpJ/QS9T7xbyUXZv/vQqNVa+QJXOajUk82gr0Mc+eDZCJhJEQLaBzcb15pMCw3o
         46QvvHKelRAUnOoL7pmbzgz7kfpKONK4yZV6s2HoqMguclfMu+1maQkdlYWz9dPKOwJm
         kZVDnIa4gItyWSk8E9EeLErz2V5p/svvAZdXPOh2ytmylYxFPSj1eOvcOJ1lLtgelMvw
         xLCwD32dhXuC65Shz3Ig09A9MBaAJgRtQQPkWjwQb9EqnsgIMHrIQtIXWuseVu7lTVWu
         5gQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730175901; x=1730780701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrpmqpEi8YqQU0/U6SQZfPLA3UCiCI9p2vwxgif2nUw=;
        b=rUohb1QhaTuvYSlbq9rziIhPx3AqHYEpmTsQetLXtoUVfeUZ9YcDggLb+165y6nW3w
         MQaKUMwwHpRpH/UZw6sCJ7+AP9GIdrp7yEJ4WoNWd7QaV9LRAJTmcLXSFo9r8c1B/XBm
         3e7+Vlk/dl/ZvnsONBiI5c2hESty86xejM2x+y9lpN32oEYjXF5Y7Oi5xcEFMLUhH3z6
         WKv8YmjnsqfivL3n8Qf2oCoWfP02xOasl529EzOOWVfMcTFihJmImluaqyulR1AO3lvD
         tzw7a2s8XV4dQ1UNQiMmLmb0AZhCzCeMe4l+HOjlvSg9pjCw7/dvvvBMYQGaFlxvPgBH
         OSzA==
X-Gm-Message-State: AOJu0YwiPIPAblhjVHNcKNdFtJO7/x/+QCByMg7x4t8q8t5Kf0FeJtbI
	bcVbJq0u34jT1OOcbnLYdaPOQwEAF4MdKUDhPzp8Hfi3nI7Dz+QcjPiry8en
X-Google-Smtp-Source: AGHT+IG5lGh7VbLpW7kFNuj3AyG6wyjRB5siadGsvpJJs1BNDNVdR2Xw4kH4idzC2g6Kmmy8C5z7dw==
X-Received: by 2002:a05:6830:6e06:b0:710:e61c:7a4c with SMTP id 46e09a7af769-718682a1369mr9840978a34.29.1730175901352;
        Mon, 28 Oct 2024 21:25:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8085])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8679cbesm6710198a12.24.2024.10.28.21.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 21:25:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/5] python3-pylint: Upgrade to 3.3.1 release
Date: Mon, 28 Oct 2024 21:24:54 -0700
Message-ID: <20241029042457.4125617-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029042457.4125617-1-raj.khem@gmail.com>
References: <20241029042457.4125617-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 04:25:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113318

brings python 3.13 support

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-Adjust-test-expectations-for-ptest.patch | 54 +++++++++----------
 ...ylint_3.2.2.bb =3D> python3-pylint_3.3.1.bb} | 12 ++---
 2 files changed, 32 insertions(+), 34 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_3.2.2.bb =3D> p=
ython3-pylint_3.3.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust=
-test-expectations-for-ptest.patch b/meta-python/recipes-devtools/python/py=
thon3-pylint/0001-Adjust-test-expectations-for-ptest.patch
index 8edecbf1bd..769cd145e1 100644
--- a/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-e=
xpectations-for-ptest.patch
+++ b/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-e=
xpectations-for-ptest.patch
@@ -12,33 +12,31 @@ Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
  tests/functional/w/wrong_import_order.txt | 22 +++++++++++-----------
  1 file changed, 11 insertions(+), 11 deletions(-)
=20
-diff --git a/tests/functional/w/wrong_import_order.txt b/tests/functional/=
w/wrong_import_order.txt
-index 068d2140d..9594ff9e0 100644
 --- a/tests/functional/w/wrong_import_order.txt
 +++ b/tests/functional/w/wrong_import_order.txt
-@@ -3,14 +3,14 @@ wrong-import-order:14:0:14:10::"standard import ""sys"" =
should be placed before
- wrong-import-order:15:0:15:15::"standard import ""datetime"" should be pl=
aced before third party imports ""six"", ""astroid.are_exclusive""":UNDEFIN=
ED=0D
- wrong-import-order:18:0:18:22::"third party import ""totally_missing"" sh=
ould be placed before local import ""package.Class""":UNDEFINED=0D
- wrong-import-order:20:0:20:14::"third party import ""astroid"" should be =
placed before local imports ""package.Class"", "".package""":UNDEFINED=0D
--wrong-import-order:22:0:22:22::"first party import ""pylint.checkers"" sh=
ould be placed before local imports ""package.Class"", "".package"", "".pac=
kage2""":UNDEFINED=0D
--wrong-import-order:23:0:23:25::"first party import ""pylint.config"" shou=
ld be placed before local imports ""package.Class"", "".package"", "".packa=
ge2""":UNDEFINED=0D
--wrong-import-order:24:0:24:17::"first party import ""pylint.sys"" should =
be placed before local imports ""package.Class"", "".package"", "".package2=
""":UNDEFINED=0D
--wrong-import-order:25:0:25:28::"first party import ""pylint.pyreverse"" s=
hould be placed before local imports ""package.Class"", "".package"", "".pa=
ckage2""":UNDEFINED=0D
--wrong-import-order:30:0:30:40::"third party import ""six.moves.urllib.par=
se.quote"" should be placed before first party imports ""pylint.checkers"",=
 ""pylint.config"", ""pylint.sys"", ""pylint.pyreverse"" and local imports =
""package.Class"", "".package"", "".package2"" (...) ""package3.Class3"", "=
".package4"", ""package4.Class4""":UNDEFINED=0D
--wrong-import-order:31:0:31:23::"first party import ""pylint.constants"" s=
hould be placed before local imports ""package.Class"", "".package"", "".pa=
ckage2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UND=
EFINED=0D
--wrong-import-order:32:0:32:19::"standard import ""re"" should be placed b=
efore third party imports ""six"", ""astroid.are_exclusive"", ""unused_impo=
rt"", ""totally_missing"", ""astroid"", ""six.moves.urllib.parse.quote"", f=
irst party imports ""pylint.checkers"", ""pylint.config"", ""pylint.sys"", =
""pylint.pyreverse"", ""pylint.constants"", and local imports ""package.Cla=
ss"", "".package"", "".package2"" (...) ""package3.Class3"", "".package4"",=
 ""package4.Class4""":UNDEFINED=0D
--wrong-import-order:32:0:32:19::"third party import ""requests"" should be=
 placed before first party imports ""pylint.checkers"", ""pylint.config"", =
""pylint.sys"", ""pylint.pyreverse"", ""pylint.constants"" and local import=
s ""package.Class"", "".package"", "".package2"" (...) ""package3.Class3"",=
 "".package4"", ""package4.Class4""":UNDEFINED=0D
--wrong-import-order:33:0:33:24::"first party import ""pylint.exceptions"" =
should be placed before local imports ""package.Class"", "".package"", "".p=
ackage2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UN=
DEFINED=0D
--wrong-import-order:34:0:34:21::"first party import ""pylint.message"" sho=
uld be placed before local imports ""package.Class"", "".package"", "".pack=
age2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UNDEF=
INED=0D
--wrong-import-order:35:0:35:11::"standard import ""time"" should be placed=
 before third party imports ""six"", ""astroid.are_exclusive"", ""unused_im=
port"" (...) ""astroid"", ""six.moves.urllib.parse.quote"", ""requests"", f=
irst party imports ""pylint.checkers"", ""pylint.config"", ""pylint.sys"" (=
...) ""pylint.constants"", ""pylint.exceptions"", ""pylint.message"", and l=
ocal imports ""package.Class"", "".package"", "".package2"" (...) ""package=
3.Class3"", "".package4"", ""package4.Class4""":UNDEFINED=0D
-+wrong-import-order:22:0:22:22::"third party import ""pylint.checkers"" sh=
ould be placed before local imports ""package.Class"", "".package"", "".pac=
kage2""":UNDEFINED=0D
-+wrong-import-order:23:0:23:25::"third party import ""pylint.config"" shou=
ld be placed before local imports ""package.Class"", "".package"", "".packa=
ge2""":UNDEFINED=0D
-+wrong-import-order:24:0:24:17::"third party import ""pylint.sys"" should =
be placed before local imports ""package.Class"", "".package"", "".package2=
""":UNDEFINED=0D
-+wrong-import-order:25:0:25:28::"third party import ""pylint.pyreverse"" s=
hould be placed before local imports ""package.Class"", "".package"", "".pa=
ckage2""":UNDEFINED=0D
-+wrong-import-order:30:0:30:40::"third party import ""six.moves.urllib.par=
se.quote"" should be placed before local imports ""package.Class"", "".pack=
age"", "".package2"" (...) ""package3.Class3"", "".package4"", ""package4.C=
lass4""":UNDEFINED=0D
-+wrong-import-order:31:0:31:23::"third party import ""pylint.constants"" s=
hould be placed before local imports ""package.Class"", "".package"", "".pa=
ckage2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UND=
EFINED=0D
-+wrong-import-order:32:0:32:19::"standard import ""re"" should be placed b=
efore third party imports ""six"", ""astroid.are_exclusive"", ""unused_impo=
rt"" (...) ""pylint.pyreverse"", ""six.moves.urllib.parse.quote"", ""pylint=
.constants"" and local imports ""package.Class"", "".package"", "".package2=
"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UNDEFINED=
=0D
-+wrong-import-order:32:0:32:19::"third party import ""requests"" should be=
 placed before local imports ""package.Class"", "".package"", "".package2""=
 (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UNDEFINED=0D
-+wrong-import-order:33:0:33:24::"third party import ""pylint.exceptions"" =
should be placed before local imports ""package.Class"", "".package"", "".p=
ackage2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UN=
DEFINED=0D
-+wrong-import-order:34:0:34:21::"third party import ""pylint.message"" sho=
uld be placed before local imports ""package.Class"", "".package"", "".pack=
age2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UNDEF=
INED=0D
-+wrong-import-order:35:0:35:11::"standard import ""time"" should be placed=
 before third party imports ""six"", ""astroid.are_exclusive"", ""unused_im=
port"" (...) ""requests"", ""pylint.exceptions"", ""pylint.message"" and lo=
cal imports ""package.Class"", "".package"", "".package2"" (...) ""package3=
.Class3"", "".package4"", ""package4.Class4""":UNDEFINED=0D
+@@ -3,14 +3,14 @@ wrong-import-order:14:0:14:10::"standard
+ wrong-import-order:15:0:15:15::"standard import ""datetime"" should be pl=
aced before third party imports ""six"", ""astroid.are_exclusive""":UNDEFIN=
ED
+ wrong-import-order:18:0:18:22::"third party import ""totally_missing"" sh=
ould be placed before local import ""package.Class""":UNDEFINED
+ wrong-import-order:20:0:20:14::"third party import ""astroid"" should be =
placed before local imports ""package.Class"", "".package""":UNDEFINED
+-wrong-import-order:22:0:22:22::"first party import ""pylint.checkers"" sh=
ould be placed before local imports ""package.Class"", "".package"", "".pac=
kage2""":UNDEFINED
+-wrong-import-order:23:0:23:25::"first party import ""pylint.config"" shou=
ld be placed before local imports ""package.Class"", "".package"", "".packa=
ge2""":UNDEFINED
+-wrong-import-order:24:0:24:17::"first party import ""pylint.sys"" should =
be placed before local imports ""package.Class"", "".package"", "".package2=
""":UNDEFINED
+-wrong-import-order:25:0:25:28::"first party import ""pylint.pyreverse"" s=
hould be placed before local imports ""package.Class"", "".package"", "".pa=
ckage2""":UNDEFINED
+-wrong-import-order:30:0:30:40::"third party import ""six.moves.urllib.par=
se.quote"" should be placed before first party imports ""pylint.checkers"",=
 ""pylint.config"", ""pylint.sys"", ""pylint.pyreverse"" and local imports =
""package.Class"", "".package"", "".package2"" (...) ""package3.Class3"", "=
".package4"", ""package4.Class4""":UNDEFINED
+-wrong-import-order:31:0:31:23::"first party import ""pylint.constants"" s=
hould be placed before local imports ""package.Class"", "".package"", "".pa=
ckage2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UND=
EFINED
+-wrong-import-order:32:0:32:19::"standard import ""re"" should be placed b=
efore third party imports ""six"", ""astroid.are_exclusive"", ""unused_impo=
rt"", ""totally_missing"", ""astroid"", ""six.moves.urllib.parse.quote"", f=
irst party imports ""pylint.checkers"", ""pylint.config"", ""pylint.sys"", =
""pylint.pyreverse"", ""pylint.constants"", and local imports ""package.Cla=
ss"", "".package"", "".package2"" (...) ""package3.Class3"", "".package4"",=
 ""package4.Class4""":UNDEFINED
+-wrong-import-order:32:0:32:19::"third party import ""requests"" should be=
 placed before first party imports ""pylint.checkers"", ""pylint.config"", =
""pylint.sys"", ""pylint.pyreverse"", ""pylint.constants"" and local import=
s ""package.Class"", "".package"", "".package2"" (...) ""package3.Class3"",=
 "".package4"", ""package4.Class4""":UNDEFINED
+-wrong-import-order:33:0:33:24::"first party import ""pylint.exceptions"" =
should be placed before local imports ""package.Class"", "".package"", "".p=
ackage2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UN=
DEFINED
+-wrong-import-order:34:0:34:21::"first party import ""pylint.message"" sho=
uld be placed before local imports ""package.Class"", "".package"", "".pack=
age2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UNDEF=
INED
+-wrong-import-order:35:0:35:11::"standard import ""time"" should be placed=
 before third party imports ""six"", ""astroid.are_exclusive"", ""unused_im=
port"" (...) ""astroid"", ""six.moves.urllib.parse.quote"", ""requests"", f=
irst party imports ""pylint.checkers"", ""pylint.config"", ""pylint.sys"" (=
...) ""pylint.constants"", ""pylint.exceptions"", ""pylint.message"", and l=
ocal imports ""package.Class"", "".package"", "".package2"" (...) ""package=
3.Class3"", "".package4"", ""package4.Class4""":UNDEFINED
++wrong-import-order:22:0:22:22::"third party import ""pylint.checkers"" sh=
ould be placed before local imports ""package.Class"", "".package"", "".pac=
kage2""":UNDEFINED
++wrong-import-order:23:0:23:25::"third party import ""pylint.config"" shou=
ld be placed before local imports ""package.Class"", "".package"", "".packa=
ge2""":UNDEFINED
++wrong-import-order:24:0:24:17::"third party import ""pylint.sys"" should =
be placed before local imports ""package.Class"", "".package"", "".package2=
""":UNDEFINED
++wrong-import-order:25:0:25:28::"third party import ""pylint.pyreverse"" s=
hould be placed before local imports ""package.Class"", "".package"", "".pa=
ckage2""":UNDEFINED
++wrong-import-order:30:0:30:40::"third party import ""six.moves.urllib.par=
se.quote"" should be placed before local imports ""package.Class"", "".pack=
age"", "".package2"" (...) ""package3.Class3"", "".package4"", ""package4.C=
lass4""":UNDEFINED
++wrong-import-order:31:0:31:23::"third party import ""pylint.constants"" s=
hould be placed before local imports ""package.Class"", "".package"", "".pa=
ckage2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UND=
EFINED
++wrong-import-order:32:0:32:19::"standard import ""re"" should be placed b=
efore third party imports ""six"", ""astroid.are_exclusive"", ""unused_impo=
rt"" (...) ""pylint.pyreverse"", ""six.moves.urllib.parse.quote"", ""pylint=
.constants"" and local imports ""package.Class"", "".package"", "".package2=
"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UNDEFINED
++wrong-import-order:32:0:32:19::"third party import ""requests"" should be=
 placed before local imports ""package.Class"", "".package"", "".package2""=
 (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UNDEFINED
++wrong-import-order:33:0:33:24::"third party import ""pylint.exceptions"" =
should be placed before local imports ""package.Class"", "".package"", "".p=
ackage2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UN=
DEFINED
++wrong-import-order:34:0:34:21::"third party import ""pylint.message"" sho=
uld be placed before local imports ""package.Class"", "".package"", "".pack=
age2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UNDEF=
INED
++wrong-import-order:35:0:35:11::"standard import ""time"" should be placed=
 before third party imports ""six"", ""astroid.are_exclusive"", ""unused_im=
port"" (...) ""requests"", ""pylint.exceptions"", ""pylint.message"" and lo=
cal imports ""package.Class"", "".package"", "".package2"" (...) ""package3=
.Class3"", "".package4"", ""package4.Class4""":UNDEFINED
diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.2.2.bb b/=
meta-python/recipes-devtools/python/python3-pylint_3.3.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pylint_3.2.2.bb
rename to meta-python/recipes-devtools/python/python3-pylint_3.3.1.bb
index eae30dfbff..1b2e033f11 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.3.1.bb
@@ -3,14 +3,16 @@ HOMEPAGE=3D "http://www.pylint.org/"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc107cf754550e65755c42985a5d4e9c=
9"
=20
+SRCREV =3D "76bce72bc57cc8089e439cc9d22fed5806341ed4"
 SRC_URI +=3D "git://github.com/pylint-dev/pylint;branch=3Dmain;protocol=3D=
https \
-           file://0001-Adjust-test-expectations-for-ptest.patch \
-           file://run-ptest \
+            file://0001-Adjust-test-expectations-for-ptest.patch \
+            file://run-ptest \
            "
-SRCREV =3D "769ffd20bbf321a6cf23f5e7221a0b8221f51482"
=20
 inherit python_setuptools_build_meta ptest
=20
+S =3D "${WORKDIR}/git"
+
 RDEPENDS:${PN} +=3D "\
     python3-astroid \
     python3-difflib \
@@ -43,13 +45,11 @@ RDEPENDS:${PN}-ptest +=3D " \
     python3-unittest-automake-output \
     "
=20
-S =3D "${WORKDIR}/git"
-
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
     install -Dm 0644 ${S}/tests/.pylint_primer_tests/.gitkeep ${D}${PTEST_=
PATH}/tests/.pylint_primer_tests/.gitkeep
-    sed -i 's#/usr/bin/python$#/usr/bin/python3#g' ${D}${PTEST_PATH}/tests=
/data/ascript
+    sed -i 's#/usr/bin/python$#/usr/bin/python3#g' ${D}${PTEST_PATH}/tests=
/data/a_script
     # regression_distutil_import_error_73.py fails to run see
     # https://lists.openembedded.org/g/openembedded-devel/topic/103181847
     rm ${D}${PTEST_PATH}/tests/functional/r/regression_02/regression_distu=
til_import_error_73.py

