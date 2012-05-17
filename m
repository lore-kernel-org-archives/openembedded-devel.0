Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SUvl2-0005wK-Rc
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 10:08:25 +0200
Received: by wibhm14 with SMTP id hm14so1373661wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2012 00:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=v+3Mpq6f48s1wOGau8UGq+xWSsxKIWsCnv4UaWE2mDY=;
	b=0Ze5op5NUCvIyDjpm5HwzWjuwJ0fuoT5nk/e1QEyQSTgcbwBO101dpPb2JO5Z3Fuhg
	SOTRQ6dpMexmmyJUyeKIMTOLnvjsLSSYbIqgcMIeZtXI4oX8mKSlewM6L3Y18kYbRXkJ
	ckiipmMFyIC3h1c1GOW+YMmVhJsI+dzH+kz7pkLT9bpHouZ2FJY1M34ej1j9n2GYbEv/
	2LhHUpFll2OU9cubHlQlKbRL9vEPefDysGOONu1nD5ln4OXFZ9plQI/ndtE/FVXny5wq
	sji+BHotaDpVHNRAQQg+aAquturM4rt6QrNvafZQrCcQD39Zwo13dCUQcGWkkXQVYp3V
	nVOw==
Received: by 10.180.81.234 with SMTP id d10mr15656179wiy.10.1337241502751;
	Thu, 17 May 2012 00:58:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k8sm13297038wia.6.2012.05.17.00.58.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 May 2012 00:58:21 -0700 (PDT)
Date: Thu, 17 May 2012 09:58:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120517075820.GC3164@jama.jama.net>
References: <DB8F1B3EEF94C3439BFFE674EB05E3CC028713@HKNPRD0204MB116.apcprd02.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DB8F1B3EEF94C3439BFFE674EB05E3CC028713@HKNPRD0204MB116.apcprd02.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Python exception running step do_package_update_index_ipk in OE classic
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
X-List-Received-Date: Thu, 17 May 2012 08:08:25 -0000
X-Groupsio-MsgNum: 38838
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8X7/QrJGcKSMr1RN"
Content-Disposition: inline

--8X7/QrJGcKSMr1RN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2012 at 07:34:24AM +0000, Craig McQueen wrote:
> I'm trying to build OE classic for i.MX28, following instructions at:
> http://www.imxdev.org/wiki/index.php?title=3DAll_Boards_OpenEmbedded
>=20
> I'm trying to run:
>   bitbake bootstrap-image
>=20
> It is failing on a step do_package_update_index_ipk when calling Python p=
rogram opkg-make-index. See error below.
>=20
> The problem is when it calls subprocess.check_output(), but check_output(=
) is only in Python 2.7, but not Python 2.6.
>=20
> On my machine, Python 2.7 is installed, however it seems that OE must be =
running Python 2.6. I see that OE builds Python 2.6 in tmp/work/i686-linux/=
python-native-2.6.6-ml12.0.
>=20
> What would be a good way to fix this?

send patch against
http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/
to yocto ML
to make it compatible with both python 2.6 and 2.7

Cheers,
>=20
> Regards,
> Craig McQueen
>=20
> NOTE: Running task 4056 of 4060 (ID: 18, /home/craigm/openembedded/stuff/=
openembedded/recipes/images/bootstrap-image.bb, do_package_update_index_ipk)
> NOTE: package bootstrap-image-1.0-r0: task do_package_update_index_ipk: S=
tarted
> ERROR: Logfile of failure stored in: /home/craigm/openembedded/stuff/tmp/=
work/mx28evk-angstrom-linux-gnueabi/bootstrap-image-1.0-r0/temp/log.do_pack=
age_update_index_ipk.20049
> Log data follows:
> | + do_package_update_index_ipk
> | + set -x
> | + ipkgarchs=3D'all any noarch arm  armv4 armv4t armv5te mx28evk'
> | + '[' '!' -z '' ']'
> | + mkdir -p /home/craigm/openembedded/stuff/tmp/deploy/eglibc/ipk
> | + touch /home/craigm/openembedded/stuff/tmp/deploy/eglibc/ipk/Packages
> | + opkg-make-index -r /home/craigm/openembedded/stuff/tmp/deploy/eglibc/=
ipk/Packages -p /home/craigm/openembedded/stuff/tmp/deploy/eglibc/ipk/Packa=
ges -l /home/craigm/openembedded/stuff/tmp/deploy/eglibc/ipk/Packages.filel=
ist -m /home/craigm/openembedded/stuff/tmp/deploy/eglibc/ipk
> | Traceback (most recent call last):
> |   File "/home/craigm/openembedded/stuff/tmp/sysroots/i686-linux/usr/bin=
/opkg-make-index", line 189, in <module>
> |     rc =3D subprocess.check_output(gzip_cmd, shell=3DTrue)
> | AttributeError: 'module' object has no attribute 'check_output'
> NOTE: package bootstrap-image-1.0-r0: task do_package_update_index_ipk: F=
ailed
> ERROR: Function 'do_package_update_index_ipk' failed (see /home/craigm/op=
enembedded/stuff/tmp/work/mx28evk-angstrom-linux-gnueabi/bootstrap-image-1.=
0-r0/temp/log.do_package_update_index_ipk.20049 for further information)
> ERROR: Task 18 (/home/craigm/openembedded/stuff/openembedded/recipes/imag=
es/bootstrap-image.bb, do_package_update_index_ipk) failed with exit code '=
1'
> ERROR: '/home/craigm/openembedded/stuff/openembedded/recipes/images/boots=
trap-image.bb' failed
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8X7/QrJGcKSMr1RN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+0r5wACgkQN1Ujt2V2gByBKQCfQAMOJPJfa6s3pEV/AYBN1612
FakAn100fma0EV7zEpGRv6RULbdqGq5S
=avjy
-----END PGP SIGNATURE-----

--8X7/QrJGcKSMr1RN--
