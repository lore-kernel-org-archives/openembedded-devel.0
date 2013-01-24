Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TyPBf-0005Oa-3a
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jan 2013 16:57:59 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0OFgPYu015080
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2013 07:42:25 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 24 Jan 2013 07:42:25 -0800
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id A26397FCE	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2013 10:40:30 -0500 (EST)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 2667A20B47; Thu,
	24 Jan 2013 10:42:24 -0500 (EST)
Date: Thu, 24 Jan 2013 10:42:24 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130124154223.GH3496@windriver.com>
References: <20130118171332.GA12933@windriver.com>
	<20130121195838.GA10801@windriver.com>
	<20130122151153.GA24789@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20130122151153.GA24789@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking] [PATCH] autofs: fails to compile with openldap disabled
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
X-List-Received-Date: Thu, 24 Jan 2013 15:58:01 -0000
X-Groupsio-MsgNum: 42825
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EemXnrF2ob+xzFeB"
Content-Disposition: inline

--EemXnrF2ob+xzFeB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking] [PATCH] autofs: fails to compile with openldap =
disabled] On 13.01.22 (Tue 10:11) Amy Fong wrote:

> On Mon, Jan 21, 2013 at 02:58:39PM -0500, Joe MacDonald wrote:
> Hi Joe,
>=20
> > Hey Amy,
> >=20
> > [[oe] [meta-networking] [PATCH] autofs: fails to compile with openldap =
disabled] On 13.01.18 (Fri 12:13) Amy Fong wrote:
> >=20
> > > commit 09947d772a36e4d2c2dc48356281bd3ce0a04b0c
> > > Author: Amy Fong <amy.fong@windriver.com>
> > > Date:   Fri Jan 18 11:10:35 2013 -0500
> > >=20
> > >     autofs: fails to compile with openldap disabled
> > >    =20
> > >     As of 5.0.6, it appears that changes were introduced so that
> > >     if you compile with openldap disabled and openldap headers are not
> > >     available, then autofs fails to build.
> > >    =20
> > >     Since autofs no longer depends on openldap, remove the dependency
> > >    =20
> > >     Signed-off-by: Amy Fong <amy.fong@windriver.com>
> > >=20
> > > diff --git a/recipes-daemons/autofs/autofs-5.0.7/fix_disable_ldap.pat=
ch b/recipes-daemons/autofs/autofs-5.0.7/fix_disable_ldap.patch
> > > new file mode 100644
> > > index 0000000..b62f955
> > > --- /dev/null
> > > +++ b/recipes-daemons/autofs/autofs-5.0.7/fix_disable_ldap.patch
> > > @@ -0,0 +1,40 @@
> > > +autofs: fails to compile with openldap disabled
> > > +
> > > +As of 5.0.6, it appears that changes were introduced so that=20
> > > +if you compile with openldap disabled and openldap headers are not
> > > +available, then autofs fails to build.
> > > +
> > > +Signed-off-by: Amy Fong <amy.fong@windriver.com>
> >=20
> > Did you say you'd already sent this upstream?  I can put in an
> > upstream-status myself, but I'm not sure what it is right now.  :-)
> >=20
> > Alternatively, a new version with the upstream-status is good too.
> >=20
> > -J.
>=20
> Nope, it wasn't sent upstream. I'd say that the upstream-status should be=
 pending. :)

Okay, merged.  Can you ensure it gets sent up-stream since you authored
it?

Thanks Amy.

--=20
-Joe MacDonald.
:wq

--EemXnrF2ob+xzFeB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlEBVl8ACgkQPN8S4W6ZZncPTACfZYdXNdvh7c8ztWuzljxDTRky
raUAn0vHv8p8RQuYABuDWlOy0iw18f5V
=zDx1
-----END PGP SIGNATURE-----

--EemXnrF2ob+xzFeB--
