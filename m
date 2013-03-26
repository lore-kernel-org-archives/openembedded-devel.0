Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UKaFM-000683-6Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Mar 2013 21:13:29 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2QJuQcp020471
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Mar 2013 12:56:27 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 26 Mar 2013 12:56:26 -0700
Received: from skynet (unknown [172.25.44.2])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 8CDB67FD0	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 26 Mar 2013 15:55:38 -0400 (EDT)
Received: by skynet (Postfix, from userid 1000)	id 13D2F600A71; Tue, 26 Mar
	2013 15:56:24 -0400 (EDT)
Date: Tue, 26 Mar 2013 15:56:24 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130326195624.GB3692@windriver.com>
References: <1363897098-26498-1-git-send-email-joe.macdonald@windriver.com>
	<1363897098-26498-2-git-send-email-joe.macdonald@windriver.com>
	<20130321204237.GA3219@jama> <20130322130920.GE5049@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20130322130920.GE5049@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] cyrus-sasl2: clean up rpath QA errors
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 20:13:31 -0000
X-Groupsio-MsgNum: 43744
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XF85m9dhOBO43t/C"
Content-Disposition: inline

--XF85m9dhOBO43t/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] cyrus-sasl2: clean up rpath QA errors] O=
n 13.03.22 (Fri 09:09) Joe MacDonald wrote:

> [Re: [oe] [meta-networking][PATCH] cyrus-sasl2: clean up rpath QA errors]=
 On 13.03.21 (Thu 21:42) Martin Jansa wrote:
>=20
> > On Thu, Mar 21, 2013 at 04:18:18PM -0400, Joe MacDonald wrote:
> > > Cleaning QA errors from commit 770b14191143fd89fa18daa4048af1f618debd=
ee
> > >=20
> > > Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
> > > ---
> > >  meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb | 3 =
++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.=
1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> > > index 44336f0..7b3e674 100644
> > > --- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> > > +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> > > @@ -11,7 +11,8 @@ inherit autotools pkgconfig
> > >  EXTRA_OECONF +=3D "--with-dblib=3Dberkeley \
> > >                   --with-bdb-libdir=3D${STAGING_LIBDIR} \
> > >                   --with-bdb-incdir=3D${STAGING_INCDIR} \
> > > -                 --without-pam --without-opie --without-des"
> > > +                 --without-pam --without-opie --without-des \
> > > +		 andrew_cv_runpath_switch=3Dnone"
> >=20
> > Please don't mix tabs and spaces for indentation.
>=20
> Good catch, I didn't even notice that expandtab was off here.  Time to
> update the vimrc.

Merged with this fix.

--=20
-Joe MacDonald.
:wq

--XF85m9dhOBO43t/C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlFR/WgACgkQPN8S4W6ZZnc0AACeM734SOUI6rEueb7Rgk1xpUoh
PYkAniEv92YXKdbWe9hYQye7xN/fPb1I
=7hrg
-----END PGP SIGNATURE-----

--XF85m9dhOBO43t/C--
