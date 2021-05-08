Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.7915.1620488768915666383
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 May 2021 08:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=shj9YdN/;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 5so2381927qvk.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 May 2021 08:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PHz2tZclR2Xpr6MeyHA5nR8O8z9ZwI7pXZ9fbEKPqrw=;
        b=shj9YdN/yOu3GkTBwwGeZBJuu9Zve/gzrtC+H1iuAYTWHbrqclqPEotds8BaygkCIp
         ru220FhlVqgmFxVqsNt538vK7wFdInUhPZk+LXLuZKWh4G3xjP6mGUO+Dh/BC1cfu8FU
         /2FSD9ajO9DB87Qdp05rDlHlunMnWmJVcyWxroEg1u+Bz+rTgyMLfSOwp5ECUxzGehfi
         SES3GaP7pQgqw5yFCMIGqIH1mqhiJpYkrTe9aK3edciLJzHMSb6BbYfsqiLvVkAFA8zt
         xquFqBU1PnNC1I6gV7paC0vw5dti49TfqGOsht1G533NcVs+qnaQguIKzxQbSC2m3eE/
         gOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PHz2tZclR2Xpr6MeyHA5nR8O8z9ZwI7pXZ9fbEKPqrw=;
        b=Fnz10P3ZoRRTP+QqjqEM5OxBn9HZpZLB0QKfVzOBOBdxUA6CFCy6d8GpuSulsNnlN4
         ZeeMAiglnwoNuBTTTU1FserrWDFVtYcakfzgFAlw6A18yHQo8LO51jtivFYBJA4aoAbJ
         bdATTXqAzln0dOZirosojKW61TLIskBNxtidliWJzHFfTpg6YxBIzo7XnoIsW+GsCByj
         HlaLvhcKFwe5qzG89dPvyywbmgV3daez3z5EPXSk4AORjCm0SzCkeI0WMzaQAwYKBuZJ
         yfmTTxG+B5gSb5XRBmoqE2okf1zLRWzjPikqAMmdU0rgr7cqAA/zprX4RH5tOgj9F7Vb
         QFfg==
X-Gm-Message-State: AOAM531BNxgC8wK3PQAeJsHmBbhooYFDJksiKHKeq7iN4SBb5XiDVEAa
	bCTWoEcrFdWGXpupBR1kz/Z2j7/fNoV839YlRxc=
X-Google-Smtp-Source: ABdhPJwnZHtqFUo6OsBm0IBJUNrb5oyN194sVu03nkKmxwohvucCmSS4aFadYXE6Iof67fHyohBpNwL19wMIFj+IueE=
X-Received: by 2002:ad4:4dc8:: with SMTP id cw8mr14953953qvb.16.1620488767993;
 Sat, 08 May 2021 08:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210508142135.2014030-1-raj.khem@gmail.com> <CALbNGRScoFY-hVi11kBZPK3utntZDp3=hiQ_TKqxMd83-X8-qA@mail.gmail.com>
In-Reply-To: <CALbNGRScoFY-hVi11kBZPK3utntZDp3=hiQ_TKqxMd83-X8-qA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 8 May 2021 08:45:40 -0700
Message-ID: <CAMKF1sorkUACNAb2-WQSXR-ZjkzxAWHTnc7dbzJF5nfbDksyFQ@mail.gmail.com>
Subject: Re: [meta-multimedia][PATCH] libmusicbrainz: Rework native and target pieces
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andreas

On Sat, May 8, 2021 at 8:40 AM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> On Sat, May 8, 2021 at 4:21 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Build the native tools via a proper native recipe
> > Once done this way we do not need any patches
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  .../files/allow-libdir-override.patch         | 21 ------------
> >  .../musicbrainz/libmusicbrainz_git.bb         | 34 +++++--------------
> >  2 files changed, 9 insertions(+), 46 deletions(-)
> >  delete mode 100644 meta-multimedia/recipes-multimedia/musicbrainz/file=
s/allow-libdir-override.patch
> >
> > diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/files/allow=
-libdir-override.patch b/meta-multimedia/recipes-multimedia/musicbrainz/fil=
es/allow-libdir-override.patch
> > deleted file mode 100644
> > index db4d6e8c99..0000000000
> > --- a/meta-multimedia/recipes-multimedia/musicbrainz/files/allow-libdir=
-override.patch
> > +++ /dev/null
> > @@ -1,21 +0,0 @@
> > -Allow LIB_INSTALL_DIR to be set by the the cmake configure invocation.=
  We dont
> > -easily have a way of determining something that patches ${LIB_SUFFIX} =
so we'll
> > -set LIB_INSTALL_DIR.
> > -
> > -Upstream-Status: Inappropriate [configuration]
> > -
> > -Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> > -
> > -Index: git/CMakeLists.txt
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- git.orig/CMakeLists.txt
> > -+++ git/CMakeLists.txt
> > -@@ -36,7 +36,7 @@ FIND_PACKAGE(LibXml2 REQUIRED)
> > - SET(LIB_SUFFIX "" CACHE STRING "Define suffix of directory name (32/6=
4)")
> > - SET(EXEC_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX} CACHE PATH "Installat=
ion prefix for executables and object code libraries" FORCE)
> > - SET(BIN_INSTALL_DIR ${EXEC_INSTALL_PREFIX}/bin CACHE PATH "Installati=
on prefix for user executables" FORCE)
> > --SET(LIB_INSTALL_DIR ${EXEC_INSTALL_PREFIX}/lib${LIB_SUFFIX} CACHE PAT=
H  "Installation prefix for object code libraries" FORCE)
> > -+SET(LIB_INSTALL_DIR ${EXEC_INSTALL_PREFIX}/lib${LIB_SUFFIX} CACHE PAT=
H  "Installation prefix for object code libraries")
> > - SET(INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}/include CACHE PATH "I=
nstallation prefix for C header files" FORCE)
> > -
> > - CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/libmusicbrainz5.pc.cmake $=
{CMAKE_CURRENT_BINARY_DIR}/libmusicbrainz5.pc)
> > diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbra=
inz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_=
git.bb
> > index ca9d94a19c..f5ea36da91 100644
> > --- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git=
.bb
> > +++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git=
.bb
> > @@ -3,38 +3,22 @@ DESCRIPTION =3D "The MusicBrainz client is a library =
which can be built into other
> >  HOMEPAGE =3D "http://musicbrainz.org"
> >  LICENSE =3D "LGPLv2.1+"
> >  LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3Dfbc093901857fcd118f065f=
900982c24"
> > -DEPENDS =3D "expat libxml2 libxml2-native neon neon-native"
> > +DEPENDS =3D "expat libxml2 libxml2-native neon neon-native libmusicbra=
inz-native"
> >
> >  PV =3D "5.1.0+git${SRCPV}"
> >
> > -SRCREV =3D "44c05779dd996035758f5ec426766aeedce29cc3"
> > -SRC_URI =3D "git://github.com/metabrainz/libmusicbrainz.git \
> > -           file://allow-libdir-override.patch "
> > +SRCREV =3D "8be45b12a86bc0e46f2f836c8ac88e1e98d82aee"
> ^ This was not mentioned in description. Is PV still valid?
>

yes it is still valid infact it just brings one fix
https://github.com/metabrainz/libmusicbrainz/commit/8be45b12a86bc0e46f2f836=
c8ac88e1e98d82aee

> Cheers
>
> Andreas
