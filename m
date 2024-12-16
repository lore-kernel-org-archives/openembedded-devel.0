Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E776E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 21:42:22 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.68201.1734385334966379861
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Dec 2024 13:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout03.t-online.de (Postfix) with SMTP id E855DEF4;
	Mon, 16 Dec 2024 22:42:12 +0100 (CET)
Received: from [192.168.178.67] ([84.154.162.147]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tNIqy-1bq7xA0; Mon, 16 Dec 2024 22:42:12 +0100
Date: Mon, 16 Dec 2024 22:42:20 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] libpeas: update 1.36.0 -> 2.0.5
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <KAWLOS.ZXLRPFVITR2B2@t-online.de>
In-Reply-To: <CAMKF1sr-a7XZyTDfhZdkVxo1ZhLFxLYSm0f28jv65M+0CGsBcw@mail.gmail.com>
References: <1811A85A00D6A22F.23577@lists.openembedded.org>
	<VX6LOS.3HWFQSO1SJD41@t-online.de>
	<CAMKF1srFAYctP2qWSh0SRTFHgjyHbECD_G2AvrGWqd3tyq3-Kg@mail.gmail.com>
	<Y7SLOS.86J6WO9IZ2GB2@t-online.de>
	<CAMKF1sr-a7XZyTDfhZdkVxo1ZhLFxLYSm0f28jv65M+0CGsBcw@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-7HJWFvBfBMH8r6ra3CPj"
X-TOI-EXPURGATEID: 150726::1734385332-8FFFC973-4EB164EE/0/0 CLEAN NORMAL
X-TOI-MSGID: bc996cc0-fd4c-48a1-909b-f898745e69ac
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 21:42:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114342

--=-7HJWFvBfBMH8r6ra3CPj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

One additional problem that I see is that some of the older gnome=20
components like eog or geary dont support libpeas-2 (yet?)
For eog it might be possible to replace it with the more recent rust=20
app loupe but I guess in case of geary we will be stuck.
Maybe it will be needed to also keep the libpeas-1 recipe for now ?

On Mon, Dec 16 2024 at 01:04:56 PM -08:00:00, Khem Raj=20
<raj.khem@gmail.com> wrote:
>=20
>=20
> On Mon, Dec 16, 2024 at 12:14=E2=80=AFPM Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>> wrote:
>> On Mon, Dec 16 2024 at 09:47:39 AM -08:00:00, Khem Raj=20
>> <raj.khem@gmail.com <mailto:raj.khem@gmail.com>> wrote:
>>> libpeas seems to be needed by meta-gnome only, so perhaps move this
>>> recipe to meta-gnome is the right thing to do.
>>=20
>> We could also move gjs to meta-oe because it only pulls in mozjs-128=20
>> and cairo. Both are also in meta-oe.
>=20
> Yeah that works too if there are more
> Users of gjs beyond meta-gnome
>>=20


--=-7HJWFvBfBMH8r6ra3CPj
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>One additional problem that I see =
is that some of the older gnome components like eog or geary dont support l=
ibpeas-2 (yet?)</div><div>For eog it might be possible to replace it with t=
he more recent rust app loupe but I guess in case of geary we will be stuck=
.</div><div>Maybe it will be needed to also keep the libpeas-1 recipe for n=
ow ?</div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Mon, Dec 16 202=
4 at 01:04:56 PM -08:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><=
blockquote type=3D"cite"><div><br></div><div><br><div class=3D"gmail_quote =
gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 16=
, 2024 at 12:14=E2=80=AFPM Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online=
.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div id=3D"m_9158394572807842853geary-body" dir=3D"auto">On Mon, Dec 16 =
2024 at 09:47:39 AM -08:00:00, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br><blockquote t=
ype=3D"cite"><div style=3D"white-space:break-spaces">libpeas seems to be ne=
eded by meta-gnome only, so perhaps move this
recipe to meta-gnome is the right thing to do.
</div></blockquote><div><br></div><div>We could also move gjs to meta-oe be=
cause it only pulls in mozjs-128 and cairo. Both are also in meta-oe.</div>=
</div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah that =
works too if there are more</div><div dir=3D"auto">Users of gjs beyond meta=
-gnome&nbsp;</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"m_9158394572807=
842853geary-body" dir=3D"auto"><div dir=3D"auto"></div></div></blockquote><=
/div></div>
</blockquote></div>
--=-7HJWFvBfBMH8r6ra3CPj--


