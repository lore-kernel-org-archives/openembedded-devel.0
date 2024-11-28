Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ECEED690F9
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 10:48:57 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.91755.1732790934834726333
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Nov 2024 02:48:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1tGc4q-00060Z-OC; Thu, 28 Nov 2024 11:48:52 +0100
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1tGc4p-000b8m-2B;
	Thu, 28 Nov 2024 11:48:52 +0100
Received: from localhost ([127.0.0.1])
	by ptz.office.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1tGc4q-00ASZA-0x;
	Thu, 28 Nov 2024 11:48:52 +0100
Message-ID: <1727d53834f2687b9590476233b9676a92c0d056.camel@pengutronix.de>
Subject: Re: [oe] [meta-oe][PATCH v1] signing.bbclass: add certificate
 ca-chain handling
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: johannes.schneider@leica-geosystems.com
Cc: "openembedded-devel@lists.openembedded.org"
	 <openembedded-devel@lists.openembedded.org>, ZHIZHIKIN Andrey
	 <andrey.zhizhikin@leica-geosystems.com>
Date: Thu, 28 Nov 2024 11:48:52 +0100
In-Reply-To: <AM8PR06MB7521EC2BB3A7EDB743AC4B8BBC282@AM8PR06MB7521.eurprd06.prod.outlook.com>
References: 
	<20241101120514.185668-1-johannes.schneider@leica-geosystems.com>
	 <993d5bc627151ecab7366454bc0fa0f02491cf28.camel@pengutronix.de>
	 <AM8PR06MB7521EC2BB3A7EDB743AC4B8BBC282@AM8PR06MB7521.eurprd06.prod.outlook.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Nov 2024 10:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114109

Hi,

On Wed, 2024-11-27 at 03:39 +0000, Johannes Schneider via lists.openembedde=
d.org wrote:
> > On Fri, 2024-11-01 at 13:05 +0100, Johannes Schneider via lists.openemb=
edded.org wrote:
> > > Add handling of ca-chains which can consist of more than one
> > > certificate in a .pem file, which need to be split off, processed and
> > > stored separately in the softhsm - as the tool-chain
> > > signing.bbclass::signing_import_cert* -> softhsm -> 'extract-cert'
> > > only supports one-per-file, due to using/expecting "plain" x509
> > > in-/output.
> > >=20
> > > The added signing_import_cert_chain_from_pem function takes a <role>
> > > basename, and iterates through the input .pem file, creating numbered
> > > <role>_1, _2, ... roles as needed.
> >=20
> > Why do you want to import certificates without corresponding private
> > keys into the singing mechanism?
> >=20
> > They can't be used for signing, so don't really fit the role concept as
> > I intended it. This mismatch then leads to workarounds such as the _N
> > suffix and the problem below.
>=20
> During a (yocto) build, there can be places where the key is used to sign
> something, and other places where the corresponding certificate is insert=
ed/used
> to verify the former - so there are two different "consumers" of one role=
; e.g.
> the kernel fitimage is signed with A.key, and at bootloader build time A.=
cert is
> inserted into the bootloader so that it can later verify what it is suppo=
sed to load.

Yes, this split between signed artifact component (e.g. fitimage) and
authenticating component (e.g. bootloader) was the main motivation for
the concept of roles: both users of a role can be switched from one
(development) key to a different one at a single place
(local/auto.conf).

> Now the bootloader<>kernel uscase is simple, because there is no verifica=
tion of
> the certificate; e.g. there is no need to provide the complete chain.

(for fit images, the certificate isn't even available during
authentication, only the public key)

> But other usecases sign $something during buildtime, and at runtime this
> artifact would then be verified against a certificate, which in turn woul=
d need
> to be verified against it's CA-chain.

Beyond the simple case of self-signed certificates, I find it clearer
to talk about leaf, intermediate and root certificates. Depending on
context, "chain" can mean leaf+intermediates, intermediates only, or
even leaf+intermediates+root.

