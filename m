Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SgtGw-0005Sq-8k
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jun 2012 09:54:46 +0200
Received: by bkcjm2 with SMTP id jm2so4610212bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2012 00:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mb3awja5YHyzpT+1T8m8W73SrHZ5ktKeMo6G1ClCe50=;
	b=bgk8P5BYITnKptPOsB66EQnj1pkCq7QQ7dIdiKI6e6vbvdVRs9r/6bOBHReV9gM0di
	3wK3JSrHBEvlJ3AW+IuBNRY7U5WzyvHeEgKCHkpJ2Ij9o8z1uQ2hcseY+mJShePnVNdd
	27nBWu0VM9tN+i73zRzYa+36roVvKWYD7h0MQdKMkzlfPtQjFZxaBbr1H44vrCdol19F
	8KL8eC8+uVR8ct9VHHsq/X6gRLJuel0WmRLZToHa/uGya0wf6lLX8McAajUyGXmw2OQF
	esluHXUDZOYGro/3N0gtGoxWxqwcdCo0TJlvryesLy6qmP5uf2tLwy5sfy/CkCgFxi1G
	+yJA==
Received: by 10.204.145.89 with SMTP id c25mr7826482bkv.5.1340091841931;
	Tue, 19 Jun 2012 00:44:01 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h18sm21786608bkh.8.2012.06.19.00.43.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jun 2012 00:44:00 -0700 (PDT)
Date: Tue, 19 Jun 2012 09:44:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120619074401.GQ3178@jama.jama.net>
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
X-List-Received-Date: Tue, 19 Jun 2012 07:54:46 -0000
X-Groupsio-MsgNum: 39292
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5AmtYbcgdBTTPS58"
Content-Disposition: inline

--5AmtYbcgdBTTPS58
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2012 at 07:34:24AM +0000, Craig McQueen wrote:
> I'm trying to build OE classic for i.MX28, following instructions at:
> http://www.imxdev.org/wiki/index.php?title=3DAll_Boards_OpenEmbedded
>=20
> I'm trying to run:
>   bitbake bootstrap-image

Fixed

http://git.openembedded.org/openembedded/commit/?id=3Db1aa65ab105f124af49de=
efc50b77e8901933685

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

--5AmtYbcgdBTTPS58
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/gLcEACgkQN1Ujt2V2gBwbQwCgkPDQrgVouCfXlgW6tQ3mBK0y
UycAn0yXFQqHqF4F2Z75Vh4j43X0OMN2
=GFIf
-----END PGP SIGNATURE-----

--5AmtYbcgdBTTPS58--
