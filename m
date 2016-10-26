Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id BFED760777
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Oct 2016 08:33:16 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id b80so211057369wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Oct 2016 01:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=vuEwDCh1u4zcbN2TchrbmP+TbUAfQLBeCcsoKFfRF2Y=;
	b=bF6a0WCVKgo/q/VlBk0jr9zBumSDXjJh8YnD6t/Z/Q5qoB8F1k9chGXJsCjWbEtmrv
	/S7tVaa7vKTvmsLqRC6hbd8NjWk5TdKHkPl9P7X2brhhxB4Vbh3/zd2K9ZBNgbAmAtfT
	NrdHxeHjNyN1sQdpQMvh1r7wnaBXtgfDYYgSiWX8zCTSuQZ4VMwS+jVt0ldXcSvbv3Mm
	zDmwtcMnAb067CwuAqzefLDc6lU8thuzZto5ErLkwiFG0ytNlDxLlr77z4BsmjZm1R52
	HY7AITEdJ7B8ISM31t7QBzw7yb4Sg5SQBYX/Ufo1tnt5poGO+pJiW3edAJYkUA3q3p4G
	oaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=vuEwDCh1u4zcbN2TchrbmP+TbUAfQLBeCcsoKFfRF2Y=;
	b=bC/HYkpir3iROXM9rHMvPPUSueVpXWdpbQb8acb/cn1ZAHHgyowEwYBnVJ1+F3y0wr
	+N+uJlUa32mw0ejx8Pk/oivU/7bwUhkEGlrVyMQwBN7fXJPEZZPsqUrfeXvgD8r57w36
	VgnjBqIdNNoCJxTEixK9l/3pvaxCfpJFGBN3lDlKK5Fu/RBfY2wYMCezdAOQsxecyfn/
	wmg+s1AZPUlksS9GgEJxfql8pmkaeei9Maeu9Pdl8nv/sY7h00ybT4z5uKvx8Tr03j10
	wdmNw9dtTJIh7gXFW/tP3bQ/WmFXOIvIGsojOPpG44vIOEH+bNhu5ItlKzTelZJSqtc+
	cmUg==
X-Gm-Message-State: ABUngve3SFhqVtmhjBFeHauURG9nLerCheqtlRwV8N1r99nWoQP32APpeUTnjbNYp/DOBQ==
X-Received: by 10.194.201.103 with SMTP id jz7mr1213319wjc.70.1477470796124;
	Wed, 26 Oct 2016 01:33:16 -0700 (PDT)
Received: from localhost (ip-89-176-50-133.net.upcbroadband.cz.
	[89.176.50.133])
	by smtp.gmail.com with ESMTPSA id m5sm1714582wmd.17.2016.10.26.01.33.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 26 Oct 2016 01:33:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 26 Oct 2016 10:33:16 +0200
To: akuster808 <akuster808@gmail.com>
Message-ID: <20161026083316.GB4096@jama>
References: <9278bc38-73d6-8593-aee4-ee981eb62b7c@windriver.com>
	<1960865a-ab12-9dd5-84ff-5dfac53fd36a@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1960865a-ab12-9dd5-84ff-5dfac53fd36a@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: OE plans for morty
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
X-List-Received-Date: Wed, 26 Oct 2016 08:33:18 -0000
X-Groupsio-MsgNum: 63611
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Content-Disposition: inline

--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 24, 2016 at 07:07:55PM -0700, akuster808 wrote:
> Randy,
>=20
>=20
> On 10/24/2016 05:51 PM, Randy MacLeod wrote:
> >
> >
> > I saw that morty has been branched and there have been 38 commits
> > made to master.  Woo-hoo and thanks Martin!
>=20
>=20
> >
> > Armin,
> >
> > Many of the master commits sh/could be cherry-picked back
> > to morty since they are bug fixes rather than package uprevs.
> > I have a list of commits to cherry-pick below. '?' indicates
> > that I'm not sure from the oneline summary if it's just a bug
> > fix as you might expect.
>=20
> Thanks for providing commit ids you are interested in.
>=20
> I have pushed the contrib morty-next  this morning.
>=20
> http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=3Dakuster/m=
orty-next

