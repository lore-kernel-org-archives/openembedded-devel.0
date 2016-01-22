Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7F2CD7326D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 17:27:07 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id u188so27196018wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 09:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vw2kIH7dCU4bMvdgx7THi6r2nFTYDZ4L+iGEys7GflU=;
	b=ZP3BdLcdGpX8jkN0nXZ8ubHf4VH6f7CJMMLgin/RtOQJ/xVVteH2z1Dy9t+Yup7fv4
	X12kbe6C4bIOqObRVXOcVMwInoihLnX0+OAmy+JPnJdlZDPV2PZXNHp7rZWHPqSmkR8B
	UanI6++dYnaICuesmYarr+pcVWaXNT5Wbvyvilt6JyOHST73wexgTrB5Sgx5YX9SiGlq
	buHSKzPqxnjEvGfrvB3aRQUmR4MjUnKdtxerHr5KlTZa2yv7ZJ9645LyPg9Wwp6FrRar
	J2ywsdiwHeXQytG3dwuRtz7EwudTZJFDvZ2JWs1B1lZVqJ8xbSUgyN5/pa1NvVTj6uEy
	KzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=vw2kIH7dCU4bMvdgx7THi6r2nFTYDZ4L+iGEys7GflU=;
	b=DXGnL6MRLKD4GZwoybCMiUH3PR+S3OoWhCV4kT4nIe9c73FlHovb566F0aUhhrPc5G
	MKtAoaiwKDiFVG8uPy5cjzCCyeoCud53AvTUwhKwY1bT7FWka60IdLSlIFFPk+69iw2d
	QGdX14YSksDno0avnR5OZgMN6BGBKkcKcWJetbNBpudyxClX5v4J5OlRjOCNM3kkQ641
	bVa/xgpY7sfqDfW9Dul1wafioDWBOi3BoRCGiCQod2nQTRWmiy1PF5T6caNwT3YNBeRu
	qGUPZq7lNjCva4OFlFBeIUUrbp0F8fd5p3Q0jzbeq1yphl4k3aPr2c3V+dz8K1xSYeQl
	ee1g==
X-Gm-Message-State: AG10YOR2R3oX4vLY0sZHvKKablb46IraLliLffEPd3uYZHsoAMcCQDdHNhU6+5YRxNt8mQ==
X-Received: by 10.28.0.79 with SMTP id 76mr5095557wma.27.1453483627090;
	Fri, 22 Jan 2016 09:27:07 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id ko2sm6858832wjc.9.2016.01.22.09.27.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jan 2016 09:27:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 22 Jan 2016 18:28:52 +0100
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Message-ID: <20160122172852.GB2617@jama>
References: <1453368103-1800-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1453450077.2577.16.camel@gmail.com>
	<CA+chaQdhrn9CcNXTde4ULwSodhsN+ajFZGXuY_wkSOcq-MUf+Q@mail.gmail.com>
	<1453474488.2577.220.camel@gmail.com> <20160122152624.GA2617@jama>
	<1453482312.2577.256.camel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1453482312.2577.256.camel@gmail.com>
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
X-List-Received-Date: Fri, 22 Jan 2016 17:27:12 -0000
X-Groupsio-MsgNum: 59653
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Content-Disposition: inline

--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 22, 2016 at 06:05:12PM +0100, Adrian Freihofer wrote:
> Thank you for the explanation. I did everything as you suggested.
>=20
> I aggree with you, that we should add the PACKAGEOPTION[nmtui] (I prefer =
nmtui over libnewt, because the user wants to have nmtui, not
> liwnewt). I tried it and is exactly as you said. An empty package is prop=
erly handled by bitbake.
>=20
> The second point, which was the reason for the patch, at least according =
its subject, I still can't follow. I verified that my bitbake has
> the right configuration (default jethro) to display this warning and then=
 I did the recompilation as you suggested. There is no warning on
> my system. I still cannot understand why there should be a change in the =
dependencies if we have:

Can you check if your do_configure enabled nmtui? log.do_configure or
config.log should help. If it doesn't enable it for you then it will
explain why you don't see the warning (maybe it needs some additional
dependency + libnewt). I haven't looked at the mnetworkmanager sources
at all..

