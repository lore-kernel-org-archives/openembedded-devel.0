Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 987B865DEB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 10:07:29 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so5015681wiv.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 03:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IGN4FjBuMB64LxABBHUBCGQob6qCbYYuTKY7fkmwxf8=;
	b=UwoRf8KTJVOIa033T5PH4ybuwbuVjFtU5prcwd3FdbkOQuUAZkTuiLsuF0yRq8pd3o
	nHbsPTPxsUbLWlRJVVFjmzHEcIgmmYwn5tmfMxNpdF2x2Tb9sEfQ8lipHPHD8p7j6NZc
	YnSg8i/6jlD1fxvuuFQwn+9XeLBIxm/bbI5b5A780Jmr8cDxxURuaaGqiw07RLRa4d1b
	3DnbnsJugC06Z9r91g0VfZSmOwjAt99ss/VqcOL8pOh1YCU9dz44tiCG8Zeds7itxoD7
	eJi02hq1zCilStzKQC1dgC3mXk8DfvgFgJ12HnXRPWUQ8PZilWEluONVYjOWukvov8+B
	8FMw==
X-Received: by 10.194.110.135 with SMTP id ia7mr1417189wjb.128.1408442850786; 
	Tue, 19 Aug 2014 03:07:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ge8sm47182795wib.4.2014.08.19.03.07.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Aug 2014 03:07:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 19 Aug 2014 12:07:31 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140819100731.GO3660@jama>
References: <1408431709-5955-1-git-send-email-b40869@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1408431709-5955-1-git-send-email-b40869@freescale.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: YangHaibo <b40869@freescale.com>
Subject: Re: [meta-oe][meta-webserver][PATCH] move fcgi-2.4.0 recipe and patch to correct folder
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
X-List-Received-Date: Tue, 19 Aug 2014 10:07:33 -0000
X-Groupsio-MsgNum: 51772
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dT+85zccSFkyJC53"
Content-Disposition: inline

--dT+85zccSFkyJC53
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2014 at 03:01:49PM +0800, YangHaibo wrote:
> ---
>  meta-webserver/recipes-support/{ =3D> fcgi}/fcgi_2.4.0.bb               =
    | 0
>  .../recipes-support/fcgi/{ =3D> files}/Fix_EOF_not_declared_issue.patch =
    | 0
>  .../fcgi/{ =3D> files}/add_foreign_to_AM_INIT_AUTOMAKE.patch            =
    | 0
>  3 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta-webserver/recipes-support/{ =3D> fcgi}/fcgi_2.4.0.bb (100%)
>  rename meta-webserver/recipes-support/fcgi/{ =3D> files}/Fix_EOF_not_dec=
lared_issue.patch (100%)
>  rename meta-webserver/recipes-support/fcgi/{ =3D> files}/add_foreign_to_=
AM_INIT_AUTOMAKE.patch (100%)
>=20
> diff --git a/meta-webserver/recipes-support/fcgi_2.4.0.bb b/meta-webserve=
r/recipes-support/fcgi/fcgi_2.4.0.bb
> similarity index 100%
> rename from meta-webserver/recipes-support/fcgi_2.4.0.bb
> rename to meta-webserver/recipes-support/fcgi/fcgi_2.4.0.bb
> diff --git a/meta-webserver/recipes-support/fcgi/Fix_EOF_not_declared_iss=
ue.patch b/meta-webserver/recipes-support/fcgi/files/Fix_EOF_not_declared_i=
ssue.patch
> similarity index 100%
> rename from meta-webserver/recipes-support/fcgi/Fix_EOF_not_declared_issu=
e.patch
> rename to meta-webserver/recipes-support/fcgi/files/Fix_EOF_not_declared_=
issue.patch
> diff --git a/meta-webserver/recipes-support/fcgi/add_foreign_to_AM_INIT_A=
UTOMAKE.patch b/meta-webserver/recipes-support/fcgi/files/add_foreign_to_AM=
_INIT_AUTOMAKE.patch
> similarity index 100%
> rename from meta-webserver/recipes-support/fcgi/add_foreign_to_AM_INIT_AU=
TOMAKE.patch
> rename to meta-webserver/recipes-support/fcgi/files/add_foreign_to_AM_INI=
T_AUTOMAKE.patch

Please use fcgi (BPN) instead of "files" for slightly faster lookup.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dT+85zccSFkyJC53
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPzIeMACgkQN1Ujt2V2gBxp+wCglKvAKB0qToCm8RjVVVaQYbYY
sxsAn2aCXkWnc7uaNzBbKT3C0bxIuclG
=q909
-----END PGP SIGNATURE-----

--dT+85zccSFkyJC53--
