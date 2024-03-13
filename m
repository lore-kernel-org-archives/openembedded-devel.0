Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9586C54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 22:33:39 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.9958.1710369213181551633
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Mar 2024 15:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dzjoUhbm;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3c1ea59cf81so212796b6e.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 15:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710369212; x=1710974012; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avzHG7eUbRd4VP0poF+I3WC4bkWGpWNzqjI3mSHFZVQ=;
        b=dzjoUhbmbg5fmKesDAN9HMUjwxo5HX4BkvYVQoIkQ/pYakscTxuL5MCo7VMExQG73g
         hQWt2Nmg2qcYQjyLWtXZ+oWvQm54sW71rACCPTIBlruGamc022VoXZPVRynvDSVee45Y
         5gq+PumGsvFhXr/QE76wJQeWmlsrKk6qEi8/1sD0+Cq+q2AtMrtp3/8oxhYhgDPm42T2
         Cue8qCFMUTK4P7NmFHx6M0XNGW4Sxc60rwoqAk3DxUZ0Meo3oiKYNd5cpXk4Mu34ZfBo
         GbVWD+/Ok1K3MyNAL7yDrI/YWuK425x9NeXYrYkqvDhnAZoE5WZfKm8f8RXVDotsrxji
         ROlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710369212; x=1710974012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avzHG7eUbRd4VP0poF+I3WC4bkWGpWNzqjI3mSHFZVQ=;
        b=JeR55+b72Mv5axqrKv+m+taxlnMYwMIy1vGSLey0C/Oxp377BX8OFytkUPXGgU5Edu
         P80xqqeyeZ4h7UMUcjUuWFXwV/oBLQQJwWYCwIS29Z0pQkQJpiGkwjW+bM4npjX7Tc8E
         646xrAxY8uG9i1uMtxdsLeBKKdOXhcuCD/wgsrtoRMVYmSDoDtB8awgtgDQkuJP6QJjB
         2pqXUMoZnhBPp+cdA45yyXKzhZO2V7Cl2g2Q+cG/aRF0D4qiS6DyU1y1hN9Ddn07coZN
         U4Yy/mrLIQA0wshB0/XRkDoPWDVy7DR+yMwDX1JgDGQn2MiJv1kPX28+hkrcu5jc5RS3
         5c7A==
X-Gm-Message-State: AOJu0YxH5W5iZ2DrQcaTL3PC8U4nyETHoAFCRptrw/+R8Z8qyM091uur
	IVuO/McofLhWIpqlemi1gAHeKuDEPlJ+JoOSThr4Rvt+/tzEkMOqLxU1YJJSvruiR9P7PqK/BgK
	7+vYcpu+It4g/gYG5OpJQc64y1AtL38o/7O4=
X-Google-Smtp-Source: AGHT+IH+w5JHM/OTAZf6DSa9meVYgVOguIbtsgAS0lrVeXg3lZrWatQ2X+zACKxDnCDIZu+wjcsX6nO4BU9v+7OhylM=
X-Received: by 2002:a05:6870:d0c2:b0:221:1307:1dd1 with SMTP id
 k2-20020a056870d0c200b0022113071dd1mr147361oaa.49.1710369212362; Wed, 13 Mar
 2024 15:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <17BC6F8FA315450E.6045@lists.openembedded.org> <CACS+7ZQ4YqOW15qiempOViFLPuSGD8sRE=8E6QNK93dJG2JCMg@mail.gmail.com>
In-Reply-To: <CACS+7ZQ4YqOW15qiempOViFLPuSGD8sRE=8E6QNK93dJG2JCMg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Mar 2024 15:33:06 -0700
Message-ID: <CAMKF1sqohdi2+3J3wtZwHmKLT=8qV_DZmgCA_QuqbdXM08XNnw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pylint: Fix ptest failures
To: Dan McGregor <danismostlikely@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Dan McGregor <dan.mcgregor@vecima.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 22:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109300

maybe this recipe needs to inherit dos2unix ?

