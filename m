Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.7353.1589953059737673036
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 22:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=caNDXNSb;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id n22so1628805qtv.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2020 22:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ACiOjE0eCEH3SZF3k7SZNwXV+bfkXt76PUjL7kXh0Cs=;
        b=caNDXNSbmzJ2FroQ5J1cRzBvBj0AsfiDwQkcFTgpanpoNg0UJ12sATr86z+Z0SCWHk
         uIkxAl24hpQ9zbTK/bznZveJdeRCAKC8US4zCu2yS3a9R8VOXv2c4OumodGJMgEEoLIK
         3cPUPvqjRaBw7exC98Q5jAXEpn2WtVn0PODZ1qPg7Xln8d1aBtGF3Vb6Jvo9sMTh8mrQ
         a6se9nZfE7eY6iyKs7XlbRBemrOWQihI9kNts7bzHxquBcNqz7XvfCVfdq12qkGCizkR
         3ZnEcJPKDjJ852YUAqBHq6C9LclpR0qxTOiynV03S15DgH0ze1EaVpyFPRyB1EFQbYKK
         Hnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ACiOjE0eCEH3SZF3k7SZNwXV+bfkXt76PUjL7kXh0Cs=;
        b=I+dW/VHL4CDl+iaFcI4e7HnZB+PCeC2FacHAQPOVyBfisoi6TH7Yf719dAVDihxe+8
         li1QmPD/X+GSEzP9UGz6tmGCAEko2DswIEIvvznfnFD7Iys5pFN3+44zOOmLtX/c+l9v
         3apEZ13jnD4hSoDxbhGP5LwpU1AlEEPmCI6lCbUL3/tmwTofBb3oaN7O555O3hHAdJVv
         1jMEY4mBLNs0BKb9HX+CaXztBuyrdhLZBi/qIRcw2PVBKvizuLMj2nN7zBELilDDw008
         lwUdUqkopSVxt5Db//8IZPPFyyjKoBJu9wj9rjwUadBqbVfsuUNdyzxmlyg9sm9d0Tcg
         9fnw==
X-Gm-Message-State: AOAM530MXOSY+bRfErv/083NlvEa3Q5U4gA9w37AfUINPpOp2cTeOafw
	xjmEwWa2QDOm6g+eN4aKM4LHQX0kWa5xpp7tZa8=
X-Google-Smtp-Source: ABdhPJxLhAKaQFfsAwk8XHxsWG9xGotyhb5q46kn1R6tTe5LENjd0+PXKZqHZzrb9faYBalVKlSzcRWHgwH+F0AIpZ0=
X-Received: by 2002:ac8:4311:: with SMTP id z17mr3423681qtm.316.1589953058619;
 Tue, 19 May 2020 22:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200519221852.30350-1-bunk@stusta.de> <b01fbc247323422e83f6234c97f5b56c@XBOX03.axis.com>
In-Reply-To: <b01fbc247323422e83f6234c97f5b56c@XBOX03.axis.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 19 May 2020 22:37:12 -0700
Message-ID: <CAMKF1spgPnHHw6g4_d-L25=kHm2A1e61vyQL4MN3GzkK3kDURQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] unicode-ucd: Stop broken license downloading
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Adrian Bunk <bunk@stusta.de>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 5:34 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-
> > devel@lists.openembedded.org> On Behalf Of Adrian Bunk
> > Sent: den 20 maj 2020 00:19
> > To: openembedded-devel@lists.openembedded.org
> > Subject: [oe] [meta-oe][PATCH v2] unicode-ucd: Stop broken license
> > downloading
> >
> > WARNING: unicode-ucd-12.1.0-r0 do_fetch: Checksum mismatch for local f=
ile
> > /home/bunk/yoctomaster/yocto-tmp/downloads/unicode.org.license.html
> > Cleaning and trying again.
> > WARNING: unicode-ucd-12.1.0-r0 do_fetch: Renaming
> > /home/bunk/yoctomaster/yocto-tmp/downloads/unicode.org.license.html to
> > /home/bunk/yoctomaster/yocto-tmp/downloads/unicode.org.license.html_ba=
d-
> > checksum_e9dd7d435db23241be3be21b5fca729b5cf883c8c039a70ea093031420d06=
abb
> > WARNING: unicode-ucd-12.1.0-r0 do_fetch: Checksum failure encountered
> > with download of
> > https://www.unicode.org/license.html;name=3Dlicense;subdir=3Dunicode-u=
cd-
> > 12.1.0;downloadfilename=3Dunicode.org.license.html - will attempt othe=
r
> > sources if available
> >
> > This downloaded a license file from upstream.
> > The upstream file did not match (copyright year changed).
> > A stale copy was downloaded from a mirror instead and checked.
> > The stale file with known contents never changes.
> >
> > Replace with a dummy check on a local copy of the license file.
>
> This defeats the whole point of LIC_FILES_CHKSUM, which is to detect
> future changes to the files included in it. If a local copy is used,
> it will never change even if the real license is changed and the
> changed license will most likely go unnoticed.
>
> This more seems to be a problem with how the fetcher works. If a file
> can be downloaded from the primary source listed in the SRC_URI, but
> it has the wrong checksum, then that should not be overridden by
> retrieving the file from a mirror instead (as it can be stale).
>
> Except of course things are not that simple, since the mirror may have
> been setup for exactly this purpose with a bbappend that changes the
> checksum to match that of the file on the mirror. Does anybody do such
> things? (Personally, I would rather change both the SRC_URI and the
> checksum in this case rather than rely on a mirror.)

