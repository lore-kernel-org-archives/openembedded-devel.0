Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DBDCCF9EB
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 01:36:42 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web10.18091.1761788197207019545
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 18:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H4atOHeB;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-430cadec5deso4973945ab.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 18:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761788196; x=1762392996; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KUIcT5pXGBAcAi3Hek29wg0Iz8X0eyuDbYezq8uBjg=;
        b=H4atOHeBcYZWFudtFSgah7f616HBeAsgbvSzxH7OI0Sz4AlUjjAIPcwcUIzTtIr6gT
         nvoDZFUsJEydP9tLpaJK+pdxYDMTaT/0IXF1gTPS/JE5wH68S3rjNAMv/wohwXA4raXy
         /eo1MFHsTfbS93r22sv/QiS/mAQ5ryuGDlTENhtJ1DzuTyZE3Hfl97EEfpqJMHJzGebN
         UdI96ZOAqtMdJ8z8keRgUajVR2UMe+delOCAtSaDSRl4QIaDVjSBV5luHt/RgcaIgxwS
         8B/3yWoOL+vjpWZcxa9KRigLe9AnSLdI4aP0YlckGLQm7HhYcAQxqrK4Ir4hamvEDdLP
         ZIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761788196; x=1762392996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2KUIcT5pXGBAcAi3Hek29wg0Iz8X0eyuDbYezq8uBjg=;
        b=Op+nYSBTHSDYFCMX+PM0VFDsIcumm2aduSWADAKdNq0oDLD1cxxomQ9WSqyAZLcVAW
         rjTp4TbenQsjGm68MvhyByk2osG1XP3HXN0hcuunWsOzQVfyJLyqiAKdad/Hu9iPxTkW
         UxguGtLP7/J+W8XKMOheUTe94/VCCBdr2xcVJqvH5Q3ZK6n+PwoV+9nW827dOSiY8uBx
         YeRK+NJ+GItZjtN7+c0X/p0spFRsxTc7uJMpK+otLrdBzAr4kz3O7UcM62dTN88jF57T
         4KMWne/oHWqLdtXmJTaVqsr94OTpuwzircsUite0CQ1ydxbTXAsmzMxtBm+6rAOeuvzq
         ce1Q==
X-Forwarded-Encrypted: i=1; AJvYcCViLmkfIa3K0n+5jHMAgssxemTuhuNJe8QCozYcCN9oLCtbmX41Qi3fu/d8RJqY6lW7zT6M0QlzcgZPWP8kGmen/IY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxHhapNtD2XPEQGYFEUrDAhwFSV46B38Qlc0UFYJBs/3tN3eJw/
	gt+cEeBzb1udwpNhQ/SopDYy4Rx6nQdEB3NXWN4TFcfjuXneNGXJN8Ht0QB8R1hSi1cpnVdOFZW
	VyzZRXKkNNwxPFTQO/05+0TKLfkd9l2qMVoNhtBY=
X-Gm-Gg: ASbGnctnv/W1qupHwKh8d3BM2zy78WVX29OJAM881KYQBcij4i3Yq0CCzadxoQe/pPa
	532dBYH3E2ABx9LP/wJoeqm2WzAh20EpQb4gmWEpdXCh+dkeQwtPAW9+HINN9KLrUPKAyEVKWva
	a6Ab/+9MRyEAX0jUHC1ABS2AfWykdJTspUU3i9pXrx/S2JIgbhSk7IPSfYe1mvVjfmGvY+AuLHi
	6nx81b/Op1PHH1x46tik1g8oFM+9x9Ojigc4aLe/JMlwR5JbxqwAGlnjAHFqWHWaqds5jeGGDwP
	HWoBZBV/6apC18dNCzXW/Ko/CIz2jhDVZmmjGcEzUVOyKbxUl3TEgWDRqtaZCq0Q7a0VheJAHuu
	yI5E=
