Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id B51CF6B4F7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Mar 2014 11:14:53 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id e49so3948225eek.31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Mar 2014 04:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DxfZto9jmmSJBA95zepGded57iq2wi4facNt14k9Yqk=;
	b=J7WD/d624ygh2dt527+19dLjCuQNdqhdYZuaeKDL0kJjmr83bO7WI37wWGOGfr4EbQ
	gml86ODwoji2TUEwM7NU6tDyT46YQUgUGO0oJgy+MheW414w5UN0IS01+8nD+JQA6oVx
	QNIev8QxSaShtV/yj4jAmLx26ptOiQ+bQfByYuwTb3MLDvT7kZNBv149Y0IATNYLXcfM
	grnUcG4HjA65OF0yaHSypr78QkneatDZ0kXb46GFFpgIWbq/5PGWoxlu+WkBzkvvaxnt
	zoNrs+E4byMXHJK6xSopFDEpfj+HJCaONYFfD+/gsfg2PWKzTcqlW4BjpHdhlLeZenYt
	bPvA==
X-Received: by 10.14.194.70 with SMTP id l46mr152005een.95.1396005294473;
	Fri, 28 Mar 2014 04:14:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	48sm10932559eei.24.2014.03.28.04.14.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Mar 2014 04:14:53 -0700 (PDT)
Date: Fri, 28 Mar 2014 12:14:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140328111455.GA3714@jama>
References: <1395986585-15248-1-git-send-email-b40290@freescale.com>
	<20140328100934.GA3714@jama>
	<607b033dd0ee43e6963425d897b1f5b1@BY2PR03MB254.namprd03.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <607b033dd0ee43e6963425d897b1f5b1@BY2PR03MB254.namprd03.prod.outlook.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] daq: update to 2.0.2
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
X-List-Received-Date: Fri, 28 Mar 2014 11:14:57 -0000
X-Groupsio-MsgNum: 48881
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline

--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2014 at 10:18:09AM +0000, B40290@freescale.com wrote:
> Hello,
>  I can not reproduce the issue.

Have you tried to build it with minimal deps (empty sysroot)?

> Can you give me your host environments?

It's described here:
http://www.openembedded.org/wiki/Bitbake_World_Status

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Friday, March 28, 2014 6:10 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] daq: update to 2.0.2
>=20
> On Fri, Mar 28, 2014 at 02:03:05PM +0800, b40290@freescale.com wrote:
> > From: Chunrong Guo <B40290@freescale.com>
> >=20
> > Signed-off-by: Chunrong Guo <B40290@freescale.com>
>=20
> There is patch like this already, but it still doesn't fix the build issu=
e.
>=20
> > ---
> >  meta-oe/recipes-connectivity/daq/{daq_2.0.1.bb =3D> daq_2.0.2.bb} | 4=
=20
> > ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)  rename=20
> > meta-oe/recipes-connectivity/daq/{daq_2.0.1.bb =3D> daq_2.0.2.bb} (73%)
> >=20
> > diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb=20
> > b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
> > similarity index 73%
> > rename from meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
> > rename to meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
> > index c12ccde..2675e2a 100644
> > --- a/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
> > +++ b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
> > @@ -10,7 +10,7 @@ DEPENDS =3D "libpcap libpcre "
> >  SRC_URI =3D "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
> >              file://disable-run-test-program-while-cross-compiling.patc=
h "
> > =20
> > -SRC_URI[md5sum] =3D "044aa3663d44580d005293eeb8ccf175"
> > -SRC_URI[sha256sum] =3D "ebba87c2ec76ac65d2980934423b0597909caead3a86ce=
5d1ba1ea6ce518ec6d"
> > +SRC_URI[md5sum] =3D "865bf9b750a2a2ca632591a3c70b0ea0"
> > +SRC_URI[sha256sum] =3D "d65d1e67c4994e02c3142c49a648642e780b7e3d942b4a=
51f605309beac269a8"
> > =20
> >  inherit autotools
> > --
> > 1.8.3.2
> >=20
> >=20
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM1Wa8ACgkQN1Ujt2V2gBz7AgCdHtoqiNcxABhOhoFFSjOyUvy6
tzEAn3BwJJTrrOCbi+6W1SnY0NT3ll6O
=W91E
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
