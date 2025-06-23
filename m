Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD99C7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 10:12:39 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.16357.1750673553449090305
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 03:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1uTeAB-0006bh-Fk; Mon, 23 Jun 2025 12:12:31 +0200
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1uTeAA-004vlt-2S;
	Mon, 23 Jun 2025 12:12:30 +0200
Received: from localhost ([127.0.0.1] helo=[IPv6:::1])
	by ptz.office.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1uTeAA-005uyf-1t;
	Mon, 23 Jun 2025 12:12:30 +0200
Message-ID: <6a78b247882147fef95ae63485df4790b69feaea.camel@pengutronix.de>
Subject: Re: [PATCH meta-oe v3 4/6] signing.bbclass: add
 signing_get_intermediate_certs
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: Johannes Schneider <johannes.schneider@leica-geosystems.com>, 
	openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Cc: bsp-development.geo@leica-geosystems.com
Date: Mon, 23 Jun 2025 12:12:30 +0200
In-Reply-To: <20250618-signing-set-ca-v3-4-4ba014735f0e@leica-geosystems.com>
References: <20250618-signing-set-ca-v3-0-4ba014735f0e@leica-geosystems.com>
	 <20250618-signing-set-ca-v3-4-4ba014735f0e@leica-geosystems.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 10:12:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118074

On Wed, 2025-06-18 at 16:35 +0200, Johannes Schneider wrote:
> Add a method that returns a list of intermediary CA roles.
>=20
> When using a complex PKI structure with for example "openssl cms",
> these roles can then be iterated over adding in turn a '-certificate'.
> Pseudo-code example:
>   for intermediate in $(signing_get_intermediate_certs 'FooBaa'); do
>      signing_extract_cert_pem $intermediate $intermediate.pem
>      CMD+=3D" --certificate=3D$intermediate.pem"
>   done

In my previous review [1], I meant that you should add "The typical use-cas=
e
would be adding these intermediate certificates to the CMS structure so tha=
t the
relying party can build the chain from the signing leaf certificate to the
locally stored trusted CA certificate." (or something similar) to the commi=
t
message as a clarification.

Thanks,
Jan

[1] https://lore.kernel.org/all/ea86ffbeb48f4f6ddff0093796ebfbcb3e9fdc21.ca=
mel@pengutronix.de/

> Reviewed-by: Jan Luebbe <jlu@pengutronix.de>
> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.co=
m>
> ---
>  meta-oe/classes/signing.bbclass | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bb=
class
> index 2a94f5f5b376f99f521494239f7158662df4a3c6..248c6400ed720e7131e618322=
314be9bb24a760e 100644
> --- a/meta-oe/classes/signing.bbclass
> +++ b/meta-oe/classes/signing.bbclass
> @@ -194,6 +194,27 @@ signing_has_ca() {
>      return $?
>  }
> =20
> +# signing_get_intermediate_certs <cert_name>
> +#
> +# return a list of role/name intermediary CA certificates for a given
> +# <cert_name> by walking the chain setup with signing_import_set_ca.
> +#
> +# The returned list will not include the the root CA, and can
> +# potentially be empty.
> +#
> +# To be used with SoftHSM.
> +signing_get_intermediate_certs() {
> +    local cert_name=3D"${1}"
> +    local intermediary=3D""
> +    while signing_has_ca "${cert_name}"; do
> +        cert_name=3D"$(signing_get_ca ${cert_name})"
> +        if signing_has_ca "${cert_name}"; then
> +            intermediary=3D"${intermediary} ${cert_name}"
> +        fi
> +    done
> +    echo "${intermediary}"
> +}
> +
>  # signing_get_root_cert <cert_name>
>  #
>  # return the role/name of the CA root certificate for a given
>=20

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

