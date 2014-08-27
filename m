Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 98401710CE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 10:52:18 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id pn19so29591lab.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 03:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kIeW8fICBTVUwjN7GHT/uq/GSb5Aho2pLH+lk/Za6Zs=;
	b=V1GwrJ0ELoZxQDUoVQoA5AQBV5tVoOYBN+mv3ixVeiQuEzv2CaKGrq5RefjRPvOnND
	+J8xb+O4T8M8587vObnQ0K4uFD7ags/yPy7C6iEYQvohADgylwcCg4H+CIY/X14Nw/ya
	H6zSAgw/Riso9xqDOywBt5v4pfbBXQY3YpRPOx6DQOVaRXdicldfHXzf1LT4+Bkl8tSG
	YfJHa+jGEfu0lFkczOXz7LmbTgUp5jf9c4VUhx9O1rsYtchau2aQTdlb+zBcsVyZH7NC
	/99TuHChJnXg/zZgFVjYUKH2CtCbWyFj0l5EgCe4flP5y9MGeIaSYUYZwGIdZs+FXb2D
	xQVw==
X-Received: by 10.152.207.99 with SMTP id lv3mr8939509lac.22.1409136739700;
	Wed, 27 Aug 2014 03:52:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id py4sm73558lbb.4.2014.08.27.03.52.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Aug 2014 03:52:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Aug 2014 12:52:26 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140827105226.GB20524@jama>
References: <1409018848-4649-1-git-send-email-xiao.zhang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1409018848-4649-1-git-send-email-xiao.zhang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] beecrypt: add config option --with-dev-dsp
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
X-List-Received-Date: Wed, 27 Aug 2014 10:52:20 -0000
X-Groupsio-MsgNum: 51869
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pcjGMRtmGLNVN1Bo"
Content-Disposition: inline

--pcjGMRtmGLNVN1Bo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2014 at 10:07:28AM +0800, Zhang Xiao wrote:
> Add this configure option for developer to control if the
> /dev/dsp should be used on target. Instead of judging it
> based on the very device file of build server.

wrong ML.. belongs to oe-core

>=20
> Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
> ---
>  .../beecrypt/beecrypt/add-option-dev-dsp.patch     | 34 ++++++++++++++++=
++++++
>  meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-support/beecrypt/beecrypt/add-option-dev=
-dsp.patch
>=20
> diff --git a/meta/recipes-support/beecrypt/beecrypt/add-option-dev-dsp.pa=
tch b/meta/recipes-support/beecrypt/beecrypt/add-option-dev-dsp.patch
> new file mode 100644
> index 0000000..83b6f7a
> --- /dev/null
> +++ b/meta/recipes-support/beecrypt/beecrypt/add-option-dev-dsp.patch
> @@ -0,0 +1,34 @@
> +Upstream-Status: Pending
> +
> +---
> + configure.ac |   12 +++++++++++-
> + 1 file changed, 11 insertions(+), 1 deletion(-)
> +
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -106,6 +106,16 @@ AC_ARG_WITH(python,[  --with-python[[=3DAR
> +   fi
> +   ])
> +=20
> ++AC_ARG_WITH(dev-dsp,[  --with-dev-dsp          enables dev/dsp for entr=
opy producing. auto for auto-detecting dev/dep on host. [[default=3Dno]]],[
> ++  if test "$withval" =3D yes; then
> ++    AC_DEFINE([HAVE_DEV_DSP], 1)
> ++  else
> ++    if test "$withval" =3D auto;  then
> ++      ac_detect_dev_dsp=3Dyes
> ++    fi
> ++  fi
> ++  ],[ac_detect_dev_dsp=3Dno])
> ++
> + # Check for expert mode
> + if test "$ac_enable_expert_mode" =3D yes; then
> +   BEE_EXPERT_MODE
> +@@ -464,7 +474,7 @@ linux*)
> +       ac_cv_have_dev_dsp=3Dno
> +     fi
> +     ])
> +-  if test "$ac_cv_have_dev_dsp" =3D yes; then
> ++  if test "$ac_cv_have_dev_dsp" =3D yes && test "$ac_detect_dev_dsp" =
=3D yes; then
> +     AC_DEFINE([HAVE_DEV_DSP], 1)
> +   fi
> +   ;;
> diff --git a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb b/meta/recip=
es-support/beecrypt/beecrypt_4.2.1.bb
> index 209b92e..1e626f1 100644
> --- a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
> +++ b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
> @@ -11,6 +11,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/beecrypt/beecrypt-${=
PV}.tar.gz \
>             file://fix-for-gcc-4.7.patch \
>             file://run-ptest \
>             file://beecrypt-enable-ptest-support.patch \
> +           file://add-option-dev-dsp.patch \
>            "
> =20
>  SRC_URI[md5sum] =3D "8441c014170823f2dff97e33df55af1e"
> --=20
> 1.8.5.2.233.g932f7e4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pcjGMRtmGLNVN1Bo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP9uGoACgkQN1Ujt2V2gBwk0ACgsgW1YTJG5UpDMyIIoHcDCXKz
34wAnRqYFxWbWJfNhhpYxqT08IVj7b4t
=+PHr
-----END PGP SIGNATURE-----

--pcjGMRtmGLNVN1Bo--
