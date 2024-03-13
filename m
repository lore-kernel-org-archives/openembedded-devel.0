Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 375FBC54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 21:04:19 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.7477.1710363849395029265
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Mar 2024 14:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T/30MOts;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: danismostlikely@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso196882276.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 14:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710363684; x=1710968484; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V464uEEZNeFrL3GmjwB44N090OH4Kyp89Z2wsjECGOM=;
        b=T/30MOtsJ9HB5PQTf5pwNWJAUo1Qk2iyqZ6VqSnZR4y6ncSURN/Kl1R0XGHpVBQLJh
         mB939kYZ8DWgclm959rsxLjzifAOOeYs0UVabSkSThUya5luLF4EmmTL8L5xxipwdmiF
         y5iDjzNVAm9FcAZozbgt2e/JZNJTWsSkbP84rZ0r9HoRq8mctlt8/fYNFFJwWpN6ik8b
         5EKRa4S+0YlBWQU0iAqVmKA07JvwL8MRcqfkN/H10Mh3EKaJbKxYmZkWe4xIAquPf0zF
         rKSK+ohJPuTMYiR353snPBxywoSeQ0jOLGr+1gdcaOeScZIOXLtnUA2KVYr2bhFqbOE9
         zv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710363684; x=1710968484;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V464uEEZNeFrL3GmjwB44N090OH4Kyp89Z2wsjECGOM=;
        b=ZAGaboANLyTsnuzjIZ5Q54B3w0KSADq+UPATuh7f79eu4h+PeVfUU45KYNJX99lGP3
         w8OEwpL/gcs1IwhobLyrJW2qUr992O5EZd2NkJrnQC9GiZWObJPynLYUjM2WcrwLHokv
         lZPRY7KZd8upz3LV5Cg6f5nyWVtYYGee/J31eyKIMEAf5t7ulMkEz2CLSoI3W3f26vCt
         IFCkRR5stP56zgE1NYsOk6cqQB9WukIOlIYaCPGMAN0LsQBZ6LF1Tgx2VpYOPhdybSD7
         t2GajHDTOgWaxAcNoZOPcAoWs89KHch7tyun1K0wnpV9vNuKpKtZMn8XzWBqpNBd+aQj
         fM8g==
X-Gm-Message-State: AOJu0Yxh4OF8ZBeEkfXPGXzLOOvqEIjrcedmfcdKTQ6rEYicon3HJDKa
	YjvXHF3QS3KPbGpZlbrCzUHfRrWIvZRfg7tjMjxeMzmTuyz9ojgy9QMm1b2L9idPoGkdiJI6ANV
	OPt1KyPkWJQj1z9obtVnRIpv2Y1M+0bpri7s=
X-Google-Smtp-Source: AGHT+IEvn8Xn05pRlq22tB0K9Hv+QqOf5qYYH8mDNw61cq0gpZiueck2UY+ACGYDTEpYMQ91rr9639mRdtz0tD4/6Yw=
X-Received: by 2002:a25:2e47:0:b0:dc6:3610:c344 with SMTP id
 b7-20020a252e47000000b00dc63610c344mr3310812ybn.13.1710363683960; Wed, 13 Mar
 2024 14:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240313205231.1799380-1-danismostlikely@gmail.com>
In-Reply-To: <20240313205231.1799380-1-danismostlikely@gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Wed, 13 Mar 2024 15:01:12 -0600
Message-ID: <CACS+7ZR=U+6-P1OiQ4oB2oBOxgStoeOCOzm4jknY0LJ6pJUeLw@mail.gmail.com>
Subject: Re: [meta-python][PATCH v2] python3-pylint: Update to 3.1.0
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 21:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109296

Hm. looks like v1 was committed. I'll rebase this change and submit a
new version.

