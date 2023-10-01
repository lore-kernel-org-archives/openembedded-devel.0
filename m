Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379ABE748ED
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 11:07:13 +0000 (UTC)
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by mx.groups.io with SMTP id smtpd.web11.57055.1696155977003956397
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Oct 2023 03:26:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@kde.org header.s=users header.b=axYVXyc8;
 spf=pass (domain: kde.org, ip: 46.43.1.242, mailfrom: cordlandwehr@kde.org)
Received: from [IPV6:2003:e2:7f45:2f00:482c:3ce:67d1:e4ad] (p200300e27f452f00482c03ce67d1e4ad.dip0.t-ipconnect.de [IPv6:2003:e2:7f45:2f00:482c:3ce:67d1:e4ad])
	(Authenticated sender: cordlandwehr)
	by letterbox.kde.org (Postfix) with ESMTPSA id AB8F83283AD;
	Sun,  1 Oct 2023 11:26:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
	t=1696155973; bh=fu49IrR5SjKs3FkmMgKqU1CeOh5JnLt7coV6RVP01/Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=axYVXyc8DrN1nzAvcHAny5Y5MVm90qK6h8DWslX9RF462qAPwIEaKKVyC7RDczKbo
	 xoCpP1Jw+ckSELVYjRifvbi6517/yCPgNjkuV4UR1MAvOTMIoT5Fd1bmVCTaCItPs7
	 fFJc+Jst99g+4ZV/9EbrJAiJWgcBvX7RF28AA464DDi/4ZsJ9rX2c14G1uZuZdnF+6
	 Hyu2af1NGc7y52GcawlyqFZkVYykAkZCo5bXjIZL1VjInNSUmzeRlqMjIJt5RwPeP3
	 AO5Bx77c4sjazF9wk+WNAy4jgx6paHlcG2iDDRSadpTbzO94Cv/C//RhWkpGbCvr0F
	 6uBn9spb4tRVw==
Message-ID: <0872e4af-c093-06ad-65a1-45063e9456f3@kde.org>
Date: Sun, 1 Oct 2023 12:26:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [oe] [PATCH] wayland: consider pkgconfig sysroot for pkgdatadir
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230930105454.197209-1-cordlandwehr@kde.org>
 <CAMKF1srvGQC+RzPVpArOARiXOMhN_CkKpr52gATRcBprGyAd9w@mail.gmail.com>
From: "Andreas Cord-Landwehr" <cordlandwehr@kde.org>
In-Reply-To: <CAMKF1srvGQC+RzPVpArOARiXOMhN_CkKpr52gATRcBprGyAd9w@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Oct 2023 11:07:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105296

Hi Khem,

thank your for the hint! Will resent the patch to the correct list.

Best regards,
Andreas

