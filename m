Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545B1C76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 13:25:06 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web11.66288.1680009900814289342
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Mar 2023 06:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastmail.fm header.s=fm2 header.b=dObigWsN;
 spf=pass (domain: fastmail.fm, ip: 64.147.123.24, mailfrom: cvubrugier@fastmail.fm)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 9BD303200564;
	Tue, 28 Mar 2023 09:24:59 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute1.internal (MEProxy); Tue, 28 Mar 2023 09:25:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1680009899; x=1680096299; bh=Kp
	IVsz2KvC/Hv7RiXTnWuXiI5sPsExXwQJUeLRVoqk8=; b=dObigWsNL4zreZ2KNg
	54KOFl0PPhbq8Xv552pIFL3T9IUdAtbwM6YdZlB8V5j8t+Zx/C64NbPOQivV01QE
	McpsrJw7SXmrRKdbTgeIfDziXEA9T3vV5pgoKr/6Wzlymg4uQZU3sShmf6mZaS+t
	sozaigFEaVqGtMPUGXpk4GJjvqW3f9ZrxP6dK6dTpWy6XPFVw+QbNfUsX5QNsgTh
	ImGMiso+ltdq85iwoE8gcgvmrlr1DZk8pd0Sp0C5do6qwKVsQZuuBzO0DDdzIRKf
	XYJNuUpufnzuZrzs//H3VKV2YhjHvQ5Xu8TItBQW/15bWeXeRbpWXKa9UxcNTYH8
	ZeYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680009899; x=1680096299; bh=KpIVsz2KvC/Hv
	7RiXTnWuXiI5sPsExXwQJUeLRVoqk8=; b=DaIkddWaosrWxBQaHmlVnJeT8m4hN
	oy/n7PvQkQwRmBv4/6Wmbw3+Tntkjlyv8HMvNnYn2xK3skqomtzIGYXUDe+zrkch
	GtZlvqC3D/NEbKoiPu67ho2GjE1cZUp4N+Zkr1K5RD2S+preVZjDc5SepKxJf/ov
	wAuu93U6zXJg/mUqQbvrXFDW58Wy6EnouY0Hn/hDsI+2t5dSdAN/c3J8EpOAqONN
	bib3dJZXC/4E8tsv76UbQsWJymZyFBYcDVjnd273tq8wjtQnXXwYqAmWJTxDNr1O
	5N0H68SPOqBnuIRFMDMQmOdJFA2Xm10aNH5x43oftzFLwhQiknJtAjhVA==
X-ME-Sender: <xms:q-oiZPd0GDj0bDRqvUXmdhZpZnNnhoYMB6SnOqXXMdQwtdEuW5ZToQ>
    <xme:q-oiZFPTKSlBpcANj9yQKSk-Yj6WgKWF614LjiX7I9uu6cEhWzJH2_gpl-Un2cVKQ
    3vEX3Wkt6U103wxYQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehgedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsegrtderreerreejnecuhfhrohhmpedfvehh
    rhhishhtohhphhgvucgguhdquehruhhgihgvrhdfuceotghvuhgsrhhughhivghrsehfrg
    hsthhmrghilhdrfhhmqeenucggtffrrghtthgvrhhnpeduheetheegteehjeeljeeikedv
    gfehgfekudegffduteetiedtudevvdekgefgueenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegtvhhusghruhhgihgvrhesfhgrshhtmhgrihhl
    rdhfmh
X-ME-Proxy: <xmx:q-oiZIjkj9w44QcWm4VE9dmTbJQdpvGWdyt7OhwcrmxGXUEgax4Eaw>
    <xmx:q-oiZA_q2RJbgipKT7q37UwUhKGtRo3oe5uXgiA63yFzuLaQc4VTmw>
    <xmx:q-oiZLvmKdPOovXzZ_3-9ezFvWw__3ayu9b2bM08snRZKJ28VKUuyw>
    <xmx:q-oiZJ0KcnUyRHueWIYw-98RTxytI2YcAnprH7-QWK4Urk1FKOWMzg>
