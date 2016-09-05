Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 53DD260616
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Sep 2016 11:37:36 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id a6so1646687wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Sep 2016 04:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=XG0eYqcectPIaQV/K08s15zDmneKp8KUB5bYNxOkBDg=;
	b=P1xmHoV9VpR5IZUacpU25w7bzQILCwP5mASEs/qgm6lituohTVUAAcJMswbSYuDDGJ
	FlauF2+iQxTbeCm8t0bYNqBF6dFuMJZPeZpRQnXSdWipZmZDbNV/YmYscm6u3hX6O6OE
	CIbyhnve2WmgFhHIm9Q4CT47CjYSwKSHd0U5EtRThjFOAkQZcos8mLBR9nybkk8y4HOR
	N35wjGgk49yY2kiaurOtLSqQ1sUc/mVyngitspeOdFgb54SlZtb9YgdScRkiKf5Uz5rb
	fRnr2rK/hSpAoWzLWfJgAOdAUjwnIJc45UzhwAr0u7b0zJzh0fVxfWV4jZzmcV+3oMSQ
	4EnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=XG0eYqcectPIaQV/K08s15zDmneKp8KUB5bYNxOkBDg=;
	b=BkmMbWV/itOK7nMbldJUBfIYxiS74zKYlh9sMSsY7IjjeLoljdh66IEiPiyETWY/u0
	9okm9B04jTBSbaun5PaD2OQU6aVnYgL7yRXrP/MjwQzWWwiNFStumkChdfC1T23L/5U7
	6Gi+6XMEZS/dPtYIWxTXhyDdXWwbOmf4HMa2Witi0mwp8qsEiwFgRVsbiYa2u04AbUee
	khzerqJUolkXaF+93v383u1/6Xe/O+2oT/BmyvaOHpXuSam6WCqYVzaCTCpvHYbfUxkc
	jNikqsEMBWlxCxkXWt3fD9XlDMMqm6QIlt6ISfT5gZKeKHPnWQoQr2cM2WBF101KstYE
	EzGQ==
X-Gm-Message-State: AE9vXwOpx4YYfmG4xf88dNe4lVNK4ycj3iE47t5ANwt+W7fozlCJOjGhzvrg13F0O1m9Mg==
X-Received: by 10.28.61.87 with SMTP id k84mr2881572wma.98.1473075456728;
	Mon, 05 Sep 2016 04:37:36 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	bj8sm27244309wjc.49.2016.09.05.04.37.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 05 Sep 2016 04:37:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 5 Sep 2016 13:37:36 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160905113736.xixna5rd4lq5ttne@jama>
References: <1472730043-31245-1-git-send-email-maxin.john@intel.com>
	<1472730043-31245-2-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
In-Reply-To: <1472730043-31245-2-git-send-email-maxin.john@intel.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [PATCH 1/4] pointercal: move recipe from oe-core
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
X-List-Received-Date: Mon, 05 Sep 2016 11:37:37 -0000
X-Groupsio-MsgNum: 62967
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4bniyksqdmmhykpg"
Content-Disposition: inline

--4bniyksqdmmhykpg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 01, 2016 at 02:40:40PM +0300, Maxin B. John wrote:
> Move pointercal recipe from oe-core layer.
>=20
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta-gpe/recipes-bsp/pointercal/pointercal/COPYING |   2 ++
>  .../recipes-bsp/pointercal/pointercal/pointercal   |   0
>  .../pointercal/pointercal/qemuarm/pointercal       |   1 +
>  .../pointercal/pointercal/qemuarmv6/pointercal     |   1 +
>  .../pointercal/pointercal/qemuarmv7/pointercal     |   1 +
>  .../pointercal/pointercal/qemumips/pointercal      |   1 +
>  .../pointercal/pointercal/qemuppc/pointercal       | Bin 0 -> 36 bytes
>  .../pointercal/pointercal/qemux86-64/pointercal    |   1 +
>  .../pointercal/pointercal/qemux86/pointercal       |   1 +
>  meta-gpe/recipes-bsp/pointercal/pointercal_0.0.bb  |  22 +++++++++++++++=
++++++
>  10 files changed, 30 insertions(+)
>  create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/COPYING
>  create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/pointercal
>  create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/qemuarm/po=
intercal
>  create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/qemuarmv6/=
pointercal
>  create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/qemuarmv7/=
pointercal
>  create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/qemumips/p=
ointercal
>  create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/qemuppc/po=
intercal
>  create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/qemux86-64=
/pointercal
>  create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/qemux86/po=
intercal
>  create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal_0.0.bb
>=20
> diff --git a/meta-gpe/recipes-bsp/pointercal/pointercal/COPYING b/meta-gp=
e/recipes-bsp/pointercal/pointercal/COPYING
> new file mode 100644
> index 0000000..63f5293
> --- /dev/null
> +++ b/meta-gpe/recipes-bsp/pointercal/pointercal/COPYING
> @@ -0,0 +1,2 @@
> +This is a blank COPYING file, and should be filled in by original author=
 in future.