On the target, only the root certificates need to be stored in a
trusted location. The intermediate certificates are usually provided
with the signature to let the authenticating component to build a path
to a trusted root.

The leaf certificate is special in this case mainly because it's the
only certificate for which we have the corresponding private key.

> By keeping the leaf (key+cert) plus all links (just the cert) up the cert=
ificate
> chain, the softhsm can be used as "single source of keymaterial". Otherwi=
se
> there could be a rift between taking the keys from the softhsm during bui=
ldtime,
> but takeing the certificate (-chains) from $elsewhere.

If we say signing.bbclass instead of SoftHSM, I'd agree.

SoftHSM doesn't actually provide more security for private keys than
simple .pem files. So why add all this complexity instead of using
simple OE variable pointing to a private key file? Because it allows us
to:
- support hardware tokens
- decouple key configuration from key usage
  =3D> simplifies reuse
  =3D> consistent configuration for many recipes
- use same code-paths for development and release
  =3D> better testing

(for more background info, see my OE WS 2023 talk
https://pretalx.com/openembedded-workshop-2023/talk/3C8MFF/)


I definitely agree that signing.bbclass should also have a way to get
the intermediate and root certs for any given key-pair via the role.
Introducing additional certificate-only roles for this causes new
problems, though (see below).

> > > Afterwards the certificates can be used or extracted one-by-one from
> > > the softhsm, using the numbered roles; the only precondition - or
> > > limitation - is that the PKI structure has to be known beforhand;
> > > e.g. how many certificates are between leaf and root.
> >=20
> > The point of the signing.bbclass is to abstract over different HSMs and
> > allow flexible key selection at the .conf level.
> >=20
> > With this approach, any recipe using this set of generated
> > (certificate-only) roles now needs to know how long the chain is and
> > the PKIs with different layouts are no longer possible.
>=20
> That is the one caveat - the layout has to be the same and known beforeha=
nd;
> should we add more logic=3Dcomplexity into the class to detect and handle=
 this
> (... i guess: no ;-)?

The information has to be stored somewhere, but ideally only in one
place. It can't be the recipes, because we always have (at least) two
of them (signing and authenticating components). Also, hard-coding
details of the layout in recipes reduces reusability across layers or
projects.

I'm not willing to give up on the goal of proper decoupling. As the
inherent complexity has to live somewhere, I'd prefer the class, so a
single implementation can be reused and the recipes are less complex.


One aspect to consider is that there is not a one-to-one relationship
between the leaf certificate and the set of CA certificates
(intermediates+root): CAs are used to support multiple interchangeable
leaf certificates under a single trusted root. Without the need of
multiple leaf certs, you could just use a self-signed cert and avoid
all this complexity. :)

For example, one build configuration could have different key-pairs
(roles) for different components, e.g. kernel modules and an IPE
policies. Their certificates may still be signed by the same CA, as
they are authenticated by the same component (the kernel).


So, handling (intermediate and root) CA certificates separately from
the roles would allow us to refer to them indirectly.

> > Could you describe you use-case in detail? I think we should try to
> > find a design which avoids using roles for certificate chains, while
> > also allowing different PKI layouts between SoftHSM and actual HSMs.
>=20
> We have a build setup that, depending on a build-configuration switch, us=
es
> either development-keymaterial, or production-keymaterial. So the (soft)H=
SM
> encapsuled by the signing.bbclass and it's roles becomes the common inter=
face
> through which all keymaterial is requested for artifact-signing purposes,=
 or
> certificate (chains) are gathered to populate e.g. the rootfs with, for u=
se
> during system runtime.

Yes.

> The intended usecase of the signing.bbclass is certainly to swith around =
the
> actual underlying HSMs (e.g. have a softhsm with devkeys, but a "real" HS=
M for
> the production usecase) - but due to limitations with our CI infrastructu=
re...
> we only have a secured channel to fetch the productive keymaterial, but s=
till
> need/intend to use the softhsm to "secure" the keymaterial on the CI duri=
ng
> build-time.

