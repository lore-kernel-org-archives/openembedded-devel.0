Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web10.381.1592007985514263274
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 17:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b2xXTAsM;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id p21so4873768pgm.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 17:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:organization:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0ipb0a+yopji2TbKuzkQSsKik4vH5H6TwshL2NuvD7o=;
        b=b2xXTAsMBeTGZJWGjZJSqtPZHNhuaigh8+zaalscK6BNsWHUy/fA7GiG4IxU961gVh
         AsFwgbhjUVvaMvNPd7DxVXAtEDT2Y0QfO3ypmW29UT1k1TdMEr3QOtcoYzhlDG2is9+8
         VB2TyAvzQBXIgK8RgOkNH2z2eZ6HDqvQU6A9EJY+8wmQsTlkhDRJK1vrEYFl2ickEt1w
         fqJr5uQqbbsbJ3UEetvMHYsjJfmhlxxNt93lqz4l5FYhSYr/BoeF2wBXtUTfW5Hwt45c
         q0p446zuOIJwHXFmDtABsaYj/UjrMLim/AMVP+G41YdXBcU9qPcjWYU2GJLZPo3NXDnR
         s6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:organization
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=0ipb0a+yopji2TbKuzkQSsKik4vH5H6TwshL2NuvD7o=;
        b=WZbNyND9ArYnR5AdkVudiTwi3pkBANYPGsCf4g/sLV+YVCx7nCi81CW5dUJG+NXDIb
         m5lxxbjOEHQAADmv2z+Wjae/9/1eYhr+Adxbaq+N7lNIEZbn/LAX5w1hOu9LVwGoS233
         ZoJpyoyeAx5Oe0pS02JDxTfOoK2KjgpqMB/Ct6kxmLwpR1qUmzHCUVO4ci6OBY+gPAWN
         VSfL9k3KpHI4fpKTmhmWzAElIsCjj0OInh8vsmc7D1W0VoA1vryvo0CoYSBGVhgDD0Ye
         PoBe+c8WnWZ0PDKLEZr9jbw64cFTtUrD8roKgsuWvC4WPuUEHYDw5PrQ9krA4ACwZdQk
         vzCg==
X-Gm-Message-State: AOAM533sgunvk/R2PXNRxgD4Rk2HmnGuO2JoUmpV4ZhtZAzzkLZz8ebn
	vD49thpNLMNzgagyD5jVT90=
X-Google-Smtp-Source: ABdhPJzvSnLyyl2OAFDZnIvH02015tndnNzgUzMoRsSIMQZQ9E5pkACgzuv8mED80YYXN9/tXj2h6w==
X-Received: by 2002:a63:3756:: with SMTP id g22mr12798599pgn.304.1592007984914;
        Fri, 12 Jun 2020 17:26:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from tyche.localnet ([2601:646:9200:4e0::96b0])
        by smtp.gmail.com with ESMTPSA id mu17sm6752752pjb.53.2020.06.12.17.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 17:26:24 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: Christian Eggers <ceggers@arri.de>, openembedded-devel@lists.openembedded.org
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/4] ttf-dejavu: Extend for native and nativesdk
Date: Fri, 12 Jun 2020 16:38:44 -0700
Message-ID: <6059723.tB9ojmTFGE@tyche>
Organization: HIMVIS
In-Reply-To: <CALbNGRSJb8fUA23=C+ecLN5-VpXb=sh2=cBCy8nR1_2shuBS4Q@mail.gmail.com>
References: <20200609063212.3788-1-ceggers@arri.de> <20200609063212.3788-3-ceggers@arri.de> <CALbNGRSJb8fUA23=C+ecLN5-VpXb=sh2=cBCy8nR1_2shuBS4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Tuesday, June 9, 2020 6:21:50 AM PDT Andreas M=FCller wrote:
> On Tue, Jun 9, 2020 at 3:06 PM Christian Eggers <ceggers@arri.de> wrote:
> > When using doxygen together with the "dot" tool (graphviz package), a
> > ttf font package is additionally required.
> >=20
> > Probably this change could also be moved to ttf.inc.
>=20
> Extend an allarch recipe to native - sounds odd to me...
>=20

bbclassextend will convert the dependencies to be PN-<bbclassextend> and th=
ats=20
where this will help. But ideally I think I agree, it would be better to so=
rt=20
out dependencies such that native/nativesdk can depend on PN for allarch on=
es.

> Andreas




