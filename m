Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 95CE26059F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2016 11:34:45 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u144so14456432wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2016 03:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=RH2ItUhdhQXsLZyQDHLO917IqagIqYkt3sFIYVPW6oQ=;
	b=aUCBVMmolqjZdqlEZbTsBtIMMKFi2khmaTkhj5VTT6hWhWJzrPy/OiB/03+Y9x6xvp
	Ntc/jHjm2Xf+/dg8ajeEXtSS2HCnWHNudcB1q1h9wH7W0ZSxCrwsc/+FOYnVkSS7r2vO
	O1vWtCCqQKGGto4kn6FVzy1p/NH3/JuSwwIdjv+cTcxoqTXhhNPZ81zI3bRkGViBw9gX
	BjLWLNFc9FSynWNMCj7Sn3e2kr7Vpr2D6eWf++R02mJhlIWcsTQxEofrI5QMXNuOZxgj
	zj+YD5wIUJZYbVqrlPP4H/pcdj6MtPCYX0rcBL2832gbPw5ZhUO9QyLuUEC95163ySk6
	ZijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=RH2ItUhdhQXsLZyQDHLO917IqagIqYkt3sFIYVPW6oQ=;
	b=Yq86RncP0QrlpFNsTRkNB4+Wmob2RU+AP/9ngCYsJJ3/3jZOUe1cB/wajLnBbWKpLn
	wih3a9NLypmXKlceK1/I0l+tEMAhmk+ytSRfRWdu0kDMAv9wUDkz6QnTby8+gNMQ366d
	cHLC6lSZPK4jzJwJY8ayIifUOHPCfCkfDlVRGFa+SzaFTExEVzcpVqvaSPHi3g6uQVQi
	LovJbJDXvxJFZCvqg58j7WpZjfEclXgHe7aaMDIVB3l8dOEaprIUkP5hTy6K8NLknvgW
	jVdMLLLGaTxrMq/Cw1jXlyX9kaxFJKFK+XIhT2vyXe3qvCEKppUqtpJLQL+yeRYt32BD
	pVlg==
X-Gm-Message-State: ABUngvfRpMEgZ5c3/JurS5zjiqp54ZTmvnu+nGN4BkPbb+uqdxoMUK6YrH8vTm3gxsOriQ==
X-Received: by 10.28.161.129 with SMTP id k123mr10790009wme.66.1479123286100; 
	Mon, 14 Nov 2016 03:34:46 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	i15sm28169641wjs.16.2016.11.14.03.34.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 14 Nov 2016 03:34:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 14 Nov 2016 12:34:45 +0100
To: akuster808 <akuster808@gmail.com>, Joe MacDonald <Joe_MacDonald@mentor.com>
Message-ID: <20161114113445.GA2914@jama>
References: <9278bc38-73d6-8593-aee4-ee981eb62b7c@windriver.com>
	<1960865a-ab12-9dd5-84ff-5dfac53fd36a@gmail.com>
	<20161026083316.GB4096@jama>
MIME-Version: 1.0
In-Reply-To: <20161026083316.GB4096@jama>
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
X-List-Received-Date: Mon, 14 Nov 2016 11:34:46 -0000
X-Groupsio-MsgNum: 63811
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline

--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 26, 2016 at 10:33:16AM +0200, Martin Jansa wrote:
> On Mon, Oct 24, 2016 at 07:07:55PM -0700, akuster808 wrote:
> > Randy,
> >=20
> >=20
> > On 10/24/2016 05:51 PM, Randy MacLeod wrote:
> > >
> > >
> > > I saw that morty has been branched and there have been 38 commits
> > > made to master.  Woo-hoo and thanks Martin!
> >=20
> >=20
> > >
> > > Armin,
> > >
> > > Many of the master commits sh/could be cherry-picked back
> > > to morty since they are bug fixes rather than package uprevs.
> > > I have a list of commits to cherry-pick below. '?' indicates
> > > that I'm not sure from the oneline summary if it's just a bug
> > > fix as you might expect.
> >=20
> > Thanks for providing commit ids you are interested in.
> >=20
> > I have pushed the contrib morty-next  this morning.
> >=20
> > http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=3Dakuster=
/morty-next
>=20
> What about using current master (I've pushed bunch of commits today) +
> hopefully following in meta-networking which should be pushed by Joe
> (currently waiting in master-next):
>=20
> pick 2c1d637 linux-atm: fix do_compile error
> pick bfb71d5 lowpan-tools: Fix errors found with clang
> pick 944cd7a openl2tp: Fix build with clang
> pick 9641512 libmnl, nftables: Update versions
> pick 8303d85 c-ares: update 1.11.0 -> 1.12.0
> pick 36c563d c-ares: fix metadata
> pick 7552201 lksctp-tools: 1.0.16 -> 1.0.17
> pick a0fcdac drbd-utils: 8.9.3 -> 8.9.6
>=20
> This gives us almost clean bitbake world status I've sent few minutes
> ago.
>=20
> I haven't merged the README update to morty yet, so we can do this sync
> with master as fast forward (and continue to do so until there is fist
> master-only change merged in master).

Joe: when are you planing to merge next batch of meta-networking
changes? At least the list mentioned above? I'm still waiting with final
morty branch update before merging first master-only changes.

Regards,

> Regards,
>=20
> > > Are you going to do a dot release in the coming weeks or will
> > > it be more like early next year?
> >=20
> > I am hoping to do a pull request request shortly after morty is=20
> > announced by Richard.
> >=20
> > Some of the commits listed below are in master-next so I need to wait=
=20
> > for them to hit master before I  cherry-pick any additional changes.
> >=20
> > Hope this is a satisfactory plan.
> >=20
> >=20
> > regards,
> > Armin
> >=20
> > >
> > > ../Randy
> > >
> > > ec0fb46 openldap: use recommended backend mdb
> > >
> > > ? 64ebc30 android-tools: fix native build
> > > d2902a3 dhcp_%.bbappend: fix replaces original key warning
> > >
> > > ? 965d028 python-unidiff: python module for parsing diff data
> > >
> > > ? 1be8a35 joe: Fix build with clang
> > > ? 2084473 openl2tp: Fix build with clang
> > > ? 0004410 flashrom: Fix build with clang and aarch64
> > > ? 83fec86 gpm: Remove nested functions
> > > ? 9446302 lowpan-tools: Fix errors found with clang
> > >
> > > ? 5e0dc68 python-greenlet: Rename register from rX to xX for aarch64
> > > ? d8e9117 frame: Fix build with clang
> > > ? 612b2bb libplist: Squash warnings found by clang
> > > ? 2951547 libmbim: Fix build with clang
> > > ? c04bdbe libbonobo: Fix missing dep on orbit2-native and build with=
=20
> > > clang
> > >
> > > 6b3e9ff linux-atm: fix do_compile error
> > >
> > > ? 9a83c34 adduser: always add -M option for useradd
> > >
> > > ? da12104 v4l-utils: add support for "native" build
> > >
> > >
> > > cfe1fba postgresql.inc: Fix do_configure error (could not find Python=
=2Eh)
> > >
> > >
> > > ? 8ba31c9 gpsd, mongodb: use PACKAGECONFIG_CONFARGS instead of now=20
> > > empty EXTRA_OECONF
> > > ? f882db6 ipmiutil: uncomment PARALLEL_MAKE
> > >
> > > ? 54c7e78 pcsc-lite: Seperate GPLV3 portions from BSD
> > > fded4cf opencv: fix packaging and install
> > >
> > >
> > > 1c072cb gvfs: fix fetch error
> > > ? 0cc3d06 leptonica: add PACKAGECONFIG for giflib
> > > ? 8eef5ab wireshark: update to 2.2.1
> > >
> > > ? 812e940 ntp : Add openssl to default PACKAGECONFIG options
> > > ? 8760099 atftp: fixes musl libc build
> > > ? 5abe6ea arptables: add the directory for default=20
> > > /etc/sysconfig/arptables
> > > ? a0e2240 arptables: add arptables systemd service file
> > > 93b0d65 iscsitarget: resolve build error with linux kernel 4.8
> > > 9e8d127 squid: fix ptest failure
> > > 6f54f29 squid: specify sysconfdir and logdir
> > > 307d1c9 libtdb: fixes for deterministic builds
> > > 5175c03 libldb: fixes for deterministic builds
> > > 5291715 libtevent: fixes for deterministic builds
> > > 778a2b6 libtalloc: fixes for deterministic builds
> > > fe652f8 libldb: fix for LIC_FILES_CHKSUM
> > > f25aa3d libtdb: fix for LIC_FILES_CHKSUM
> > > d4a36f6 libtevent: fix for LIC_FILES_CHKSUM
> > > 0014397 libtalloc: fix for LIC_FILES_CHKSUM
> > >
> > > a95726d samba: replace pam packageconfig by hard dependency
> > > 3fdfdd8 samba: un-blacklist
> > >
> >=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlgpoVQACgkQN1Ujt2V2gByfYACfeV/jug22vm1g13tQQ3KJFBOc
0ccAniZBrA+t6nuk7plXNx6rXtK+xUzb
=x0ae
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
