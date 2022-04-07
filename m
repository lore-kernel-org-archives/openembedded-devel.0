Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5377C35295
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:14 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web09.4446.1649321783654231988
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Apr 2022 01:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19,
 mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout06.t-online.de (Postfix) with SMTP id B466912462;
	Thu,  7 Apr 2022 10:56:21 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.46.130]) by fwd82.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1ncNwD-0D46530; Thu, 7 Apr 2022 10:56:21 +0200
Message-ID: <0923b514-1823-6a8f-c495-6dce9c904698@t-online.de>
Date: Thu, 7 Apr 2022 10:56:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [oe] [meta-gnome][PATCH] gparted: update to v1.4.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20220404141948.3373-1-f_l_k@t-online.de>
 <CAMKF1srnu9-T4id=oC0wAvGVXtAu3AzaXPjj3_B=crcOtT12qg@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <CAMKF1srnu9-T4id=oC0wAvGVXtAu3AzaXPjj3_B=crcOtT12qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1649321781-0000B8A1-8963D8F1/0/0 CLEAN NORMAL
X-TOI-MSGID: 69748405-6bca-45d6-9cc5-77e6a22a6e99
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96448

I have had a look at this. To me it looks like musl string.h does not=20
define basename() for cplusplus. I'm not really an expert on musl or=20
c/c++ and don't know the difference between these two functions in=20
detail, but I was able to fix the problem for musl by replacing gnu=20
basename with glib's variant.

I'll send a v2, but since this is security related stuff, I have to=20
admit that I'm not the one to say "this is a proper solution".


Am 07.04.22 um 02:17 schrieb Khem Raj:
> fails on musl
>
> https://errors.yoctoproject.org/Errors/Details/654013/
>
> On Mon, Apr 4, 2022 at 10:20 AM Markus Volk <f_l_k@t-online.de> wrote:
>> - remove x11 features-check because there aren't dependencies that wou=
ld
>>    explicilty require x11 as a DISTRO_FEATURE
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>> GParted 1.4.0   (2022-03-28)
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>>
>> Release Notes
>> -------------
>>    This release of GParted includes enhancements, bug fixes and
>>    language translation updates.
>>
>>    * Add labelling of mounted btrfs, ext2/3/4 and xfs file systems
>>    * Fix detection of mount points for encrypted file systems
>>    * Fix crash scrolling quickly in the drive selection combobox
>>    * Add bcache detection
>>    * Add JBD external EXT3/4 journal detection
>>
>> Bug Fixes
>> ---------
>>    * Add labelling of mounted btrfs, ext2/3/4 and xfs file systems (#1=
63, !87)
>>    * Fix detection of mount points for encrypted file systems (#162, !=
88)
>>    * Fix unmount error when unmounting below a bind mount point (!89)
>>    * Fix crash scrolling quickly in the drive selection combobox (#165=
, !91)
>>    * Add initial Indonesian translation of help (!90)
>>    * Add accessibility relations for screen readers like Orca (!92)
>>    * Fix partition creation at sector 2048 if partition before it (#17=
2, !93)
>>    * Make more getter methods use return-by-constant-reference (!94)
>>    * Check copy destination instead of source (!95)
>>    * Add bcache detection (#183, !96)
>>    * Add JBD external EXT3/4 journal detection (#89, !97)
>>    * Fix translation of DocBook markup tag of the GParted Manual (!98)
>>
>> Code Credits
>> ------------
>>    Code enhancements are courtesy of Movie Ma, Pascal Eng=C3=A9libert,=
 and
>>    Mike Fleetwood.
>>
>> Translations (new/updated)
>> --------------------------
>>    cs(Marek =C4=8Cernock=C3=BD), da(Alan Mortensen), eu(Asier Sarasua =
Garmendia),
>>    fur(Fabio Tomat), he(Yaron Shahrabani), hr(Goran Vidovi=C4=87),
>>    hu(Bal=C3=A1zs =C3=9Ar), id(Andika Triwidada), it(Milo Casagrande),
>>    ko(Seong-ho Cho), lt(Aurimas =C4=8Cernius), lv(R=C5=ABdolfs Mazurs)=
,
>>    nb(Kjell Cato Heskjestad), nl(Nathan Follens), pa(A S Alam),
>>    pt(Hugo Carvalho), ru(Aleksandr Melman, Sergej A), sk(Du=C5=A1an Ka=
zik),
>>    sl(Matej Urban=C4=8Di=C4=8D), sr(=D0=9C=D0=B8=D1=80=D0=BE=D1=81=D0=BB=
=D0=B0=D0=B2 =D0=9D=D0=B8=D0=BA=D0=BE=D0=BB=D0=B8=D1=9B), zh_CN(Luming Zh=
)
>>
>> Dependencies (new/updated)
>> --------------------------
>>    * n/a
>>
>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> ---
>>   .../gparted/{gparted_1.3.1.bb =3D> gparted_1.4.0.bb}           | 5 +=
+---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>   rename meta-gnome/recipes-extended/gparted/{gparted_1.3.1.bb =3D> gp=
arted_1.4.0.bb} (83%)
>>
>> diff --git a/meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb b/me=
ta-gnome/recipes-extended/gparted/gparted_1.4.0.bb
>> similarity index 83%
>> rename from meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb
>> rename to meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb
>> index d1a975930..d1297b5a2 100644
>> --- a/meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb
>> +++ b/meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb
>> @@ -3,16 +3,15 @@ HOMEPAGE =3D "http://gparted.org/index.php"
>>   LICENSE =3D "GPL-2.0-only"
>>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df07=
9bae19f"
>>
>> -inherit features_check autotools pkgconfig python3native gnome-help g=
tk-icon-cache
>> +inherit autotools pkgconfig python3native gnome-help gtk-icon-cache
>>
>> -REQUIRED_DISTRO_FEATURES =3D "x11"
>>
>>   SRC_URI =3D " \
>>       ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-=
${PV}.tar.gz \
>>       file://0001-Install-polkit-action-unconditionally-executable-pke=
.patch \
>>       file://0001-Do-not-use-NULL-where-boolean-is-expected.patch \
>>   "
>> -SRC_URI[sha256sum] =3D "5eee2e6d74b15ef96b13b3a2310c868ed2298e0334102=
1e7d12a5a98a1d1e109"
>> +SRC_URI[sha256sum] =3D "e5293a792e53fdbeba29c4a834113cd9603d0d639330d=
a931a468bf3687887be"
>>
>>   UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/gparted/fil=
es/gparted/"
>>   UPSTREAM_CHECK_REGEX =3D "gparted-(?P<pver>\d+\.(\d+)+(\.\d+)+)"
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#96382): https://lists.openembedded.org/g/openembed=
ded-devel/message/96382
>> Mute This Topic: https://lists.openembedded.org/mt/90242693/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

