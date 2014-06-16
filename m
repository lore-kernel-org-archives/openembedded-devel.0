Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 09E066FD5D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 18:04:39 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1WxKDw-0001gP-Ay from Joe_MacDonald@mentor.com ;
	Wed, 18 Jun 2014 11:04:40 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 18 Jun 2014 11:04:40 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.2.247.3;
	Wed, 18 Jun 2014 11:04:29 -0700
Received: by burninator (Postfix, from userid 1000)	id ACEF8581DF0; Mon, 16
	Jun 2014 11:04:30 -0400 (EDT)
Date: Mon, 16 Jun 2014 11:04:30 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20140616150427.GA5780@mentor.com>
References: <20140616122805.79FDD50297@opal.openembedded.org>
	<20140616141945.GQ2428@jama>
MIME-Version: 1.0
In-Reply-To: <20140616141945.GQ2428@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
X-OriginalArrivalTime: 18 Jun 2014 18:04:40.0183 (UTC)
	FILETIME=[C6289870:01CF8B1F]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : tftp-hpa: inherit autotools-brokensep
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
X-List-Received-Date: Wed, 18 Jun 2014 18:04:42 -0000
X-Groupsio-MsgNum: 50398
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline

--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe-commits] Robert Yang : tftp-hpa: inherit autotools-brokensep] On 1=
4.06.16 (Mon 16:19) Martin Jansa wrote:

> On Mon, Jun 16, 2014 at 12:28:05PM +0000, git@git.openembedded.org wrote:
> > Module: meta-openembedded.git
> > Branch: master
> > Commit: 8e689bb7a154143c1bdfda5ec7a7e8c79bb1381b
> > URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcomm=
it;h=3D8e689bb7a154143c1bdfda5ec7a7e8c79bb1381b
> >=20
> > Author: Robert Yang <liezhi.yang@windriver.com>
> > Date:   Fri Jun 13 08:46:24 2014 +0800
> >=20
> > tftp-hpa: inherit autotools-brokensep
> >=20
> > It needs autotools-brokensep, otherwise do_install error:
> >=20
> > make: *** No rule to make target `install'.  Stop.
> >=20
> > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> >=20
> > ---
> >=20
> >  '                                                   | 21 +++++++++++++=
++++++++
>=20
> Joe: please remove this file ^

Well that's irritating.

Cleaned up.  Sorry about leaving garbage lying around.

-J.

>=20
> >  .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb        |  2 +-
> >  2 files changed, 22 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/' b/'
> > new file mode 100644
> > index 0000000..244cc72
> > --- /dev/null
> > +++ b/'
> > @@ -0,0 +1,21 @@
> > +radvd: inherit autotools-brokensep
> > +
> > +It needs autotools-brokensep, otherwise do_install error:
> > +
> > +install: cannot stat `radvd.conf.example': No such file or directory
> > +
> > +(LOCAL REV: NOT UPSTREAM) -- Waiting for updating upstream-master
> > +
> > +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > +
> > +# Please enter the commit message for your changes. Lines starting
> > +# with '#' will be ignored, and an empty message aborts the commit.
> > +# On branch wr-7.0-20140426
> > +# Your branch is ahead of 'origin/wr-7.0-20140426' by 10 commits.
> > +#   (use "git push" to publish your local commits)
> > +#
> > +# Changes to be committed:
> > +#   (use "git reset HEAD <file>..." to unstage)
> > +#
> > +#	modified:   recipes-daemons/radvd/radvd.inc
> > +#
> > diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b=
/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> > index 6978e06..5baa61b 100644
> > --- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> > +++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> > @@ -29,7 +29,7 @@ SRC_URI =3D "http://kernel.org/pub/software/network/t=
ftp/tftp-hpa/tftp-hpa-${PV}.t
> >  SRC_URI[md5sum] =3D "46c9bd20bbffa62f79c958c7b99aac21"
> >  SRC_URI[sha256sum] =3D "0a9f88d4c1c02687b4853b02ab5dd8779d4de4ffdb9b2e=
5c9332841304d1a269"
> > =20
> > -inherit autotools update-rc.d update-alternatives
> > +inherit autotools-brokensep update-rc.d update-alternatives
> > =20
> >  EXTRA_OECONF +=3D "--disable-option-checking"
> > =20
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>=20
--=20
-Joe MacDonald.
:wq

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJTnwd7AAoJEEn8ffcsOfaWcB4H/3SJ6UY8dAz64BkSfqeK1QCV
2xF87LpYER4dBUmD8Vxmz3jgwmNTVa5rQqCx9K7ApvBCjRHiMNQX08SnrY0GIKYC
jmSvaonNVKzbE2azBqmxkLEctSSRdANyTjl7vYJeuJBbxjrEK3ZJSW4H7GA2ghxk
0ULNgdbDYuKycneHLDKk0tgn8Ad07bDhJVaxnSzdFRER1a3FgnVkJ5Nwr05IAP3T
hazJnABoc4jsvrzA/MZ91730lDoODJ9tT6+kPrwSpbcMBvcJJuCse5WNXR/Xo446
rKPAZTdMBXpeFAXqHh9F9O0SwqtF21Z9jpMn6RmJx5gxP9/vhQZWuHGEbIsHiFs=
=m9bg
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
