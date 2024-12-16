Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C832E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 22:32:32 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.69105.1734388348727631751
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Dec 2024 14:32:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aGyhZ/uN;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2a0206590a7so2043083fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 14:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734388348; x=1734993148; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l2baLmpeRL5GzgVtp7YCWWLcsknlrAc46ZqvNsZh/EA=;
        b=aGyhZ/uNDr+Ou4PGW08Qp8VpeBBDtIDSSDt6XvlnvwbddLSOz5uIullZxw2/5V7S4g
         xFASGyuIisQEPAtafridkDSdH+d+8Dkmo3J1Rjh/NJLIBa1HhrzjDSxWmxhQov6J5Df+
         /Qqkcw2Q1egB9KVIvx769k4bb4jVurr84++gFTm2RYceKTlHKCCUsmk9jUorqQNepT4M
         TjGt1MtCeo21Yw0rULqvbe8kBCyz2XvqYYiBIlkc/7xxAEwl7A0uS0VKYfSXrCTUV7ff
         4gyEPJRdVOM+KLLiNTYv42qP6bs8YW40+x/+ajZIERmn22GC6BSCGasvItsAQ9y2JyAL
         cECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734388348; x=1734993148;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2baLmpeRL5GzgVtp7YCWWLcsknlrAc46ZqvNsZh/EA=;
        b=spWJd1Am52K/bLpinL5qINGNY6DxEtDyyRkBgKE6yN9nkzJQze0jJNNojqzQxS4nSd
         Ul+Xxw+cvZi+la3iD1C7ph5gt7EZ2FAXprj8qrbASUa+OVxkEfug/z72LUzDQreQXwoC
         Cuy8diKQnxYHSScvtzs2VHcnDhmVCnp5W3azGF/eDEbU4/qOgXV68tMfTJ1SPai1ymX4
         0B02vhBNsT74rz0UVC32AEOLmwSIPC5y0JOzxJgvbVb3h+o+CEh+93+CqX8n6H+tdw/W
         9R5vaLH2StZtstpj1KQIFsnLyICM3jYtx2EPOmoSYvu31tuC4S15WofI8WkpDAUs13Jx
         OVHQ==
X-Gm-Message-State: AOJu0YxnrV7089qAQNfq1Ag4g44QizRxJUV8+ziRsV9jXbu9XMvsRbHI
	XRzv4kpHDNirZzx7dQgB1Ez1E+hyXWeA+b1hPB9mo9xr88IcNq8Oqs7s5xwHYtAeyP1l1/f+jaF
	43m4j4v2QpseT3Qcpom8y8GiV3gg=
X-Gm-Gg: ASbGncvfNa/MKVDLiZO8MOAMNajeORgzlj+/h03Ww/U9Q5TuL/fipGrW2g+Nz6IIupq
	ZFM3IF5qr7pGwy1H9V4gl6aK9GLIKcxWx/hy1otlWUp6vtZ+OU8Ox7RUsTNZD+aWiyG9RnB4X
X-Google-Smtp-Source: AGHT+IGe4ws6nE5Ad4N2ml1oNRE43AnMgnrXZhZqTOJHLIwWbrKRolcaq2nlimwbAEq9dA46EnHEmDHJbaavERrM988=
X-Received: by 2002:a05:6870:2a44:b0:29e:5522:8eea with SMTP id
 586e51a60fabf-2a789030179mr801605fac.38.1734388348027; Mon, 16 Dec 2024
 14:32:28 -0800 (PST)
MIME-Version: 1.0
References: <1811A85A00D6A22F.23577@lists.openembedded.org>
 <VX6LOS.3HWFQSO1SJD41@t-online.de> <CAMKF1srFAYctP2qWSh0SRTFHgjyHbECD_G2AvrGWqd3tyq3-Kg@mail.gmail.com>
 <Y7SLOS.86J6WO9IZ2GB2@t-online.de> <CAMKF1sr-a7XZyTDfhZdkVxo1ZhLFxLYSm0f28jv65M+0CGsBcw@mail.gmail.com>
 <KAWLOS.ZXLRPFVITR2B2@t-online.de>
In-Reply-To: <KAWLOS.ZXLRPFVITR2B2@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Dec 2024 14:32:17 -0800
Message-ID: <CAMKF1somekZMjvrhGmC2Yr69tespo+ee0pnQeV9G7Kmt-CdFQA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] libpeas: update 1.36.0 -> 2.0.5
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000630af606296ac19b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 22:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114348

