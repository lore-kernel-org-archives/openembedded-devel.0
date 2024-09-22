Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E6CCF9C5B
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 00:34:12 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.7037.1726965250224596668
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Sep 2024 17:34:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iNeTTeML;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5da6865312eso1917622eaf.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Sep 2024 17:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726965249; x=1727570049; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gi+cGf13SnPlCvidVhB6dpw88NBpOwIlyhl4P9nPL8Y=;
        b=iNeTTeMLk9VtHJZpofT0/40fy3w34c6JsfWbvP/zCMZASHldXiQWdQxAVmTI73vxYQ
         QjvieMCVN0Dy10wAijbZcQi3PjQZp2NyldujaOL2Z7n8TTQ2FodUVDdi2JhFXRgS2RzH
         jSiT2VHaLRiL8KWcWoYcATI+d4g0xYRW72xgW1WEyZ6dQ8NTkvoxpKtFeAF/gGNlQj8M
         42mo2WvFrjKzIFSRNWeVwNBX9WIHRxbqnbylWPb1otx6TRmrmJlA1p+/NGKa3L1BwEx+
         KLjs6v3VTTZYqaNwrP6OeTOMSO/ic6PWNftKKd/rjC9Tmfs/jK82RAguOLB7QLNL/M5p
         o8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726965249; x=1727570049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gi+cGf13SnPlCvidVhB6dpw88NBpOwIlyhl4P9nPL8Y=;
        b=Wlyn99zKzgd9uwd4oBh90skaVybiqNj1etqXM8ojqRYpAhqqJU/f3QdNn/cVKsWUqq
         mL/hi5Mqe8mIrgAduMpr1DESIZ48+fYrZUa7kJ0zp0uCiHhnA0VZ6Qija5oRRmmfERbT
         8hV5/I8z2+VagH+JWTB3O3RiDL2mGGuwbcqkeI3Gurz2YP9bplU9+rKDny9aMW4w7SR6
         TJ9nAGs1i4gwRE2YgYF145+AoKd43KQ1M1+8F/CLppnqQ7z92YLhVrHaq9gXMH8nRGIk
         9FCpW1QgfLcMkLxaJwbsWZ0yQuXIdY3cLazyNT1gFyzeZn6a+ziJNxBDGUGgn/3lZzhP
         UYnw==
X-Gm-Message-State: AOJu0Yxc1AK0+5ZEx4xHyds2w2zvJTE3C5Iljv877D9hLsRy1ck/Ziwx
	aLOTKspc8uUJNPVNugnTTV1CKO/3K1+C96ttCGMI18aoF3gBZGfmqllIEynbFsrG83hqlE6NYly
	3SRDQLJv6dNPvqWEmv3DGQyIJfc4=
X-Google-Smtp-Source: AGHT+IEwgvF++o4z+qh1NZYYroIyJm5gT4esbvLGceqYE6w6lh96tvFO5aW/otzGtdTSIWC3h3w1Yizoc8jsYxVykUY=
X-Received: by 2002:a4a:ee96:0:b0:5e1:e748:7ad with SMTP id
 006d021491bc7-5e58d2de4fdmr3072989eaf.7.1726965249337; Sat, 21 Sep 2024
 17:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240920150822.1131707-1-f_l_k@t-online.de> <20240920150822.1131707-7-f_l_k@t-online.de>
In-Reply-To: <20240920150822.1131707-7-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 Sep 2024 20:33:43 -0400
Message-ID: <CAMKF1srp2H2bx7J9wBpmm5Teo6SFFXXz4N3vc_0Hp=Q3qhF+iA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 07/23] gnome-console: update 45.0 -> 47.0
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Sep 2024 00:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112440

this fails - https://errors.yoctoproject.org/Errors/Details/806058/
I think it needs vte 0.78.0+ I am testing a local patch for upgrade, I
appreciate your work
in keeping Gnome upto date in OE ecosystem. I would suggest to build
packagegroup-gnome-apps and packagegroup-gnome-desktop
which might be able to give lot of build failures from meta-gnome recipes.

