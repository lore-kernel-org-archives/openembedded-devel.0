Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 373E1C5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 15:48:17 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.53229.1748879288968191516
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jun 2025 08:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1uM7OQ-0007c3-Vu; Mon, 02 Jun 2025 17:48:06 +0200
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1uM7OQ-001Tki-0v;
	Mon, 02 Jun 2025 17:48:06 +0200
Received: from localhost ([127.0.0.1] helo=[IPv6:::1])
	by ptz.office.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1uM7OQ-003Xfg-0O;
	Mon, 02 Jun 2025 17:48:06 +0200
Message-ID: <9d2c4845969a3a8f1a1a6f60c10f49a98546693e.camel@pengutronix.de>
Subject: Re: [oe] [meta-oe][PATCH v2 3/6] signing.bbclass: add get_root_cert
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: johannes.schneider@leica-geosystems.com, 
	openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Cc: bsp-development.geo@leica-geosystems.com, 
	customers.leicageo@pengutronix.de
Date: Mon, 02 Jun 2025 17:48:05 +0200
In-Reply-To: <20250531113252.3889951-4-johannes.schneider@leica-geosystems.com>
References: 
	<20250531113252.3889951-1-johannes.schneider@leica-geosystems.com>
	 <20250531113252.3889951-4-johannes.schneider@leica-geosystems.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 15:48:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117710

On Sat, 2025-05-31 at 13:32 +0200, Johannes Schneider via lists.openembedde=
d.org
wrote:
> Add a helper method to retrieve the root CA certificate for a given
> role, by walking the chain that has been setup with
> signing_import_set_ca up to the last element - which is the root.
>=20
> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.co=
m>
> ---
>  meta-oe/classes/signing.bbclass | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bb=
class
> index 5992a75be7..ee32cc12f7 100644
> --- a/meta-oe/classes/signing.bbclass
> +++ b/meta-oe/classes/signing.bbclass
> @@ -180,6 +180,22 @@ signing_has_ca() {
>      return $?
>  }
> =20
> +# signing_get_root_cert <cert_name>
> +#
> +# return the role/name of the CA root certificate for a given
> +# <cert_name>, by walking the chain setup with signing_import_set_ca
> +# all the way to the last in line that doesn't have a CA set - which
> +# would be the root.
> +#
> +# To be used with SoftHSM.
> +signing_get_root_cert() {
> +    local cert_name=3D"${1}"
> +    while signing_has_ca "${cert_name}"; do
> +        cert_name=3D"$(signing_get_ca ${cert_name})"
> +    done
> +    echo "${cert_name}"
> +}
> +
>  # signing_import_cert_chain_from_pem <role> <pem>
>  #
>  # Import a certificate *chain* from a PEM file to a role.

Reviewed-by: Jan Luebbe <jlu@pengutronix.de>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

