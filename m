Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 602D66AC3A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2015 11:48:01 +0000 (UTC)
Received: by wghl2 with SMTP id l2so15738920wgh.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2015 04:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eLNpcRdEW1Uz/IQqVn6U3vAYrveZU32mhI1wEwTFX84=;
	b=aRxm73DAaQlK6PLeY1SxK5SvzegdeTUVCtzsumY1Ei41ZQCPB72TSlqEvR30sP9uSL
	O21Dkdc8UREEJrdNsBpazucQkyYhUP/Ou0JqUiu9ZYLc7+uC9g2u9e6+0Ix+fn7hGaaq
	zsJe2ig92S8OlTChgMcT5K2MmXx0lWJuP6NGysUqXYVj3cZH/04/9ZDMwq5Ml6sFCPl9
	0oPhJ3ErkhMCGj2WuW7v4EuKeEbVrnTh+bgw/jql0T1nzOrYSujfBbpwx9h7ba29y9Dm
	N1i3/vyoFFxllKQcSKRfOcotFuDKyENsJvCC/5DyLby4CQ4Wnk/gwK6UKTCZDCJG4F5B
	Vymw==
X-Received: by 10.194.63.172 with SMTP id h12mr84992200wjs.48.1426160882691;
	Thu, 12 Mar 2015 04:48:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lj13sm10346407wic.9.2015.03.12.04.47.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Mar 2015 04:47:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Mar 2015 12:48:32 +0100
To: Frederico Cadete <frederico@cadete.eu>
Message-ID: <20150312114832.GC2338@jama>
References: <20150310172917.GF2340@jama>
	<1426019866-3634-1-git-send-email-frederico@cadete.eu>
MIME-Version: 1.0
In-Reply-To: <1426019866-3634-1-git-send-email-frederico@cadete.eu>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Frederico Cadete <frederico.cadete@awtce.be>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH v2] qt5-git, *qtbase*, qt5everywheredemo: Fetch from code.qt.io
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
X-List-Received-Date: Thu, 12 Mar 2015 11:48:02 -0000
X-Groupsio-MsgNum: 54753
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rQ2U398070+RC21q"
Content-Disposition: inline

--rQ2U398070+RC21q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2015 at 09:37:46PM +0100, Frederico Cadete wrote:
> From: Frederico Cadete <frederico.cadete@awtce.be>
>=20
> Gitorious disabled the git:// protocol, breaking fetches.
> Also, this service is scheduled to stop in May 2015, so move to
> code.qt.io.
>=20
> Signed-off-by: Frederico Cadete <frederico@cadete.eu>
> ---
>  recipes-qt/examples/qt5everywheredemo_1.0.bb | 2 +-
>  recipes-qt/qt5/nativesdk-qtbase_git.bb       | 2 +-
>  recipes-qt/qt5/qt5-git.inc                   | 2 +-
>  recipes-qt/qt5/qtbase-native_git.bb          | 2 +-
>  recipes-qt/qt5/qtbase_git.bb                 | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/recipes-qt/examples/qt5everywheredemo_1.0.bb b/recipes-qt/ex=
amples/qt5everywheredemo_1.0.bb
> index 4f7022c..60edaa4 100644
> --- a/recipes-qt/examples/qt5everywheredemo_1.0.bb
> +++ b/recipes-qt/examples/qt5everywheredemo_1.0.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://main.cpp;md5=3D1187cb795a0f9=
6bce64e63dd1a67dc2b"
>  DEPENDS =3D "qtdeclarative qtgraphicaleffects"
> =20
>  SRCREV =3D "9a868f96ee63c21ceda890d8dfc9d33f093d1b6d"
> -SRC_URI =3D "git://gitorious.org/qt-labs/qt5-everywhere-demo.git"
> +SRC_URI =3D "git://code.qt.io/qt-labs/qt5-everywhere-demo.git"

