Return-Path: <shantanu@senic.com>
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
	[209.85.167.50])
	by mail.openembedded.org (Postfix) with ESMTP id A06027CFE9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 19:55:05 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id p197so27529618lfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 12:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=senic-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=qH7dIkg0h6SA4v1c41us5s6FpR0eoJ4H4MtIlJbDgrE=;
	b=XO0+sJ1iZir43nlQNZ9faFY+2uvzdoErx9c2zfLHyXezMoeLNYBiQNw0/CEW3ZeLyk
	Oeb4I30LPGKXDiXc6N9SOz/KzMOosIcvZvGdRoy+eb78ChteSZ4Q+J+tj+Uc9saMwlPJ
	Iit4zck+7f7EGJqtpNifmOR0OEvDZQcZq5FZnyfW3+W2SalmKFrJP1/BnSS72mjoV93l
	iVKQw90D2bnXb4PH7xnYrXV1wC3yRErxiL8XnWXdE9GVt9pa7a8YpVXHgMxujuHeKIdI
	pBlicOup8St1KlowlttGmidAiTLjhTHLOgJ5/Fk1VqVsvMCjNpqlg28FUp5ntU6E9r2i
	DMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=qH7dIkg0h6SA4v1c41us5s6FpR0eoJ4H4MtIlJbDgrE=;
	b=kAj8qyDMpVBbFLgaFpbvlk1+kzySUSBana8QMG5hMpuGjciV6OHKf0yHEJ5Qwut6BY
	9EheRNV0xaCUHtV0b9neHX0biIEkmipwyOCcrQ+TnTRQxGYZt4VO/puipT8iWcyh7666
	kMTXEzI7hswq2BTwBE4kNKp5J+SDyIrkmKiwC6PCxXFe6qfQCRj7KV3CZkp1vePnKsYZ
	Ru+nk7euqAls6eUWRWaeGQs7br0+mPu8FImZleCiBv9QKLxztvWSd7CG3dSR6foD/Kgd
	1fSjK/FNfi8vrGl0h7WckdFFN/ecF2PNdYREovJjsUXoq/3cGjbwMN42u/C1dS0UMrWa
	B0FQ==
X-Gm-Message-State: APjAAAW0ZjK88BuKtPJg868VcJeKR7yOKfvcwWlNZQOcyRmO8NZpUFmA
	YwupfxzQs1auNU4SPFWNphDAglZidQDxlg1mlpiNE7/rZ+c=
X-Google-Smtp-Source: APXvYqzaG/55S2iKLUR73yDodFAm+gVUpnVde7MBthUXDKAFa5ze2wN2V1CB0LBjcElMsAPpmbnNM4yDg95LuPcCsHU=
X-Received: by 2002:a05:6512:1da:: with SMTP id
	f26mr32337449lfp.129.1563825305973; 
	Mon, 22 Jul 2019 12:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190722195241.2820-1-shantanu@senic.com>
In-Reply-To: <20190722195241.2820-1-shantanu@senic.com>
From: Shantanu Choudhary <shantanu@senic.com>
Date: Tue, 23 Jul 2019 01:24:54 +0530
Message-ID: <CAGeQtJRX1_RZO5_s9+e0nOT8imV0fHMdYtjHro2Er_ROncgO8Q@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v2] Add recipe for python bindings of Berkeley DB
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
X-List-Received-Date: Mon, 22 Jul 2019 19:55:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2019 at 1:22 AM Shantanu <shantanu@senic.com> wrote:

> Included correction suggested from Khem of using STAGING_EXECPREFIXDIR
> and including python3 with DEPENDS.
>

I don't have access to the master branch to test the suggestions, could
someone help me out and confirm if this recipe works okay on the master,
please?


>
> Signed-off-by: Shantanu <shantanu@senic.com>
> ---
>  .../python/python3-bsddb3_6.2.6.bb            | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-bsddb3_6.2.6.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
> b/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
> new file mode 100644
> index 000000000..7a298014b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
> @@ -0,0 +1,19 @@
> +SUMMARY =3D "pybsddb is the Python binding for the Oracle Berkeley DB"
> +HOMEPAGE =3D "https://www.jcea.es/programacion/pybsddb.htm"
> +SECTION =3D "devel/python"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3Db3c8796b7e1f8eda0aef7e242e18ed43"
> +SRC_URI[sha256sum] =3D
> "42d621f4037425afcb16b67d5600c4556271a071a9a7f7f2c2b1ba65bc582d05"
> +
> +inherit pypi setuptools3
> +
> +PYPI_PACKAGE =3D "bsddb3"
> +
> +DEPENDS =3D "db \
> +  python3 \
> +"
> +
> +DISTUTILS_BUILD_ARGS =3D "--berkeley-db=3D${STAGING_EXECPREFIXDIR}"
> +DISTUTILS_INSTALL_ARGS =3D "--berkeley-db=3D${STAGING_EXECPREFIXDIR}"
> +
> +RDEPENDS_${PN} =3D "db"
> \ No newline at end of file
> --
> 2.17.1
>
>

--=20

*Shantanu *

Software Developer at Senic <https://www.senic.com>


Buy Nuimo Click
<http://www.senic.com/en/nuimo-click?utm_source=3Demailsignature&utm_medium=
=3Dorganic>
 =C2=B7 Buy Nuimo Control
<http://www.senic.com/en/nuimo-control?utm_source=3Demailsignature&utm_medi=
um=3Dorganic>

Join Newsletter <https://senic.co/join-newsletter> =C2=B7 We're hiring
<https://senic.co/about-senic> =C2=B7 In the News <https://senic.co/in-the-=
news>

SENIC GmbH
Pfuelstr. 5
10997 Berlin
Germany

Amtsgericht Charlottenburg, HRB160913, Ust-Ident.Nr.: DE294820161

IBAN: DE 77 59070070 0026919100 BIC: DEUTDEDB595 Deutsche Bank

