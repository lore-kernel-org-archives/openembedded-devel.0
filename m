Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E953C7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 12:44:24 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.13738.1750337059373085898
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jun 2025 05:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1uSEcq-0001zJ-FL; Thu, 19 Jun 2025 14:44:16 +0200
Message-ID: <feb8d668f6bd9e29ec89d1abe0063fd2281fa4e2.camel@pengutronix.de>
Subject: Re: [oe] [meta-oe][PATCH v2 1/6] signing.bbclass: refactor
 signing_import_cert_from_*
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>, 
	johannes.schneider@leica-geosystems.com
Cc: GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>, 
	"raj.khem@gmail.com"
	 <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	 <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Jun 2025 14:44:16 +0200
In-Reply-To: <8feb1a1dba066088852d16824daba9fb4fd29568.camel@pengutronix.de>
References: 
	<20250531113252.3889951-1-johannes.schneider@leica-geosystems.com>
	 <20250531113252.3889951-2-johannes.schneider@leica-geosystems.com>
	 <acd9f5dac0d1fd5b700d1a0a5b634ba509b2d3b0.camel@pengutronix.de>
	 <AM8PR06MB752161D5026A4CE68CC049DDBC70A@AM8PR06MB7521.eurprd06.prod.outlook.com>
	 <8feb1a1dba066088852d16824daba9fb4fd29568.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 12:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117945

Am Dienstag, dem 17.06.2025 um 16:45 +0200 schrieb Jan L=C3=BCbbe:
> Hi Johannes,
>=20
> On Mon, 2025-06-16 at 05:54 +0000, Johannes Schneider via lists.openembed=
ded.org wrote:
> > > > -# signing_import_cert_from_pem <role> <pem>
> > > > +# signing_import_cert_from_pem <cert_name> <pem>
> > > > =C2=A0#
> > > > -# Import a certificate from PEM file to a role. To be used
> > > > -# with SoftHSM.
> > > > +# Import a certificate from PEM file to a cert_name.
> > > > +# Where the <cert_name> can either be a previously setup
> > > > +# signing_import_define_role linking the certificate to a signing =
key,
> > > > +# or a new identifier when dealing with a standalone certificate.
> > > > +#
> > > > +# To be used with SoftHSM.
> > > > =C2=A0signing_import_cert_from_pem() {
> > > > -=C2=A0=C2=A0=C2=A0 local role=3D"${1}"
> > > > +=C2=A0=C2=A0=C2=A0 local cert_name=3D"${1}"
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 local pem=3D"${2}"
> > > >=20
> > > > +=C2=A0=C2=A0=C2=A0 # check wether the cert_name/role needs to be d=
efined first,
> > > > +=C2=A0=C2=A0=C2=A0 # or do so otherwise
> > > > +=C2=A0=C2=A0=C2=A0 local uri=3D$(siging_get_uri $cert_name)
> > > > +=C2=A0=C2=A0=C2=A0 if [ -z "$uri" ]; then
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 signing_import_define_r=
ole "$cert_name"
> > > > +=C2=A0=C2=A0=C2=A0 fi
> > > > +
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 openssl x509 \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -in "${pem}" -info=
rm pem -outform der |
> > > > -=C2=A0=C2=A0=C2=A0 signing_pkcs11_tool --type cert --write-object =
/proc/self/fd/0 --label "${role}"
> > > > +=C2=A0=C2=A0=C2=A0 signing_pkcs11_tool --type cert --write-object =
/proc/self/fd/0 --label "${cert_name}"
> > >=20
> > > In the meantime, we found that we can also load PEMs with recent pkcs=
11-tool, so
> > > Enrico will send a patch to simplify this.
> > >=20
> >=20
> > is there already a subject to search for? or a link?
>=20
> I don't think Enrico has sent it yet. CCed.

Haven't sent it yet since I assumed it'll conflict with this series that ma=
de it to the list a day
before mine =F0=9F=98=89 Will send a version now if a v3 is required anyway=
.
So you can decide in which order to it makes more sense to merge it.

Regards, Enrico

> > since this whole feature is motivated by the HSM limitation of one-cert=
-per-slot
> > (der), which could be sidestepped if multiple certificates in one pem f=
ile could
> > be handled... should we wait for the "patch to simplify this" and then =
drop this
> > series?
>=20
> HSMs can still only store certificate individually (one per label), as th=
is is
> just how PKCS#11 works. Enrico's patch only lets us avoid the call to Ope=
nSSL
> for PEM-to-DER conversion.
>=20
> So this series is still needed. :)
>=20
> > >=20
> > > Reviewed-by: Jan Luebbe <jlu@pengutronix.de>
> > >=20
> >=20
> > saw you placed a 'Reviewed-by' on the other patches too; should i alrea=
dy send
> > out a v3 that pick up your suggested comment- and documentation changes=
, or wait
> > (for whom/what)?
>=20
> You can pick up my Reviewed-bys for any unchanged patch when you send a v=
3.
>=20
> I'd say go ahead a send a v3, as I wouldn't expect new comments on the v2=
 by
> now.
>=20
> > sidequestions: what tooling do you usually use to juggle patches?
> > and how should the Reviewed-by tags be handled?
>=20
> As Alex, I'd also suggest b4.
>=20
> Regards,
> Jan
>=20
> > gru=C3=9F
> > Johannes
> >=20
> > > > =C2=A0}
> > > >=20
> > > > =C2=A0# signing_import_pubkey_from_der <role> <der>
> > > >=20
> > > >=20
> > >=20
> > > --
> > > Pengutronix e.K.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > > Steuerwalder Str. 21=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | http://www.pengutronix.de/=C2=A0 |
> > > 31137 Hildesheim, Germany=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | Phone: +49-5=
121-206917-0=C2=A0=C2=A0=C2=A0 |
> > > Amtsgericht Hildesheim, HRA 2686=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | Fax:=C2=A0=C2=A0 +49-5121-206917-5555 |
> > >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#117913): https://lists.openembedded.org/g/openembed=
ded-devel/message/117913
> > Mute This Topic: https://lists.openembedded.org/mt/113394167/2167243
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
=C2=A0[jlu@pengutronix.de]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20
>=20

--=20
Pengutronix e.K.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Enrico J=C3=B6rns=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
Embedded Linux Consulting & Support=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| https://www.pengutronix.de/ |
Steuerwalder Str. 21=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| Phone: +49-5121-206917-180=C2=A0=C2=A0|
31137 Hildesheim, Germany=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Fax:=C2=A0=C2=
=A0=C2=A0+49-5121-206917-9=C2=A0=C2=A0=C2=A0=C2=A0|

