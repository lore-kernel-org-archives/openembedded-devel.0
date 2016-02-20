Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id ADE8277224
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Feb 2016 13:57:46 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id a4so106215117wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Feb 2016 05:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=n8AscJzQkU3L7ZvMZRYWdO5b/WKnPMr1Bf7evC+sxxU=;
	b=p/lBtqzuySJYdvvIpC1kYT+E5UolK2XuUvKg4V8pjr5og62m/sP4Ezy6DFC8ux90Xe
	IhoPvU5d6oEo0jjiCohoFduFvt6koF5vhPFyXow6Jdh+ULCDLcKov8BBvu6wXhfrpPAC
	DOb302ryTkxTyBbO+cRZH618XCSjnPzGuGy9fiztwYOz4N1pqc94TgY343xBq3kCIQIT
	I7i6ZFPEFPjTwveYmisEB90dn6DZbSFozvy4grYHzUqdK9FgDmo6bX0CBkYQJLdfVF4c
	mIuAQoB9DD1dSHT3o3XKOEQma9hSTAQ4c4fem7M88sOCBa9dNmZp6hcbJQJWqo0Yuuk3
	/WHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=n8AscJzQkU3L7ZvMZRYWdO5b/WKnPMr1Bf7evC+sxxU=;
	b=h4afGbkvSUdGrZiGod32spuEo9emo+DpUs9hdimbQEBYYtu2hqE9Cn17cfEYJmNjzU
	MSHuDpG/BDu2NEKYu32FFZc7VUO6yCFAH9qhvRgdmBtulJ/oj0PzpgocviERzerTPHRH
	dciPwV3mUT2HtgkFoqDbuNzjvkBy/Ohb/rvm85aJukzH1Kg7UGRda55mGbIOpqj40n4R
	t/gnCMPzS654ALXmfF4M7/RS8WftWfJKIkgCCFVu3iJULuSHbGCs2+FOPpJh+XalTRv8
	/VXR73FQ2+9opVqCcRqSROTvEpNws6i7WHmPC4eXyonWWrqAa8TWyTPAW3p9KlSmQxlW
	2KgA==
X-Gm-Message-State: AG10YOTfhcXT5HbUN+JtIXIMgQ2JI/fSvLY6t5mTr5QaSFIhGeqEq/QINM9Pby4vvTGvfA==
X-Received: by 10.28.9.71 with SMTP id 68mr2690344wmj.33.1455976667089;
	Sat, 20 Feb 2016 05:57:47 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ct2sm15835319wjb.46.2016.02.20.05.57.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 20 Feb 2016 05:57:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 20 Feb 2016 14:58:24 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160220135824.GC2589@jama>
References: <1455736575-2561-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1455736575-2561-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] hostapd: Upgrade to 2.5
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
X-List-Received-Date: Sat, 20 Feb 2016 13:57:46 -0000
X-Groupsio-MsgNum: 60050
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CblX+4bnyfN0pR09"
Content-Disposition: inline

--CblX+4bnyfN0pR09
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 17, 2016 at 11:16:15AM -0800, Khem Raj wrote:
> Change-Id: I8e4a44297492b213dd1001d8b1499864e95b17c2
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

You're few months late:

commit fcb7b50851884264dbd9764ba9781ba0b84900e7
Author:     fan.xin <fan.xin@jp.fujitsu.com>
AuthorDate: Mon Dec 7 14:43:16 2015 +0900
Commit:     Martin Jansa <Martin.Jansa@gmail.com>
CommitDate: Fri Dec 18 12:43:22 2015 +0100

    hostapd: upgrade 2.4 -> 2.5

> ---
>  .../recipes-connectivity/hostapd/{hostapd_2.4.bb =3D> hostapd_2.5.bb}  |=
 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-connectivity/hostapd/{hostapd_2.4.bb =3D> hostapd=
_2.5.bb} (90%)
>=20
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.4.bb b/meta-o=
e/recipes-connectivity/hostapd/hostapd_2.5.bb
> similarity index 90%
> rename from meta-oe/recipes-connectivity/hostapd/hostapd_2.4.bb
> rename to meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb
> index 901c7ea..e9158ca 100644
> --- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.4.bb
> +++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb
> @@ -17,6 +17,8 @@ SRC_URI =3D " \
>      file://init \
>      file://hostapd.service \
>  "
> +SRC_URI[md5sum] =3D "69f9cec3f76d74f402864a43e4f8624f"
> +SRC_URI[sha256sum] =3D "8e272d954dc0d7026c264b79b15389ec2b2c555b32970de3=
9f506b9f463ec74a"
> =20
>  S =3D "${WORKDIR}/hostapd-${PV}/hostapd"
> =20
> @@ -41,6 +43,3 @@ do_install() {
>  }
> =20
>  CONFFILES_${PN} +=3D "${sysconfdir}/hostapd.conf"
> -
> -SRC_URI[md5sum] =3D "04578f3f2c3eb1bec1adf30473813912"
> -SRC_URI[sha256sum] =3D "6fe0eb6bd1c9cbd24952ece8586b6f7bd14ab358edfda997=
94e79b9b9dbd657f"
> --=20
> 2.7.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CblX+4bnyfN0pR09
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbIcP8ACgkQN1Ujt2V2gBxtUACgjnVo6bvpSFialF4GK+1rGF/5
x6QAn063QJxYzJrKFqqzRSNZk6h2xl2H
=V+aM
-----END PGP SIGNATURE-----

--CblX+4bnyfN0pR09--
