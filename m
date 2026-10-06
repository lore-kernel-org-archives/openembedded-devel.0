Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFED9CA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 09:08:28 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41270.1791277707337384352
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2026 02:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lxpGx+Ub;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8ad549a2119so3598277b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2026 02:08:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791277706; cv=none;
        d=google.com; s=arc-20260327;
        b=SihNJ1hcnD9Rx1eh6c8/ea9MWEiz6GVUnr+BSRlIapJBV/CqIqpP+x9jbFjF1qBcYj
         o96GYXbbQwqdF8Cc4p0fcNvMTP5wx4Y4lGmwHSri1GyUCCol86u38NSv0jpXxEGS2nmy
         k0tiu0fg78Exl7nFXQdpmTi6H22QRKjV0g4cIAJBGubnXxTkf/cE8/naj01jLPQ4x9A5
         Jgx/wZkiDrRoQ7qss21kmKJwx0lklC/lOm0XRH0koYsTn6wP4b+YFu32aQGmNZNJl66F
         xjR5GPIxv7iLZLdUuxKcNl4V//wCqHLOAZTZDv+EqDJpecTsx/ETCUSUWAZz0MzseR7G
         qmZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/59Me9bIAWUdvjEDRBlDaUnCM2hSieZOu1/CpFiFMxE=;
        fh=6hcUKr3duktBY3UgoTWb3oMgRC8h/CdRJUPQi4zxMzQ=;
        b=BOtd4C7HePKvJOXM89/JL3RSLnQMr21+S/qOH0v3FRmO/MVVvVHaysrz+GOodw6SIT
         qMK2SjW1IydDT/4zgqNWgJxtm5M+yEdB1+rPOX6Y+3AqLBcoxv52SA/aL+ThmG5pO+oT
         cF38hFFsImPN4C9sxC6frVup2s3iYo4A3LvR+hoHtoAHcBmRykcVCzi0Id26gjoHVZ9W
         iMie1d5sYVlb8jvMgsvw5ZqNeZ3rLXLFyH9vCXPurkJ12H6HvR8T6qLZDWEcbV7/Qxc5
         QX3wo32Ut/yBsy44A+t8SXqbMumdT0oVUCd6YuLkLDbfuiIyUqBZ9cXeUY0d6PjWcBZd
         XPWA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791277706; x=1791882506; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/59Me9bIAWUdvjEDRBlDaUnCM2hSieZOu1/CpFiFMxE=;
        b=lxpGx+UbqIeiWo8fohelBIOrCbalNN3DMIfI2ntl+FcwsTOmbTIhhfexZ6HqHm/ZUh
         wxs1dfRdPhuSDGeaKrVAWSfxETGEe7pyUbOPzjEfYgNPp5VpZLsbrkOnsRbLQKnrbqMP
         Mh1/eHs/y/qq6cBuESv8k38Jmh4R5yCgrq3gB5XHq06kGK6HiW3Pg2sSKa9EUf+0TOwl
         6Lvyf0U70KiN4pRGOGQM24S8AAv30DINQopMF7R9e83GMagEJaottj6dQEYaseZjMSap
         pFU05aUQgmub/gmdCJCeVGx9Sgo821mqGdwxNjNXfi++xBYCDyD3aeODs/6GSDop28cu
         ozig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791277706; x=1791882506;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/59Me9bIAWUdvjEDRBlDaUnCM2hSieZOu1/CpFiFMxE=;
        b=xeThV/T6jJHvDbA1eb6AqShFDQbDLbq7c5dJtQXbYamslFAfL1zf/MqJxbkkw3bKD2
         bpkRtLKpacnhFSv+MW+CPr040U20zhvo2RcE4s6h1e2h4YZXHZJJzqlF6H1nwgMMVyPD
         XLAv5X4pQ17DG8u2mmi/ODdaF8K/xXVKWG9LdUS9MKWR2GzCywAxhlKGc8iW+ywTz5hE
         lnW7N+srtfEETRiazp+/0urWzZ/9WMoCVaWJbLHF/xHxOYjzsyNebkRIXJwwfipaIk+V
         k6IsYwVt5QK8dmF/kQ/3C3r+xAEBnWaPBB5F7xaRebRnIN+3TjHp+S9+zHMKiTOWmPd3
         Dt3w==
X-Gm-Message-State: AFq9FYLFNK4ppfo/hIESRKzbXMaQR6PPfLTVRuBfWORMpyfCCM7Z9fzk
	bz2yGZmHbdxcPuN56qySolBhLX1BmU1FmtVfBqNShEDx3RFoD5QAN53c5HdT9Gpu2NFoYCF6yMl
	Sr16ET6Q//oMDBVcTsyraMqxBDo7geQE=
X-Gm-Gg: AYBFou0+h2depK1OUNq94iVygRuHJGOfFfZ8uyfweTpkkX5ERU+ApaLd/HWNf5PIpP3
	7siZdxmffouSiMAi+xrBXaUM7YdcqhmrLjrvjYgez63X3QJjZYABjlFoNlLO0vsZM98SbVoE++o
	atjomIbmz7M9LDg673vLSSmFA2OcXisVtXZvRQIfNy/PVegSa3YKdIgSlGDdmyn3PgDIAC0h2cA
	WxcDHchCUwOxuxM3I8pKk9P7NyvumphGjmix75LbDvsxKKZGX60OFtOCsc2XhcnDjZO6NUCGytu
	5preuUgSHxzDOb4VW9tvAypzt74jZ4NJWxg9sgR/lthtW4axxfk8uij44n1dQ43Pybb6aA39+QV
	OAYItR4Rk3GYT6gdsvKf9ZjrE/bAWs4v+34rWdkxOAde+VKlvfN8XvVepps44q0caOklCS3GZpA
	AFKg4tHxBQU62YwRoIDZBuSheH10WwDgFnUwGPZHZcASsZcTC6BH5SA6K7Hl+LesoMh4jl2yD9Q
	kf+8tYC5J5PuiTCmYoLAepocILdSTtkvLXQNGJnKD9xP1UCyqU22xXfVFVhKE+iwGzFfZ+2aXud
	4jqi36o=