This one doesn't work:
WARNING: Failed to fetch URL git://code.qt.io/qt-labs/qt5-everywhere-demo.g=
it, attempting MIRRORS if available
ERROR: Fetcher failure: Unable to find revision 9a868f96ee63c21ceda890d8dfc=
9d33f093d1b6d in branch master even from upstream
ERROR: Function failed: Fetcher failure for URL: 'git://code.qt.io/qt-labs/=
qt5-everywhere-demo.git'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/armv5e-oe-linux-gnueabi/qt5everywheredemo/1.0-r0/temp/log.do_fetch=
=2E12973
NOTE: recipe qt5everywheredemo-1.0-r0: task do_fetch: Failed
ERROR: Task 6740 (/home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/examp=
les/qt5everywheredemo_1.0.bb, do_fetch) failed with exit code '1'

SRCREV 9a868f96ee63c21ceda890d8dfc9d33f093d1b6d doesn't exist on code.qt.io

It was initial commit in gitorious repo:
commit 9a868f96ee63c21ceda890d8dfc9d33f093d1b6d
Author: Sergio Ahumada <sergio.ahumada@digia.com>
Date:   Wed Jul 3 12:09:40 2013 +0200

    Initial commit

This is exactly matching with this commit in code.qt.io:
commit c17fe9e0ec0882ac4c4dc1168095f569acab5d09
Author: Kimmo Ollila <kimmo.ollila@digia.com>
Date:   Wed Jun 19 13:02:05 2013 +0300

    Fixed radio crash on application close
   =20
    Change-Id: Iaae40f9112e70ac9ac09b7127128560470e5ca91
    Reviewed-by: Lasse R=E4ih=E4 <lasse.raiha@digia.com>

So I'll update SRCREV in this recipe, you don't need to resend.

>  S =3D "${WORKDIR}/git/QtDemo"
> =20
> diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nati=
vesdk-qtbase_git.bb
> index 9194a83..df80407 100644
> --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
> +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> @@ -5,7 +5,7 @@ require ${PN}.inc
>  FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/${BPN}-git:"
> =20
>  SRC_URI =3D "\
> -    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRAN=
CH} \
> +    git://code.qt.io/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
>  "
> =20
>  # common for qtbase-native, qtbase-nativesdk and qtbase
> diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
> index da962b8..84ddf49 100644
> --- a/recipes-qt/qt5/qt5-git.inc
> +++ b/recipes-qt/qt5/qt5-git.inc
> @@ -5,7 +5,7 @@ QT_MODULE_BRANCH ?=3D "5.4"
> =20
>  # each module needs to define valid SRCREV
>  SRC_URI +=3D " \
> -    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRAN=
CH} \
> +    git://code.qt.io/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
>  "
> =20
>  S =3D "${WORKDIR}/git"
> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-=
native_git.bb
> index cebc021..5a308d4 100644
> --- a/recipes-qt/qt5/qtbase-native_git.bb
> +++ b/recipes-qt/qt5/qtbase-native_git.bb
> @@ -2,7 +2,7 @@ require qt5-git.inc
>  require ${PN}.inc
> =20
>  SRC_URI =3D "\   =20
> -    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRAN=
CH} \
> +    git://code.qt.io/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
>  "
> =20
>  # common for qtbase-native, qtbase-nativesdk and qtbase
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index d33eb68..549c92a 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -2,7 +2,7 @@ require qt5-git.inc
>  require ${PN}.inc
> =20
>  SRC_URI =3D "\
> -    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRAN=
CH} \
> +    git://code.qt.io/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
>  "
> =20
>  # common for qtbase-native, qtbase-nativesdk and qtbase
> --=20
> 2.1.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rQ2U398070+RC21q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUBfRAACgkQN1Ujt2V2gBzXMgCeKAZhGuYuOUiPYdt20n+LX5up
FgUAn2C1kCQEt68RS8/6+D2RqJ2JmWDg
=z9av
-----END PGP SIGNATURE-----

--rQ2U398070+RC21q--
