Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B297C83F09
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 17:37:28 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.2407.1751996240969514345
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 10:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UOwnblkN;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-717a2ef8943so9272047b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 10:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751996240; x=1752601040; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dll6g2RctTd3QwnIM2SJ+fyHWp7q74dkDTSfCEAYtWc=;
        b=UOwnblkN16Hf5Q9ar/cOGyMz+linKlUyRPxV8mYPdwF9qBvvfDx9EDsbG1hQSyCr5a
         KzQam0urMSuchX0X5l7qqJf9v87OLXhb1eZ1h3hz+DDrMVhTDDB07Rr/SMSHlHFnxueH
         c44bFHyUrOaOs9ZN2TAvQecOZ3aSqigwOEHZmQQojWiespSo1DE/NPQ8nKOODNdxGOaS
         MArTKdxW4YJ5ZgBt7e5YIWWbHm47BA8mmSn+MYGYmzE/py8xZ82sBk7THGvIuYD95cgd
         sfKgUJ33Uc3z8qqVrH9/E3INEYMQIP2cmZlyyM++ZNxo6bkY7Y72ZZwUJjAYJIfOm1+u
         UkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751996240; x=1752601040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dll6g2RctTd3QwnIM2SJ+fyHWp7q74dkDTSfCEAYtWc=;
        b=oymws1+K9SSQvigeVsOzLYkafGp3JWH+CvTE925K+x2aelcb6EwbUDvciAY+2McOtC
         9tFMsbyvhqDJPAcZ3sHN+n6tI++GU+KBBSjpYFOlUR4NyW82vLRX8MzV02wAwFTlVAuR
         CTBEEoViiooa+gV3WdE18gqYeixcD/tuwTLaOn/NjgiXowg5OxKGhC1j6ZaY5cyDXkzO
         w2MNQY7aM6s4VAX4brdI+dTxZuid7incSuPWJGatgOb58TErYaFUmcYCkinZwMGbF9dc
         A5VPb0iznw5u0y290uQ7J3CTtkb/dzK+dQebS6aCOiklZWtRiqhmRqL2tZz6jTHRbJ8n
         rX5w==
X-Forwarded-Encrypted: i=1; AJvYcCUnAje4xJAxl4h8y1ZHwWkZYEsgSGCJUhAG9dp6CMbE9B/d0tgjxseQrnnP+Ca/+nGVozv7SuEuIsof+1ALUXGCp5o=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxlQlViqCUtBV4nVR3xQ3OProdFY1Y6muDELv6STz/bxghSEj8L
	xnv2a4zhVW6hU0kfXdAlvfnrbBpE8o9iluLQnuiSp8AYKAwNGe4FeazFnYpGU7h1wLNr7QpuFqF
	2yMeaKJhpOfRUrHejXN3LQiBh1oWNmMw=
X-Gm-Gg: ASbGncugjmZ2DDS2b9DC75RVMW8GC/YH+bKkL7kVzIbTcuHbVTm9/qPlBEITzX6JWWj
	SksNemWKGqEVgwESvhXiZStNPDlbGV5D4KhnnRrD6S/s6p8B0vbgMRwXsDVUAXYluY+wt6puTiC
	z5thwGs7x1mPwsnUq5z+cyiKBJskgR4JF19rlbsR2WO3A=
X-Google-Smtp-Source: AGHT+IGg6oEzZUXQaBIJvPOYu9e0b/hocA8yN6AhSld3RxMwEeu+yqBydUvEXg6NGxlD3cYk5gdgIvXEiZ+1JJAXhlA=
X-Received: by 2002:a05:690c:700a:b0:712:e22d:a235 with SMTP id
 00721157ae682-717ae0edc4bmr11694947b3.17.1751996240005; Tue, 08 Jul 2025
 10:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250708105155.478279-1-martin.jansa@gmail.com> <20250708172058.xa73kq2wf7nbhuyf@hiagonb>
In-Reply-To: <20250708172058.xa73kq2wf7nbhuyf@hiagonb>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Jul 2025 10:36:53 -0700
X-Gm-Features: Ac12FXyiPCg_gw02bAmX4tN-6vkJC-bmZbesJEmETPZVisxRff2RcLXYh3y7nPc
Message-ID: <CAMKF1spKbW4cY4oghPL5RQtqjPa7L_poi=1ZNP7CS_OL0-909A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] gpicview: enable gtk3 PACKAGECONFIG
 only when gtk+3 is available
To: hiagofranco@gmail.com
Cc: martin.jansa@gmail.com, openembedded-devel@lists.openembedded.org, 
	Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 17:37:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118322

On Tue, Jul 8, 2025 at 10:21=E2=80=AFAM Hiago De Franco via
lists.openembedded.org <hiagofranco=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Hi Martin,
>
> On Tue, Jul 08, 2025 at 12:51:53PM +0200, Martin Jansa via lists.openembe=
dded.org wrote:
> > From: Martin Jansa <martin.jansa@gmail.com>
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> >  meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb b/meta=
-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb
> > index dab11a02bc..ace909fcf1 100644
> > --- a/meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb
> > +++ b/meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb
> > @@ -15,7 +15,7 @@ SRCREV =3D "ca13623c6176585db4759ce4371fbf89c56fa630"
> >
> >  inherit autotools mime-xdg pkgconfig
> >
> > -PACKAGECONFIG ?=3D "gtk3"
> > +PACKAGECONFIG ?=3D "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK=
3DISTROFEATURES}', 'gtk3', '', d)}"
>
> Thanks for the patch. In this case, shouldn't we add gtk+ if gtk3 is not
> set? If PACKAGECONFIG is empty, then the compilation will fail:
>

seems that way.

> | configure: WARNING: using cross tools not prefixed with host triplet
> | checking pkg-config is at least version 0.9.0... yes
> | checking for gtk+-2.0 >=3D 2.12.0... no
> | configure: error: Package requirements (gtk+-2.0 >=3D 2.12.0) were not =
met:
> |
> | No package 'gtk+-2.0' found
>
> Or maybe add gtk+ as dependency and keep the gtk+3 only on the
> PACKAGECONFIG?
>
> Best Regards,
> Hiago.
>
> >  PACKAGECONFIG[gtk2] =3D ",,gtk+"
> >  PACKAGECONFIG[gtk3] =3D "--enable-gtk3,,gtk+3"
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118321): https://lists.openembedded.org/g/openembedde=
d-devel/message/118321
> Mute This Topic: https://lists.openembedded.org/mt/114043964/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

