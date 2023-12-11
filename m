Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F0EBC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 12:40:43 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.7292.1702298442790393338
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Dec 2023 04:40:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout05.t-online.de (Postfix) with SMTP id C8214AC47;
	Mon, 11 Dec 2023 13:40:40 +0100 (CET)
Received: from [192.168.178.67] ([84.154.173.213]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rCfaS-34MW9Y0; Mon, 11 Dec 2023 13:40:40 +0100
Date: Mon, 11 Dec 2023 13:41:22 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-gnome][PATCH] tracker: dont inherit gsettings
To: Ross Burton <Ross.Burton@arm.com>
Cc: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
Message-Id: <YW5I5S.6HZ06E57ABA81@t-online.de>
In-Reply-To: <9FBC4ED2-02A3-4DF6-B5D5-C396BE4EF003@arm.com>
References: <20231209170903.672584-1-f_l_k@t-online.de>
	<135B2975-FC8C-4280-BA48-1C8644375621@arm.com>
	<F52I5S.RH4KCS811OGK@t-online.de>
	<FD896675-7CF8-4941-8CD4-66141EF2A49A@arm.com>
	<AZ2I5S.WGET5THHKY043@t-online.de>
	<9FBC4ED2-02A3-4DF6-B5D5-C396BE4EF003@arm.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-nsCLB+xiF+DtCRVEG3rg"
X-TOI-EXPURGATEID: 150726::1702298440-CEFFA957-7D433FA6/0/0 CLEAN NORMAL
X-TOI-MSGID: 1846e307-0325-407e-9dfa-db4d7b855fdc
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Dec 2023 12:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107328

--=-nsCLB+xiF+DtCRVEG3rg
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

What really puzzles me is the fact, that I didn't have the issue for my=20
intel build and even with adding back inherit gsettings to the tracker=20
recipe I'm unable to reproduce the issue for raspberrypi now.

Whatever, tracker doesn't install glib schemas so the commit should be=20
correct in any case

On Mon, Dec 11 2023 at 11:41:50 AM +00:00:00, Ross Burton=20
<Ross.Burton@arm.com> wrote:
> On 11 Dec 2023, at 11:37, f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de> wrote:
>>=20
>>  On Mon, Dec 11 2023 at 11:21:48 AM +00:00:00, Ross Burton=20
>> <Ross.Burton@arm.com <mailto:Ross.Burton@arm.com>> wrote:
>>>  So the class is redundant, yes. Can you also add a check to the=20
>>> gsettings.bbclass so its harmless instead of crashing?
>>=20
>>=20
>>  something like this?
>>  gsettings_postinstrm () {
>>  [ -d $D${datadir}/glib-2.0/schemas ] && glib-compile-schemas=20
>> $D${datadir}/glib-2.0/schemas
>>  }
>>=20
>>  glib-compile-schemas hasn't an option to not fail if the directory=20
>> was not found
>>=20
>>  But maybe crashing isn't that bad. Helps to keep the recipes more=20
>> clean I think?
>=20
> Crashing is bad: failing with an error message is better.  And=20
> recipes may have an option for gsettings (unlikely, I admit, but=20
> possible) and then they=FFll need to mess about with conditional=20
> inherits.
>=20
> Ross
>=20


--=-nsCLB+xiF+DtCRVEG3rg
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>What really puzzles me is the fact=
, that I didn't have the issue for my intel build and even with adding back=
 inherit gsettings to the tracker recipe I'm unable to reproduce the issue =
for raspberrypi now.</div><div><br></div><div>Whatever, tracker doesn't ins=
tall glib schemas so the commit should be correct in any case</div></div><d=
iv id=3D"geary-quote" dir=3D"auto"><br>On Mon, Dec 11 2023 at 11:41:50 AM +=
00:00:00, Ross Burton &lt;Ross.Burton@arm.com&gt; wrote:<br><blockquote typ=
e=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">On=
 11 Dec 2023, at 11:37, <a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online=
.de</a> wrote:
<blockquote>=20
 On Mon, Dec 11 2023 at 11:21:48 AM +00:00:00, Ross Burton &lt;<a href=3D"m=
ailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:
<blockquote> So the class is redundant, yes. Can you also add a check to th=
e gsettings.bbclass so its harmless instead of crashing?
</blockquote>=20
=20
 something like this?
 gsettings_postinstrm () {
 [ -d $D${datadir}/glib-2.0/schemas ] &amp;&amp; glib-compile-schemas $D${d=
atadir}/glib-2.0/schemas
 }
=20
 glib-compile-schemas hasn't an option to not fail if the directory was not=
 found
=20
 But maybe crashing isn't that bad. Helps to keep the recipes more clean I =
think?
</blockquote>
Crashing is bad: failing with an error message is better.  And recipes may =
have an option for gsettings (unlikely, I admit, but possible) and then the=
y=FFll need to mess about with conditional inherits.

Ross

</div></blockquote></div>
--=-nsCLB+xiF+DtCRVEG3rg--


