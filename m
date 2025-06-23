Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1386C77B7F
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 10:16:38 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.16342.1750673796622381455
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 03:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1uTeE6-0002ea-Uc; Mon, 23 Jun 2025 12:16:34 +0200
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1uTeE6-004vmN-2G;
	Mon, 23 Jun 2025 12:16:34 +0200
Received: from localhost ([127.0.0.1] helo=[IPv6:::1])
	by ptz.office.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1uTeE6-005vBI-1f;
	Mon, 23 Jun 2025 12:16:34 +0200
Message-ID: <1b7cd821587c1e99faa97eb3728bcd3851bb7385.camel@pengutronix.de>
Subject: Re: [PATCH meta-oe v3 2/6] signing.bbclass: add set|get|has_ca
 functions
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: Johannes Schneider <johannes.schneider@leica-geosystems.com>, 
	openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Cc: bsp-development.geo@leica-geosystems.com
Date: Mon, 23 Jun 2025 12:16:34 +0200
In-Reply-To: <20250618-signing-set-ca-v3-2-4ba014735f0e@leica-geosystems.com>
References: <20250618-signing-set-ca-v3-0-4ba014735f0e@leica-geosystems.com>
	 <20250618-signing-set-ca-v3-2-4ba014735f0e@leica-geosystems.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 10:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118075

On Wed, 2025-06-18 at 16:35 +0200, Johannes Schneider wrote:
> Add a mechanism to establish a (metadata) link between roles and signer
> certificates, in the form of a new 'ca' variable.  It must point from one
> role or cert to the signer certificate to preserve the leaf->intermediary=
->
> root certificate relation.
>=20
> With this additional mechanism, it would be now possible to import a
> complex PKI tree of certificates and then later during usage of one
> role, reconstruct the certificate chain from the leaf, through
> multiple intermediary, and up to the root certificate.
>=20
> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.co=
m>
> ---
>  meta-oe/classes/signing.bbclass | 50 +++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 49 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bb=
class
> index c76837115192dc2b26756a47608caf7ecca1f727..04bd92bc033e8854eac245e39=
9126554dbaa2fea 100644
> --- a/meta-oe/classes/signing.bbclass
> +++ b/meta-oe/classes/signing.bbclass
> @@ -87,6 +87,11 @@ def signing_class_prepare(d):
>          export(role, "SIGNING_PKCS11_URI_%s_", pkcs11_uri)
>          export(role, "SIGNING_PKCS11_MODULE_%s_", pkcs11_module)
> =20
> +        # there can be an optional CA associated with this role
> +        ca_cert_name =3D d.getVarFlag("SIGNING_CA", role) or d.getVar("S=
IGNING_CA")
> +        if ca_cert_name:
> +            export(role, "SIGNING_CA_%s_", ca_cert_name)
> +
>  signing_pkcs11_tool() {
>      pkcs11-tool --module "${STAGING_LIBDIR_NATIVE}/softhsm/libsofthsm2.s=
o" --login --pin 1111 $*
>  }
> @@ -145,9 +150,52 @@ signing_import_cert_from_der() {
>      signing_pkcs11_tool --type cert --write-object "${der}" --label "${c=
ert_name}"
>  }
> =20
> -# signing_import_cert_chain_from_pem <role> <pem>
> +# signing_import_set_ca <cert_name> <ca_cert_name>
>  #
> +# Link the certificate from <cert_name> to its issuer stored in
> +# <ca_cert_name> By walking this linked list a CA-chain can later be
> +# reconstructed from the involed roles.
> +signing_import_set_ca() {
> +    local cert_name=3D"${1}"
> +    local ca_cert_name=3D"${2}"
> =20
> +    echo "_SIGNING_CA_${cert_name}_=3D\"${ca_cert_name}\"" >> $_SIGNING_=
ENV_FILE_
> +    echo "added link from ${cert_name} to ${ca_cert_name}"
> +}
> +
> +# signing_get_ca <cert_name>
> +#
> +# returns the <ca_cert_name> that has been set previously through
> +# either signing_import_set_ca;
> +# or a local.conf override SIGNING_CA[role] =3D ...
> +# If none was set, the empty string is returned.
> +signing_get_ca() {
> +    local cert_name=3D"${1}"
> +
> +    # prefer local configuration
> +    eval local ca=3D"\$SIGNING_CA_${cert_name}_"
> +    if [ -n "$ca" ]; then
> +        echo "$ca"
> +        return
> +    fi
> +
> +    # fall back to softhsm
> +    eval echo "\$_SIGNING_CA_${cert_name}_"
> +}
> +
> +# signing_has_ca <cert_name>
> +#
> +# check if the cert_name links to another cert_name that is its
> +# certificate authority/issuer.
> +signing_has_ca() {
> +    local ca_cert_name=3D"$(signing_get_ca ${1})"
> +
> +    test -n "$ca_cert_name"
> +    return $?
> +}
> +
> +# signing_import_cert_chain_from_pem <role> <pem>
> +#
>  # Import a certificate *chain* from a PEM file to a role.
>  # (e.g. multiple ones concatenated in one file)
>  #
>=20

Reviewed-by: Jan Luebbe <jlu@pengutronix.de>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

