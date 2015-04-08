Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id C79B060089
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2015 19:55:12 +0000 (UTC)
Received: by wizk4 with SMTP id k4so67952042wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Apr 2015 12:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=upxEzEgI3PeW6O87tSdGnOLhvvg2aoKXzajZ1/65svw=;
	b=OhsI19/L1kYoXr3oCgehQ18NCdkq/Owka5U/Ps61cPkDgcfF8YXOB/Gb50HEzsJnO+
	oIe6lJXuoa0Z9y6hDol6IJujmlTna3Il4cmCntEuznbQbMWrqzRKbZSxd8/X0GBgx+6c
	6pUn6dYDn6Bd63bBPE+OTRTO0bJWgbtu4OG73h14VcyAQsXmVmXhvVN0GQI3w1io+rKx
	kRtpu6+EJZ9iGJ720Zt67/OZVHRpWhTAEyfz72JoFduYNmLOd/bKLpV+IAGoSKt7vAwM
	6VoJj6WT0pocip6wT7Nzdcyb4gm3z2gcJQ7M1nk+D2ftorR9N2w+II2NGomf4XT49Bl8
	PYng==
X-Received: by 10.180.77.199 with SMTP id u7mr17581860wiw.42.1428522914024;
	Wed, 08 Apr 2015 12:55:14 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id z12sm406481wjq.12.2015.04.08.12.55.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Apr 2015 12:55:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 8 Apr 2015 21:55:16 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150408195516.GB29645@jama>
References: <1427916099-30314-1-git-send-email-gshastri@juniper.net>
MIME-Version: 1.0
In-Reply-To: <1427916099-30314-1-git-send-email-gshastri@juniper.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [[meta-filesystems][Add xorriso support]] Add xorriso tool support
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
X-List-Received-Date: Wed, 08 Apr 2015 19:55:14 -0000
X-Groupsio-MsgNum: 55025
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7ZAtKRhVyVSsbBD2"
Content-Disposition: inline

--7ZAtKRhVyVSsbBD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 01, 2015 at 12:21:39PM -0700, Gaurang Shastri wrote:
> xorriso copies file objects from POSIX compliant filesystems into
> Rock Ridge enhanced ISO 9660 filesystems and allows session-wise
> manipulation of such filesystems.

Have you tested this recipe before sending it?

It fails to build, most likely because of missing foreign flag to
automake.

| configure.ac:47: installing './compile'
| configure.ac:14: installing './missing'
| Makefile.am: error: required file './NEWS' not found
| Makefile.am: installing './depcomp'
| autoreconf: automake failed with exit status: 1
| ERROR: autoreconf execution failed.
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /home/jenkin=
s/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/xorriso/1.3.8-r0/temp/log.=
do_configure.16725)
NOTE: recipe xorriso-1.3.8-r0: task do_configure: Failed

> Signed-off-by: Gaurang Shastri <gshastri@juniper.net>
> ---
>  .../recipes-utils/xorriso/xorriso_1.3.8.bb         |   17 ++++++++++++++=
+++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-filesystems/recipes-utils/xorriso/xorriso_1.3.8.=
bb
>=20
> diff --git a/meta-filesystems/recipes-utils/xorriso/xorriso_1.3.8.bb b/me=
ta-filesystems/recipes-utils/xorriso/xorriso_1.3.8.bb
> new file mode 100644
> index 0000000..93914b4
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/xorriso/xorriso_1.3.8.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTIONS =3D "xorriso copies file objects from POSIX compliant files=
ystems into Rock Ridge enhanced ISO 9660 filesystems and allows session-wis=
e manipulation of such filesystems"
> +
> +inherit autotools
> +
> +DEPENDS +=3D "attr zlib"
> +
> +SRC_URI =3D "http://www.gnu.org/software/${BPN}/${BPN}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "a0fc534ef8f9589282a189f0e6cdf952"
> +SRC_URI[sha256sum] =3D "901204634651533f7cbd105eab560534702458258529aac4=
b2f0fc946992107e"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> +LICENSE =3D "GPLv3"
> +
> +EXTRA_OECONF =3D "--disable-libacl"
> +
> +BBCLASSEXTEND =3D "nativesdk"
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7ZAtKRhVyVSsbBD2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUlh6QACgkQN1Ujt2V2gBy4iQCgrLBj4IyCYb+kjgTHIRIU5DRL
WCEAnjX4mW/o9v4qWDOyTyqv3T2Dp23L
=eCbI
-----END PGP SIGNATURE-----

--7ZAtKRhVyVSsbBD2--