--000000000000630af606296ac19b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 1:42=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:

> One additional problem that I see is that some of the older gnome
> components like eog or geary dont support libpeas-2 (yet?)
> For eog it might be possible to replace it with the more recent rust app
> loupe but I guess in case of geary we will be stuck.
> Maybe it will be needed to also keep the libpeas-1 recipe for now ?
>

Hmm is it that only recipe that needs it ? Maybe bundle it with it


> On Mon, Dec 16 2024 at 01:04:56 PM -08:00:00, Khem Raj <raj.khem@gmail.co=
m>
> wrote:
>
>
>
> On Mon, Dec 16, 2024 at 12:14=E2=80=AFPM Markus Volk <f_l_k@t-online.de> =
wrote:
>
>> On Mon, Dec 16 2024 at 09:47:39 AM -08:00:00, Khem Raj <
>> raj.khem@gmail.com> wrote:
>>
>> libpeas seems to be needed by meta-gnome only, so perhaps move this
>> recipe to meta-gnome is the right thing to do.
>>
>>
>> We could also move gjs to meta-oe because it only pulls in mozjs-128 and
>> cairo. Both are also in meta-oe.
>>
>
> Yeah that works too if there are more
> Users of gjs beyond meta-gnome
>
>>

--000000000000630af606296ac19b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div><br></div><div><br><div class=3D"gmail_quote"></div></div></div><=
div><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 16, 2024 at 1:42=E2=
=80=AFPM Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_bl=
ank">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-s=
tyle:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><div id=3D"=
m_-4256392022987362345m_-1549273706597269567geary-body" dir=3D"auto"><div>O=
ne additional problem that I see is that some of the older gnome components=
 like eog or geary dont support libpeas-2 (yet?)</div><div>For eog it might=
 be possible to replace it with the more recent rust app loupe but I guess =
in case of geary we will be stuck.</div><div dir=3D"auto">Maybe it will be =
needed to also keep the libpeas-1 recipe for now ?</div></div></blockquote>=
<div dir=3D"auto"><br></div></div><div><div dir=3D"auto">Hmm is it that onl=
y recipe that needs it ? Maybe bundle it with it</div></div><div dir=3D"aut=
o"><br></div><div><div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><div id=
=3D"m_-4256392022987362345m_-1549273706597269567geary-body" dir=3D"auto"><d=
iv dir=3D"auto"></div></div></blockquote><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:s=
olid;padding-left:1ex;border-left-color:rgb(204,204,204)"><div id=3D"m_-425=
6392022987362345m_-1549273706597269567geary-body" dir=3D"auto"><div dir=3D"=
auto"></div></div><div id=3D"m_-4256392022987362345m_-1549273706597269567ge=
ary-quote" dir=3D"auto"><br>On Mon, Dec 16 2024 at 01:04:56 PM -08:00:00, K=
hem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khe=
m@gmail.com</a>&gt; wrote:<br><blockquote type=3D"cite"><div><br></div><div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mo=
n, Dec 16, 2024 at 12:14=E2=80=AFPM Markus Volk &lt;<a href=3D"mailto:f_l_k=
@t-online.de" target=3D"_blank">f_l_k@t-online.de</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rg=
b(204,204,204)"><div id=3D"m_-4256392022987362345m_-1549273706597269567m_91=
58394572807842853geary-body" dir=3D"auto">On Mon, Dec 16 2024 at 09:47:39 A=
M -08:00:00, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_=
blank">raj.khem@gmail.com</a>&gt; wrote:<br><blockquote type=3D"cite"><div =
style=3D"white-space:break-spaces">libpeas seems to be needed by meta-gnome=
 only, so perhaps move this
recipe to meta-gnome is the right thing to do.
</div></blockquote><div><br></div><div>We could also move gjs to meta-oe be=
cause it only pulls in mozjs-128 and cairo. Both are also in meta-oe.</div>=
</div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah that =
works too if there are more</div><div dir=3D"auto">Users of gjs beyond meta=
-gnome=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;b=
order-left-color:rgb(204,204,204)"><div id=3D"m_-4256392022987362345m_-1549=
273706597269567m_9158394572807842853geary-body" dir=3D"auto"><div dir=3D"au=
to"></div></div></blockquote></div></div>
</blockquote></div></blockquote></div></div>
</div>

--000000000000630af606296ac19b--

