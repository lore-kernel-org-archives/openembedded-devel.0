Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 517C5770E0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Mar 2016 19:23:15 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id p65so3327177wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2016 11:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=QLtuUleRKVxAgBuzgOAhibz9j9+qvFCxjF/rPZzQAAU=;
	b=yKQWo7RJlJavi1emAm5Vq0NGa7HXFYGd0B1l5cWqxJfcwT/q6/xbVKtWK61V3ss306
	nkrXXnfHtYXNXLBdSNEPInXz6uQ+TwGxryNEf1aBPp6DM+CiJxV8pFBQFu9JFbatsFoc
	aFgDz16hsx3VePx8GBKdLg+z9ri/292VspBhbpsUT+wk8ZLNqN/ohBaU6bgRxs+LoWvE
	4yhYKvaqwxhBMZ0Ec21uAwwCDcbve1lcGjm6RUoayStjuUxyuGMRayr7ac+XkRO2mshz
	c9Cydw+SkmM6eFkAglkqK4HL6g0sG8ob+bhlOiOJuUPsOt4WKEb9OKf/7hoRandw7sRN
	ZlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=QLtuUleRKVxAgBuzgOAhibz9j9+qvFCxjF/rPZzQAAU=;
	b=Il9wz+JUZEJHCKb74qiYg2G+US106oo8mry1+i2tFyakIOvF6T/VuE57fc3XP2p0Fb
	EKkMZtK5RnkXqquw9GAQKIXZf7mXS3+GTc8/HYcJAtviEP7460l2QFsNfdClQN8K75Ak
	UOz34TP2kxe66H24KUOtvZsU2qcV/cWKy8RWHFeg+4fFW0bdcbYXXp8veGGVKh9chCxH
	M7/1l0o93cAK5HRDVk1nQUP2ITFH3bXrJ0BbeLDjZPlW5w3J3WpCSye16cdbDX7Kjao9
	5fg6uU0xwTnG35u1N8mKs2qoTKcToO34QfJ8ZdagpRSsKHV+ppFiRkYhRlIEdXC66EFc
	2gLg==
X-Gm-Message-State: AD7BkJKCEjNVWt1LF8i8eRyrJcB0R6vCqMNvM9PlJKDPPL5JZ5qHyk6rMqIJE84Ycvg9ZA==
X-Received: by 10.28.174.72 with SMTP id x69mr1596838wme.68.1456946596514;
	Wed, 02 Mar 2016 11:23:16 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	v68sm5525196wmv.10.2016.03.02.11.23.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Mar 2016 11:23:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 2 Mar 2016 20:25:15 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160302192515.GG10529@jama>
References: <1456935672-15538-1-git-send-email-Martin.Jansa@gmail.com>
	<1456935672-15538-2-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1456935672-15538-2-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][meta-oe 2/5] vlc: blacklist, not compatible with currently used ffmpeg 3
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
X-List-Received-Date: Wed, 02 Mar 2016 19:23:18 -0000
X-Groupsio-MsgNum: 60302
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Z0mFw3+mXTC5ycVe"
Content-Disposition: inline

--Z0mFw3+mXTC5ycVe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 02, 2016 at 05:21:09PM +0100, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-multimedia/recipes-multimedia/vlc/vlc.inc | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multim=
edia/recipes-multimedia/vlc/vlc.inc
> index 3267dad..32f3ad0 100644
> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> @@ -104,3 +104,6 @@ FILES_${PN}-dbg +=3D "\
>  FILES_${PN}-staticdev +=3D "\
>      ${libdir}/vlc/plugins/*/*.a \
>  "
> +
> +# http://errors.yoctoproject.org/Errors/Details/40690/
> +PNBLACKLIST[vlc] ?=3D "Not compatible with currently used ffmpeg 3"

If anyone is going to work on unblacklisting this then please fix
missing $ in PACKAGECONFIG (if I don't forget I'll include this fix in
the same commit as PNBLACKLISt)

Missing $ before {@ causes few QA errors:

vlc-2.2.1: vlc: invalid PACKAGECONFIG:
{@bb.utils.contains('DISTRO_FEATURES', [invalid-packageconfig]
vlc-2.2.1: vlc: invalid PACKAGECONFIG: 'x11', [invalid-packageconfig]
vlc-2.2.1: vlc: invalid PACKAGECONFIG: 'x11 [invalid-packageconfig]
vlc-2.2.1: vlc: invalid PACKAGECONFIG: sdl', [invalid-packageconfig]
vlc-2.2.1: vlc: invalid PACKAGECONFIG: '', [invalid-packageconfig]
vlc-2.2.1: vlc: invalid PACKAGECONFIG: d)} [invalid-packageconfig]

Interesting that nobody noticed.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Z0mFw3+mXTC5ycVe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbXPhoACgkQN1Ujt2V2gBxgsQCfaLuLBpadCMLKRKyWujUSOxZY
ehQAn1y2eHwELKPDqNy8IpsrNNvWkNZh
=J5WT
-----END PGP SIGNATURE-----

--Z0mFw3+mXTC5ycVe--
