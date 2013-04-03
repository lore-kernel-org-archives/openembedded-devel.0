Received: from mail-da0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UNOlw-00074S-4m
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 16:34:44 +0200
Received: by mail-da0-f43.google.com with SMTP id u36so693863dak.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2013 07:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=p6Wnetm1clNq3+pDPqumgYssCuXL6NI8pollq71WoKU=;
	b=TxQbcxa5PHdr+6AOfBwNI3SYKEJX/11+6+vCsa/Jd9+QaWRQM4xkLLmxssUzIcqnoE
	InQK/mINngOZvcm8vL4J+4pOQd0jrPeW4lNxpH6OdUhP7Bc580971FmvRjlmJvK6BgYg
	+WveBZly8Ct4fPH93rx9UmIIwK/VGUgUTZKSKklwfvHxWvtUu1cviajd032J8A74YPXt
	5NQVR+2qele1dTUoo7WIA0zQf9d7g8N1HOiy1yh8ZYvnUVklzfoUIK7C2xF+2xDgD0pv
	9L4sKPTcZLuVIR7r7hFrZISkG64XAAJBwxW1sbvo9dMfScSA+AVqU6nX+ZbQWPtNYNMO
	CXGA==
X-Received: by 10.66.25.147 with SMTP id c19mr3380376pag.207.1364998651686;
	Wed, 03 Apr 2013 07:17:31 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id fk1sm6156120pbd.36.2013.04.03.07.17.30
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Apr 2013 07:17:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1364997019-23273-1-git-send-email-stefan@herbrechtsmeier.net>
Date: Wed, 3 Apr 2013 07:17:38 -0700
Message-Id: <24CFFAEA-7DF1-44A1-88E3-3CA2DE01D70C@gmail.com>
References: <1364997019-23273-1-git-send-email-stefan@herbrechtsmeier.net>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Subject: Re: [meta-oe][PATCH] cryptsetup: Update to latest version and use openssl as crypto backend
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
X-List-Received-Date: Wed, 03 Apr 2013 14:34:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Stefan

On Apr 3, 2013, at 6:50 AM, Stefan Herbrechtsmeier =
<stefan@herbrechtsmeier.net> wrote:

> Cryptsetup with the command luksOpen failed with the error message:
> device-mapper: status ioctl failed: Permission denied
>=20
> The error comes from libgcrypt with drops root privileges if it is
> linked with libcap support [1]. Update cryptsetup to latest version
> and change the crypto backend to openssl as libgcrypt states this
> behaviour as a feature [2].
>=20
> The license was updated to GPLv2 with OpenSSL exception.
>=20
> [1] http://code.google.com/p/cryptsetup/issues/detail?id=3D47
> [2] https://bugs.g10code.com/gnupg/issue1181
>=20
> Signed-off-by: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
> ---
> .../recipes-support/cryptsetup/cryptsetup_1.1.3.bb |   18 =
--------------
> .../recipes-support/cryptsetup/cryptsetup_1.6.1.bb |   25 =
++++++++++++++++++++
> 2 files changed, 25 insertions(+), 18 deletions(-)
> delete mode 100644 =
meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb
> create mode 100644 =
meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb
>=20

would be nice if you use git format-patch -M ..

> diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb =
b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb
> deleted file mode 100644
> index 254f563..0000000
> --- a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -DESCRIPTION =3D "Setup virtual encryption devices under dm-crypt =
Linux"
> -HOMEPAGE =3D "http://code.google.com/p/cryptsetup/"
> -SECTION =3D "console"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f"
> -
> -DEPENDS =3D "util-linux lvm2 libgcrypt popt"
> -RRECOMMENDS_${PN} =3D "kernel-module-aes \
> -                     kernel-module-dm-crypt \
> -                     kernel-module-md5 \
> -                     kernel-module-cbc \
> -                     kernel-module-sha256 \
> -                    "
> -SRC_URI =3D =
"http://cryptsetup.googlecode.com/files/cryptsetup-${PV}.tar.bz2"
> -SRC_URI[md5sum] =3D "318a64470861ea5b92a52f2014f1e7c1"
> -SRC_URI[sha256sum] =3D =
"9c8e68a272f6d9cfb6cd65cc0743f4c44a2096c61f74e0602bf40208b5e69c0a"
> -
> -inherit autotools gettext
> diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb =
b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb
> new file mode 100644
> index 0000000..ade69f4
> --- /dev/null
> +++ b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb
> @@ -0,0 +1,25 @@
> +DESCRIPTION =3D "Setup virtual encryption devices under dm-crypt =
Linux"
> +HOMEPAGE =3D "http://code.google.com/p/cryptsetup/"
> +SECTION =3D "console"
> +LICENSE =3D "GPL-2.0-with-OpenSSL-exception"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D32107dd283b1dfeb66c9b3e6be312326"
> +
> +DEPENDS =3D "util-linux lvm2 openssl popt"
> +RRECOMMENDS_${PN} =3D "kernel-module-aes-generic \
> +                     kernel-module-dm-crypt \
> +                     kernel-module-md5 \
> +                     kernel-module-cbc \
> +                     kernel-module-sha256-generic \
> +                     "
> +
> +PR =3D "r1"

You can drop PR=20

> +
> +SRC_URI =3D =
"http://cryptsetup.googlecode.com/files/cryptsetup-${PV}.tar.bz2"
> +SRC_URI[md5sum] =3D "f374d11e3b0e7ca0f805756fd02e34ff"
> +SRC_URI[sha256sum] =3D =
"baf36e663c03eb6440482d91c486d61ed47ce5c9268ad04c18ca09082755149c"
> +
> +inherit autotools gettext
> +
> +# Use openssl because libgcrypt drops root privileges
> +# if libgcrypt is linked with libcap support
> +EXTRA_OECONF =3D "--with-crypto_backend=3Dopenssl"


hmmmm, may be using packageconfig here would be better

> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



