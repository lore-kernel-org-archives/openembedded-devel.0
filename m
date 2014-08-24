Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id BD0E170F2E;
	Sun, 24 Aug 2014 22:31:21 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id b13so12275584wgh.18
	for <multiple recipients>; Sun, 24 Aug 2014 15:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IAfzJrK+HKGaizz1ZKz6KwvPxDUa2A237W7u1pRA1Y8=;
	b=sPivObeM+K9rM4cvg13aL511R7E0DrNMtA0iJkIG79BHRLgDgftnDHzPQa/HJBxEA6
	5q2RlkwIxYlp44JsRJVUTu2AO/Rd336mf/YY61C8lsc7bg9Jfb8wExzuR6fS7UIDozAH
	Fxcnslp24LsI/ggaEFoLQYElSee3F+uxPFxsPjC144YbprropsKSYmjmzTcD/aqzU7Of
	FQUUs7bfp+Cqs5RZNBFDgjhSlrlLYZu6zqziSnHbDImTZ6csuw6+FtS/TprIM4ptLiAX
	Yz/T/vfG7ZOPVoFZzt/2lmX5jPag9Q6Gu2yK5SrDEwinO3iGVyjVDgvb1Yz0tzdiNEMh
	CTcQ==
X-Received: by 10.180.149.169 with SMTP id ub9mr11599925wib.32.1408919482148; 
	Sun, 24 Aug 2014 15:31:22 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	s4sm24823828wik.23.2014.08.24.15.31.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Aug 2014 15:31:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 25 Aug 2014 00:31:27 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140824223127.GN20524@jama>
References: <20140823082635.A959850251@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20140823082635.A959850251@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: mkvtoolnix broken by boost upgrade Was: [oe-commits] Saul Wold : boost: Upgrade to 1.56.0
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
X-List-Received-Date: Sun, 24 Aug 2014 22:31:25 -0000
X-Groupsio-MsgNum: 51837
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s3R87C3fwYeCSZ0b"
Content-Disposition: inline

--s3R87C3fwYeCSZ0b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 23, 2014 at 08:26:35AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: a6afd754290cecbe57392d13477557051b438817
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Da6afd754290cecbe57392d13477557051b438817
>=20
> Author: Saul Wold <sgw@linux.intel.com>
> Date:   Tue Aug 19 07:49:09 2014 -0700
>=20
> boost: Upgrade to 1.56.0
>=20
> Rebase boostconfig to handle moved user-config file

FYI: This breaks mkvtoolnix:

|      CXX src/common/iso639.cpp
| src/common/iso639.cpp: In function 'int map_to_iso639_2_code(const string=
&, bool)':
| src/common/iso639.cpp:595:30: error: 'class boost::range::index_value<con=
st iso639_language_t&, int>' has no member named 'english_name'
|      auto names =3D split(lang->english_name, ";");
|                               ^


> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  .../boost/{bjam-native_1.55.0.bb =3D> bjam-native_1.56.0.bb}        | 0
>  meta/recipes-support/boost/{boost-1.55.0.inc =3D> boost-1.56.0.inc} | 4 =
++--
>  meta/recipes-support/boost/boost.inc                              | 8 ++=
++----
>  meta/recipes-support/boost/{boost_1.55.0.bb =3D> boost_1.56.0.bb}   | 0
>  4 files changed, 6 insertions(+), 6 deletions(-)

--s3R87C3fwYeCSZ0b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP6Z78ACgkQN1Ujt2V2gBzZMACeJ3lZsGCME3+Cz64eTH3NK8HF
E7IAoIMYjRid0KtkVjmjIVqTqHPCp22A
=bme0
-----END PGP SIGNATURE-----

--s3R87C3fwYeCSZ0b--
