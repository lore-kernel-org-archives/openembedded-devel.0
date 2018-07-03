Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f45.google.com (mail-pl0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5554B78A81
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jul 2018 21:13:54 +0000 (UTC)
Received: by mail-pl0-f45.google.com with SMTP id 31-v6so1600709plc.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jul 2018 14:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=kpWaP/Zfw2Uway3gwo0tiG/pmfPjMS+bONAqOufJW/U=;
	b=iF3v84PLBY7hfKs/Ld6Ht5OHv8UVrCcZe/DT6OzxxeJvMhpVDkOwEeQkbf0OYB53Y8
	XFsD5QGW8xnMs3Cs97NgasW3JMDx4tsU/SGQJSwMHY8NhUrfDC2sgLuWBVvvogRdF/VE
	aBZt0LJl2jEUD36lURIS4lUncLDG1hEW+XMsWiKW2/YrWIeglTbPNZM3Pnel2LrOvtLb
	vgZgm3Nf2R1N/m3VTwH8NSQ15K1glIDVXfP1iZB9RA4kCUMk8GRSMsILpoldWjpfWajj
	uiuc8vItAgFCsY8zYIJamPgz5rxQx0o3zbV3xryQMR1sNXJ5GJ3YGBBXyQIfrqMSQuqw
	PtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=kpWaP/Zfw2Uway3gwo0tiG/pmfPjMS+bONAqOufJW/U=;
	b=IOWmqD1qk4DEWMrAJL9RF5T4S1+TIp0REKc6z6TZm2jjg4b8+D30HdV+PyIXPFyhJu
	tzHc0l4P4et5PytnMZauG3GdyA5ofd1lH4gi99/Y8BybIIUWkOE0Cq1dQOkDatMNHhpU
	C613ukBjVHqBp/flpTnG7+52aOJbtWA8PIHUPYp8IEtrjfXifKhD3QVM0wnkvA65C/pj
	ogS04h9hsLWgv4X4K60WK8myfZx5Npoq08nOBH48J9bCwcfqvS3WkmgBwAkk3feuX6bW
	+n7YlBIEpavMAPVdUsdTrPuLZd8Bb151g/DC3FthqAYuU7180jXWOcfAL0TZvEfHlR9g
	zGqQ==
X-Gm-Message-State: APt69E19uk+UChiYrWVsCId6Ru0vfGKjdPgURT2BGx4GH1lNwau0q0i3
	xCp/R3U409k6sw4tPWnJCHO6/CpS
X-Google-Smtp-Source: ADUXVKLFjjY+CpZdYHJEAQnKka/lp4Pl94scIrHLwD7YUdvf1QWl61G1hejbE/zK/8bh5RxpIVB0gQ==
X-Received: by 2002:a17:902:822:: with SMTP id
	31-v6mr31253382plk.172.1530652434953; 
	Tue, 03 Jul 2018 14:13:54 -0700 (PDT)
Received: from ?IPv6:2601:646:877f:9499:b95e:f0e0:47b8:11a8?
	([2601:646:877f:9499:b95e:f0e0:47b8:11a8])
	by smtp.gmail.com with ESMTPSA id
	o72-v6sm5777764pfk.76.2018.07.03.14.13.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jul 2018 14:13:54 -0700 (PDT)
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-devel@lists.openembedded.org
References: <1530602486-4522-1-git-send-email-yi.zhao@windriver.com>
	<1530602486-4522-6-git-send-email-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <051d14fb-9bb1-e394-c04f-86246860c331@gmail.com>
Date: Tue, 3 Jul 2018 14:13:42 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1530602486-4522-6-git-send-email-yi.zhao@windriver.com>
Subject: Re: [meta-networking][PATCH 6/8] postfix: upgrade 3.2.2 -> 3.2.6
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
X-List-Received-Date: Tue, 03 Jul 2018 21:13:54 -0000
X-Groupsio-MsgNum: 73173
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="crUQDPNC8T9pysq1bfMUsLXOLT2eyO1u8"

--crUQDPNC8T9pysq1bfMUsLXOLT2eyO1u8
Content-Type: multipart/mixed; boundary="p5gbOSgb7gNQAM9jmojFTZsWSnOb0WQzf";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-devel@lists.openembedded.org
Message-ID: <051d14fb-9bb1-e394-c04f-86246860c331@gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 6/8] postfix: upgrade 3.2.2 -> 3.2.6
References: <1530602486-4522-1-git-send-email-yi.zhao@windriver.com>
 <1530602486-4522-6-git-send-email-yi.zhao@windriver.com>
