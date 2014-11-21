Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 20F3660030
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2014 13:57:50 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id r20so12091222wiv.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2014 05:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4KxpG1E/OFEvY7YFcgC0wYKB+Oyrma0p551tRL08AWQ=;
	b=MpVqlyQvHdiqOUoLvnjHagNYV6Gloo+cY3nR4cpp7s4ash5BXjmjbLMBVaUFBotXp5
	yxD6rdEOFGt7Wz4GvAe9as8NTBTIZiv6mKVyLg3RHaOVmAjwCoOYQsR0Q57h0efFwR1h
	PwFVy1oiJeHwdAtZmfrBU9gOCxNvqKxcLvoovPnt2cuMaTHB1Ty/9aZiYGajbOzqghBs
	7/HOWQM07MUpFBfTT0MNM/rvA7YXC0YO25cYPjUUseZ4EKtmauWIAyvk7IMgxgdUJOQ8
	NVJ91O3y2sbPAVWTQ07oKHPiWJbickmYA/64VszgcLu5oVq+lpxaKMzyrqDndQ0sBt7h
	Bvyg==
X-Received: by 10.194.189.81 with SMTP id gg17mr7794397wjc.115.1416578267282; 
	Fri, 21 Nov 2014 05:57:47 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n3sm11432246wiw.5.2014.11.21.05.57.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Nov 2014 05:57:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 21 Nov 2014 14:57:48 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141121135748.GD2163@jama>
References: <1415728430-30366-1-git-send-email-ross.burton@intel.com>
	<1415728430-30366-4-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1415728430-30366-4-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 4/5] gupnp-dlna: upgrade to 0.9.5
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
X-List-Received-Date: Fri, 21 Nov 2014 13:57:51 -0000
X-Groupsio-MsgNum: 52967
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hxkXGo8AKqTJ+9QI"
Content-Disposition: inline

--hxkXGo8AKqTJ+9QI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2014 at 05:53:49PM +0000, Ross Burton wrote:
> Also use GNOME_MIRROR in SRC_URI.

Seems to break media-service-upnp

| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/m=
edia-service-upnp/0.4.0-r0/git/src/device.c:2739:12: error: too few argumen=
ts to function 'gupnp_dlna_profile_guesser_guess_profile_sync'
|   profile =3D gupnp_dlna_profile_guesser_guess_profile_sync(guesser,
|             ^

>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../gupnp/{gupnp-dlna_0.9.2.bb =3D> gupnp-dlna_0.9.5.bb}           |    =
6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-multimedia/recipes-connectivity/gupnp/{gupnp-dlna_0.9.2.bb =
=3D> gupnp-dlna_0.9.5.bb} (72%)
>=20
> diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.=
bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.5.bb
> similarity index 72%
> rename from meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb
> rename to meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.5.bb
> index b7e71cf..c936750 100644
> --- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb
> +++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.5.bb
> @@ -5,9 +5,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c \
> =20
>  DEPENDS =3D "libxml2 glib-2.0"
> =20
> -SRC_URI =3D "http://download.gnome.org/sources/${BPN}/0.9/${BPN}-${PV}.t=
ar.xz"
> -SRC_URI[md5sum] =3D "d972f9b03f0f3793cb895eb034ea314f"
> -SRC_URI[sha256sum] =3D "c28d5650604c7da4f193e6b85049a4885f3a01f1996df768=
d55b5cb898a9fc53"
> +SRC_URI =3D "${GNOME_MIRROR}/${BPN}/0.9/${BPN}-${PV}.tar.xz"
> +SRC_URI[md5sum] =3D "b0c9e5e6edc5ca6fe854bc53560431bf"
> +SRC_URI[sha256sum] =3D "44a226300287ffbee1899c35775b4b9153930f29433a75d8=
c1577d8547c29e83"
> =20
>  inherit autotools pkgconfig
> =20
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hxkXGo8AKqTJ+9QI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRvRNwACgkQN1Ujt2V2gBxFJQCgu9ZpkezPEJDeNC8cA5+Dnn6r
CvoAnjz5HzaSZ+aGFpEAmYnAPybsO+1a
=DQv4
-----END PGP SIGNATURE-----

--hxkXGo8AKqTJ+9QI--