Using SoftHSM doesn't provide any security. If you're OK with that, it
still is useful as part of the abstraction, so that keys can be
switched without touching recipes.


Note that certificates are not secret, so storing them in a HSM is
primarily useful because that avoids the need of a different storage
location. Alternatively, all certs could be stored as files in the
layer and found by recursively walking the X509v3 Authority Key
Identifiers (but that would likely need a small tool to be called from
the class).=20

> > > Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystem=
s.com>
> > > ---
> > > =C2=A0meta-oe/classes/signing.bbclass | 30 ++++++++++++++++++++++++++=
++++
> > > =C2=A01 file changed, 30 insertions(+)
> > >=20
> > > diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signin=
g.bbclass
> > > index 3e662ff73..8af7bbf8e 100644
> > > --- a/meta-oe/classes/signing.bbclass
> > > +++ b/meta-oe/classes/signing.bbclass
> > > @@ -134,6 +134,36 @@ signing_import_cert_from_der() {
> > > =C2=A0=C2=A0=C2=A0=C2=A0 signing_pkcs11_tool --type cert --write-obje=
ct "${der}" --label "${role}"
> > > =C2=A0}
> > >=20
> > > +# signing_import_cert_chain_from_pem <role> <pem>
> > > +#
> > > +
> > > +# Import a certificate *chain* from a PEM file to a role.
> > > +# (e.g. multiple ones concatenated in one file)
> > > +#
> > > +# Due to limitations in the toolchain:
> > > +#=C2=A0=C2=A0 signing class -> softhsm -> 'extract-cert'
> > > +# the input certificate is split into a sequentially numbered list o=
f roles,
> > > +# starting at <role>_1
> > > +#
> > > +# (The limitations are the conversion step from x509 to a plain .der=
, and
> > > +# extract-cert expecting a x509 and then producing only plain .der a=
gain)
> > > +signing_import_cert_chain_from_pem() {
> > > +=C2=A0=C2=A0=C2=A0 local role=3D"${1}"
> > > +=C2=A0=C2=A0=C2=A0 local pem=3D"${2}"
> > > +=C2=A0=C2=A0=C2=A0 local i=3D1
> > > +
> > > +=C2=A0=C2=A0=C2=A0 cat "${pem}" | \
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while openssl x509 -infor=
m pem -outform der -out ${B}/temp_${i}.der; do
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
igning_import_define_role "${role}_${i}"
> >=20
> > Calling signing_import_define_role() from an import function breaks the
> > separation and ordering we currently use (first
> > signing_import_define_role(), then import certs/keys) and is surprising
> > compared to the existing signing_import_define_role()
>=20
> That is true... got any advice/ideas on how to handle this?
>=20
> This way the PKI layout =3D the certificate chain lenght, has not to be k=
nown at
> the time of the import, but only when using the roles. A separate
> signing_import_define_N_roles(N) to have them prepared "blindly" ahead of=
 time?

If we separate certificates from roles, we'd have something like this
in the provider (where development keys are imported):
  signing_import_prepare

  signing_import_root_cert kernel ".../kernel-ca.crt"

  signing_import_define_role kernel_modules
  signing_import_cert_from_pem kernel_modules "${S}/kmod-development.crt"
  signing_import_key_from_pem kernel_modules "${S}/kmod-development.key"
  signing_import_set_ca kernel_modules kernel

  signing_import_define_role kernel_ipe
  signing_import_cert_from_pem kernel_ipe "${S}/ipe-development.crt"
  signing_import_key_from_pem kernel_ipe "${S}/ipe-development.key"
  signing_import_set_ca kernel_ipe kernel

  signing_import_finish

In the recipes using these roles, you'd need to refer to the CA. For
the kernel (authenticating component):
  signing_prepare
  cp "$(signing_get_root_cert kernel)" "${B}/kernel_ca.pem"

When signing the modules, you'd use:
  signing_prepare
  signing_use_role kernel_modules
  ... use $PKCS11_URI


For cases wth intermediate certificates, we could chain them to their
respective CA:
  signing_import_prepare

  signing_import_root_cert kernel ".../kernel-ca.crt"
  signing_import_intermediate_cert kernel_2024 kernel ".../kernel-kmods.crt=
"

  signing_import_define_role kernel_modules
  signing_import_cert_from_pem kernel_modules "${S}/kmod-development.crt"
  signing_import_key_from_pem kernel_modules "${S}/kmod-development.key"
  signing_import_set_ca kernel_modules kernel_2024

  signing_import_define_role kernel_ipe
  signing_import_cert_from_pem kernel_ipe "${S}/ipe-development.crt"
  signing_import_key_from_pem kernel_ipe "${S}/ipe-development.key"
  signing_import_set_ca kernel_ipe kernel_2024

  signing_import_finish

To support this, only the user (e.g. kernel modules, IPE policy) would
need to conditionally include the intermediate certificates:

  signing_prepare
  signing_use_role kernel_modules
  SIGN_CMD=3D"... --key=3DPKCS11_URI ..."
  if signing_has_intermediate_certs kernel_modules; then
    SIGN_CMD=3D"$SIGN_CMD --intermediate=3D$(signing_get_intermediate_certs=
 kernel_modules)"
  fi

