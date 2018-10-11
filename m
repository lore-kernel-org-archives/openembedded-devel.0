Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 40415799FC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 03:51:02 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id q17-v6so3513424plr.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 20:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=UntymvWlRpZ78sgD6kB0wqzxT42FvPcSH4AxjNEZsFk=;
	b=fyd5k5VkxUad7GWMugwd5KIKW1JMs7nXtmrjnc/a+8xcdB9fV84jKI3AV2Jm74RiCe
	cv3KnMdQntbtAd98hxvEGSav6ctia0C03U7ltLVesYs/yrDXzhwEMKJOVhyNMqCHLaA1
	RdR2dZXVi/GQmje0keDWUbYf3VVeFAj5onmOXvT2bDWyzABMqVydSaAmD0T3HthxGETj
	oszbzZtDV19tC+/DZy9zvNABWK6iEmcJ1VTOVurcC/ttvJ+0ZdIlUez/j6s1WQpzkqjK
	CIHWJY9/YYpzFkF7VB1krV5WKmkneRKf+71E6cl415KGo4Y+sWwr936UZwz8Ts4583s6
	FYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to;
	bh=UntymvWlRpZ78sgD6kB0wqzxT42FvPcSH4AxjNEZsFk=;
	b=ipGEp9awlgqustzVOiWr2lE9qATKqH2kNmuDAXjbMRq1BS8Vo9UwaztotS0/DSBfAY
	NSWEv8DJXUfWwjODuGei/UCjfdgaHiN3onCa4Aq8tMLiiJ/ooT14k0yZe5bygdP7dRXl
	SAGd7w9EoMhp4DvYcduBiSeuhOeJXc545tSXoDKN8CHvet/2VAKutoxKgH5Q9TIqXLfz
	Z8UVw3jVVF1Fgs/D2yEwqPxhEbVt4xECwbx1/lNk35DpaRxhpOCsuFstv5H4uo50VK0n
	7zVOXJMMqvcZFWHxtR0S9VHW3rcVwdTKtA4zWV7WCvKXBXvXyB9bHUIwo/UAYZ89snCE
	w4xw==
X-Gm-Message-State: ABuFfog+KVZPwA/QphrUd+zZKq9o1N4AJdfeYslsOHkm3RRKwoWDA62p
	8EmrJkGS0BuheZbnMf4p0Fgzqczq
X-Google-Smtp-Source: ACcGV63xZ1bTHNPkPiYKcU0tl40FFMqmLWajNudurKrJ3kbn4QyRKEhOSSJvT/NR1bfSD10JW+mvIQ==
X-Received: by 2002:a17:902:8646:: with SMTP id
	y6-v6mr1862149plt.86.1539229862678; 
	Wed, 10 Oct 2018 20:51:02 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:a883:bd0f:1ae6:7527])
	by smtp.gmail.com with ESMTPSA id
	a86-v6sm36032478pfg.106.2018.10.10.20.51.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 20:51:02 -0700 (PDT)
To: James Feist <james.feist@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
References: <20181010231337.46391-1-james.feist@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Organization: HIMVIS LLC
Message-ID: <36dfdaa9-3867-20f2-33de-ef4e8bf51fc0@gmail.com>
Date: Wed, 10 Oct 2018 20:50:48 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181010231337.46391-1-james.feist@linux.intel.com>
Subject: Re: [meta-oe][PATCH v2] valijson: Add recipe
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
X-List-Received-Date: Thu, 11 Oct 2018 03:51:02 -0000
X-Groupsio-MsgNum: 74946
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="FwBHdfyY8xqxI2dGJvBjbHzNV1Y3wNO4u"

--FwBHdfyY8xqxI2dGJvBjbHzNV1Y3wNO4u
Content-Type: multipart/mixed; boundary="dcAwyENnihYTcuzvB51RmZT4so4Vbfdsj";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: James Feist <james.feist@linux.intel.com>,
 openembedded-devel@lists.openembedded.org
Message-ID: <36dfdaa9-3867-20f2-33de-ef4e8bf51fc0@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] valijson: Add recipe
References: <20181010231337.46391-1-james.feist@linux.intel.com>
In-Reply-To: <20181010231337.46391-1-james.feist@linux.intel.com>

--dcAwyENnihYTcuzvB51RmZT4so4Vbfdsj
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi James

On 10/10/18 4:13 PM, James Feist wrote:
> valijson is a header only c++ library for JSON
> schema validation.
>=20
> Signed-off-by: James Feist <james.feist@linux.intel.com>
> ---
>=20
> Changes since v1:
>     - Fixed license
>     - Simplified symlink
>     - Removed extra whitespace
>=20
>  .../recipes-devtools/valijson/valijson_git.bb | 26 +++++++++++++++++++=

>  1 file changed, 26 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/valijson/valijson_git.bb
>=20
> diff --git a/meta-oe/recipes-devtools/valijson/valijson_git.bb b/meta-o=
e/recipes-devtools/valijson/valijson_git.bb
> new file mode 100644
> index 000000000..e7edab646
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/valijson/valijson_git.bb
> @@ -0,0 +1,26 @@
> +SUMMARY =3D "Header-only C++ library for JSON Schema validation"
> +HOMEPAGE =3D "https://github.com/tristanpenman/valijson"
> +LICENSE =3D "BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D015106c62262b2383f6c72063f0=
998f2"
> +
> +SRC_URI =3D "git://github.com/tristanpenman/valijson.git"
> +PV =3D "0.1+git${SRCPV}"
> +
> +SRCREV =3D "c2f22fddf599d04dc33fcd7ed257c698a05345d9"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE =3D "-DINSTALL_HEADERS=3D1 -DBUILD_TESTS=3D0"
> +
> +# valijson is a header only C++ library, so the main package will be e=
mpty.
> +RDEPENDS_${PN}-dev =3D ""
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +# valijson expects json.hpp where nlohmann-json_git.bb installs
> +# nlohmann/json.hpp, this allows usage via json.hpp
> +do_install_append() {
> +    ln -s nlohmann/json.hpp ${D}${includedir}/json.hpp
> +}

its better to install this symlink in nlohmann-json package recipe since
that will make sure that we do not have dangling symlinks in cases where
this dependencies are not together.


--dcAwyENnihYTcuzvB51RmZT4so4Vbfdsj--

--FwBHdfyY8xqxI2dGJvBjbHzNV1Y3wNO4u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCW77IoQAKCRC7BTNVkZ0z
FEMYAJ9VhhPTBUF3yvtV4kwWHuApH9tzzgCffysHqMUAojr8xSQKPzxkXt3tqEY=
=ILMX
-----END PGP SIGNATURE-----

--FwBHdfyY8xqxI2dGJvBjbHzNV1Y3wNO4u--
