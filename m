Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A7DC48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 09:55:54 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.18187.1707213349682674860
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 01:55:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fps6lwBV;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-511234430a4so9454337e87.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 01:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707213348; x=1707818148; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgDD+Fgt267eBDkzDUi31DDPbQQPyND7FTaqAcl2vDo=;
        b=Fps6lwBVPrDgQyMUEYeYeOBFbKjMvQH8uSVjkSiqCAZB7jOTAnizRFJP7t34oDqU1f
         1sgpW7ciBM5w8IDxTZ2tsmcwMpLQ7BwGY0CHP8qVtcA9P6hUfMom/NdBRW3ZyjflAWT5
         gPx/rwGgTX7ufY8JgmonKNDhrBkp2uE6yKPMpwYBMGq+PBjlUnF/gBaEbLIYEc0a3NE8
         cXz8Db8o5jC0VPy29QPOT0fzPAsiNpMvH7H8iJMoyCtToIN3fEq7W3hSeI2Kq3g3O/Gu
         MrtgJLJmr6fNAMC5LLSmNMFvI34H54EbXjg+hAfvH65I4/awrdiZCPbYWkQr1Mhj35Q9
         +dmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707213348; x=1707818148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgDD+Fgt267eBDkzDUi31DDPbQQPyND7FTaqAcl2vDo=;
        b=kaPuqojVESNRoXoyWGnsSYgCdJ+PkgvZiXoESh0bg5p0nJ/msCe2EoA+lKR22Gwhmg
         gkRvFx6LuqSki/zRccjroNc29ioM7c2UwJJ7g54xnGelzRW0rxx7poHJ5RGxzXo24E3l
         kNHxbGfEITOuc5HGrY4NRMb+Db0PnbdMM0P27KQ2T+LiqXKB8/WkhDcp/LYhVLuZGGEf
         YrYH+XQ+Y0ieQwtraTXIP8dhCXeheV7RfhEbr9jOpg90HDzJSMBZL3aKZpZKXKVOygwN
         sPV8hvuIRWcQ8nQKfdW99LzjH3mGEA60iclVBiZ/Ot0rsLrzyo44cCN68Kv4FC8XEPQv
         rAKQ==
X-Gm-Message-State: AOJu0YzyPmJKyy/d5sjMJWLCFAxQS79MYu8W72VSknVwDs2W5ASBxM9a
	N/CBp1H55QCISs3egtez9fO0clfrs98deB2EKNOpelIGOJ/Tm2t9V5hJLTQD1mS7vnJOPt1i1LI
	jKi8FpZ5hr4RZhW3zGtQv6HHmL7U=
X-Google-Smtp-Source: AGHT+IEhnEwIN8e2WAttCk8WkriAbf4zA9Q7+h2S8EFfFOlOlQBEnc//GMM5dhjbEYdAnQKIM+FbD61IxvlI/OTx2h0=
X-Received: by 2002:a19:ad48:0:b0:511:3bb3:d9eb with SMTP id
 s8-20020a19ad48000000b005113bb3d9ebmr1151456lfd.25.1707213347572; Tue, 06 Feb
 2024 01:55:47 -0800 (PST)
MIME-Version: 1.0
References: <17AB719CBDBAADCC.12800@lists.openembedded.org>
In-Reply-To: <17AB719CBDBAADCC.12800@lists.openembedded.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 6 Feb 2024 10:55:35 +0100
Message-ID: <CAJiuCccqKmbdUpgUZYQuREuLFprxZU0hfEJWwrisvV9EcfTeNA@mail.gmail.com>
Subject: Re: [oe] [PATCH] protobuf: upgrade 4.23.4 -> 4.25.2
To: peron.clem@gmail.com, peter.marko@siemens.com, 
	Samuli Piippo <samuli.piippo@gmail.com>, Xiangyu Chen <xiangyu.chen@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 09:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108620

Hi,

On Thu, 18 Jan 2024 at 13:43, Cl=C3=A9ment P=C3=A9ron via lists.openembedde=
d.org
<peron.clem=3Dgmail.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>  .../protobuf/{protobuf_4.23.4.bb =3D> protobuf_4.25.2.bb}       | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-devtools/protobuf/{protobuf_4.23.4.bb =3D> protob=
uf_4.25.2.bb} (98%)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb b/meta-=
oe/recipes-devtools/protobuf/protobuf_4.25.2.bb
> similarity index 98%
> rename from meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf_4.25.2.bb
> index 7d37ee3d2..6cd44a4e7 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.2.bb
> @@ -10,9 +10,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D37b5762e07f0=
af8c74ce80a8bda4266b"
>  DEPENDS =3D "zlib abseil-cpp"
>  DEPENDS:append:class-target =3D " protobuf-native"
>
> -SRCREV =3D "2c5fa078d8e86e5f4bd34e6f4c9ea9e8d7d4d44a"
> +SRCREV =3D "a9b006bddd52e289029f16aa77b77e8e0033d9ee"

When I try to compile my project that use Protobuf with the SDK, the
Cmake find_package(protobuf CONFIG) fails with the following error:

>>>>>>>>>>>>>>>>>>>>>
CMake Error at SDK_ROOTFS/usr/lib/cmake/utf8_range/utf8_range-targets.cmake=
:90
(message):
The imported target "utf8_range::utf8_validity" references the file

"SDK_ROOTFS/usr/lib/libutf8_validity.a"

but this file does not exist. Possible reasons include:

* The file was deleted, renamed, or moved to another location.

* An install or uninstall procedure did not complete successfully.

* The installation package was faulty and contained

"SDK_ROOTFS/usr/lib/cmake/utf8_range/utf8_range-targets.cmake"

but not all the files it references.

Call Stack (most recent call first):
SDK_ROOTFS/usr/lib/cmake/utf8_range/utf8_range-config.cmake:7 (include)
SDK_ROOTFS/usr/lib/cmake/protobuf/protobuf-config.cmake:12 (find_package)
modules/grpc/CMakeLists.txt:17 (find_package)
<<<<<<<<<<<<<<<<<<<<<<<<<<<


It could be fixed by adding:
+ TOOLCHAIN_TARGET_TASK:append =3D " protobuf-staticdev"

To the SDK distro configuration file.

Is there a proper way to include this in the recipe file?

Thanks for your help,


>
> -SRC_URI =3D "gitsm://github.com/protocolbuffers/protobuf.git;branch=3D23=
.x;protocol=3Dhttps \
> +SRC_URI =3D "gitsm://github.com/protocolbuffers/protobuf.git;branch=3D25=
.x;protocol=3Dhttps \
>             file://run-ptest \
>             file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-f=
ix-.patch \
>             "
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108343): https://lists.openembedded.org/g/openembedde=
d-devel/message/108343
> Mute This Topic: https://lists.openembedded.org/mt/103807004/4240582
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [p=
eron.clem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

