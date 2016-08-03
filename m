Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 68D7D731C4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Aug 2016 12:52:18 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x83so36152887wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Aug 2016 05:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=GJt04dGqS2zwjDZ0cKUw/139brKxtS1UQ+fEXbuFLq4=;
	b=TLflhKv/7oMF+RRUbGfg1NMxq1c5KshQrhhm3AGy9zsQR+HyoQ2bOZNmakqW5NHTuK
	YJ0qWYTcH9WfPKrLWtnOv/Xg4CJgYpMmFR89I1sFt1Tmw6SwlmEkK7h1/XcE7Thqbsno
	nbai+YofsBcfSwGDLgtgOcP1RczZfHYvRPRB7qxvkNH58Te4KgfASSZqrt1WQIvct4ZH
	ydpRcFoMniublm3k8ucjz/Y6nXpe4HgGu7YpOqMbIAFmYnrGDsb7dtu1MOZsbrrUFjki
	DrrDN/0LSutAVuqpNnLifTbB5dZIv9ijQ1/Mz6DCwn3wtwovBnQN2DzqUNtUoQRgr1Up
	uvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=GJt04dGqS2zwjDZ0cKUw/139brKxtS1UQ+fEXbuFLq4=;
	b=flb0ACq8It5FKOMrUYkneeNNIYcuty2xZ8JsCbArrWeJeLnaUvslCI5dG2353XwB1O
	5b8vb01O86gdcrJm6GrjCUmEnjBfAj1tksN1H6LU3mO5kqbrR64fvFG5oRIgEGSBZKhl
	fK3jVD7ZbhRPW9xCbe3EQ6UvwJgmTTd8EXP9xT3Jlh0YzjY8NZpKEBpBgaRF3o+I3bTd
	SFFFcYqbbP1j8Ayl3mIamGLGKGgwRlj0lGEur0Qt9yo748vRD6KDRGphmkZabbJSW99q
	gxPHLF/3wNsPC/tUH2vN5ff+KBPWpyQBKDFxUYzeO41rZ6P8MQNKH8lSZutpeenfyzdK
	r30A==
X-Gm-Message-State: AEkoouslC0eLtlC0KmD+qd2NGZx6/l/7k2bpSqPah+f7E6B+sO7cUTgLKAB+3ohWGXkGNQ==
X-Received: by 10.28.60.136 with SMTP id j130mr70592601wma.93.1470228738070;
	Wed, 03 Aug 2016 05:52:18 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	uo4sm7620635wjc.36.2016.08.03.05.52.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 03 Aug 2016 05:52:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 3 Aug 2016 14:52:22 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160803125222.h6z6coqrygdamro3@jama>
References: <1470226224-13589-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
In-Reply-To: <1470226224-13589-1-git-send-email-maxin.john@intel.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [PATCH] pointercal: move recipe to meta-oe
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
X-List-Received-Date: Wed, 03 Aug 2016 12:52:20 -0000
X-Groupsio-MsgNum: 62419
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ybwmdrnwc2hs2wte"
Content-Disposition: inline

--ybwmdrnwc2hs2wte
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 03, 2016 at 03:10:24PM +0300, Maxin B. John wrote:
> xtscal is being replaced with xinput-calibrator in oe-core
> and that made pointercal redundant. So, move it from oe-core to
> meta-oe.

It's added to meta-gpe not meta-oe.

I'll wait with applying this to master-next until someone says he needs
it, there is enough junk being moved from oe-core to meta-oe layers
already.

You also forgot to migrate pointercal related changes in layer.conf.

> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  .../recipes-graphics/pointercal/pointercal/COPYING |   2 ++
>  .../pointercal/pointercal/pointercal               |   0
>  .../pointercal/pointercal/qemuarm/pointercal       |   1 +
>  .../pointercal/pointercal/qemuarmv6/pointercal     |   1 +
>  .../pointercal/pointercal/qemuarmv7/pointercal     |   1 +
>  .../pointercal/pointercal/qemumips/pointercal      |   1 +
>  .../pointercal/pointercal/qemuppc/pointercal       | Bin 0 -> 36 bytes
>  .../pointercal/pointercal/qemux86-64/pointercal    |   1 +
>  .../pointercal/pointercal/qemux86/pointercal       |   1 +
>  .../recipes-graphics/pointercal/pointercal_0.0.bb  |  22 +++++++++++++++=
++++++
>  10 files changed, 30 insertions(+)
>  create mode 100644 meta-gpe/recipes-graphics/pointercal/pointercal/COPYI=
NG
>  create mode 100644 meta-gpe/recipes-graphics/pointercal/pointercal/point=
ercal
>  create mode 100644 meta-gpe/recipes-graphics/pointercal/pointercal/qemua=
rm/pointercal
>  create mode 100644 meta-gpe/recipes-graphics/pointercal/pointercal/qemua=
rmv6/pointercal
>  create mode 100644 meta-gpe/recipes-graphics/pointercal/pointercal/qemua=
rmv7/pointercal
>  create mode 100644 meta-gpe/recipes-graphics/pointercal/pointercal/qemum=
ips/pointercal
>  create mode 100644 meta-gpe/recipes-graphics/pointercal/pointercal/qemup=
pc/pointercal
>  create mode 100644 meta-gpe/recipes-graphics/pointercal/pointercal/qemux=
86-64/pointercal
>  create mode 100644 meta-gpe/recipes-graphics/pointercal/pointercal/qemux=
86/pointercal
>  create mode 100644 meta-gpe/recipes-graphics/pointercal/pointercal_0.0.bb
>=20
> diff --git a/meta-gpe/recipes-graphics/pointercal/pointercal/COPYING b/me=
ta-gpe/recipes-graphics/pointercal/pointercal/COPYING
> new file mode 100644
> index 0000000..63f5293
> --- /dev/null
> +++ b/meta-gpe/recipes-graphics/pointercal/pointercal/COPYING
> @@ -0,0 +1,2 @@
> +This is a blank COPYING file, and should be filled in by original author=
 in future.
