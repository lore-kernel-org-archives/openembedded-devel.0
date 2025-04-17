Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D2BC369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 08:13:36 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.3756.1744877606921500633
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Apr 2025 01:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GvkW97V3;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3f6ab1b8fc1so271457b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 01:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744877606; x=1745482406; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YAdHKRXiCNrF53jMq1576uvV3AvNlk1VlIpafyAgrU=;
        b=GvkW97V3D7PJjUWlxrq1Tr58N+s0GhLOT3zp5ji7+U5MdIAAyTBLsHzZNzjBilGdTF
         KgzsrlsOjWIKHy6U7k9zaxpdgY/7pYiV+6xqecm5xcnYmPSw3D4Aeo332LzdtXr3LXYD
         IZ2gKFTepmC1IiMjPGa+yUchE0uE6fGe5EPlWR4mL6p19q5IO0X4PPFq7DwFIZgF1YVK
         PAoFGRZK+nW6FTntfPu8gU+rLQFg1rxnXUQOGLZv+sjNL7Thvlz5zBhcYH8SraTah5HC
         MFEd6w8iOtV59GnhXmM74nwpZZku+BckMgJ5ghRI6qJz+i/x7Rjb+qRwbu1HJZFDAgI7
         KD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744877606; x=1745482406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YAdHKRXiCNrF53jMq1576uvV3AvNlk1VlIpafyAgrU=;
        b=lDoSySW5FLRSXg75eoKdY83aTcAEThUcOmoy8/5dvSh9CN65JhS2Aomoy5W6lh/HWz
         RZyl0x4U5MpDQou4Z07YKVGljGYpPmfppbTCPvDgdDoEQ7EVDZMYTqMI2yxQwhH0BAoh
         Py0ul5WLyVdA1pXmPdjZGLeHO8q/r90rQitlbGpxBdCc/NS1sXDC+d+CgSWZ4siIZDcH
         vmPgXctzySRpN24WNMnf9YbxCQ+xo6Pr46tKKa5Kqnxswl/VfCg3qQfEKBIXDtaBnlRc
         xkmbcQttfNjwHz2ZcptdjBD0jLSJyx7OeEB9mPJpX5bLoqbrUV5dhB6Me8AP7sP0hasA
         8VIA==
X-Forwarded-Encrypted: i=1; AJvYcCUXnJLVCwvhG8zoTaJWdFJBNo9CINk5FTD29fpH5HVTX3jVopMP4lF+XVu/JyTxQwGu/FAZx2N4XqN3qhRkxKTAJnw=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxh7MLFYRpS0DU4qWDvaMbjHXfMEUi9mBVyIaoA8nVIwi5Fi7CT
	GTq+rhS0GZdhQJ4VVUST7xigUTEaAC3c/+cDDTwkhnwXgd/gER7WDS36v1C4O/YTFiGZ+UCwcAJ
	NgYyKwsyuTniTu0yCDEGEoGGMfMw=
X-Gm-Gg: ASbGncvWXnPIlD6ODT+1Hxold/sF9jtcQp1f6KH7og81dqYulFyM9VgRjrs4gPuRTTz
	j7Vp9M+hlgQkUayVbsoRe6rTBIT5z6jAVJ+tGq27PjeCg1QoIdoEh21BXhMiseH4hQc6JONfa7/
	gT3yH1dRahRHuwhPQcLOpR
X-Google-Smtp-Source: AGHT+IFdtm7nwPxPT+YKDwsLwslrnu9r+khMc/krQPI6gcGpsk+PlztcXKK71mn4wonyqVwi0waSyF0/4n723nxML64=
X-Received: by 2002:a05:6808:1a09:b0:3f9:a187:1f5d with SMTP id
 5614622812f47-400b044c997mr3005473b6e.35.1744877606006; Thu, 17 Apr 2025
 01:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250417010511.592579-1-akuster808@gmail.com> <CA+chaQdk24dJdXGAbE5znWnhVkmk+=YuLEfqmSBQX_6V3_EyaQ@mail.gmail.com>
