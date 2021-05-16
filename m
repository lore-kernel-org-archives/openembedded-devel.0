Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.3649.1621151827593993207
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 May 2021 00:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R7GQYq2g;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id cu11-20020a17090afa8bb029015d5d5d2175so1240373pjb.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 May 2021 00:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RPCXZq6SGdnHV9KFKBV31+chcOUi92GGyXacwrTZQtU=;
        b=R7GQYq2g8MsPGrebB/r1pqy1GCrk0Cdk2Zoo0zWyLlaCOrHOag5NcwZUb8STLLR3QW
         eAE6+RoLq1SnEoKpkfitMBSZ4i49zEwJ5mKBOIOUGEQklQKpZdz+ZUw6t+j1r19JW17R
         Pr7KqrieRdbw0hbJGR1pEQLvKAK2Jr9Z3cwltZMnvi6xZWSjbPKMvDI9u40VMlPvhP9A
         ychM56PRFo7Ry/t8JSq2hOqq5D51VQJu5ilqVQuaQ6Bvpy3+eCoPDO866z+RfFqR8aep
         MvPmXc+8bkM5IBe45vDQdguhQprGZ8S+YKz+yMD1CHWPkQ81NvpVqSeUybXffNS6wiy2
         kCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RPCXZq6SGdnHV9KFKBV31+chcOUi92GGyXacwrTZQtU=;
        b=DXajvgmZFjp137PU2+qsTdYfpX6Zo8h7UmeqtxVN2w12HoxPDVSXov2bPg9EanH6wU
         o7+X7WEyh87Nm3+Q9U9OZmhLJVceFbBPrIG76USk4F8wKPdoioGaWvRNDI334I+B0VQ5
         vv9xN1P7XPHMTE8R7AXAJy8VpESd+z4q3trfWEnC+6W0P+HpF5NDwkC2D8+VvJ/ve+s5
         d2LQBl2a1OYGxZmTodE9eaABCMBYW2RXTARoZbYddD4LcKmTUTAp2vSe76LdEYlCxf1H
         Xawp5YKdUmcUEaJihY17F95XzRaV4RwFQdnS/8+aZInLHOtb4H0+jjGvWV/HcSlT0lsx
         kpfQ==
X-Gm-Message-State: AOAM532GfddcZE5qsOip92uAzlzwU+8BqDcsNBLsQ9XmhgHeIYGrjjKq
	4I3YH7xJ2AH3BlNBL+p8eUP1kQsA5a203Le990w=
X-Google-Smtp-Source: ABdhPJyCAwVzmpNGyX1soewtS/bBUKjp5amEgu3zdQj76+lPzDJ4fuiIZDgC1EKVg+XL0pFXIDuee62SrrvW9HNlIV0=
X-Received: by 2002:a17:902:b408:b029:ec:e879:bbd8 with SMTP id
 x8-20020a170902b408b02900ece879bbd8mr55038989plr.65.1621151827060; Sun, 16
 May 2021 00:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
 <20210515233853.583490-15-schnitzeltony@gmail.com> <104112c6-ce22-ce7f-1d35-73bde2ca6e38@gmail.com>
In-Reply-To: <104112c6-ce22-ce7f-1d35-73bde2ca6e38@gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sun, 16 May 2021 09:56:55 +0200
Message-ID: <CALbNGRR3i9-6aPmAShi+GKMObDB_F3N5rgGCS7y=pWYwWv2=0Q@mail.gmail.com>
Subject: Re: [oe] [PATCH 15/20] gegl: add PACKAGECONFIG libraw and enable it by default
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 16, 2021 at 3:07 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 5/15/21 4:38 PM, Andreas M=C3=BCller wrote:
> > Without gnome-photos fails to start and complains:
> > | (org.gnome.Photos:952): gnome-photos-WARNING **: 08:02:54.154: Unable=
 to find GEGL operation gegl:raw-load: Check your GEGL install
> > | (org.gnome.Photos:952): gnome-photos-CRITICAL **: 08:02:54.154: photo=
s_application_create_window: assertion 'gegl_sanity_checked' failed
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >   meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb b/meta-gnome/r=
ecipes-gimp/gegl/gegl_0.4.30.bb
> > index d08a3a3c9..06abf799e 100644
> > --- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb
> > +++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb
> > @@ -28,7 +28,7 @@ SRC_URI =3D " \
> >   "
> >   SRC_URI[sha256sum] =3D "c112782cf4096969e23217ccdfabe42284e35d5435ff0=
c43d40e4c70faeca8dd"
> >
> > -PACKAGECONFIG ??=3D "gexiv2 jpeg libpng librsvg sdl2"
> > +PACKAGECONFIG ??=3D "gexiv2 jpeg libpng libraw librsvg sdl2"
> >   PACKAGECONFIG_class-native =3D "libpng librsvg"
> >
> >   PACKAGECONFIG[jasper] =3D "-Djasper=3Denabled,-Djasper=3Ddisabled,jas=
per"
> > @@ -38,6 +38,7 @@ PACKAGECONFIG[jpeg] =3D "-Dlibjpeg=3Denabled,-Dlibjpe=
g=3Ddisabled,jpeg"
> >   PACKAGECONFIG[lcms] =3D "-Dlcms=3Denabled,-Dlcms=3Ddisabled,lcms"
> >   PACKAGECONFIG[libav] =3D "-Dlibav=3Denabled,-Dlibav=3Ddisabled,libav"
> >   PACKAGECONFIG[libpng] =3D "-Dlibpng=3Denabled,-Dlibpng=3Ddisabled,lib=
png"
> > +PACKAGECONFIG[libraw] =3D "-Dlibraw=3Denabled,-Dlibraw=3Ddisabled,libr=
aw"
>
> there is no libraw recipe in core or meta-oe or meta-gnome we only have
> libraw1394
>
I did not check properly - it is in meta-qt5-extra. Will send V2 adding lib=
raw

Cheers

Andreas
