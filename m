Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7212D6FF7F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 13:54:40 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id c201so76054258wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 05:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TlcfCsKb1QupbRiTvwuD56TFym6vWla0JQ5o7B1UBV0=;
	b=ZbqkbbMROT4zf9inEQR7aRgzQU3L9hGVbvu1WbWbtWyoTOLqS9I/4DR5FvN1jKp7dO
	8L66HiKTB3nd3SuIf19+hMIX5VSUdlqeFE1SDToH1N/A4kT8b68vkbk7mleGkqXZwueO
	eGvoIM2LI3mWO0ZWyTbciBECr/sP8sRZw6SceZwenv50mRmr2s/ruWsjA2Mby8xJwaAC
	6YUa38oA1cQp/EfglbVCydPh8jorxl4/8G83W2sh/7Du+6jQkIONYRljWc+wzBI463P6
	NvrsmbNp2qxMsIM4FuD0pn9xnijymggqhRcfLC4XI0RyULNxeaukAbwPd3PGCFuOqYsh
	HblA==
X-Received: by 10.28.175.144 with SMTP id y138mr5936035wme.47.1449842081262;
	Fri, 11 Dec 2015 05:54:41 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	m191sm3497770wma.3.2015.12.11.05.54.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Dec 2015 05:54:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 11 Dec 2015 14:56:31 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151211135631.GC2248@jama>
References: <1448514821-22998-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1448514821-22998-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH] phoronix-test-suite: uprev it to 6.0.1
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
X-List-Received-Date: Fri, 11 Dec 2015 13:54:41 -0000
X-Groupsio-MsgNum: 58974
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QRj9sO5tAVLaXnSD"
Content-Disposition: inline

--QRj9sO5tAVLaXnSD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2015 at 01:13:41PM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> 1. inherit systemd and move the systemd unit files to correct dir
> 2. inherit allarch
> 3. add bash/python/php-cli to RDEDEPENDS

Rebased and resend with -M


OE @ ~/meta-openembedded $ pwam 108619
2015-12-11 14:55:45 URL:http://patchwork.openembedded.org/patch/108619/mbox=
/ [3926] -> "pw-am-108619.patch" [1]
Applying: phoronix-test-suite: uprev it to 6.0.1
error: patch failed: meta-oe/recipes-benchmark/phoronix-test-suite/phoronix=
-test-suite_5.2.1.bb:1
error: meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_5.=
2.1.bb: patch does not apply
Patch failed at 0001 phoronix-test-suite: uprev it to 6.0.1
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../phoronix-test-suite_5.2.1.bb                   | 24 ----------------
>  .../phoronix-test-suite_6.0.1.bb                   | 33 ++++++++++++++++=
++++++
>  2 files changed, 33 insertions(+), 24 deletions(-)
>  delete mode 100644 meta-oe/recipes-benchmark/phoronix-test-suite/phoroni=
x-test-suite_5.2.1.bb
>  create mode 100644 meta-oe/recipes-benchmark/phoronix-test-suite/phoroni=
x-test-suite_6.0.1.bb
>=20
> diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-=
suite_5.2.1.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-tes=
t-suite_5.2.1.bb
> deleted file mode 100644
> index 0fc5e8d..0000000
> --- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_5=
=2E2.1.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -SUMMARY =3D "Phoronix Test Suite"
> -DESCRIPTION =3D "The Phoronix Test Suite is designed to carry out both q=
ualitative \
> -and quantitative benchmarks in a clean, reproducible, and easy-to-use ma=
nner."
> -LICENSE =3D "GPLv3"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> -SECTION =3D "console/tests"
> -
> -SRC_URI =3D "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
> -SRC_URI[md5sum] =3D "51e52d883710dc516c5494bd1c377219"
> -SRC_URI[sha256sum] =3D "1186f460691e2fe7a07df5edb8d8ed1ac0c65327512e646d=
a2b2e3a60dda6cd9"
> -S =3D "${WORKDIR}/phoronix-test-suite"
> -
> -do_install() {
> -	DESTDIR=3D${D} ./install-sh ${exec_prefix}
> -}
> -
> -#RDEPENDS_${PN} =3D "php-cli"
> -FILES_${PN} +=3D " \
> -	${datadir}/phoronix-test-suite \
> -	${datadir}/appdata/phoronix-test-suite.appdata.xml \
> -	${datadir}/icons/hicolor/48x48/apps/phoronix-test-suite.png \
> -	${datadir}/icons/hicolor/64x64/mimetypes/application-x-openbenchmarking=
=2Epng \
> -	${datadir}/mime/packages/openbenchmarking-mime.xml \
> -"
> diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-=
suite_6.0.1.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-tes=
t-suite_6.0.1.bb
> new file mode 100644
> index 0000000..7f617ce
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6=
=2E0.1.bb
> @@ -0,0 +1,33 @@
> +SUMMARY =3D "Phoronix Test Suite"
> +DESCRIPTION =3D "The Phoronix Test Suite is designed to carry out both q=
ualitative \
> +and quantitative benchmarks in a clean, reproducible, and easy-to-use ma=
nner."
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> +SECTION =3D "console/tests"
> +
> +SRC_URI =3D "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
> +SRC_URI[md5sum] =3D "c3b26fcc57a3a253e558f759fdc1089f"
> +SRC_URI[sha256sum] =3D "27add54f4ecb464549de580cece84b4a4945b99df3ef7ff7=
034eb7f23ffb3b39"
> +S =3D "${WORKDIR}/phoronix-test-suite"
> +
> +
> +inherit systemd allarch
> +
> +do_install() {
> +	DESTDIR=3D${D} ./install-sh ${exec_prefix}
> +        install -d ${D}/${systemd_unitdir}/system/
> +        mv ${D}/usr/lib/systemd/system/* ${D}/${systemd_unitdir}/system/
> +        rm -rf ${D}/usr/lib/
> +}
> +
> +SYSTEMD_SERVICE_${PN} =3D "phoromatic-client.service phoromatic-server.s=
ervice"
> +RDEPENDS_${PN} +=3D "bash python php-cli"
> +
> +FILES_${PN} +=3D " \
> +	${datadir}/phoronix-test-suite \
> +	${datadir}/appdata/phoronix-test-suite.appdata.xml \
> +	${datadir}/icons/hicolor/48x48/apps/phoronix-test-suite.png \
> +	${datadir}/icons/hicolor/64x64/mimetypes/application-x-openbenchmarking=
=2Epng \
> +	${datadir}/mime/packages/openbenchmarking-mime.xml \
> +	${systemd_unitdir}/system/* \
> +"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QRj9sO5tAVLaXnSD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZq1g4ACgkQN1Ujt2V2gBwvMQCfZmIrJNjM5hF9FryK7J1BlGcp
pG4AoKDIG1ae2eMaiWEP+f+PKptd/wYx
=dhv2
-----END PGP SIGNATURE-----

--QRj9sO5tAVLaXnSD--
