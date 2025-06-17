Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A31C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 14:46:02 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.20970.1750171559489608813
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jun 2025 07:46:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1uRXZS-0001Od-Ui; Tue, 17 Jun 2025 16:45:54 +0200
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1uRXZS-003zMY-2B;
	Tue, 17 Jun 2025 16:45:54 +0200
Received: from localhost ([127.0.0.1] helo=[IPv6:::1])
	by ptz.office.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1uRXZS-001sIP-1e;
	Tue, 17 Jun 2025 16:45:54 +0200
Message-ID: <8feb1a1dba066088852d16824daba9fb4fd29568.camel@pengutronix.de>
Subject: Re: [oe] [meta-oe][PATCH v2 1/6] signing.bbclass: refactor
 signing_import_cert_from_*
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: johannes.schneider@leica-geosystems.com, Enrico =?ISO-8859-1?Q?J=F6rns?=
	 <ejo@pengutronix.de>
Cc: GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>, 
	"raj.khem@gmail.com"
	 <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	 <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Jun 2025 16:45:54 +0200
In-Reply-To: <AM8PR06MB752161D5026A4CE68CC049DDBC70A@AM8PR06MB7521.eurprd06.prod.outlook.com>
References: 
	<20250531113252.3889951-1-johannes.schneider@leica-geosystems.com>
	 <20250531113252.3889951-2-johannes.schneider@leica-geosystems.com>
	 <acd9f5dac0d1fd5b700d1a0a5b634ba509b2d3b0.camel@pengutronix.de>
	 <AM8PR06MB752161D5026A4CE68CC049DDBC70A@AM8PR06MB7521.eurprd06.prod.outlook.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jun 2025 14:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117927

Hi Johannes,

On Mon, 2025-06-16 at 05:54 +0000, Johannes Schneider via lists.openembedde=
d.org wrote:
> > > -# signing_import_cert_from_pem <role> <pem>
> > > +# signing_import_cert_from_pem <cert_name> <pem>
> > >  #
> > > -# Import a certificate from PEM file to a role. To be used
> > > -# with SoftHSM.
> > > +# Import a certificate from PEM file to a cert_name.
> > > +# Where the <cert_name> can either be a previously setup
> > > +# signing_import_define_role linking the certificate to a signing ke=
y,
> > > +# or a new identifier when dealing with a standalone certificate.
> > > +#
> > > +# To be used with SoftHSM.
> > >  signing_import_cert_from_pem() {
> > > -    local role=3D"${1}"
> > > +    local cert_name=3D"${1}"
> > >      local pem=3D"${2}"
> > >=20
> > > +    # check wether the cert_name/role needs to be defined first,
> > > +    # or do so otherwise
> > > +    local uri=3D$(siging_get_uri $cert_name)
> > > +    if [ -z "$uri" ]; then
> > > +        signing_import_define_role "$cert_name"
> > > +    fi
> > > +
> > >      openssl x509 \
> > >          -in "${pem}" -inform pem -outform der |
> > > -    signing_pkcs11_tool --type cert --write-object /proc/self/fd/0 -=
-label "${role}"
> > > +    signing_pkcs11_tool --type cert --write-object /proc/self/fd/0 -=
-label "${cert_name}"
> >=20
> > In the meantime, we found that we can also load PEMs with recent pkcs11=
-tool, so
> > Enrico will send a patch to simplify this.
> >=20
>=20
> is there already a subject to search for? or a link?

I don't think Enrico has sent it yet. CCed.

> since this whole feature is motivated by the HSM limitation of one-cert-p=
er-slot
> (der), which could be sidestepped if multiple certificates in one pem fil=
e could
> be handled... should we wait for the "patch to simplify this" and then dr=
op this
> series?

HSMs can still only store certificate individually (one per label), as this=
 is
just how PKCS#11 works. Enrico's patch only lets us avoid the call to OpenS=
SL
for PEM-to-DER conversion.

So this series is still needed. :)

> >=20
> > Reviewed-by: Jan Luebbe <jlu@pengutronix.de>
> >=20
>=20
> saw you placed a 'Reviewed-by' on the other patches too; should i already=
 send
> out a v3 that pick up your suggested comment- and documentation changes, =
or wait
> (for whom/what)?

You can pick up my Reviewed-bys for any unchanged patch when you send a v3.

I'd say go ahead a send a v3, as I wouldn't expect new comments on the v2 b=
y
now.

> sidequestions: what tooling do you usually use to juggle patches?
> and how should the Reviewed-by tags be handled?

As Alex, I'd also suggest b4.

Regards,
Jan

> gru=C3=9F
> Johannes
>=20
> > >  }
> > >=20
> > >  # signing_import_pubkey_from_der <role> <der>
> > >=20
> > >=20
> >=20
> > --
> > Pengutronix e.K.                           |                           =
  |
> > Steuerwalder Str. 21                       | http://www.pengutronix.de/=
  |
> > 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0  =
  |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
> >=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117913): https://lists.openembedded.org/g/openembedde=
d-devel/message/117913
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

