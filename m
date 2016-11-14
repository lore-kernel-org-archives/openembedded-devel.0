Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 0BFC86FF72
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2016 13:49:48 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1c6Hdt-0005jP-Qc from Joe_MacDonald@mentor.com ;
	Mon, 14 Nov 2016 05:49:49 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 14 Nov 2016 05:49:49 -0800
Received: by burninator (Postfix, from userid 1000)	id 32C66580595; Mon, 14
	Nov 2016 08:49:48 -0500 (EST)
Date: Mon, 14 Nov 2016 08:49:48 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20161114134947.GA9012@mentor.com>
References: <9278bc38-73d6-8593-aee4-ee981eb62b7c@windriver.com>
	<1960865a-ab12-9dd5-84ff-5dfac53fd36a@gmail.com>
	<20161026083316.GB4096@jama> <20161114113445.GA2914@jama>
MIME-Version: 1.0
In-Reply-To: <20161114113445.GA2914@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Mon, 14 Nov 2016 13:49:50 -0000
X-Groupsio-MsgNum: 63814
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline

--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: OE plans for morty] On 16.11.14 (Mon 12:34) Martin Jansa wrote:

> On Wed, Oct 26, 2016 at 10:33:16AM +0200, Martin Jansa wrote:
> > On Mon, Oct 24, 2016 at 07:07:55PM -0700, akuster808 wrote:
> > > Randy,
> > >=20
> > >=20
> > > On 10/24/2016 05:51 PM, Randy MacLeod wrote:
> > > >
> > > >
> > > > I saw that morty has been branched and there have been 38 commits
> > > > made to master.  Woo-hoo and thanks Martin!
> > >=20
> > >=20
> > > >
> > > > Armin,
> > > >
> > > > Many of the master commits sh/could be cherry-picked back
> > > > to morty since they are bug fixes rather than package uprevs.
> > > > I have a list of commits to cherry-pick below. '?' indicates
> > > > that I'm not sure from the oneline summary if it's just a bug
> > > > fix as you might expect.
> > >=20
> > > Thanks for providing commit ids you are interested in.
> > >=20
> > > I have pushed the contrib morty-next  this morning.
> > >=20
> > > http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=3Dakust=
er/morty-next
> >=20
> > What about using current master (I've pushed bunch of commits today) +
> > hopefully following in meta-networking which should be pushed by Joe
> > (currently waiting in master-next):
> >=20
> > pick 2c1d637 linux-atm: fix do_compile error
> > pick bfb71d5 lowpan-tools: Fix errors found with clang
> > pick 944cd7a openl2tp: Fix build with clang
> > pick 9641512 libmnl, nftables: Update versions
> > pick 8303d85 c-ares: update 1.11.0 -> 1.12.0
> > pick 36c563d c-ares: fix metadata
> > pick 7552201 lksctp-tools: 1.0.16 -> 1.0.17
> > pick a0fcdac drbd-utils: 8.9.3 -> 8.9.6
> >=20
> > This gives us almost clean bitbake world status I've sent few minutes
> > ago.
> >=20
> > I haven't merged the README update to morty yet, so we can do this sync
> > with master as fast forward (and continue to do so until there is fist
> > master-only change merged in master).
>=20
> Joe: when are you planing to merge next batch of meta-networking
> changes? At least the list mentioned above? I'm still waiting with final
> morty branch update before merging first master-only changes.

I've been out for the last week and a bit, but I'll look at those this
morning and follow-up / merge as appropriate.

-J.

>=20
> Regards,
>=20
> > Regards,
> >=20
> > > > Are you going to do a dot release in the coming weeks or will
> > > > it be more like early next year?
> > >=20
> > > I am hoping to do a pull request request shortly after morty is=20
> > > announced by Richard.
> > >=20
> > > Some of the commits listed below are in master-next so I need to wait=
=20
> > > for them to hit master before I  cherry-pick any additional changes.
> > >=20
> > > Hope this is a satisfactory plan.
> > >=20
> > >=20
> > > regards,
> > > Armin
> > >=20
> > > >
> > > > ../Randy
> > > >
> > > > ec0fb46 openldap: use recommended backend mdb
> > > >
> > > > ? 64ebc30 android-tools: fix native build
> > > > d2902a3 dhcp_%.bbappend: fix replaces original key warning
> > > >
> > > > ? 965d028 python-unidiff: python module for parsing diff data
> > > >
> > > > ? 1be8a35 joe: Fix build with clang
> > > > ? 2084473 openl2tp: Fix build with clang
> > > > ? 0004410 flashrom: Fix build with clang and aarch64
> > > > ? 83fec86 gpm: Remove nested functions
> > > > ? 9446302 lowpan-tools: Fix errors found with clang
> > > >
> > > > ? 5e0dc68 python-greenlet: Rename register from rX to xX for aarch64
> > > > ? d8e9117 frame: Fix build with clang
> > > > ? 612b2bb libplist: Squash warnings found by clang
> > > > ? 2951547 libmbim: Fix build with clang
> > > > ? c04bdbe libbonobo: Fix missing dep on orbit2-native and build wit=
h=20
> > > > clang
> > > >
> > > > 6b3e9ff linux-atm: fix do_compile error
> > > >
> > > > ? 9a83c34 adduser: always add -M option for useradd
> > > >
> > > > ? da12104 v4l-utils: add support for "native" build
> > > >
> > > >
> > > > cfe1fba postgresql.inc: Fix do_configure error (could not find Pyth=
on.h)
> > > >
> > > >
> > > > ? 8ba31c9 gpsd, mongodb: use PACKAGECONFIG_CONFARGS instead of now=
=20
> > > > empty EXTRA_OECONF
> > > > ? f882db6 ipmiutil: uncomment PARALLEL_MAKE
> > > >
> > > > ? 54c7e78 pcsc-lite: Seperate GPLV3 portions from BSD
> > > > fded4cf opencv: fix packaging and install
> > > >
> > > >
> > > > 1c072cb gvfs: fix fetch error
> > > > ? 0cc3d06 leptonica: add PACKAGECONFIG for giflib
> > > > ? 8eef5ab wireshark: update to 2.2.1
> > > >
> > > > ? 812e940 ntp : Add openssl to default PACKAGECONFIG options
> > > > ? 8760099 atftp: fixes musl libc build
> > > > ? 5abe6ea arptables: add the directory for default=20
> > > > /etc/sysconfig/arptables
> > > > ? a0e2240 arptables: add arptables systemd service file
> > > > 93b0d65 iscsitarget: resolve build error with linux kernel 4.8
> > > > 9e8d127 squid: fix ptest failure
> > > > 6f54f29 squid: specify sysconfdir and logdir
> > > > 307d1c9 libtdb: fixes for deterministic builds
> > > > 5175c03 libldb: fixes for deterministic builds
> > > > 5291715 libtevent: fixes for deterministic builds
> > > > 778a2b6 libtalloc: fixes for deterministic builds
> > > > fe652f8 libldb: fix for LIC_FILES_CHKSUM
> > > > f25aa3d libtdb: fix for LIC_FILES_CHKSUM
> > > > d4a36f6 libtevent: fix for LIC_FILES_CHKSUM
> > > > 0014397 libtalloc: fix for LIC_FILES_CHKSUM
> > > >
> > > > a95726d samba: replace pam packageconfig by hard dependency
> > > > 3fdfdd8 samba: un-blacklist
> > > >
> > >=20
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
>=20
>=20
--=20
-Joe MacDonald.
:wq

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJYKcDzAAoJEEn8ffcsOfaW/SsIAMg4GZkzMgBTORbGQjOglkvl
WAJNQIA3HNK/5Pkfaa+uiFYTG8kIXAilOdU2VMyH07Is8kSL/108YXRZT0yig2gp
JeoflqZxpSYKpEbcm8fiLH0a7r2xCwX3KvbEv/FxSwU4hGF1extJpnbuDlHRI6vI
zDHV7bSnjmfpHo+MXA/3SUKCxwaZm3o6l1fLwLnYnmd5XMvztPWaTkyQO0d53mv4
Rq2uBg9mbDSt1b2xIqD+RdtfnnkmkJxXcVv+qLL6gsfz/GZAeVymNQTceJsDIaK2
n27SO+vMVlodr3Kq+69NsFgnKIZCK2mqavqZB5N7+Wk3BHipV2TXsdydQA/eqT4=
=g7vn
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