> +
> diff --git a/meta-gpe/recipes-graphics/pointercal/pointercal/pointercal b=
/meta-gpe/recipes-graphics/pointercal/pointercal/pointercal
> new file mode 100644
> index 0000000..e69de29
> diff --git a/meta-gpe/recipes-graphics/pointercal/pointercal/qemuarm/poin=
tercal b/meta-gpe/recipes-graphics/pointercal/pointercal/qemuarm/pointercal
> new file mode 100644
> index 0000000..abd84ca
> --- /dev/null
> +++ b/meta-gpe/recipes-graphics/pointercal/pointercal/qemuarm/pointercal
> @@ -0,0 +1 @@
> +8313 4 -8526 7 8334 -82604 65536
> diff --git a/meta-gpe/recipes-graphics/pointercal/pointercal/qemuarmv6/po=
intercal b/meta-gpe/recipes-graphics/pointercal/pointercal/qemuarmv6/pointe=
rcal
> new file mode 100644
> index 0000000..abd84ca
> --- /dev/null
> +++ b/meta-gpe/recipes-graphics/pointercal/pointercal/qemuarmv6/pointercal
> @@ -0,0 +1 @@
> +8313 4 -8526 7 8334 -82604 65536
> diff --git a/meta-gpe/recipes-graphics/pointercal/pointercal/qemuarmv7/po=
intercal b/meta-gpe/recipes-graphics/pointercal/pointercal/qemuarmv7/pointe=
rcal
> new file mode 100644
> index 0000000..abd84ca
> --- /dev/null
> +++ b/meta-gpe/recipes-graphics/pointercal/pointercal/qemuarmv7/pointercal
> @@ -0,0 +1 @@
> +8313 4 -8526 7 8334 -82604 65536
> diff --git a/meta-gpe/recipes-graphics/pointercal/pointercal/qemumips/poi=
ntercal b/meta-gpe/recipes-graphics/pointercal/pointercal/qemumips/pointerc=
al
> new file mode 100644
> index 0000000..abd84ca
> --- /dev/null
> +++ b/meta-gpe/recipes-graphics/pointercal/pointercal/qemumips/pointercal
> @@ -0,0 +1 @@
> +8313 4 -8526 7 8334 -82604 65536
> diff --git a/meta-gpe/recipes-graphics/pointercal/pointercal/qemuppc/poin=
tercal b/meta-gpe/recipes-graphics/pointercal/pointercal/qemuppc/pointercal
> new file mode 100644
> index 0000000000000000000000000000000000000000..c2d6e37bf0c0d956ba17ba995=
5613c4cee5a147a
> GIT binary patch
> literal 36
> mcmXpsFt#*Q&;=3Dn=3D3lPgl!O+0i%uK=3D9!qiZ~%+%D_i~#_8+XjmO
>=20
> literal 0
> HcmV?d00001
>=20
> diff --git a/meta-gpe/recipes-graphics/pointercal/pointercal/qemux86-64/p=
ointercal b/meta-gpe/recipes-graphics/pointercal/pointercal/qemux86-64/poin=
tercal
> new file mode 100644
> index 0000000..640053d
> --- /dev/null
> +++ b/meta-gpe/recipes-graphics/pointercal/pointercal/qemux86-64/pointerc=
al
> @@ -0,0 +1 @@
> +1280 0 1002 0 960 328 65536
> diff --git a/meta-gpe/recipes-graphics/pointercal/pointercal/qemux86/poin=
tercal b/meta-gpe/recipes-graphics/pointercal/pointercal/qemux86/pointercal
> new file mode 100644
> index 0000000..640053d
> --- /dev/null
> +++ b/meta-gpe/recipes-graphics/pointercal/pointercal/qemux86/pointercal
> @@ -0,0 +1 @@
> +1280 0 1002 0 960 328 65536
> diff --git a/meta-gpe/recipes-graphics/pointercal/pointercal_0.0.bb b/met=
a-gpe/recipes-graphics/pointercal/pointercal_0.0.bb
> new file mode 100644
> index 0000000..df735a5
> --- /dev/null
> +++ b/meta-gpe/recipes-graphics/pointercal/pointercal_0.0.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "Touchscreen calibration data"
> +SECTION =3D "base"
> +PR =3D "r11"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4b5fcfc87fb615860d398b5e38685=
edf"
> +
> +SRC_URI =3D "file://pointercal \
> +           file://COPYING"
> +
> +S =3D "${WORKDIR}"
> +
> +do_install() {
> +	# Only install file if it has a contents
> +	if [ -s ${S}/pointercal ]; then
> +	        install -d ${D}${sysconfdir}/
> +	        install -m 0644 ${S}/pointercal ${D}${sysconfdir}/
> +	fi
> +}
> +
> +ALLOW_EMPTY_${PN} =3D "1"
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +INHIBIT_DEFAULT_DEPS =3D "1"
> --=20
> 2.4.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ybwmdrnwc2hs2wte
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleh6QUACgkQN1Ujt2V2gBzCaACfbI9Y6OeKmKaege4CJRcSEPVb
xCMAoKq1kCV9xqXj5rJTCCcYSnXnSkxw
=ZMmv
-----END PGP SIGNATURE-----

--ybwmdrnwc2hs2wte--