> +
> diff --git a/meta-gpe/recipes-bsp/pointercal/pointercal/pointercal b/meta=
-gpe/recipes-bsp/pointercal/pointercal/pointercal
> new file mode 100644
> index 0000000..e69de29
> diff --git a/meta-gpe/recipes-bsp/pointercal/pointercal/qemuarm/pointerca=
l b/meta-gpe/recipes-bsp/pointercal/pointercal/qemuarm/pointercal
> new file mode 100644
> index 0000000..abd84ca
> --- /dev/null
> +++ b/meta-gpe/recipes-bsp/pointercal/pointercal/qemuarm/pointercal
> @@ -0,0 +1 @@
> +8313 4 -8526 7 8334 -82604 65536
> diff --git a/meta-gpe/recipes-bsp/pointercal/pointercal/qemuarmv6/pointer=
cal b/meta-gpe/recipes-bsp/pointercal/pointercal/qemuarmv6/pointercal
> new file mode 100644
> index 0000000..abd84ca
> --- /dev/null
> +++ b/meta-gpe/recipes-bsp/pointercal/pointercal/qemuarmv6/pointercal
> @@ -0,0 +1 @@
> +8313 4 -8526 7 8334 -82604 65536
> diff --git a/meta-gpe/recipes-bsp/pointercal/pointercal/qemuarmv7/pointer=
cal b/meta-gpe/recipes-bsp/pointercal/pointercal/qemuarmv7/pointercal
> new file mode 100644
> index 0000000..abd84ca
> --- /dev/null
> +++ b/meta-gpe/recipes-bsp/pointercal/pointercal/qemuarmv7/pointercal
> @@ -0,0 +1 @@
> +8313 4 -8526 7 8334 -82604 65536
> diff --git a/meta-gpe/recipes-bsp/pointercal/pointercal/qemumips/pointerc=
al b/meta-gpe/recipes-bsp/pointercal/pointercal/qemumips/pointercal
> new file mode 100644
> index 0000000..abd84ca
> --- /dev/null
> +++ b/meta-gpe/recipes-bsp/pointercal/pointercal/qemumips/pointercal
> @@ -0,0 +1 @@
> +8313 4 -8526 7 8334 -82604 65536
> diff --git a/meta-gpe/recipes-bsp/pointercal/pointercal/qemuppc/pointerca=
l b/meta-gpe/recipes-bsp/pointercal/pointercal/qemuppc/pointercal
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
> diff --git a/meta-gpe/recipes-bsp/pointercal/pointercal/qemux86-64/pointe=
rcal b/meta-gpe/recipes-bsp/pointercal/pointercal/qemux86-64/pointercal
> new file mode 100644
> index 0000000..640053d
> --- /dev/null
> +++ b/meta-gpe/recipes-bsp/pointercal/pointercal/qemux86-64/pointercal
> @@ -0,0 +1 @@
> +1280 0 1002 0 960 328 65536
> diff --git a/meta-gpe/recipes-bsp/pointercal/pointercal/qemux86/pointerca=
l b/meta-gpe/recipes-bsp/pointercal/pointercal/qemux86/pointercal
> new file mode 100644
> index 0000000..640053d
> --- /dev/null
> +++ b/meta-gpe/recipes-bsp/pointercal/pointercal/qemux86/pointercal
> @@ -0,0 +1 @@
> +1280 0 1002 0 960 328 65536
> diff --git a/meta-gpe/recipes-bsp/pointercal/pointercal_0.0.bb b/meta-gpe=
/recipes-bsp/pointercal/pointercal_0.0.bb
> new file mode 100644
> index 0000000..df735a5
> --- /dev/null
> +++ b/meta-gpe/recipes-bsp/pointercal/pointercal_0.0.bb
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

Use 4 spaces for indentation.

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

--4bniyksqdmmhykpg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEUEARECAAYFAlfNWPwACgkQN1Ujt2V2gBwgkgCY3i/lxuyEaKcEI33VoyoBQudP
VgCfUhU1eNhVXLs3+0nsGugf11crtzM=
=adrh
-----END PGP SIGNATURE-----

--4bniyksqdmmhykpg--
