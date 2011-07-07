Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qet1r-0001d5-I6 for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 20:10:23 +0200
Received: from g225080076.adsl.alicedsl.de ([92.225.80.76]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QesyV-0007Wy-1x for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 18:06:55 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <50751d1b7570089f6aba5072807372c7a31be373.1310045515.git.michael.lippautz@gmail.com>
References: <cover.1310045515.git.michael.lippautz@gmail.com>
	<50751d1b7570089f6aba5072807372c7a31be373.1310045515.git.michael.lippautz@gmail.com>
Date: Thu, 07 Jul 2011 20:06:32 +0200
Message-ID: <1310061992.4153.8.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-oe][PATCHv2 1/4] python-pyudev: Add version 0.11 (initial recipe)
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
X-List-Received-Date: Thu, 07 Jul 2011 18:10:23 -0000
X-Groupsio-MsgNum: 33054
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-tDtUVMWz6s10QDm2fNQq"

--=-tDtUVMWz6s10QDm2fNQq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 07.07.2011, 15:35 +0200 schrieb Michael Lippautz:
> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
> ---
>  .../recipes-devtools/python/python-pyudev_0.11.bb  |   22 ++++++++++++++=
++++++
>  1 files changed, 22 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/python/python-pyudev_0.11.bb
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-pyudev_0.11.bb b/meta=
-oe/recipes-devtools/python/python-pyudev_0.11.bb
> new file mode 100644
> index 0000000..03a948a
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-pyudev_0.11.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION =3D "A libudev binding"
> +HOMEPAGE =3D "http://pypi.python.org/pypi/pyudev"
> +SECTION =3D "devel/python"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37=
343"
> +PR =3D "r0"
> +
> +SRCNAME =3D "pyudev"
> +SRC_URI =3D "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNA=
ME}-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "dca4e69da387f9a6683ee4b5c27ca66a"
> +SRC_URI[sha256sum] =3D "0acfa500219f4bcf711f35c1b2041d035b4bf5f302eca503=
8572ee788d9e584a"
> +
> +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit setuptools
> +
> +RDEPENDS_${PN} =3D "\
> +  python-ctypes \
> +  python-subprocess \
> +  python-misc \
> +  libudev \
> +"

I backported your patch locally to oe-dev and it fails with the
following error message.

        + /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/bin/=
python setup.py build
        Traceback (most recent call last):
          File "setup.py", line 34, in <module>
            import pyudev
          File "/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-l=
inux-gnueabi/python-pyudev-0.11-r0/pyudev-0.11/pyudev/__init__.py", line 17=
7, in <module>
            from pyudev.device import *
          File "/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-l=
inux-gnueabi/python-pyudev-0.11-r0/pyudev-0.11/pyudev/device.py", line 35, =
in <module>
            from pyudev._libudev import libudev
          File "/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-l=
inux-gnueabi/python-pyudev-0.11-r0/pyudev-0.11/pyudev/_libudev.py", line 35=
, in <module>
            from ctypes import (CDLL, Structure, POINTER, get_errno,
          File "/oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/us=
r/lib/python2.6/ctypes/__init__.py", line 10, in <module>
            from _ctypes import Union, Structure, Array
        ImportError: No module named _ctypes
        + oefatal 'python setup.py build_ext execution failed.'
        + echo FATAL: 'python setup.py build_ext execution failed.'
        FATAL: python setup.py build_ext execution failed.
        + exit 1

`ctype` is available though.


Thanks,

Paul

--=-tDtUVMWz6s10QDm2fNQq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4V9agACgkQPX1aK2wOHVgZPQCeL0BUZ0ONP6IqfhJR8ZrNCN0I
JvoAnilX2Xpx/8ovk7HFCoCbVoHs+rrO
=kHZW
-----END PGP SIGNATURE-----

--=-tDtUVMWz6s10QDm2fNQq--
