Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1D1A67470D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 14:46:20 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id b134-v6so5794787vke.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 07:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ZUa4Y7Y1PQa0dMktBgiMw0NKt1IEk3YWOoAxyssyBeE=;
	b=hEI07cYncaU68RLsIuAzvYyM9BL/PhoQprPBd1KB75+C+bCnD3Fuxsrux0gH8pbI+F
	ebSS65EPp1GkUYLbBYu+W0W8j07+1q7Gxa2RRVVlRYKlwBcHWLdXqqWuNVgLmWk6bLPE
	YMY4JPQWJhhi93eAquwQxaSS3EYHTaSlW0xvzuJKaaDa3ReTA5Zu/MHe7kpckX3CK+5e
	xSlU51Kb5CJlIiymbv/wRXXF6mkAMucDac8nw0vrtPoM+lVEUiRbSzuwPFU+mSPS440m
	LVxL8S19HUKdWa74KJom9ZIf3w7a1VS3pX2WB5O0pwTvzWJgJ9Ii0la4b/Jutxgb2rDv
	GQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ZUa4Y7Y1PQa0dMktBgiMw0NKt1IEk3YWOoAxyssyBeE=;
	b=fkktG394EXoem/ZyM8kTtTmV5iF5nQ5vVozEKttM71hRAlYjbS/4b8D862hshi0IvA
	oo/wFM/C3lj3bWJkahykGNAh884cM3U9G3jj5NfD5ctzAxw+Y6hXZuuxpTlT+Zi82QWp
	ZAv0GNgtc960IoI6DKFZpUzIam2sZRLSjvru4EgDOolHzrWRJ2UgQYCuCjHPGWWnWe/l
	MPB7cKVFhis5t0c+rOQ/LzA5ZdibdE4v5MZfAIob2cIXhJHao2Hyr/YGzFsiMFuf+VOj
	JJQN39YbPukN1A7Uor4Da8YR74cW6wroZO5EbGTXcpt45flQaYIi2OBb7AdabLt85Rnz
	C+Mw==
X-Gm-Message-State: APt69E15m+Du0BHNexqGnqmmNgdUKLYnHk5EANv7aCmDKDpH8FQAkBYT
	8XQXlOHORd+C00Xbc7KssuHkq/iYzZkx25zgt3A=
X-Google-Smtp-Source: ADUXVKIe1RkzJRzAicS4blZ0CP1elQ9tKpH98vxytqSw7m3hJ90UoKprodd4dl3wzFup+BiBhvG16pUKgnUFdn2WGz8=
X-Received: by 2002:a1f:2c0d:: with SMTP id
	s13-v6mr1120610vks.106.1529073981703; 
	Fri, 15 Jun 2018 07:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <20180615033106.32342-1-raj.khem@gmail.com>
	<eca7f575-7302-8921-ac68-87a5bd21e232@gmail.com>
In-Reply-To: <eca7f575-7302-8921-ac68-87a5bd21e232@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Jun 2018 07:45:54 -0700
Message-ID: <CAMKF1sozZjaAnXB=cmAnd-eB8E8BeAzMS__nG-TNv28-hOKDew@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH V2 1/2] htpdate: Add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jun 2018 14:46:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 15, 2018 at 6:59 AM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 06/14/2018 08:31 PM, Khem Raj wrote:
> > Fix build with musl
>
> what version of musl?
>

Dont get your question why musl version is impaortant but it is
against the version
that is currently in OE-Core 1.1.19+

