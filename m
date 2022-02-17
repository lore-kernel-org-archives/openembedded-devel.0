Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C3AC433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 07:30:26 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.4736.1645083022479218803
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 23:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout12.t-online.de (Postfix) with SMTP id E83521565A
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:29:14 +0100 (CET)
Received: from [192.168.178.83] ([79.219.224.19]) by fwd86.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nKbE2-0Yl2Hp0; Thu, 17 Feb 2022 08:29:14 +0100
Message-ID: <630ecc73-910a-5b40-66ad-bb2b01ce82ac@t-online.de>
Date: Thu, 17 Feb 2022 08:29:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-gnome][PATCH] seahorse: initial add recipe
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20220216165722.25908-1-f_l_k@t-online.de>
 <CAMKF1sqA_Dryp--gMJtnbNtKgbzQ1KCJL31q_ptT54SOG0Ao3g@mail.gmail.com>
 <16D4815E2CBA08CD.19478@lists.openembedded.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <16D4815E2CBA08CD.19478@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1645082954-000116DC-E81F7E48/0/0 CLEAN NORMAL
X-TOI-MSGID: 04dc9f79-cbb3-4252-b7bf-3bb4a76629e7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Feb 2022 07:30:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95354

Maybe i'm not running into this because i have this in my config ?

IMAGE_FEATURES +=3D " ssh-server-openssh"

Am 17.02.22 um 08:13 schrieb Markus Volk:
> That's strange. I have this error only without using
> meson-build-dont-look-for-native-ssh-keygen.patch
>
>
> Native ssh Dependency is fullfilled because we have it in HOSTTOOLS,=20
> probably because the machine fails to build openssh-native. But we=20
> dont provide native ssh-keygen. Adding it to hosttools would help to=20
> fix the issue.
> Does it help to add 'openssh' to depends ?
>
> Am 17.02.22 um 07:59 schrieb Khem Raj:
>> seeing configure failure
>> https://errors.yoctoproject.org/Errors/Details/625735/
>>
>> On Wed, Feb 16, 2022 at 8:57 AM Markus Volk <f_l_k@t-online.de> wrote:
>>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>>> ---
>>> =C2=A0 ...uild-dont-look-for-native-ssh-keygen.patch | 15 +++++++++++
>>> =C2=A0 .../recipes-gnome/seahorse/seahorse_41.0.bb=C2=A0=C2=A0 | 27=20
>>> +++++++++++++++++++
>>> =C2=A0 2 files changed, 42 insertions(+)
>>> =C2=A0 create mode 100644=20
>>> meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-for-=
native-ssh-keygen.patch
>>> =C2=A0 create mode 100644 meta-gnome/recipes-gnome/seahorse/seahorse_=
41.0.bb
>>>
>>> diff --git=20
>>> a/meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-fo=
r-native-ssh-keygen.patch=20
>>> b/meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-fo=
r-native-ssh-keygen.patch=20
>>>
>>> new file mode 100644
>>> index 000000000..ac83de486
>>> --- /dev/null
>>> +++=20
>>> b/meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-fo=
r-native-ssh-keygen.patch
>>> @@ -0,0 +1,15 @@
>>> +From: Markus Volk <f_l_k@t-online.de>
>>> +Date: Tue, 16 Feb 2022 10:38:04 +0100
>>> +Subject: [PATCH] meson.build: dont look for native ssh-keygen
>>> +
>>> +--- a/meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2022-02-16 10:38:04.=
170081321 +0100
>>> ++++ b/meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2022-02-16 10:38:28.=
257864179 +0100
>>> +@@ -44,7 +44,7 @@
>>> + libpwquality =3D dependency('pwquality')
>>> + posix =3D valac.find_library('posix')
>>> + ssh_bin =3D find_program('ssh')
>>> +-ssh_keygen =3D find_program('ssh-keygen')
>>> ++ssh_keygen =3D find_program('ssh-keygen', native : false)
>>> + gpg_bin =3D find_program('gpg2', 'gpg', required:=20
>>> get_option('pgp-support'))
>>> + gpgme_dep =3D dependency('gpgme', version: '>=3D 1.14.0', required:=
=20
>>> get_option('pgp-support'))
>>> +
>>> diff --git a/meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb=20
>>> b/meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb
>>> new file mode 100644
>>> index 000000000..ec1328598
>>> --- /dev/null
>>> +++ b/meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb
>>> @@ -0,0 +1,27 @@
>>> +SUMMARY =3D "Seahorse is a graphical interface for managing and usin=
g=20
>>> encryption keys."
>>> +LICENSE=3D"GPLv2"
>>> +LIC_FILES_CHKSUM =3D=20
>>> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
>>> +
>>> +GNOMEBASEBUILDCLASS =3D "meson"
>>> +
>>> +DEPENDS =3D " \
>>> +=C2=A0=C2=A0=C2=A0 avahi \
>>> +=C2=A0=C2=A0=C2=A0 gcr \
>>> +=C2=A0=C2=A0=C2=A0 glib-2.0 \
>>> +=C2=A0=C2=A0=C2=A0 gnupg \
>>> +=C2=A0=C2=A0=C2=A0 gpgme \
>>> +=C2=A0=C2=A0=C2=A0 gtk+3 \
>>> +=C2=A0=C2=A0=C2=A0 libhandy \
>>> +=C2=A0=C2=A0=C2=A0 libpwquality \
>>> +=C2=A0=C2=A0=C2=A0 libsecret \
>>> +=C2=A0=C2=A0=C2=A0 libsoup-2.4 \
>>> +=C2=A0=C2=A0=C2=A0 openldap \
>>> +"
>>> +
>>> +inherit gnomebase itstool vala
>>> +
>>> +SRC_URI:append =3D "=20
>>> file://meson-build-dont-look-for-native-ssh-keygen.patch"
>>> +SRC_URI[archive.sha256sum] =3D=20
>>> "e6eec09e810448295f547f18c1d5772b65c3edc1d9e5a2595f10b5dde68929f5"
>>> +
>>> +FILES:${PN} +=3D "${datadir}"
>>> +
>>> --=20
>>> 2.25.1
>>>
>>>
>>>
>>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95353): https://lists.openembedded.org/g/openembedd=
ed-devel/message/95353
> Mute This Topic: https://lists.openembedded.org/mt/89189799/3618223
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[f_l_k@t-online.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

