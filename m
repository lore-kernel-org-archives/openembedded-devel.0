Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 611CB6B5AA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Dec 2018 21:52:39 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id e5so15667374qtr.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2018 13:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=H2kOHJPdHA5idwjgxrm2rayw+e2euur/VeqfNevE1Pw=;
	b=K1pfO1TAw2wlGcZK9TuuG9ei11D8P0Bq0Q6cLhf0B1Vw5uSR3bCJ+2lQkIQ92ugync
	lS45yk4gkC19SnPEVAUuq+D3nuypXpl2jygLbxwdaTt5aasbvX/8K7qQBp3FqqvHulWk
	WctfbCN3dR712P5gx4KUID1OLSmMu1Ux/9ZovyXaUWg3GRK+0qEsrRN96xsdAq/m5C0k
	gUXWiy0A90dNFPILkTV0hdfrYUaH1HcaQFJ0MbPfmRnpw+PSy1/8ColGXsg9Xu6itpyf
	8siKYDR9o6p0+ZFATa1slndJgDS5iYnXA0i6WV9CaGVx/2Q6bxbPw5x+s6DHA2UwuCq4
	8IaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=H2kOHJPdHA5idwjgxrm2rayw+e2euur/VeqfNevE1Pw=;
	b=T9R1y7bm946qcusdlRrUa9km5aUlZcgVIhfcfiO2esX7rsWviabSKMHuCKJm7jhAaO
	ZAwOojFXhqMeOgPEUigMmzJRtRmG3VHJ5pV52rMXeu+VhbRfZnek/nmFSrjQCaySBmJ2
	/sp1lUjFOCNk48jXqNrtkQbJE6S4Wu43NgJ1W+dVDyj1C4Ao6YzrVHp+q/E4y0iLEBq9
	+/UHyx1/STcBP+ekIYC68ENNsetWk3ukwRWW3QH1fr6VXDepBpn5kqrELna/ZcvNpYhh
	lCyTdREySo7xRY2uDUcF2aGB2/swnS7A1sw6nkV+Utxr02ssZEdW1HHfWkzv9mtpy+Qw
	Azsw==
X-Gm-Message-State: AA+aEWaucFh7Nxf54hTsRnKCP5QqrVLqPP0LceqPQ/yd1XbwUPX2xGxc
	5A02C+RSU2eArjYFGbC1J8zrXGllOndf18/5NHc=
X-Google-Smtp-Source: AFSGD/UAsEf8Ku7fy3ckpPeP/Bb8EyjuYwgRXrzIUsHYQtC5GOTWD1/YWtxmlRnSuKTKpM8oO6Vr/NgQUozxBzMazqc=
X-Received: by 2002:a0c:9950:: with SMTP id i16mr17689636qvd.50.1543873960114; 
	Mon, 03 Dec 2018 13:52:40 -0800 (PST)
MIME-Version: 1.0
References: <20181203201250.23144-1-raj.khem@gmail.com>
	<20181203201250.23144-2-raj.khem@gmail.com>
	<CALbNGRSDw8uUhu49OgeSMrqyjW+69-M888zKr55rr4mHTsjmKA@mail.gmail.com>
In-Reply-To: <CALbNGRSDw8uUhu49OgeSMrqyjW+69-M888zKr55rr4mHTsjmKA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Dec 2018 13:52:28 -0800
Message-ID: <CAMKF1sqJcyQSm3GkAhAwQ2_Tzi9w+jwxxwpq6sY+7ZJaKpU0Hw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] a2jmidid: Define own do_configure
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
X-List-Received-Date: Mon, 03 Dec 2018 21:52:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 3, 2018 at 1:27 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
>
wrote:

> On Mon, Dec 3, 2018 at 9:13 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > waf script here does not support -o switch so define own which can
> > be run in B
> >
> > Secondly, ensure to use python2
> 1. Why?
> 2. There is no python2 in sysroot Maybe it was doing it before but now
> I think it makes recipe use host's python2.


This is during build not runtime
This is to ensure build works on hosts who have switched to python 3

>
>
> Andreas
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-oe/recipes-multimedia/jack/a2jmidid_8.bb | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
> b/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
> > index 59b73f8e8b..7dcaaf6828 100644
> > --- a/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
> > +++ b/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
> > @@ -23,4 +23,9 @@ LDFLAGS_append_libc-musl =3D " -lexecinfo"
> >
> >  export LINKFLAGS=3D"${LDFLAGS}"
> >
> > +do_configure() {
> > +    sed -i 's|/usr/bin/.*python$|/usr/bin/env python2|'
> ${S}/a2j_control ${S}/waf ${S}/wscript
> > +    (cd ${B} && ${S}/waf configure --prefix=3D${prefix} ${WAF_EXTRA_CO=
NF}
> ${EXTRA_OECONF})
> > +}
> > +
> >  FILES_${PN} +=3D "${datadir}/dbus-1/services"
> > --
> > 2.19.2
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

