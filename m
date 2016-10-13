Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id E21F26FF84
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 18:32:49 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id x23so8272247lfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 11:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=jV2WNis0PaVxqifdZMx0QtgltJBKJoIWmqXarjRLjNU=;
	b=jiI7Pt5+5OKQ5SagRe1CKSupaH3UrNdh/Q+fA3WBvTsYkc6y/6IMtKjW0wQQljilDA
	c7lFjjUSol0qvWkorQBssEeUfvCYjA7i1/v7JiapNuH/HEj1Anp2EoxW6977/kzQzCOk
	o1PKn1zoPOAmXG327LUfvC5TCWZ6mjxZaNoUSthUNTbqn5DSontqUw2N5Q1LFPZESp6E
	Kj7XUpbhXt95J0CeIPct5ESeJe599Cf8ewLt0lqqp0pulwpxyr5ygS2HcdpV/oxk0aua
	E0cjwbbJ96pxXyagJSixPMcQ32wDRfT3uQsG0AoW/HQDM8zrj6XTkoDkPa8gC3Qv8IYT
	I6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=jV2WNis0PaVxqifdZMx0QtgltJBKJoIWmqXarjRLjNU=;
	b=il0yJ4sBqHHb2Syrlc64ZNdsqhj30ydJ9F14QxRDWuWWwrz+L96s/rWr8+VbaqgWc0
	Wh1uMgHelvXRypWvBbCTBrl3QQGLjsWscaTJkNMkxLWwI+zUO2sDGjAqKeX2ouMV+XWg
	7iNOrKYnOgDGpQIAEc+FqWeSHUCEx0Wak9JgoQAZL8CTvZnL6EyX+4M2hRqguKQQRf7p
	bwBTy9yWoe+4uBA1oWmqTFV94OKKhNdC6vRTToJ5VqzRpkk80XeYHewimVZSWMPCd9b4
	Z6PN9D8w33N7pCgk7zLKeoY44RjE1imsbeh/kwEMJK8VsMPBeE9Fcfr8Nr5mpgkjDp3Y
	IcDA==
X-Gm-Message-State: AA6/9RneOKrK30+3QD89+FhSCqBbjzvZ7bTXdt+j+qXtEZwPcMDV+tAvmuEmZhUlVdQehQ==
X-Received: by 10.194.94.39 with SMTP id cz7mr7846815wjb.141.1476383570033;
	Thu, 13 Oct 2016 11:32:50 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	rv12sm24653651wjb.29.2016.10.13.11.32.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 13 Oct 2016 11:32:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 13 Oct 2016 20:32:48 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161013183247.GE2924@jama>
References: <20161013142432.32326-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161013142432.32326-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [meta-browser][PATCH] chromium-wayland: add wayland to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Thu, 13 Oct 2016 18:32:51 -0000
X-Groupsio-MsgNum: 63460
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Lb0e7rgc7IsuDeGj"
Content-Disposition: inline

--Lb0e7rgc7IsuDeGj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2016 at 04:24:32PM +0200, Martin Jansa wrote:
> * otherwise chromium-wayland recipe might build with CHROMIUM_ENABLE_WAYL=
AND 0 and then
>   autodetect couple of x11 libraries
>   chromium-wayland-48.0.2548.0: chromium-wayland rdepends on atk, but it =
isn't a build dependency, missing atk in DEPENDS or PACKAGECONFIG? [build-d=
eps]
>   chromium-wayland-48.0.2548.0: chromium-wayland rdepends on gdk-pixbuf, =
but it isn't a build dependency, missing gdk-pixbuf in DEPENDS or PACKAGECO=
NFIG? [build-deps]
>   chromium-wayland-48.0.2548.0: chromium-wayland rdepends on gtk+, but it=
 isn't a build dependency, missing gtk+ in DEPENDS or PACKAGECONFIG? [build=
-deps]
>   chromium-wayland-48.0.2548.0: chromium-wayland rdepends on libxcomposit=
e, but it isn't a build dependency, missing libxcomposite in DEPENDS or PAC=
KAGECONFIG? [build-deps]
>   chromium-wayland-48.0.2548.0: chromium-wayland rdepends on libxcursor, =
but it isn't a build dependency, missing libxcursor in DEPENDS or PACKAGECO=
NFIG? [build-deps]
>   chromium-wayland-48.0.2548.0: chromium-wayland rdepends on libxscrnsave=
r, but it isn't a build dependency, missing libxscrnsaver in DEPENDS or PAC=
KAGECONFIG? [build-deps]
>=20
> * reported a while ago in:
>   http://lists.openembedded.org/pipermail/openembedded-devel/2016-Septemb=
er/109131.html
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb b/r=
ecipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
> index f7ad2ce..bad3d71 100644
> --- a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
> +++ b/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
> @@ -2,6 +2,9 @@ include chromium-browser.inc
> =20
>  DEPENDS +=3D "wayland libxkbcommon"
> =20
> +inherit distro_features_check
> +REQUIRED_DISTRO_FEATURES =3D "wayland"

This isn't enough, because when x11 is also in DISTRO_FEATURES it will
disable wayland support (so we should skip this recipe).

# $CHROMIUM_ENABLE_WAYLAND
#   set
#   /OE/build/oe-core/meta-browser/recipes-browser/chromium/chromium-browse=
r.inc:109
#     [_defaultval] "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '0',
#     bb.utils.contains('DISTRO_FEATURES', 'wayland', '1',
#     '0', d),d)}"
CHROMIUM_ENABLE_WAYLAND=3D"0"

> +
>  SRC_URI +=3D "\
>          file://chromium-wayland/add_missing_stat_h_include.patch \
>          file://0003-Remove-hard-coded-values-for-CC-and-CXX.patch \
> --=20
> 2.10.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Lb0e7rgc7IsuDeGj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlf/008ACgkQN1Ujt2V2gBx7AQCfVihIZ4ZUxTDvgG9jGC/B7kTk
GBkAmwffrHE6PhMLtdp4qQ01OOPxczIL
=378Y
-----END PGP SIGNATURE-----

--Lb0e7rgc7IsuDeGj--
