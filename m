Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 965F3610F7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 08:06:50 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so1538560ead.31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 01:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SFrcw2DlFZTHD3MTWpvsIQwtV+E946fZ646XZWDPet8=;
	b=MnSoPTNDxVlIy/thGF4Vvj+8pAvUz6+d8yFgV+6NfV1C7cl7N/IdyXrWWnWxs0ll2n
	s5owgtnTu8n7WVTW/+ULMnbL5eJf9B+CowSFtQQxoWMqQ66adLSbDH/h2BXUbMBES0JN
	RwpSxek5MarZaGG8eC6X45n+hPyk/A8BUl6SIFplD84ovCHU0kKdFJI7Cqqhj5NiU94G
	trwevZqfTIgG6djGZbLvoPZhYKjOdLrT0yoQhjA0fD5LvyeOzkSR2id5Fjerhle+42iB
	15yTTmQu01bw2eM7mXgVDURRp36BoWVBmfEX5H0NXs71Q2ZMHdve7q+c5UxJp2pxGvds
	LVVQ==
X-Received: by 10.15.98.9 with SMTP id bi9mr1146134eeb.67.1379923611839;
	Mon, 23 Sep 2013 01:06:51 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h45sm31235698eeg.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 23 Sep 2013 01:06:51 -0700 (PDT)
Date: Mon, 23 Sep 2013 10:06:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Message-ID: <20130923080651.GB3631@jama>
References: <1379910576-24363-1-git-send-email-trevor.woerner@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1379910576-24363-1-git-send-email-trevor.woerner@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][dylan][PATCH] qtwebkit 5.0.2: fix QA issue (bad RPATH)
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
X-List-Received-Date: Mon, 23 Sep 2013 08:06:51 -0000
X-Groupsio-MsgNum: 46290
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yVhtmJPUSI46BTXb"
Content-Disposition: inline

--yVhtmJPUSI46BTXb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2013 at 12:29:36AM -0400, Trevor Woerner wrote:
> Building qtwebkit would cause a QA issue (which, in my distro, would caus=
e a
> build error) such that QtWebPluginProcess and QtWebProcess would contain =
bad
> RPATHs which pointed into the build location. This fix adds a patch to not
> include the rpath.prf which leads to this problem.

Could you send patch for master/dora first and then backport it to
dylan? Otherwise I'll do it, but it will take a bit more time.

>=20
> Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
> ---
>  recipes-qt/qt5/qtwebkit-5.0.2/rpath.patch | 12 ++++++++++++
>  recipes-qt/qt5/qtwebkit_5.0.2.bb          |  3 +++
>  2 files changed, 15 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtwebkit-5.0.2/rpath.patch
>=20
> diff --git a/recipes-qt/qt5/qtwebkit-5.0.2/rpath.patch b/recipes-qt/qt5/q=
twebkit-5.0.2/rpath.patch
> new file mode 100644
> index 0000000..f74a5cf
> --- /dev/null
> +++ b/recipes-qt/qt5/qtwebkit-5.0.2/rpath.patch
> @@ -0,0 +1,12 @@
> +diff -urN qtwebkit-opensource-src-5.0.2/Tools/qmake/mkspecs/features/uni=
x/default_post.prf qtwebkit-opensource-src-5.0.2__new/Tools/qmake/mkspecs/f=
eatures/unix/default_post.prf
> +--- qtwebkit-opensource-src-5.0.2/Tools/qmake/mkspecs/features/unix/defa=
ult_post.prf	2013-04-08 20:11:53.000000000 -0400
> ++++ qtwebkit-opensource-src-5.0.2__new/Tools/qmake/mkspecs/features/unix=
/default_post.prf	2013-09-22 22:37:51.096270035 -0400
> +@@ -32,8 +32,6 @@
> +     QMAKE_OBJECTIVE_CFLAGS +=3D -Wno-c++11-extensions -Wno-c++0x-extens=
ions
> + }
> +=20
> +-contains(TEMPLATE, app): CONFIG +=3D rpath
> +-
> + isEqual(QT_ARCH,i386):CONFIG(debug, debug|release) {
> +   # Make ld not cache the symbol tables of input files in memory to avo=
id memory exhaustion during the linking phase.
> +   config_gnuld: QMAKE_LFLAGS +=3D -Wl,--no-keep-memory
> diff --git a/recipes-qt/qt5/qtwebkit_5.0.2.bb b/recipes-qt/qt5/qtwebkit_5=
=2E0.2.bb
> index 4d2f34d..1cad62b 100644
> --- a/recipes-qt/qt5/qtwebkit_5.0.2.bb
> +++ b/recipes-qt/qt5/qtwebkit_5.0.2.bb
> @@ -2,6 +2,9 @@ require qt5-${PV}.inc
>  require ${PN}.inc
> =20
>  PR =3D "${INC_PR}.0"
> +SRC_URI +=3D "\
> +	file://rpath.patch\
> +	"
> =20
>  SRC_URI[md5sum] =3D "85aad9f287910c21c8464d7d1ea010a9"
>  SRC_URI[sha256sum] =3D "6ff4038f8db68be51661d1a6646f510b26f6ebbecbdeefb7=
6cd8361f808768f6"
> --=20
> 1.8.4.rc3.1.gc1ebd90
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yVhtmJPUSI46BTXb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI/9psACgkQN1Ujt2V2gBwNLwCgmHGsq8cgnWNTxn4wiumU2fXe
XIcAnijcba5ZthfopsvH/AjeFrPI++xT
=cR77
-----END PGP SIGNATURE-----

--yVhtmJPUSI46BTXb--
