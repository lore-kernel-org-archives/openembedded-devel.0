Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5AA5865D98
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 11:45:46 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so2975077eei.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 04:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YRsT854zJOBx9yFopjSlHPgy+FJ1yc98JLcGJuxUrHQ=;
	b=zdSGfRkLOmF9oO79RpTwvkgWP7KtRRTWr/J+skYCTTy0BuBo/6VWnA4GayVVMEWzHi
	P0Qf8Sy/1IEblqBzlzGi9HCQMMLNOE70vBEdKFwsa6yD3Ck94M7G6qVo+jdRHc0GLcZ2
	T+LNK3N+Oo3l16VLKzLy3TN5irSsIpNTT9T7++eupdhliPHDiUQxV6kdwQC5ITMqRA9H
	FWSskTGAuSf4oyBhoWCBkXt0EAUtsl26h62NXSQlw/k+dP/dbZh5zTMiCUzOLsG0e1az
	i4EeSAePOLPwFRoJrx21y6ywbdH4neJ3gMuU9RYvDiaBS/3B6gdMbr1GwKz39zP86S6y
	iyYg==
X-Received: by 10.15.90.201 with SMTP id q49mr2724197eez.65.1397994347630;
	Sun, 20 Apr 2014 04:45:47 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	s46sm93936296ees.3.2014.04.20.04.45.46 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 04:45:46 -0700 (PDT)
Date: Sun, 20 Apr 2014 13:45:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Message-ID: <20140420114551.GA2486@jama>
References: <1396688588-5440-1-git-send-email-trevor.woerner@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1396688588-5440-1-git-send-email-trevor.woerner@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org, Ulf Samuelsson <ulf@emagii.com>,
	patches@linaro.org
Subject: Re: [meta-xfce][PATCH] xfconf: remove unrecognized configure option
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
X-List-Received-Date: Sun, 20 Apr 2014 11:45:47 -0000
X-Groupsio-MsgNum: 49334
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dWDJ72qfEa57oDWE"
Content-Disposition: inline

--dWDJ72qfEa57oDWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 05, 2014 at 05:03:07AM -0400, Trevor Woerner wrote:
> This option was causing a QA warning:

Merged, thanks!

>=20
>     NOTE: QA Issue: xfconf: configure was passed unrecognised options: --=
with-sysroot
>=20
> Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
> ---
>  meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb b/meta-xfce/r=
ecipes-xfce/xfconf/xfconf_4.10.0.bb
> index aa6ad2c..bb8c337 100644
> --- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
> +++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
> @@ -7,7 +7,6 @@ DEPENDS =3D "dbus-glib libxfce4util perl"
>  inherit xfce
> =20
>  EXTRA_OECONF +=3D "PERL=3D${STAGING_DIR_TARGET}/usr/bin/perl"
> -EXTRA_OECONF +=3D "--with-sysroot=3Dyes"
> =20
>  SRC_URI +=3D "file://0001-Simplify-checks.patch"
>  SRC_URI[md5sum] =3D "4ed48150a03fb5f42b455494307b7f28"
> --=20
> 1.9.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dWDJ72qfEa57oDWE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTs28ACgkQN1Ujt2V2gBy28QCfeM7XmNB8N+aGCPP4XIhFAYal
y+EAoJOWm+W+cyKIiGY/QWPH6KUYS2Lh
=yKjn
-----END PGP SIGNATURE-----

--dWDJ72qfEa57oDWE--
