Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id A42B061222
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2013 06:58:17 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d41so3250672eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2013 23:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mnUX034KskH7/ALQrgeX5PIGuOLZsXBIsIp452KUJVE=;
	b=ALhopKDC4zSk9xuc9M/ja9kK2ugFJGB1cpgYHmsrEx8vkHHnglG9rVnbdig29E074h
	q2Gpl0x4AdcHaNFTEDKWANEz5iDfXUiwyf6NNzUmiAsoZQwSwFqkYrkyf8rigSVWU9Tw
	Fy3Caka9WVgA5hINyVvWue4qs3G2hfqczYc3OW/6QPeZsE3/WOpGjyHqF7Ja54653SzH
	GqUPoAM6L01P21ZVv5z35BOVF+QvQIo/2Rxdkfzgn3N8Yyxz/Trekqf1jeI4GUj3iS6+
	PBxJyyUIhkJ9T5RplnweAP0AEr3t1hNs+CSLMS3LCZhJQt8p0Fmykae2IYr+Eke89r/a
	vftQ==
X-Received: by 10.15.63.142 with SMTP id m14mr24029224eex.106.1376290697190;
	Sun, 11 Aug 2013 23:58:17 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m54sm54814442eex.2.2013.08.11.23.58.16 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 11 Aug 2013 23:58:16 -0700 (PDT)
Date: Mon, 12 Aug 2013 08:59:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130812065905.GH17945@jama>
References: <1376187025-22368-1-git-send-email-mark.asselstine@windriver.com>
	<8194550.0BPKn9U7hO@helios>
MIME-Version: 1.0
In-Reply-To: <8194550.0BPKn9U7hO@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Mark Asselstine <mark.asselstine@windriver.com>,
	joe.macdonald@windriver.com
Subject: Re: [meta-networking][PATCH] dnsmasq: don't expect systemd support to be set
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
X-List-Received-Date: Mon, 12 Aug 2013 06:58:18 -0000
X-Groupsio-MsgNum: 45639
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WIIRZ1HQ6FgrlPgb"
Content-Disposition: inline

--WIIRZ1HQ6FgrlPgb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2013 at 09:41:32PM +0100, Paul Eggleton wrote:
> Hi Mark,
>=20
> On Saturday 10 August 2013 22:10:25 Mark Asselstine wrote:
> > If you don't have 'systemd' set in your DISTRO_FEATURES 'dnsmasq' will
> > fail to package due to a QA error;
> >=20
> > ERROR: QA Issue: dnsmasq: Files/directories were installed but not ship=
ped
> >   /lib
> >=20
> > Check for systemd in DISTRO_FEATURES before performing installation
> > instructions related to systemd.
> >=20
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> >  meta-networking/recipes-support/dnsmasq/dnsmasq.inc | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc index
> > 0f5b273..b9e7ff6 100644
> > --- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > @@ -31,8 +31,10 @@ do_install () {
> >      install -m 644 ${WORKDIR}/dnsmasq.conf ${D}${sysconfdir}/
> >      install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
> >=20
> > -    install -d ${D}${systemd_unitdir}/system
> > -    install -m 0644 ${WORKDIR}/dnsmasq.service
> > ${D}${systemd_unitdir}/system +    if ${@base_contains('DISTRO_FEATURES=
',
> > 'systemd', 'true', 'false', d)}; then +        install -d
> > ${D}${systemd_unitdir}/system
> > +        install -m 0644 ${WORKDIR}/dnsmasq.service
> > ${D}${systemd_unitdir}/system +    fi
> >=20
> >      if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" !=
=3D ""
> > ]; then install -d ${D}${sysconfdir}/dbus-1/system.d
>=20
> There's already a global fix for this in OE-Core:
>=20
> http://cgit.openembedded.org/openembedded-core/commit/meta/classes/system=
d.bbclass?id=3Dac5d20f4adac69ea1702694fb50849c9e465b443

I wanted to reply the same, but it doesn't fix empty /lib after
/lib/systemd is removed.

We should add this:
rmdir --ignore-fail-on-non-empty ${D}/lib

into that global fix to cover also this case.

(I'm intentionally not using base_libdir, because systemd_unitdir is
also defined as bitbake.conf:export systemd_unitdir =3D "/lib/systemd")

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WIIRZ1HQ6FgrlPgb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlIIh7kACgkQN1Ujt2V2gBzeCACfec2xOp1PZ3mn/uVDmdQcb880
F6MAn0ejMeFzDEhLeaheco38/mrmY7/t
=XCHm
-----END PGP SIGNATURE-----

--WIIRZ1HQ6FgrlPgb--
