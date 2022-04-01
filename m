Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34178C433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 03:00:27 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.6179.1648782026493734285
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 20:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MbRNKlhS;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id p25so1119725qkj.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 20:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lY2XKFiunydP7G4oMDtxmeuMJWAePwX93xrzU59dbD4=;
        b=MbRNKlhSMRxC5TKO4moFLAHSX9+PiErT8GcqZh3wF1tkQ/VGkp7tIBK6dNWGC6GOEB
         xC5/slB6QndJurXDyDSjMyWzb+wId7krtB/r9g+ErTtNItD6JY23uMsmXUqYTlkQAnRm
         ULunw0G6LmgeJHywk9y2hcR1byLi+C5Ryjo/iIPoyM/R6ircqehIrPHei03jpJzPhBTk
         rGpICjRVd+p4U173zNKCOrmRCE6027Vivxr2CFNAoVciB8PhKIauoybmgA2Mmx7xc8v7
         gr+VUEJsdNBdi9Rn10VWlG5zUjL85h/f5WW0UHtdR1uopG1uIHVFCHwOVpcuoTNAQbO0
         uVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lY2XKFiunydP7G4oMDtxmeuMJWAePwX93xrzU59dbD4=;
        b=scyViAqYlMYUl5G7ln9CLPKnthWNXXnJ8s9NN9UP4E2/JpPlCwQoQQiCHCwSJ7kATy
         Q9nKDBdnyhSDnmjnc3h0XN9/NYVFPfwUKxOztPfjHvhjHQATvYSs1LzwH+vI/PjRPRY0
         kijyUEJ3xuc6mWVQa04Ds0sAZTlEi/MhPsyM4Vo+lDOWdwtZUDuTDJrC/5NcaQNP4b9N
         UMk3kDAfU5tgqUrfIi2pYofK7/Q3+E4aQipBFcwrC1wQMsnJ8LNx0tqVUrpAsKWTAs/Y
         59XlVr9HkNcUKsB0Rj9tkAPFNVBUXi/jeIOKGLbrIJ3mbsceIt5ms3oNDmXnknC0y5At
         hR0g==
X-Gm-Message-State: AOAM532eT57Vtuz4Lk9Gm48vZaqdX0qrHMB3Y/Ws7MjKD6ClHEBL7QON
	vqw2L8h43QJfoP7jozeZVWgE4fDv2+p2UQo6kUI=
X-Google-Smtp-Source: 
 ABdhPJxkeJPjhuFH/kXhvGkVHjeZn5PhhRYATTYZPibUaxvYnSkEes8Obv3/RsBIgveH3X68t+TVUOdpRpuAXvqUQ1c=
X-Received: by 2002:a05:620a:2993:b0:67d:7116:a642 with SMTP id
 r19-20020a05620a299300b0067d7116a642mr5393383qkp.180.1648782025476; Thu, 31
 Mar 2022 20:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220331195826.2578886-1-schnitzeltony@gmail.com>
 <20220331195826.2578886-2-schnitzeltony@gmail.com>
In-Reply-To: <20220331195826.2578886-2-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Mar 2022 19:59:59 -0700
Message-ID: 
 <CAMKF1srRu3HgDFct0=BP2wQM-9H0xTnC+mRhFVKEihzoYVzrVw@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] gnome-commander: Force gcc(-runtime)
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Apr 2022 03:00:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96313

This is due to a regression introduced in glib-2.0 via
https://gitlab.gnome.org/GNOME/glib/-/merge_requests/2114
 see
https://gitlab.gnome.org/GNOME/glib/-/issues/2625

for details. So I guess until the above issue is resolved we can
disable clang for it.

On Thu, Mar 31, 2022 at 12:58 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> clang/llvm cause multiple issues and it is not upon us to fix them
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../recipes-gnome/gnome-commander/gnome-commander_1.14.2.bb   | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.1=
4.2.bb b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.14.2.bb
> index c67242299..f0f47fd53 100644
> --- a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.14.2.bb
> +++ b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.14.2.bb
> @@ -18,5 +18,9 @@ PACKAGECONFIG[taglib] =3D "--with-taglib,--without-tagl=
ib,taglib"
>  PACKAGECONFIG[libgsf] =3D "--with-libgsf,--without-libgsf,libgsf"
>  PACKAGECONFIG[poppler] =3D "--with-poppler,--without-poppler,poppler"
>
> +# gnome commander has several issues with clang/llvm
> +TOOLCHAIN =3D "gcc"
> +RUNTIME =3D "gnu"
> +
>  FILES:${PN} +=3D "${datadir}/metainfo"
>  FILES:${PN}-dev +=3D "${libdir}/${BPN}/lib*${SOLIBSDEV}"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96307): https://lists.openembedded.org/g/openembedded=
-devel/message/96307
> Mute This Topic: https://lists.openembedded.org/mt/90163236/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

