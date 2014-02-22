Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8F9236E3E0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2014 08:04:29 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id e53so461009eek.18
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2014 00:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yVkkln0EccW27apW4j5Px2pg7RNLn6PX6Etyc8RLxT4=;
	b=pU/V9qaTRcwSrEtse+nzF/zrIfvmfx8R8dicqYzdF09TaRQ5mi14G9yCjUMblzC5qo
	NZ17hAdi63CY9LxCGOO6MzppEElHVGdkvsaoAqT4WhxvyxolSlrW77TSYl0CYv2yDQ2X
	KRBf576WQ85xVuhb1r3yL27pXwDeVjV4y/ugHu8KvYQsEieN62odMT8MigctdzkDxFQi
	y2aa5i73c47CJuDs6ZbPTr5NlEWFMXZrFgqNrppCNnN4uNpGrY9k7Y/8qqqHtELkYlqm
	W76h20oBt0ZnD1ZeAfc/yXhxmj+uC3cm41riOvnSfjA5ljQiTG94vOuMcwzF1Q54y6DG
	if8g==
X-Received: by 10.14.221.4 with SMTP id q4mr12727843eep.47.1393056269848;
	Sat, 22 Feb 2014 00:04:29 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	43sm34158018eeh.13.2014.02.22.00.04.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Feb 2014 00:04:28 -0800 (PST)
Date: Sat, 22 Feb 2014 09:05:05 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140222080505.GK3854@jama>
References: <1392916331-30391-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1392916331-30391-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-qt5][PATCHv2] nativesdk-qtbase: do qmake replacement in ${D} instead of ${B}
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
X-List-Received-Date: Sat, 22 Feb 2014 08:04:33 -0000
X-Groupsio-MsgNum: 48265
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Tv3+oRj6D9L8lW+H"
Content-Disposition: inline

--Tv3+oRj6D9L8lW+H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2014 at 12:12:11PM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> * This way we don't mangle ${B} and can repeat do_install if necessary. A=
nd
>   previously it would require running do_compile again to restore the pro=
per
>   state of ${B}.
> * Need to bump PR, since do_compile isn't changing, but needs to re-run to
>   re-populate qmake-real binary.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-qt/qt5/nativesdk-qtbase.inc | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/natives=
dk-qtbase.inc
> index fa44009..3cb9b0e 100644
> --- a/recipes-qt/qt5/nativesdk-qtbase.inc
> +++ b/recipes-qt/qt5/nativesdk-qtbase.inc
> @@ -10,6 +10,8 @@ require nativesdk-qt5.inc
>  # it's already included with newer oe-core, but include it here for dylan
>  FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/qtbase:"
> =20
> +PR =3D "r1"
> +

It's already merged, but please don't add new PRs, especially to .inc
files.

>  # common with -native and target version
>  SRC_URI +=3D "\
>      file://0001-Add-linux-oe-g-platform.patch \
> @@ -192,14 +194,12 @@ do_install() {
>      # Fix install paths for all
>      find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR=
_NATIVE}${STAGING_DIR_NATIVE},(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
> =20
> -    # switch back the proper qmake
> -    if [ -e ${B}/bin/qmake-real ]; then
> -        rm ${B}/bin/qmake
> -        mv ${B}/bin/qmake-real ${B}/bin/qmake
> -    fi
> -
>      oe_runmake install INSTALL_ROOT=3D${D}
> =20
> +    # replace the native qmake installed above with nativesdk version
> +    rm -rf ${D}${OE_QMAKE_PATH_HOST_BINS}/qmake
> +    install -m 755 ${B}/bin/qmake-real ${D}${OE_QMAKE_PATH_HOST_BINS}/qm=
ake
> +
>      # for modules which are still using syncqt and call qtPrepareTool(QM=
AKE_SYNCQT, syncqt)
>      # e.g. qt3d, qtwayland
>      ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Tv3+oRj6D9L8lW+H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMIWjEACgkQN1Ujt2V2gBw3AACcD2p4YLCnRXFjg2rymt6HsFrB
E5MAnA9T0/DrkCIdLE/oLec1bicXINWW
=/mF0
-----END PGP SIGNATURE-----

--Tv3+oRj6D9L8lW+H--
