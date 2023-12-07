Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF907C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 17:46:29 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.90804.1701971180175998372
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 09:46:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GF+OZ4Ht;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-59082c4aadaso110981eaf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 09:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701971179; x=1702575979; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0+DM8pzkmP68eW9EHk0AOpTTJcqjOF8NqNoCLcg3eM=;
        b=GF+OZ4HtAmlorKeT7e88/d5Zi8N9t3HqevwszPcxdAH2UhQM3NnbV5y5TJ5DpiPdlB
         b2chUOBI53DuS4LUeDzaGccxcrmj+7KLp+Qi/E6IBBIj5YHU10nmvHM8e5AgzI0YivK4
         bp3xNN9IyjHQ6S+Twt6/wsc/1ohnNjucR5ax1heBmifZqa6SnRyz3vj9PVzOkI8/eVlJ
         OOCuNqU0OMcPjEnioSxkeBcOD54sraK9qm09D9U0eD9jhOx1AdO/Frz1YIegmrqLvOq6
         Z8sXlbLoYxNJ4BfaPtMHjysAItdLxBq/WhuB8V5MFN8QOuXvoCaxFD/cuMFXj/yZdf8O
         ME1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701971179; x=1702575979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0+DM8pzkmP68eW9EHk0AOpTTJcqjOF8NqNoCLcg3eM=;
        b=gwalPjAHe1Wkx0F6vEvU7FEGqZWadM9yDbjHRl7z/TT7ziU7Q063p2mDExyPNLogxO
         TvAt8Npf1Akzoi7cIwdF5MoYXnHCjwx+XnkGTZfDYHFZtZdxEbq0oclK6uM7YggekxS9
         hZPdu9ngSgGgQZJFq5XvZyLIIvPOfE4cT2y0kipY8VWfgjAV3cE/vbXCEayUgl7Mxb6B
         lEe4p1A/LwmnWMqwIZzIU9krCj7seVQ5XVoO/psNtGHGQyRuVwKAqVjVNmB8CTBxP0gX
         FF8OrGFWpz1UVFLhulWPmPiUqe0cS7pMV0kS/YOUsSJfZEFhVzwcLyZDMHof/L77cm4n
         BoOw==
X-Gm-Message-State: AOJu0YygbXv3TXZ/rTxyGe4PvJ6BCe64IZspUMuQ73TJrIyGOXA5LV/3
	x2hK/jqNMNWTVe21WthhQiV0DVjlYkGYhRCrZjLI2szS
X-Google-Smtp-Source: AGHT+IGDVfD5ed9kOZLD8oj/NZm+ta9K65JZJyJbFqhgV03y9T8SxLrtpz3zazBPo8qpuk0IhiESjHknyjFeXz3CXqQ=
X-Received: by 2002:a4a:3c5c:0:b0:58e:1c47:8796 with SMTP id
 p28-20020a4a3c5c000000b0058e1c478796mr2950469oof.11.1701971179344; Thu, 07
 Dec 2023 09:46:19 -0800 (PST)
MIME-Version: 1.0
References: <20231207094757.1089092-1-jean-marc.bouche@foss.st.com>
In-Reply-To: <20231207094757.1089092-1-jean-marc.bouche@foss.st.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Dec 2023 09:45:53 -0800
Message-ID: <CAMKF1sqJZzmqN1U4WZiKwWud79=tjU97N=b5f_J=KALH6rjUPw@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] terminus-font: build compressed archives
 with -n
To: Jean-Marc BOUCHE <jean-marc.bouche@foss.st.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 17:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107285

Hi Jean-Marc

Thanks for your patch. Please Add a patch header describing what it
does with SOB and
Upstream-Status: added to it.

