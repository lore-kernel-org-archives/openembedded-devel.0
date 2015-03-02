Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 569EE72130
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2015 10:24:31 +0000 (UTC)
Received: by wesx3 with SMTP id x3so32300968wes.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2015 02:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6c99SqM1swvTLJMfyiK7lndFP9z325nnwldSvsIw42U=;
	b=irBu7OhHu56RKoH7H1BEkZdZw6ziaRjxdfvsBnMR045oqMo5NpOMqhXrnRD9IjcjY5
	kwar4piqScluAAAfe0pQaS2WeyqywqoD/P8pI0mpQqJ6ECB/+KIR1+GRcMbukjKfshZI
	ty7VamDtG20HRI+PDMmgkMnEBl2gzxByxUjcm7lLjuJvM1LmDmYynT8dWFR6Gzu340/M
	eVkZZILeNsTLeu2SP6sAJrIHy+AgOutBgF4/Za0bhqOGJIh1+Td3ayw6Asi8h/ULUvr/
	iCWrn/qXVratgE/2LGqcodTccDnVA8KsFdBZF7JIBeFGwnW+vTzMCJG2dc4HJywlnAsq
	gVCw==
X-Received: by 10.194.209.237 with SMTP id mp13mr30891402wjc.120.1425291872356;
	Mon, 02 Mar 2015 02:24:32 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n1sm15412582wib.11.2015.03.02.02.24.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Mar 2015 02:24:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 2 Mar 2015 11:24:54 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150302102454.GX2309@jama>
References: <1424420477-30493-1-git-send-email-Martin.Jansa@gmail.com>
	<md1dit$n3m$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <md1dit$n3m$1@ger.gmane.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-initramfs][PATCH] linux-yocto-tiny-kexecboot: remove 3.10, 3.17 and add 3.19
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
X-List-Received-Date: Mon, 02 Mar 2015 10:24:35 -0000
X-Groupsio-MsgNum: 54576
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RGnAp+RkZMffi58C"
Content-Disposition: inline

--RGnAp+RkZMffi58C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2015 at 11:21:17AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Martin Jansa schreef op 20-02-15 om 09:21:
> > * 3.10 and 3.17 were removed in oe-core and parsing fails because of the
> > require line
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> Tested-by: Koen Kooi <koen@dominion.thruhere.net
>=20
> Any ETA when this will go in?

today/now

>=20
> > --- .../linux/linux-yocto-tiny-kexecboot_3.17.bb       | 26
> > ---------------------- ..._3.10.bb =3D> linux-yocto-tiny-kexecboot_3.19=
=2Ebb}
> > |  2 +- 2 files changed, 1 insertion(+), 27 deletions(-) delete mode
> > 100644
> > meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bb=
=20
> > rename
> > meta-initramfs/recipes-kernel/linux/{linux-yocto-tiny-kexecboot_3.10.bb
> > =3D> linux-yocto-tiny-kexecboot_3.19.bb} (93%)
> >=20
> > diff --git
> > a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bb
> > b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.b=
b=20
> > deleted file mode 100644 index f3296c7..0000000 ---
> > a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.b=
b=20
> > +++ /dev/null @@ -1,26 +0,0 @@ -require
> > recipes-kernel/linux/linux-yocto-tiny_3.17.bb -SUMMARY =3D "Yocto tiny
> > kernel embedding a minimalistic kexecboot initramfs" - -PACKAGES =3D ""=
=20
> > -PROVIDES =3D "" - -KERNEL_IMAGE_BASE_NAME =3D
> > "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${PV}-${MACHINE}"=20
> > -KERNEL_IMAGE_SYMLINK_NAME =3D
> > "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${MACHINE}" - -INITRAMFS_IMAGE
> > =3D "initramfs-kexecboot-klibc-image" -INITRAMFS_TASK =3D
> > "${INITRAMFS_IMAGE}:do_rootfs" - -# disable unneeded tasks=20
> > -do_install[noexec] =3D "1" -do_package[noexec] =3D "1"=20
> > -do_package_qa[noexec] =3D "1" -do_packagedata[noexec] =3D "1"=20
> > -do_package_deb[noexec] =3D "1" -do_package_ipk[noexec] =3D "1"=20
> > -do_package_rpm[noexec] =3D "1" -do_package_tar[noexec] =3D "1"=20
> > -do_package_write_deb[noexec] =3D "1" -do_package_write_ipk[noexec] =3D=
 "1"=20
> > -do_package_write_rpm[noexec] =3D "1" -do_package_write_tar[noexec] =3D=
 "1"=20
> > -do_populate_sysroot[noexec] =3D "1" diff --git
> > a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb
> > b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.19.b=
b=20
> > similarity index 93% rename from
> > meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb=
=20
> > rename to
> > meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.19.bb=
=20
> > index a823e0f..f6d2fa0 100644 ---
> > a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.b=
b=20
> > +++
> > b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.19.b=
b=20
> > @@ -1,4 +1,4 @@ -require recipes-kernel/linux/linux-yocto-tiny_3.10.bb=
=20
> > +require recipes-kernel/linux/linux-yocto-tiny_${PV}.bb SUMMARY =3D "Yo=
cto
> > tiny kernel embedding a minimalistic kexecboot initramfs"
> >=20
> > PACKAGES =3D ""
> >=20
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iD8DBQFU9DmdMkyGM64RGpERAl6xAJ9l92nP7qWzX/ymjVYLkO4cT5UT6ACfUdHY
> hZBp07nZNhyH1UykJFmKbzk=3D
> =3DLyMJ
> -----END PGP SIGNATURE-----
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RGnAp+RkZMffi58C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT0OnYACgkQN1Ujt2V2gBypnwCfeuJpsPnvk7k6M+e8HA6zNdBw
McUAn36C1d7PxGzVb0wZ+vlpfW8qKcD2
=r4gr
-----END PGP SIGNATURE-----

--RGnAp+RkZMffi58C--
