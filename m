Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 3B69573AD2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2015 16:27:44 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1YVjU0-0006Sl-Qm from Joe_MacDonald@mentor.com ;
	Wed, 11 Mar 2015 09:27:44 -0700
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 09:27:43 -0700
Received: by burninator (Postfix, from userid 1000)	id 35E155810F5; Wed, 11
	Mar 2015 12:27:50 -0400 (EDT)
Date: Wed, 11 Mar 2015 12:27:50 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20150311162750.GA4894@mentor.com>
References: <EC21369A6993DD47985E1CBF1038266E263DC619@NA-MBX-04.mgc.mentorg.com>
	<20150310222718.GB4083@mentor.com> <20150311123902.GA6713@jama>
MIME-Version: 1.0
In-Reply-To: <20150311123902.GA6713@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-networking pending patches
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
X-List-Received-Date: Wed, 11 Mar 2015 16:27:46 -0000
X-Groupsio-MsgNum: 54744
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline

--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] meta-networking pending patches] On 15.03.11 (Wed 13:39) Martin J=
ansa wrote:

> On Tue, Mar 10, 2015 at 06:27:18PM -0400, Joe MacDonald wrote:
> > [Re: [oe] meta-networking pending patches] On 15.03.10 (Tue 13:44) MacD=
onald, Joe wrote:
> >=20
> > > Sure thing. I'll have a look today and update the status appropriatel=
y.
> > >=20
> > > -J.
> > >=20
> > > On 10 Mar 2015 06:30, Martin Jansa <martin.jansa@gmail.com> wrote:
> > > Hi Joe,
> > >=20
> > > can you please check pending meta-networking patches?
> > >=20
> > > my master-next shows:
> > > pick e7be331 openl2tp: add new recipe
> >=20
> > This has already been merged (ab75a8c8d0a57411af1452f9f8f41ccf29bb0cc7)
> > and I don't see it in my patchworks list now.  The filter I'm using is
> > this:
> >=20
> > http://patchwork.openembedded.org/project/oe/list/?state=3D1&q=3Dmeta-n=
etworking&archive=3Dboth
>=20
> OK, master-next version was adding it to recipes-daemons instead of
> recipes-protocols, that's why it wasn't resolved when rebasing
> master-next. Will drop it now from master-next.
>=20
> Please use meta-networking bundle as filter as well:
> http://patchwork.openembedded.org/bundle/jama/meta-networking/?archive=3D=
both
> http://www.openembedded.org/wiki/Patchwork#Multiple_layers_sharing_the_sa=
me_oe_project_on_patchwork

Sure.  I'm working on reviewing the other outstanding ones now.

> > > and few more are in patchwork:
> > > http://patchwork.openembedded.org/bundle/jama/meta-networking/?archiv=
e=3Dboth
> >=20
> > The others in this list also look like they were missed because they
> > didn't contain the meta-networking tag in the subject line.  Are you
> > manually creating that bundle or do you just have better filtering
> > technology than I do for catching these oddball ones?
>=20
> I'm maintaining all bundles manually
>=20
> First I add to bundles based on e-mail prefix, but then when I'm reading
> the commits for cherry-picking them to master-next I sometimes notice
> that the patch is touching some layer without saying so in subject
> prefix and I add these oddball onces to separate bundle just before
> cherry-pick.

Okay, good to know.  I've completely switched to using pwclient for my
workflow, but I'll try to keep on top of the outliers as well.  Unless
there's a pwclient-friendly way to work with bundles.  I haven't found
anything while poking around except some out-of-tree patches from ~6y
ago.  If you notice something lingering in the bundle, please go ahead
and ping me on it.

--=20
-Joe MacDonald.
:wq

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJVAG0CAAoJEEn8ffcsOfaWfZkH/jQQjTwbTS6t/kDMk8M1HPyy
vblq4e99ai23ANbQMTqBtq1H505LPgeQKyYhdEVODiPOwgMuHDH7zit1F1oduEvh
UKS7FUGD0CTWaBqmAwe9XEJzc33kDabdchi+8AP0ZZ/DRMDPN9QPd4xiNiECdJD+
PlOC3kksMpAr+MzYRYFka5wiKPV3WBBTBD2TK2yHhJIf1idiun21hBgRm88lQ7jN
urwd+610Rqb2CG37x/VGoWxOfgwliWyAPPAp1wBs3TWShMrFhMpejLCkt6J1LCIs
Moq/7p5/OIwQ84j2CAk1NIE17v6OljnZ3NEFifOydVzmnLjrcEA+ixO0JxnYwg0=
=/JtX
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
