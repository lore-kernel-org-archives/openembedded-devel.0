Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 86F7B60132
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 17:06:08 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 66so4519260pfy.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 10:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=0osuyMfNm//MvL9IOWwpWUGYpCZ1Ji30FHqFLQ8Rmg0=;
	b=JepurKDbSS/LSBgb8URMoWe0yTiCK7QeFo/ar7dtiZdVnOBL+h18NzKFpyjAQfkUKY
	S4OIlfCJ6FmZLAMf8WP8BKOSSj8Hum8Swb1mbgVsaVi5u1j792s9FkBfKsp1gW30H1yJ
	Phhk561kN8rRkMYu9DbzZAaoXbKzvHAzOP2OKBrzm+/ZTcdTmNEecbh46jxWNTvgSrfa
	FxvQyUpdQBpQKgFx+Qi+a4cgiMtu6I2s8wNowbpKgcOPFgd2xSM4V/hVBYkt6aMC+Pt9
	GsnFvuw1Jpnrr26btZmWas4aR8W4WIwj8ehIjSsV+m88oDh2SkYKO07NmHrXMak/3UhH
	vTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=0osuyMfNm//MvL9IOWwpWUGYpCZ1Ji30FHqFLQ8Rmg0=;
	b=g7oCRg9P7BmwJbbLxSdLq5WfwlAxZ7xPdLAkAZtfBtW3PYdBQ4GkVChhHzNQrenKjD
	yjZPh4JN+R5R66doRrbhZHynbkscIMex336K2tn/AeFAAx3DJcNLtP6Gqp5rqIU+A9WN
	OqAC5uLRd3knbFfxLOHCvWX4F7HgPz6QPv2A8etvTXzllmzsBRNK/3xMvBwmZNZmTnbK
	CHzGWjl3qpjlYN226m6ronvaG++uoTlk+k5mEZPrZ0uLTz6/4vHLetrKO7Wx1L5a0AZS
	VIEvqaSFnnEhKmV5m+nEU851BJBlbQWewpAacoDSYC/NaP1HeZCHnqfKrTGQdaz924Z6
	kCdA==
X-Gm-Message-State: ALyK8tJwc4DeSdkR2n5BD93NxuFuI1zc4bibRPHpkSHrxPBKtOc7mlYSaOVZtoHsZON5fw==
X-Received: by 10.98.207.4 with SMTP id b4mr12453040pfg.20.1466615168828;
	Wed, 22 Jun 2016 10:06:08 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:fcd1:61e:b1e8:f28?
	([2601:646:8882:b8c:fcd1:61e:b1e8:f28])
	by smtp.gmail.com with ESMTPSA id e9sm1113218pfg.2.2016.06.22.10.06.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2016 10:06:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1465300884-32459-2-git-send-email-abdur_rehman@mentor.com>
Date: Wed, 22 Jun 2016 10:06:06 -0700
Message-Id: <15AFC889-4496-4B83-88A7-CD76CB3B13E7@gmail.com>
References: <1465300884-32459-1-git-send-email-abdur_rehman@mentor.com>
	<1465300884-32459-2-git-send-email-abdur_rehman@mentor.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: Re: [meta-oe][PATCH v5 2/2] mpv: Media Player
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
X-List-Received-Date: Wed, 22 Jun 2016 17:06:10 -0000
X-Groupsio-MsgNum: 61933
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7F24BCAC-FF1A-455A-AE67-B7FD33ECD7DB";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7F24BCAC-FF1A-455A-AE67-B7FD33ECD7DB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jun 7, 2016, at 5:01 AM, Abdur Rehman <abdur_rehman@mentor.com> =
wrote:
>=20
> mpv is a fork of mplayer2 and MPlayer. It shares some features with
> the former projects while introducing many more.
>=20
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
> ---
> meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb | 69 =
++++++++++++++++++++++++
> 1 file changed, 69 insertions(+)
> create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb =
b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
> new file mode 100644
> index 0000000..4f4aec1
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
> @@ -0,0 +1,69 @@
> +SUMMARY =3D "Open Source multimedia player"
> +SECTION =3D "multimedia"
> +HOMEPAGE =3D "http://www.mpv.io/"
> +DEPENDS =3D "zlib ffmpeg jpeg virtual/libx11 xsp libxv \
> +           libxscrnsaver libv4l libxinerama \
> +"
> +
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D91f1cb870c1cc2d31351a4d2595441cb"
> +
> +SRC_URI =3D =
"https://github.com/mpv-player/mpv/archive/v${PV}.tar.gz;name=3Dmpv \
> +           =
http://www.freehackers.org/~tnagy/release/waf-1.8.12;name=3Dwaf \
> +"
> +SRC_URI[mpv.md5sum] =3D "9042bd3fbff2bc8ba0b7fadaa4a22101"
> +SRC_URI[mpv.sha256sum] =3D =
"7d31217ba8572f364fcea2955733f821374ae6d8c6d8f22f8bc63c44c0400bdc"
> +SRC_URI[waf.md5sum] =3D "cef4ee82206b1843db082d0b0506bf71"
> +SRC_URI[waf.sha256sum] =3D =
"01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f22fca60c98b"
> +
> +inherit pkgconfig pythonnative distro_features_check
> +# depends on virtual/libx11
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> +
> +# Note: both lua and libass are required to get on-screen-display =
(controls)
> +PACKAGECONFIG ??=3D "lua libass"
> +PACKAGECONFIG[lua] =3D "--enable-lua,--disable-lua,lua luajit"
> +PACKAGECONFIG[libass] =3D "--enable-libass,--disable-libass,libass"
> +PACKAGECONFIG[libarchive] =3D =
"--enable-libarchive,--disable-libarchive,libarchive"
> +PACKAGECONFIG[jack] =3D "--enable-jack, --disable-jack, jack"
> +
> +EXTRA_OECONF =3D " \
> +    --prefix=3D${prefix} \
> +    --target=3D${SIMPLE_TARGET_SYS} \
> +    --confdir=3D${sysconfdir} \
> +    --datadir=3D${datadir} \
> +    --disable-manpage-build \
> +    --disable-gl \
> +    --disable-libsmbclient \
> +    --disable-encoding \
> +    --disable-libbluray \
> +    --disable-dvdread \
> +    --disable-dvdnav \
> +    --disable-cdda \
> +    --disable-enca \
> +    --disable-libguess \
> +    --disable-uchardet \
> +    --disable-rubberband \
> +    --disable-lcms2 \
> +    --disable-vapoursynth \
> +    --disable-vapoursynth-lazy \
> +"
> +
> +do_configure() {
> +    if [ ! -L ../waf ]; then
> +        chmod a+x ../waf-1.8.12
> +	ln -s waf-1.8.12 ../waf
> +    fi
> +    export SIMPLE_TARGET_SYS=3D"$(echo ${TARGET_SYS} | sed =
s:${TARGET_VENDOR}::g)"
> +    ../waf configure ${EXTRA_OECONF}
> +}
> +
> +do_compile () {
> +    ../waf build
> +}
> +
> +do_install() {
> +    ../waf install --destdir=3D${D}
> +}

may be you should inherit waf

> +
> +FILES_${PN} +=3D "${datadir}/icons"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_7F24BCAC-FF1A-455A-AE67-B7FD33ECD7DB
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldqxX4ACgkQuwUzVZGdMxQD7wCdGYOPaWxw9a424p+eds0WFOC/
Sd0AniQ06PpsKsKerW75NSKwoOvlyEuv
=/pwA
-----END PGP SIGNATURE-----

--Apple-Mail=_7F24BCAC-FF1A-455A-AE67-B7FD33ECD7DB--
