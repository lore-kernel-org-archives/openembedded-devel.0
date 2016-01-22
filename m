Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id DFA1F731C1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:24:39 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id l65so265347388wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 07:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hdmOzsyYremTvan+SZ/faSue0x+ErHHEApDiLEI9K/A=;
	b=LA/1R3rwVXraersZWOMdmCH3p7BwvsmsybZUAa6z54pOcm9Xh713cIG81rEFMJ7I5S
	0t8K/MorYRRco/OfXpKISEAZ2EIc/5Eq/h9vTVMGb+OnKg/Rn6+rx2Mp6KXoixuVa/fG
	Y0w+pwp4nmnO0E910LuA204JCsHn05Q0iPBcttxAb/hI/SfsGtuyV3BNLmbGZVhccjwJ
	pZzFZr07qOkdXGOKyUOLKmOaKBIUMPxCqsIaGbxeXK2V4hMFROheldAHxDyqwwKRd0As
	JVcel0kupOy9U44ApIs5LOgBiXD23+zaxpBANWWg7LezK2eRwvrXQvC9JjzPf2xzS9vo
	/aBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=hdmOzsyYremTvan+SZ/faSue0x+ErHHEApDiLEI9K/A=;
	b=jxn5oIxnmt/dM2xYAQkSwSJDrzHJCWfZp+o6u2nHz7vgzCcIJI1qZreAg/GM09hHgk
	yzfyrkuzhFg/DIGf18l6+NMuGTObp/hBF4JBjecjnzVlekgYSr5khHOWvgDdl8Sb0ZbT
	fKX4b2Sw1VGP3+2vwXYwCXmomlaIiS0vLRNwZU4w7CukIso10DQM+RmI/j06YlPLKcEW
	kXA7GlSQrKjYCpdE4uywCN4nnTwKuW8uykniiDVk0dWG+4i/XOs4u+IpVnJ1KLGn6Afy
	7bSagTSERbxsSQcDuWHwxBtHZoFDGT7h7qJKeS/IXFz6gU+4i5ohS4Q6ZuYHTXAfnKEC
	KCCg==
X-Gm-Message-State: AG10YORi9gRxT1SSG+MPEDHCkAI8E3L0L/smnMEfqKBz+CnEqFDGTzdwhn7cq0O+/SGU/A==
X-Received: by 10.28.215.136 with SMTP id o130mr4089466wmg.33.1453476279342;
	Fri, 22 Jan 2016 07:24:39 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	fx8sm6417396wjb.13.2016.01.22.07.24.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jan 2016 07:24:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 22 Jan 2016 16:26:24 +0100
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Message-ID: <20160122152624.GA2617@jama>
References: <1453368103-1800-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1453450077.2577.16.camel@gmail.com>
	<CA+chaQdhrn9CcNXTde4ULwSodhsN+ajFZGXuY_wkSOcq-MUf+Q@mail.gmail.com>
	<1453474488.2577.220.camel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1453474488.2577.220.camel@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] networkmanager: Warning Fix
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
X-List-Received-Date: Fri, 22 Jan 2016 15:24:40 -0000
X-Groupsio-MsgNum: 59651
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline

--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 22, 2016 at 03:54:48PM +0100, Adrian Freihofer wrote:
> Hi Martin,
>=20
> Thank you for the response. But it is confusing to me...
> Networkmanager is always built with nmtui enabled, and we split it into p=
ackage networkmanager-nmtui:
> EXTRA_OECONF =3D \
> =A0 =A0 ...
> =A0=A0=A0=A0--with-nmtui=3Dyes \
> "
> PACKAGES =3D+ "...=A0${PN}-nmtui"
> FILES_${PN}-nmtui =3D " ...
>=20
> I guess an additional package option for --with-nmtui does not fit. Eithe=
r we have a compile time option or a package split.

It does fit, you can still have deterministic build time dependencies
and options and then optionally create separate package if it isn't
empty.

