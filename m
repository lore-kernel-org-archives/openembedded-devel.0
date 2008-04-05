Received: from [209.85.146.179] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JiBHt-0005Wd-Pm
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Apr 2008 18:30:42 +0200
Received: by wa-out-1112.google.com with SMTP id l24so663637waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Apr 2008 09:30:39 -0700 (PDT)
Received: by 10.115.19.19 with SMTP id w19mr784288wai.216.1207413039581;
	Sat, 05 Apr 2008 09:30:39 -0700 (PDT)
Received: from ?10.235.23.2? ( [71.146.34.138])
	by mx.google.com with ESMTPS id j21sm14330277wah.45.2008.04.05.09.30.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 05 Apr 2008 09:30:39 -0700 (PDT)
Message-ID: <47F7A928.4050600@gmail.com>
Date: Sat, 05 Apr 2008 09:30:32 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4327AE2D-6FA1-4BFE-BA07-059B0FC09BBE@student.utwente.nl>
In-Reply-To: <4327AE2D-6FA1-4BFE-BA07-059B0FC09BBE@student.utwente.nl>
X-Enigmail-Version: 0.95.6
OpenPGP: id=A57A7A6E
Cc: openembedded-devel@openembedded.org
Subject: Re: Adjusting staging for gcc >= 4.3.0
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
X-List-Received-Date: Sat, 05 Apr 2008 16:30:42 -0000
X-Groupsio-MsgNum: 4917
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig65544760AAB6C62DA3F5D1F6"

--------------enig65544760AAB6C62DA3F5D1F6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Hi,
>=20
> In order to build glibc with gcc 4.3.0 I needed to do:
>=20
> ln -sf /OE/angstrom-tmp/cross/lib/gcc/arm-angstrom-linux-gnueabi/4.3.0/=

> include-fixed/* /OE/angstrom-tmp/cross/lib/gcc/arm-angstrom-linux-
> gnueabi/4.3.0/include/
>=20
> The question I have is:
>=20
> Should be do this symlinking in the recipe or find a way to add
> include-fixed to the includepath?

Hi Koen

Does this patch help.
http://sourceware.org/ml/libc-alpha/2007-03/msg00017.html

thx

-Khem



--------------enig65544760AAB6C62DA3F5D1F6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFH96ktHnJKy6V6em4RAiyyAJ4r87q+dPx/17ILifHuaB9jKwG/2QCeOVRn
fvCcVRgC8dNZxNb3oXwCE0A=
=x3xl
-----END PGP SIGNATURE-----

--------------enig65544760AAB6C62DA3F5D1F6--
