Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5B9E577129
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 06:45:51 +0000 (UTC)
Received: by pabrc13 with SMTP id rc13so111629395pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 23:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=abvYi/1du2EY2pPICmrT0JgrcAxQW0iI8FKsxBjCDRo=;
	b=bNUrTUSVX3hXt69832vDbp//nciwruwtHvGG6f/sniqKNojPQxap1IY70mv4Oe+NQc
	rM6PoNQk+TS708/v2ifzrKElggwvWHMNKtJ5QwvOUxsngwRtPyQ2MN5++5RckZGBj914
	qOTpEOUSPhmIlnKROvqNpjsiYXynZwwovSDE791g3+40qw6FGa8NYDahRsDO6klnUbJZ
	R+C+qIz9uZHviu28Ls1tXl67+O+jpA3ikrKpyCAbQnZcssJ6YHkNq0MsnbvvxCaCEHPv
	Oswa/5tDW7jz1w34+dwohGlHjyZCLCUQNcYGmN1kLJFFSh/DMvYBMrkg45DeU5CCglAh
	X33w==
X-Received: by 10.68.161.162 with SMTP id xt2mr14575011pbb.89.1444977951437;
	Thu, 15 Oct 2015 23:45:51 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:c84b:e0f3:fc98:e745?
	([2601:646:8601:4580:c84b:e0f3:fc98:e745])
	by smtp.gmail.com with ESMTPSA id
	we9sm19223398pab.3.2015.10.15.23.45.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Oct 2015 23:45:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.1 \(3096.4\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1444903231-16227-1-git-send-email-samuli.piippo@theqtcompany.com>
Date: Thu, 15 Oct 2015 23:45:50 -0700
Message-Id: <10921D7A-9479-4B97-BDFE-CAE8F871203E@gmail.com>
References: <1444903231-16227-1-git-send-email-samuli.piippo@theqtcompany.com>
To: Martin Jansa <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3096.4)
Subject: Re: [meta-qt5][PATCH] qt5: use extra .pri file from linux-oe-g++ mkspec
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
X-List-Received-Date: Fri, 16 Oct 2015 06:45:55 -0000
X-Groupsio-MsgNum: 57863
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8ED0BDE1-D3F5-41B8-B965-FC0CF48C1B7A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8ED0BDE1-D3F5-41B8-B965-FC0CF48C1B7A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 15, 2015, at 3:00 AM, Samuli Piippo =
<samuli.piippo@theqtcompany.com> wrote:
>=20
> Load additional oe-device-extra.pri in the default linux-oe-g++ mkspec =
to
> allow simple changing of target dependent values. This is useful for =
any
> target that needs to specify e.g., QMAKE_LIBS_EGL or other additional =
configs.
>=20
> Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
> ---
> recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch | 10 =
++++++----
> 1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch =
b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> index e67df40..91bb9f3 100644
> --- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> +++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> @@ -45,9 +45,9 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  configure                            |  70 +++++++++++++++---------
>  mkspecs/features/configure.prf       |   4 +-
> - mkspecs/linux-oe-g++/qmake.conf      |  40 ++++++++++++++
> + mkspecs/linux-oe-g++/qmake.conf      |  42 +++++++++++++++
>  mkspecs/linux-oe-g++/qplatformdefs.h | 100 =
+++++++++++++++++++++++++++++++++++
> - 4 files changed, 186 insertions(+), 28 deletions(-)
> + 4 files changed, 188 insertions(+), 28 deletions(-)
>  create mode 100644 mkspecs/linux-oe-g++/qmake.conf
>  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
>=20
> @@ -197,10 +197,10 @@ index 6b37a04..dcf6025 100644
>              write_file($$QMAKE_CONFIG_LOG, msg, append)
> diff --git a/mkspecs/linux-oe-g++/qmake.conf =
b/mkspecs/linux-oe-g++/qmake.conf
> new file mode 100644
> -index 0000000..2ad2810
> +index 0000000..d0a4166
> --- /dev/null
> +++ b/mkspecs/linux-oe-g++/qmake.conf
> -@@ -0,0 +1,40 @@
> +@@ -0,0 +1,42 @@
> +#
> +# qmake configuration for linux-g++ with modifications for building =
with OpenEmbedded
> +#
> @@ -240,6 +240,8 @@ index 0000000..2ad2810
> +# for the SDK
> +isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG =3D $(OE_QMAKE_QT_CONFIG)
> +
> ++exists(../oe-device-extra.pri):include(../oe-device-extra.pri)
> ++

we should try to handle it with pkgconfig, doing it like this will make =
the qt recipes to be machine
specific. Lets not do that if possible. with QT5 we have QPA =
architecture if need be divide the plugins
into separate recipes and compile them as machine specific.

> +load(qt_config)
> diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h =
b/mkspecs/linux-oe-g++/qplatformdefs.h
> new file mode 100644
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_8ED0BDE1-D3F5-41B8-B965-FC0CF48C1B7A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYgnR4ACgkQuwUzVZGdMxSQjwCeMqDmsi/1Vsqaz4JWSRr8pNv7
rsQAnR97qOkfb9CDiE+O1Y9BU8317JhT
=xwM0
-----END PGP SIGNATURE-----

--Apple-Mail=_8ED0BDE1-D3F5-41B8-B965-FC0CF48C1B7A--
