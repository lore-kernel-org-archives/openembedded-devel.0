Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 381C778A11
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2018 17:07:45 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id k1-v6so1547030plt.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jul 2018 10:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=WpSacyLzX/LBThx10Z8+DzpWwuT5S9C6ka80Sj87LMA=;
	b=sQfd06HDP1lIV731TmgNE8e3qLp9VLxj7vViiTCsMdZIa/SRihXClo/O+Trg7uh12j
	+TJVPPNWH35wUfWRP+Sn7QICPVJ+XxmVV8prnZzJDWhM0gHSP2WS6Xy1wAeI0JNAErek
	NOg7e+vwdPQxFCUNzUDwZD7B4mihy5dUP1nx4TfuoPaPhKW7lLTRNdRQc+6fPcxVZqwx
	Jz9vZCKhBoDwYOEVU9R6cQAi1+iAhjL+kMTKTLAHJ/43c99bAL/phWW2br9VeOXvnYDY
	JOeoq90To3Ary8XltaLVZZikMimQeTC+nCRSi9GiTk47H2Oy39FzhJxTWRi8EjUMBljn
	wuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=WpSacyLzX/LBThx10Z8+DzpWwuT5S9C6ka80Sj87LMA=;
	b=G7JiODZFB5i5fzVtbCT4T1noBKlyx08iPgw0E8BBxi3Nu6dQk7ZrV2BCWJBIOqmiJh
	Kl13YdPNzP5FHfxUnjT2r0lEN6pQQAHZWxpB9a7t3BxHFvOm+KUDB6QT/qfWUlngf6Ih
	1Ga2Hc0zc4s0SBbJpU1Axhj2jftYdp2P+0Iyd7RSNqUTXeenm7du+QqVRQWcK8gbyj1l
	fjioCFjF9BNm4qUg6pYukdIoZmlrVd+Vyb+NwyCNKfxLvAbkcNmyj70alzZaUNHTFm4M
	R5zj7nETyI/Gpn1hGnKjxnUxQQV06VcnvKEaNnyp2lXbQAhmw+BSb2FChg0NO3udWDJ0
	tujA==
X-Gm-Message-State: APt69E2EoMMR/M6SKenmwyGsyH+kwjvi7mtTts+dZxxJ8FPAu3Wp1i4n
	XXGjy29VIpeZLEWg842D5FojR6eg
X-Google-Smtp-Source: AAOMgpf1G13Jhim1FfSPheBWzm1hB0UD/ln1Ncf4v7LN9KgM/xHj0bjvcs82hj6et7/VsvsDfGQMyQ==
X-Received: by 2002:a17:902:724a:: with SMTP id
	c10-v6mr7108906pll.64.1530810465912; 
	Thu, 05 Jul 2018 10:07:45 -0700 (PDT)
Received: from ?IPv6:2601:646:877f:9499:b95e:f0e0:47b8:11a8?
	([2601:646:877f:9499:b95e:f0e0:47b8:11a8])
	by smtp.gmail.com with ESMTPSA id
	u68-v6sm11274721pfb.159.2018.07.05.10.07.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jul 2018 10:07:45 -0700 (PDT)
To: Krzysztof Kozlowski <krzk@kernel.org>,
	openembedded-devel@lists.openembedded.org
References: <20180705165513.28142-1-krzk@kernel.org>
	<20180705165513.28142-4-krzk@kernel.org>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <a3b348af-5c71-f8f9-d5a9-cc5e7ab2cd14@gmail.com>
Date: Thu, 5 Jul 2018 10:07:38 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180705165513.28142-4-krzk@kernel.org>
Subject: Re: [meta-networking][PATCH v4 3/3] kernel_wireless_regdb: Add class for embedding regulatory data into older kernel
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
X-List-Received-Date: Thu, 05 Jul 2018 17:07:45 -0000
X-Groupsio-MsgNum: 73206
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="CkgPn3YfIwiDeMjoCshhcb2wDiTWvePuf"

--CkgPn3YfIwiDeMjoCshhcb2wDiTWvePuf
Content-Type: multipart/mixed; boundary="kFRqnEBWXYHAcv9JZAMHbAFPexJTiA38E";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 openembedded-devel@lists.openembedded.org
Message-ID: <a3b348af-5c71-f8f9-d5a9-cc5e7ab2cd14@gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v4 3/3] kernel_wireless_regdb: Add
 class for embedding regulatory data into older kernel