In-Reply-To: <CA+chaQdk24dJdXGAbE5znWnhVkmk+=YuLEfqmSBQX_6V3_EyaQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Apr 2025 01:12:59 -0700
X-Gm-Features: ATxdqUG_Vy4NyeK3j5sWQeJqHevh9bOJKsTRO4g2BZVKmrMR1ML2KC7jvlvbK6M
Message-ID: <CAMKF1sqP6ETG8QD6vRkHWtxroRV7_spfBBW4kfYwH5B=MqNHLQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][v2][walnascar][PATCH] meta-openemnedded: Add
 myself as walnascar maintainer
To: martin.jansa@gmail.com
Cc: akuster808@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 08:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116927

On Wed, Apr 16, 2025 at 10:05=E2=80=AFPM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> there is still a typo in the subject, "embedded"
>

you eyes are still sharp :) sadly I did not notice it and its installed.
>
> On Thu, 17 Apr 2025, 03:05 Armin Kuster via lists.openembedded.org, <akus=
ter808=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>
>> ---
>> V2]
>> Fix branch name typos
>> ---
>>  README.md                   |  2 +-
>>  meta-filesystems/README.md  | 10 +++++-----
>>  meta-gnome/README.md        | 10 +++++-----
>>  meta-initramfs/README.md    |  8 ++++----
>>  meta-multimedia/README.md   | 10 +++++-----
>>  meta-networking/MAINTAINERS | 11 +++--------
>>  meta-networking/README.md   |  8 ++++----
>>  meta-oe/README.md           |  8 ++++----
>>  meta-perl/README.md         | 11 +++++------
>>  meta-python/README.md       | 12 +++++-------
>>  meta-webserver/README.md    | 11 +++++++----
>>  meta-xfce/README.md         | 11 +++++------
>>  12 files changed, 53 insertions(+), 59 deletions(-)
>>
>> diff --git a/README.md b/README.md
>> index 7318f09cdb..82f2e9699a 100644
>> --- a/README.md
>> +++ b/README.md
>> @@ -1,6 +1,6 @@
>>  Collection of layers for the OE-core universe
>>
>> -Main layer maintainer: Khem Raj <raj.khem@gmail.com>
>> +Main layer maintainer: Armin Kuster <akuster808@gmail.com>
>>
>>  This repository is a collection of layers to suppliment OE-Core
>>  with additional packages, Each layer have designated maintainer
>> diff --git a/meta-filesystems/README.md b/meta-filesystems/README.md
>> index 78a4429ce2..e31b29c493 100644
>> --- a/meta-filesystems/README.md
>> +++ b/meta-filesystems/README.md
>> @@ -11,26 +11,26 @@ This layer depends on:
>>
>>    URI: git://git.openembedded.org/openembedded-core
>>    layers: meta
>> -  branch: master
>> +  branch: walnascar
>>
>>    URI: git://git.openembedded.org/meta-openembedded
>>    layers: meta-oe
>> -  branch: master
>> +  branch: walnascar
>>
>>  Patches
>>  =3D=3D=3D=3D=3D=3D=3D
>>
>>  Please submit any patches against the filesystems layer to the
>>  OpenEmbedded development mailing list (openembedded-devel@lists.openemb=
edded.org)
>> -with '[meta-filesystems]' in the subject.
>> +with '[meta-filesystems][walnascar]' in the subject.
>>
>> -Layer maintainer: Khem Raj <raj.khem@gmail.com>
>> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
>>
>>  When sending single patches, please use something like:
>>
>>     git send-email -1 -M \
>>          --to openembedded-devel@lists.openembedded.org \
>> -        --subject-prefix=3D'meta-filesystems][PATCH'
>> +        --subject-prefix=3D'meta-filesystems][walnascar][PATCH'
>>
>>
>>  Table of Contents
>> diff --git a/meta-gnome/README.md b/meta-gnome/README.md
>> index fbb0d72476..eacf40e94b 100644
>> --- a/meta-gnome/README.md
>> +++ b/meta-gnome/README.md
>> @@ -3,14 +3,14 @@ Dependencies
>>  This layer depends on:
>>
>>  URI: git://git.openembedded.org/openembedded-core
>> -branch: master
>> +branch: walnascar
>>
>>  URI: git://git.openembedded.org/meta-openembedded
>> -branch: master
>> +branch: walnascar
>>
>> -Send pull requests to openembedded-devel@lists.openembedded.org with '[=
meta-gnome]' in the subject'
>> +Send pull requests to openembedded-devel@lists.openembedded.org with '[=
meta-gnome][walnascar]' in the subject'
>>
>>  When sending single patches, please using something like:
>> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3D'meta-gnome][PATCH'
>> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3D'meta-gnome][walnascar][PATCH'
>>
>> -Layer maintainer: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
>> diff --git a/meta-initramfs/README.md b/meta-initramfs/README.md
>> index 119293a741..cfde7a3ae9 100644
>> --- a/meta-initramfs/README.md
>> +++ b/meta-initramfs/README.md
>> @@ -12,19 +12,19 @@ Dependencies
>>  This layer depends on:
>>
>>  URI: git://git.openembedded.org/meta-openembedded
>> -branch: master
>> +branch: walnascar
>>
>>
>>  Maintenance
>>  -----------
>>
>>  Send patches / pull requests to openembedded-devel@lists.openembedded.o=
rg
>> -with '[meta-initramfs]' in the subject.
>> +with '[meta-initramfs][walnascar]' in the subject.
>>
>>  When sending single patches, please using something like:
>> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3D'meta-initramfs][PATCH'
>> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3D'meta-initramfs][walnascar][PATCH'
>>
>> -Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
>> +Interm layer maintainer: Armin Kuster <akuster808@gmail.com>
>>
>>
>>  License
>> diff --git a/meta-multimedia/README.md b/meta-multimedia/README.md
>> index 235c34331b..b8e98d15c8 100644
>> --- a/meta-multimedia/README.md
>> +++ b/meta-multimedia/README.md
>> @@ -1,17 +1,17 @@
>>  This layer depends on:
>>
>>  URI: git://git.openembedded.org/openembedded-core
>> -branch: master
>> +branch: walnascar
>>
>>  URI: git://git.openembedded.org/meta-openembedded
>>  layers: meta-oe
>> -branch: master
>> +branch: walnascar
>>
>> -Send pull requests to openembedded-devel@lists.openembedded.org with '[=
meta-multimedia]' in the subject
>> +Send pull requests to openembedded-devel@lists.openembedded.org with '[=
meta-multimedia][walnascar]' in the subject
>>
>>  When sending single patches, please use something like:
>> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3D'meta-multimedia][PATCH'
>> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3D'meta-multimedia][walnascar][PATCH'
>>
>>  You are encouraged to fork the mirror on github https://github.com/open=
embedded/meta-openembedded to share your patches, this is preferred for pat=
ch sets consisting of more than one patch. Other services like GitLab, repo=
.or.cz or self hosted setups are of course accepted as well, 'git fetch <re=
mote>' works the same on all of them. We recommend github because it is fre=
e, easy to use, has been proven to be reliable and has a really good web GU=
I.
>>
>> -Layer maintainer: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
>> diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
>> index dc549d7582..41c37b58d0 100644
>> --- a/meta-networking/MAINTAINERS
>> +++ b/meta-networking/MAINTAINERS
>> @@ -2,13 +2,13 @@ This file contains a list of maintainers for the meta-=
networking layer.
>>
>>  Please submit any patches against meta-networking to the OpenEmbedded
>>  development mailing list (openembedded-devel@lists.openembedded.org) wi=
th
>> -'[meta-networking]' in the subject.
>> +'[meta-networking][walnascar]' in the subject.
>>
>>  When sending single patches, please use something like:
>>
>>     git send-email -1 -M \
>>          --to openembedded-devel@lists.openembedded.org \
>> -        --subject-prefix=3D'meta-networking][PATCH'
>> +        --subject-prefix=3D'meta-networking][walnascar][PATCH'
>>
>>  You may also contact the maintainers directly.
>>
>> @@ -26,14 +26,9 @@ Please keep this list in alphabetical order.
>>  Maintainers List (try to look for most precise areas first)
>>
>>  COMMON
>> -M:      Khem Raj <raj.khem@gmail.com>
>> -M:      "Joe MacDonald (backup)" <joe@deserted.net>
>> +M:      Armin Kuster <akuster808@gmail.com>
>>  L:      openembedded-devel@lists.openembedded.org
>>  Q:      https://patchwork.openembedded.org/project/oe/
>>  S:      Maintained
>>  F:      conf
>>  F:      recipes-*
>> -
>> -OPENTHREAD
>> -M:      Stefan Schmidt <stefan@datenfreihafen.org>
>> -F:      recipes-connectivity/openthread/
>> diff --git a/meta-networking/README.md b/meta-networking/README.md
>> index ab2640618f..ef7933e319 100644
>> --- a/meta-networking/README.md
>> +++ b/meta-networking/README.md
>> @@ -18,21 +18,21 @@ Dependencies
>>  This layer depends on:
>>
>>  URI: git://git.openembedded.org/openembedded-core
>> -branch: master
>> +branch: Scarthgap
>>
>>  For some recipes, the meta-oe layer is required:
>>
>>  URI: git://git.openembedded.org/meta-openembedded
>>  subdirectory: meta-oe
>> -branch: master
>> +branch: Scarthgap
>>
>>  URI: git://git.openembedded.org/meta-openembedded
>>  subdirectory: meta-python
>> -branch: master
>> +branch: Scarthgap
>>
>>  Maintenance
>>  -----------
>> -Layer maintainers: Khem Raj <raj.khem@gmail.com>
>> +Stable Layer maintainer: Armin Kuster <akuster808@gmail.com>
>>
>>
>>  Please see the MAINTAINERS file for information on contacting the
>> diff --git a/meta-oe/README.md b/meta-oe/README.md
>> index c7c14a4507..6bb7e06119 100644
>> --- a/meta-oe/README.md
>> +++ b/meta-oe/README.md
>> @@ -4,7 +4,7 @@ meta-oe
>>  This layer depends on:
>>
>>  URI: git://github.com/openembedded/openembedded-core.git
>> -branch: master
>> +branch: walnascar
>>
>>  luajit recipe requires host compiler to be able to generate 32bit code =
when target is 32bit
>>  e.g. arm, so ensure that $CC -m32 is functional on build host, if build=
ing this recipe, needed
>> @@ -16,10 +16,10 @@ pacman -S lib32-gcc-libs lib32-glibc
>>  Ubuntu
>>  sudo apt-get install gcc-multilib linux-libc-dev:i386
>>
>> -Send pull requests to openembedded-devel@lists.openembedded.org with '[=
meta-oe]' in the subject'
>> +Send pull requests to openembedded-devel@lists.openembedded.org with '[=
meta-oe][walnascar]' in the subject'
>>
>>  When sending single patches, please use something like:
>> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --=
subject-prefix=3D"meta-oe][PATCH"'
>> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --=
subject-prefix=3D"meta-oe][walnascar][PATCH"'
>>
>>  You are encouraged to fork the mirror on GitHub https://github.com/open=
embedded/meta-openembedded
>>  to share your patches, this is preferred for patch sets consisting of m=
ore than one patch.
>> @@ -33,4 +33,4 @@ Other services like GitLab, repo.or.cz or self-hosted =
setups are of course accep
>>  'git fetch <remote>' works the same on all of them. We recommend GitHub=
 because it is free, easy
