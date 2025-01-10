Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE4A3E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 17:02:30 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.24330.1736528548666455664
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 09:02:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZYs85xlf;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-71e17de2816so1031304a34.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 09:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736528547; x=1737133347; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HC9yOrQ8LoMWTsUm1K4HSmocIq+R7/qypnlQx0N6itE=;
        b=ZYs85xlf4SIykuZmXhayyiMofI0xdqCPgEmQ2Td3zulPvjqZp0KscKgboOwOfXk854
         pOA9EkJiXKrhe9+5Y+XemypFLZYhKwpIUPYzixfkZe7mrsLVinrWhWz9igagicGPArCK
         DY4R4psyIowQxX4BBOAs0KRvCV84cTTKsGBhIqJNAmYOln1Yt0gggU/Ih20DjnxocB33
         u2FGPM81DfkYqAY7xsqq9Qagnm1QSs2dXSWG1n3HGUrWNR9CQSIzn2zp/Cry0alm/BLh
         wBIHuBjnN4xEXG2s4wdrkX1Cr2llLs0rp1sm84ff4Olkc0nJKe6ZqbHOV9AXUQk8iBOK
         HxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736528547; x=1737133347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HC9yOrQ8LoMWTsUm1K4HSmocIq+R7/qypnlQx0N6itE=;
        b=YIfelQB5vX1Kcdf12l3YuQ3iGeFnPe18irHLMlQJs0q7a8IVtVdKLeFtCp8DAk6QYA
         GjIewEAHsGVy+xjIMVwTqq8J50e+HxAoYP4hIK2D6ZTgIYyreqwCK9AaYniBhzFhYnzY
         n6laPd9GUI0TFXx+nGED5XNcvc7o0OgfSWv7oUj4sY5PkGSPHXDjuRah7Vx2YUe/xl4L
         DBDhpTUZNe2qmDTH8YkRHmDEdaLTzO8TQ7SdDiaLH2claroAIN0jn8n2gxRHKHSrzyGq
         oQdyetHxUu4LsihJvt7VPOUljD+/IQkFw7r1vXH+SGFOIKHjV2Tq41Blb3EgqOv8ZseK
         Iy3g==
X-Gm-Message-State: AOJu0YxiBM0JKERneQWwaSQLc4TxgZbE3BWNuq7joiwA3E2lDArfOiX7
	ZXzo02iCti+Gy/8bCCLXcQsB+pAIY/+zMDM6kXGMtx7ea2HmApZesJQEfYoB3Gb/MNVXT7g9Rnm
	FA3IQ/uF9KTNlpGQko4Vy4UAm5zQ=
X-Gm-Gg: ASbGncsQzNvS6XRT1t0ERmE2tAiP3XBWDR0sulyVrEc0Tpm0GZNHSDpzHoL+mya0Di0
	OSNap+Q5ZOPC0AuUJsoxI0ZN+e+LEjrLYPnGO
X-Google-Smtp-Source: AGHT+IGx/FhaNh+LC3VUVTbc9dQ35W7yidDCUbEiWO5nV1M8OX3R6xwCQ6z9OatAsFbIzDz1Fq4Rei1zm+8qlojk7JE=
X-Received: by 2002:a05:6871:80c9:b0:297:24ad:402f with SMTP id
 586e51a60fabf-2aa066a6699mr5937380fac.12.1736528546953; Fri, 10 Jan 2025
 09:02:26 -0800 (PST)
MIME-Version: 1.0
References: <20250109232946.1556083-1-raj.khem@gmail.com> <20250109232946.1556083-4-raj.khem@gmail.com>
 <CA+chaQf9R+nrtURSz-dBGv02syyf0_fB0cS+RSbrWMsZ5=5fGg@mail.gmail.com>
In-Reply-To: <CA+chaQf9R+nrtURSz-dBGv02syyf0_fB0cS+RSbrWMsZ5=5fGg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Jan 2025 09:02:01 -0800
X-Gm-Features: AbW1kvbEQF8h28lfWZbooSP9Gu-ODCd63tecIZiI-a8ZiEwbBzxXNVjc4GousBY
Message-ID: <CAMKF1sr+UV_Nr=ZKFVCzz4H_m01x6X1E7hcJ36KNWRAaefQpug@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 4/6] mpd: Drop adding +git to PR
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 17:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114782

On Fri, Jan 10, 2025 at 12:02=E2=80=AFAM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
>
> Small typo in subject, PR->PV
>

yes thanks fixed in master-next

> On Fri, Jan 10, 2025 at 12:29=E2=80=AFAM Khem Raj via lists.openembedded.=
org
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > We are using latest release SHA1
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb =
b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb
> > index 51c459cffd..bf95f41b26 100644
> > --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb
> > +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb
> > @@ -17,7 +17,6 @@ DEPENDS +=3D " \
> >      expat \
> >  "
> >
> > -PV .=3D "+git"
> >  SRC_URI =3D "git://github.com/MusicPlayerDaemon/MPD;branch=3Dmaster;pr=
otocol=3Dhttps \
> >             https://github.com/mesonbuild/wrapdb/releases/download/fmt_=
11.0.2-1/fmt-11.0.2.tar.gz;name=3Dfmt;subdir=3Dgit/subprojects \
> >             https://wrapdb.mesonbuild.com/v2/fmt_11.0.2-1/get_patch;dow=
nloadfilename=3Dfmt_11.0.2-1_patch.zip;name=3Dfmt-meson;subdir=3Dgit/subpro=
jects \
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#114760): https://lists.openembedded.org/g/openembed=
ded-devel/message/114760
> > Mute This Topic: https://lists.openembedded.org/mt/110526837/3617156
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

