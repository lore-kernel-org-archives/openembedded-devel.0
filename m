Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UJ1z9-00059Q-7I
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 14:26:20 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2MD9LOJ004793
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 06:09:24 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 22 Mar 2013 06:09:21 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 5C2EA7FD0	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 09:08:38 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id A21E620007; Fri,
	22 Mar 2013 09:09:20 -0400 (EDT)
Date: Fri, 22 Mar 2013 09:09:20 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130322130920.GE5049@windriver.com>
References: <1363897098-26498-1-git-send-email-joe.macdonald@windriver.com>
	<1363897098-26498-2-git-send-email-joe.macdonald@windriver.com>
	<20130321204237.GA3219@jama>
MIME-Version: 1.0
In-Reply-To: <20130321204237.GA3219@jama>
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
X-List-Received-Date: Fri, 22 Mar 2013 13:26:21 -0000
X-Groupsio-MsgNum: 43659
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SWTRyWv/ijrBap1m"
Content-Disposition: inline

--SWTRyWv/ijrBap1m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] cyrus-sasl2: clean up rpath QA errors] O=
n 13.03.21 (Thu 21:42) Martin Jansa wrote:

> On Thu, Mar 21, 2013 at 04:18:18PM -0400, Joe MacDonald wrote:
> > Cleaning QA errors from commit 770b14191143fd89fa18daa4048af1f618debdee
> >=20
> > Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
> > ---
> >  meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.=
26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> > index 44336f0..7b3e674 100644
> > --- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> > +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> > @@ -11,7 +11,8 @@ inherit autotools pkgconfig
> >  EXTRA_OECONF +=3D "--with-dblib=3Dberkeley \
> >                   --with-bdb-libdir=3D${STAGING_LIBDIR} \
> >                   --with-bdb-incdir=3D${STAGING_INCDIR} \
> > -                 --without-pam --without-opie --without-des"
> > +                 --without-pam --without-opie --without-des \
> > +		 andrew_cv_runpath_switch=3Dnone"
>=20
> Please don't mix tabs and spaces for indentation.

Good catch, I didn't even notice that expandtab was off here.  Time to
update the vimrc.

--=20
-Joe MacDonald.
:wq

--SWTRyWv/ijrBap1m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFMWAAACgkQPN8S4W6ZZndCoACfe0yErJxTAIWHe3jrYa/xk9L+
Qk0An1c7aJwzw5p4TMyk97ZjFwQKDd0U
=m9vJ
-----END PGP SIGNATURE-----

--SWTRyWv/ijrBap1m--
