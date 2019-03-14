Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 22FEF6D3A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Mar 2019 14:24:06 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id s1so6227460qte.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Mar 2019 07:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=oCmiF8/uu33iR0D6Q3aZEhoCHX8fMovT+HrBig9YCWI=;
	b=W2/4Wd1y9vsl03swiNTTL8NTts3qfL+gtBxC268ErnhD0wTY8ErdOv7iFxYa9oJZJ2
	8kEWHcdfTlx3z0jhxfB/niNf1VPxpPp6PSCBsa+NI9SRX3ErPq0BZ86fEEN9IySv/jGz
	0AZGtt6gJjDFJTnFqsHDE7sVdswtQ6MdsbVP07/nUwX2X9gNOwtSyExybYQw5U05drsO
	6zHWoPemXj7LV0bvHUBKRVT9mtFpg+YQ9ygGSuT3okJUb6/6n5p7EY49XGljTiyzQqFF
	Cz/5G4jZSzS4CSQ9qYLNA6bsVjnJ00B+6OO3e9Z6bIvSKYO1IYXbvlz6cKzTfr2buuDL
	7xhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=oCmiF8/uu33iR0D6Q3aZEhoCHX8fMovT+HrBig9YCWI=;
	b=kVuD3B2gr31a82KGnnXMVAL3RbttMFWNf/Mhjm5rxrmLSak38nOxo6bBDROE31NLaG
	GwJppB+IKme6NUHHTPR5yKPFxAoZq9wvZctivYRBzL2yA+/xG1ailodcFyWplQgZTfxC
	mofo/9Q5jHntlJ67LME9LJG6zbD8x4Wb8esVmLrslXP9wngPr9PHaNQ9gDiC4knviyNi
	BzZS51EK1Cyq8ukGLpyD+FnyujdDM1MhTHRS5DOdj+6dpBmNBQJwZATV8et6TB1jxeDd
	mHZYrrnR8pBirhqhytYSDGIoHBFOwemjNQNkj0M0r9d2O86UTc4QR/hihqor72JtfpzC
	FOog==
X-Gm-Message-State: APjAAAWZPmc0J4jlP1JIe2rUEIhdMXVsAlk1bIT9ZlcFxDZO/FX6RMlU
	LymvMbWRxV0kasE7GZvlNc/qTNM1mXcOvQO3/4oQhF7m
X-Google-Smtp-Source: APXvYqzmlCFy8C3WTJaGfJ3yQgYWKnBzq7eokxIvyuSOqJTSb97LeAhVafb97EywiU8L/7UHDoop4vdAxl/2VC3/5lo=
X-Received: by 2002:a0c:f604:: with SMTP id r4mr6067694qvm.55.1552573446872;
	Thu, 14 Mar 2019 07:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <1552335085-13742-1-git-send-email-bassem.boubaker@actia.fr>
	<20190311202038.GB15019@bboubake>
In-Reply-To: <20190311202038.GB15019@bboubake>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Mar 2019 07:23:40 -0700
Message-ID: <CAMKF1soLu4w=V1N4q_VFiU3oywZGGz=FWWWao31g7_hHaW87Nw@mail.gmail.com>
To: BOUBAKER Bassem <bassem.boubaker@actia.fr>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] cpulimit: introduce support for this package
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
X-List-Received-Date: Thu, 14 Mar 2019 14:24:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

musl build fails.
https://errors.yoctoproject.org/Errors/Details/232895/

On Mon, Mar 11, 2019 at 10:30 PM BOUBAKER Bassem via
Openembedded-devel <openembedded-devel@lists.openembedded.org> wrote:
>
> On Monday 11 Mar 2019 =C3=A0 21:11:36 (+0100), BOUBAKER Bassem wrote:
> > * Now, cpulimit recipe is put under recipes-support. Binary will be ins=
talled by the recipe under /usr/sbin
> >
> >          # cpulimit -h
> >          Usage: cpulimit [OPTIONS...] TARGET
> >                  OPTIONS
> >                  -l, --limit=3DN          percentage of cpu allowed fro=
m 0 to 100 (required)
> >                  -v, --verbose          show control statistics
> >                  -z, --lazy             exit if there is no target proc=
ess, or if it dies
> >                  -i, --include-children limit also the children process=
es
> >                  -h, --help             display this help and exit
> >                  TARGET must be exactly one of these:
> >                  -p, --pid=3DN            pid of the process (implies -=
z)
> >                  -e, --exe=3DFILE         name of the executable progra=
m file or path name
> >                  COMMAND [ARGS]         run this command and limit it (=
implies -z)
> >
> >                  Report bugs to <marlonx80@hotmail.com>.
> >
> > Signed-off-by: Bassem Boubaker <bassem.boubaker@actia.fr>
> > ---
> >  meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb | 19 ++++++++++++++++=
+++
> >  1 file changed, 19 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
> >
> > diff --git a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb b/meta-oe=
/recipes-support/cpulimit/cpulimit_0.2.bb
> > new file mode 100644
> > index 0000000..8eaa928
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
> > @@ -0,0 +1,19 @@
> > +SUMMARY =3D "cpulimit is a tool which limits the CPU usage of a proces=
s"
> > +HOMEPAGE =3D "http://cpulimit.sourceforge.net"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86c1c0d961a437e529db93aa3bb=
32dc4"
> > +SRCREV ?=3D "f4d2682804931e7aea02a869137344bb5452a3cd"
> > +
> > +SRC_URI =3D "git://git@github.com/opsengine/cpulimit.git;protocol=3Dht=
tps"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +do_compile() {
> > +    oe_runmake all
> > +}
> > +do_install() {
> > +    install -d ${D}${sbindir}
> > +    install -m 0755 ${B}/src/${PN} ${D}${sbindir}/
> > +}
> > +
> > +CFLAGS +=3D "${LDFLAGS}"
>
> oooups didn't see it. will be fixed
> > \ No newline at end of file
>
> > --
> > 2.7.4
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