> - armin
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  ...ent-variables-assignments-to-be-weak.patch | 31 ++++++++++++++
> >  ...01-Replace-ntp_adjtime-with-adjtimex.patch | 40 +++++++++++++++++++
> >  .../recipes-support/htpdate/htpdate_1.2.0.bb  | 39 ++++++++++++++++++
> >  3 files changed, 110 insertions(+)
> >  create mode 100644 meta-networking/recipes-support/htpdate/htpdate/000=
1-Make-environment-variables-assignments-to-be-weak.patch
> >  create mode 100644 meta-networking/recipes-support/htpdate/htpdate/000=
1-Replace-ntp_adjtime-with-adjtimex.patch
> >  create mode 100644 meta-networking/recipes-support/htpdate/htpdate_1.2=
.0.bb
> >
> > diff --git a/meta-networking/recipes-support/htpdate/htpdate/0001-Make-=
environment-variables-assignments-to-be-weak.patch b/meta-networking/recipe=
s-support/htpdate/htpdate/0001-Make-environment-variables-assignments-to-be=
-weak.patch
> > new file mode 100644
> > index 0000000000..0ee44c1621
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/htpdate/htpdate/0001-Make-environ=
ment-variables-assignments-to-be-weak.patch
> > @@ -0,0 +1,31 @@
> > +From 04603f52d793f964653e6a985944400fe4fa87ee Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Wed, 13 Jun 2018 17:50:20 -0700
> > +Subject: [PATCH] Make environment variables assignments to be weak
> > +
> > +So that OE can override them for cross builds
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + Makefile | 6 +++---
> > + 1 file changed, 3 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index 1c80c09..884126c 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -2,11 +2,11 @@ prefix =3D $(DESTDIR)/usr
> > + bindir =3D ${prefix}/bin
> > + mandir =3D ${prefix}/share/man
> > +
> > +-CC =3D gcc
> > ++CC ?=3D gcc
> > + CFLAGS +=3D -Wall -std=3Dc99 -pedantic -O2
> > +
> > +-INSTALL =3D /usr/bin/install -c
> > +-STRIP =3D /usr/bin/strip -s
> > ++INSTALL ?=3D /usr/bin/install -c
> > ++STRIP ?=3D /usr/bin/strip -s
> > +
> > + all: htpdate
> > +
> > diff --git a/meta-networking/recipes-support/htpdate/htpdate/0001-Repla=
ce-ntp_adjtime-with-adjtimex.patch b/meta-networking/recipes-support/htpdat=
e/htpdate/0001-Replace-ntp_adjtime-with-adjtimex.patch
> > new file mode 100644
> > index 0000000000..cca8c6c364
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/htpdate/htpdate/0001-Replace-ntp_=
adjtime-with-adjtimex.patch
> > @@ -0,0 +1,40 @@
> > +From 75646a2d2df14fdbc4a01e222a779afac94861d1 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Thu, 14 Jun 2018 20:11:08 -0700
> > +Subject: [PATCH] Replace ntp_adjtime with adjtimex.
> > +
> > +ntp_adjtime in glibc is an alias to adjtimex and
> > +musl does not provide ntp_adjtime at all
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > +Upstream-Status: Pending
> > +
> > + htpdate.c | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/htpdate.c b/htpdate.c
> > +index 4171efe..ff0bf8d 100644
> > +--- a/htpdate.c
> > ++++ b/htpdate.c
> > +@@ -391,7 +391,7 @@ static int htpdate_adjtimex( double drift ) {
> > +
> > +     /* Read current kernel frequency */
> > +     tmx.modes =3D 0;
> > +-    ntp_adjtime(&tmx);
> > ++    adjtimex(&tmx);
> > +
> > +     /* Calculate new frequency */
> > +     freq =3D (long)(65536e6 * drift);
> > +@@ -406,7 +406,7 @@ static int htpdate_adjtimex( double drift ) {
> > +
> > +     /* Become root */
> > +     swuid(0);
> > +-    return( ntp_adjtime(&tmx) );
> > ++    return( adjtimex(&tmx) );
> > +
> > + }
> > +
> > +--
> > +2.17.1
> > +
> > diff --git a/meta-networking/recipes-support/htpdate/htpdate_1.2.0.bb b=
/meta-networking/recipes-support/htpdate/htpdate_1.2.0.bb
> > new file mode 100644
> > index 0000000000..eb6787846b
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/htpdate/htpdate_1.2.0.bb
> > @@ -0,0 +1,39 @@
> > +# Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
> > +# Released under the MIT license (see COPYING.MIT for the terms)
> > +
> > +SUMMARY =3D "HTTP based time synchronization tool"
> > +
> > +DESCRIPTION =3D "The  HTTP Time Protocol (HTP) is used to synchronize =
a computer's time with\
> > + web servers as reference time source. This program can be used instea=
d\
> > + ntpdate or similar, in networks that has a firewall blocking the NTP =
port.\
> > + Htpdate will synchronize the computer time to Greenwich Mean Time (GM=
T),\
> > + using the timestamps from HTTP headers found in web servers response =
(the\
> > + HEAD method will be used to get the information).\
> > + Htpdate works through proxy servers. Accuracy of htpdate will be usua=
lly\
> > + within 0.5 seconds (better with multiple servers).\
> > +"
> > +
> > +HOMEPAGE =3D "http://www.vervest.org/htp/"
> > +
> > +LICENSE =3D "GPL-2.0+"
> > +LIC_FILES_CHKSUM =3D "file://htpdate.c;beginline=3D26;endline=3D30;md5=
=3Dd7018a4d2c5a6eab392709a05e5e168a"
> > +
> > +SRC_URI =3D "http://www.vervest.org/htp/archive/c/htpdate-${PV}.tar.xz=
 \
> > +           file://0001-Make-environment-variables-assignments-to-be-we=
ak.patch \
> > +           file://0001-Replace-ntp_adjtime-with-adjtimex.patch \
> > +           "
> > +SRC_URI[md5sum] =3D "9d5ca69be06edf5d535b52b5f790da4e"
> > +SRC_URI[sha256sum] =3D "22b2cf3ec45b0eedecddd3ad2a3d754ac57942ae7dcbac=
410d254935f0bdbc03"
> > +
> > +do_configure () {
> > +     :
> > +}
> > +
> > +do_compile () {
> > +     oe_runmake
> > +}
> > +
> > +do_install () {
> > +     oe_runmake install 'INSTALL=3Dinstall' 'STRIP=3Decho' 'DESTDIR=3D=
${D}'
> > +}
> > +
>