What about using current master (I've pushed bunch of commits today) +
hopefully following in meta-networking which should be pushed by Joe
(currently waiting in master-next):

pick 2c1d637 linux-atm: fix do_compile error
pick bfb71d5 lowpan-tools: Fix errors found with clang
pick 944cd7a openl2tp: Fix build with clang
pick 9641512 libmnl, nftables: Update versions
pick 8303d85 c-ares: update 1.11.0 -> 1.12.0
pick 36c563d c-ares: fix metadata
pick 7552201 lksctp-tools: 1.0.16 -> 1.0.17
pick a0fcdac drbd-utils: 8.9.3 -> 8.9.6

This gives us almost clean bitbake world status I've sent few minutes
ago.

I haven't merged the README update to morty yet, so we can do this sync
with master as fast forward (and continue to do so until there is fist
master-only change merged in master).

Regards,

> > Are you going to do a dot release in the coming weeks or will
> > it be more like early next year?
>=20
> I am hoping to do a pull request request shortly after morty is=20
> announced by Richard.
>=20
> Some of the commits listed below are in master-next so I need to wait=20
> for them to hit master before I  cherry-pick any additional changes.
>=20
> Hope this is a satisfactory plan.
>=20
>=20
> regards,
> Armin
>=20
> >
> > ../Randy
> >
> > ec0fb46 openldap: use recommended backend mdb
> >
> > ? 64ebc30 android-tools: fix native build
> > d2902a3 dhcp_%.bbappend: fix replaces original key warning
> >
> > ? 965d028 python-unidiff: python module for parsing diff data
> >
> > ? 1be8a35 joe: Fix build with clang
> > ? 2084473 openl2tp: Fix build with clang
> > ? 0004410 flashrom: Fix build with clang and aarch64
> > ? 83fec86 gpm: Remove nested functions
> > ? 9446302 lowpan-tools: Fix errors found with clang
> >
> > ? 5e0dc68 python-greenlet: Rename register from rX to xX for aarch64
> > ? d8e9117 frame: Fix build with clang
> > ? 612b2bb libplist: Squash warnings found by clang
> > ? 2951547 libmbim: Fix build with clang
> > ? c04bdbe libbonobo: Fix missing dep on orbit2-native and build with=20
> > clang
> >
> > 6b3e9ff linux-atm: fix do_compile error
> >
> > ? 9a83c34 adduser: always add -M option for useradd
> >
> > ? da12104 v4l-utils: add support for "native" build
> >
> >
> > cfe1fba postgresql.inc: Fix do_configure error (could not find Python.h)
> >
> >
> > ? 8ba31c9 gpsd, mongodb: use PACKAGECONFIG_CONFARGS instead of now=20
> > empty EXTRA_OECONF
> > ? f882db6 ipmiutil: uncomment PARALLEL_MAKE
> >
> > ? 54c7e78 pcsc-lite: Seperate GPLV3 portions from BSD
> > fded4cf opencv: fix packaging and install
> >
> >
> > 1c072cb gvfs: fix fetch error
> > ? 0cc3d06 leptonica: add PACKAGECONFIG for giflib
> > ? 8eef5ab wireshark: update to 2.2.1
> >
> > ? 812e940 ntp : Add openssl to default PACKAGECONFIG options
> > ? 8760099 atftp: fixes musl libc build
> > ? 5abe6ea arptables: add the directory for default=20
> > /etc/sysconfig/arptables
> > ? a0e2240 arptables: add arptables systemd service file
> > 93b0d65 iscsitarget: resolve build error with linux kernel 4.8
> > 9e8d127 squid: fix ptest failure
> > 6f54f29 squid: specify sysconfdir and logdir
> > 307d1c9 libtdb: fixes for deterministic builds
> > 5175c03 libldb: fixes for deterministic builds
> > 5291715 libtevent: fixes for deterministic builds
> > 778a2b6 libtalloc: fixes for deterministic builds
> > fe652f8 libldb: fix for LIC_FILES_CHKSUM
> > f25aa3d libtdb: fix for LIC_FILES_CHKSUM
> > d4a36f6 libtevent: fix for LIC_FILES_CHKSUM
> > 0014397 libtalloc: fix for LIC_FILES_CHKSUM
> >
> > a95726d samba: replace pam packageconfig by hard dependency
> > 3fdfdd8 samba: un-blacklist
> >
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlgQaksACgkQN1Ujt2V2gBzDngCfYjC5ipX46TafNFotDqBEKGLv
zOAAn3t3ZBNJVx1+UFnxuG/9pb+/40uD
=5/0H
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