This recipe-level-code would support all cases:
- self-signed cert for simple cases
- leaf + root cert (no intermediates)
- leaf + intermediate + root cert (intermediates include with the signature=
)


For release builds, in addition to overriding the roles, you'd need to
override the certificates as well in you .conf:
  SIGNING_PKCS11_URI[kernel_modules] =3D "pkcs11:serial=3DDENK0200554;objec=
t=3Dkmod&pin-value=3D123456"
  SIGNING_CA_CERT[kernel_modules] =3D "file:///kod-ca.cert"
  SIGNING_PKCS11_URI[kernel_ipe] =3D "pkcs11:serial=3DDENK0200554;object=3D=
ipe&pin-value=3D123456"
  SIGNING_CA_CERT[kernel_ipe] =3D "pkcs11:serial=3DDENK0200554;object=3Dipe=
-ca"
  SIGNING_CA_CERT[kernel] =3D "pkcs11:serial=3DDENK0200554;object=3Dkernel-=
ca"
So, you could have the certificates as files or in the HSM.

If you'd need to define a different hierarchy, you'd add:
  SIGNING_CA[kernel_modules] =3D "product_a_kmods_2024"
  SIGNING_CA_CERT[kernel_modules] =3D "..."
  SIGNING_CA[kernel_ipe] =3D "product_a_ipe_2024"
  SIGNING_CA_CERT[kernel_ipe] =3D "..."
  SIGNING_CA[product_a_kmods_2024] =3D "product_a_2024"
  SIGNING_CA_CERT[product_a_kmods_2024] =3D "..."
  SIGNING_CA[product_a_ipe_2024] =3D "product_a_2024"
  SIGNING_CA_CERT[product_a_ipe_2024] =3D "..."
  SIGNING_CA[product_a_2024] =3D "release-ca"
  SIGNING_CA_CERT[product_a_2024] =3D "..."
  SIGNING_CA_CERT[release-ca] =3D "..."
And the actual recipes wouldn't need to change, preserving the
decoupling between recipes and PKI configuration.

I think that should offer enough flexibility for your and other
scenarios.

Regards
Jan
--=20
Pengutronix e.K.                        |                             |
Steuerwalder Str. 21                    | https://www.pengutronix.de/ |
31137 Hildesheim, Germany               | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686        | Fax:   +49-5121-206917-5555 |



