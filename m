Received: from mail-ey0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qlq9d-0000cP-3S
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jul 2011 00:31:09 +0200
Received: by eye4 with SMTP id 4so1817779eye.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2011 15:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1rovREjfTHwtItovbyFlAcJeWnRk1VEI3vWzhbJMh5Q=;
	b=lTBYnAjdfdxZYBsPVggGVUdJtFwStHHKXcDau68TBj8oqvh361YCDg7TPIoPsaRUKW
	vgLV8gyo38adk1bWLmqPf/cFWWh4Afe7V93h+rGAwgXSEXwDaZFGtsEuN7cuXy4uhWkm
	HqGZT4eYzV7Tf95ieTDArc9WGVicEItiHp+X8=
Received: by 10.204.140.200 with SMTP id j8mr215502bku.231.1311719215419;
	Tue, 26 Jul 2011 15:26:55 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f12sm171686bkt.36.2011.07.26.15.26.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jul 2011 15:26:54 -0700 (PDT)
Date: Wed, 27 Jul 2011 00:26:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110726222646.GB15286@jama.jama.net>
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F8B5@nzc-ap-xch-02.ap.trimblecorp.net>
	<20110726220305.GA15286@jama.jama.net>
	<F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F8D9@nzc-ap-xch-02.ap.trimblecorp.net>
MIME-Version: 1.0
In-Reply-To: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F8D9@nzc-ap-xch-02.ap.trimblecorp.net>
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
X-List-Received-Date: Tue, 26 Jul 2011 22:31:09 -0000
X-Groupsio-MsgNum: 33347
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Content-Disposition: inline

--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2011 at 10:14:50AM +1200, Bernard Mentink wrote:
> Many thanks for the reply,
>=20
> By the way where is the machine.conf file, I can't seem to find it
> anywhere ..

in your case probably
conf/machine/mx31ads.conf or something like that

I meant ${MACHINE}.conf and machine.conf was just example, sorry I
wasn't clear.

Cheers,

>=20
> Cheers,
> Bernie=20
>=20
>=20
> ------------------------------------------------------------------------
> ------------------
> I want to die peacefully in my sleep, like my grandfather, not screaming
> and yelling like the passengers in his car.
>=20
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Wednesday, 27 July 2011 10:03 a.m.
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Kernel load address issue
>=20
> On Wed, Jul 27, 2011 at 09:51:28AM +1200, Bernard Mentink wrote:
> >=20
> > Hi Guys,
> >=20
> > I am new to OE, but have managed to get u-boot working on my target,=20
> > got TFTP working so I can transfer a kernel to RAM.
> > I have modified my conf/local.conf file so that when a kernel is built
>=20
> > a uImage binary is created that u-boot can use. (added line=20
> > KERNEL_IMAGETYPE =3D "uImage")
> >=20
> > However When I try to boot the image in the bootloader, I get this:
> >=20
> > uboot> bootm 0x80300000
> > ## Booting kernel from Legacy Image at 80300000 ...
> >    Image Name:   Angstrom/2.6.36/mx31ads
> >    Created:      2011-07-26  19:55:31 UTC
> >    Image Type:   ARM Linux Kernel Image (uncompressed)
> >    Data Size:    1765856 Bytes =3D 1.7 MiB
> >    Load Address: 20008000
> >    Entry Point:  20008000
>=20
> machine.conf can define
> UBOOT_ENTRYPOINT =3D "0x80008000"
> UBOOT_LOADADDRESS =3D "0x80008000"
>=20
> both used in kernel.bbclass
> /OE/dev/classes/kernel.bbclass:UBOOT_ENTRYPOINT ?=3D "20008000"
> /OE/dev/classes/kernel.bbclass:UBOOT_LOADADDRESS ?=3D
> "${UBOOT_ENTRYPOINT}"
> /OE/dev/classes/kernel.bbclass:            uboot-mkimage -A
> ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e
> $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin
> arch/${ARCH}/boot/uImage
>=20
> Cheers,
>=20
> >    Verifying Checksum ... OK
> >    Loading Kernel Image ...   <-- gets stuck here! ...
> >=20
> > The Load Address is wrong, my ram starts at 0x80000000 ... can someone
>=20
> > tell me how to change this? I presume mkimage is responsible for this=
=20
> > as the kernel is configured as relocatable ..
> >=20
> > Many Thanks,
> > Bernie
> >=20
> >=20
> >=20
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk4vPyYACgkQN1Ujt2V2gBw7owCdGsR8gdCuO79LRlPur/yr2js/
YEMAoK/1j5CYnFYBei4gmvn1pwV34fNX
=LdrZ
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--
