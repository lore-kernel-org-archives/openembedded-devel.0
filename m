Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACF6C7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 10:52:56 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.10770.1751021568527173503
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jun 2025 03:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1uV6hJ-0005gD-3F; Fri, 27 Jun 2025 12:52:45 +0200
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1uV6hI-005bFg-1F;
	Fri, 27 Jun 2025 12:52:44 +0200
Received: from localhost ([127.0.0.1] helo=[IPv6:::1])
	by ptz.office.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1uV6hI-009Qnv-0h;
	Fri, 27 Jun 2025 12:52:44 +0200
Message-ID: <daf880141b778accff0a91f05f6dc37d4a79b962.camel@pengutronix.de>
Subject: Re: [PATCH meta-oe v3 1/6] signing.bbclass: refactor
 signing_import_cert_from_*
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>, Khem Raj
	 <raj.khem@gmail.com>
Cc: GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>, 
	"openembedded-devel@lists.openembedded.org"
	 <openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Jun 2025 12:52:43 +0200
In-Reply-To: <AM8PR06MB7521D93585DF4F130F063658BC45A@AM8PR06MB7521.eurprd06.prod.outlook.com>
References: <20250627-signing-set-ca-v3-0-030812797c6a@leica-geosystems.com>
	 <20250627-signing-set-ca-v3-1-030812797c6a@leica-geosystems.com>
	 <CAMKF1sonO=SsLeNj71XaO-khTanMeDFnczN5i5C+uufauHT9+Q@mail.gmail.com>
	 <AM8PR06MB7521D93585DF4F130F063658BC45A@AM8PR06MB7521.eurprd06.prod.outlook.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 10:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118146

On Fri, 2025-06-27 at 10:35 +0000, SCHNEIDER Johannes wrote:
> Hoi,
>=20
>=20
> > Please rebase this on top of latest master or master-next and resend,
> it does not apply cleanly.
>=20
> ACK
>=20
> @Jan:  v3 added the comment/use-case you pointed out and i missed - anyth=
ing else that should be fixed for v4? (-:

Nothing else from my side.

Thanks,
Jan

> gru=C3=9F
> Johannes
>=20
> ________________________________________
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Friday, June 27, 2025 10:01
> To: SCHNEIDER Johannes
> Cc: jlu@pengutronix.de; GEO-CHHER-bsp-development; openembedded-devel@lis=
ts.openembedded.org
> Subject: Re: [PATCH meta-oe v3 1/6] signing.bbclass: refactor signing_imp=
ort_cert_from_*
>=20
> [Some people who received this message don't often get email from raj.khe=
m@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSender=
Identification ]
>=20
> This email is not from Hexagon=E2=80=99s Office 365 instance. Please be c=
areful while clicking links, opening attachments, or replying to this email=
.
>=20
>=20
> Please rebase this on top of latest master or master-next and resend,
> it does not apply cleanly.
>=20
> On Thu, Jun 26, 2025 at 10:40=E2=80=AFPM Johannes Schneider
> <johannes.schneider@leica-geosystems.com> wrote:
> >=20
> > Refactor the two methods to import certificates from PEM/DER to be
> > usable independently from keymaterial that is linked to a role.
> >=20
> > By having the import_cert_from methods create a storage location (aka
> > role) in the softhsm dynamically.  This way certificates can - but
> > don't have to - be linked to a key, or can stand on their own if chain
> > of certificates from a PKI has to be managed.
> >=20
> > Reviewed-by: Jan Luebbe <jlu@pengutronix.de>
> > Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.=
com>
> > ---
> >  meta-oe/classes/signing.bbclass | 42 +++++++++++++++++++++++++++++++--=
--------
> >  1 file changed, 32 insertions(+), 10 deletions(-)
> >=20
> > diff --git meta-oe/classes/signing.bbclass meta-oe/classes/signing.bbcl=
ass
> > index 8af7bbf8e0..c768371151 100644
> > --- meta-oe/classes/signing.bbclass
> > +++ meta-oe/classes/signing.bbclass
> > @@ -123,15 +123,26 @@ signing_import_define_role() {
> >      echo "_SIGNING_PKCS11_MODULE_${role}_=3D\"softhsm\"" >> $_SIGNING_=
ENV_FILE_
> >  }
> >=20
> > -# signing_import_cert_from_der <role> <der>
> > +# signing_import_cert_from_der <cert_name> <der>
> >  #
> > -# Import a certificate from DER file to a role. To be used
> > -# with SoftHSM.
> > +# Import a certificate from DER file to a cert_name.
> > +# Where the <cert_name> can either be a previously setup
> > +# signing_import_define_role linking the certificate to a signing key,
> > +# or a new identifier when dealing with a standalone certificate.
> > +#
> > +# To be used with SoftHSM.
> >  signing_import_cert_from_der() {
> > -    local role=3D"${1}"
> > +    local cert_name=3D"${1}"
> >      local der=3D"${2}"
> >=20
> > -    signing_pkcs11_tool --type cert --write-object "${der}" --label "$=
{role}"
> > +    # check wether the cert_name/role needs to be defined first,
> > +    # or do so otherwise
> > +    local uri=3D$(siging_get_uri $cert_name)
> > +    if [ -z "$uri" ]; then
> > +        signing_import_define_role "$cert_name"
> > +    fi
> > +
> > +    signing_pkcs11_tool --type cert --write-object "${der}" --label "$=
{cert_name}"
> >  }
> >=20
> >  # signing_import_cert_chain_from_pem <role> <pem>
> > @@ -164,17 +175,28 @@ signing_import_cert_chain_from_pem() {
> >          done
> >  }
> >=20
> > -# signing_import_cert_from_pem <role> <pem>
> > +# signing_import_cert_from_pem <cert_name> <pem>
> >  #
> > -# Import a certificate from PEM file to a role. To be used
> > -# with SoftHSM.
> > +# Import a certificate from PEM file to a cert_name.
> > +# Where the <cert_name> can either be a previously setup
> > +# signing_import_define_role linking the certificate to a signing key,
> > +# or a new identifier when dealing with a standalone certificate.
> > +#
> > +# To be used with SoftHSM.
> >  signing_import_cert_from_pem() {
> > -    local role=3D"${1}"
> > +    local cert_name=3D"${1}"
> >      local pem=3D"${2}"
> >=20
> > +    # check wether the cert_name/role needs to be defined first,
> > +    # or do so otherwise
> > +    local uri=3D$(siging_get_uri $cert_name)
> > +    if [ -z "$uri" ]; then
> > +        signing_import_define_role "$cert_name"
> > +    fi
> > +
> >      openssl x509 \
> >          -in "${pem}" -inform pem -outform der |
> > -    signing_pkcs11_tool --type cert --write-object /proc/self/fd/0 --l=
abel "${role}"
> > +    signing_pkcs11_tool --type cert --write-object /proc/self/fd/0 --l=
abel "${cert_name}"
> >  }
> >=20
> >  # signing_import_pubkey_from_der <role> <der>
> >=20
> > --
> > 2.43.0
> >=20

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

