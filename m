Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id D69827710D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 11:00:41 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id o80so10528847wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 04:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=bENKmerYchBrijVZxpok5o1sdH3wdH/lZn2szHyFtdA=;
	b=fabxApB0ym2Cw0R4oB9PC3lVhRkX5JQuWE+qGgJ2+EPo+EbCxkh1T2mnhKMctc0MjE
	DNm0eGpM5So70G1dQPxy3kZjM+yRsSR/1/vSCahrb4XreoprCd6qk7v1KMYoueUKaV2N
	B3lrGz4Mi4z1zLoK7WKgHuijXEFh4ABNz0TvoKpW1hHyrfCt3t5lsAzdwwL/u9Gphfez
	Eaw25TXvyJjX5FYQRyGOv4m7SRB1seVT4cRTVOJ0sAPK+yFG8woNPQSo3f/U0giFJKsC
	RYh4+2m8TP1n16ICoAvSvG5D5s2wFyop3l/vm5rPKDytumUxrpf2P/edpxWEc4uTDvr5
	p+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=bENKmerYchBrijVZxpok5o1sdH3wdH/lZn2szHyFtdA=;
	b=fADfYdwYbDase67b9r3/l8kcDKCoTeF9Y5aSV33qJbBjBQtN2htppdCINsmdsZowa+
	WCuWDUxacOR1kU0JtxB4c0sOQj12P75AnhWuDU7nfe6x66Ww/esDgc4BaU5NZNx77lvu
	Omjyocoshev/33CrroZcLb3IYoEVbJkguPvSn1RQbJq2LxC5tNsxrKvTW2VX0s0hByvQ
	ObJvVcuTxgTPZdozBNfFdDlHHRXg4nkDgrjR/+6l6h2FeBKXoiq7c13rnxGhPuqkYn4r
	d/PhY3X9pvSdcQYR0dQE4NBxpyRbvlF9GxOlPuoxwk16YHCjvDS0qsrz0B+ekbcINzPd
	Nx+g==
X-Gm-Message-State: AEkoouuCjtud1/ok3LRwaLrZba33piKuhh6mxDfd3/NOmmcNWXXDaWqiwh0/Wzvla5dnFA==
X-Received: by 10.28.139.144 with SMTP id n138mr14675334wmd.71.1471258841577; 
	Mon, 15 Aug 2016 04:00:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id 3sm16004949wms.1.2016.08.15.04.00.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Aug 2016 04:00:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 15 Aug 2016 13:00:43 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160815110043.zvmxqvygx7c5ug3d@jama>
References: <1470924479-18304-1-git-send-email-terry.boese@vecima.com>
	<20160812120821.benxeb6zhtyiyiom@jama>
MIME-Version: 1.0
In-Reply-To: <20160812120821.benxeb6zhtyiyiom@jama>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-networking][PATCH v2] dnsmasq: update to version 2.76
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
X-List-Received-Date: Mon, 15 Aug 2016 11:00:42 -0000
X-Groupsio-MsgNum: 62631
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xytddwz64u2raghd"
Content-Disposition: inline

--xytddwz64u2raghd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 12, 2016 at 02:08:21PM +0200, Martin Jansa wrote:
> On Thu, Aug 11, 2016 at 08:07:59AM -0600, Terry Boese wrote:
> > Change 'basecontains' to 'bb.utils.contain' to avoid warning.
>=20
> That was already changed 4 months ago, please rebase and test in recent
> master before sending.

And it also fails to install:
http://errors.yoctoproject.org/Errors/Details/75460/

