Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39201C54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 09:38:15 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.45746.1748857091480975609
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jun 2025 02:38:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1uM1cP-0005qS-RX; Mon, 02 Jun 2025 11:38:09 +0200
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1uM1cP-001QrA-1N;
	Mon, 02 Jun 2025 11:38:09 +0200
Received: from localhost ([127.0.0.1] helo=[IPv6:::1])
	by ptz.office.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1uM1cP-002b48-0q;
	Mon, 02 Jun 2025 11:38:09 +0200
Message-ID: <acd9f5dac0d1fd5b700d1a0a5b634ba509b2d3b0.camel@pengutronix.de>
Subject: Re: [oe] [meta-oe][PATCH v2 1/6] signing.bbclass: refactor
 signing_import_cert_from_*
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: johannes.schneider@leica-geosystems.com, 
	openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Cc: bsp-development.geo@leica-geosystems.com, 
	customers.leicageo@pengutronix.de
Date: Mon, 02 Jun 2025 11:38:08 +0200
In-Reply-To: <20250531113252.3889951-2-johannes.schneider@leica-geosystems.com>
References: 
	<20250531113252.3889951-1-johannes.schneider@leica-geosystems.com>
	 <20250531113252.3889951-2-johannes.schneider@leica-geosystems.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 09:38:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117697

On Sat, 2025-05-31 at 13:32 +0200, Johannes Schneider via lists.openembedde=
d.org
wrote:
> Refactor the two methods to import certificates from PEM/DER to be
> usable independently from keymaterial that is linked to a role.
>=20
> By having the import_cert_from methods create a storage location (aka
> role) in the softhsm dynamically.  This way certificates can - but
> don't have to - be linked to a key, or can stand on their own if chain
> of certificates from a PKI has to be managed.
>=20
> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.co=
m>
> ---
>  meta-oe/classes/signing.bbclass | 42 +++++++++++++++++++++++++--------
>  1 file changed, 32 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bb=
class
> index 8af7bbf8e0..c768371151 100644
> --- a/meta-oe/classes/signing.bbclass
> +++ b/meta-oe/classes/signing.bbclass
> @@ -123,15 +123,26 @@ signing_import_define_role() {
>      echo "_SIGNING_PKCS11_MODULE_${role}_=3D\"softhsm\"" >> $_SIGNING_EN=
V_FILE_
>  }
> =20
> -# signing_import_cert_from_der <role> <der>
> +# signing_import_cert_from_der <cert_name> <der>
>  #
> -# Import a certificate from DER file to a role. To be used
> -# with SoftHSM.
> +# Import a certificate from DER file to a cert_name.
> +# Where the <cert_name> can either be a previously setup
> +# signing_import_define_role linking the certificate to a signing key,
> +# or a new identifier when dealing with a standalone certificate.
> +#
> +# To be used with SoftHSM.
>  signing_import_cert_from_der() {
> -    local role=3D"${1}"
> +    local cert_name=3D"${1}"
>      local der=3D"${2}"
> =20
> -    signing_pkcs11_tool --type cert --write-object "${der}" --label "${r=
ole}"
> +    # check wether the cert_name/role needs to be defined first,
> +    # or do so otherwise
> +    local uri=3D$(siging_get_uri $cert_name)
> +    if [ -z "$uri" ]; then
> +        signing_import_define_role "$cert_name"

Semantically, this isn't a 'role' any more, but we can resolve the naming o=
f
signing_import_define_role later.

> +    fi
> +
> +    signing_pkcs11_tool --type cert --write-object "${der}" --label "${c=
ert_name}"
>  }
> =20
>  # signing_import_cert_chain_from_pem <role> <pem>
> @@ -164,17 +175,28 @@ signing_import_cert_chain_from_pem() {
>          done
>  }
> =20
> -# signing_import_cert_from_pem <role> <pem>
> +# signing_import_cert_from_pem <cert_name> <pem>
>  #
> -# Import a certificate from PEM file to a role. To be used
> -# with SoftHSM.
> +# Import a certificate from PEM file to a cert_name.
> +# Where the <cert_name> can either be a previously setup
> +# signing_import_define_role linking the certificate to a signing key,
> +# or a new identifier when dealing with a standalone certificate.
> +#
> +# To be used with SoftHSM.
>  signing_import_cert_from_pem() {
> -    local role=3D"${1}"
> +    local cert_name=3D"${1}"
>      local pem=3D"${2}"
> =20
> +    # check wether the cert_name/role needs to be defined first,
> +    # or do so otherwise
> +    local uri=3D$(siging_get_uri $cert_name)
> +    if [ -z "$uri" ]; then
> +        signing_import_define_role "$cert_name"
> +    fi
> +
>      openssl x509 \
>          -in "${pem}" -inform pem -outform der |
> -    signing_pkcs11_tool --type cert --write-object /proc/self/fd/0 --lab=
el "${role}"
> +    signing_pkcs11_tool --type cert --write-object /proc/self/fd/0 --lab=
el "${cert_name}"

In the meantime, we found that we can also load PEMs with recent pkcs11-too=
l, so
Enrico will send a patch to simplify this.

Reviewed-by: Jan Luebbe <jlu@pengutronix.de>

>  }
> =20
>  # signing_import_pubkey_from_der <role> <der>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117687): https://lists.openembedded.org/g/openembedde=
d-devel/message/117687
> Mute This Topic: https://lists.openembedded.org/mt/113394167/2167243
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [j=
lu@pengutronix.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

