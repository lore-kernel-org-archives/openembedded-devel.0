Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B50E74AC4
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 16:45:35 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.24958.1733244330459869944
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Dec 2024 08:45:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1tIW1g-00006T-74; Tue, 03 Dec 2024 17:45:28 +0100
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1tIW1e-001VbF-15;
	Tue, 03 Dec 2024 17:45:27 +0100
Received: from localhost ([127.0.0.1])
	by ptz.office.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1tIW1f-00EPAD-00;
	Tue, 03 Dec 2024 17:45:27 +0100
Message-ID: <5ce10539cc5280e1b26fbfae7c0e00e193223ee8.camel@pengutronix.de>
Subject: Re: [meta-oe][PATCH v1] signing.bbclass: add set|get|has_ca
 functions
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: Johannes Schneider <johannes.schneider@leica-geosystems.com>, 
	openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Date: Tue, 03 Dec 2024 17:45:26 +0100
In-Reply-To: <20241130124846.232284-1-johannes.schneider@leica-geosystems.com>
References: 
	<20241130124846.232284-1-johannes.schneider@leica-geosystems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (by Flathub.org) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 16:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114185

On Sat, 2024-11-30 at 13:48 +0100, Johannes Schneider wrote:
> Add a mechanism to establish a (metadata) link between roles, in the
> form of a new 'ca' variable.=C2=A0 Which is intended to point from one ro=
le
> to another, to preserve the leaf->intermediary certificate relation.
>=20
> With this additional mechanism, it would be now possible to import a
> complex PKI tree of certificates (either just the certificates, or
> both cert+key where available); and then later during usage of one
> role, reconstruct the verification chain from the leaf, through
> multiple intermediary, and up to the root role.
>=20
> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.co=
m>

No, as explained in the other thread, CA certificates are *not* roles.
A possible extension would be that roles refer to a CA certificate. We
should continue to discuss this in the thread "signing.bbclass: add
set|get|has_ca functions"

Khem: This should not be merged in the current form.

Jan

> ---
> =C2=A0meta-oe/classes/signing.bbclass | 34 ++++++++++++++++++++++++++++++=
+++
> =C2=A01 file changed, 34 insertions(+)
>=20
> diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bb=
class
> index 8af7bbf8e..f1765e96b 100644
> --- a/meta-oe/classes/signing.bbclass
> +++ b/meta-oe/classes/signing.bbclass
> @@ -246,6 +246,18 @@ signing_import_key_from_pem() {
> =C2=A0=C2=A0=C2=A0=C2=A0 signing_import_privkey_from_pem "${role}" "${pem=
}"
> =C2=A0}
> =C2=A0
> +# signing_import_set_ca <role> <role_ca>
> +#
> +# Link the certificate from <role> to its issuer stored in <ca_role>
> +# By walking this linked list a CA-chain can later be reconstructed from=
 the
> +# involed roles.
> +signing_import_set_ca() {
> +=C2=A0=C2=A0=C2=A0 local role=3D"${1}"
> +=C2=A0=C2=A0=C2=A0 local ca_role=3D"${2}"
> +
> +=C2=A0=C2=A0=C2=A0 echo "_SIGNING_CA_${role}_=3D\"${ca_role}\"" >> $_SIG=
NING_ENV_FILE_
> +}
> +
> =C2=A0signing_import_finish() {
> =C2=A0=C2=A0=C2=A0=C2=A0 echo "loaded objects:"
> =C2=A0=C2=A0=C2=A0=C2=A0 signing_pkcs11_tool --list-objects
> @@ -346,6 +358,28 @@ signing_get_module() {
> =C2=A0=C2=A0=C2=A0=C2=A0 fi
> =C2=A0}
> =C2=A0
> +# signing_get_ca <role>
> +#
> +# returns the <ca_role> that has been set previously through
> +# signing_import_set_ca; or the empty string if none was set
> +signing_get_ca() {
> +=C2=A0=C2=A0=C2=A0 local role=3D"${1}"
> +
> +=C2=A0=C2=A0=C2=A0 eval local ca_role=3D"\$_SIGNING_CA_${role}_"
> +=C2=A0=C2=A0=C2=A0 echo "$ca_role"
> +}
> +
> +# signing_has_ca <role>
> +#
> +# check if the role links to another role that is its certificate
> +# authority/issuer.
> +signing_has_ca() {
> +=C2=A0=C2=A0=C2=A0 local ca_role=3D"$(signing_get_ca ${1})"
> +
> +=C2=A0=C2=A0=C2=A0 test -n "$ca_role"
> +=C2=A0=C2=A0=C2=A0 return $?
> +}
> +
> =C2=A0python () {
> =C2=A0=C2=A0=C2=A0=C2=A0 signing_class_prepare(d)
> =C2=A0}

--=20
Pengutronix e.K.                        |                             |
Steuerwalder Str. 21                    | https://www.pengutronix.de/ |
31137 Hildesheim, Germany               | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686        | Fax:   +49-5121-206917-5555 |



