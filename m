Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id E3F41755F4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 11:56:05 +0000 (UTC)
Received: by wikq8 with SMTP id q8so207862032wik.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 04:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NFa9umIDSECXZqag3xNydLGEmu9UDYjEFmYnEDrZ9w8=;
	b=izV0uydKewGG9UhmwGKZZj8oE4ov3lyZlZfzK1LiBRIJGwEBU4usvlGgWkXxlwswrG
	w7jdmkCHE8tjda/+3aBAdZKbYTZW0HbBARtFBXV8S3lYkHgQvvhaESw7EfakdUrhMKU4
	F4SvavNRVa4cuoegb4yTR9fyqyNWpohTGELvM7746Z14qe3geZnwweHwEqMpAC3tbMgC
	XOGXHErTmf/zz83KAYRAXcpEClIFcpSzqt8pzOJ9ZSgIc4jPCeUv1OlMKyTKXKYaxLQ+
	uY+PXadeHDJ3G4F2O2vzgvSz8tD3sq+zqcWu8LsCua2R6cfbaZC2n2TUsU2TxSMGOADS
	O0tQ==
X-Received: by 10.180.39.195 with SMTP id r3mr14845018wik.57.1445946964797;
	Tue, 27 Oct 2015 04:56:04 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id e9sm14807292wjw.8.2015.10.27.04.56.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Oct 2015 04:56:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 27 Oct 2015 12:56:20 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151027115620.GB2577@jama>
References: <d65ccb58baa5f0e85ea3719c4826c4a1@losert.org>
MIME-Version: 1.0
In-Reply-To: <d65ccb58baa5f0e85ea3719c4826c4a1@losert.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-qt5] qtbluetooth not building against bluez
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Oct 2015 11:56:07 -0000
X-Groupsio-MsgNum: 58064
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Content-Disposition: inline

--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2015 at 11:51:44AM +0100, michael@losert.org wrote:
> I'm using qtbluetooth (qtconnectivity_git.bb) and noticed that it builds=
=20
> some kind of empty dummy library.
> I then tried building in verbose mode: "bitbake -v qtconnectivity" and=20
> got the following message in the log:
> "Unsupported Bluetooth platform, will not build a working QtBluetooth=20
> library.
> Either no Qt D-Bus found or no BlueZ headers."
>=20
> My solution was to add
>    EXTRA_QMAKEVARS_PRE +=3D "CONFIG+=3Dconfig_bluez"
> to
>    recipes-qt/qt5/qtconnectivity_git.bb

Someone else send patch for this:
http://patchwork.openembedded.org/patch/105501/

I've asked him to resend with proper commit message, author and SOB, but
haven't seen v2.

But there is also first line in this do_configure_prepend, which should
take care of respecting PACKAGECONFIG values, we should check why it
doesn't work anymore and fix the root-cause instead of reintroducing

EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'bluez4', 'CONF=
IG+=3DOE_BLUEZ_ENABLED', '', d)}"

do_configure_prepend() {
    export QMAKE_CACHE_EVAL=3D"CONFIG+=3D${EXTRA_OECONF}"
    # disable bluez test if it isn't enabled by PACKAGECONFIG
    sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g=
' ${S}/qtconnectivity.pro
}

Can you please look into that?

> after that it worked as expected.
> I'm unsure if it's the right thing to do though.
>=20
> I'm working with yocto 1.8 fido but also checked the master branch which=
=20
> doesn't seem to have anything changed related to qtconnectivity.
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYvZmQACgkQN1Ujt2V2gBzu2wCgtyNFJ9zesPAhQIX4haAw2iuo
FEkAnj28dQ677mDjTqB8Yn/Yds3WhICg
=h2fU
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--
