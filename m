Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47F6C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 21:42:13 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.33006.1703108529053912046
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 13:42:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MaKeiy91;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6d9dc789f23so62646a34.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 13:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703108528; x=1703713328; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hv7VPJ+oMHy1Qq/shC1d782Ck/s9h+RMZARmm02gSBE=;
        b=MaKeiy91ltEjBOdzbhXXRyfdaaaqHoYWNHr5AbxM2moIKHxhalTpTvgWf87vJv2hqM
         /XLY6NoxJ1sJwvE9vSzk63LEc5yE/m6f7vKfeNPSGS/AO4a6dldOWUA/xpvhN9oNQKIs
         9rTgKIcPgZr9sZ89C+TqQ166NyScYkGxaKufylzCv8KKOtIDDW6y6nwUkswpvqrzYD4S
         q8DUoEpvo9/0J5Yxuso+D9+f9dZK0u+7hL7fIZU+50FKaS024T1Pax0zcRztELelWgN+
         hulmGXQGWiCvq7M6SA9b5dKRVssxPEI+HxXUN/U2CDZOV5i3qoR9dJseN17Ye9ohhjLA
         z7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703108528; x=1703713328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hv7VPJ+oMHy1Qq/shC1d782Ck/s9h+RMZARmm02gSBE=;
        b=dsBAmLVIh/u1NgsDcSfEIbMD5Y3fe8yVJtvFMc0OnJQmHpFoTcFhFVGLAkTzpW1B9t
         y8MaA6VtmPMkDh9l1WeIVaUDnvqfLFDls+AeEhcdLyBYCVyf2r0OxnGKLgpM2QpTA9jY
         BpZH5qUyMYEFFo7F3Z0HqBG0Dr0oI6h1tTd++WF0aoXPNKIDM2ZPaBGYeV2dbIH/w9hn
         vpdk/nsBzyQszbazTNwH1BLGPkL9prKa9zYerM8hbaWTRgvpEokZfwyF7Sjqjfvs5rkD
         X2XOIz0vTPttCibcGMAGTki92y/pSOdvpC4vNRgJ+ah+lsUUi5dRpri++qKnS8yXafnV
         nB0A==
X-Gm-Message-State: AOJu0Yxw4fracuYnhYzNYg55bIaf1xXSQr87DZlzhIbg5pJXAX5yRy5R
	KczEXExG4kRjyUPFCyOYx9sBvaQ3IjSj+5hRsVk=
X-Google-Smtp-Source: AGHT+IGideJYMVoWRVaMdQcqV+rd/uO3uwTEhnztzcmiug9cGdLGCjLROA01mHNJzay6fJdJzRkl37zFOW1rM09xEy4=
X-Received: by 2002:a05:6870:7185:b0:1fa:26e4:9cfe with SMTP id
 d5-20020a056870718500b001fa26e49cfemr438058oah.7.1703108528042; Wed, 20 Dec
 2023 13:42:08 -0800 (PST)
MIME-Version: 1.0
References: <20231220155334.1055853-1-ross.burton@arm.com>
In-Reply-To: <20231220155334.1055853-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Dec 2023 13:41:42 -0800
Message-ID: <CAMKF1sqC=LDFtm3eXqeWiSnDo7NW6=BTh3mJHzcFAOxDDSN0+g@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/2] lemon: upgrade to 3.44.2
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 21:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107675