On Wed, Mar 13, 2024 at 3:05=E2=80=AFPM Dan McGregor <danismostlikely@gmail=
.com> wrote:
>
>
>
> On Wed, Mar 13, 2024, 15:17 Dan McGregor via lists.openembedded.org <dani=
smostlikely=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> From: Dan McGregor <dan.mcgregor@vecima.com>
>>
>> Due to the way we install ptests, some imports switch from
>> first party to third party. Update test expectations
>>
>> Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
>> ---
>>  ...1-Adjust-test-expectations-for-ptest.patch | 44 +++++++++++++++++++
>>  .../python/python3-pylint_3.1.0.bb            |  1 +
>>  2 files changed, 45 insertions(+)
>>  create mode 100644 meta-python/recipes-devtools/python/python3-pylint/0=
001-Adjust-test-expectations-for-ptest.patch
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-pylint/0001-Adj=
ust-test-expectations-for-ptest.patch b/meta-python/recipes-devtools/python=
/python3-pylint/0001-Adjust-test-expectations-for-ptest.patch
>> new file mode 100644
>> index 00000000000..8edecbf1bd1
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-tes=
t-expectations-for-ptest.patch
>> @@ -0,0 +1,44 @@
>> +From f3a213cf4922c122e554277ea2031c0c54cd3fe5 Mon Sep 17 00:00:00 2001
>> +From: Dan McGregor <dan.mcgregor@vecima.com>
>> +Date: Wed, 13 Mar 2024 14:08:25 -0600
>> +Subject: [PATCH] Adjust test expectations for ptest
>> +
>> +Because of the way we install ptests, some first party imports
>> +became third party. Reflect that in the test case.
>> +
>> +Upstream-Status: Inappropriate (embedded specific)
>> +Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
>> +---
>> + tests/functional/w/wrong_import_order.txt | 22 +++++++++++-----------
>> + 1 file changed, 11 insertions(+), 11 deletions(-)
>> +
>> +diff --git a/tests/functional/w/wrong_import_order.txt b/tests/function=
al/w/wrong_import_order.txt
>> +index 068d2140d..9594ff9e0 100644
>> +--- a/tests/functional/w/wrong_import_order.txt
>> ++++ b/tests/functional/w/wrong_import_order.txt
>> +@@ -3,14 +3,14 @@ wrong-import-order:14:0:14:10::"standard import ""sys=
"" should be placed before
>
>
> Hmm, is there a way to specify line endings? This patch needs CRLF line e=
ndings, and it looks like that either didn't make it to the list, or didn't=
 get applied correctly.
>
>> + wrong-import-order:15:0:15:15::"standard import ""datetime"" should be=
 placed before third party imports ""six"", ""astroid.are_exclusive""":UNDE=
FINED
>> + wrong-import-order:18:0:18:22::"third party import ""totally_missing""=
 should be placed before local import ""package.Class""":UNDEFINED
