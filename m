Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19734C5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 15:52:17 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.53336.1748879535976491628
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jun 2025 08:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1uM7SQ-0001Mu-HI; Mon, 02 Jun 2025 17:52:14 +0200
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1uM7SQ-001TlJ-0y;
	Mon, 02 Jun 2025 17:52:14 +0200
Received: from localhost ([127.0.0.1] helo=[IPv6:::1])
	by ptz.office.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1uM7SQ-003YBI-0O;
	Mon, 02 Jun 2025 17:52:14 +0200
Message-ID: <de7f555011f8753bd8c79c631ccb0fce2fcc23df.camel@pengutronix.de>
Subject: Re: [oe] [meta-oe][PATCH v2 6/6] signing.bbclass: remove
 signing_import_cert_chain_from_pem
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: johannes.schneider@leica-geosystems.com, 
	openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Cc: bsp-development.geo@leica-geosystems.com, 
	customers.leicageo@pengutronix.de
Date: Mon, 02 Jun 2025 17:52:13 +0200
In-Reply-To: <20250531113252.3889951-7-johannes.schneider@leica-geosystems.com>
References: 
	<20250531113252.3889951-1-johannes.schneider@leica-geosystems.com>
	 <20250531113252.3889951-7-johannes.schneider@leica-geosystems.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 15:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117715

On Sat, 2025-05-31 at 13:32 +0200, Johannes Schneider via lists.openembedde=
d.org
wrote:
> With the now available set|get|has_ca functions to establish a CA link
> between roles during their import, the
> signing_import_cert_chain_from_pem can now be removed.  As it had the
> shortcoming of dynamically creating roles, which are harder to handle
> then the manually/specifically setup CA roles.
>=20
> This effectively reverts:
> a825b853634 signing.bbclass: add certificate ca-chain handling
>=20
> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.co=
m>
> ---
>  meta-oe/classes/signing.bbclass | 29 -----------------------------
>  1 file changed, 29 deletions(-)
>=20
> diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bb=
class
> index 1f50e89d1e..c9759e9198 100644
> --- a/meta-oe/classes/signing.bbclass
> +++ b/meta-oe/classes/signing.bbclass
> @@ -217,35 +217,6 @@ signing_get_root_cert() {
>      echo "${cert_name}"
>  }
> =20
> -# signing_import_cert_chain_from_pem <role> <pem>
> -#
> -# Import a certificate *chain* from a PEM file to a role.
> -# (e.g. multiple ones concatenated in one file)
> -#
> -# Due to limitations in the toolchain:
> -#   signing class -> softhsm -> 'extract-cert'
> -# the input certificate is split into a sequentially numbered list of ro=
les,
> -# starting at <role>_1
> -#
> -# (The limitations are the conversion step from x509 to a plain .der, an=
d
> -# extract-cert expecting a x509 and then producing only plain .der again=
)
> -signing_import_cert_chain_from_pem() {
> -    local role=3D"${1}"
> -    local pem=3D"${2}"
> -    local i=3D1
> -
> -    cat "${pem}" | \
> -        while openssl x509 -inform pem -outform der -out ${B}/temp_${i}.=
der; do
> -            signing_import_define_role "${role}_${i}"
> -            signing_pkcs11_tool --type cert \
> -                                --write-object  ${B}/temp_${i}.der \
> -                                --label "${role}_${i}"
> -            rm ${B}/temp_${i}.der
> -            echo "imported ${pem} under role: ${role}_${i}"
> -            i=3D$(awk "BEGIN {print $i+1}")
> -        done
> -}
> -
>  # signing_import_cert_from_pem <cert_name> <pem>
>  #
>  # Import a certificate from PEM file to a cert_name.

Reviewed-by: Jan Luebbe <jlu@pengutronix.de>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

