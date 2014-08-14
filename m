Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 09E0B65DB3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 08:37:34 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id c11so711082lbj.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 01:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=67mupqLPfnBQ515e8lAEOCijDNnn7F/Yn3JQLM38ka8=;
	b=eOmOgvawnVJe+dasRJ1dQsphN2nB4I/BGHOOpelxBIe5RR18R7G748TyAH4mfHa36M
	AuBfUIlbSqmbWRRQgwjy+Y0Gim041llgGspoFagoWVjPrdfErnlcIHusJBgEL138eJub
	SRTmY4WhjUMgX5L/ovKeohO41U3NOKQx8htP3g3iXwEPVgJvKX0qpK9VRNcXe5CKszcu
	smpu+D3KB0ZGwAA9zbjUUaXAXGGt6ZydL4/IaXfv/QTyocqOuohoU6hfgoufg43yRICj
	QcOGUPRBgOVb3svZvNkMmVgTD64GM68kPdXVu+6teqsAOLPCnCnWxhoLd+cRDYw64KmK
	TfiQ==
X-Received: by 10.112.24.167 with SMTP id v7mr3136018lbf.19.1408005453303;
	Thu, 14 Aug 2014 01:37:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ue8sm2713180lac.31.2014.08.14.01.37.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 01:37:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 14 Aug 2014 10:38:09 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140814083809.GD14848@jama>
References: <1408002596-9778-1-git-send-email-kai.kang@windriver.com>
	<53EC6CFA.9050406@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53EC6CFA.9050406@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-perl][PATCH 1/6] libdigest-sha1-perl: add recipe
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
X-List-Received-Date: Thu, 14 Aug 2014 08:37:35 -0000
X-Groupsio-MsgNum: 51674
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8LgeaVcdIYfsb9sy"
Content-Disposition: inline

--8LgeaVcdIYfsb9sy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2014 at 04:02:02PM +0800, Kang Kai wrote:
> This series of commits is for layer *meta-perl*, and I add it in cover=20
> letter created by 'git send-email --compose', but it seems doesn't work.

Please update indentation in them, you're using mix of tabs and spaces
-> use 4 spaces everywhere.

> On 2014=E5=B9=B408=E6=9C=8814=E6=97=A5 15:49, Kai Kang wrote:
>=20
>=20
> > Add recipe for libdigest-sha1-perl and enable create -ptest sub-package.
> >
> > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > ---
> >   meta-perl/recipes-perl/libdigest/files/run-ptest   | 16 ++++++++++++++
> >   .../libdigest/libdigest-sha1-perl_2.13.bb          | 25 +++++++++++++=
+++++++++
> >   2 files changed, 41 insertions(+)
> >   create mode 100644 meta-perl/recipes-perl/libdigest/files/run-ptest
> >   create mode 100644 meta-perl/recipes-perl/libdigest/libdigest-sha1-pe=
rl_2.13.bb
> >
> > diff --git a/meta-perl/recipes-perl/libdigest/files/run-ptest b/meta-pe=
rl/recipes-perl/libdigest/files/run-ptest
> > new file mode 100644
> > index 0000000..1c008b5
> > --- /dev/null
> > +++ b/meta-perl/recipes-perl/libdigest/files/run-ptest
> > @@ -0,0 +1,16 @@
> > +#!/bin/sh
> > +
> > +for case in `find t -type f -name '*.t'`; do
> > +	perl $case >$case.output 2>&1
> > +	ret=3D$?
> > +	cat $case.output
> > +	if [ $ret -ne 0 ]; then
> > +		echo "FAIL: ${case%.t}"
> > +	elif grep -i 'SKIP' $case.output; then
> > +		echo "SKIP: ${case%.t}"
> > +	else
> > +		echo "PASS: ${case%.t}"
> > +	fi
> > +
> > +	rm -f $case.output
> > +done
> > diff --git a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.=
bb b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
> > new file mode 100644
> > index 0000000..42d5875
> > --- /dev/null
> > +++ b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
> > @@ -0,0 +1,25 @@
> > +SUMMARY =3D "Perl interface to the SHA-1 algorithm "
> > +DESCRIPTION =3D "Digest::SHA1 - Perl interface to the SHA-1 algorithm"
> > +HOMEPAGE =3D "http://search.cpan.org/~gaas/Digest-SHA1-2.13/"
> > +SECTION =3D "libs"
> > +
> > +LICENSE =3D "Artistic-1.0|GPLv1+"
> > +LIC_FILES_CHKSUM =3D "file://README;beginline=3D10;endline=3D14;md5=3D=
ff5867ebb4bc1103a7a416aef2fce00a"
> > +
> > +SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-S=
HA1-${PV}.tar.gz \
> > +           file://run-ptest \
> > +          "
> > +SRC_URI[md5sum] =3D "bd22388f268434f2b24f64e28bf1aa35"
> > +SRC_URI[sha256sum] =3D "68c1dac2187421f0eb7abf71452a06f190181b8fc4b28e=
dedf5b90296fb943cc"
> > +
> > +S =3D "${WORKDIR}/Digest-SHA1-${PV}"
> > +
> > +inherit cpan ptest
> > +
> > +do_install_ptest () {
> > +       cp -r ${B}/t ${D}${PTEST_PATH}
> > +}
> > +
> > +BBCLASSEXTEND=3D"native"
> > +
> > +FILES_${PN}-dbg =3D+ "${libdir}/perl/vendor_perl/*/auto/Digest/SHA1/.d=
ebug/"
>=20
>=20
> --=20
> Regards,
> Neil | Kai Kang
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8LgeaVcdIYfsb9sy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPsdXEACgkQN1Ujt2V2gBxjowCfbzgyYW4a91gnVB9DmmvdD/B7
waQAn1svVcDNpyELQUlBtSlGqH+FOwWr
=eUeG
-----END PGP SIGNATURE-----

--8LgeaVcdIYfsb9sy--
