Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A12C7774F1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 08:58:41 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id g23so34908655wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 00:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=t7/5gQ7nRExXt0QguUoUJBbkVBhO/2IT4lXFAd7jAnU=;
	b=sTReWwUkW0whK/9/4ulZ9vLl10Pkr1gFi4Zyb5AXa3InQ0btonKAwj4KfEUYyMNBGy
	Yc8R7GhD3TXm4GisaZtGwalzds7vxwrSHNQsFkT+svy5AHXEealaK3+xYb41Ys+hEEq9
	YZ1rmx13fsXh/5YGSEFpJfTdUXbnCoqg/LiqdgDKJ7XvqdIU+8URcA+aLENWhkwnj21M
	8a087SiTQOWz2sew1cTFf/Ibp6fWEO031SzOuGUdVfz7xHA2hPYDzOyqV8LvCYRN13QZ
	s1qAFP92AL/cxU0HUoOK1avLOrxJAr5jfzTNaziVhgKkROHn5NUbtWwK4Yevbg84Zcre
	TQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=t7/5gQ7nRExXt0QguUoUJBbkVBhO/2IT4lXFAd7jAnU=;
	b=iVSpkEX0rUTdfV4prr/abT8v/FSswqBnjMFS8arcd2yW60nfYHDpS5TvVTunfIlcCo
	Dip+1D5P4iDfoL8noFmO1PjKq2p6iTjgpveWCXwR1NdQpDFaXU7Ig7iKML6af1JMVXCF
	6ep+MP/gmeNGPRt8yYQPoa4Xa5iA5hYeKr/Vgb87f20cKS0kPeYy+eHN3haxCPnY2kNa
	4XFmLYe6spdSRWOqCLKMD65zhcQuWVzOVsXD5aLJSfAdqKe5h2PIOYzQmmPMlwpXltd8
	2BSYIai/X/whwVMFWx4efyfVUbhC7iq4/fkzE4Mx7HsRNLRFK8f56anAJ2vEHUS40z5o
	oQww==
X-Gm-Message-State: AIkVDXIBV+nEgqkW8SNIexFj7xFdn5xelPzx7qKbdEJIy64eEL0lxChugipi2ILe3hiXXg==
X-Received: by 10.28.143.20 with SMTP id r20mr10232711wmd.2.1482397122206;
	Thu, 22 Dec 2016 00:58:42 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	ct7sm34507372wjc.2.2016.12.22.00.58.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Dec 2016 00:58:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 22 Dec 2016 09:58:40 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161222085840.GC3544@jama>
References: <20161220142137.20922-1-bogdan.hopulele@ni.com>
MIME-Version: 1.0
In-Reply-To: <20161220142137.20922-1-bogdan.hopulele@ni.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-oe][PATCH] cryptsetup: Add kernel-module-xts to RRECOMMENDS
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
X-List-Received-Date: Thu, 22 Dec 2016 08:58:41 -0000
X-Groupsio-MsgNum: 64471
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9Ek0hoCL9XbhcSqy"
Content-Disposition: inline

--9Ek0hoCL9XbhcSqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2016 at 02:21:37PM +0000, Bogdan Hopulele wrote:
> cryptsetup luksOpen (luksFormat) uses xts by default.
> When the module is not installed, cryptsetup prints:
>=20
> Check that kernel supports aes-xts-plain64 cipher (check syslog for more =
info)
>=20
> Signed-off-by: Bogdan Hopulele <bogdan.hopulele@ni.com>

This doesn't look for master where cryptsetup was upgraded some 4 months
ago:

commit 5f9728d97f65173833f9d9aa2f535172f222c844
Author:     Derek Straka <derek@asterius.io>
AuthorDate: Tue Aug 9 17:50:41 2016 -0400
Commit:     Martin Jansa <Martin.Jansa@gmail.com>
CommitDate: Mon Aug 15 12:31:59 2016 +0200

    cryptsetup: update to version 1.7.2
   =20
    Signed-off-by: Derek Straka <derek@asterius.io>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>


You should always send patches tested in recent master(-next).

> ---
>  meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.0.bb b/met=
a-oe/recipes-support/cryptsetup/cryptsetup_1.7.0.bb
> index 16c21d3..3470c5d 100644
> --- a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.0.bb
> +++ b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.0.bb
> @@ -28,6 +28,7 @@ RRECOMMENDS_${PN} =3D "kernel-module-aes-generic \
>                       kernel-module-md5 \
>                       kernel-module-cbc \
>                       kernel-module-sha256-generic \
> +                     kernel-module-xts \
>  "
> =20
>  EXTRA_OECONF =3D "--enable-static"
> --=20
> 2.10.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9Ek0hoCL9XbhcSqy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWFuVwAAKCRA3VSO3ZXaA
HFGeAJ97axVv/7GEhW1a6y428D0hq3BJjQCfRJ9bYbzCd66K2WeCq/CwBCpEy+Y=
=/Rfy
-----END PGP SIGNATURE-----

--9Ek0hoCL9XbhcSqy--