X-Received: by 2002:a05:690c:389:b0:882:309e:fcaa with SMTP id
 00721157ae682-8b04f397870mr2217217b3.15.1791277706133; Tue, 06 Oct 2026
 02:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260925092311.764729-1-f_l_k@t-online.de> <CAMKF1sosmYaYwcaxnhPVECKKXTJfirtO3SBSqD2DBnMJX0MKEw@mail.gmail.com>
 <GWKYLT.WM6P22M9DSDF@t-online>
In-Reply-To: <GWKYLT.WM6P22M9DSDF@t-online>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Oct 2026 11:07:59 +0200
X-Gm-Features: AclHuK_OG7T79vbodW95Ck337GmmPDk6qdP3s6jG7G1eyXTGtwWiQc7437gkiNQ
Message-ID: <CAMKF1srjVaQpwZY14rLM7RT05xKsPzBGyZJe18tMHq5mTARYuw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] ibus: upgrade 1.5.26 -> 1.5.34
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005e46c5065d285766"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2026 09:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130631

--0000000000005e46c5065d285766
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This breaks further on machines which have gcc 13 or older e.g. ubuntu
24.04 where compiler does not support -std=3Dgnu23, can you investigate a b=
it
more into it?

On Sat, Sep 26, 2026 at 8:34=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:

> On Fri, Sep 25 2026 at 13:33:11 -07:00:00, Khem Raj <raj.khem@gmail.com>
> wrote:
>
> t stat
> '/home/ubuntu/yoe/build/tmp/work/x86_64-linux/ibus-native/1.5.34/recipe-s=
ysroot-
>
>
> Yes. I sent out a message with this update. A change to oe-core would be
> needed.
> I already sent it to the oe-core mailinglist:
>
> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
> b/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
> index c06832e35e..db176efede 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
> +++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
> @@ -39,4 +39,6 @@ FILES:${PN} +=3D "${datadir}/X11/XKeysymDB
> ${datadir}/X11/XErrorDB ${datadir}/X11/
>  FILES:${PN}-xcb +=3D "${libdir}/libX11-xcb.so.*"
>  FILES:${PN}-locale +=3D "${datadir}/X11/locale ${libdir}/X11/locale"
>
> +SYSROOT_DIRS_IGNORE:remove:class-native =3D "${datadir}/X11/locale"
> +
>  BBCLASSEXTEND =3D "native nativesdk"
>
>
>

--0000000000005e46c5065d285766
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This breaks further on machines which have gcc 13 or older=
 e.g. ubuntu 24.04 where compiler does not support -std=3Dgnu23, can you in=
vestigate a bit more into it?</div><br><div class=3D"gmail_quote gmail_quot=
e_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 26, 2026 at =
8:34=E2=80=AFAM Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div id=3D"m_-5996555540791687141convey-body" dir=3D"auto">On Fr=
i, Sep 25 2026 at 13:33:11 -07:00:00, Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br><block=
quote type=3D"cite">t stat &#39;/home/ubuntu/yoe/build/tmp/work/x86_64-linu=
x/ibus-native/1.5.34/recipe-sysroot-</blockquote><div><br></div><div>Yes. I=
 sent out a message with this update. A change to oe-core would be needed.<=
/div><div>I already sent it to the oe-core mailinglist:</div><div><br></div=
><div><div>diff --git a/meta/recipes-graphics/xorg-lib/<a href=3D"http://li=
bx11_1.8.13.bb" target=3D"_blank">libx11_1.8.13.bb</a> b/meta/recipes-graph=
ics/xorg-lib/<a href=3D"http://libx11_1.8.13.bb" target=3D"_blank">libx11_1=
.8.13.bb</a></div><div>index c06832e35e..db176efede 100644</div><div>--- a/=
meta/recipes-graphics/xorg-lib/<a href=3D"http://libx11_1.8.13.bb" target=
=3D"_blank">libx11_1.8.13.bb</a></div><div>+++ b/meta/recipes-graphics/xorg=
-lib/<a href=3D"http://libx11_1.8.13.bb" target=3D"_blank">libx11_1.8.13.bb=
</a></div><div>@@ -39,4 +39,6 @@ FILES:${PN} +=3D &quot;${datadir}/X11/XKey=
symDB ${datadir}/X11/XErrorDB ${datadir}/X11/</div><div>=C2=A0FILES:${PN}-x=
cb +=3D &quot;${libdir}/libX11-xcb.so.*&quot;</div><div>=C2=A0FILES:${PN}-l=
ocale +=3D &quot;${datadir}/X11/locale ${libdir}/X11/locale&quot;</div><div=
>=C2=A0</div><div>+SYSROOT_DIRS_IGNORE:remove:class-native =3D &quot;${data=
dir}/X11/locale&quot;</div><div>+</div><div>=C2=A0BBCLASSEXTEND =3D &quot;n=
ative nativesdk&quot;</div><div><br></div></div><div><br></div></div></bloc=
kquote></div>

--0000000000005e46c5065d285766--

