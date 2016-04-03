Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id AD27D770AB
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Apr 2016 11:48:24 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id qe11so121651191lbc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Apr 2016 04:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=zR26ePTJNzSpqaZOSIqIZ8lBiGf0AR0W35CpH6UJqrk=;
	b=Llmzx5Ey8paTYS+anfhxbZUJMaV/PKr8s8GDnun5m9LtWkPV9f3fTHEd1Y4FD+8JYP
	QMqyZGXD6fc/VaZ1CnXZnrg83Tk1KE84d2Up25LiRVU/TC7mWkeFk25nlaaog5vYBLDP
	r97Dxa2BNNbBrHBeu7FgzCKF3Yt2Vl/xNYoKQiIWoHBMoKQGKDFutm9mTYf84xkBlGnQ
	x5gV0zG+OVZLYopQxNYI0jhCd+h+WpQjABU+m5znNcYmR2AYBzau3MBNyDYnu+aRpwKz
	FriDEazH94IP9D/sox6XeZbuNeJgykJnafFj8JMQT1Ia/C7WTQSue5MVgJu+Q0NFPhu0
	HbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=zR26ePTJNzSpqaZOSIqIZ8lBiGf0AR0W35CpH6UJqrk=;
	b=Yh1KOq/t5zK2zTOpnponYOku1WjRqeuaTDjm1MtjIA+LP4rqCyojkj+dQfu+LiQBsf
	Q86iyaOAf4kgseZNtwkq89l4LM1y/S09ceDhPMW+68sg/P3bKuvzr9Z9U5018QVWM8OL
	OMRGubeaPKZfBBgHYGTfoLlgReVylSqVwBm5Uw09JZnRZilYINzhbCQkzeFxZz6GzxWD
	m6QwctzHrYr9riccamK+5ZoxnpD94VZXmqFW83lTx3t3n9p6XupVFXBKRyzoJkQ0EZ4K
	xkhIF5hDHeysNJWEAnRMtIxRstlhcDXjjX7wOOi/cdJOal/ehgphJ2bQkYru/eX7EV/8
	Go+A==
X-Gm-Message-State: AD7BkJJLx0nLMCjFoZb4qXT4Wvvbff3cEVq2L+zaBBa+dvzkxBFc44zIv8hNX+KQdJprSw==
X-Received: by 10.28.126.210 with SMTP id z201mr7093081wmc.102.1459684103971; 
	Sun, 03 Apr 2016 04:48:23 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	kj9sm23469030wjb.14.2016.04.03.04.48.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Apr 2016 04:48:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 3 Apr 2016 13:48:46 +0200
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Message-ID: <20160403114846.GA3428@jama>
References: <1459546590-9513-1-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1459546590-9513-1-git-send-email-ricardo.ribalda@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v7 0/7] opencv: Update to 3.1 and remove bl
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
X-List-Received-Date: Sun, 03 Apr 2016 11:48:26 -0000
X-Groupsio-MsgNum: 60806
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline

--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 01, 2016 at 11:36:23PM +0200, Ricardo Ribalda Delgado wrote:
> What can I say... Sorry about all the spam :S. This should have
> never reach v7.
>=20
> Hopefully all the dependecies are ok this time.
> It also predownloads the Intel IPP, using bitbake.
>=20
> I have decided to resend the whole patchset because it is now a
> mess of v7, v6, v5...

Previous revision failed like this:
http://errors.yoctoproject.org/Errors/Details/59759/

and latest revision doesn't look to fix this.

Can you double check?

>=20
> It is also available on=20
> https://github.com/ribalda/meta-openembedded/tree/opencv-v7
>=20
> Regards
>=20
> Ricardo Ribalda Delgado (7):
>   opencv: Fix use before set error on meta package
>   opencv: Update to version 3.1
>   opencv: Fix pkg-config file.
>   opencv: Add missing dependencies
>   opencv: Use pre-downloaded ipp
>   opencv: Fix build on x86 platform
>   opencv: Remove blacklist
>=20
>  ...01-3rdparty-ippicv-Use-pre-downloaded-ipp.patch | 28 ++++++++++++++++=
+++++
>  .../opencv/opencv/fixpkgconfig.patch               | 29 ++++++++++++++++=
++++++
>  .../opencv/{opencv_3.0.bb =3D> opencv_3.1.bb}        | 28 ++++++++++++++=
+------
>  3 files changed, 77 insertions(+), 8 deletions(-)
>  create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-3rdparty-i=
ppicv-Use-pre-downloaded-ipp.patch
>  create mode 100644 meta-oe/recipes-support/opencv/opencv/fixpkgconfig.pa=
tch
>  rename meta-oe/recipes-support/opencv/{opencv_3.0.bb =3D> opencv_3.1.bb}=
 (86%)
>=20
> --=20
> 2.8.0.rc3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcBAtoACgkQN1Ujt2V2gBw6+gCfWKpTP3lUJyx9bO3opjpVXdfO
OcIAn2qVLzTQTQGq2NHh4Nc0rc/XAjei
=Q8X4
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
