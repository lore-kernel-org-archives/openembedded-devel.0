Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id ECB976E8E6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2014 14:50:15 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id fa1so9276800pad.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2014 06:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=QiTud17ZpcOQQO3+6N//zpVi7pI9psEaFsEgEASQN+k=;
	b=pYuUi7SbdobOxn/w9HbwmW7B/5rD77yQJkNJ776CG3Uh02ac0DDNlqd4VeqWJ2mz2q
	DE/rikkZIa8KgEm3MlirQMW9cdJ6LRF2GTO1yrLNaOuRrxHylDIk1BOaJJCm5AkDSl/i
	SZbOcZw/Ks/E6SciNHMC7Zdc59zoAH6XWIvNUoY1AgqDl7+F5sxYXxe9nFLQX4YNaiW1
	vDFsX1BQWSLqpI16sYNNlprciuM2njquOLY48zftCO7DLIKLP6+Boh35YlNWULxQ4kJp
	ZBDQ3Lcq57OUXL+x8ztVjIAPisztEiviQ8oQXbIb4631owiQfEFOn2cbKsmnKM+YcOu/
	toww==
X-Received: by 10.67.14.231 with SMTP id fj7mr39122068pad.115.1392216616670;
	Wed, 12 Feb 2014 06:50:16 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30])
	by mx.google.com with ESMTPSA id e3sm64319237pbc.17.2014.02.12.06.50.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Feb 2014 06:50:15 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1392208980-13798-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
Date: Wed, 12 Feb 2014 06:50:13 -0800
Message-Id: <BDD3EE31-0A48-4267-9AD0-4139E6DED749@gmail.com>
References: <1392208980-13798-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1827)
Subject: Re: [PATCH] python-m2crypto: adding patch for x86-64 architectures
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
X-List-Received-Date: Wed, 12 Feb 2014 14:50:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Feb 12, 2014, at 4:43 AM, Lukas Bulwahn =
<lukas.bulwahn@oss.bmw-carit.de> wrote:

> After python-m2crypto was reported as failed task in bitbake world
> on 2014-02-08 by Martin Jansa, I investigate python-m2crypto with
> MACHINE =3D "qemux86-64" setting. When compiling python-m2crypto for
> qemux86-64, the setup.py aborts in the swig call with:
>=20
>  | swig -python =
-I[...]/tmp-eglibc/sysroots/qemux86-64/usr/include/python2.7 =
-I[...]/tmp-eglibc/sysroots/qemux86-64/usr/include -includeall -o =
SWIG/_m2crypto_wrap.c SWIG/_m2crypto.i
>  | =
[...]/tmp-eglibc/sysroots/qemux86-64/usr/include/openssl/opensslconf.h:41:=
 Error: Unable to find 'openssl/opensslconf-32.h'
>  | error: command 'swig' failed with exit status 1
>  | ERROR: python setup.py build_ext execution failed.
>  | WARNING: exit code 1 from a shell command.
>=20
> To compile for x86-64 architecture, opensslconf.h shall include
> opensslconf-64.h, not opensslconf-32.h. Properly including
> opensslconf-64.h can be configured through the bits/wordsize.h
> header and setting the __x86_64__ directive in the swig call. To
> set the directive, setup.py is patched for x86-64 architectures.
>=20

instead of patch you could do something like below in recipe

SWIG_FEATURES_x86-64 =3D "-D__x86_64__"
SWIG_FEATURES ?=3D ""
export SWIG_FEATURES


> Compiling python-m2crypto for qemumips still fails and needs
> further adjustments.

You probably need similar -D__mips__ flag for mips as well.

>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
> ---
> ...6_64__-directive-to-cross-compile-to-x86-.patch | 27 =
++++++++++++++++++++++
> .../python/python-m2crypto_0.21.1.bb               |  2 ++
> 2 files changed, 29 insertions(+)
> create mode 100644 =
meta-oe/recipes-devtools/python/python-m2crypto/0001-adding-__x86_64__-dir=
ective-to-cross-compile-to-x86-.patch
>=20
> diff --git =
a/meta-oe/recipes-devtools/python/python-m2crypto/0001-adding-__x86_64__-d=
irective-to-cross-compile-to-x86-.patch =
b/meta-oe/recipes-devtools/python/python-m2crypto/0001-adding-__x86_64__-d=
irective-to-cross-compile-to-x86-.patch
> new file mode 100644
> index 0000000..e6eb102
> --- /dev/null
> +++ =
b/meta-oe/recipes-devtools/python/python-m2crypto/0001-adding-__x86_64__-d=
irective-to-cross-compile-to-x86-.patch
> @@ -0,0 +1,27 @@
> +=46rom e5b6224d8bb17b7e30af7866ca1769268e8d862a Mon Sep 17 00:00:00 =
2001
> +From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
> +Date: Wed, 12 Feb 2014 10:40:43 +0100
> +Subject: [PATCH] adding __x86_64__ directive to cross-compile to =
x86-64
> +
> +Update-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
> +---
> + setup.py | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/setup.py b/setup.py
> +index 8deaa34..ecf2a12 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -55,6 +55,7 @@ class _M2CryptoBuildExt(build_ext.build_ext):
> +         self.swig_opts =3D ['-I%s' % i for i in self.include_dirs + =
\
> +                           [opensslIncludeDir]]
> +         self.swig_opts.append('-includeall')
> ++        self.swig_opts.append('-D__x86_64__')
> +         #self.swig_opts.append('-D__i386__') # Uncomment for early =
OpenSSL 0.9.7 versions, or on Fedora Core if build fails
> +         #self.swig_opts.append('-DOPENSSL_NO_EC') # Try uncommenting =
if you can't build with EC disabled
> +        =20
> +--=20
> +1.8.3.2
> +
> diff --git a/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb =
b/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
> index 9babc04..ca9ee99 100644
> --- a/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
> +++ b/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
> @@ -9,6 +9,8 @@ LIC_FILES_CHKSUM =3D =
"file://LICENCE;md5=3Db0e1f0b7d0ce8a62c18b1287b991800e"
> SRC_URI =3D =
"http://pypi.python.org/packages/source/M/M2Crypto/M2Crypto-${PV}.tar.gz =
\
>            =
file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch"
>=20
> +SRC_URI_append_x86-64 =3D " =
file://0001-adding-__x86_64__-directive-to-cross-compile-to-x86-.patch"
> +
> SRC_URI[md5sum] =3D "f93d8462ff7646397a9f77a2fe602d17"
> SRC_URI[sha256sum] =3D =
"25b94498505c2d800ee465db0cc1aff097b1615adc3ac042a1c85ceca264fc0a"
>=20
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


