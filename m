Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C5F4C71A9D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 11:45:58 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d140so11410853wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 03:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=2Sel4JM2fQ2GzZvOoljBS5fLpznu5BO4tU5zoMrUb4E=;
	b=jO24rh9kpFBDrFJO5c4ufLiAjcHMq7IRmpkVSi8fd7x9WGW9uM0MfS6wKNvpxOiQs/
	UDN7pg72gYzEzyNjaCIbluj6DKRY1n14fUVzTpftCvJCx3O8t/RfcQekAsJfUjw7SbG1
	jiZ2Kp39R808pavSQQX+ZPizMt+XZ6t7vX3yrgzown82wbg/3TimGiVNjtl1J4d3tVeQ
	cWgpyvS5GRLyZvw6UU+TSAaA1l1Ud9Y7/dtNLG8NWNyMWbueeDXpXyEq4rRBxBbwwBIy
	DFjttUeeKUvKCejXaVsaqK43vVMgAw8QkJgTMpVl1yqNKFV6ZIFKxXua8ku7HkIoPtMe
	qKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=2Sel4JM2fQ2GzZvOoljBS5fLpznu5BO4tU5zoMrUb4E=;
	b=Ig/8yW9PaUqiyvQJ8BOgSk3l8owNIMgb6K5YCm6qZUNovC5AegpdnjD2eBKd48oxUr
	qPx+Q6F8seh/Xl0sHO/kA8IEDc16E64qKhGoXfI+UlFBnT3x1wXz3XqxWcsSKCaDzuPg
	Vk2ZMV/LITF+pKansRpYbfnkO3Cy4DvWwTerCEu5AJfP61kCepuOV+I1VGs3+K4Hgbkt
	isqfvNO5BMflrkHbfVKQqXrmjGmVs/4QWLZs2Q7dlQ+CNN6wwTlWZnrQ5hw3scBGd0MS
	eN/zTx21ergO3LF86rPU2dUq11+4eEDg5XIAM3x+XtravlNH6wTjiAkbovayN2HnzLa6
	3e3w==
X-Gm-Message-State: AIkVDXJAbq7rIHlTQturHLTW2NriFy/PsCPeQ0oHHcSBQFZngNfBZbcR+aNhXJw74Xhw8w==
X-Received: by 10.28.5.70 with SMTP id 67mr23847951wmf.32.1484826358904;
	Thu, 19 Jan 2017 03:45:58 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 81sm12289859wmw.7.2017.01.19.03.45.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 19 Jan 2017 03:45:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Jan 2017 12:46:00 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170119114600.GH3265@jama>
References: <1482083368-9718-1-git-send-email-s.mueller-klieser@phytec.de>
MIME-Version: 1.0
In-Reply-To: <1482083368-9718-1-git-send-email-s.mueller-klieser@phytec.de>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-oe][PATCH] pmbw: add recipe for ram benchmarks
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
X-List-Received-Date: Thu, 19 Jan 2017 11:45:59 -0000
X-Groupsio-MsgNum: 64793
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Yia77v5a8fyVHJSl"
Content-Disposition: inline

--Yia77v5a8fyVHJSl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 18, 2016 at 06:49:28PM +0100, Stefan M=FCller-Klieser wrote:
> This adds the Parallel Memory Bandwidth Benchmark tool to the layer. It
> consists of a collection of assembly routines for testing cache and
> memory access performance. It also contains a converter to generate
> gnuplot scripts for the results.

Fails to build for qemuarm:
http://errors.yoctoproject.org/Errors/Details/117458/

>=20
> Signed-off-by: Stefan M=FCller-Klieser <s.mueller-klieser@phytec.de>
> ---
>  meta-oe/recipes-benchmark/pmbw/pmbw_git.bb | 28 ++++++++++++++++++++++++=
++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta-oe/recipes-benchmark/pmbw/pmbw_git.bb
>=20
> diff --git a/meta-oe/recipes-benchmark/pmbw/pmbw_git.bb b/meta-oe/recipes=
-benchmark/pmbw/pmbw_git.bb
> new file mode 100644
> index 0000000..7a69395
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/pmbw/pmbw_git.bb
> @@ -0,0 +1,28 @@
> +SUMMERY =3D "Parallel Memory Bandwidth Measurement / Benchmark"
> +DESCRIPTION =3D "\
> +The tool pmbw is a set of assembler routines to measure the parallel mem=
ory \
> +(cache and RAM) bandwidth of modern multi-core machines."
> +HOMEPAGE =3D "http://panthema.net/2013/pmbw/"
> +SECTION =3D "benchmark/tests"
> +AUTHOR =3D "Timo Bingmann"
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> +
> +SRC_URI =3D "git://github.com/bingmann/pmbw;protocol=3Dhttps"
> +
> +PV =3D "0.6.2+git${SRCPV}"
> +SRCREV =3D "4a3b37728060a8aba06fc83f157a1965088d79d6"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools
> +
> +# the hand coded asm uses r11, which therefore cannot be used for storing
> +# the frame pointer when debugging on arm
> +SELECTED_OPTIMIZATION_remove_arm =3D "-fno-omit-frame-pointer"
> +
> +PACKAGES =3D+ "${PN}-stats2gnuplot"
> +
> +FILES_${PN}-stats2gnuplot =3D "${bindir}/stats2gnuplot"
> +
> +RRECOMMENDS_${PN} =3D "${PN}-stats2gnuplot"
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

--Yia77v5a8fyVHJSl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWICm9wAKCRA3VSO3ZXaA
HGQMAJ43xBupMM0/2QocQlkuXu/KNmmOfQCfY4jY04+k1WbV3VlVmb7FlTY8WQc=
=HhoT
-----END PGP SIGNATURE-----

--Yia77v5a8fyVHJSl--
