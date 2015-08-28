Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1480060043
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 08:03:20 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so12838173wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 01:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oUvwyYSU1V+wK3eqW6TC4tP1bGxJBTzt4f8arPE+nrQ=;
	b=AiCuaBIXRUunMDTMpIlE+t4Ka11RrIwqvlIT7iSE8wUykd2Ez6eBg94G+ipRvXqi2s
	DFTEn+xjA07O3Mm+7/kM3sOCVVd5LwDBMBO/gFkiDshAyzQOS2T8H1TFQEcsnuYZ2zY1
	kNy5ymO4wf4dTcVqQpVXa9BT8+byMs+jFMFZtZgouz1Q50kVyAeLImCmqfyHnk3L8FyK
	UHiDZZi5jlQAFDi1/n3SwdeVhO4tPnUOm171JKxAakYzrfVmriQ696VH/ryczDy8kRpA
	7vYrcpOKl7CjHDywMd0dFJ5WkWIMVyjkB3zSd/Lef1Y429gXapmcersSTt2B3/BviU/2
	esqQ==
X-Received: by 10.194.113.101 with SMTP id ix5mr10283891wjb.66.1440749000154; 
	Fri, 28 Aug 2015 01:03:20 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id r6sm2522179wiy.13.2015.08.28.01.03.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Aug 2015 01:03:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 28 Aug 2015 10:03:40 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150828080340.GB11673@jama>
References: <1440712214-30967-1-git-send-email-soren.brinkmann@xilinx.com>
	<CAMKF1spGXzAVzKMfc=nvV8ARV6tndHY15g7rj=-HR2z3SMUtNg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spGXzAVzKMfc=nvV8ARV6tndHY15g7rj=-HR2z3SMUtNg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2] Add analyze-suspend
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Aug 2015 08:03:21 -0000
X-Groupsio-MsgNum: 57105
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Content-Disposition: inline

--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2015 at 08:44:05PM -0700, Khem Raj wrote:
> On Thu, Aug 27, 2015 at 2:50 PM, Soren Brinkmann
> <soren.brinkmann@xilinx.com> wrote:
> > Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> > ---
> > v2:
> >  - replace 'boot'->'suspend' in commit message
> >  - document kernel dependencies in recipe
> >  - pin git commit
> > ---
> >  .../analyze-suspend/analyze-suspend_git.bb         | 28 ++++++++++++++=
++++++++
> >  1 file changed, 28 insertions(+)
> >  create mode 100644 meta-oe/recipes-benchmark/analyze-suspend/analyze-s=
uspend_git.bb
> >
> > diff --git a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_=
git.bb b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
> > new file mode 100644
> > index 000000000000..6932e9fadfc4
> > --- /dev/null
> > +++ b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
> > @@ -0,0 +1,28 @@
> > +SUMMARY =3D "Analyze Suspend"
>=20
> If you add  DESCRIPTION with more details it could help folks trying to u=
se this
>=20
> and please define PV =3D "3.2+gitr${SRCPV}"
>=20
> > +HOMEPAGE =3D "https://01.org/suspendresume"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c=
4ca7e"
> > +
> > +# Apart from the listed RDEPENDS, analyze-suspend depends on some feat=
ures
> > +# provided by the kernel. These options are:
> > +#   - CONFIG_PM_DEBUG=3Dy
> > +#   - CONFIG_PM_SLEEP_DEBUG=3Dy
> > +#   - CONFIG_FTRACE=3Dy
> > +#   - CONFIG_FUNCTION_TRACER=3Dy
> > +#   - CONFIG_FUNCTION_GRAPH_TRACER=3Dy
> > +
> > +RDEPENDS_${PN} +=3D "python-core python-datetime python-stringold"
> > +
> > +SRCREV =3D "bce3cbec43bc2ce7a8c79b210314dd9d9ac1010b"
> > +SRC_URI =3D "git://github.com/01org/suspendresume.git;protocol=3Dhttps"
> > +S =3D "${WORKDIR}/git"
> > +
> > +do_install() {
> > +       install -d -m 0755 ${D}${bindir}
> > +       install -m 0755 analyze_suspend.py ${D}${bindir}
>=20
> both these could be squashed into
>=20
> install -Dm 0755 analyze_suspend.py ${D}${bindir}/analyze_suspend.py
>=20
> > +
> > +       install -d -m 0755 ${D}${docdir}/analyze-suspend
> > +       install -m 0755 README ${D}${docdir}/analyze-suspend
>=20
> same as above

and README file shouldn't be executable, use 0644

>=20
> > +}
> > +
> > +BBCLASSEXTEND =3D "native"
> > --
> > 2.5.0.3.g52d66ab
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXgFdsACgkQN1Ujt2V2gBxpYACfYCdv0P0W5uUF8FJcDFF8q45G
9GMAnRwdqqUHMB4w68kYkLrTKYK6b2FG
=Xaml
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--