Feedback-ID: i09e840f8:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 044F5B60092; Tue, 28 Mar 2023 09:24:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-237-g62623e8e3f-fm-20230327.001-g62623e8e
Mime-Version: 1.0
Message-Id: <8fb1af8b-82bc-4d17-995b-d331a7876c5d@app.fastmail.com>
In-Reply-To: 
 <CA+chaQeNc-6bhkZX=G6ukdP=KQGSttyxm=3xO8S9WWDyigHN_w@mail.gmail.com>
References: <20230328064802.42713-1-cvubrugier@fastmail.fm>
 <CA+chaQeNc-6bhkZX=G6ukdP=KQGSttyxm=3xO8S9WWDyigHN_w@mail.gmail.com>
Date: Tue, 28 Mar 2023 15:24:38 +0200
From: "Christophe Vu-Brugier" <cvubrugier@fastmail.fm>
To: "Martin Jansa" <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
 "Christophe Vu-Brugier" <christophe.vu-brugier@seagate.com>
Subject: Re: [oe] [meta-filesystems][PATCH 1/2] exfatprogs: add new recipe
Content-Type: multipart/alternative;
 boundary=fd27e6cd465b4b21bbfcd4e21f769389
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 13:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101805

--fd27e6cd465b4b21bbfcd4e21f769389
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Thank you for your code review.

Martin Jansa wrote=E2=80=AF:
> Do we need
> RPROVIDES:${PN} =3D "exfat-utils"
> as well?

I hesitated on this one.

While exfatprogs provides the same tools as exfat-utils, there are a few=
 differences.
 1. In exfat-utils, `mkfs.exfat` is a symlink to `mkexfatfs` ; exfatprog=
s does not provide `mkexfatfs`.
 2. Some options have different names. For instance, exfat-utils uses "-=
n" to set the volume label whereas exfatprogs uses "-L" (like e2fsprogs,=
 xfsprogs).

How do we convey the message that "exfatprogs replaces exfat-utils but i=
s not 100% compatible"?

Also, I believe that exfatprogs is better than exfat-utils.
For instance, exfatprogs correctly format drives whose sector size is 40=
96 bytes whereas exfat-utils does not.

With best regards,

--
Christophe Vu-Brugier


--fd27e6cd465b4b21bbfcd4e21f769389
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div>Hi Martin,<br><=
/div><div><br></div><div>Thank you for your code review.<br></div><div i=
d=3D"sig22428721"><div class=3D"signature"><br></div></div><div>Martin J=
ansa wrote=E2=80=AF:<br></div><blockquote type=3D"cite" id=3D"qt" style=3D=
""><div dir=3D"ltr"><div>Do we need<br></div><div>RPROVIDES:${PN} =3D "e=
xfat-utils"<br></div><div>as well?<br></div></div></blockquote><div id=3D=
"sig22428721"><div class=3D"signature"><div id=3D"sig22428721"><div clas=
s=3D"signature"><br></div><div class=3D"signature">I hesitated on this o=
ne.<br></div><div class=3D"signature"><br></div><div class=3D"signature"=
>While exfatprogs provides the same tools as exfat-utils, there are a fe=
w differences.<br></div><div class=3D"signature">&nbsp;1. In exfat-utils=
, `mkfs.exfat` is a symlink to `mkexfatfs` ; exfatprogs does not provide=
 `mkexfatfs`.<br></div><div class=3D"signature">&nbsp;2. Some options ha=
ve different names. For instance, exfat-utils uses "-n" to set the volum=
e label whereas exfatprogs uses "-L" (like e2fsprogs, xfsprogs).<br></di=
v><div class=3D"signature"><br></div><div class=3D"signature">How do we =
convey the message that "exfatprogs replaces exfat-utils but is not 100%=
 compatible"?<br></div><div class=3D"signature"><br></div><div class=3D"=
signature">Also, I believe that exfatprogs is better than exfat-utils.<b=
r></div><div class=3D"signature">For instance, exfatprogs correctly form=
at drives whose sector size is 4096 bytes whereas exfat-utils does not.<=
br></div><div class=3D"signature"><br></div><div class=3D"signature">Wit=
h best regards,<br></div><div class=3D"signature"><br></div><div class=3D=
"signature">--<br></div><div class=3D"signature">Christophe Vu-Brugier<b=
r></div></div></div><div><br></div></div><div><br></div></body></html>
--fd27e6cd465b4b21bbfcd4e21f769389--

