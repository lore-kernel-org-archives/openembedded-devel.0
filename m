Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA3FCC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 11:19:32 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.6202.1702293567518114225
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Dec 2023 03:19:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout12.t-online.de (Postfix) with SMTP id 59F661BB5;
	Mon, 11 Dec 2023 12:19:25 +0100 (CET)
Received: from [192.168.178.67] ([84.154.173.213]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rCeJl-2KqNDU0; Mon, 11 Dec 2023 12:19:21 +0100
Date: Mon, 11 Dec 2023 12:20:03 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-gnome][PATCH] tracker: dont inherit gsettings
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <F52I5S.RH4KCS811OGK@t-online.de>
In-Reply-To: <135B2975-FC8C-4280-BA48-1C8644375621@arm.com>
References: <20231209170903.672584-1-f_l_k@t-online.de>
	<135B2975-FC8C-4280-BA48-1C8644375621@arm.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-P0R5oLOlSwg1H3p0sByF"
X-TOI-EXPURGATEID: 150726::1702293561-5181C95D-F49BD138/0/0 CLEAN NORMAL
X-TOI-MSGID: 4b9f4a86-a590-4303-bf5c-5238bb4dfd58
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Dec 2023 11:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107324

--=-P0R5oLOlSwg1H3p0sByF
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11 2023 at 10:20:29 AM +00:00:00, Ross Burton=20
<Ross.Burton@arm.com> wrote:
> Did you confirm that tracker doesn=FFt install gsettings schemas? =20
> This smells like a workaround that has collateral damage.
>=20
> Ross

had a look at gsettings.bbclass and it wants to run

gsettings_postinstrm () {
	glib-compile-schemas $D${datadir}/glib-2.0/schemas
}

${D}${datadir}/glib-2.0 is not installed by tracker

I guess thats the reason for exit 1


--=-P0R5oLOlSwg1H3p0sByF
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Mon, Dec 11 2023 at 10:20:29 AM +00:=
00:00, Ross Burton &lt;Ross.Burton@arm.com&gt; wrote:<br><blockquote type=
=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">Did=
 you confirm that tracker doesn=FFt install gsettings schemas?  This smells=
 like a workaround that has collateral damage.

Ross
</div></blockquote><div><br></div><div>had a look at gsettings.bbclass and =
it wants to run&nbsp;</div><div><br></div><div><pre style=3D"padding: 0px; =
font-size: 13.3333px; font-variant-ligatures: normal; orphans: 2; widows: 2=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">gsettings_postinstrm () {
	glib-compile-schemas $D${datadir}/glib-2.0/schemas
}</pre><pre style=3D"padding: 0px; font-size: 13.3333px; font-variant-ligat=
ures: normal; orphans: 2; widows: 2; text-decoration-thickness: initial; te=
xt-decoration-style: initial; text-decoration-color: initial;"><br></pre><p=
re style=3D"padding: 0px; font-size: 13.3333px; font-variant-ligatures: nor=
mal; orphans: 2; widows: 2; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial;"><pre style=3D"padding=
: 0px; font-size: 13.3333px; font-variant-ligatures: normal; text-decoratio=
n-thickness: initial; text-decoration-style: initial; text-decoration-color=
: initial;">${D}${datadir}/glib-2.0 is not installed by tracker</pre><pre s=
tyle=3D"padding: 0px; font-size: 13.3333px; font-variant-ligatures: normal;=
 text-decoration-thickness: initial; text-decoration-style: initial; text-d=
ecoration-color: initial;"><br></pre><pre style=3D"padding: 0px; font-size:=
 13.3333px; font-variant-ligatures: normal; text-decoration-thickness: init=
ial; text-decoration-style: initial; text-decoration-color: initial;">I gue=
ss thats the reason for exit 1</pre></pre></div></div>
--=-P0R5oLOlSwg1H3p0sByF--