> Regarding rdepends:
> Since libnewt is already listed as a build dependency pkgconfig automatic=
ally creates the correct rdepends:
> =A0- libnewt is a runntime dependency of networkmanager-nmtui
> =A0- networkmanager itself does not rdepend on it.
> This is exatly what I expect. There is no need to force rdepends at all.

3rd parameter is build time dependency not runtime dependency.

The whole QA warning is about something being autodetected from sysroot
without having the build time dependency, and the QA check is using
runtime dependencies to check it -> so yes, the runtime dependency is
there in ${PN}-nmtui package, but build time dependency isn't.

> Again: I'm on jethro and I cannot see this warning.
> What are we going to fix with this patch?

Try:

bitbake libnewt && bitbake -c cleansstate networkmanager && bitbake network=
manager

it can autodetect (and QA warn) only about dependencies which happened
to be built before the recipe.

> On Fri, 2016-01-22 at 09:26 +0100, Martin Jansa wrote:
> > It is correct approach to fix it.
> >=20
> > This isn't:
> > RDEPENDS_${PN}-nmtui +=3D "libnewt"
> >=20
> > On Fri, Jan 22, 2016 at 9:07 AM, Adrian Freihofer <
> > adrian.freihofer@gmail.com> wrote:
> >=20
> > > Hi
> > >=20
> > > This is not the right approach to fix this warning.
> > > Please try something like this:
> > > RDEPENDS_${PN}-nmtui +=3D "libnewt"
> > >=20
> > > Notes:
> > > - I never saw this warning.
> > > - I would expect that pkgconfig does this automatically.
> > >=20
> > > Regards,
> > > Adrian
> > >=20
> > > On Thu, 2016-01-21 at 12:21 +0300, Li Xin wrote:
> > > > WARNING: QA Issue: networkmanager rdepends on libnewt, but it isn't=
 a
> > > build dependency? [build-deps]
> > > >=20
> > > > Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> > > > ---
> > > > =A0meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6=
=2Ebb |
> > > 1 +
> > > > =A01 file changed, 1 insertion(+)
> > > >=20
> > > > diff --git a/meta-oe/recipes-connectivity/networkmanager/
> > > networkmanager_1.0.6.bb b/meta-oe/recipes-
> > > > connectivity/networkmanager/networkmanager_1.0.6.bb
> > > > index 1ddb66f..72b4e46 100644
> > > > --- a/meta-oe/recipes-connectivity/networkmanager/
> > > networkmanager_1.0.6.bb
> > > > +++ b/meta-oe/recipes-connectivity/networkmanager/
> > > networkmanager_1.0.6.bb
> > > > @@ -56,6 +56,7 @@ PACKAGECONFIG[wifi] =3D
> > > "--enable-wifi=3Dyes,--enable-wifi=3Dno,wireless-tools,wpa-sup
> > > > =A0PACKAGECONFIG[ifupdown] =3D "--enable-ifupdown,--disable-ifupdow=
n"
> > > > =A0PACKAGECONFIG[netconfig] =3D "--with-netconfig=3Dyes,--with-netc=
onfig=3Dno"
> > > > =A0PACKAGECONFIG[qt4-x11-free] =3D "--enable-qt,--disable-qt,qt4-x1=
1-free"
> > > > +PACKAGECONFIG[libnewt] =3D "--with-nmtui=3Dyes,--with-nmtui=3Dno,l=
ibnewt"
> > > >=20
> > > > =A0PACKAGES =3D+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests
> > > ${PN}-bash-completion \
> > > > =A0=A0=A0${PN}-nmtui ${PN}-nmtui-doc \
> > > > --
> > > > 1.8.4.2
> > > >=20
> > > >=20
> > > >=20
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaiSh8ACgkQN1Ujt2V2gByoLwCfeWG4c4IJp6q3/EuUHZb6jmjH
cDYAnjJW45X1FUthEevQISsTG/zCP1bc
=oXU4
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