In-Reply-To: <1530602486-4522-6-git-send-email-yi.zhao@windriver.com>

--p5gbOSgb7gNQAM9jmojFTZsWSnOb0WQzf
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/3/18 12:21 AM, Yi Zhao wrote:
> License-Update: The postfix is distributed with a dual license since
> 3.2.5: IBM Public License 1.0 and Eclipse Public License 2.0. Recipient=
s
> can choose to take the software under the license of their choice. Thos=
e
> who are more comfortable with the IPL can continue with that license.
>=20
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta-networking/recipes-daemons/postfix/postfix.inc                 | =
4 ++--
>  .../recipes-daemons/postfix/{postfix_3.2.2.bb =3D> postfix_3.2.6.bb}  =
| 6 ++++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
>  rename meta-networking/recipes-daemons/postfix/{postfix_3.2.2.bb =3D> =
postfix_3.2.6.bb} (57%)
>=20
> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta=
-networking/recipes-daemons/postfix/postfix.inc
> index a504b85..8c56801 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
> @@ -11,8 +11,8 @@ DEPENDS =3D "db icu libpcre libnsl2 openssl postfix-n=
ative \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'sasl', 'cyrus-sasl', '', =
d)} \
>  "
> =20
> -LICENSE =3D "IPL-1.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D64375f37431336ea1b1b3005fe3=
fa354"
> +LICENSE =3D "IPL-1.0 & EPL-2.0"

Perhaps this should be IPL-1.0 | EPL-2.0 ? if it allows the choice of
license

> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db181651ad99a7dc4cc8c4ce2f49=
1ed1a"
> =20
>  SRC_URI =3D "ftp://ftp.porcupine.org/mirrors/postfix-release/official/=
postfix-${PV}.tar.gz \
>      file://makedefs.patch \
> diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb b=
/meta-networking/recipes-daemons/postfix/postfix_3.2.6.bb
> similarity index 57%
> rename from meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
> rename to meta-networking/recipes-daemons/postfix/postfix_3.2.6.bb
> index 89af406..1214467 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
> +++ b/meta-networking/recipes-daemons/postfix/postfix_3.2.6.bb
> @@ -5,5 +5,7 @@ SRC_URI +=3D "file://0001-Check-for-glibc-before-settin=
g-CANT_USE_SEND_RECV_MS.pat
>              file://postfix-install.patch \
>              file://icu-config.patch \
>             "
> -SRC_URI[md5sum] =3D "aea073a9b0bea5bdb590460a270a4aa0"
> -SRC_URI[sha256sum] =3D "d06849418d119d09366997b2b481bb23f737629769b4e4=
a52da42fb3ad8b0576"
> +SRC_URI[md5sum] =3D "d10f1fb551be86f6e48c2908dd8a12ff"
> +SRC_URI[sha256sum] =3D "1df036380bae7c356bfa8989a87de58033b6aaa09b3baf=
cfa36c3694dd449039"
> +
> +UPSTREAM_CHECK_REGEX =3D "postfix\-(?P<pver>3\.2(\.\d+)+).tar.gz"
>=20



--p5gbOSgb7gNQAM9jmojFTZsWSnOb0WQzf--

--crUQDPNC8T9pysq1bfMUsLXOLT2eyO1u8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCWzvnDAAKCRC7BTNVkZ0z
FIs3AJ4rKS4W4VcFQz+RwUgrkAK94PRGMgCfTV0GiXdYyDgzntEjsO6R0G1sTgY=
=sRSJ
-----END PGP SIGNATURE-----

--crUQDPNC8T9pysq1bfMUsLXOLT2eyO1u8--
