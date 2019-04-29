Return-Path: <trini@konsulko.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1D23F7D691
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 11:16:43 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 4so13501828wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 04:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=4GvG5hrDepII6XIiX7fRYP6ofVcJr/5JPKswULpvtDA=;
	b=dkRSh204tJ0oWAVKfo95ha3QoisrBvPK7umnHLzTzTZIco30EH45Y5dCili8hS5V45
	+jKA5A/UpLIUzqSv7KYo2mjFxJg+6+oq/JEE1EjPHfOE8DHZ7AXpqZQFEZGon3fDwMXa
	3dVbXFHWPJJy19OZOp82nyKhmyuGMhlMgCezY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4GvG5hrDepII6XIiX7fRYP6ofVcJr/5JPKswULpvtDA=;
	b=czRU3UDvugt66Yzp9ywT5NxexgdQUFDyl+MtSGyZsQjSY7ybFYu/woct/dPwjCl5pE
	opqMarL8QGNBJ3GYhxff+Tn7j/vbQMEgoI5+1A54HyDqKYuKkntQckdf7i3etumFs7i5
	KWkAjjHJM2u/j6q8VBEi1L5DzOkw2l4j9ApkAA1mOlwrbG4AaHRIt9QrFofDPOiKXpN3
	/9nEAKBZOa5BId3rUfvQLw7IjJrZqX59pH2oiAtjZou2yhzuddkq5r6A0r2hVc/HTMvR
	P3ZpvWDifDJMiweIfTJBycsod5C2X9vfTllCLxcChvnVFqCMYltFOM+B0AQCIdciNOd1
	DsoQ==
X-Gm-Message-State: APjAAAUNlk0poiNsUdRZEF5O7qt1/UNyTmKqsRU7hp36BXYOLS+6RY6X
	iAlGWb4D1mJOYSSozlC83jVmkg==
X-Google-Smtp-Source: APXvYqwFyMfKf6jiFwfvl4Th9inzZVF/PS0sr2XtAh/7VH3oFksqZZ8vvgxI7MPcahBkEjWpeyHmwQ==
X-Received: by 2002:a1c:495:: with SMTP id 143mr8969426wme.109.1556536604715; 
	Mon, 29 Apr 2019 04:16:44 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147]) by smtp.gmail.com with ESMTPSA id
	s3sm30154059wre.97.2019.04.29.04.16.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Apr 2019 04:16:43 -0700 (PDT)
Date: Mon, 29 Apr 2019 07:16:39 -0400
From: Tom Rini <trini@konsulko.com>
To: Ben <beniaminsandu@gmail.com>
Message-ID: <20190429111639.GI31207@bill-the-cat>
References: <20190427213551.14485-1-beniamin.sandu@gmail.com>
	<20190429005330.GH31207@bill-the-cat>
	<54b42f72-dba5-4c7e-7ff5-802e03285cd0@gmail.com>
MIME-Version: 1.0
In-Reply-To: <54b42f72-dba5-4c7e-7ff5-802e03285cd0@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org,
	Beniamin Sandu <beniamin.sandu@gmail.com>
Subject: Re: [meta-networking][PATCH] unbound: create recipe for version 1.9.1
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
X-List-Received-Date: Mon, 29 Apr 2019 11:16:44 -0000
X-Groupsio-MsgNum: 77328
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="51XTLtQdcc2Fpwjz"
Content-Disposition: inline

--51XTLtQdcc2Fpwjz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2019 at 02:09:08PM +0300, Ben wrote:
> On 4/29/19 3:53 AM, Tom Rini wrote:
> >On Sun, Apr 28, 2019 at 12:35:51AM +0300, Beniamin Sandu wrote:
> >
> >>Signed-off-by: Beniamin Sandu <beniamin.sandu@gmail.com>
> >>---
> >>  .../recipes-support/unbound/unbound_1.9.1.bb  | 36 +++++++++++++++++++
> >>  1 file changed, 36 insertions(+)
> >>  create mode 100644 meta-networking/recipes-support/unbound/unbound_1.=
9.1.bb
> >>
> >>diff --git a/meta-networking/recipes-support/unbound/unbound_1.9.1.bb b=
/meta-networking/recipes-support/unbound/unbound_1.9.1.bb
> >>new file mode 100644
> >>index 000000000..84bbe6581
> >>--- /dev/null
> >>+++ b/meta-networking/recipes-support/unbound/unbound_1.9.1.bb
> >>@@ -0,0 +1,36 @@
> >>+SUMMARY =3D "Unbound is a validating, recursive, and caching DNS resol=
ver"
> >>+DESCRIPTION =3D "Unbound's design is a set of modular components which=
 incorporate \
