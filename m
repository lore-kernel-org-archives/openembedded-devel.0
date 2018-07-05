Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id A1F4A7553F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2018 17:03:49 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id y8-v6so1539049plr.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jul 2018 10:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=URKAIF06l4WFhXxVmzcjLZSqIuiJ+MGxFHXbFqqvFTc=;
	b=DGk8U9rw6Iyre0Qye651T6YL2Ow0KnnQbZ6Y9xAnsikX4kivfZbaFT0CwxIJ+7C/zg
	zK+FViyZqSoulAhoF/gbwkQraZArQHFIzcUdjCpdQ3hPmkDL0bdj/eXZLj/IhbXX+VVU
	nOmg3rP8BVr7UB10bEQGIVykmASiqixNc+fV8s6ibOtxFUO/ETp1YNoYc90c8zPQuZRJ
	00sT/dwOWofHsOvHgNJCJRfjbWKDTy3pSXxcf+KiQm20oQ4yI/Orrkw0vQSfiRO+gap1
	YMwExwY06Zpl9jof4kTma6Jt305NpXT/s3egfNJb5TDjlYIhJHLruAXlHaCfs2OjriuG
	WhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=URKAIF06l4WFhXxVmzcjLZSqIuiJ+MGxFHXbFqqvFTc=;
	b=ly/F4X3h47UtsdPkSOw5wM2y2wYt0FfmjEZHFoMb9KIXNPtQsDU9Ce4kwv6j4xIA3k
	Mop+zBqHFzmdEtl2hxiF9BqkdNnLVRzRzK7WgAjyWuHGIIZi12Iqj16yNzj1T0AEKSCb
	HfwIMvdL7I3icx4XdHu1+0sUpC8/m0fYYmIUR0pym2jg19AJteCWz5ToX2l6OAat96zh
	ndtiDcfCzMCG4ersAJJNz0R6xqle6uD8nr2/FdYjvK1QZCu4mKxsImYICMY/0qNNR5Gj
	bDugvWpqkOpEgtt1eqe4jp0mz7I8v+mYejyb90DiUYpBB/O67PbO8u7PX4F5/eXB92/F
	W35A==
X-Gm-Message-State: APt69E0W9OOLyhpQersdiTfX/gtlb/4iL4jRzSh7comEAXEE7gJA07eo
	qM9WXMv54Q6GpQMjL+VOQ/fNuA7o
X-Google-Smtp-Source: AAOMgpeZkM1hy4MU2U05G1JLEMD/q8zC1BaOGbNKnGosYXtQloiOim+CvTNz83BeqvIUddjcWbfbDg==
X-Received: by 2002:a17:902:8ecb:: with SMTP id
	x11-v6mr7166887plo.308.1530810230325; 
	Thu, 05 Jul 2018 10:03:50 -0700 (PDT)
Received: from ?IPv6:2601:646:877f:9499:b95e:f0e0:47b8:11a8?
	([2601:646:877f:9499:b95e:f0e0:47b8:11a8])
	by smtp.gmail.com with ESMTPSA id
	g23-v6sm9242709pgv.26.2018.07.05.10.03.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jul 2018 10:03:49 -0700 (PDT)
To: Krzysztof Kozlowski <krzk@kernel.org>,
	openembedded-devel@lists.openembedded.org
References: <20180705165513.28142-1-krzk@kernel.org>
	<20180705165513.28142-3-krzk@kernel.org>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <117adb1e-5a34-3486-4bc8-0dd07f5d80f7@gmail.com>
Date: Thu, 5 Jul 2018 10:03:44 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180705165513.28142-3-krzk@kernel.org>
Subject: Re: [meta-networking][PATCH v4 2/3] wireless-regdb: Add wireless-regdb-static package with static regulatory data
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
X-List-Received-Date: Thu, 05 Jul 2018 17:03:49 -0000
X-Groupsio-MsgNum: 73205
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="sJW7ChIaZQ51m6VKzjsD9yjsF7HrBdQpJ"

--sJW7ChIaZQ51m6VKzjsD9yjsF7HrBdQpJ
Content-Type: multipart/mixed; boundary="HFTn0xyLpI9WkXvjGTtLgL27voStLFg6l";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 openembedded-devel@lists.openembedded.org
Message-ID: <117adb1e-5a34-3486-4bc8-0dd07f5d80f7@gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v4 2/3] wireless-regdb: Add
 wireless-regdb-static package with static regulatory data
References: <20180705165513.28142-1-krzk@kernel.org>
 <20180705165513.28142-3-krzk@kernel.org>
In-Reply-To: <20180705165513.28142-3-krzk@kernel.org>

--HFTn0xyLpI9WkXvjGTtLgL27voStLFg6l
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/5/18 9:55 AM, Krzysztof Kozlowski wrote:
> Small embedded systems might:
> 1. Want to get rid of daemons as much as possible (therefore be built
>    without CRDA),
> 2. Not receive user-space incremental updates but an entire system
>    upgrade (with kernel).
>=20
> Linux kernel since v4.15 allows loading static regulatory data from
> /lib/firmware/regulatory.db.
>=20
> Add additional package to wireless-regdb recipe which provides such
> static data.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../wireless-regdb/wireless-regdb_2018.05.31.bb            | 14 ++++++=
++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wirele=
ss-regdb_2018.05.31.bb b/meta-networking/recipes-connectivity/wireless-re=
gdb/wireless-regdb_2018.05.31.bb
> index 8bb866ff1281..d40756ff2bbf 100644
> --- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regd=
b_2018.05.31.bb
> +++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regd=
b_2018.05.31.bb
> @@ -15,6 +15,20 @@ do_install() {
>      install -d -m0755 ${D}${sysconfdir}/wireless-regdb/pubkeys
>      install -m 0644 regulatory.bin ${D}${libdir}/crda/regulatory.bin
>      install -m 0644 sforshee.key.pub.pem ${D}${sysconfdir}/wireless-re=
gdb/pubkeys/sforshee.key.pub.pem
> +
> +    install -d -m0755 ${D}${nonarch_base_libdir}/firmware/

This is not needed if you add -D to both the lines below.

> +    install -m 0644 regulatory.db ${D}${nonarch_base_libdir}/firmware/=
regulatory.db
> +    install -m 0644 regulatory.db.p7s ${D}${nonarch_base_libdir}/firmw=
are/regulatory.db.p7s
>  }
> =20
> +# Install static regulatory DB in /lib/firmware for kernel to load.
> +# This requires Linux kernel >=3D v4.15.
> +PACKAGES =3D+ "${PN}-static"
> +RCONFLICTS_${PN} =3D "${PN}-static"
> +
> +FILES_${PN}-static =3D " \
> +    ${nonarch_base_libdir}/firmware/regulatory.db \
> +    ${nonarch_base_libdir}/firmware/regulatory.db.p7s \
> +"
> +
>  RSUGGESTS_${PN} =3D "crda"
>=20

Do we still need the rsuggest for crda ?



--HFTn0xyLpI9WkXvjGTtLgL27voStLFg6l--

--sJW7ChIaZQ51m6VKzjsD9yjsF7HrBdQpJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCWz5PcAAKCRC7BTNVkZ0z
FGYcAJ9a2ybmWfxyZ8O9xBE0eA+EXrzU8gCffu3Nr2adLXKjvzMbNUfI0YtY5qc=
=twEU
-----END PGP SIGNATURE-----

--sJW7ChIaZQ51m6VKzjsD9yjsF7HrBdQpJ--