On Fri, Sep 20, 2024 at 11:08=E2=80=AFAM Markus Volk via
lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org>
wrote:
>
> Version 47.0
> ~~~~~~~~~~~~
>
> A edge case in drag-and-drop has been resolved, and Aleksandr Melman fixe=
d a
> string that hadn't been marked for translation.
>
> Updated Translations
>  * Belarusian  (Vasil Pupkin)
>  * British English  (Andi Chandler)
>  * Bulgarian  (Alexander Shopov)
>  * Catalan  (Jordi Mas i Hernandez)
>  * Chinese (China)  (Luming Zh)
>  * Czech  (Daniel Rusek)
>  * Danish  (Ask Hjorth Larsen)
>  * Galician  (Fran Dieguez)
>  * Georgian  (Ekaterine Papava)
>  * Greek  (Efstathios Iosifidis)
>  * Hebrew  (Yaron Shahrabani)
>  * Hungarian  (Bal=C3=A1zs =C3=9Ar)
>  * Indonesian  (Andika Triwidada)
>  * Lithuanian  (Aurimas =C4=8Cernius)
>  * Norwegian Bokm=C3=A5l  (Brage Fuglseth)
>  * Persian  (Danial Behzadi)
>  * Polish  (Piotr Dr=C4=85g)
>  * Portuguese  (Hugo Carvalho)
>  * Russian  (Artur S0)
>  * Slovak  (Jose Riha)
>  * Slovenian  (Martin)
>  * Spanish  (Daniel Mustieles)
>  * Swedish  (Anders Jonsson)
>  * Ukrainian  (Yuri Chornoivan)
>
> Version 47.rc
> ~~~~~~~~~~~~~~~
>
> Thanks to feedback from beta users, a couple small improvements were made=
.
>
> Updated Translations
>  * Basque  (Asier Sarasua Garmendia)
>  * Belarusian  (Vasil Pupkin)
>  * Brazilian Portuguese  (Juliano de Souza Camargo)
>  * Bulgarian  (Alexander Shopov)
>  * Catalan  (poc senderi)
>  * Chinese (China)  (Luming Zh)
>  * Czech  (Daniel Rusek)
>  * Finnish  (Jiri Gr=C3=B6nroos)
>  * Georgian  (Ekaterine Papava)
>  * German  (J=C3=BCrgen Benvenuti)
>  * Hindi  (Scrambled 777)
>  * Hungarian  (Bal=C3=A1zs =C3=9Ar)
>  * Kazakh  (Baurzhan Muftakhidinov)
>  * Korean  (DaeHyun Sung)
>  * Norwegian Bokm=C3=A5l  (Brage Fuglseth)
>  * Occitan  (Quentin PAG=C3=88S)
>  * Persian  (Danial Behzadi)
>  * Portuguese  (Hugo Carvalho)
>  * Romanian  (Daniel =C8=98erb=C4=83nescu, Florentina Mu=C8=99at)
>  * Russian  (Artur S0)
>  * Turkish  (Emin Tufan =C3=87etin, Sabri =C3=9Cnal)
>  * Ukrainian  (Yuri Chornoivan)
>
> Version 47.beta
> ~~~~~~~~~~~~~~~
>
> The preferences dialogue has been expanded to include scrollback size, an=
d
> there has been behind the scenes work fixing some pesky issues and settin=
g
> up future improvements.
>
> Thanks to work elsewhere in the stack, we now have restored screen reader
> support. This has taken far too long, and there is more work do be done, =
but
> hopefully this is a significant step forward.
>
> Additionally Alice reworked our styles to take advantage of improvements =
in
> Gtk, whilst Chris helped us keep current with developments in Adwaita, an=
d
> Ball=C3=B3 Gy=C3=B6rgy provided some fixes.
>
> Updated Translations
>  * Brazilian Portuguese  (Juliano de Souza Camargo)
>  * Greek  (Efstathios Iosifidis)
>  * Hebrew  (Yosef Or Boczko)
>  * Hindi  (Guntupalli Karunakar, Scrambled 777)
>  * Kabyle  (Rachida SACI)
>  * Nepali  (Pawan Chitrakar)
>  * Occitan  (Quentin PAG=C3=88S)
>  * Portuguese  (Hugo Carvalho)
>  * Romanian  (Daniel =C8=98erb=C4=83nescu)
>  * Serbian  (Du=C5=A1an Simi=C4=87)
>  * Serbian (Latin)  (=D0=9C=D0=B8=D0=BB=D0=BE=D1=88 =D0=9F=D0=BE=D0=BF=D0=
=BE=D0=B2=D0=B8=D1=9B)
>  * Slovak  (Matej Mrenica)
>  * Slovenian  (Martin)
>  * Turkish  (Sabri =C3=9Cnal)
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../{gnome-console_45.0.bb =3D> gnome-console_47.0.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-gnome/recipes-gnome/gnome-console/{gnome-console_45.0.bb =3D=
> gnome-console_47.0.bb} (85%)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb=
 b/meta-gnome/recipes-gnome/gnome-console/gnome-console_47.0.bb
> similarity index 85%
> rename from meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb
> rename to meta-gnome/recipes-gnome/gnome-console/gnome-console_47.0.bb
> index d03b5fe04..922b0576e 100644
> --- a/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-console/gnome-console_47.0.bb
> @@ -18,7 +18,7 @@ DEPENDS =3D " \
>      vte \
>  "
>
> -SRC_URI[archive.sha256sum] =3D "e7462128d2df2324a1d748062c40429cd0504af0=
9e407067b33f3a9d0c59c8e1"
> +SRC_URI[archive.sha256sum] =3D "487ec0de0a24f12ef6f778e4aee98d744a9dcc92=
1c9e7df98b2d9f410b00ef52"
>
>  PACKAGECONFIG ?=3D ""
>  PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse"
> --
> 2.46.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112412): https://lists.openembedded.org/g/openembedde=
d-devel/message/112412
> Mute This Topic: https://lists.openembedded.org/mt/108560567/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