> DEPENDS=3D"libnewt"

Ah I didn't notice that it's already in DEPENDS.

>=20
> and then add
>=20
> PACKAGECONFIG[libnewt] =3D "--with-nmtui=3Dyes,--with-nmtui=3Dno,libnewt"

If nmtui is the only part of networkmanager which is using libnewt then
yes I agree it should be removed from DEPENDS and moved only to
PACKAGECONFIG.

>=20
> In both cases libnewt is a build dependency.
>=20
> According to my understandig the patch should be renamed to
> "networkmanager: make libnewt build dep optional"
>=20
> and it should look like:
>=20
>=20
> diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1=
=2E0.10.bb b/meta-oe/recipes-
> connectivity/networkmanager/networkmanager_1.0.10.bb
> index b47a8c8..8bdfba3 100644
> --- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
> +++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcbbffd568227ad=
a506640fe950a4823b \
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0file://doc=
s/api/html/license.html;md5=3D51d7fb67bde992e58533a8481cee070b \
> =A0"
> =A0
> -DEPENDS =3D "libnl dbus dbus-glib libgudev util-linux libndp libnewt"
> +DEPENDS =3D "libnl dbus dbus-glib libgudev util-linux libndp"
> =A0
> =A0inherit gnomebase gettext systemd bluetooth
> =A0
> @@ -32,7 +32,6 @@ EXTRA_OECONF =3D " \
> =A0=A0=A0=A0=A0--disable-more-warnings \
> =A0=A0=A0=A0=A0--with-iptables=3D${sbindir}/iptables \
> =A0=A0=A0=A0=A0--with-tests \
> -=A0=A0=A0=A0--with-nmtui=3Dyes \
> =A0"
> =A0
> =A0PACKAGECONFIG ??=3D "nss ifupdown netconfig dhclient dnsmasq \
> @@ -59,6 +58,7 @@ PACKAGECONFIG[gnutls] =3D "--with-crypto=3Dgnutls,,gnut=
ls libgcrypt"
> =A0PACKAGECONFIG[wifi] =3D "--enable-wifi=3Dyes,--enable-wifi=3Dno,wirele=
ss-tools,wpa-supplicant wireless-tools"
> =A0PACKAGECONFIG[ifupdown] =3D "--enable-ifupdown,--disable-ifupdown"
> =A0PACKAGECONFIG[netconfig] =3D "--with-netconfig=3Dyes,--with-netconfig=
=3Dno"
> +PACKAGECONFIG[nmtui] =3D "--with-nmtui=3Dyes,--with-nmtui=3Dno,libnewt"
> =A0
> =A0PACKAGES =3D+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bas=
h-completion \
> =A0=A0=A0${PN}-nmtui ${PN}-nmtui-doc \
>=20
>=20
>=20
> Do you agree? May I send the patch again with git send-email?
>=20
> Thank you and regards,
> Adrian
>=20
>=20
>=20
> On Fri, 2016-01-22 at 16:26 +0100, Martin Jansa wrote:
> > On Fri, Jan 22, 2016 at 03:54:48PM +0100, Adrian Freihofer wrote:
> > > Hi Martin,
> > >=20
> > > Thank you for the response. But it is confusing to me...
> > > Networkmanager is always built with nmtui enabled, and we split it in=
to package networkmanager-nmtui:
> > > EXTRA_OECONF =3D \
> > > =A0 =A0 ...
> > > =A0=A0=A0=A0--with-nmtui=3Dyes \
> > > "
> > > PACKAGES =3D+ "...=A0${PN}-nmtui"
> > > FILES_${PN}-nmtui =3D " ...
> > >=20
> > > I guess an additional package option for --with-nmtui does not fit. E=
ither we have a compile time option or a package split.
> >=20
> > It does fit, you can still have deterministic build time dependencies
> > and options and then optionally create separate package if it isn't
> > empty.
> >=20
> > > Regarding rdepends:
> > > Since libnewt is already listed as a build dependency pkgconfig autom=
atically creates the correct rdepends:
> > > =A0- libnewt is a runntime dependency of networkmanager-nmtui
> > > =A0- networkmanager itself does not rdepend on it.
> > > This is exatly what I expect. There is no need to force rdepends at a=
ll.
> >=20
> > 3rd parameter is build time dependency not runtime dependency.
> >=20
> > The whole QA warning is about something being autodetected from sysroot
> > without having the build time dependency, and the QA check is using
> > runtime dependencies to check it -> so yes, the runtime dependency is
> > there in ${PN}-nmtui package, but build time dependency isn't.
> >=20
> > > Again: I'm on jethro and I cannot see this warning.
> > > What are we going to fix with this patch?
> >=20
> > Try:
> >=20
> > bitbake libnewt && bitbake -c cleansstate networkmanager && bitbake net=
workmanager
> >=20
> > it can autodetect (and QA warn) only about dependencies which happened
> > to be built before the recipe.
> >=20
> > > On Fri, 2016-01-22 at 09:26 +0100, Martin Jansa wrote:
> > > > It is correct approach to fix it.
> > > >=20
> > > > This isn't:
> > > > RDEPENDS_${PN}-nmtui +=3D "libnewt"
> > > >=20
> > > > On Fri, Jan 22, 2016 at 9:07 AM, Adrian Freihofer <
> > > > adrian.freihofer@gmail.com> wrote:
> > > >=20
> > > > > Hi
> > > > >=20
> > > > > This is not the right approach to fix this warning.
> > > > > Please try something like this:
> > > > > RDEPENDS_${PN}-nmtui +=3D "libnewt"
> > > > >=20
> > > > > Notes:
> > > > > - I never saw this warning.
> > > > > - I would expect that pkgconfig does this automatically.
> > > > >=20
> > > > > Regards,
> > > > > Adrian
> > > > >=20
> > > > > On Thu, 2016-01-21 at 12:21 +0300, Li Xin wrote:
> > > > > > WARNING: QA Issue: networkmanager rdepends on libnewt, but it i=
sn't a
> > > > > build dependency? [build-deps]
> > > > > >=20
> > > > > > Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> > > > > > ---
> > > > > > =A0meta-oe/recipes-connectivity/networkmanager/networkmanager_1=
=2E0.6.bb |
> > > > > 1 +
> > > > > > =A01 file changed, 1 insertion(+)
> > > > > >=20
> > > > > > diff --git a/meta-oe/recipes-connectivity/networkmanager/
> > > > > networkmanager_1.0.6.bb b/meta-oe/recipes-
> > > > > > connectivity/networkmanager/networkmanager_1.0.6.bb
> > > > > > index 1ddb66f..72b4e46 100644
> > > > > > --- a/meta-oe/recipes-connectivity/networkmanager/
> > > > > networkmanager_1.0.6.bb
> > > > > > +++ b/meta-oe/recipes-connectivity/networkmanager/
> > > > > networkmanager_1.0.6.bb
> > > > > > @@ -56,6 +56,7 @@ PACKAGECONFIG[wifi] =3D
> > > > > "--enable-wifi=3Dyes,--enable-wifi=3Dno,wireless-tools,wpa-sup
> > > > > > =A0PACKAGECONFIG[ifupdown] =3D "--enable-ifupdown,--disable-ifu=
pdown"
> > > > > > =A0PACKAGECONFIG[netconfig] =3D "--with-netconfig=3Dyes,--with-=
netconfig=3Dno"
> > > > > > =A0PACKAGECONFIG[qt4-x11-free] =3D "--enable-qt,--disable-qt,qt=
4-x11-free"
> > > > > > +PACKAGECONFIG[libnewt] =3D "--with-nmtui=3Dyes,--with-nmtui=3D=
no,libnewt"
> > > > > >=20
> > > > > > =A0PACKAGES =3D+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests
> > > > > ${PN}-bash-completion \
> > > > > > =A0=A0=A0${PN}-nmtui ${PN}-nmtui-doc \
> > > > > > --
> > > > > > 1.8.4.2
> > > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-devel mailing list
> > > > > Openembedded-devel@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > > >=20
> >=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaiZtQACgkQN1Ujt2V2gBzW6gCdEhjslyFvC+GDW4cStu62KN01
RewAn3I3LDXEYrBkPW6f0Mtq64jBRIoY
=y+yg
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--
