Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id D26FF6F098
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 10:37:27 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id q10so3011339ead.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 02:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4CuW5CAmW1FzkncvlnAP4DpKK1E+j2sQU0DAcHXNX6I=;
	b=T7xHZp45wLhpppGip0/T87XOgt+hCe95R2QZbn+Xd/Wp9hjIC9ofY2TQxRZv0K4liP
	xy+XiL4W6I/0k9cEqHraYArMsPxy1S4r5TUlUYo3pFDxVLDHiXCMmpjZiOAvCV/fs0g7
	iDyZKyYYmUcX/EUuWDj3pojv5hd7mwkAN3biaaEqrnoQcfVNA4F1LQ6PgrO4jOJf9C/+
	e379SrNH433Yzup1LVUZzpfX7peWuuh9cTs4pVHimYLoLOktySJBEKqZPgTm9GP3M4D3
	ulMllNbdWb9qM3UBw9qorGKXJvpjb1RvrpgJb5JBtODueP/8m0y+VTLZfkaPIB3xH0Ke
	t/Jw==
X-Received: by 10.14.176.66 with SMTP id a42mr23534015eem.101.1393238248419;
	Mon, 24 Feb 2014 02:37:28 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a2sm47106397eem.18.2014.02.24.02.37.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Feb 2014 02:37:27 -0800 (PST)
Date: Mon, 24 Feb 2014 11:37:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140224103722.GB26981@jama>
References: <1392731681-6149-1-git-send-email-diego.sueiro@gmail.com>
	<CAJTo0LYn3t67V_u=SA5KT0Ooj616SCHOUH-8qv+=TBONzrCptA@mail.gmail.com>
	<CAMCfZKEPS_2xstq+x_Tpi-PjAGyxChmJ+JnACgBL_euPtQYPSA@mail.gmail.com>
	<CAMCfZKEMFAFdO+irSS93euTACH=9YsMkb8w1Ae7u1c==k56Prg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMCfZKEMFAFdO+irSS93euTACH=9YsMkb8w1Ae7u1c==k56Prg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-openembedded][PATCH] libao: Add PACKAGECONFIG for esound support
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
X-List-Received-Date: Mon, 24 Feb 2014 10:37:31 -0000
X-Groupsio-MsgNum: 48296
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aM3YZ0Iwxop3KEKx"
Content-Disposition: inline

--aM3YZ0Iwxop3KEKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2014 at 07:32:07AM -0300, Diego Sueiro wrote:
> On Tue, Feb 18, 2014 at 11:28 AM, Diego Sueiro <diego.sueiro@gmail.com>wr=
ote:
>=20
> > Ross,
> >
> > On Tue, Feb 18, 2014 at 11:10 AM, Burton, Ross <ross.burton@intel.com>w=
rote:
> >
> >> > +PACKAGECONFIG ?=3D ""
> >>
> >> Shouldn't that be "??=3D" ?
> >>
> >
> > I've just followed Martin instructions:
> >
> > http://lists.openembedded.org/pipermail/openembedded-devel/2014-Februar=
y/094191.html
> >
>=20
> What is the verdict?

?=3D is correct (there was discussion about this on oe-core ML)

It was merged yesterday.
http://git.openembedded.org/meta-openembedded/commit/?id=3Dbc6e6112e6c70822=
41c69fb3d8277b267dd5620a

>=20
> Regards,
>=20
> --
> *dS
> Diego Sueiro
>=20
> Administrador do Embarcados
> www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=3Dassinatu=
ra_diego&utm_medium=3De-mail&utm_campaign=3DAssinatura%20Email%20Diego>
>=20
> /*long live rock 'n roll*/
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aM3YZ0Iwxop3KEKx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMLIOIACgkQN1Ujt2V2gByuIACeKG+7mwv5xxmJh4aObrL3bIZn
Jp8AoJLPZMpK3ibkfYZeiLaMmHkpiKGi
=In7Y
-----END PGP SIGNATURE-----

--aM3YZ0Iwxop3KEKx--