>>  to use, has been proven to be reliable and has a really good web GUI.
>>
>> -layer maintainer: Khem Raj <raj.khem@gmail.com>
>> +layer maintainer: Armin Kuster <akuster808@gmail.com>
>> diff --git a/meta-perl/README.md b/meta-perl/README.md
>> index 13014b0ff3..80e5c84bb7 100644
>> --- a/meta-perl/README.md
>> +++ b/meta-perl/README.md
>> @@ -52,7 +52,7 @@ Dependencies
>>  This layer depends on:
>>
>>    URI: git://git.openembedded.org/openembedded-core
>> -  branch: master
>> +  branch: walnascar
>>
>>  Adding the meta-perl layer to your build
>>  ---------------------------------------
>> @@ -73,14 +73,13 @@ Maintenance
>>  -----------
>>
>>  Send patches / pull requests to openembedded-devel@lists.openembedded.o=
rg with
>> -'[meta-perl]' in the subject.
>> +'[meta-perl][walnascar]' in the subject.
>>
>>  When sending single patches, please using something like:
>> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3D'meta-perl][PATCH'
>> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3D'meta-perl][walnascar][PATCH'
>>
>> -Layer maintainers:
>> -    Hongxu Jia <hongxu.jia@windriver.com>
>> -    Tim "moto-timo" Orling <ticotimo@gmail.com>
>> +Layer maintainers: Armin Kuster <akuster808@gmail.com>
>> +
>>
>>  License
>>  -------
>> diff --git a/meta-python/README.md b/meta-python/README.md
>> index 36c193957c..bf1ad0874d 100644
>> --- a/meta-python/README.md
>> +++ b/meta-python/README.md
>> @@ -13,11 +13,11 @@ The meta-python layer depends on:
>>
>>         URI: git://git.openembedded.org/openembedded-core
>>         layers: meta
>> -       branch: master
>> +       branch: walnascar
>>
>>         URI: git://git.openembedded.org/meta-openembedded
>>         layers: meta-oe
>> -       branch: master
>> +       branch: walnascar
>>
>>  Contributing
>>  -------------------------
>> @@ -28,14 +28,12 @@ comments and patch review. It is subscriber only, so=
 please register
