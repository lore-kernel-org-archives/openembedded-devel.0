Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6FDC7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 13:31:40 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.19798.1750685493033373922
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 06:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1uThGl-0008CR-1S; Mon, 23 Jun 2025 15:31:31 +0200
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1uThGk-004xGz-0m;
	Mon, 23 Jun 2025 15:31:30 +0200
Received: from localhost ([127.0.0.1] helo=[IPv6:::1])
	by ptz.office.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1uThGk-0065MX-0E;
	Mon, 23 Jun 2025 15:31:30 +0200
Message-ID: <319d2b57e82418a128585cfc774e2e61dd360100.camel@pengutronix.de>
Subject: Re: [PATCH] signing.bbclass: make PEM loading compatible with
 OpenSC 0.26.0
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>, 
	openembedded-devel@lists.openembedded.org
Cc: johannes.schneider@leica-geosystems.com, yocto@pengutronix.de
Date: Mon, 23 Jun 2025 15:31:29 +0200
In-Reply-To: <20250619124641.2934463-1-ejo@pengutronix.de>
References: <20250619124641.2934463-1-ejo@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 13:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118080

On Thu, 2025-06-19 at 14:46 +0200, Enrico J=C3=B6rns wrote:
> With https://github.com/OpenSC/OpenSC/pull/3174 which is part of 0.26.0,
> OpenSC does not support reading (DER) data from stdin anymore.
>=20
> However, OpenSC/pkcs11-tool also supports reading PEM files directly.
> This we can use for simply replacing and simplifying the stdin piping in
> signing_import_cert_from_pem().
>=20
> Only for password-protected files we still have to use OpenSSL for
> conversion, since OpenSC/pkcs11-tool currently doesn't have a mechanism
> for providing passwords.
> For these cases, we store the converted PEM into a simple temporary
> file. This handling is sufficient, since SoftHSM import should be used
> for example keys only and SoftHSM also doesn't protect the keys in any
> way. Keys which actually need to be protected are stored in HSMs and
> accessed via their PKCS#11 URIs.
>=20
> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> ---
>  meta-oe/classes/signing.bbclass | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
>=20
> diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bb=
class
> index 8af7bbf8e0..8c7daa2391 100644
> --- a/meta-oe/classes/signing.bbclass
> +++ b/meta-oe/classes/signing.bbclass
> @@ -172,9 +172,7 @@ signing_import_cert_from_pem() {
>      local role=3D"${1}"
>      local pem=3D"${2}"
> =20
> -    openssl x509 \
> -        -in "${pem}" -inform pem -outform der |
> -    signing_pkcs11_tool --type cert --write-object /proc/self/fd/0 --lab=
el "${role}"
> +    signing_pkcs11_tool --type cert --write-object ${pem} --label "${rol=
e}"
>  }
> =20
>  # signing_import_pubkey_from_der <role> <der>
> @@ -198,12 +196,12 @@ signing_import_pubkey_from_pem() {
>      if [ -n "${IMPORT_PASS_FILE}" ]; then
>          openssl pkey \
>              -passin "file:${IMPORT_PASS_FILE}" \
> -            -in "${pem}" -inform pem -pubout -outform der
> +            -in "${pem}" -inform pem -pubout -outform der -out ${B}/pubk=
ey_out.pem

This should either be '-outform pem' or use a '.der' suffix for the filenam=
e.
Below as well.

>      else
>          openssl pkey \
> -            -in "${pem}" -inform pem -pubout -outform der
> -    fi |
> -    signing_pkcs11_tool --type pubkey --write-object /proc/self/fd/0 --l=
abel "${role}"
> +            -in "${pem}" -inform pem -pubout -outform der -out ${B}/pubk=
ey_out.pem

> +    fi
> +    signing_pkcs11_tool --type pubkey --write-object ${B}/pubkey_out.pem=
 --label "${role}"
>  }
> =20
>  # signing_import_privkey_from_der <role> <der>
> @@ -226,12 +224,11 @@ signing_import_privkey_from_pem() {
>      if [ -n "${IMPORT_PASS_FILE}" ]; then
>          openssl pkey \
>              -passin "file:${IMPORT_PASS_FILE}" \
> -            -in "${pem}" -inform pem -outform der
> +            -in "${pem}" -inform pem -outform der -out ${B}/privkey_out.=
pem
> +        signing_pkcs11_tool --type privkey --write-object ${B}/privkey_o=
ut.pem --label "${role}"
>      else
> -        openssl pkey \
> -            -in "${pem}" -inform pem -outform der
> -    fi |
> -    signing_pkcs11_tool --type privkey --write-object /proc/self/fd/0 --=
label "${role}"
> +        signing_pkcs11_tool --type privkey --write-object ${pem} --label=
 "${role}"
> +    fi
>  }
> =20
>  # signing_import_key_from_pem <role> <pem>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

