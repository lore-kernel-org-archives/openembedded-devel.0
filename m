Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820BDC5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 10:10:35 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.46268.1748859033848362595
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jun 2025 03:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1uM27k-0000KY-Cn; Mon, 02 Jun 2025 12:10:32 +0200
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1uM27k-001RB1-0S;
	Mon, 02 Jun 2025 12:10:32 +0200
Received: from localhost ([127.0.0.1] helo=[IPv6:::1])
	by ptz.office.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1uM27j-002fy1-36;
	Mon, 02 Jun 2025 12:10:32 +0200
Message-ID: <b6bff5beab33d550ec7efa84d47bfc8af53d4f25.camel@pengutronix.de>
Subject: Re: [oe] [meta-oe][PATCH v2 2/6] signing.bbclass: add
 set|get|has_ca functions
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: johannes.schneider@leica-geosystems.com, 
	openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Cc: bsp-development.geo@leica-geosystems.com, 
	customers.leicageo@pengutronix.de
Date: Mon, 02 Jun 2025 12:10:31 +0200
In-Reply-To: <20250531113252.3889951-3-johannes.schneider@leica-geosystems.com>
References: 
	<20250531113252.3889951-1-johannes.schneider@leica-geosystems.com>
	 <20250531113252.3889951-3-johannes.schneider@leica-geosystems.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 10:10:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117703

On Sat, 2025-05-31 at 13:32 +0200, Johannes Schneider via lists.openembedde=
d.org
wrote:
> Add a mechanism to establish a (metadata) link between roles, in the
> form of a new 'ca' variable.  Which is intended to point from one role
> to another, to preserve the leaf->intermediary certificate relation.

Perhaps instead:

 Add a mechanism to establish a (metadata) link between roles and signer
 certificates, in the form of a new 'ca' variable.  It must point from one=
=C2=A0
 role=C2=A0or cert to the signer certificate to preserve the leaf->intermed=
iary->
 root=C2=A0certificate relation.

> With this additional mechanism, it would be now possible to import a
> complex PKI tree of certificates (either just the certificates, or
> both cert+key where available); and then later during usage of one
> role, reconstruct the verification chain from the leaf, through
> multiple intermediary, and up to the root role.

Keys should be only imported for roles, not ca certificates. So perhaps:

 With this additional mechanism, it would be now possible to import a
 complex PKI tree of certificates and then later during usage of one
 role, reconstruct the certificate chain from the leaf, through
 multiple intermediary, and up to the root certificate.

Also add a note that the PKI hierarchy cannot be overridden from local.conf=
 yet.

> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.co=
m>
> ---
>  meta-oe/classes/signing.bbclass | 36 ++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bb=
class
> index c768371151..5992a75be7 100644
> --- a/meta-oe/classes/signing.bbclass
> +++ b/meta-oe/classes/signing.bbclass
> @@ -145,9 +145,43 @@ signing_import_cert_from_der() {
>      signing_pkcs11_tool --type cert --write-object "${der}" --label "${c=
ert_name}"
>  }
> =20
> -# signing_import_cert_chain_from_pem <role> <pem>
> +# signing_import_set_ca <cert_name> <ca_cert_name>
> +#
> +# Link the certificate from <cert_name> to its issuer stored in
> +# <ca_cert_name> By walking this linked list a CA-chain can later be
> +# reconstructed from the involed roles.
> +signing_import_set_ca() {
> +    local cert_name=3D"${1}"
> +    local ca_cert_name=3D"${2}"
> +
> +    echo "_SIGNING_CA_${cert_name}_=3D\"${ca_cert_name}\"" >> $_SIGNING_=
ENV_FILE_
> +    echo "added link from ${cert_name} to ${ca_cert_name}"
> +}
> +
> +# signing_get_ca <cert_name>
>  #
> +# returns the <ca_cert_name> that has been set previously through
> +# signing_import_set_ca; or the empty string if none was set

For cases, where the real PKI hierarchy loaded in to the real HSM differs f=
rom
the one loaded into SoftHSM, we'll need a way to override these variables. =
So,
similar to how signing_get_module() first checks the overrides set up from
bitbake variables by signing_class_prepare().

Then, a user could set use something the following for the provider:
  signing_import_prepare

  signing_import_cert_from_pem kernel ".../kernel-ca.crt"

  signing_import_define_role kernel_modules
  signing_import_cert_from_pem kernel_modules "${S}/kmod-development.crt"
  signing_import_key_from_pem kernel_modules "${S}/kmod-development.key"
  signing_import_set_ca kernel_modules kernel

  signing_import_define_role kernel_ipe
  signing_import_cert_from_pem kernel_ipe "${S}/ipe-development.crt"
  signing_import_key_from_pem kernel_ipe "${S}/ipe-development.key"
  signing_import_set_ca kernel_ipe kernel

  signing_import_finish

For release builds, in addition to overriding URIs for the role, you'd need=
 to
override the certificates as well in your local.conf with something like th=
is:
 SIGNING_PKCS11_MODULE =3D "/usr/lib/x86_64-linux-gnu/opensc-pkcs11.so"
 SIGNING_PKCS11_URI[kernel_modules] =3D "pkcs11:serial=3DDENK0200554;object=
=3Dproduction-kernel-modules&pin-value=3D123456"
 SIGNING_PKCS11_URI[kernel_modules] =3D "kernel_inter"
 SIGNING_PKCS11_URI[kernel_inter] =3D "pkcs11:serial=3DDENK0200554;object=
=3Dproduction-kernel-inter&pin-value=3D123456"
 SIGNING_PKCS11_URI[kernel_inter] =3D "kernel_ca"
 SIGNING_PKCS11_URI[kernel_ca] =3D "pkcs11:serial=3DDENK0200554;object=3Dpr=
oduction-kernel-ca&pin-value=3D123456"

In this case, the real hierarchy has an additional intermediate certificate=
 that
is not part of the one used during development. Perhaps also support simply=
 a
file URL or path for the certs, so that it doesn't have to be imported to t=
he
HSM, depending how we implement it later.

This doesn't need to be implemented here, yet, as long the limitation is
documented (also in the class comment).

> +signing_get_ca() {
> +    local cert_name=3D"${1}"
> =20
> +    eval local ca_cert_name=3D"\$_SIGNING_CA_${cert_name}_"
> +    echo "$ca_cert_name"
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

Regards,
Jan

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