if a license is being downloaded separate to sources, we already have
the problem
this patch we are implicitly taking over the maintenance of this file
and ensuring
that its uptodate, in this given situation this seems to be best we can do=
.

>
> //Peter
>
> > License checksum changed due to dos2unix conversion.
> >
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> >  .../unicode-ucd/files/license.html            | 98 ++++++++++++++++++=
+
> >  .../unicode-ucd/unicode-ucd_12.1.0.bb         |  7 +-
> >  2 files changed, 100 insertions(+), 5 deletions(-)
> >  create mode 100644 meta-oe/recipes-support/unicode-
> > ucd/files/license.html
> >
> > diff --git a/meta-oe/recipes-support/unicode-ucd/files/license.html
> > b/meta-oe/recipes-support/unicode-ucd/files/license.html
> > new file mode 100644
> > index 000000000..a02442ad9
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/unicode-ucd/files/license.html
> > @@ -0,0 +1,98 @@
> > +<!doctype HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"><html>
> > +
> > +
> > +
> > +<head>
> > +
> > +<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf=
-8">
> > +<meta http-equiv=3D"Content-Language" content=3D"en-us">
> > +<meta name=3D"VI60_defaultClientScript" content=3D"JavaScript">
> > +<meta name=3D"GENERATOR" content=3D"Microsoft FrontPage 12.0">
> > +<meta name=3D"keywords" content=3D"Unicode Standard, copyright">
> > +<meta name=3D"ProgId" content=3D"FrontPage.Editor.Document">
> > +<title>Unicode License Agreement</title>
> > +<link rel=3D"stylesheet" type=3D"text/css"
> > +
> > +href=3D"http://www.unicode.org/webscripts/standard_styles.css">
> > +
> > +<style type=3D"text/css">
> > +pre {
> > +     FONT-FAMILY: Arial, Geneva, sans-serif;
> > +}
> > +</style>
> > +
> > +
> > +</head>
> > +
> > +
> > +<body text=3D"#330000">
> > +
> > +  <table width=3D"100%" cellpadding=3D"0" cellspacing=3D"0" border=3D=
"0">
> > +    <tr>
> > +
> > +      <!-- BEGIN CONTENTS -->
> > +
> > +      <td>
> > +
> > +
> > +<blockquote>
> > +<h2><a name=3D"License">UNICODE, INC. LICENSE AGREEMENT - DATA FILES =
AND
> > SOFTWARE</a></h2>
> > +
> > +<pre>
> > +See <a href=3D"https://www.unicode.org/copyright.html">Terms of Use</=
a>
> > for definitions of Unicode Inc.'s
> > +Data Files and Software.
> > +
> > +NOTICE TO USER: Carefully read the following legal agreement.
> > +BY DOWNLOADING, INSTALLING, COPYING OR OTHERWISE USING UNICODE INC.'S
> > +DATA FILES ("DATA FILES"), AND/OR SOFTWARE ("SOFTWARE"),
> > +YOU UNEQUIVOCALLY ACCEPT, AND AGREE TO BE BOUND BY, ALL OF THE
> > +TERMS AND CONDITIONS OF THIS AGREEMENT.
> > +IF YOU DO NOT AGREE, DO NOT DOWNLOAD, INSTALL, COPY, DISTRIBUTE OR US=
E
> > +THE DATA FILES OR SOFTWARE.
> > +
> > +COPYRIGHT AND PERMISSION NOTICE
> > +
> > +Copyright =C2=A9 1991-2019 Unicode, Inc. All rights reserved.
> > +Distributed under the Terms of Use in
> > https://www.unicode.org/copyright.html.
> > +
> > +Permission is hereby granted, free of charge, to any person obtaining
> > +a copy of the Unicode data files and any associated documentation
> > +(the "Data Files") or Unicode software and any associated documentati=
on
> > +(the "Software") to deal in the Data Files or Software
> > +without restriction, including without limitation the rights to use,
> > +copy, modify, merge, publish, distribute, and/or sell copies of
> > +the Data Files or Software, and to permit persons to whom the Data Fi=
les
> > +or Software are furnished to do so, provided that either
> > +(a) this copyright and permission notice appear with all copies
> > +of the Data Files or Software, or
> > +(b) this copyright and permission notice appear in associated
> > +Documentation.
> > +
> > +THE DATA FILES AND SOFTWARE ARE PROVIDED "AS IS", WITHOUT WARRANTY OF
> > +ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
> > +WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > +NONINFRINGEMENT OF THIRD PARTY RIGHTS.
> > +IN NO EVENT SHALL THE COPYRIGHT HOLDER OR HOLDERS INCLUDED IN THIS
> > +NOTICE BE LIABLE FOR ANY CLAIM, OR ANY SPECIAL INDIRECT OR CONSEQUENT=
IAL
> > +DAMAGES, OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
> > +DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHE=
R
> > +TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
> > +PERFORMANCE OF THE DATA FILES OR SOFTWARE.
> > +
> > +Except as contained in this notice, the name of a copyright holder
> > +shall not be used in advertising or otherwise to promote the sale,
> > +use or other dealings in these Data Files or Software without prior
> > +written authorization of the copyright holder.
> > +</pre>
> > +
> > +</blockquote>
> > +
> > +
> > +
> > +      </td>
> > +
> > +    </tr>
> > +
> > +  </table>
> > +</body>
> > +</html>
> > diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb
> > b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb
> > index 89ab565ce..b29bb784e 100644
> > --- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb
> > +++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb
> > @@ -1,18 +1,15 @@
> >  SUMMARY =3D "Unicode Character Database"
> >  HOMEPAGE =3D "https://unicode.org/ucd/"
> >  LICENSE =3D "MIT"
> > -LIC_FILES_CHKSUM =3D
> > "file://unicode.org.license.html;beginline=3D42;endline=3D85;md5=3D676=
19d0c5270
> > 6853c0256514e7fd04cd"
> > +LIC_FILES_CHKSUM =3D
> > "file://../license.html;beginline=3D42;endline=3D85;md5=3Dddcaebcc17ab=
633995f12
> > c383599f377"
> >
> >  SRC_URI =3D " \
> >
> > https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=3Ducd;subdir=
=3Ducd \
> > -
> > https://www.unicode.org/license.html;name=3Dlicense;subdir=3D${BP};dow=
nloadfi
> > lename=3Dunicode.org.license.html \
> > +    file://license.html \
> >  "
> >  SRC_URI[ucd.md5sum] =3D "430cbdac2615451571dd69a976dd08f6"
> >  SRC_URI[ucd.sha256sum] =3D
> > "25ba51a0d4c6fa41047b7a5e5733068d4a734588f055f61e85f450097834a0a6"
> >
> > -SRC_URI[license.md5sum] =3D "f03bafb623258f85ff2032c1ce567b7c"
> > -SRC_URI[license.sha256sum] =3D
> > "983225207de8a707d0903a8d70fb7a4b28c5e0f64f2366e84a6192a2d618fed4"
> > -
> >  inherit allarch
> >
> >  do_configure[noexec] =3D "1"
> > --
> > 2.17.1
>
>=20