On Wed, Dec 20, 2023 at 7:53=E2=80=AFAM Ross Burton <ross.burton@arm.com> w=
rote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> Lemon is packaged as part of sqlite, and sqlite 3.7.3 was released back
> in 2010[1].
>
> As the small source tarballs no longer include the tools, fetch the
> sqlite github mirror instead.
>
> Don't bother installing a pretty minimal manpage, as very few projects
> use lemon (sqlite itself, and libpbnjson).
>
> [1] https://www.sqlite.org/releaselog/3_7_3.html
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-oe/recipes-devtools/lemon/files/lemon.1  | 63 -------------------
>  meta-oe/recipes-devtools/lemon/lemon.inc      | 25 --------
>  .../recipes-devtools/lemon/lemon_3.44.2.bb    | 24 +++++++
>  meta-oe/recipes-devtools/lemon/lemon_3.7.3.bb |  7 ---
>  4 files changed, 24 insertions(+), 95 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/lemon/files/lemon.1
>  delete mode 100644 meta-oe/recipes-devtools/lemon/lemon.inc
>  create mode 100644 meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb
>  delete mode 100644 meta-oe/recipes-devtools/lemon/lemon_3.7.3.bb
>
> diff --git a/meta-oe/recipes-devtools/lemon/files/lemon.1 b/meta-oe/recip=
es-devtools/lemon/files/lemon.1
> deleted file mode 100644
> index 914ee07013..0000000000
> --- a/meta-oe/recipes-devtools/lemon/files/lemon.1
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -.Dd 2002-10-04
> -.Dt LEMON 1
> -.Os "Debian GNU/Linux"
> -.\" Manual page created by Guus Sliepen <guus@debian.org>
> -.Sh NAME
> -.Nm lemon
> -.Nd The Lemon Parser Generator
> -.Sh SYNOPSIS
> -.Nm
> -.Op Fl bcgmqsx
> -.Ar input
> -.Sh DESCRIPTION
> -.Nm
> -is an LALR(1) parser generator for C or C++.
> -It does the same job as bison and yacc.
> -But
> -.Nm
> -is not another bison or yacc clone.
> -It uses a different grammar syntax which is designed to reduce the numbe=
r of coding errors.
> -.Nm
> -also uses a more sophisticated parsing engine that is faster than yacc a=
nd bison
> -and which is both reentrant and thread-safe.
> -Furthermore,
> -.Nm
> -implements features that can be used to eliminate resource leaks,
> -making is suitable for use in long-running programs such as graphical us=
er interfaces or embedded controllers.
> -.Pp
> -.Nm
> -will read the grammer from
> -.Ar input
> -and write out a parser for that grammar in the C language.
> -.Sh OPTIONS
> -.Bl -tag -width indent
> -.It Fl b
> -Print only the basis in report.
> -.It Fl c
> -Don't compress the action table.
> -.It Fl g
> -Print grammar without actions.
> -.It Fl m
> -Output a makeheaders compatible file.
> -.It Fl q
> -(Quiet) Don't print the report file.
> -.It Fl s
> -Print parser stats to standard output.
> -.It Fl x
> -Print the version number.
> -.El
> -.Sh FILES
> -.Bl -tag -width indent
> -.It Pa /usr/share/lemon/lempar.c
> -Driver template for the
> -.Nm
> -parser generator.
> -.El
> -.Sh AUTHOR
> -.Nm
> -has been written by
> -.An D. Richard Hipp Aq drh@hwaci.com .
> -.Pp
> -This manual page was written by
> -.An Guus Sliepen Aq guus@debian.org
> -for the Debian GNU/Linux system.
> diff --git a/meta-oe/recipes-devtools/lemon/lemon.inc b/meta-oe/recipes-d=
evtools/lemon/lemon.inc
> deleted file mode 100644
> index 57b9fb710e..0000000000
> --- a/meta-oe/recipes-devtools/lemon/lemon.inc
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -DESCRIPTION =3D "The Lemon Parser Generator"
> -HOMEPAGE =3D "http://www.hwaci.com/sw/lemon/"
> -LICENSE =3D "PD"
> -SECTION =3D "devel"
> -
> -SRC_URI =3D "http://www.sqlite.org/sqlite-${PV}.tar.gz \
> -           file://lemon.1"
> -
> -S =3D "${WORKDIR}/sqlite-${PV}/tool"
> -
> -do_compile() {
> -    ${CC} ${CFLAGS} lemon.c -c -o lemon.o
> -    ${CCLD} ${LDFLAGS} lemon.o -o lemon
> -}
> -
> -do_install() {
> -    install -d ${D}${bindir}
> -    install -m 0755 lemon ${D}${bindir}
> -    install -m 0644 lempar.c ${D}${bindir}
> -    install -d ${D}${mandir}/man1
> -    install -m 0644 ${WORKDIR}/lemon.1 ${D}${mandir}/man1/
> -}
> -
> -BBCLASSEXTEND =3D "native"
> -
> diff --git a/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb b/meta-oe/rec=
ipes-devtools/lemon/lemon_3.44.2.bb
> new file mode 100644
> index 0000000000..1b849922a6
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION =3D "The Lemon Parser Generator"
> +HOMEPAGE =3D "https://sqlite.org/src/file/doc/lemon.html"
> +LICENSE =3D "PD"
> +SECTION =3D "devel"
> +
> +LIC_FILES_CHKSUM =3D "file://tool/lemon.c;endline=3D8;md5=3Dc7551a78fa3f=
decd96d1ad6761d205ee"
> +
> +SRC_URI =3D "git://github.com/sqlite/sqlite;protocol=3Dhttps;branch=3Dbr=
anch-3.44"
> +
> +SRCREV =3D "c8f9803dc32bfee78a9ca2b1abbe39499729219b"
> +
> +S =3D "${WORKDIR}/git"
> +
> +do_compile() {
> +    ${CC} ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} tool/lemon.c -o lemon

why do we need CPPFLAGS here ?

> +}
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 lemon ${D}${bindir}
> +    install -m 0644 tool/lempar.c ${D}${bindir}

.c file in bindir seems odd.

> +}
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-oe/recipes-devtools/lemon/lemon_3.7.3.bb b/meta-oe/reci=
pes-devtools/lemon/lemon_3.7.3.bb
> deleted file mode 100644
> index 354db17e6e..0000000000
> --- a/meta-oe/recipes-devtools/lemon/lemon_3.7.3.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require lemon.inc
> -
> -LIC_FILES_CHKSUM =3D "file://lemon.c;endline=3D8;md5=3Dc7551a78fa3fdecd9=
6d1ad6761d205ee"
> -
> -SRC_URI[md5sum] =3D "5437978aae90350cf984993091e0d695"
> -SRC_URI[sha256sum] =3D "dbf352e8fbb74829f5e7a88f9f6ceeb80a709537f668c36e=
4b6cdfb271309ef6"
> -
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107664): https://lists.openembedded.org/g/openembedde=
d-devel/message/107664
> Mute This Topic: https://lists.openembedded.org/mt/103283009/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