References: <20180705165513.28142-1-krzk@kernel.org>
 <20180705165513.28142-4-krzk@kernel.org>
In-Reply-To: <20180705165513.28142-4-krzk@kernel.org>

--kFRqnEBWXYHAcv9JZAMHbAFPexJTiA38E
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/5/18 9:55 AM, Krzysztof Kozlowski wrote:
> Linux kernels before v4.15, allowed to be compiled with static
> regulatory dabatase if it was put under net/wireless/db.txt.
>=20
> Add kernel_wireless_regdb class which allows in such cases to embed the=

> wireless regulatory database directly in the Linux kernel during build
> process.
>=20
> Usage:
> 1. The class should be inherited by kernel recipe (e.g. in
>    linux-yocto_%.bbappend).
> 2. For Linux kernels up to v4.14, build kernel with CONFIG_EXPERT and
>    CONFIG_CFG80211_INTERNAL_REGDB.

I think it will be good to add this in comments in bbclass as well.

>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  meta-networking/classes/kernel_wireless_regdb.bbclass         | 11 +++=
++++++++
>  .../wireless-regdb/wireless-regdb_2018.05.31.bb               | 10 +++=
+++++++
>  2 files changed, 21 insertions(+)
>  create mode 100644 meta-networking/classes/kernel_wireless_regdb.bbcla=
ss
>=20
> diff --git a/meta-networking/classes/kernel_wireless_regdb.bbclass b/me=
ta-networking/classes/kernel_wireless_regdb.bbclass
> new file mode 100644
> index 000000000000..a1eb4c532667
> --- /dev/null
> +++ b/meta-networking/classes/kernel_wireless_regdb.bbclass
> @@ -0,0 +1,11 @@
> +# Copies the regulatory plaintext database to kernel sources before co=
mpiling.
> +# Linux kernel must be compiled with CONFIG_CFG80211_INTERNAL_REGDB to=
 use it.
> +
> +DEPENDS +=3D "wireless-regdb-native"
> +
> +SRCTREECOVEREDTASKS +=3D "do_kernel_add_regdb"
> +do_kernel_add_regdb() {
> +    cp ${STAGING_LIBDIR_NATIVE}/crda/db.txt ${S}/net/wireless/db.txt
> +}
> +do_kernel_add_regdb[dirs] =3D "${S}"
> +addtask kernel_add_regdb before do_build after do_configure
> diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wirele=
ss-regdb_2018.05.31.bb b/meta-networking/recipes-connectivity/wireless-re=
gdb/wireless-regdb_2018.05.31.bb
> index d40756ff2bbf..0b7930718761 100644
> --- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regd=
b_2018.05.31.bb
> +++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regd=
b_2018.05.31.bb
> @@ -23,6 +23,7 @@ do_install() {
> =20
>  # Install static regulatory DB in /lib/firmware for kernel to load.
>  # This requires Linux kernel >=3D v4.15.
> +# For kernel <=3D v4.14, inherit the kernel_wireless_regdb.bbclass in =
kernel's recipe.
>  PACKAGES =3D+ "${PN}-static"
>  RCONFLICTS_${PN} =3D "${PN}-static"
> =20
> @@ -31,4 +32,13 @@ FILES_${PN}-static =3D " \
>      ${nonarch_base_libdir}/firmware/regulatory.db.p7s \
>  "
> =20
> +# Native users might want to use the source of regulatory DB.
> +# This is for example used by Linux kernel <=3D v4.14 and kernel_wirel=
ess_regdb.bbclass.
> +do_install_append_class-native() {
> +    install -d -m 0755 ${D}${libdir}/crda

add -D to below cmd and you can avoid this line.

> +    install -m 0644 db.txt ${D}${libdir}/crda/db.txt
> +}
> +
>  RSUGGESTS_${PN} =3D "crda"
> +
> +BBCLASSEXTEND =3D "native"
>=20



--kFRqnEBWXYHAcv9JZAMHbAFPexJTiA38E--

--CkgPn3YfIwiDeMjoCshhcb2wDiTWvePuf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCWz5QWgAKCRC7BTNVkZ0z
FB2BAJ9J15jUE9RKqR7SxRhWSUdpaP1xrQCbBAYjY2wEG3XkaokFfGrR/G2HwZk=
=2PLg
-----END PGP SIGNATURE-----

--CkgPn3YfIwiDeMjoCshhcb2wDiTWvePuf--
