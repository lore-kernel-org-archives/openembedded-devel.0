Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EA2C54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 15:51:57 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.53273.1748879515773802758
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jun 2025 08:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1uM7S6-00019G-Ag; Mon, 02 Jun 2025 17:51:54 +0200
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1uM7S5-001TlD-33;
	Mon, 02 Jun 2025 17:51:53 +0200
Received: from localhost ([127.0.0.1] helo=[IPv6:::1])
	by ptz.office.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1uM7S5-003Y8p-2U;
	Mon, 02 Jun 2025 17:51:53 +0200
Message-ID: <16b2d59c8d390bfc40e451e3c25131dd982d6706.camel@pengutronix.de>
Subject: Re: [oe] [meta-oe][PATCH v2 5/6] signing.bbclass: add
 signing_extract_cert helpers
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: johannes.schneider@leica-geosystems.com, 
	openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Cc: bsp-development.geo@leica-geosystems.com, 
	customers.leicageo@pengutronix.de
Date: Mon, 02 Jun 2025 17:51:53 +0200
In-Reply-To: <20250531113252.3889951-6-johannes.schneider@leica-geosystems.com>
References: 
	<20250531113252.3889951-1-johannes.schneider@leica-geosystems.com>
	 <20250531113252.3889951-6-johannes.schneider@leica-geosystems.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 15:51:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117714

On Sat, 2025-05-31 at 13:32 +0200, Johannes Schneider via lists.openembedde=
d.org
wrote:
> Add extract-cert wrapping helper functions, to easily extract
> certificates again that had been previously imported into the softhsm.
>=20
> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.co=
m>
> ---
>  meta-oe/classes/signing.bbclass | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bb=
class
> index 7bc3e7cb12..1f50e89d1e 100644
> --- a/meta-oe/classes/signing.bbclass
> +++ b/meta-oe/classes/signing.bbclass
> @@ -54,7 +54,7 @@
>  SIGNING_PKCS11_URI ?=3D ""
>  SIGNING_PKCS11_MODULE ?=3D ""
> =20
> -DEPENDS +=3D "softhsm-native libp11-native opensc-native openssl-native"
> +DEPENDS +=3D "softhsm-native libp11-native opensc-native openssl-native =
extract-cert-native"
> =20
>  def signing_class_prepare(d):
>      import os.path
> @@ -439,6 +439,30 @@ signing_get_module() {
>      fi
>  }
> =20
> +# signing_extract_cert_der <role> <der>
> +#
> +# Export a certificate attached to a role into a DER file.
> +# To be used with SoftHSM.
> +signing_extract_cert_der() {
> +    local role=3D"${1}"
> +    local output=3D"${2}"
> +
> +    extract-cert "$(signing_get_uri $role)" "${output}"
> +}
> +
> +# signing_extract_cert_pem <role> <pem>
> +#
> +# Export a certificate attached to a role into a PEM file.
> +# To be used with SoftHSM.
> +signing_extract_cert_pem() {
> +    local role=3D"${1}"
> +    local output=3D"${2}"
> +
> +    extract-cert "$(signing_get_uri $role)" "${output}.tmp-der"
> +    openssl x509 -inform der -in "${output}.tmp-der" -out "${output}"
> +    rm "${output}.tmp-der"
> +}
> +
>  python () {
>      signing_class_prepare(d)
>  }

Reviewed-by: Jan Luebbe <jlu@pengutronix.de>


> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117685): https://lists.openembedded.org/g/openembedde=
d-devel/message/117685
> Mute This Topic: https://lists.openembedded.org/mt/113394165/2167243
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