>>  before posting.
>>
>>  Send pull requests to openembedded-devel@lists.openembedded.org with
>> -'[meta-python]' in the subject.
>> +'[meta-python][walnascar]' in the subject.
>>
>>  When sending single patches, please use something like:
>> -git send-email -M -1 --to=3Dopenembedded-devel@lists.openembedded.org -=
-subject-prefix=3D'meta-python][PATCH'
>> +git send-email -M -1 --to=3Dopenembedded-devel@lists.openembedded.org -=
-subject-prefix=3D'meta-python][walnascar][PATCH'
>>
>>  Maintenance
>>  -------------------------
>>
>> -Layer maintainers:
>> -        Tim "moto-timo" Orling <TicoTimo@gmail.com>
>> -        Derek Straka <derek@asterius.io>
>> +Layer maintainers: Armin Kuster <akuster808@gmail.com>
>> diff --git a/meta-webserver/README.md b/meta-webserver/README.md
>> index d1b743887c..3c7fd7f827 100644
>> --- a/meta-webserver/README.md
>> +++ b/meta-webserver/README.md
>> @@ -13,13 +13,13 @@ This layer depends on:
>>
>>  URI: git://git.openembedded.org/openembedded-core
>>  subdirectory: meta
>> -branch: master
>> +branch: walnascar
>>
>>  For some recipes, the meta-oe layer is required:
>>
>>  URI: git://git.openembedded.org/meta-openembedded
>>  subdirectory: meta-oe
>> -branch: master
>> +branch: walnascar
>>
>>
>>
>> @@ -50,9 +50,12 @@ Maintenance
>>  -----------
>>
>>  Send patches / pull requests to openembedded-devel@lists.openembedded.o=
rg
>> -with '[meta-webserver]' in the subject.
>> +with '[meta-webserver][walnascar]' in the subject.
>>
>> -Layer maintainer: Derek Straka <derek@asterius.io>
>> +When sending single patches, please using something like:
>> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3D'meta-webserver][walnascar][PATCH'
>> +
>> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
>>
>>
>>  License
>> diff --git a/meta-xfce/README.md b/meta-xfce/README.md
>> index 3d6158628f..fb577a48fb 100644
>> --- a/meta-xfce/README.md
>> +++ b/meta-xfce/README.md
>> @@ -1,10 +1,10 @@
>>  This layer depends on:
>>
>>  URI: git://git.openembedded.org/openembedded-core
>> -branch: master
>> +branch: walnascar
>>
>>  URI: git://git.openembedded.org/meta-openembedded
>> -branch: master
>> +branch: walnascar
>>
>>  meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this re=
pository.
>>
>> @@ -13,10 +13,9 @@ this to local.conf:
>>
>>  BBMASK =3D "meta-xfce/recipes-multimedia"
>>
>> -Send pull requests to openembedded-devel@lists.openembedded.org with '[=
meta-xfce]' in the subject'
>> +Send pull requests to openembedded-devel@lists.openembedded.org with '[=
meta-xfce][walnascar]' in the subject'
>>
>>  When sending single patches, please using something like:
>> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3D'meta-xfce][PATCH'
>> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3D'meta-xfce][walnascar][PATCH'
>>
>> -Layer maintainer: Kai Kang <kai.kang@windriver.com>
>> -Layer maintainer: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
>> --
>> 2.43.0
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116917): https://lists.openembedded.org/g/openembedde=
d-devel/message/116917
> Mute This Topic: https://lists.openembedded.org/mt/112306341/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

