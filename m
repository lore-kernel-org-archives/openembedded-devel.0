Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UHc63-000856-78
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Mar 2013 16:35:42 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2IFIjDB003890
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Mar 2013 08:18:45 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 18 Mar 2013 08:18:45 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id BF0937FE2;
	Mon, 18 Mar 2013 11:18:06 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 788CD224FF; Mon,
	18 Mar 2013 11:18:44 -0400 (EDT)
Date: Mon, 18 Mar 2013 11:18:44 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130318151844.GA9185@windriver.com>
References: <1362994719-12276-1-git-send-email-wenzong.fan@windriver.com>
	<1599644.gZKTPRS2fY@helios>
MIME-Version: 1.0
In-Reply-To: <1599644.gZKTPRS2fY@helios>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: wfan@windriver.com
Subject: Re: [PATCH] meta-networking: Add LAYERVERSION and LAYERDEPENDS
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
X-List-Received-Date: Mon, 18 Mar 2013 15:35:44 -0000
X-Groupsio-MsgNum: 43580
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline

--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Getting caught up ...

[Re: [oe] [PATCH] meta-networking: Add LAYERVERSION and LAYERDEPENDS] On 13=
=2E03.11 (Mon 15:38) Paul Eggleton wrote:

> On Monday 11 March 2013 17:38:39 wenzong.fan@windriver.com wrote:
> > From: Wenzong Fan <wenzong.fan@windriver.com>
> >=20
> > Add LAYERVERSION and LAYERDEPENDS to layer.conf
> >=20
> > Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> > ---
> >  meta-networking/conf/layer.conf |    5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/meta-networking/conf/layer.conf
> > b/meta-networking/conf/layer.conf index 1ea2bc2..f75080a 100644
> > --- a/meta-networking/conf/layer.conf
> > +++ b/meta-networking/conf/layer.conf
> > @@ -9,3 +9,8 @@ BBFILE_COLLECTIONS +=3D "networking"
> >  BBFILE_PATTERN_networking :=3D "^${LAYERDIR}/"
> >  BBFILE_PRIORITY_networking =3D "5"
> >=20
> > +# This should only be incremented on significant changes that will
> > +# cause compatibility issues with other layers
> > +LAYERVERSION_networking =3D "1"
> > +
> > +LAYERDEPENDS_networking =3D "core"
>=20
> This is good, but it might be useful to also set a versioned dependency o=
n the=20
> core - that way if you attempt to use the denzil branch of OE-Core with m=
aster=20
> of one of these layers, instead of an error about incorrect indentation i=
n=20
> python functions you get one specifically about the version being incorre=
ct.

I agree.  This seems to have caused at least one person some headache
recently and I know I've had a few head-scratching moments when I was
burned by different trees being on incompatible branches.

Was there an update on this that I didn't see yet?  Or are you planning
one, Wenzong?  I can merge this now, but Paul's got a very good point, I
think.

--=20
-Joe MacDonald.
:wq

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEUEARECAAYFAlFHMFQACgkQPN8S4W6ZZneu9gCUDgeyI9Oa+Tbb+eJMF+NRjiSz
/wCdElrciWa2N7p8d8LY1KWgRYalR6o=
=J6E9
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
