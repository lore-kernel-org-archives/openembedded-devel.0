Received: from [209.85.146.176] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Jhq2L-0008Qr-MO
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Apr 2008 19:49:13 +0200
Received: by wa-out-1112.google.com with SMTP id l24so167049waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Apr 2008 10:49:09 -0700 (PDT)
Received: by 10.114.58.6 with SMTP id g6mr2398213waa.138.1207331349626;
	Fri, 04 Apr 2008 10:49:09 -0700 (PDT)
Received: from ?10.0.10.215? ( [63.81.120.158])
	by mx.google.com with ESMTPS id j29sm11880698waf.18.2008.04.04.10.49.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 04 Apr 2008 10:49:09 -0700 (PDT)
Message-ID: <47F66A0B.1000904@gmail.com>
Date: Fri, 04 Apr 2008 10:48:59 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200804041057.55738.geoffrey@pager.net>
In-Reply-To: <200804041057.55738.geoffrey@pager.net>
X-Enigmail-Version: 0.95.6
OpenPGP: id=A57A7A6E
Subject: Re: Building multiple gdb-cross targets
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
X-List-Received-Date: Fri, 04 Apr 2008 17:49:13 -0000
X-Groupsio-MsgNum: 4912
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig34D8F37D7E0F5298CA99ADDF"

--------------enig34D8F37D7E0F5298CA99ADDF
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Geoffrey Wossum wrote:
> Hi all,
>=20
> Another question about build gdb-cross for the AVR32.  Building gdb-cro=
ss gets=20
> me avr32-angstrom-linux-uclibc-gdb.  But over at this page,=20
> http://avr32linux.org/twiki/bin/view/Main/KernelDebugging, it says you =
really=20
> want an standalone gdb for kernel debugging.
>=20
> How can I get OE to build just an avr32-gdb?  How can I get OE to build=
 both=20
> avr32-gdb and avr32-linux-gdb (aka avr32-angstrom-linux-uclibc-gdb)? =20

They are two different configurations of gdb the one OE will build for=20
you is the cross gdb which is supposed to cross debug linux applications =

(e.g. arm-*-linux-gnueabi). The one you are intending to have is what I=20
call baremetal (e.g. arm-eabi)  debugger. I dont think you will be able=20
to build this with ease using OE as they are really two different=20
targets for OE to build.

Why would avr-linux gdb not work ?

HTH

-Khem


>=20
> TIA,
> ---
> Geoffrey
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20



--------------enig34D8F37D7E0F5298CA99ADDF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFH9moOHnJKy6V6em4RAopyAJ4rdvMRvLSmJWAjxwedEfgIKsLSVgCgq5gt
GdmSYesA5+2WDXufWZeY00w=
=DY74
-----END PGP SIGNATURE-----

--------------enig34D8F37D7E0F5298CA99ADDF--
