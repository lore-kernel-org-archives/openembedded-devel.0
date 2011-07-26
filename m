Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qlpmh-00006M-6R
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jul 2011 00:07:27 +0200
Received: by ewy5 with SMTP id 5so916896ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2011 15:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Om9YVDGk4lrpWap0esYIcXd/oVfQYG0estgqBWDunNg=;
	b=NzQeJgR5K6CqjZtI2S85uDXJfJdO0Weobe8ZfW/Ld7Klvmeh+URLhLZBl/n2YW76kz
	1RotOsVZ/m+ificnouoZU0mcWaXX6RaH0SWhlF5CWfWZjvJUx79OhwNrDELxIi66YMWk
	maSnqmFlIj9Qm/nCeWwYRF+zQkoV9B04ykuB4=
Received: by 10.204.67.9 with SMTP id p9mr199268bki.226.1311717793619;
	Tue, 26 Jul 2011 15:03:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n11sm165861bkd.47.2011.07.26.15.03.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jul 2011 15:03:12 -0700 (PDT)
Date: Wed, 27 Jul 2011 00:03:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110726220305.GA15286@jama.jama.net>
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F8B5@nzc-ap-xch-02.ap.trimblecorp.net>
MIME-Version: 1.0
In-Reply-To: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F8B5@nzc-ap-xch-02.ap.trimblecorp.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Kernel load address issue
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
X-List-Received-Date: Tue, 26 Jul 2011 22:07:27 -0000
X-Groupsio-MsgNum: 33344
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline

--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2011 at 09:51:28AM +1200, Bernard Mentink wrote:
>=20
> Hi Guys,
>=20
> I am new to OE, but have managed to get u-boot working on my target, got
> TFTP working so I can transfer a kernel to RAM.
> I have modified my conf/local.conf file so that when a kernel is built a
> uImage binary is created that u-boot can use. (added line
> KERNEL_IMAGETYPE =3D "uImage")
>=20
> However When I try to boot the image in the bootloader, I get this:
>=20
> uboot> bootm 0x80300000
> ## Booting kernel from Legacy Image at 80300000 ...
>    Image Name:   Angstrom/2.6.36/mx31ads
>    Created:      2011-07-26  19:55:31 UTC
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>    Data Size:    1765856 Bytes =3D 1.7 MiB
>    Load Address: 20008000
>    Entry Point:  20008000

machine.conf can define
UBOOT_ENTRYPOINT =3D "0x80008000"
UBOOT_LOADADDRESS =3D "0x80008000"

both used in kernel.bbclass
/OE/dev/classes/kernel.bbclass:UBOOT_ENTRYPOINT ?=3D "20008000"
/OE/dev/classes/kernel.bbclass:UBOOT_LOADADDRESS ?=3D "${UBOOT_ENTRYPOINT}"
/OE/dev/classes/kernel.bbclass:            uboot-mkimage -A ${UBOOT_ARCH} -=
O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DIST=
RO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage

Cheers,

>    Verifying Checksum ... OK
>    Loading Kernel Image ...   <-- gets stuck here! ...
>=20
> The Load Address is wrong, my ram starts at 0x80000000 ... can someone
> tell me how to change this? I presume mkimage is responsible for this as
> the kernel is configured as relocatable ..
>=20
> Many Thanks,
> Bernie
>=20
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk4vOZgACgkQN1Ujt2V2gBysEwCglofZrq9mbSUReafsx78zkcSv
xCEAnA4nRFeqiWIczUV7DwyNUTu+e3l/
=Qn/k
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