On Wed, 13 Mar 2024 at 14:53, Dan McGregor <danismostlikely@gmail.com> wrot=
e:
>
> From: Dan McGregor <dan.mcgregor@vecima.com>
>
> PyLint needs to be comapatible with Astroid. It was recently updated
> to version 3.1.0, so follow suit with pylint.
>
> Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
> ---
>  ...1-Adjust-test-expectations-for-ptest.patch | 44 +++++++++++++++++++
>  ...ylint_3.0.3.bb =3D> python3-pylint_3.1.0.bb} |  5 ++-
>  2 files changed, 47 insertions(+), 2 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pylint/00=
01-Adjust-test-expectations-for-ptest.patch
>  rename meta-python/recipes-devtools/python/{python3-pylint_3.0.3.bb =3D>=
 python3-pylint_3.1.0.bb} (91%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pylint/0001-Adju=
st-test-expectations-for-ptest.patch b/meta-python/recipes-devtools/python/=
python3-pylint/0001-Adjust-test-expectations-for-ptest.patch
> new file mode 100644
> index 00000000000..8edecbf1bd1
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test=
-expectations-for-ptest.patch
> @@ -0,0 +1,44 @@
> +From f3a213cf4922c122e554277ea2031c0c54cd3fe5 Mon Sep 17 00:00:00 2001
> +From: Dan McGregor <dan.mcgregor@vecima.com>
> +Date: Wed, 13 Mar 2024 14:08:25 -0600
> +Subject: [PATCH] Adjust test expectations for ptest
> +
> +Because of the way we install ptests, some first party imports
> +became third party. Reflect that in the test case.
> +
> +Upstream-Status: Inappropriate (embedded specific)
> +Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
> +---
> + tests/functional/w/wrong_import_order.txt | 22 +++++++++++-----------
> + 1 file changed, 11 insertions(+), 11 deletions(-)
> +
> +diff --git a/tests/functional/w/wrong_import_order.txt b/tests/functiona=
l/w/wrong_import_order.txt
> +index 068d2140d..9594ff9e0 100644
> +--- a/tests/functional/w/wrong_import_order.txt
> ++++ b/tests/functional/w/wrong_import_order.txt
> +@@ -3,14 +3,14 @@ wrong-import-order:14:0:14:10::"standard import ""sys"=
" should be placed before
> + wrong-import-order:15:0:15:15::"standard import ""datetime"" should be =
placed before third party imports ""six"", ""astroid.are_exclusive""":UNDEF=
INED
> + wrong-import-order:18:0:18:22::"third party import ""totally_missing"" =
should be placed before local import ""package.Class""":UNDEFINED
> + wrong-import-order:20:0:20:14::"third party import ""astroid"" should b=
e placed before local imports ""package.Class"", "".package""":UNDEFINED
> +-wrong-import-order:22:0:22:22::"first party import ""pylint.checkers"" =
should be placed before local imports ""package.Class"", "".package"", "".p=
ackage2""":UNDEFINED
> +-wrong-import-order:23:0:23:25::"first party import ""pylint.config"" sh=
ould be placed before local imports ""package.Class"", "".package"", "".pac=
kage2""":UNDEFINED
> +-wrong-import-order:24:0:24:17::"first party import ""pylint.sys"" shoul=
d be placed before local imports ""package.Class"", "".package"", "".packag=
e2""":UNDEFINED
> +-wrong-import-order:25:0:25:28::"first party import ""pylint.pyreverse""=
 should be placed before local imports ""package.Class"", "".package"", "".=
package2""":UNDEFINED
> +-wrong-import-order:30:0:30:40::"third party import ""six.moves.urllib.p=
arse.quote"" should be placed before first party imports ""pylint.checkers"=
", ""pylint.config"", ""pylint.sys"", ""pylint.pyreverse"" and local import=
s ""package.Class"", "".package"", "".package2"" (...) ""package3.Class3"",=
 "".package4"", ""package4.Class4""":UNDEFINED
> +-wrong-import-order:31:0:31:23::"first party import ""pylint.constants""=
 should be placed before local imports ""package.Class"", "".package"", "".=
package2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":U=
NDEFINED
> +-wrong-import-order:32:0:32:19::"standard import ""re"" should be placed=
 before third party imports ""six"", ""astroid.are_exclusive"", ""unused_im=
port"", ""totally_missing"", ""astroid"", ""six.moves.urllib.parse.quote"",=
 first party imports ""pylint.checkers"", ""pylint.config"", ""pylint.sys""=
, ""pylint.pyreverse"", ""pylint.constants"", and local imports ""package.C=
lass"", "".package"", "".package2"" (...) ""package3.Class3"", "".package4"=
", ""package4.Class4""":UNDEFINED
> +-wrong-import-order:32:0:32:19::"third party import ""requests"" should =
be placed before first party imports ""pylint.checkers"", ""pylint.config""=
, ""pylint.sys"", ""pylint.pyreverse"", ""pylint.constants"" and local impo=
rts ""package.Class"", "".package"", "".package2"" (...) ""package3.Class3"=
", "".package4"", ""package4.Class4""":UNDEFINED
> +-wrong-import-order:33:0:33:24::"first party import ""pylint.exceptions"=
" should be placed before local imports ""package.Class"", "".package"", ""=
.package2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":=
UNDEFINED
> +-wrong-import-order:34:0:34:21::"first party import ""pylint.message"" s=
hould be placed before local imports ""package.Class"", "".package"", "".pa=
ckage2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UND=
EFINED
> +-wrong-import-order:35:0:35:11::"standard import ""time"" should be plac=
ed before third party imports ""six"", ""astroid.are_exclusive"", ""unused_=
import"" (...) ""astroid"", ""six.moves.urllib.parse.quote"", ""requests"",=
 first party imports ""pylint.checkers"", ""pylint.config"", ""pylint.sys""=
 (...) ""pylint.constants"", ""pylint.exceptions"", ""pylint.message"", and=
 local imports ""package.Class"", "".package"", "".package2"" (...) ""packa=
ge3.Class3"", "".package4"", ""package4.Class4""":UNDEFINED
> ++wrong-import-order:22:0:22:22::"third party import ""pylint.checkers"" =
should be placed before local imports ""package.Class"", "".package"", "".p=
ackage2""":UNDEFINED
> ++wrong-import-order:23:0:23:25::"third party import ""pylint.config"" sh=
ould be placed before local imports ""package.Class"", "".package"", "".pac=
kage2""":UNDEFINED
> ++wrong-import-order:24:0:24:17::"third party import ""pylint.sys"" shoul=
d be placed before local imports ""package.Class"", "".package"", "".packag=
e2""":UNDEFINED
> ++wrong-import-order:25:0:25:28::"third party import ""pylint.pyreverse""=
 should be placed before local imports ""package.Class"", "".package"", "".=
package2""":UNDEFINED
> ++wrong-import-order:30:0:30:40::"third party import ""six.moves.urllib.p=
arse.quote"" should be placed before local imports ""package.Class"", "".pa=
ckage"", "".package2"" (...) ""package3.Class3"", "".package4"", ""package4=
.Class4""":UNDEFINED
> ++wrong-import-order:31:0:31:23::"third party import ""pylint.constants""=
 should be placed before local imports ""package.Class"", "".package"", "".=
package2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":U=
NDEFINED
> ++wrong-import-order:32:0:32:19::"standard import ""re"" should be placed=
 before third party imports ""six"", ""astroid.are_exclusive"", ""unused_im=
port"" (...) ""pylint.pyreverse"", ""six.moves.urllib.parse.quote"", ""pyli=
nt.constants"" and local imports ""package.Class"", "".package"", "".packag=
e2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UNDEFIN=
ED
> ++wrong-import-order:32:0:32:19::"third party import ""requests"" should =
be placed before local imports ""package.Class"", "".package"", "".package2=
"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UNDEFINED
> ++wrong-import-order:33:0:33:24::"third party import ""pylint.exceptions"=
" should be placed before local imports ""package.Class"", "".package"", ""=
.package2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":=
UNDEFINED
> ++wrong-import-order:34:0:34:21::"third party import ""pylint.message"" s=
hould be placed before local imports ""package.Class"", "".package"", "".pa=
ckage2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UND=
EFINED
> ++wrong-import-order:35:0:35:11::"standard import ""time"" should be plac=
ed before third party imports ""six"", ""astroid.are_exclusive"", ""unused_=
import"" (...) ""requests"", ""pylint.exceptions"", ""pylint.message"" and =
local imports ""package.Class"", "".package"", "".package2"" (...) ""packag=
e3.Class3"", "".package4"", ""package4.Class4""":UNDEFINED
> diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.0.3.bb =
b/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
> similarity index 91%
> rename from meta-python/recipes-devtools/python/python3-pylint_3.0.3.bb
> rename to meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
> index eb4b9e897ff..12f4f908af7 100644
> --- a/meta-python/recipes-devtools/python/python3-pylint_3.0.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
> @@ -3,10 +3,11 @@ HOMEPAGE=3D "http://www.pylint.org/"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc107cf754550e65755c42985a5d4e=
9c9"
>
> -SRC_URI +=3D "git://github.com/pylint-dev/pylint;branch=3Dmaintenance/3.=
0.x;protocol=3Dhttps \
> +SRC_URI +=3D "git://github.com/pylint-dev/pylint;branch=3Dmaintenance/3.=
1.x;protocol=3Dhttps \
> +           file://0001-Adjust-test-expectations-for-ptest.patch \
>             file://run-ptest \
>             "
> -SRCREV =3D "1a5ffc1f447b77071ffe18a9c6836c09147ee2ed"
> +SRCREV =3D "053c2c3a25f97f043e10cdd41d2609e495a68f57"
>
>  inherit python_setuptools_build_meta ptest
>
> --
> 2.41.0
>