>> + wrong-import-order:20:0:20:14::"third party import ""astroid"" should =
be placed before local imports ""package.Class"", "".package""":UNDEFINED
>> +-wrong-import-order:22:0:22:22::"first party import ""pylint.checkers""=
 should be placed before local imports ""package.Class"", "".package"", "".=
package2""":UNDEFINED
>> +-wrong-import-order:23:0:23:25::"first party import ""pylint.config"" s=
hould be placed before local imports ""package.Class"", "".package"", "".pa=
ckage2""":UNDEFINED
>> +-wrong-import-order:24:0:24:17::"first party import ""pylint.sys"" shou=
ld be placed before local imports ""package.Class"", "".package"", "".packa=
ge2""":UNDEFINED
>> +-wrong-import-order:25:0:25:28::"first party import ""pylint.pyreverse"=
" should be placed before local imports ""package.Class"", "".package"", ""=
.package2""":UNDEFINED
>> +-wrong-import-order:30:0:30:40::"third party import ""six.moves.urllib.=
parse.quote"" should be placed before first party imports ""pylint.checkers=
"", ""pylint.config"", ""pylint.sys"", ""pylint.pyreverse"" and local impor=
ts ""package.Class"", "".package"", "".package2"" (...) ""package3.Class3""=
, "".package4"", ""package4.Class4""":UNDEFINED
>> +-wrong-import-order:31:0:31:23::"first party import ""pylint.constants"=
" should be placed before local imports ""package.Class"", "".package"", ""=
.package2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":=
UNDEFINED
>> +-wrong-import-order:32:0:32:19::"standard import ""re"" should be place=
d before third party imports ""six"", ""astroid.are_exclusive"", ""unused_i=
mport"", ""totally_missing"", ""astroid"", ""six.moves.urllib.parse.quote""=
, first party imports ""pylint.checkers"", ""pylint.config"", ""pylint.sys"=
", ""pylint.pyreverse"", ""pylint.constants"", and local imports ""package.=
Class"", "".package"", "".package2"" (...) ""package3.Class3"", "".package4=
"", ""package4.Class4""":UNDEFINED
>> +-wrong-import-order:32:0:32:19::"third party import ""requests"" should=
 be placed before first party imports ""pylint.checkers"", ""pylint.config"=
", ""pylint.sys"", ""pylint.pyreverse"", ""pylint.constants"" and local imp=
orts ""package.Class"", "".package"", "".package2"" (...) ""package3.Class3=
"", "".package4"", ""package4.Class4""":UNDEFINED
>> +-wrong-import-order:33:0:33:24::"first party import ""pylint.exceptions=
"" should be placed before local imports ""package.Class"", "".package"", "=
".package2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4"""=
:UNDEFINED
>> +-wrong-import-order:34:0:34:21::"first party import ""pylint.message"" =
should be placed before local imports ""package.Class"", "".package"", "".p=
ackage2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UN=
DEFINED
>> +-wrong-import-order:35:0:35:11::"standard import ""time"" should be pla=
ced before third party imports ""six"", ""astroid.are_exclusive"", ""unused=
_import"" (...) ""astroid"", ""six.moves.urllib.parse.quote"", ""requests""=
, first party imports ""pylint.checkers"", ""pylint.config"", ""pylint.sys"=
" (...) ""pylint.constants"", ""pylint.exceptions"", ""pylint.message"", an=
d local imports ""package.Class"", "".package"", "".package2"" (...) ""pack=
age3.Class3"", "".package4"", ""package4.Class4""":UNDEFINED
>> ++wrong-import-order:22:0:22:22::"third party import ""pylint.checkers""=
 should be placed before local imports ""package.Class"", "".package"", "".=
package2""":UNDEFINED
>> ++wrong-import-order:23:0:23:25::"third party import ""pylint.config"" s=
hould be placed before local imports ""package.Class"", "".package"", "".pa=
ckage2""":UNDEFINED
>> ++wrong-import-order:24:0:24:17::"third party import ""pylint.sys"" shou=
ld be placed before local imports ""package.Class"", "".package"", "".packa=
ge2""":UNDEFINED
>> ++wrong-import-order:25:0:25:28::"third party import ""pylint.pyreverse"=
" should be placed before local imports ""package.Class"", "".package"", ""=
.package2""":UNDEFINED
>> ++wrong-import-order:30:0:30:40::"third party import ""six.moves.urllib.=
parse.quote"" should be placed before local imports ""package.Class"", "".p=
ackage"", "".package2"" (...) ""package3.Class3"", "".package4"", ""package=
4.Class4""":UNDEFINED
>> ++wrong-import-order:31:0:31:23::"third party import ""pylint.constants"=
" should be placed before local imports ""package.Class"", "".package"", ""=
.package2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":=
UNDEFINED
>> ++wrong-import-order:32:0:32:19::"standard import ""re"" should be place=
d before third party imports ""six"", ""astroid.are_exclusive"", ""unused_i=
mport"" (...) ""pylint.pyreverse"", ""six.moves.urllib.parse.quote"", ""pyl=
int.constants"" and local imports ""package.Class"", "".package"", "".packa=
ge2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UNDEFI=
NED
>> ++wrong-import-order:32:0:32:19::"third party import ""requests"" should=
 be placed before local imports ""package.Class"", "".package"", "".package=
2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UNDEFINE=
D
>> ++wrong-import-order:33:0:33:24::"third party import ""pylint.exceptions=
"" should be placed before local imports ""package.Class"", "".package"", "=
".package2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4"""=
:UNDEFINED
>> ++wrong-import-order:34:0:34:21::"third party import ""pylint.message"" =
should be placed before local imports ""package.Class"", "".package"", "".p=
ackage2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UN=
DEFINED
>> ++wrong-import-order:35:0:35:11::"standard import ""time"" should be pla=
ced before third party imports ""six"", ""astroid.are_exclusive"", ""unused=
_import"" (...) ""requests"", ""pylint.exceptions"", ""pylint.message"" and=
 local imports ""package.Class"", "".package"", "".package2"" (...) ""packa=
ge3.Class3"", "".package4"", ""package4.Class4""":UNDEFINED
>> diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb=
 b/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
>> index 49f0b3eb6e4..12f4f908af7 100644
>> --- a/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
>> @@ -4,6 +4,7 @@ LICENSE =3D "GPL-2.0-only"
>>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc107cf754550e65755c42985a5d4=
e9c9"
>>
>>  SRC_URI +=3D "git://github.com/pylint-dev/pylint;branch=3Dmaintenance/3=
.1.x;protocol=3Dhttps \
>> +           file://0001-Adjust-test-expectations-for-ptest.patch \
>>             file://run-ptest \
>>             "
>>  SRCREV =3D "053c2c3a25f97f043e10cdd41d2609e495a68f57"
>> --
>> 2.41.0
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109299): https://lists.openembedded.org/g/openembedde=
d-devel/message/109299
> Mute This Topic: https://lists.openembedded.org/mt/104914934/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

