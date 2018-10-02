Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id A46E779313
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Oct 2018 15:31:02 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id r63-v6so2708927wma.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Oct 2018 08:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=VJD7zQWLrJM4P4Q27Zo3ZIDWivgkA445dpY/g4KeaQw=;
	b=i8JpddSDtUIsKhyGWKtDX5gvqEdfcsEBZFCmon+yF7wd78T9hOTDYxyLSbHUBXREKe
	wpyTcLisZUBsEFfcqfyD8wlgZLZlPsXJPmCRJy+4nViKYTfYfrib+dPlYMMH4q1Jocvh
	wn5NujVVXzCGvmfPe39keb9oXDirfObGuvfvhxwMb8hWfJs7cjbtptFzTbEZzbZlsi3C
	lLRpE/GFxDMNRQFZMWPTHqGtEyKadRTSzWbQkmx6TTG3Xb00Hqxjdz+bn3Lnbyl7/y62
	/QFyH91k7j0BW5lCuFv50NfT9vGcyPGAuY/GOukR5jqEquO4AFimBzePWlSkndGwwxAp
	iW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=VJD7zQWLrJM4P4Q27Zo3ZIDWivgkA445dpY/g4KeaQw=;
	b=N+/4s2K9TbzjVCuu+xSNCyQpDp6ycGfTG1DpXou3ek+Gn4yBy9QS6wQcrNtYdk6Mt3
	NdQc4gABEnafDuEQmvCri92qdIoRXreZXDKiuKmr06s5FNuXoKac/a3uJCiI4QKlda+u
	xp3TZRhoTelVt4XsExvx0fwHAkLUCdEOJKWLrmCeOV9rfykKKsAM8a2uOwsxpP/iXbtU
	y1A+pWusHfylMeipDwwpx8hmYgUzE/vQECti8fvu8LvI/qcKOhMaHQpFq8h64YD8Dd8G
	ksWPdSe2IQzQAptUSjKL1dXU6YC5Dv2lLe1SE8OiOjeTWCEwFU73FZ+EC8zqdid/LFed
	Fs2g==
X-Gm-Message-State: ABuFfohrP75MUBTn9kd3eqV/OIfvDfgOsZ1N+UoEpFtf64aTztS86x38
	/wBXdLNApwe15u6Lkoi/fDk=
X-Google-Smtp-Source: ACcGV62gcowsImwz85AKyrqBYzDKnq2QdbPmgZ8N4+pavmNKnyYCwvKM/vy3sY78pFfedpvLNgw1+A==
X-Received: by 2002:a1c:4406:: with SMTP id r6-v6mr2354073wma.4.1538494263153; 
	Tue, 02 Oct 2018 08:31:03 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w2-v6sm18460054wre.46.2018.10.02.08.31.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Oct 2018 08:31:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 2 Oct 2018 17:31:02 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181002153102.GA1345@jama>
References: <20180930171718.41078-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20180930171718.41078-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] yasm: Add recipe ( previously in oe-core )
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
X-List-Received-Date: Tue, 02 Oct 2018 15:31:03 -0000
X-Groupsio-MsgNum: 74819
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline

--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 30, 2018 at 10:17:18AM -0700, Khem Raj wrote:
> Remove in OE-Core via
>=20
> http://git.openembedded.org/openembedded-core/commit/?id=3Db7f3f7ecfdf261=
29c5df2d3ee14e73c4633ea5a3
>=20
> while apps in OE-core have move to use nasm or other things yasm is
> still needed by some apps in rest of OE universe e.g. firefox
>=20
> switch to github URI since master has bunch of fixes over 1.3.0 release

One from this bunch is probably causing build failure for aarch64:

In file included from ../git/modules/arch/x86/x86id.c:1705:
x86insn_gas.gperf: In function 'insnprefix_gas_find':
x86insn_gas.gperf:1571:20: error: 'extractps_ins' undeclared (first use in =
this function); did you mean 'extractps_insn'?
 vextractps, extractps_insn, 2, SUF_Z, 0xC0, 0, 0, ONLY_AVX, CPU_AVX, 0, 0
                    ^~~~~~~~~~~~~
                    extractps_insn
x86insn_gas.gperf:1571:20: note: each undeclared identifier is reported onl=
y once for each function it appears in

At least I don't remember seeing this with oe-core recipe.

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-devtools/yasm/yasm_git.bb | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/yasm/yasm_git.bb
>=20
> diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-=
devtools/yasm/yasm_git.bb
> new file mode 100644
> index 0000000000..b685b42412
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "x86 (SSE) assembler supporting NASM and GAS-syntaxes"
> +LICENSE =3D "BSD"
> +HOMEPAGE =3D "http://www.tortall.net/projects/yasm/"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da12d8903508fb6bfd49d8d82c6170=
dd9"
> +
> +PV =3D "1.3.0+git${SRCPV}"
> +SRCREV =3D "35af9720e36df19382a57be26643b0d6bb48a363"
> +SRC_URI =3D "git://github.com/yasm/yasm.git"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools gettext
> +
> +export CCLD_FOR_BUILD =3D "${CC_FOR_BUILD}"
> +
> +BBCLASSEXTEND =3D "native"
> --=20
> 2.19.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW7OPNQAKCRA3VSO3ZXaA
HCEYAJ90gxzCUuTP5sa2gDS4+DTtuDhuHgCgl1X8KBzaBgHnaoRtRjUVG+xdMpQ=
=1gqR
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