On 01.10.23 00:50, Khem Raj wrote:
> Hi Andreas
>=20
> Thanks for the patch, but since this component is part of core layer,
> the patch for core layers should be sent to
> openembedded-core@lists.openembedded.org see
> https://docs.yoctoproject.org/contributor-guide/submit-changes.html#findi=
ng-a-suitable-mailing-list
>=20
> On Sat, Sep 30, 2023 at 3:37=E2=80=AFPM Andreas Cord-Landwehr
> <cordlandwehr@kde.org> wrote:
>>
>> Fix pkgconfig find calls to find wayland protocol XML files.
>> See discussion in:
>> https://gitlab.freedesktop.org/wayland/wayland/-/merge_requests/102
>>
>> Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
>> ---
>>   ...der-pkgconfig-sysroot-for-pkgdatadir.patch | 46 +++++++++++++++++++
>>   .../wayland/wayland_1.22.0.bb                 |  1 +
>>   2 files changed, 47 insertions(+)
>>   create mode 100644 meta/recipes-graphics/wayland/wayland/0002-Consider=
-pkgconfig-sysroot-for-pkgdatadir.patch
>>
>> diff --git a/meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconf=
ig-sysroot-for-pkgdatadir.patch b/meta/recipes-graphics/wayland/wayland/000=
2-Consider-pkgconfig-sysroot-for-pkgdatadir.patch
>> new file mode 100644
>> index 0000000000..4573bb635a
>> --- /dev/null
>> +++ b/meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfig-sysr=
oot-for-pkgdatadir.patch
>> @@ -0,0 +1,46 @@
>> +From ff8ecbe8891d592e645927659318720f9e190054 Mon Sep 17 00:00:00 2001
>> +From: Andreas Cord-Landwehr <cordlandwehr@kde.org>
>> +Date: Sun, 6 Feb 2022 17:23:46 +0100
>> +Subject: [PATCH] Consider pkgconfig sysroot for pkgdatadir
>> +
>> +For libs/cflags this is done automatically, but not for manually access=
ed
>> +variables. This matches what wayland-protocols does.
>> +
>> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/wayl=
and/-/merge_requests/272]
>> +---
>> + src/meson.build | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/src/meson.build b/src/meson.build
>> +index a8a1d2b..721e151 100644
>> +--- a/src/meson.build
>> ++++ b/src/meson.build
>> +@@ -65,7 +65,7 @@ if get_option('scanner')
>> +               version: meson.project_version(),
>> +               variables: [
>> +                       'datarootdir=3D' + join_paths('${prefix}', get_o=
ption('datadir')),
>> +-                      'pkgdatadir=3D' + join_paths('${datarootdir}', m=
eson.project_name()),
>> ++                      'pkgdatadir=3D' + join_paths('${pc_sysrootdir}${=
datarootdir}', meson.project_name()),
>> +                       'bindir=3D' + join_paths('${prefix}', get_option=
('bindir')),
>> +                       'wayland_scanner=3D${bindir}/wayland-scanner'
>> +               ],
>> +@@ -211,7 +211,7 @@ if get_option('libraries')
>> +               filebase: 'wayland-server',
>> +               variables: [
>> +                       'datarootdir=3D' + join_paths('${prefix}', get_o=
ption('datadir')),
>> +-                      'pkgdatadir=3D' + join_paths('${datarootdir}', m=
eson.project_name())
>> ++                      'pkgdatadir=3D' + join_paths('${pc_sysrootdir}${=
datarootdir}', meson.project_name())
>> +               ]
>> +       )
>> +
>> +@@ -250,7 +250,7 @@ if get_option('libraries')
>> +               filebase: 'wayland-client',
>> +               variables: [
>> +                       'datarootdir=3D' + join_paths('${prefix}', get_o=
ption('datadir')),
>> +-                      'pkgdatadir=3D' + join_paths('${datarootdir}', m=
eson.project_name())
>> ++                      'pkgdatadir=3D' + join_paths('${pc_sysrootdir}${=
datarootdir}', meson.project_name())
>> +               ]
>> +       )
>> +
>> +--
>> +2.37.2
>> diff --git a/meta/recipes-graphics/wayland/wayland_1.22.0.bb b/meta/reci=
pes-graphics/wayland/wayland_1.22.0.bb
>> index 26bad580eb..17e4a0cd98 100644
>> --- a/meta/recipes-graphics/wayland/wayland_1.22.0.bb
>> +++ b/meta/recipes-graphics/wayland/wayland_1.22.0.bb
>> @@ -15,6 +15,7 @@ DEPENDS =3D "expat libffi wayland-native"
>>   SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland/-/releases=
/${PV}/downloads/${BPN}-${PV}.tar.xz \
>>              file://run-ptest \
>>              file://0001-build-Fix-strndup-detection-on-MinGW.patch \
>> +           file://0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch =
\
>>              "
>>   SRC_URI[sha256sum] =3D "1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d129=
36ebb7e7cbc2425842"
>>
>> --
>> 2.39.2
>>
>>
>>=20
>>