On Thu, Dec 7, 2023 at 1:48=E2=80=AFAM Jean-Marc BOUCHE
<jean-marc.bouche@foss.st.com> wrote:
>
> When building this recipe, internal archives are compressed with
> gzip. The compressed archives contain a header with the field
> MTIME (Modification Time) which is initialized from the built
> date. As a consequence, two builds of this recipe always generate
> packages whose checksum differs.
> Adding the -n option to gzip while compressing the archive does
> not save the original time stamp by default hence making
> reproducible package.
>
> Signed-off-by: Jean-Marc BOUCHE <jean-marc.bouche@foss.st.com>
> ---
>  .../use-no-name-option-for-gzip.patch         | 52 +++++++++++++++++++
>  .../terminus-font/terminus-font_4.49.1.bb     |  4 +-
>  2 files changed, 55 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-graphics/terminus-font/terminus-font/=
use-no-name-option-for-gzip.patch
>
> diff --git a/meta-oe/recipes-graphics/terminus-font/terminus-font/use-no-=
name-option-for-gzip.patch b/meta-oe/recipes-graphics/terminus-font/terminu=
s-font/use-no-name-option-for-gzip.patch
> new file mode 100644
> index 000000000..cb1fbcfaf
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/terminus-font/terminus-font/use-no-name-op=
tion-for-gzip.patch
> @@ -0,0 +1,52 @@
> +Index: terminus-font-4.49.1/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- terminus-font-4.49.1.orig/Makefile
> ++++ terminus-font-4.49.1/Makefile
> +@@ -92,9 +92,9 @@ otbdir  =3D $(prefix)/share/fonts/terminus
> +
> + install: $(PSF) $(PCF)
> +       mkdir -p $(DESTDIR)$(psfdir)
> +-      for i in $(PSF) ; do gzip -c $$i > $(DESTDIR)$(psfdir)/$$i.gz ; d=
one
> ++      for i in $(PSF) ; do gzip -c -n $$i > $(DESTDIR)$(psfdir)/$$i.gz =
; done
> +       mkdir -p $(DESTDIR)$(x11dir)
> +-      for i in $(PCF) ; do gzip -c $$i > $(DESTDIR)$(x11dir)/$$i.gz ; d=
one
> ++      for i in $(PCF) ; do gzip -c -n $$i > $(DESTDIR)$(x11dir)/$$i.gz =
; done
> +
> + uninstall:
> +       for i in $(PSF) ; do rm -f $(DESTDIR)$(psfdir)/$$i.gz ; done
> +@@ -193,7 +193,7 @@ psf: $(PSF)
> +
> + install-psf: $(PSF)
> +       mkdir -p $(DESTDIR)$(psfdir)
> +-      for i in $(PSF) ; do gzip -c $$i > $(DESTDIR)$(psfdir)/$$i.gz ; d=
one
> ++      for i in $(PSF) ; do gzip -c -n $$i > $(DESTDIR)$(psfdir)/$$i.gz =
; done
> +
> + uninstall-psf:
> +       for i in $(PSF) ; do rm -f $(DESTDIR)$(psfdir)/$$i.gz ; done
> +@@ -202,7 +202,7 @@ psf-vgaw: $(PSF_VGAW)
> +
> + install-psf-vgaw: $(PSF_VGAW)
> +       mkdir -p $(DESTDIR)$(psfdir)
> +-      for i in $(PSF_VGAW) ; do gzip -c $$i > $(DESTDIR)$(psfdir)/$$i.g=
z ; done
> ++      for i in $(PSF_VGAW) ; do gzip -c -n $$i > $(DESTDIR)$(psfdir)/$$=
i.gz ; done
> +
> + uninstall-psf-vgaw:
> +       for i in $(PSF_VGAW) ; do rm -f $(DESTDIR)$(psfdir)/$$i.gz ; done
> +@@ -279,7 +279,7 @@ pcf: $(PCF)
> +
> + install-pcf: $(PCF)
> +       mkdir -p $(DESTDIR)$(x11dir)
> +-      for i in $(PCF) ; do gzip -c $$i > $(DESTDIR)$(x11dir)/$$i.gz ; d=
one
> ++      for i in $(PCF) ; do gzip -c -n $$i > $(DESTDIR)$(x11dir)/$$i.gz =
; done
> +
> + uninstall-pcf:
> +       for i in $(PCF) ; do rm -f $(DESTDIR)$(x11dir)/$$i.gz ; done
> +@@ -288,7 +288,7 @@ pcf-8bit: $(PCF_8BIT)
> +
> + install-pcf-8bit: $(PCF_8BIT)
> +       mkdir -p $(DESTDIR)$(x11dir)
> +-      for i in $(PCF_8BIT) ; do gzip -c $$i > $(DESTDIR)$(x11dir)/$$i.g=
z ; done
> ++      for i in $(PCF_8BIT) ; do gzip -c -n $$i > $(DESTDIR)$(x11dir)/$$=
i.gz ; done
> +
> + uninstall-pcf-8bit:
> +       for i in $(PCF_8BIT) ; do rm -f $(DESTDIR)$(x11dir)/$$i.gz ; done
> diff --git a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.=
bb b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb
> index 65cafab9e..1fabe2e29 100644
> --- a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb
> +++ b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb
> @@ -9,7 +9,9 @@ LIC_FILES_CHKSUM =3D "file://OFL.TXT;md5=3Df57e6cca943dbc=
6ef83dc14f1855bdcc"
>
>  DEPENDS =3D "hostperl-runtime-native gzip-native bdftopcf-native"
>
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
> +          file://use-no-name-option-for-gzip.patch \
> +          "
>  SRC_URI[md5sum] =3D "1b6acbd221957e33c8a792ebfaf3a659"
>  SRC_URI[sha256sum] =3D "d961c1b781627bf417f9b340693d64fc219e0113ad3a3af1=
a3424c7aa373ef79"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107276): https://lists.openembedded.org/g/openembedde=
d-devel/message/107276
> Mute This Topic: https://lists.openembedded.org/mt/103031382/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