> > Correct do_compile_append(), as the location of the DHCP lease
> > tools has changed.
> >=20
> > Signed-off-by: Terry Boese <terry.boese@vecima.com>
> > ---
> >  meta-networking/recipes-support/dnsmasq/dnsmasq.inc    | 18 +++++++++-=
--------
> >  .../dnsmasq/{dnsmasq_2.75.bb =3D> dnsmasq_2.76.bb}       |  5 ++---
> >  2 files changed, 11 insertions(+), 12 deletions(-)
> >  rename meta-networking/recipes-support/dnsmasq/{dnsmasq_2.75.bb =3D> d=
nsmasq_2.76.bb} (27%)
> >=20
> > diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta=
-networking/recipes-support/dnsmasq/dnsmasq.inc
> > index cc7f9e3..9ef54fe 100644
> > --- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > @@ -26,10 +26,10 @@ PACKAGECONFIG[conntrack] =3D ",,libnetfilter-conntr=
ack"
> >  PACKAGECONFIG[lua] =3D ",,lua"
> >  PACKAGECONFIG[resolvconf] =3D ",,,resolvconf"
> >  EXTRA_OEMAKE =3D "\
> > -    'COPTS=3D${@base_contains('PACKAGECONFIG', 'dbus', '-DHAVE_DBUS', =
'', d)} \
> > -           ${@base_contains('PACKAGECONFIG', 'idn', '-DHAVE_IDN', '', =
d)} \
> > -           ${@base_contains('PACKAGECONFIG', 'conntrack', '-DHAVE_CONN=
TRACK', '', d)} \
> > -           ${@base_contains('PACKAGECONFIG', 'lua', '-DHAVE_LUASCRIPT'=
, '', d)}' \
> > +    'COPTS=3D${@bb.utils.contains('PACKAGECONFIG', 'dbus', '-DHAVE_DBU=
S', '', d)} \
> > +           ${@bb.utils.contains('PACKAGECONFIG', 'idn', '-DHAVE_IDN', =
'', d)} \
> > +           ${@bb.utils.contains('PACKAGECONFIG', 'conntrack', '-DHAVE_=
CONNTRACK', '', d)} \
> > +           ${@bb.utils.contains('PACKAGECONFIG', 'lua', '-DHAVE_LUASCR=
IPT', '', d)}' \
> >      'CFLAGS=3D${CFLAGS}' \
> >      'LDFLAGS=3D${LDFLAGS}' \
> >  "
> > @@ -38,7 +38,7 @@ SRC_URI +=3D "${@bb.utils.contains('PACKAGECONFIG', '=
resolvconf', 'file://dnsmasq.
> > =20
> >  do_compile_append() {
> >      # build dhcp_release
> > -    cd ${S}/contrib/wrt
> > +    cd ${S}/contrib/lease-tools
> >      oe_runmake
> >  }
> > =20
> > @@ -53,19 +53,19 @@ do_install () {
> > =20
> >      install -d ${D}${systemd_unitdir}/system
> > =20
> > -    if [ "${@base_contains('PACKAGECONFIG', 'resolvconf', 'resolvconf'=
, '', d)}" !=3D "" ]; then
> > +    if [ "${@bb.utils.contains('PACKAGECONFIG', 'resolvconf', 'resolvc=
onf', '', d)}" !=3D "" ]; then
> >          install -m 0644 ${WORKDIR}/dnsmasq-resolvconf.service ${D}${sy=
stemd_unitdir}/system/dnsmasq.service
> >      else
> >          install -m 0644 ${WORKDIR}/dnsmasq-noresolvconf.service ${D}${=
systemd_unitdir}/system/dnsmasq.service
> >      fi
> > =20
> > -    install -m 0755 ${S}/contrib/wrt/dhcp_release ${D}${bindir}
> > +    install -m 0755 ${S}/contrib/lease-tools/dhcp_release ${D}${bindir}
> > =20
> > -    if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" !=
=3D "" ]; then
> > +    if [ "${@bb.utils.contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)=
}" !=3D "" ]; then
> >          install -d ${D}${sysconfdir}/dbus-1/system.d
> >          install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/syst=
em.d/
> >      fi
> > -    if [ "${@base_contains('PACKAGECONFIG', 'resolvconf', 'resolvconf'=
, '', d)}" !=3D "" ]; then
> > +    if [ "${@bb.utils.contains('PACKAGECONFIG', 'resolvconf', 'resolvc=
onf', '', d)}" !=3D "" ]; then
> >          install -d ${D}${sysconfdir}/resolvconf/update.d/
> >          install -m 0755 ${WORKDIR}/dnsmasq.resolvconf ${D}${sysconfdir=
}/resolvconf/update.d/dnsmasq
> > =20
> > diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.75.bb b/=
meta-networking/recipes-support/dnsmasq/dnsmasq_2.76.bb
> > similarity index 27%
> > rename from meta-networking/recipes-support/dnsmasq/dnsmasq_2.75.bb
> > rename to meta-networking/recipes-support/dnsmasq/dnsmasq_2.76.bb
> > index a11aabb..41573d9 100644
> > --- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.75.bb
> > +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.76.bb
> > @@ -4,6 +4,5 @@ SRC_URI +=3D "\
> >      file://lua.patch \
> >  "
> > =20
> > -SRC_URI[dnsmasq-2.75.md5sum] =3D "d99ac126d4fe910c679d88430559669b"
> > -SRC_URI[dnsmasq-2.75.sha256sum] =3D "f8252c0a0ba162c2cd45f81140c7c17cc=
40a5fca2b869d1a420835b74acad294"
> > -
> > +SRC_URI[dnsmasq-2.76.md5sum] =3D "6610f8233ca89b15a1bb47c788ffb84f"
> > +SRC_URI[dnsmasq-2.76.sha256sum] =3D "777c4762d2fee3738a0380401f2d087b4=
7faa41db2317c60660d69ad10a76c32"
> > --=20
> > 2.7.4
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xytddwz64u2raghd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlexoNoACgkQN1Ujt2V2gBw1RQCgnOYxWrLx15fGCb0tZG9SREB2
OSYAoLaZL5xq0W7PSJ5AlHEDW/5dN3zA
=nMKb
-----END PGP SIGNATURE-----

--xytddwz64u2raghd--