> >>+	features including enhanced security (DNSSEC) validation, Internet Pr=
otocol \
> >>+	Version 6 (IPv6), and a client resolver library API as an integral pa=
rt of the \
> >>+	architecture"
> >>+
> >>+HOMEPAGE =3D "https://www.unbound.net/"
> >>+SECTION =3D "net"
> >>+LICENSE =3D "BSD-3-Clause"
> >>+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5308494bc0590c0cb036afd781d=
78f06"
> >>+
> >>+SRC_URI =3D "git://github.com/NLnetLabs/unbound.git;protocol=3Dhttp;br=
anch=3Dmaster"
> >>+SRCREV=3D"16cc196bf28aec604ed2dae2b5af2ed82c8a58d6"
> >>+
> >>+inherit autotools pkgconfig systemd
> >>+
> >>+DEPENDS =3D "openssl libevent libtool-native bison-native expat"
> >>+RDEPENDS_${PN} =3D "bash openssl-bin"
> >>+
> >>+S =3D "${WORKDIR}/git"
> >>+
> >>+EXTRA_OECONF =3D "libtool=3D${TARGET_PREFIX}libtool \
> >>+		--with-ssl=3D${STAGING_EXECPREFIXDIR}"
> >>+
> >>+PACKAGECONFIG =3D "${@bb.utils.contains('DISTRO_FEATURES','systemd','s=
ystemd','',d)}"
> >>+PACKAGECONFIG[systemd] =3D "--enable-systemd,,systemd"
> >You should probably add:
> >PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'largefile sy=
stemd', d)}"
> >PACKAGECONFIG[dnscrypt] =3D "--enable-dnscrypt, --disable-dnscrypt, libs=
odium"
> >PACKAGECONFIG[largefile] =3D "--enable-largefile,--disable-largefile,,"
> >PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,systemd"
>=20
> Thanks, I will add those. I've only used unbound a bit and thought about
> sending a patch with a recipe for it since I noticed there is none, but I
> didn't look into many configuration options.

And thanks for your contribution!  I only kinda stumbled on those others
being possible myself.

> >>+do_install_append() {
> >>+	# systemd support
> >>+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)=
}; then
> >>+		install -d ${D}${systemd_unitdir}/system/
> >>+		install -m 0644 ${B}/contrib/${BPN}.service ${D}${systemd_unitdir}/s=
ystem/${BPN}.service
> >>+	fi
> >>+}
> >>+
> >>+SYSTEMD_SERVICE_${PN} =3D "${BPN}.service"
> >Then you're missing the sysvinit script too?  You can just do:
> >do_install_append() {
> >     install -d ${D}${systemd_unitdir}/system
> >     install -m 0644 ${B}/contrib/unbound.service ${D}${systemd_unitdir}=
/system
> >
> >     install -d ${D}${sysconfdir}/init.d
> >     install -m 0755 ${S}/contrib/unbound.init ${D}${sysconfdir}/init.d/=
unbound
> >}
> >
> >And the right things are packaged or not.
> Wouldn't be better to install these files under an if where we check
> DISTRO_FEATURES for systemd/sysvinit like in my initial patch?

No, that just adds more complexity to the recipe that we don't need to
have.  Oh, and since we're adding the sysvinit script too you need
to inherit update-rc.d and add some appropriate lines too so it's
installed right.  The current best practice, iirc, is to do both if we
can do both and then we have the right logic elsewhere to not do
sysvinit stuff on systemd and vice-versa.

--=20
Tom

--51XTLtQdcc2Fpwjz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcxt0XAAoJEIf59jXTHXZSQMoP/RB/IcJoiVY9bDfcd5QfGlbK
K1DLGFEmR8nm7DkEsBjc0DeHGX8LugLkBWhZR2LCtNJVkpf2cPJoVS5SxuNC6W+g
D4EjBRFwoViFZXatO87DrPbTGKg8x+HqDz1VT49TwfY5Q2cxt+ogu7FieeFKSNcR
wRfw994OJMaggwjugxGKaUbGDUhe73Z/xKEO4UxhHP5/tR/MvR960geXEuct46b4
EgwzSZvXayMOwLiZaRsNJvNqY0AssP5Sup6ILQAfOZiXi8bUo3MmV8Pe5hsONEUf
CNOj5wVpIBM5RdUjHT8vVxnCVZ6egeys1Xsf/m9mNsN1eY3UQqpwoq/Ddq4qO+5u
f28Aoo/3BiNaRWl8g2bNExX4saLqvig0G+oSoG5425Bhy5Gd6TMNZF/vkoluaudY
f/lM/wfR429FBPGE+LuFX+xQv9PpcSGmHKWU1Vgxc3glrDlC94qskfc3Rua6wCYd
lM0xZlUGH3MXLKyw+NDp5Agk9m2GnQVa/rpq4NnIlFsMri6a/zRsBcIMPI9o07GA
iCx50cCkf6QPknLSCIZ7ouz/Rvxy7BCYMPu9OTI6f6+jL+bUz1ufa2XTM+ZQfuC4
9XCIFx+A5l6u1eZuHbQ2JdRiWRNHyTzqBSJmgQS5yHE88KP79pBoF33RZHr3RTTr
y0DTnv93swzBBG5a55lS
=jNwX
-----END PGP SIGNATURE-----

--51XTLtQdcc2Fpwjz--
