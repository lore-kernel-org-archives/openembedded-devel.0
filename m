Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id BD07A70206
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 23:04:44 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id b13so2896615wgh.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 16:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Dx/VCzpVSLODFY+H53MDUVVvpS/xg5aVY9mxBxSL1Mo=;
	b=k3RpWp20kcnvFhRD+7aXErbTxLRWJDKjqiaSRgvdL10a5AshkPK44SHzh5bTP+gE3O
	V4OfiDuEG+uYE5Wo3XPn8tVEWAv6kO95OTbBGCVFAMjppOoKNkSvx5/BSZG+GoerLe5z
	E8DkaZixf6iDCPfMVw64Juf830cgfrCCTyst2nOqZWBWqo6Tvgy4CxFfDLaayYVg3yN2
	sgFI/+z0qI42JF2+ON1ao7tjoQeJNvia9mdYpfesZZED/rz5jhyjxNCyFaJ5GRNU7kB3
	42eP6cm9RgXeCLeMCp5dM1LK4uGum8TDk7Kb3pNpEXubz1UIIphUIVFU+f1NaKJo0gKR
	LS1w==
X-Received: by 10.180.221.229 with SMTP id qh5mr9914983wic.33.1403219084887;
	Thu, 19 Jun 2014 16:04:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cx5sm11607088wjb.8.2014.06.19.16.04.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 16:04:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 20 Jun 2014 01:04:45 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140619230445.GU2117@jama>
References: <1402675329-25425-1-git-send-email-denis@denix.org>
	<20140619155508.GV27324@denix.org>
	<20140619213103.GW27324@denix.org>
MIME-Version: 1.0
In-Reply-To: <20140619213103.GW27324@denix.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] rng-tools: Update rng-tools version to 4
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
X-List-Received-Date: Thu, 19 Jun 2014 23:04:48 -0000
X-Groupsio-MsgNum: 50466
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vKcNkqnJHUUp475E"
Content-Disposition: inline

--vKcNkqnJHUUp475E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2014 at 05:31:03PM -0400, Denys Dmytriyenko wrote:
> On Thu, Jun 19, 2014 at 11:55:08AM -0400, Denys Dmytriyenko wrote:
> > Ping?
>=20
> Never mind, I see it in master-next now. Autobuilder delays again?

Yes, last builds aren't really usable (still too many failures from B!=3DS
and binconfig-disabled), I hope to merge it this weekend.

> > On Fri, Jun 13, 2014 at 12:02:09PM -0400, Denys Dmytriyenko wrote:
> > > From: "Balasubramanian, Aparna" <aparnab@ti.com>
> > >=20
> > > Signed-off-by: Aparna Balasubramanian <aparnab@ti.com>
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  .../rng-tools/{rng-tools_2.bb =3D> rng-tools_4.bb}   |    4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >  rename meta-oe/recipes-support/rng-tools/{rng-tools_2.bb =3D> rng-to=
ols_4.bb} (84%)
> > >=20
> > > diff --git a/meta-oe/recipes-support/rng-tools/rng-tools_2.bb b/meta-=
oe/recipes-support/rng-tools/rng-tools_4.bb
> > > similarity index 84%
> > > rename from meta-oe/recipes-support/rng-tools/rng-tools_2.bb
> > > rename to meta-oe/recipes-support/rng-tools/rng-tools_4.bb
> > > index 7803b28..f620d8a 100644
> > > --- a/meta-oe/recipes-support/rng-tools/rng-tools_2.bb
> > > +++ b/meta-oe/recipes-support/rng-tools/rng-tools_4.bb
> > > @@ -7,8 +7,8 @@ SRC_URI =3D "http://heanet.dl.sourceforge.net/sourcef=
orge/gkernel/${P}.tar.gz \
> > >             file://init \
> > >             file://default"
> > > =20
> > > -SRC_URI[md5sum] =3D "63d503191eabed630324c104cc024475"
> > > -SRC_URI[sha256sum] =3D "1126f0ecc8cab3af14a562cddc5d8ffeef47df7eba34=
a7aadcdee35a25ec2b1e"
> > > +SRC_URI[md5sum] =3D "ae89dbfcf08bdfbea19066cfbf599127"
> > > +SRC_URI[sha256sum] =3D "b71bdfd4222c05e8316001556be90e1606f2a1bac3ef=
de60153bd84e873cc195"
> > > =20
> > >  inherit autotools update-rc.d
> > > =20
> > > --=20
> > > 1.7.9.5
> > >=20
> > > --=20
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --=20
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

--vKcNkqnJHUUp475E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOjbI0ACgkQN1Ujt2V2gBwP6QCeMLeLBtdZjx99opJp5hT9vpGR
NjwAnjXYZSvPKE7bFdS1GLA8wuQY2Sv4
=WC0W
-----END PGP SIGNATURE-----

--vKcNkqnJHUUp475E--
