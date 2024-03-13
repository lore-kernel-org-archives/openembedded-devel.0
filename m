Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434A1C54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 21:17:09 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web10.7805.1710364621035175938
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Mar 2024 14:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GAHJ5rcw;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-36671d34b58so1682315ab.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 14:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710364620; x=1710969420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G8TkSssNx9PLxOO59RGITVKuUu2txIfyvcJoAhvsK0g=;
        b=GAHJ5rcw2NUNlTqaSBYUr8MjkE5SVgG9VHjadcHtrTt3bCcnq1Kh2nyvyg4IUSjbp4
         djYeG8TRh5sD3iezOtfqva6gKfmbFGw/xbk3K7qtMztxa2wOpdfa2drXOQSvP5aOEuQc
         YoimrUr2mwnZ8mYLELOwRbVCZYKD+kkCQhadJcBEFmU7XXFe727xXnBpaEqa0FBlj4PT
         Yd53l+mrTkODAfMDiUMeIjK16bxW1ac4rFire1IcEx21b9mLTRVhVOCgsXlSSI3TKLVU
         qA2s/vEpZ6C2faI8REnRngx7XG/w2yhYe24KxtZp4pz5tG1sjA6iBWh5066WnefAT+Tn
         DLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710364620; x=1710969420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8TkSssNx9PLxOO59RGITVKuUu2txIfyvcJoAhvsK0g=;
        b=GzhjlvfHltNh+q3JjlIENP1mKarnO30vS80ObdyMTKBGmgr6+UUhuiwqGnADwBhM74
         fdovAkYrkFDFdpeDwZb9QKOvhYUblqRCMuzPUOS+ReqLkvF16k+orVW9cDwXgzhUPZeo
         js3I1e4sZyD0X6dKQ/PsIPOf94BhfqpFyKBmSTwsk0gkiVUQXnfqOB1bEc/rl91sQ3fN
         3Q/vpe8aG5BGRdone1c3XDBJEXWaQRw0IL0b5yXwgLKz9PE4rf3wFitTm0Zcxdvj8q4W
         AvQtV5afPiTTBhUdom9xE14jLr6Oza/nzWoVB2K25yK7m4E+9pTL/6CEfMFgo6g7fS+2
         TOMA==
X-Gm-Message-State: AOJu0YwU8mXn6uCr43YJVsx3ytWQdSaYtNeWBz2kbMhjdxeyAQO0+lIH
	XFngcwM4WYqc0ulTpuoEae5Tnj+mXyv1X0k7JKBGsLH3Rxn/egRQYhrA9ADYig0=
X-Google-Smtp-Source: AGHT+IHNh5NX/0v1bcLgU/qIc7zsapyEYrWytGCQCFhmsAF2RmuYj9Y8Sfoi66FrpgNTb2iYCYYfQQ==
X-Received: by 2002:a92:c549:0:b0:365:fe19:8919 with SMTP id a9-20020a92c549000000b00365fe198919mr1400771ilj.29.1710364620102;
        Wed, 13 Mar 2024 14:17:00 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id e2-20020a92de42000000b003639d3e5afdsm45503ilr.10.2024.03.13.14.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 14:16:59 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@vecima.com>
Subject: [meta-python][PATCH] python3-pylint: Fix ptest failures
Date: Wed, 13 Mar 2024 15:16:52 -0600
Message-ID: <20240313211652.1799855-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 21:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109297

From: Dan McGregor <dan.mcgregor@vecima.com>

Due to the way we install ptests, some imports switch from
first party to third party. Update test expectations

Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
---
 ...1-Adjust-test-expectations-for-ptest.patch | 44 +++++++++++++++++++
 .../python/python3-pylint_3.1.0.bb            |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pylint/0001=
-Adjust-test-expectations-for-ptest.patch

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
diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb b/=
meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
index 49f0b3eb6e4..12f4f908af7 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
@@ -4,6 +4,7 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc107cf754550e65755c42985a5d4e9c=
9"
=20
 SRC_URI +=3D "git://github.com/pylint-dev/pylint;branch=3Dmaintenance/3.1.=
x;protocol=3Dhttps \
+           file://0001-Adjust-test-expectations-for-ptest.patch \
            file://run-ptest \
            "
 SRCREV =3D "053c2c3a25f97f043e10cdd41d2609e495a68f57"
--=20
2.41.0