X-Google-Smtp-Source: AGHT+IEXkKsMbwogiUN6m+CE0roHNN5iL2Fy6SLaK+RQ73YYjvWEV/3rJjwQYgWEfCpunTW0Kj7lZqGy3y4phpOBPBI=
X-Received: by 2002:a05:690c:ec6:b0:786:1f43:96dc with SMTP id
 00721157ae682-786390d3a21mr30635507b3.56.1761787741500; Wed, 29 Oct 2025
 18:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <186254E5AFCF9A1C.28137@lists.openembedded.org>
 <IA4PR11MB942025F4F4ACFCD39771A76AB8FAA@IA4PR11MB9420.namprd11.prod.outlook.com>
 <56d9e7c77a9924f1ec4f526a0a083d2652243b44.camel@intel.com>
In-Reply-To: <56d9e7c77a9924f1ec4f526a0a083d2652243b44.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Oct 2025 18:28:35 -0700
X-Gm-Features: AWmQ_bkuvAO1bwUmkFp4xewkI2L7Qctz1CqAG_hi3GvPuyVgHI58w4ea00dV2OM
Message-ID: <CAMKF1srL9oF4h1K0E+ejj-TxerhHyC2s_GiAe8jAnTFey6_xkA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 1/2] webkitgtk3: update 2.44.1 -> 2.44.3
To: anuj.mittal@intel.com
Cc: "Jiaying.Song.CN@windriver.com" <Jiaying.Song.CN@windriver.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 01:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121177

On Wed, Oct 29, 2025 at 6:15=E2=80=AFPM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Dintel.com@lists.openembedded.org> wrote:
>
> On Wed, 2025-10-29 at 08:52 +0000, Song, Jiaying (CN) via
> lists.openembedded.org wrote:
> > kindly ping for scarthgap branch
> >
>
> These were missed and I will include them now.

are you going to add it to current PR that we have on ML now ?
or to the next lot

>
> Thanks,
>
> Anuj
>
> > -----Original Message-----
> > From:
> > openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org
> > > On Behalf Of Song, Jiaying (CN) via lists.openembedded.org
> > Sent: Friday, September 5, 2025 4:16 PM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: [oe] [meta-oe][scarthgap][PATCH 1/2] webkitgtk3: update
> > 2.44.1 -> 2.44.3
> >
> > From: Jiaying Song <jiaying.song.cn@windriver.com>
> >
> > Changelog:
> > https://webkitgtk.org/2024/05/16/webkitgtk2.44.2-released.html
> > https://webkitgtk.org/2024/08/13/webkitgtk2.44.3-released.html
> >
> > Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> > ---
> >  .../webkitgtk/{webkitgtk3_2.44.1.bb =3D> webkitgtk3_2.44.3.bb}    | 2
> > +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)  rename meta-
> > oe/recipes-support/webkitgtk/{webkitgtk3_2.44.1.bb =3D>
> > webkitgtk3_2.44.3.bb} (99%)
> >
> > diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.1.bb
> > b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
> > similarity index 99%
> > rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.1.bb
> > rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
> > index fc96d5dc3b..7d70cbda78 100644
> > --- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.1.bb
> > +++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
> > @@ -16,7 +16,7 @@ SRC_URI =3D
> > "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
> >
> > file://0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-decl.patch
> >  \
> >             file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
> >             "
> > -SRC_URI[sha256sum] =3D
> > "425b1459b0f04d0600c78d1abb5e7edfa3c060a420f8b231e9a6a2d5d29c5561"
> > +SRC_URI[sha256sum] =3D
> > "dc82d042ecaca981a4852357c06e5235743319cf10a94cd36ad41b97883a0b54"
> >
> >  inherit cmake pkgconfig gobject-introspection perlnative
> > features_check upstream-version-is-even gi-docgen
> >
> > --
> > 2.34.1
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121175): https://lists.openembedded.org/g/openembedde=
d-devel/message/121175
> Mute This Topic: https://lists.openembedded.org/mt/116009143/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

