Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UanLu-0001XS-Ub
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 May 2013 15:27:17 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4AD98iG020002
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2013 06:09:08 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 10 May 2013 06:09:08 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 9A3887FCE	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2013 09:09:00 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 587C7410E6; Fri,
	10 May 2013 09:09:07 -0400 (EDT)
Date: Fri, 10 May 2013 09:09:07 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130510130906.GK4840@windriver.com>
References: <1368129805-5889-1-git-send-email-mark.hatle@windriver.com>
	<20130509201735.GG3188@jama> <518C0ED2.5060007@windriver.com>
MIME-Version: 1.0
In-Reply-To: <518C0ED2.5060007@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/3] macchanger: Fix SRC_URI for multilibs
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
X-List-Received-Date: Fri, 10 May 2013 13:27:22 -0000
X-Groupsio-MsgNum: 44656
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8kI7hWEHMS8Z+7/0"
Content-Disposition: inline

--8kI7hWEHMS8Z+7/0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [PATCH 1/3] macchanger: Fix SRC_URI for multilibs] On 13.05.09 (T=
hu 16:02) Mark Hatle wrote:

> On 5/9/13 3:17 PM, Martin Jansa wrote:
> >For which layer is this? no tag in Subject and path to recipe doesn't ev=
en start
> >with meta-networking
> >
> >./meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
>=20
> all three patches, meta-openembedded/meta-networking

That's what I thought.  These patches apply to my meta-networking
subtree over at github.  It's easy enough for me to apply to them to
meta-openembedded/meta-networking, then propagate them back out to the
subtree.

For anyone who cares, my meta-networking github project is completely
read-only, I never commit anything there anymore, it is a reference of
meta-networking "standalone" but changes only ever appear there by
passing through meta-openembedded's meta-networking layer.

I'll merge your changes in the next little bit, Mark.  Thanks.  I don't
have an answer for you (yet) on the rp-pppoe thing, but with a bit of
luck I'll get time this morning to have a look-see.

-J.

>=20
> --Mark
>=20
> >On Thu, May 09, 2013 at 03:03:23PM -0500, Mark Hatle wrote:
> >>Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >>---
> >>  recipes-support/macchanger/macchanger_1.5.0.bb | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>diff --git a/recipes-support/macchanger/macchanger_1.5.0.bb b/recipes-s=
upport/macchanger/macchanger_1.5.0.bb
> >>index ff30558..2ecfab2 100644
> >>--- a/recipes-support/macchanger/macchanger_1.5.0.bb
> >>+++ b/recipes-support/macchanger/macchanger_1.5.0.bb
> >>@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9b=
a36caa9b7df079bae19f"
> >>
> >>  PR =3D "r0"
> >>
> >>-SRC_URI  =3D "${GNU_MIRROR}/macchanger/${PN}-${PV}.tar.gz"
> >>+SRC_URI  =3D "${GNU_MIRROR}/macchanger/${BPN}-${PV}.tar.gz"
> >>
> >>  SRC_URI[md5sum] =3D "79b7cdaeca3d8ebafa764c4b0dd03ab7"
> >>  SRC_URI[sha256sum] =3D "d44bfa27cb29c5a718627cb3ef3aa42eb5130426545eb=
2031120826cd73fa8fe"
> >>--
> >>1.8.3.rc1.25.g423ecb0
> >>
> >>
> >>_______________________________________________
> >>Openembedded-devel mailing list
> >>Openembedded-devel@lists.openembedded.org
> >>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> >
> >
> >_______________________________________________
> >Openembedded-devel mailing list
> >Openembedded-devel@lists.openembedded.org
> >http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
-Joe MacDonald.
:wq

--8kI7hWEHMS8Z+7/0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlGM8XIACgkQPN8S4W6ZZneOwgCeL45BiJLXaZ0IC7HAyM22YYRu
WGkAnR1JyUsiKslkP8cl+p412Wa//O22
=PNa/
-----END PGP SIGNATURE-----

--8kI7hWEHMS8Z+7/0--
