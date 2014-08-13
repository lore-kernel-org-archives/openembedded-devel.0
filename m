Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id AA40960B05
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Aug 2014 21:14:00 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id pn19so268465lab.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Aug 2014 14:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=V5WndbEF7NsrA62ipxYCvXfJeeAhsyi5uyDfzSzrZeo=;
	b=dXLvQ1keFfuhlMzbCjy3t1NKSluCW4K30rXlULuAzgJiShbR1NBkPb54WMyOM+B253
	1DBu7dLMo3/j1DR2qhBtBHhkRpN+siDKaRdpFGQ8RMIRax+OVg2M6SpXOtVpGiYQysSI
	mJ1RR7icji6w1XPVUjKumQnSqXBAIvLJi+aol4OOc6MsheE11khW5YmfFfQQP57aBh+5
	vA572d99vwXRCAwwK4yjHyWhq676GillZb1NQxncEB5vcvpzTmkwZYqLta+eJYix3D2v
	LStNHsJzUXD/1/ihfvidPrnt8GwYKxbQNsNoBtsgYiQB445G6VO0e7usD6S7loupYPOO
	QqQA==
X-Received: by 10.113.5.41 with SMTP id cj9mr488387lbd.81.1407964440572;
	Wed, 13 Aug 2014 14:14:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	mi10sm4678345lbc.19.2014.08.13.14.13.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Aug 2014 14:13:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 13 Aug 2014 23:14:36 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140813211436.GA14848@jama>
References: <BLU436-SMTP223AFD3FCC0CB7D577EB9D6D6EA0@phx.gbl>
	<20140812221225.GT14848@jama>
	<BAY168-W105F8D49A2D581CB059AAD5D6EB0@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <BAY168-W105F8D49A2D581CB059AAD5D6EB0@phx.gbl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2] Submitting cyassl recipe for consideration in being added to meta-oe/meta-networking/recipes-connectivity. Cyassl is a lightweight, embedded SSL/TLS library. For more information: www.wolfssl.com. The cyassl recipe is a fully
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
X-List-Received-Date: Wed, 13 Aug 2014 21:14:04 -0000
X-Groupsio-MsgNum: 51654
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SPLgQB0HFVQkxokU"
Content-Disposition: inline

--SPLgQB0HFVQkxokU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2014 at 02:53:19PM -0600, LC Mac wrote:
> Hi Martin,=20
>=20
> I'm a bit confused by the line cyassl-${PV} -> ${BP}.=20

cyassl-${PV} =3D=3D ${BP}

so please replace "cyassl-${PV} with ${BP}

> Could you explain that? When you say drop the S assignment, do you mean=
=20
> delete the entire line or leave the line like this:=20
> ${WORKDIR}/${PN}-${PV}? I cannot get the recipe to build with any of the
>  proposed changes.=20

"${WORKDIR}/${PN}-${PV}" is default value, drop whole line, because it's
unnecessary

>=20
>=20
> Thanks,
>=20
> Leah
>=20
> From: martin.jansa@gmail.com
> Date: Wed, 13 Aug 2014 00:12:25 +0200
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH v2] Submitting cyassl recipe for consid=
eration in being added to meta-oe/meta-networking/recipes-connectivity. Cya=
ssl is a lightweight, embedded SSL/TLS library. For more information: www.w=
olfssl.com. The cyassl recipe is a fully functional bb file tested with the=
 YoctoProject.
>=20
> On Tue, Aug 12, 2014 at 01:42:39PM -0600, lchristina26 wrote:
> > Signed-off-by: Leah Thompson <lchristina26@hotmail.com>
> > ---
> >  .../recipes-connectivity/cyassl/cyassl_3.1.0.bb     | 21 +++++++++++++=
++++++++
> >  1 file changed, 21 insertions(+)
> >  create mode 100644 meta-networking/recipes-connectivity/cyassl/cyassl_=
3.1.0.bb
> >=20
> > diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.b=
b b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> > new file mode 100644
> > index 0000000..441d321
> > --- /dev/null
> > +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> > @@ -0,0 +1,21 @@
> > +SUMMARY =3D "CyaSSL Embedded SSL Library"
> > +DESCRIPTION =3D "CyaSSL is a lightweight SSL library written in C and \
> > +               optimized for embedded and RTOS environments. It can be=
 \
> > +               Up to 20 times smaller than OpenSSL while still support=
ing \
> > +               a full TLS 1.2 client and server."
> > +HOMEPAGE =3D "http://www.yassl.com/yaSSL/Products-cyassl.html"
> > +BUGTRACKER =3D "http://github.com/cyassl/cyassl/issues"
> > +SECTION =3D "libs/network"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263"
> > +
> > +SRC_URI =3D "http://www.yassl.com/cyassl-${PV}.zip"
> =20
> cyassl-${PV} -> ${BP}
> =20
> > +
> > +
> > +SRC_URI[md5sum] =3D "72477eb50697e759d309c49cb1aef18a"
> > +SRC_URI[sha256sum] =3D "85a79009d2a7468910dfb1e4b975e0b00a42c695f4f1a2=
adc16d2507b5d0b03e"
> > +
> > +S =3D "${WORKDIR}/${PN}-${PV}"
> =20
> This is default value, drop S assignment
> =20
> > +
> > +inherit autotools
> > +
> > --=20
> > 1.9.1
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> =20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel 		 	   =
		 =20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SPLgQB0HFVQkxokU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPr1TwACgkQN1Ujt2V2gBwxFgCfVWjySfFVzy9HPqDSlCz+dxY5
V74An1W2ZEBYFxosiJb3CNot6W/k1i7Q
=9oMK
-----END PGP SIGNATURE-----

--SPLgQB0HFVQkxokU--
