Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC719C3600C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:58:27 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.5121.1743458298595388601
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 14:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ET+5xVw/;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3fb3f4bf97aso1509966b6e.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 14:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743458298; x=1744063098; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5vTuEwbU6mf7kGMzoSnx7QPjsCKGb8c5MfpkVaayViQ=;
        b=ET+5xVw/dJn0lhrVW9OfXXluCARwUuhuOF0XI1y4rSEHYH0cVWajYFp7qPlN++Y4mP
         PLAO8Re9J2RqxIuxddldn6tMx2K3l1ba3CtqvO3f82L9UufmyAqaC0iaZ0arQzD+fCCm
         wIrxamVC3cmRqloNKD1v/9z2TyKHDfmXp1evJoRCSDiK2kf4mU0fbtzB1mbIHo5Kce1Y
         ZpNy9wg6yp88CJLQjwoI8uH5ilFouCkW/Grg5w+03nlKE3/CID1uFMf528c5i4FzKmWI
         XYuptAiTs9NzTyWqhz3yeqLWgsX9ul/psCLTkB17nmLvRGdzbEN3wvzOplNxG4BbnD1L
         UDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743458298; x=1744063098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vTuEwbU6mf7kGMzoSnx7QPjsCKGb8c5MfpkVaayViQ=;
        b=HQYChranwlTt8q3FBvUuBRByHF2leqPRg+1HzqKS27+QrlFs4ka1g/tZzqZgNVc0P3
         S326FapnvoXi08in4sPcYS+AQygIizcDOvO0ohVFxbQj22vgL2mlxPBERG7bt/aasuFK
         fi9yRGtDfrxh6a+VdlaYBpbK+WJZMQt+Z08w/nW1AjguOxMfkoDwMQ00FSR2JcU83jJ+
         c+/GpDwnd1DGxJDcsqh9JDvd9TBbS92RG4mtiQrtAAxz8UyaBFftGr04ASx0GTbnnp4w
         sMASbnMNVqkxqNqrDlQPEydRyOmD74lWTWu/VSzQOwMjaQC/FGFIkVugxeG0ENDw3uU6
         daRw==
X-Gm-Message-State: AOJu0YzMW0oBrHoYwAYGb3cdLxrsBTwsSNyntwD8gTOGGdcTHmR+Atw+
	6jGBw+YGaiOQgR8ji6vxCp8kFxmogvnXAizQ0Dg9AJg+BljRqi+ySXCWDCBPHxvnz6b/EscafVb
	kdvavyLDiZMjVdYAQC2P+SMgNZZ8=
X-Gm-Gg: ASbGnctaiOhq1o2pCiV5r1QHrs2di5L8hy9VsWY+sauDfjg6WKPkon4ZekMz4Qv+fep
	3jAc7ALs4upZjwoHtZumTAkVumQ51zoKSpfPWszGzXVAfMujUGik/ADAGtP3vNnfwd7pQQTzLIl
	INDq5Tw3pnei4uuWWEUs3E6qZv9Q==
X-Google-Smtp-Source: AGHT+IFxJeIkZeq9P7231XHQtg2gLtJ/FBAGFwZLa7NPCDdGWWcumFOBocx7p8GpDIr4U3aBKXsYLNlKqFVsfOJRyyI=
X-Received: by 2002:a05:6808:2a86:b0:3f9:bdd:3eb3 with SMTP id
 5614622812f47-3ff282183a2mr829292b6e.16.1743458297751; Mon, 31 Mar 2025
 14:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250331062237.8115-1-f_l_k@t-online.de> <20250331062237.8115-2-f_l_k@t-online.de>
 <CAMKF1srs8KfdY+9tZn33x00bUKSRvbA=YNBMPqBHEskiBV3Qqw@mail.gmail.com>
In-Reply-To: <CAMKF1srs8KfdY+9tZn33x00bUKSRvbA=YNBMPqBHEskiBV3Qqw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Mar 2025 14:57:50 -0700
X-Gm-Features: AQ5f1JpXyQHEY33o_xpUytz1a93p-C4-pDIEn9rzDaT6mmQGGa-jLnc2MV5n9Q4
Message-ID: <CAMKF1spWJFxOTduN3Lo4XKe3aPW05ifekHHXQ0q2rJ1=5DxbSg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 2/2] celluloid: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 21:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116459

another error where I have the licenses enabled still ends up with
errors on qemuarm -
https://errors.yoctoproject.org/Errors/Details/850188/

On Mon, Mar 31, 2025 at 2:39=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Sun, Mar 30, 2025 at 11:22=E2=80=AFPM Markus Volk via
> lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org>
> wrote:
> >
> > Celluloid is a nice and clean gtk4/libadwaita frontend for mpv that imp=
roves
> > usability in gnome
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >  .../celluloid/celluloid_0.2.7.bb              | 24 +++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >  create mode 100644 meta-gnome/recipes-extended/celluloid/celluloid_0.2=
.7.bb
> >
> > diff --git a/meta-gnome/recipes-extended/celluloid/celluloid_0.2.7.bb b=
/meta-gnome/recipes-extended/celluloid/celluloid_0.2.7.bb
> > new file mode 100644
> > index 0000000000..d4aada37ff
> > --- /dev/null
> > +++ b/meta-gnome/recipes-extended/celluloid/celluloid_0.2.7.bb
> > @@ -0,0 +1,24 @@
> > +SUMMARY =3D "Celluloid is a simple GTK4 frontend for mpv"
> > +HOMEPAGE =3D "https://github.com/celluloid-player/celluloid"
> > +LICENSE =3D "GPL-3.0-only"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8006d9c814277c1bfc4ca22af94=
b59ee"
> > +
> > +DEPENDS =3D " \
> > +    appstream-glib \
> > +    appstream-glib-native \
> > +    desktop-file-utils-native \
> > +    gtk4 \
> > +    glib-2.0 \
> > +    glib-2.0-native \
> > +    libadwaita \
> > +    libepoxy \
> > +    mpv \
>
> I think due to mpv dependency  here amd mpv needing ffmpeg this needs
> something like below
>
> EXCLUDE_FROM_WORLD =3D "${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED",
> "commercial", "0", "1", d)}"
>
>
> > +"
> > +
> > +inherit meson gettext mime-xdg pkgconfig gtk-icon-cache
> > +
> > +SRC_URI =3D "git://github.com/celluloid-player/celluloid.git;protocol=
=3Dhttps;branch=3Dmaster"
> > +SRCREV =3D "a7d30b11693e48b18637eb8adc3cfd6a07794680"
> > +S =3D "${WORKDIR}/git"
> > +
> > +FILES:${PN} +=3D "${datadir}"
> > --
> > 2.49.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#116394): https://lists.openembedded.org/g/openembed=
ded-devel/message/116394
> > Mute This Topic: https://lists.openembedded.org/mt/111999601/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

