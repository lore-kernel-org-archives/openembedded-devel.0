Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B0FEC8733
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 15:07:32 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.15449.1694099242856523477
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Sep 2023 08:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Lz8mYFNf;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1c8e9d75ce1so714658fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Sep 2023 08:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694099242; x=1694704042; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPs+OaM5ZgujbyAi/ZovKoSBEvO9h1C/lGh9DoqxBI8=;
        b=Lz8mYFNfCulEWjPg95Y1MIwckxjamUieWCF/GQGAKHaEcSpdhDpD6fVMc8+w5Ynh+i
         X8xzByjWFArt5U33dSX5RIRoGN7o0c2BohcJbPRh58x+8hQwiWdf9lSG+FSjP22vjbH0
         mwOWKHEIfbrtbRfYIw9UukGNqvUqCFS1y8+awDHjf17zFw9aHOj73jmx9/+Uw5pJUWUb
         /YmB5s4MGHprWdYVyKgfGnRWkp188ZNYdCIoagixpYDP8zcF2W8696lFW2ULsebbRGo+
         Ll+mjPT4j+jsyw4Rt/mi0lxmSeFy4RaSDB8J/PyyEUBC1buQ5z10Iv5gV1N9VIQgh3EH
         +LwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694099242; x=1694704042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPs+OaM5ZgujbyAi/ZovKoSBEvO9h1C/lGh9DoqxBI8=;
        b=PrT/hp0Xb6egEPNIcKyRXuXX1AZ3SlQuqrMoh1EJxxSn6dXFO30cLjqDipWfj+gTEb
         gFhq51LV14Cpyu6gAA/Nbrgbjn5xqtv5rrhgdce9V0q0/dlkiCbfPsyZTp6T66QDvPiw
         yV8G7RUnSOW4AXltHXv8kKDl0HIHlcKUh3Emr3xnUPvuQBdnv2vZdlAlmpS4QL9PFxpS
         fNr4EXy+IuhHmXzALyzYepx/Mv0fY6mLhKUePkNffDl6MAsaaemCLFPksEEIkCGWg/2K
         H8wh03t8/mzx4iJyR0FJSGEJuso9PmA4txQUyzKj3ocXkj9sgzgXMPUy2jQ94TWioF5s
         eMpw==
X-Gm-Message-State: AOJu0YzCENotHvx5Heb79tNHusiAFZuhPjkaQLzxviPSWBlcsTBGfh9M
	YWxkCH1ZdOb1Bkn4AHXsKwXGftktJujEPMHCy38=
X-Google-Smtp-Source: AGHT+IHgT0u9zh799yg1m3uJdpZaIMkEze3sf/tS7mxdXGzXPAKHqgQGr4wGmo+/BBNaD3qUtzCn5Gj7/NhvgKgI39Y=
X-Received: by 2002:a05:6808:1691:b0:3a4:1983:69e6 with SMTP id
 bb17-20020a056808169100b003a4198369e6mr20657209oib.45.1694099242023; Thu, 07
 Sep 2023 08:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <1693965188-13918-1-git-send-email-wangmy@fujitsu.com>
 <CAMKF1spNnQ+GT-ju4OQ1b0yGsOROkHh9GE7tU=L_Akgw_U==7w@mail.gmail.com> <OSBPR01MB184533CAFD14318A563F2685DCEEA@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB184533CAFD14318A563F2685DCEEA@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Sep 2023 08:06:55 -0700
Message-ID: <CAMKF1srNj2xYSyEzmeshKbHgu8WPDd+WSG8CTsNvd5QSNECJHw@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] freerdp: upgrade 2.10.0 -> 2.11.0
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Sep 2023 15:07:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104790

On Thu, Sep 7, 2023 at 1:33=E2=80=AFAM Mingyu Wang (Fujitsu) <wangmy@fujits=
u.com> wrote:
>
> I have already started investigating this issue.
> However, due to the limitations of the environment, the compile speed is =
very slow. I will reply when there are results.

you can also use host clang to reproduce these kind of issues.
Just download latest release from

https://github.com/llvm/llvm-project/releases


>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> Development Dept.I
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road, N=
anjing, 210012, China
> TEL: +86+25-86630566-8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
> http://www.fujitsu.com/cn/fnst/
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org
> > <openembedded-devel@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: Thursday, September 7, 2023 11:47 AM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe] [PATCH] freerdp: upgrade 2.10.0 -> 2.11.0
> >
> > This fails to compile with clang
> >
> > https://errors.yoctoproject.org/Errors/Details/735497/
> >
> > On Tue, Sep 5, 2023 at 6:53=E2=80=AFPM wangmy <wangmy@fujitsu.com> wrot=
e:
> > >
> > > From: Wang Mingyu <wangmy@fujitsu.com>
> > >
> > > Changelog:
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > Noteworthy changes:
> > > * Various input validation fixes
> > > * Added various CMake options #9317
> > > * LibreSSL build fixes #8709
> > >
> > > Fixed issues:
> > > * Backported #9233: Big endian support
> > > * Backported #9099: Mouse grabbing support
> > > * Backported #6851: wayland scrolling fix
> > > * Backported #8690: Update h264 to use new FFMPEG API
> > > * Backported #7306: early bail from update_read_window_state_order
> > > breaks protocol
> > > * Backported #8903: rdpecam/server: Remove wrong assertion
> > > * Backported #8994: bounds checks for gdi/gfx rectangles
> > > * Backported #9023: enforce rdpdr client side state checks
> > > * Backported #6331: deactivate mouse grabbing by default
> > > * Cherry-pick out of #9172: channels/cliprdr: Fix writing incorrect
> > > PDU type for unlock PDUs
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  .../freerdp/{freerdp_2.10.0.bb =3D> freerdp_2.11.0.bb}            | =
2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)  rename
> > > meta-oe/recipes-support/freerdp/{freerdp_2.10.0.bb =3D>
> > > freerdp_2.11.0.bb} (98%)
> > >
> > > diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb
> > > b/meta-oe/recipes-support/freerdp/freerdp_2.11.0.bb
> > > similarity index 98%
> > > rename from meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb
> > > rename to meta-oe/recipes-support/freerdp/freerdp_2.11.0.bb
> > > index 4cb452608e..de87dc3a02 100644
> > > --- a/meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb
> > > +++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.0.bb
> > > @@ -13,7 +13,7 @@ inherit pkgconfig cmake gitpkgv  PE =3D "1"
> > >  PKGV =3D "${GITPKGVTAG}"
> > >
> > > -SRCREV =3D "7471ae383e7b7a613f275e19f7b54958a193c891"
> > > +SRCREV =3D "1384b3c33b9bd7599633cc54bf20cf20ec6be83c"
> > >  SRC_URI =3D
> > "git://github.com/FreeRDP/FreeRDP.git;branch=3Dstable-2.0;protocol=3Dht=
tps \
> > >             file://winpr-makecert-Build-with-install-RPATH.patch \
> > >             "
> > > --
> > > 2.34.1
> > >
> > >
> > >
> > >

