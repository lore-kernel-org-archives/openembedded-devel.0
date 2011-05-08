Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QIvzf-0008DN-Ob
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 06:53:23 +0200
Received: by fxm19 with SMTP id 19so3428594fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 21:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=bjI1QArzq3qOjlT/jCVuG7E1664wp8y9jOOKP6colto=;
	b=YzIYAq89mKR8Pm1VOoqAAdFLPiKA9Gl5oIeOIBBw2J62U4TdTBuhDxxgkSUvCWY7BC
	g2ACa4NVf0aC1WlKKdv8WoqAJIsBQzRyIYHFL5xgopBwW6WytRtzVZxDv6Iako3XQExR
	KpQ2QYhP6/AtivT9/N0cHouwX/lP8XNxjVZKo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=qrl7CAtwOG++sCYjC7R5YnuEPuPqQn4sVuopt4qItUbrFXG5tSfxTz64R+bkB0bypx
	cmnrO90GDSG9wdX8/5obOteENrJQk4Ut4WQrmfjSBvHkF3VcQ863PWcS7j8VDc/gH40Z
	tKv7fwBiyI11WPUudky15sBLo+HIV+6R0a4lQ=
Received: by 10.223.127.210 with SMTP id h18mr2312934fas.67.1304830240134;
	Sat, 07 May 2011 21:50:40 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id n7sm1565507fam.35.2011.05.07.21.50.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 21:50:38 -0700 (PDT)
Date: Sun, 8 May 2011 06:50:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110508045032.GG17773@jama.jama.net>
References: <1304822586-14872-1-git-send-email-otavio@ossystems.com.br>
	<1304822586-14872-11-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1304822586-14872-11-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH 11/11] qt4: fix 4.7.2 checksum
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
X-List-Received-Date: Sun, 08 May 2011 04:53:23 -0000
X-Groupsio-MsgNum: 31718
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uc35eWnScqDcQrv5"
Content-Disposition: inline

--uc35eWnScqDcQrv5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 08, 2011 at 02:43:06AM +0000, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-oe/recipes-qt/qt4/qt-4.7.2.inc                |    2 +-
>  meta-oe/recipes-qt/qt4/qt4-tools-native_4.7.2.bb   |    4 ++--
>  .../recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb    |    4 ++--
>  meta-oe/recipes-qt/qt4/qt4-tools-sdk_4.7.2.bb      |    4 ++--
>  4 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta-oe/recipes-qt/qt4/qt-4.7.2.inc b/meta-oe/recipes-qt/qt4=
/qt-4.7.2.inc
> index 70ee596..259ab2b 100644
> --- a/meta-oe/recipes-qt/qt4/qt-4.7.2.inc
> +++ b/meta-oe/recipes-qt/qt4/qt-4.7.2.inc
> @@ -14,7 +14,7 @@ SRC_URI =3D "http://get.qt.nokia.com/qt/source/qt-every=
where-opensource-src-${PV}.
>             file://linux.conf \
>             "
> =20
> -SRC_URI[md5sum] =3D "6f88d96507c84e9fea5bf3a71ebeb6d7"
> +SRC_URI[md5sum] =3D "66b992f5c21145df08c99d21847f4fdb"
>  SRC_URI[sha256sum] =3D "8cb5277c41f824cfc6dcee0e95e0bf23a9ad2c8d18d24510=
5137481d092b124a"

^^ what about sha here?

Regards,
> =20
>  S =3D "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
> diff --git a/meta-oe/recipes-qt/qt4/qt4-tools-native_4.7.2.bb b/meta-oe/r=
ecipes-qt/qt4/qt4-tools-native_4.7.2.bb
> index e9de510..d3c0eda 100644
> --- a/meta-oe/recipes-qt/qt4/qt4-tools-native_4.7.2.bb
> +++ b/meta-oe/recipes-qt/qt4/qt4-tools-native_4.7.2.bb
> @@ -9,5 +9,5 @@ EXTRA_OECONF +=3D " -no-fast -silent -no-rpath"
> =20
>  TOBUILD :=3D "src/tools/bootstrap ${TOBUILD}"
> =20
> -SRC_URI[md5sum] =3D "6f88d96507c84e9fea5bf3a71ebeb6d7"
> -SRC_URI[sha256sum] =3D "8cb5277c41f824cfc6dcee0e95e0bf23a9ad2c8d18d24510=
5137481d092b124a"
> +SRC_URI[md5sum] =3D "66b992f5c21145df08c99d21847f4fdb"
> +SRC_URI[sha256sum] =3D "d4783b524b90bcd270ccf6e7a30d5fb51696c47eb5de49eb=
c2d553cd3eb49336"
> diff --git a/meta-oe/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb b/meta-o=
e/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb
> index 091a539..a917ac4 100644
> --- a/meta-oe/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb
> +++ b/meta-oe/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb
> @@ -2,5 +2,5 @@ require qt4-tools-nativesdk.inc
> =20
>  PR =3D "${INC_PR}.0"
> =20
> -SRC_URI[md5sum] =3D "6f88d96507c84e9fea5bf3a71ebeb6d7"
> -SRC_URI[sha256sum] =3D "8cb5277c41f824cfc6dcee0e95e0bf23a9ad2c8d18d24510=
5137481d092b124a"
> +SRC_URI[md5sum] =3D "66b992f5c21145df08c99d21847f4fdb"
> +SRC_URI[sha256sum] =3D "d4783b524b90bcd270ccf6e7a30d5fb51696c47eb5de49eb=
c2d553cd3eb49336"
> diff --git a/meta-oe/recipes-qt/qt4/qt4-tools-sdk_4.7.2.bb b/meta-oe/reci=
pes-qt/qt4/qt4-tools-sdk_4.7.2.bb
> index 1018f74..c86ac2a 100644
> --- a/meta-oe/recipes-qt/qt4/qt4-tools-sdk_4.7.2.bb
> +++ b/meta-oe/recipes-qt/qt4/qt4-tools-sdk_4.7.2.bb
> @@ -4,5 +4,5 @@ PR =3D "${INC_PR}.0"
> =20
>  DEFAULT_PREFERENCE =3D "-1"
> =20
> -SRC_URI[md5sum] =3D "6f88d96507c84e9fea5bf3a71ebeb6d7"
> -SRC_URI[sha256sum] =3D "8cb5277c41f824cfc6dcee0e95e0bf23a9ad2c8d18d24510=
5137481d092b124a"
> +SRC_URI[md5sum] =3D "66b992f5c21145df08c99d21847f4fdb"
> +SRC_URI[sha256sum] =3D "d4783b524b90bcd270ccf6e7a30d5fb51696c47eb5de49eb=
c2d553cd3eb49336"
> --=20
> 1.7.2.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uc35eWnScqDcQrv5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3GIRgACgkQN1Ujt2V2gBxyuwCgog8JcCOcQFpYXaIvdb/0eVpX
iDQAoKHj66Yu1gVjv/4XdrZnZkW088/a
=mrPP
-----END PGP SIGNATURE-----

--uc35eWnScqDcQrv5--
