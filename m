Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B71FBC4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 11:50:17 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.19046.1713181811829359438
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Apr 2024 04:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout11.t-online.de (Postfix) with SMTP id B5A56995C;
	Mon, 15 Apr 2024 13:50:09 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.43.130]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rwKqe-2121kO0; Mon, 15 Apr 2024 13:50:08 +0200
Date: Mon, 15 Apr 2024 13:50:27 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] edid-decode: allow to build native variant
To: Ross Burton <Ross.Burton@arm.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-Id: <3KFZBS.IAWV1RULZJBC3@t-online.de>
In-Reply-To: <3099CDAE-8DC0-4B0F-BA45-F1CF0E10ADE8@arm.com>
References: <20240414125805.2253456-1-f_l_k@t-online.de>
	<DDAA3D7E-61F0-4774-BAB1-8996BAC56833@arm.com>
	<1QEZBS.61V5422DWMEK@t-online.de>
	<3099CDAE-8DC0-4B0F-BA45-F1CF0E10ADE8@arm.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-RWgINJFDMib1nAmXdJOE"
X-TOI-EXPURGATEID: 150726::1713181808-E6FA6DDA-EE9BEAF5/0/0 CLEAN NORMAL
X-TOI-MSGID: 33491161-8dde-4b7c-99f6-f272a120aa9d
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 11:50:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109960

--=-RWgINJFDMib1nAmXdJOE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Thats absolutely true . But still I dont think it is a bug in the=20
libdisplay-info build system, because edid-decode is requested for the=20
tests and is requested native explicitly.

On Mon, Apr 15 2024 at 11:41:38 AM +00:00:00, Ross Burton=20
<Ross.Burton@arm.com> wrote:
>=20
>=20
>>  On 15 Apr 2024, at 12:32, Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>> wrote:
>>=20
>>  On Mon, Apr 15 2024 at 11:07:45 AM +00:00:00, Ross Burton=20
>> <Ross.Burton@arm.com <mailto:Ross.Burton@arm.com>> wrote:
>>>  Surely that=C2=B4s a bug in the meson.build? It doesn=C2=B4t want to f=
ind=20
>>> a native binary.
>>=20
>>=20
>>  Its added here, I think mostly for testing purpose:
>>=20
>> =20
>> <https://gitlab.freedesktop.org/emersion/libdisplay-info/-/blob/main/tes=
t/meson.build#L1>
>> =20
>> <https://gitlab.freedesktop.org/emersion/libdisplay-info/-/blob/main/tes=
t/meson.build#L10>
>> =20
>> <https://gitlab.freedesktop.org/emersion/libdisplay-info/-/blob/main/tes=
t/meson.build#L59>
>> =20
>> <https://gitlab.freedesktop.org/emersion/libdisplay-info/-/blob/main/tes=
t/meson.build#L66>
>>=20
>>  If edid-decode is added a s a native dependency, an additional=20
>> binary will be installed '/usr/bin/di-edid-decode=E2=80=99
>=20
> Are you sure about that?  All of those references are specific to the=20
> test suite (which would want native binaries, unless they make the=20
> effort to support installable tests).  The di-edid-decode binary is=20
> buillt and installed by=20
> <https://gitlab.freedesktop.org/emersion/libdisplay-info/-/blob/main/di-e=
did-decode/meson.build>=20
> which doesn=E2=80=99t have any conditionals.
>=20
> Ross


--=-RWgINJFDMib1nAmXdJOE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Thats absolutely true . But still =
I dont think it is a bug in the libdisplay-info build system, because edid-=
decode is requested for the tests and is requested native explicitly.&nbsp;=
</div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Mon, Apr 15 2024 at=
 11:41:38 AM +00:00:00, Ross Burton &lt;Ross.Burton@arm.com&gt; wrote:<br><=
blockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: bre=
ak-spaces;">

<blockquote> On 15 Apr 2024, at 12:32, Markus Volk &lt;<a href=3D"mailto:f_=
l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
=20
 On Mon, Apr 15 2024 at 11:07:45 AM +00:00:00, Ross Burton &lt;<a href=3D"m=
ailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:
<blockquote> Surely that=C2=B4s a bug in the meson.build? It doesn=C2=B4t w=
ant to find a native binary.
</blockquote>=20
=20
 Its added here, I think mostly for testing purpose:
=20
 <a href=3D"https://gitlab.freedesktop.org/emersion/libdisplay-info/-/blob/=
main/test/meson.build#L1">https://gitlab.freedesktop.org/emersion/libdispla=
y-info/-/blob/main/test/meson.build#L1</a>
 <a href=3D"https://gitlab.freedesktop.org/emersion/libdisplay-info/-/blob/=
main/test/meson.build#L10">https://gitlab.freedesktop.org/emersion/libdispl=
ay-info/-/blob/main/test/meson.build#L10</a>
 <a href=3D"https://gitlab.freedesktop.org/emersion/libdisplay-info/-/blob/=
main/test/meson.build#L59">https://gitlab.freedesktop.org/emersion/libdispl=
ay-info/-/blob/main/test/meson.build#L59</a>
 <a href=3D"https://gitlab.freedesktop.org/emersion/libdisplay-info/-/blob/=
main/test/meson.build#L66">https://gitlab.freedesktop.org/emersion/libdispl=
ay-info/-/blob/main/test/meson.build#L66</a>
=20
 If edid-decode is added a s a native dependency, an additional binary will=
 be installed '/usr/bin/di-edid-decode=E2=80=99
</blockquote>
Are you sure about that?  All of those references are specific to the test =
suite (which would want native binaries, unless they make the effort to sup=
port installable tests).  The di-edid-decode binary is buillt and installed=
 by <a href=3D"https://gitlab.freedesktop.org/emersion/libdisplay-info/-/bl=
ob/main/di-edid-decode/meson.build">https://gitlab.freedesktop.org/emersion=
/libdisplay-info/-/blob/main/di-edid-decode/meson.build</a> which doesn=E2=
=80=99t have any conditionals.

Ross</div></blockquote></div>
--=-RWgINJFDMib1nAmXdJOE--


