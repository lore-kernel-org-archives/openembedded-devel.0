Received: from mail-yh0-f51.google.com ([209.85.213.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFow4-0007sg-3u
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 17:54:17 +0100
Received: by mail-yh0-f51.google.com with SMTP id q1so205658yhf.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VEP+mLv+SGECJi+BvCdfd376Y137lkcthudI4G+aj30=;
	b=IjKM1vCMaFgm/bSLdNce7CSCnxEt8ylfd/Ab2fXUB88JXFpgSXsDa4KLTtQ7rtKGh9
	WTYVyvfY0Kl+Cx6AZOL5Hdxd74mAqa1EI8+jhJ2tVCpJlSlk735F1hs4lUp3BGGELP/9
	+Geo1yEDBxlaiBkHA1yEuZJVVuXdxCQxmNTV6keAJXktfaCU59lrUuFxizg/DQ0tTD9D
	bFX4lreO5uFUhZtgcvu15Rp5j21zA5hfSaNQEwx8R514IBDcxAVATKYYii0mHIzaVsLW
	QxuRw+p3kdxr9zv2tZofi7zN1T/X7J9fTnqMKFmxJa+PzuIkLnEvRuSfnAiZdrFbUa/s
	GqCQ==
X-Received: by 10.236.147.166 with SMTP id t26mr12900244yhj.0.1363192630883;
	Wed, 13 Mar 2013 09:37:10 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id c10sm36337064yhl.27.2013.03.13.09.37.08
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:37:09 -0700 (PDT)
Date: Wed, 13 Mar 2013 17:37:02 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313163702.GU3260@jama>
References: <1362461198-11403-1-git-send-email-raj.khem@gmail.com>
	<1362461198-11403-2-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1362461198-11403-2-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 2/2] bridge-utils: Upgrade to 1.5
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
X-List-Received-Date: Wed, 13 Mar 2013 16:54:34 -0000
X-Groupsio-MsgNum: 43532
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GMArzDD+OGn24EFp"
Content-Disposition: inline

--GMArzDD+OGn24EFp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2013 at 09:26:38PM -0800, Khem Raj wrote:
> Disable parallel make it does not work all the time
> Fix build with kernel-headers from 3.8

Applied, thanks!

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../bridge-utils/bridge-utils/kernel-headers.patch |   22 ++++++++++++++=
++++++
>  .../bridge-utils/bridge-utils_1.4.bb               |    6 ------
>  .../bridge-utils/bridge-utils_1.5.bb               |   11 ++++++++++
>  3 files changed, 33 insertions(+), 6 deletions(-)
>  create mode 100644 meta-oe/recipes-connectivity/bridge-utils/bridge-util=
s/kernel-headers.patch
>  delete mode 100644 meta-oe/recipes-connectivity/bridge-utils/bridge-util=
s_1.4.bb
>  create mode 100644 meta-oe/recipes-connectivity/bridge-utils/bridge-util=
s_1.5.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/bridge-utils/bridge-utils/kerne=
l-headers.patch b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils/ke=
rnel-headers.patch
> new file mode 100644
> index 0000000..de36f05
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils/kernel-heade=
rs.patch
> @@ -0,0 +1,22 @@
> +include missing kernel header
> +
> +Fixes errors like
> +
> +| /b/kraj/jlinux-next/poky/build/tmp-eglibc/sysroots/re-64b/usr/include/=
linux/if_bridge.h:172:20: error: field 'ip6' has incomplete type
> +| In file included from ../libbridge/libbridge.h:24:0,
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Pending
> +
> +Index: bridge-utils-1.5/libbridge/libbridge.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- bridge-utils-1.5.orig/libbridge/libbridge.h	2011-03-28 17:52:54.0000=
00000 -0700
> ++++ bridge-utils-1.5/libbridge/libbridge.h	2013-03-04 21:16:25.781188309=
 -0800
> +@@ -20,6 +20,7 @@
> + #define _LIBBRIDGE_H
> +=20
> + #include <sys/socket.h>
> ++#include <linux/in6.h>
> + #include <linux/if.h>
> + #include <linux/if_bridge.h>
> +=20
> diff --git a/meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.4.b=
b b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.4.bb
> deleted file mode 100644
> index 00a5815..0000000
> --- a/meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.4.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require bridge-utils.inc
> -
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df9d20a453221a1b7e32ae84694da2=
c37"
> -
> -SRC_URI[md5sum] =3D "0182fcac3a2b307113bbec34e5f1c673"
> -SRC_URI[sha256sum] =3D "876975e9bcc302aa8b829161ea3348b12b9b879f1db0dc98=
feaed8d0e5dd5933"
> diff --git a/meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.5.b=
b b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.5.bb
> new file mode 100644
> index 0000000..04f863b
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.5.bb
> @@ -0,0 +1,11 @@
> +require bridge-utils.inc
> +
> +SRC_URI +=3D "file://kernel-headers.patch"
> +
> +PARALLEL_MAKE =3D ""
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df9d20a453221a1b7e32ae84694da2=
c37"
> +
> +SRC_URI[md5sum] =3D "ec7b381160b340648dede58c31bb2238"
> +SRC_URI[sha256sum] =3D "42f9e5fb8f6c52e63a98a43b81bd281c227c529f194913e1=
c51ec48a393b6688"
> +
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GMArzDD+OGn24EFp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAqy4ACgkQN1Ujt2V2gBxIlgCfYVDWVrR39jfX1cBd49Bi3lKP
9qEAoJYMCBaD2/W8FMeI+s0dLVI9XVxP
=ZPNL
-----END PGP SIGNATURE-----

--GMArzDD+OGn24EFp--
