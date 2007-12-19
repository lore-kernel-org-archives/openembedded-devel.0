Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <theBohemian@gmx.net>) id 1J53ku-0003CD-GV
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Dec 2007 19:34:56 +0100
Received: (qmail invoked by alias); 19 Dec 2007 18:29:52 -0000
Received: from e178077011.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.77.11]
	by mail.gmx.net (mp051) with SMTP; 19 Dec 2007 19:29:52 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/y2zdtf73y705mwHOCUUTKSapEoiAnOjtKAsDuEL
	k0BfHSCjw8ItbA
Message-ID: <4769631B.9060408@gmx.net>
Date: Wed, 19 Dec 2007 19:29:47 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.6 (X11/20071009)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1J4yUM-0004ua-NG@linuxtogo.org>
In-Reply-To: <E1J4yUM-0004ua-NG@linuxtogo.org>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: Re: [oe-commits] org.oe.dev qt4-x11: create dir before trying to put	files into it
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
X-List-Received-Date: Wed, 19 Dec 2007 18:34:56 -0000
X-Groupsio-MsgNum: 3702
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig8EEC32EECE76A33749B62A6B"

--------------enig8EEC32EECE76A33749B62A6B
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi.

koen commit schrieb:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- packages/qt/qt4-x11-free_4.1.2.bb	87ff0a36e1696d7c7726c3e3ffd517ca7=
f9233f3
> +++ packages/qt/qt4-x11-free_4.1.2.bb	3f0c2bbb385a352c8af18085b894d4224=
822db3c
> @@ -70,6 +70,7 @@ do_stage() {
> =20
>  do_stage() {
>  	oe_runmake install INSTALL_ROOT=3D/
> +	install -d ${STAGING_QT_DIR}
>  	install -m 0755 ${STAGING_BINDIR_NATIVE}/rcc4 ${STAGING_QT_DIR}/bin/r=
cc
>  	install -m 0755 ${STAGING_BINDIR_NATIVE}/moc4 ${STAGING_QT_DIR}/bin/m=
oc
>  	install -m 0755 ${STAGING_BINDIR_NATIVE}/uic4 ${STAGING_QT_DIR}/bin/u=
ic
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- packages/qt/qt4-x11-free_4.3.2.bb	2a8bfa1b9cc3aa059dd561726a7bbdfc8=
bcc4e79
> +++ packages/qt/qt4-x11-free_4.3.2.bb	706fc53c8f4c041fca267bea9825aa990=
10fa460
> @@ -62,7 +62,7 @@ do_compile() {
> =20
>  # FIXME: Might want to compile the cross tools for the -dev packages a=
s well...
>  do_compile() {
> -	unset CFLAGS CXXFLAGS
> +	unset CFLAGS CXXFLAGSi
                             ^
I think at this point an unwanted keypress slipped in.

Regards
Robert


--------------enig8EEC32EECE76A33749B62A6B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHaWMeG9cfwmwwEtoRCLkNAJ0aYEylYLjGsmhrCzSXvBbeLNsXgACggUVF
WhLp4kyeUq0tmbKAz/aiAkc=
=WswI
-----END PGP SIGNATURE-----

--------------enig8EEC32EECE76A33749B62A6B--
