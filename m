Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <theBohemian@gmx.net>) id 1JQ42Z-00065f-Tj
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2008 18:08:02 +0100
Received: (qmail invoked by alias); 15 Feb 2008 17:07:40 -0000
Received: from e178096112.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.96.112]
	by mail.gmx.net (mp046) with SMTP; 15 Feb 2008 18:07:40 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1//CUlSa1H/8aqzXqlpR1vo0Z+83ndv4qhFoFqlE+
	jDAJVm6MSil/8d
Message-ID: <47B5C6DB.6030500@gmx.net>
Date: Fri, 15 Feb 2008 18:07:39 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20080215175032.545c9b9a@widy.localdomain>
In-Reply-To: <20080215175032.545c9b9a@widy.localdomain>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: theBohemian@gmx.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] PKGPV/PKGPR of the PKG fame
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Feb 2008 17:08:02 -0000
X-Groupsio-MsgNum: 4154
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig3F96B7EE60A6CCC955C66EAC"

--------------enig3F96B7EE60A6CCC955C66EAC
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,
while I like the general idea the proposed implemented is not so nice
IMHO because
	- it works only for ipk packaging (should be agnostic)
	- for dependency resolution the original version values are used

IMHO this stuff should be done in packaging.bbclass instead.

Regards
Robert

Paul Sokolovsky schrieb:
> Hello,
>=20
> We now have ability to arbitrarily rename a package as built by
> package manager using PKG_<name> construct. Natural and consistent
> extension to that would be to allow to rename other parts of full
> package name - version and release.
>=20
> This is useful for building meta-recipes, which package something from
> external source without need to know version beforehand.
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- classes/package_ipk.bbclass	026a54435a436ef29405fa6b02afea519cc76ce=
7
> +++ classes/package_ipk.bbclass	8e5149b5da37896aa010037382baaf42cefec0a=
6
> @@ -166,10 +166,19 @@ python do_package_ipk () {
> =20
>  		bb.data.setVar('ROOT', '', localdata)
>  		bb.data.setVar('ROOT_%s' % pkg, root, localdata)
> +
>  		pkgname =3D bb.data.getVar('PKG_%s' % pkg, localdata, 1)
>  		if not pkgname:
>  			pkgname =3D pkg
>  		bb.data.setVar('PKG', pkgname, localdata)
> +		pv =3D bb.data.getVar('PKGPV_%s' % pkg, localdata, 1)
> +		if not pv:
> +		    pv =3D bb.data.getVar('PV', localdata, 1)
> +		bb.data.setVar('PKGPV', pv, localdata)
> +		pv =3D bb.data.getVar('PKGPR_%s' % pkg, localdata, 1)
> +		if not pv:
> +		    pv =3D bb.data.getVar('PR', localdata, 1)
> +		bb.data.setVar('PKGPR', pv, localdata)
> =20
>  		overrides =3D bb.data.getVar('OVERRIDES', localdata)
>  		if not overrides:
> @@ -207,9 +216,9 @@ python do_package_ipk () {
>  		fields =3D []
>  		pe =3D bb.data.getVar('PE', d, 1)
>  		if pe and int(pe) > 0:
> -			fields.append(["Version: %s:%s-%s\n", ['PE', 'PV', 'PR']])
> +			fields.append(["Version: %s:%s-%s\n", ['PE', 'PKGPV', 'PKGPR']])
>  		else:
> -			fields.append(["Version: %s-%s\n", ['PV', 'PR']])
> +			fields.append(["Version: %s-%s\n", ['PKGPV', 'PKGPR']])
>  		fields.append(["Description: %s\n", ['DESCRIPTION']])
>  		fields.append(["Section: %s\n", ['SECTION']])
>  		fields.append(["Priority: %s\n", ['PRIORITY']])
>=20
>=20



--------------enig3F96B7EE60A6CCC955C66EAC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHtcbbG9cfwmwwEtoRCOv2AJwMEGJa6pwVoWQwXJObvkGQopumjwCffKKQ
cUz05vdoyu6HRghdt/wlc/Q=
=IFEx
-----END PGP SIGNATURE-----

--------------enig3F96B7EE60A6CCC955C66EAC--
