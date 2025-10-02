Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E404CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 20:23:49 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.3825.1759436627611136156
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 13:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout05.t-online.de (Postfix) with SMTP id 497C5EF0;
	Thu,  2 Oct 2025 22:23:45 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.165.198]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1v4Pq0-2k9yNc0; Thu, 2 Oct 2025 22:23:40 +0200
Date: Thu, 02 Oct 2025 22:23:35 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] telepathy-mission-control: add recipe
To: raj.khem@gmail.com
Cc: ross.burton@arm.com, openembedded-devel@lists.openembedded.org
Message-Id: <BZTI3T.PB7FK1EWYVC5@t-online.de>
In-Reply-To: <CAMKF1spDVZWrKtk06SAHOGwCKGf3F7f-OVChFEki67uxrPiEow@mail.gmail.com>
References: <20251002010054.41854-1-f_l_k@t-online.de>
	<A6BC85FC-FDB0-47A7-A95C-3478460C6CC4@arm.com>
	<2NFI3T.SANECX5I50EZ1@t-online.de>
	<7CA45894-031A-4B69-803B-84614316CED7@arm.com>
	<CAMKF1spDVZWrKtk06SAHOGwCKGf3F7f-OVChFEki67uxrPiEow@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Hg1I1AuN8iRcUPJ/kqrM"
X-TOI-EXPURGATEID: 150726::1759436620-4A7FB901-FD3721E9/0/0 CLEAN NORMAL
X-TOI-MSGID: f71bcbc4-b397-4647-b33e-d4dbb5d74acf
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 20:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120208

--=-Hg1I1AuN8iRcUPJ/kqrM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

No problem. Just remove it then

On Thu, Oct 2 2025 at 10:19:58 -07:00:00, Khem Raj via=20
lists.openembedded.org <raj.khem=3Dgmail.com@lists.openembedded.org>=20
wrote:
> On Thu, Oct 2, 2025 at 9:53=E2=80=AFAM Ross Burton via=20
> lists.openembedded.org
> <ross.burton=3Darm.com@lists.openembedded.org=20
> <mailto:ross.burton=3Darm.com@lists.openembedded.org>> wrote:
>>=20
>>  On 2 Oct 2025, at 16:13, Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>> wrote:
>>  >
>>  > On Do, Okt 2 2025 at 10:00:05 +00:00:00, Ross Burton=20
>> <Ross.Burton@arm.com <mailto:Ross.Burton@arm.com>> wrote:
>>  >> Considering mission control hasn=C4=81=E2=82=AC=E2=84=A2t been touch=
ed for six=20
>> years and the rest of the telepathy stack is almost as old, is this=20
>> really needed? Do any other distros actually ship telepathy enabled=20
>> out of the box?
>>  >
>>  >
>>  > I'm really stumped on that one. It's not particularly important=20
>> to me either. I only added it because the error message in Geary=20
>> annoyed me.
>>=20
>>  FWIW gnome-os, which could be considered the canonical Gnome=20
>> distribution, disables telepathy in libfolks:
>>=20
>> =20
>> <https://gitlab.gnome.org/GNOME/gnome-build-meta/-/blob/master/elements/=
core-deps/folks.bst>
>>=20
>>  I=E2=80=99d say we should do the same, there=E2=80=99s no point packagi=
ng and=20
>> building a lot of recipes that nobody will actually use.
>>=20
>=20
> I tend to agree.
>=20
>>  Ross
>>=20
>>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120207):=20
> <https://lists.openembedded.org/g/openembedded-devel/message/120207>
> Mute This Topic: <https://lists.openembedded.org/mt/115545169/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org=20
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-Hg1I1AuN8iRcUPJ/kqrM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>No problem. Just remove it then</d=
iv></div><div id=3D"geary-quote" dir=3D"auto"><br>On Thu, Oct 2 2025 at 10:=
19:58 -07:00:00, Khem Raj via lists.openembedded.org &lt;raj.khem=3Dgmail.c=
om@lists.openembedded.org&gt; wrote:<br><blockquote type=3D"cite"><div clas=
s=3D"plaintext" style=3D"white-space: break-spaces;">On Thu, Oct 2, 2025 at=
 9:53=E2=80=AFAM Ross Burton via lists.openembedded.org
&lt;<a href=3D"mailto:ross.burton=3Darm.com@lists.openembedded.org">ross.bu=
rton=3Darm.com@lists.openembedded.org</a>&gt; wrote:
<blockquote>
 On 2 Oct 2025, at 16:13, Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.=
de">f_l_k@t-online.de</a>&gt; wrote:
 &gt;
 &gt; On Do, Okt 2 2025 at 10:00:05 +00:00:00, Ross Burton &lt;<a href=3D"m=
ailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:
 &gt;&gt; Considering mission control hasn=C4=81=E2=82=AC=E2=84=A2t been to=
uched for six years and the rest of the telepathy stack is almost as old, i=
s this really needed? Do any other distros actually ship telepathy enabled =
out of the box?
 &gt;
 &gt;
 &gt; I'm really stumped on that one. It's not particularly important to me=
 either. I only added it because the error message in Geary annoyed me.

 FWIW gnome-os, which could be considered the canonical Gnome distribution,=
 disables telepathy in libfolks:

 <a href=3D"https://gitlab.gnome.org/GNOME/gnome-build-meta/-/blob/master/e=
lements/core-deps/folks.bst">https://gitlab.gnome.org/GNOME/gnome-build-met=
a/-/blob/master/elements/core-deps/folks.bst</a>

 I=E2=80=99d say we should do the same, there=E2=80=99s no point packaging =
and building a lot of recipes that nobody will actually use.

</blockquote>
I tend to agree.

<blockquote> Ross
=20

</blockquote></div><div class=3D"plaintext" style=3D"white-space: break-spa=
ces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#120207): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/120207">https://lists.openembedded.org/g/openembed=
ded-devel/message/120207</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115545169/361=
8223">https://lists.openembedded.org/mt/115545169/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-Hg1I1AuN8iRcUPJ/kqrM--


