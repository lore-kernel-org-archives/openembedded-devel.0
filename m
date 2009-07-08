Received: from [209.85.222.199] (helo=mail-pz0-f199.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MOSiW-0005I3-B5
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jul 2009 10:41:28 +0200
Received: by pzk37 with SMTP id 37so4676516pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jul 2009 01:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:organization:to:subject
	:date:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=4uM7GZfNd6S/WnITB2M+EOJCqc3HGnvYfjuTsqz4wIM=;
	b=QQ2YdGkI3O337uKzK3T29vqH27JzSmg8uSmaMlWjuVY5NygcOCccDqtzOhOZoc9ohF
	9FDJsnpy4XoJaFwByZXjW2s4ibKsGiiVH58F7Inl2UTY+jY1plQqZGbgRKfBzgOwx39s
	oVG1YSuWUXcCOapNK3z4x/2gLITAfI9TJNlas=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:organization:to:subject:date:user-agent:cc:references
	:in-reply-to:mime-version:content-type:content-transfer-encoding
	:message-id;
	b=LdaQNcSYbW0hWf1Bi8gNzoquHbnpkrmkGZ3TXmBOkKrBoprN9rghcXMh0qsNwDqpe9
	yDHnUEnT6H4WK5cVwVanCmT4CcJHLnZxVSsRYVE3uBxDFBzWjk5KaHmJMdtC7+S+CsiI
	EfYnnbgiGpbKyjiEMDyveBoVx7svzNw5lxfiA=
Received: by 10.142.171.3 with SMTP id t3mr2603160wfe.334.1247041727699;
	Wed, 08 Jul 2009 01:28:47 -0700 (PDT)
Received: from morpheus (adsl-71-146-5-22.dsl.pltn13.sbcglobal.net
	[71.146.5.22])
	by mx.google.com with ESMTPS id b39sm24569810rvf.10.2009.07.08.01.28.46
	(version=SSLv3 cipher=RC4-MD5); Wed, 08 Jul 2009 01:28:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Organization: Home Inc.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 8 Jul 2009 01:28:39 -0700
User-Agent: KMail/1.12.0 (Linux/2.6.28-13-generic; KDE/4.2.95; x86_64; ; )
References: <COL109-DS1646B10617396513D8E822F2300@phx.gbl>
In-Reply-To: <COL109-DS1646B10617396513D8E822F2300@phx.gbl>
MIME-Version: 1.0
Message-Id: <200907080128.44299.raj.khem@gmail.com>
Cc: Pascal Kesseli <pascal_kesseli@hotmail.com>
Subject: Re: Preferred gcc version ignored
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
X-List-Received-Date: Wed, 08 Jul 2009 08:41:28 -0000
X-Groupsio-MsgNum: 11821
Content-Type: multipart/signed; boundary="nextPart1719468.MyYZsu4OJ6";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1719468.MyYZsu4OJ6
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Monday 29 June 2009 06:24:48 am Pascal Kesseli wrote:
> Hi everyone
>=20
> =20
>=20
> Recently, I tried building helloworld without providing a precompiled
> toolchain for the MOXA UC-7408+. It worked as expected with OpenEmbedded
> first compiling the cross-compiler and glibc. To do so, I used the follow=
ing
> machine config:
>=20
> =20
>=20
> TARGET_ARCH =3D arm
>=20
> PACKAGE_ARCH =3D xscale
>=20
> TARGET_CC_ARCH =3D "-mcpu=3Dxscale"
>=20
> #ASSUME_PROVIDED +=3D virtual/arm-linux-gcc virtual/libc
>=20
> PREFERRED_PROVIDER_virtual/kernel =3D "linux-2.6"
>=20
> BOOTSTRAP_EXTRA_DEPENDS +=3D " virtual/kernel"
>=20
> BOOTSTRAP_EXTRA_RDEPENDS +=3D " kernel kernel-modules"
>=20
> IMAGE_FSTYPE =3D "ext2"
>=20
> EXTRA_IMGECMD_ext2 =3D " -b 2097152"
>=20
> =20
>=20
> PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc =3D glibc
>=20
> PREFERRED_VERSION_arm-linux-gcc =3D "3.4.4"
>=20
> PREFERRED_VERSION_gcc =3D "3.4.4"
>=20
> PREFERRED_VERSION_gcc-cross =3D "3.4.4"
>=20
> PREFERRED_VERSION_glibc =3D "2.3.3"
>=20
> =20
>=20
> =20
>=20
> Nevetheless, the compilation failed with the following error:
>=20
> =20
>=20
> | checking for pwd... /opt/openembedded/tmp/staging/i686-linux/usr/bin/pwd
>=20
> | checking for arm-linux-gcc... (cached) arm-linux-gcc -mcpu=3Dxscale
>=20
> | checking version of arm-linux-gcc -mcpu=3Dxscale... 4.2.4, bad
>=20
> | checking for gnumake... make
>=20
> | checking version of make... 3.81, ok
>=20
> | checking for gnumsgfmt... no
>=20
> | checking for gmsgfmt... no
>=20
> | checking for msgfmt... msgfmt
>=20
> | checking version of msgfmt... 0.17, ok
>=20
> | checking for makeinfo... makeinfo
>=20
> | checking version of makeinfo... 4.11, ok
>=20
> | checking for sed... sed
>=20
> | checking version of sed... 4.1.5, ok
>=20
> | checking for autoconf... autoconf
>=20
> | checking whether autoconf works... yes
>=20
> | configure: error:
>=20
> | *** These critical programs are missing or too old: gcc
>=20
> | *** Check the INSTALL file for required versions.
>=20
> | FATAL: oe_runconf failed
>=20
> NOTE: Task failed:
> /opt/openembedded/tmp/work/xscale-linux/glibc-2.3.3-r17/temp/log.do_confi=
gur
> e.5110
>=20
> ERROR: TaskFailed event exception, aborting
>=20
> ERROR: Build of /opt/openembedded/recipes/glibc/glibc_2.3.3.bb do_configu=
re
> failed
>=20
> ERROR: Task 75 (/opt/openembedded/recipes/glibc/glibc_2.3.3.bb,
> do_configure) failed
>=20
> NOTE: Tasks Summary: Attempted 159 tasks of which 159 didn't need to be
> rerun and 1 failed.
>=20
> ERROR: '/opt/openembedded/recipes/glibc/glibc_2.3.3.bb' failed
>=20
> =20
>=20
> =20
>=20
> It seems as if gcc version 4.2.4 was created and used by OpenEmbedded, wh=
ich
> is too new for building glibc 2.3.3. Which PREFERRED_VERSION statement di=
d I
> miss to advise OpenEmbedded to use an earlier gcc version to build the
> glibc?
>=20

if you do not select a DISTRO then you could add following to your local.co=
nf and remove
the stuff related to toolchain you have.

PREFERRED_GCC_VERSION                =3D "3.4.4"
PREFERRED_BINUTILS =3D 2.17
PREFERRED_VERSION_glibc =3D 2.3.3
PREFERRED_VERSION_glibc-initial =3D 2.3.3
require conf/distro/include/sane-toolchain.inc


Thx

=2DKhem

--nextPart1719468.MyYZsu4OJ6
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkpUWLkACgkQHnJKy6V6em4COQCgsoc0dkWoPupLqAJ8f6VI5Jp1
HJ4AmgKAnrF1+FAhh8Bq+134qnkPXC8M
=Cmqq
-----END PGP SIGNATURE-----

--nextPart1719468.MyYZsu4OJ6--
