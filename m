Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9383F6E666
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 20:37:46 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id u188so4851837wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 12:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uKYqjmmgGymJcCcOJ1WSaF3dm+7Hh7DZP4ua9b20MAc=;
	b=EBop2E1yEugrUQ6j67mUiHUnDfTRdsI7uapTHLd2kSmOu3SDgcxgmr1VuqjkQz6pFW
	67sfOMLeeeKKTF8Hjol8GLBWTQ5+m7C4bJp8C7uU/8Jv1Zu363Rd/B6ASPNZ9GJuJT60
	y5r8XccQNyBR+SCNP8zPblBIhwsolUMC7AHoTp6oQFVTBZoP2l+MOMwac+4y4u9AtuJ/
	nAHvMAJx+vadodOC/f+kvL/gY7i3gcsPYWmPjbZ+NSjH0Gl2WcVQtTtJf9J42V9c1O3d
	3ujrDTKGngxQcmwvqJ0/QfxyI79VB5MDw69XAGVsHNY8dHLHRDTOxPD63vBXinzrqDOk
	vCfg==
X-Received: by 10.194.206.69 with SMTP id lm5mr92402710wjc.84.1451939866815;
	Mon, 04 Jan 2016 12:37:46 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id u4sm87312872wjz.4.2016.01.04.12.37.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jan 2016 12:37:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 4 Jan 2016 21:37:45 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160104203745.GB2378@jama>
References: <1451923194-60100-1-git-send-email-javier.viguera@digi.com>
	<20160104161718.GA2378@jama> <568AA04B.8000101@digi.com>
MIME-Version: 1.0
In-Reply-To: <568AA04B.8000101@digi.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-qt5][master][jethro][PATCH] qtconnectivity, qtsystems: fix bluetooth support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Jan 2016 20:37:48 -0000
X-Groupsio-MsgNum: 59335
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Content-Disposition: inline

--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 04, 2016 at 05:39:39PM +0100, Javier Viguera wrote:
> On 04/01/16 17:17, Martin Jansa wrote:
> >
> > Is it deterministic?
> >
> > Will it always pick bluez4 when BLUEZ is set to bluez4, but there is
> > bluez5 is already in the sysroot as well?
>=20
> No, BLUEZ is set by *bluetooth* class depending on your distro features=
=20
> and is only used to add 'bluez4' or 'bluez5' to the recipe build-time=20
> dependences (DEPENDS). But apart from that it does nothing to the QT5=20
> compilation itself.

That's not what I was asking about.

Some distros are still using bluez4, you can try it as well with:
DISTRO_FEATURES_remove =3D "bluez5"
DISTRO_FEATURES_append =3D " bluez4"

But nothing prevents bluez5 from being populated in the sysroot, because
unlike bluez4 in meta-oe, bluez5 in oe-core doesn't set the PNBLACKLIST
the make these 2 recipes really mutually exclusive in sysroot.

So you can build both with:
bitbake -c build bluez5 bluez4
(or with "bitbake world")

and you end with 2 providers for bluez.pc (and bluetooth.so) in the sysroot
and qtconnectivity will get runtime dependency on whatever bluez version
was built first, e.g. bluez5 even when BLUEZ variable says bluez4. See
shlibs provider code in package.bbclass.

That's cause for undeterministic builds and this QA warning:
WARNING: QA Issue: qtconnectivity rdepends on bluez5, but it isn't a build =
dependency? [build-deps]

>=20
> >
> > config.tests/bluez/bluez.pro is only using pkgconfig to find bluez, so
> > I'm not sure which one will win.
>=20
> Neither do I, but I don't think having both versions of the bluez=20
> libraries in the sysroot is a common use-case. The package config file=20
> for bluez4 and bluez5 is almost the same. It adds the same cflags and=20
> libs to any package querying it:
>=20
> Libs: -L${libdir} -lbluetooth
> Cflags: -I${includedir}
>=20
> So to recap: this change fix the bluetooth support which is currently=20
> broken because QMAKE_CACHE_EVAL is not used at all, and also allows to=20
> build QT5 bluetooth support using bluez5 instead of the hard-coded bluez4.

I understand that, but it adds bluez5 support with undeterministic
behavior, which can cause currently bluez4 only images to get bluez5
dependency through qtconnectivity, as uncommon such setup it could be
it's still an issue (which should be fixed eithr in oe-core or meta-qt5).

Maybe I should PNBLACKLIST bluez4 only recipes with message that they
will be removed from meta-oe after 2.1 release and stop caring about
issues like this.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaK2BgACgkQN1Ujt2V2gByf6wCeNoZeWGKMqsl+K7HEYeV1gzjQ
vXAAoK47jlIxdu/y51A9cUa+pJJhH4ak
=LUZv
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
