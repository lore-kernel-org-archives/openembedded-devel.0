Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF62D3B9B2
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 15:49:13 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.49552.1732636145676772567
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Nov 2024 07:49:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1tFxoF-0006hb-Lg; Tue, 26 Nov 2024 16:49:03 +0100
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1tFxoE-000H1W-1y;
	Tue, 26 Nov 2024 16:49:03 +0100
Received: from localhost ([127.0.0.1])
	by ptz.office.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1tFxoF-009FTY-0s;
	Tue, 26 Nov 2024 16:49:03 +0100
Message-ID: <993d5bc627151ecab7366454bc0fa0f02491cf28.camel@pengutronix.de>
Subject: Re: [oe] [meta-oe][PATCH v1] signing.bbclass: add certificate
 ca-chain handling
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: johannes.schneider@leica-geosystems.com, 
	openembedded-devel@lists.openembedded.org
Date: Tue, 26 Nov 2024 16:49:03 +0100
In-Reply-To: <20241101120514.185668-1-johannes.schneider@leica-geosystems.com>
References: 
	<20241101120514.185668-1-johannes.schneider@leica-geosystems.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 15:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114076

Hi Johannes,

On Fri, 2024-11-01 at 13:05 +0100, Johannes Schneider via lists.openembedde=
d.org wrote:
> Add handling of ca-chains which can consist of more than one
> certificate in a .pem file, which need to be split off, processed and
> stored separately in the softhsm - as the tool-chain
> signing.bbclass::signing_import_cert* -> softhsm -> 'extract-cert'
> only supports one-per-file, due to using/expecting "plain" x509
> in-/output.
>=20
> The added signing_import_cert_chain_from_pem function takes a <role>
> basename, and iterates through the input .pem file, creating numbered
> <role>_1, _2, ... roles as needed.

Why do you want to import certificates without corresponding private
keys into the singing mechanism?

They can't be used for signing, so don't really fit the role concept as
I intended it. This mismatch then leads to workarounds such as the _N
suffix and the problem below.

> Afterwards the certificates can be used or extracted one-by-one from
> the softhsm, using the numbered roles; the only precondition - or
> limitation - is that the PKI structure has to be known beforhand;
> e.g. how many certificates are between leaf and root.

The point of the signing.bbclass is to abstract over different HSMs and
allow flexible key selection at the .conf level.

With this approach, any recipe using this set of generated
(certificate-only) roles now needs to know how long the chain is and
the PKIs with different layouts are no longer possible.


Could you describe you use-case in detail? I think we should try to
find a design which avoids using roles for certificate chains, while
also allowing different PKI layouts between SoftHSM and actual HSMs.

> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.co=
m>
> ---
> =C2=A0meta-oe/classes/signing.bbclass | 30 ++++++++++++++++++++++++++++++
> =C2=A01 file changed, 30 insertions(+)
>=20
> diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bb=
class
> index 3e662ff73..8af7bbf8e 100644
> --- a/meta-oe/classes/signing.bbclass
> +++ b/meta-oe/classes/signing.bbclass
> @@ -134,6 +134,36 @@ signing_import_cert_from_der() {
> =C2=A0=C2=A0=C2=A0=C2=A0 signing_pkcs11_tool --type cert --write-object "=
${der}" --label "${role}"
> =C2=A0}
> =C2=A0
> +# signing_import_cert_chain_from_pem <role> <pem>
> +#
> +
> +# Import a certificate *chain* from a PEM file to a role.
> +# (e.g. multiple ones concatenated in one file)
> +#
> +# Due to limitations in the toolchain:
> +#=C2=A0=C2=A0 signing class -> softhsm -> 'extract-cert'
> +# the input certificate is split into a sequentially numbered list of ro=
les,
> +# starting at <role>_1
> +#
> +# (The limitations are the conversion step from x509 to a plain .der, an=
d
> +# extract-cert expecting a x509 and then producing only plain .der again=
)
> +signing_import_cert_chain_from_pem() {
> +=C2=A0=C2=A0=C2=A0 local role=3D"${1}"
> +=C2=A0=C2=A0=C2=A0 local pem=3D"${2}"
> +=C2=A0=C2=A0=C2=A0 local i=3D1
> +
> +=C2=A0=C2=A0=C2=A0 cat "${pem}" | \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while openssl x509 -inform pe=
m -outform der -out ${B}/temp_${i}.der; do
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 signi=
ng_import_define_role "${role}_${i}"

Calling signing_import_define_role() from an import function breaks the
separation and ordering we currently use (first
signing_import_define_role(), then import certs/keys) and is surprising
compared to the existing signing_import_define_role()

Regards
Jan

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 signi=
ng_pkcs11_tool --type cert \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --write-object=C2=A0 ${B}/temp_${i}=
.der \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --label "${role}_${i}"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm ${=
B}/temp_${i}.der
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo =
"imported ${pem} under role: ${role}_${i}"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=3D$=
(awk "BEGIN {print $i+1}")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
> +}
> +
> =C2=A0# signing_import_cert_from_pem <role> <pem>
> =C2=A0#
> =C2=A0# Import a certificate from PEM file to a role. To be used
>=20

--=20
Pengutronix e.K.                        |                             |
Steuerwalder Str. 21                    | https://www.pengutronix.de/ |
31137 Hildesheim, Germany               | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686        | Fax:   +49-5121-206917-5555 |



