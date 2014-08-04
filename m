Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id D7B5B60703
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Aug 2014 16:14:12 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so5419548wiv.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Aug 2014 09:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9USyO3FtygWWjWvBV38wMACcTZFyEuIS0jzXc3NfQ6o=;
	b=VqJgtVY+6vb7W+ituXgXB7hOlCtj2g6C8/tvkBN7dq+8kMltZrQi835t0nrbX0kZTe
	n9Xo/Bi3g6rQl0KCXiiVIxO9d8iydd5/UO+RJ7lDNrlc/MXaC/WxU81U7fidaNqSEtE2
	u7EKtlpcxco6ejtO2L2z3QxpXwGgQcnI+sPFBSILUSDReHPm9j1pLnkREwMQDXuGs01R
	bPiBlijQhHiZBeXz9Zj/K7u0LBZZ0fEQAOXjlxlJmMXIhQpI9Ugoot94WPe1KtryHzUW
	3/IGlLLrB+7L98SzPhraMxl6bDeuGzquKtwAwy3r2xFh4KisOdgjxq4A0ysPw6pbz/Bw
	gkxw==
X-Received: by 10.180.88.167 with SMTP id bh7mr32187183wib.12.1407168852073;
	Mon, 04 Aug 2014 09:14:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h3sm44540489wjn.10.2014.08.04.09.14.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Aug 2014 09:14:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 4 Aug 2014 18:14:38 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140804161438.GC2465@jama>
References: <1406900096-31368-1-git-send-email-koen@dominion.thruhere.net>
	<1406900096-31368-7-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1406900096-31368-7-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-gnome][PATCH 07/10] abiword: remove blacklist, libgsf and sv have been fixed
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
X-List-Received-Date: Mon, 04 Aug 2014 16:14:23 -0000
X-Groupsio-MsgNum: 51408
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GZVR6ND4mMseVXL/"
Content-Disposition: inline

--GZVR6ND4mMseVXL/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 01, 2014 at 03:34:53PM +0200, Koen Kooi wrote:
> Also disable collab service due to gnutls build errors.

abiword also depends on libwmf-native which is still broken

| checking for XML_ParserFree in -lexpat... yes
| checking for freetype-config... /home/jenkins/oe/world/shr-core/tmp-eglib=
c/sysroots/x86_64-linux/usr/bin/freetype-config
| checking for FT_Init_FreeType in -lfreetype... yes
| checking ft2build.h usability... no
| checking ft2build.h presence... no
| checking for ft2build.h... no
| configure: error: * * * freetype(2) is required * * *
| Configure failed. The contents of all config.log files follows to aid deb=
ugging
| ERROR: oe_runconf failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /home/jenkin=
s/oe/world/shr-core/tmp-eglibc/work/x86_64-linux/libwmf-native/0.2.8.4-r3/t=
emp/log.do_configure.22003)
NOTE: recipe libwmf-native-0.2.8.4-r3: task do_configure: Failed
ERROR: Task 28608 (virtual:native:/home/jenkins/oe/world/shr-core/meta-open=
embedded/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb, do_configure) f=
ailed with exit code '1'

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb b/meta-gno=
me/recipes-gnome/abiword/abiword_3.0.0.bb
> index 7cd6c65..eb4bba2 100644
> --- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
> +++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
> @@ -14,8 +14,6 @@ SRC_URI =3D "http://www.abisource.com/downloads/${BPN}/=
${PV}/source/${BP}.tar.gz \
>             file://autogen-common.sh \
>  "
> =20
> -PNBLACKLIST[abiword] =3D "BROKEN: depends on broken wv -> libgsf"
> -
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc5edcc3ccd864b19004d14e9c1c9a=
26a"
> =20
>  SRC_URI[md5sum] =3D "8d9c41cff3a8fbef8d0c835c65600e65"
> @@ -26,7 +24,7 @@ SHRT_VER =3D "${@d.getVar('PV',1).split('.')[0]}.${@d.g=
etVar('PV',1).split('.')[1]
> =20
>  inherit autotools-brokensep pkgconfig
> =20
> -PACKAGECONFIG ??=3D "collab-backend-xmpp collab-backend-tcp collab-backe=
nd-service"
> +PACKAGECONFIG ??=3D "collab-backend-xmpp collab-backend-tcp"
>  PACKAGECONFIG[spell] =3D "--enable-spell,--disable-spell,enchant"
>  PACKAGECONFIG[collab-backend-xmpp] =3D "--enable-collab-backend-xmpp,--d=
isable-collab-backend-xmpp,libgsf libxml2 loudmouth"
>  PACKAGECONFIG[collab-backend-tcp] =3D "--enable-collab-backend-tcp,--dis=
able-collab-backend-tcp,libgsf libxml2"
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GZVR6ND4mMseVXL/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPfsW4ACgkQN1Ujt2V2gBw9HACfRAE0elaljgSa2Gc+c2o2z02/
DM0AnRJ1Ljg/zi+AvciD6/JmPWacAri8
=/PUi
-----END PGP SIGNATURE-----

--GZVR6ND4mMseVXL/--
