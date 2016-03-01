Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id C14966FF9F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Mar 2016 08:42:43 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id l68so22804513wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Mar 2016 00:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=FXT6vtRIdJwRvs84Sjgju6KLf9IjnHXUqYfyrtvcU+0=;
	b=RS33FwuWXDCWYOXq34CaI4QrljPLhbTjbE4CG8l/7gzTiC3L2IhsTIIkc1jSwpNIPb
	ACAkc/2t1neQv0hk+bEojsXofEvE+tlrefYmyVl1RW7GBSyv8YjCARsHgvGyQ+gSbkMx
	uH0i+3zT8xnSyEvtobkgg3pIG7CtYZAvnG8BCFGszcK2NiJ3cV2PFb1APg5mPFTUDFEa
	U/CQ8pD7+RpXnAk7iteBTAHZAC//pBwNl9mSkqGg17R/FltK96n5qwEouLzJZ3ESthrS
	c7mV8n/csgEqAVO2i4AEmwwilMdMQf5ihFf53QC6gfulL3rLrlTnrm29m5KqdDWVIWaK
	Mv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=FXT6vtRIdJwRvs84Sjgju6KLf9IjnHXUqYfyrtvcU+0=;
	b=OF4LtJWspMlA5lq4/qpV5tstFkAY4cZrkeLTjOEvm3I24CVvul1ssO3r2HRnW/Ei4S
	+d0taPpN/m+tx22cVAw7kRNiNZexFCWuI1tq7mauccZPhQfTfhJhsEPixsOcWcx5whuZ
	GXfm3wL/7Khq/7VlA7PdReHe0Kkjwuygj6iUH6TkCUWZ8CVArkfIIGd2nppmx2gWvjcQ
	8/MPWRxB2/dB6BCYEqbAFEA85JEpS/d+jT20UV0NXTGY3B/Ln8QAggPZUlsh30iG32v0
	9FSt20hfunLo5UO5J1rEUwOp9cipMCiFGAUvgjZ3toT54bbZxzuwSNHWTXh3D8ybFQDP
	lJhA==
X-Gm-Message-State: AD7BkJKqVEUUt/JST68EqKNfCh6pUXIcjXmpKOxNT1YO3AqmPkLTunfJjDJ0EuQ/Xh+6VA==
X-Received: by 10.28.6.139 with SMTP id 133mr2465285wmg.84.1456821763911;
	Tue, 01 Mar 2016 00:42:43 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	fv6sm29803634wjc.12.2016.03.01.00.42.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Mar 2016 00:42:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 1 Mar 2016 09:44:34 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160301084434.GA6407@jama>
References: <1456793666-26638-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1456793666-26638-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][meta-qt5] gdb: append to PACKAGECONFIG instead of changing the default
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Mar 2016 08:42:45 -0000
X-Groupsio-MsgNum: 60278
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline

--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2016 at 01:54:26AM +0100, Martin Jansa wrote:
> * without readline in PACKAGECONFIG and with no-static-libraries.inc
>   gdb fails when trying to build against own bundled static readline
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-devtools/gdb/gdb_%.bbappend | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-devtools/gdb/gdb_%.bbappend b/recipes-devtools/gdb/g=
db_%.bbappend
> index 41592c4..ec17f55 100644
> --- a/recipes-devtools/gdb/gdb_%.bbappend
> +++ b/recipes-devtools/gdb/gdb_%.bbappend
> @@ -1 +1 @@
> -PACKAGECONFIG ??=3D "python"
> +PACKAGECONFIG_append =3D " python"

I should just change this to
PACKAGECONFIG ??=3D "readline python"

so that it is still easy for DISTROs to override this while fixing gdb
build with no-static-libraries.inc until
http://patchwork.openembedded.org/patch/116843/
is merged

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbVVnEACgkQN1Ujt2V2gBzedACdF+mMq5D1oWa4WGKMyT9sVKfd
59MAnA2ffCR8lnjzJqoshdMl7iucsMG8
=uECX
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
