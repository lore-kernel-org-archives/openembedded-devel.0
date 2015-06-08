Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id E2D2373D89
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jun 2015 17:04:57 +0000 (UTC)
Received: by wifx6 with SMTP id x6so93844500wif.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jun 2015 10:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=JXt6vcDwfCeTqvzrWpDOSADNeh9aXqgCDJzNmAO7rjI=;
	b=j6px3EWZ1JslGdVEXqh38PdFR0VXXMJmOJzRz0dIxnX7MDxxO8+92cuRlh5YA9QqSO
	xtmE1qehbr1Q2NJ13T6kWzTFEDZ8y0kvwadJsKqwaGwy40qDafftLQHcZpgFlh41jHQa
	cgjjr3FK+QMjlZbWOk2Nl39svU3nEsVWAYxnSDuOd/7vR2sx07Yyc/lQG3YIOmNrwQRO
	eMQThjwmzcyMsoJPcF5oh2K/y/nAqAEUo436zl25R6pvhuB996PXqZvwbiask6tSbFCb
	sPvV4/04qio5GEHPJjVvajClKtB2PZFTHtmK56wjRDAdSkMK5yYL3Yq6OTsSwt8uXen2
	qwtw==
X-Received: by 10.180.72.176 with SMTP id e16mr24612774wiv.12.1433783098753;
	Mon, 08 Jun 2015 10:04:58 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id q3sm5246173wjr.38.2015.06.08.10.04.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jun 2015 10:04:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 8 Jun 2015 19:05:03 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150608170503.GD2384@jama>
References: <1433782597-24380-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1433782597-24380-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH 1/2] qtbase: Fix build with musl
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
X-List-Received-Date: Mon, 08 Jun 2015 17:05:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 08, 2015 at 09:56:36AM -0700, Khem Raj wrote:
> This is a generic fix to accomodate musl which is adhering to posix
> and doesnt have legacy to carry, so lets invert the conditional so the
> special legacy case of glibc is checked and else part then covers rest
> of cases which are newer glibc/uclibc and musl

Can you prepare the patch in:
https://github.com/meta-qt5/qtbase/commits/b5.4-shared
and generate it with format-patch?

This way it's hard to see what's the real change and what's just
formating from different diff.

Thanks

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  | 43 ++++++++++------=
------
>  1 file changed, 19 insertions(+), 24 deletions(-)
>=20
> diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/r=
ecipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> index 0f6bcbe..d54079c 100644
> --- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> +++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> @@ -51,10 +51,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>   create mode 100644 mkspecs/linux-oe-g++/qmake.conf
>   create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
> =20
> -diff --git a/configure b/configure
> -index 6ce6753..0a00d6d 100755
> ---- a/configure
> -+++ b/configure
> +Index: git/configure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/configure
> ++++ git/configure
>  @@ -316,6 +316,16 @@ getQMakeConf()
>       getSingleQMakeVariable "$1" "$specvals"
>   }
> @@ -128,7 +128,7 @@ index 6ce6753..0a00d6d 100755
>  =20
>   TEST_COMPILER=3D$QMAKE_CONF_COMPILER
>  =20
> -@@ -3216,7 +3234,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" =3D "no" ]; then
> +@@ -3216,7 +3234,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" =3D "no" ]
>           exit 1
>       fi
>   fi
> @@ -152,7 +152,7 @@ index 6ce6753..0a00d6d 100755
>   # build qmake
>   if true; then ###[ '!' -f "$outpath/bin/qmake" ];
>       echo "Creating qmake..."
> -@@ -3725,14 +3751,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
> +@@ -3725,14 +3751,14 @@ if true; then ###[ '!' -f "$outpath/bin/
>           fi
>  =20
>           [ "$CFG_SILENT" =3D "yes" ] && CC_TRANSFORM=3D's,^,\@,' || CC_T=
RANSFORM=3D
> @@ -175,10 +175,10 @@ index 6ce6753..0a00d6d 100755
>  =20
>           if [ "$CFG_RELEASE_QMAKE" =3D "yes" ]; then
>               setBootstrapVariable QMAKE_CFLAGS_RELEASE
> -diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure=
=2Eprf
> -index 6b37a04..dcf6025 100644
> ---- a/mkspecs/features/configure.prf
> -+++ b/mkspecs/features/configure.prf
> +Index: git/mkspecs/features/configure.prf
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/mkspecs/features/configure.prf
> ++++ git/mkspecs/features/configure.prf
>  @@ -63,12 +63,12 @@ defineTest(qtCompileTest) {
>       }
>  =20
> @@ -194,11 +194,10 @@ index 6b37a04..dcf6025 100644
>               log("yes$$escape_expand(\\n)")
>               msg =3D "test $$1 succeeded"
>               write_file($$QMAKE_CONFIG_LOG, msg, append)
> -diff --git a/mkspecs/linux-oe-g++/qmake.conf b/mkspecs/linux-oe-g++/qmak=
e.conf
> -new file mode 100644
> -index 0000000..2ad2810
> +Index: git/mkspecs/linux-oe-g++/qmake.conf
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  --- /dev/null
> -+++ b/mkspecs/linux-oe-g++/qmake.conf
> ++++ git/mkspecs/linux-oe-g++/qmake.conf
>  @@ -0,0 +1,40 @@
>  +#
>  +# qmake configuration for linux-g++ with modifications for building wit=
h OpenEmbedded
> @@ -240,11 +239,10 @@ index 0000000..2ad2810
>  +isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG =3D $(OE_QMAKE_QT_CONFIG)
>  +
>  +load(qt_config)
> -diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++=
/qplatformdefs.h
> -new file mode 100644
> -index 0000000..dd12003
> +Index: git/mkspecs/linux-oe-g++/qplatformdefs.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  --- /dev/null
> -+++ b/mkspecs/linux-oe-g++/qplatformdefs.h
> ++++ git/mkspecs/linux-oe-g++/qplatformdefs.h
>  @@ -0,0 +1,100 @@
>  +/**********************************************************************=
******
>  +**
> @@ -334,10 +332,10 @@ index 0000000..dd12003
>  +
>  +#undef QT_SOCKLEN_T
>  +
> -+#if defined(__GLIBC__) && (__GLIBC__ >=3D 2)
> -+#define QT_SOCKLEN_T            socklen_t
> -+#else
> ++#if defined(__GLIBC__) && (__GLIBC__ < 2)
>  +#define QT_SOCKLEN_T            int
> ++#else
> ++#define QT_SOCKLEN_T            socklen_t
>  +#endif
>  +
>  +#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >=3D 500)
> @@ -346,6 +344,3 @@ index 0000000..dd12003
>  +#endif
>  +
>  +#endif // QPLATFORMDEFS_H
> ---=20
> -2.4.2
> -
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

