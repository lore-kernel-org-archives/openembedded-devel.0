Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59815CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 17:20:29 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.web11.14853.1759425626562215550
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 10:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BzUVOWZo;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-637dc2292cfso1484038d50.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 10:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759425626; x=1760030426; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vj/NQKB/VrJBbGmrb4HgkwfhNXlEfC2c7+169xycbVM=;
        b=BzUVOWZohOTwq/XnzbRxgv0L/GUAk4EExbokGL0fJP2PhZEDFJUOnt41ATRFP/vZvK
         mXPNDiCIaG5aAuZJPGDcUGhPhz7+S7ZN3mXqo3e1IbLlWtVfxKe1CfXrieC9kZ4O4hO7
         4fTuuAZLF61c9k3/QhUcvtpzVnc0nNM7wY9BoaaSRkC8xHxYPuOfRa4PV1HHlvEEbubK
         RCeYJhPv8Vr8eIJ+XFeRbP3C6mlxw6kIMv/JycSTcCbpwQ96DW82OiskX4/ObsplzjNm
         taopCVwudDRMKNF5HNE2xSTlN3CM/JJvqAzoq5AkLgOYW7L3DhN94Kbz1iNN2zg6T8uv
         zQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759425626; x=1760030426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vj/NQKB/VrJBbGmrb4HgkwfhNXlEfC2c7+169xycbVM=;
        b=hDGytMKsRHWQ9Yz+egirbv40lxhobWGR5TxbkMtezRwK/H8hddieJz1zINJ2DOezrg
         dYGJvzlTakSgWLNNNaJB54PqEScBei6WrRubuNCA4yN9C4JXvXZMggQ8h5XhjQ3VXVKc
         kv5RXhlLCjK1CgGZEQFBj8zbL02WBdr+KYK7QAPSBIWgl4hGnxIKmXbC6kKuHkBlgWO9
         gA3mcWJhJ28uDqlzmgiDGSNk5VT5e3o9GWEozyyc/CzgiI8qfz7kuySJKW4RnuZn+39V
         tQmTTKkhoKXDPQUa2KDAMVmSyOgIctTbqbeiMu9ifHIaep2BZOW6VapcSh6xm2apN0XT
         UjZA==
X-Forwarded-Encrypted: i=1; AJvYcCV2QvtPDco5rfgKq5ir/iLZ56gEaAORV4j7s2rhXnsgrCwDNDAK1VrzQwL7BmddLr8QiM6V6A7a/GFWaITLngFJKno=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyecx+VKDsj9qBmS7zQMo9VFX/zcivJyvA5h2pbm6pl7VhR8Pp2
	ztFy6jSmAFknGmCJrXv86B4ecewXVOlmFOEhMZW6yufRlAmM1bTYaIQeu1kMKOT7errk8BWJy4A
	9pdHqgdIhe7S/+f0UrMyygisFyDXvy5oi4CZK
X-Gm-Gg: ASbGncvzwSd5NbGWuyhIWkr75oAwtjXym6Q2ucWmV9xPZDFFpNPQRmNoGxM9+ZB4j+/
	D5ybzMzFWLU1CTqe1326af+BWXOzbU13yF+AU7ZaCbbHnLM1zuBkX8q45y3QvXHZwNLx4qlmaCh
	9k8THR52nSy4LqTfza4UQ0bT02rOkb/ZJKdv6DxuEqFHinO3mg7vSLR+ZwqDAeVOFgOs+hgX88z
	0YpqAtU467IPyiO6aE/KaGt/gHFaaI+5zIHW9GlNFSGo30FExhULyEBa4rUfFF7zqlBHYD1ssAm
	hVJeZrV+pZImrQap8PMrrin4bQFd7KJy1pDVbPcTz7u4Kjgv+FOoeTgjvF+OUi/kALOHZQDVEfQ
	uWMnKD7MInXpdNg8G
X-Google-Smtp-Source: AGHT+IEutCD5L8cK652kIhkjt4GypIZSO5cxA3RjIfjwJYYrV/5Cknmw6JivPW829mEAydLlPebEjF0DNES/G/wQcvo=
X-Received: by 2002:a53:c053:0:20b0:636:1784:c5ff with SMTP id
 956f58d0204a3-63b9a037fcfmr61421d50.11.1759425625005; Thu, 02 Oct 2025
 10:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <20251002010054.41854-1-f_l_k@t-online.de> <A6BC85FC-FDB0-47A7-A95C-3478460C6CC4@arm.com>
 <2NFI3T.SANECX5I50EZ1@t-online.de> <7CA45894-031A-4B69-803B-84614316CED7@arm.com>
In-Reply-To: <7CA45894-031A-4B69-803B-84614316CED7@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Oct 2025 10:19:58 -0700
X-Gm-Features: AS18NWC58qX-y6BTZGziSfpifCR4MrxXdX2gDU5Ygj8fuAnYURMTKgU8Pajh2qA
Message-ID: <CAMKF1spDVZWrKtk06SAHOGwCKGf3F7f-OVChFEki67uxrPiEow@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] telepathy-mission-control: add recipe
To: ross.burton@arm.com
Cc: Markus Volk <f_l_k@t-online.de>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 17:20:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120207

On Thu, Oct 2, 2025 at 9:53=E2=80=AFAM Ross Burton via lists.openembedded.o=
rg
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> On 2 Oct 2025, at 16:13, Markus Volk <f_l_k@t-online.de> wrote:
> >
> > On Do, Okt 2 2025 at 10:00:05 +00:00:00, Ross Burton <Ross.Burton@arm.c=
om> wrote:
> >> Considering mission control hasn=C4=81=E2=82=AC=E2=84=A2t been touched=
 for six years and the rest of the telepathy stack is almost as old, is thi=
s really needed? Do any other distros actually ship telepathy enabled out o=
f the box?
> >
> >
> > I'm really stumped on that one. It's not particularly important to me e=
ither. I only added it because the error message in Geary annoyed me.
>
> FWIW gnome-os, which could be considered the canonical Gnome distribution=
, disables telepathy in libfolks:
>
> https://gitlab.gnome.org/GNOME/gnome-build-meta/-/blob/master/elements/co=
re-deps/folks.bst
>
> I=E2=80=99d say we should do the same, there=E2=80=99s no point packaging=
 and building a lot of recipes that nobody will actually use.
>

I tend to agree.

> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120203): https://lists.openembedded.org/g/openembedde=
d-devel/message/120203
> Mute This Topic: https://lists.openembedded.org/mt/115545169/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

