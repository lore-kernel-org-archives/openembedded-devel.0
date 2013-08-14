Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id A770A6A457
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 07:14:23 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c50so4683236eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 00:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xRbRvC0T3KTglYB/zMNOE1C4/oA2tPzn3822xvWpmfk=;
	b=YWaMxoG6GEjezHKPKtkJMcx65U3Pg8L9Rk5MZ8/soTiBF1EEZSH/6e5YltuOhloZth
	z3YOMWbaPNQMwLYsKafrPMZ6u26ITU16qqWDGWehhSJkqao+Z8CgfsC9SxbSgi2wVv1Z
	KKR/ZNF0MZPv1uaWUamH/DmNIcw5rByu+HqHd4YU7y4ftnHGhB6HMuuUba4zgTM3RISM
	R9pGWs35h2BRn81Sk470aWR3GJpqCzIwYMfKJp+5BXzklBg5LiG3I6pBRmrh03FRDC4N
	VepdzCNILuO9uQVVLH2fA7NMKS4sbcztAu2SbHW0IxwP1Q2/15NIYyMy93a/384kOkHT
	DpIQ==
X-Received: by 10.14.211.134 with SMTP id w6mr12944329eeo.26.1376464463391;
	Wed, 14 Aug 2013 00:14:23 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm72768723eeg.17.2013.08.14.00.14.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 14 Aug 2013 00:14:22 -0700 (PDT)
Date: Wed, 14 Aug 2013 09:15:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130814071513.GS17945@jama>
References: <cover.1376461413.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1376461413.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC PATCH 00/13] create meta-filesystems layer to collect filesystem related recipes
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
X-List-Received-Date: Wed, 14 Aug 2013 07:14:24 -0000
X-Groupsio-MsgNum: 45681
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mln0rGgUGuXEqmuI"
Content-Disposition: inline

--mln0rGgUGuXEqmuI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2013 at 02:30:52PM +0800, Hongxu Jia wrote:
> Survey the filesystem related items in meta-oe, and move them to the
> meta-openembedded/meta-filesystems layer

Whole patchset looks good to me. Only thing I've noticed is that we have
interesting collection of BBFILE_COLLECTIONS names, I know it's not
important as long as we use correct name in other assignments, but
maybe some convention (like styleguide for recipes) would be nice:

meta-efl/conf/layer.conf:BBFILE_COLLECTIONS +=3D "efl-layer"
meta-gnome/conf/layer.conf:BBFILE_COLLECTIONS +=3D "gnome-layer"
meta-gpe/conf/layer.conf:BBFILE_COLLECTIONS +=3D "gpe-layer"
meta-initramfs/conf/layer.conf:BBFILE_COLLECTIONS +=3D "meta-initramfs"
meta-multimedia/conf/layer.conf:BBFILE_COLLECTIONS +=3D "multimedia-layer"
meta-networking/conf/layer.conf:BBFILE_COLLECTIONS +=3D "networking"
meta-oe/conf/layer.conf:BBFILE_COLLECTIONS +=3D "openembedded-layer"
meta-ruby/conf/layer.conf:BBFILE_COLLECTIONS +=3D "ruby-layer"
meta-systemd/conf/layer.conf:BBFILE_COLLECTIONS +=3D "systemd-layer"
meta-webserver/conf/layer.conf:BBFILE_COLLECTIONS +=3D "webserver"
meta-xfce/conf/layer.conf:BBFILE_COLLECTIONS +=3D "xfce-layer"
toolchain-layer/conf/layer.conf:BBFILE_COLLECTIONS +=3D "toolchain-layer"

meta-filesystems/conf/layer.conf:BBFILE_COLLECTIONS +=3D "filesystems"
meta-perl/conf/layer.conf:BBFILE_COLLECTIONS +=3D "perl-layer"

What about using <foo>-layer for meta-<foo> layer.conf?

Only
meta-initramfs, meta-networking, meta-oe, meta-webserver,
meta-filesystems, toolchain-layer aren't using that convention now
>=20
> *1, already layout in meta-oe, they will be moved to meta-filesystems with
>     the exception of lvm2 and udisks.
>     - lvm2 is depended by udisks/cryptsetup/multipath-tools.
>     - udisks has close relations with systemd.
> meta-oe--------------->|recipes-core---------------->|f2fs-tools
>                        |recipes-extended------------>|owfs
>                        |recipes-connectivity-------->|ifuse
>                                                      |sshfs-fuse
>                                                      |smbnetfs
>                        |recipes-support------------->|ntfs-3g-ntfsprogs
>                                                      |xfsprogs
>                                                      |cramfs
>                                                      |physfs
>                                                      |fuse
>                                                      |lvm2
>                                                      |udisks
>=20
> *2, already layout in oe-core/meta, they will stay where they are.
> oe-core/meta---------->|recipes-devtools------------>|file
>                                                      |dosfstools
>                                                      |squashfs-tools
>                                                      |devel-config-------=
>nfs-export-root
>                                                      |btrfs-tools
>                                                      |genext2fs
>                                                      |e2fsprogs
>                                                      |util-linux
>                                                      |packagegroups------=
>packagegroup-base.bb
>                                                      |sysfsutils
>                        |recipes-extended------------>|stat
>                        |recipes-support------------->|attr
>=20
> *3, TOBE layout in meta-filesystems layer.
> ifuse, sshfs-fuse, owfs, smbnetfs, ntfs-3g-ntfsprogs, fuse-exfat are base=
d on fuse
>=20
> meta-filesystems------>|recipes-filesystems--------->|ifuse
>                                                      |sshfs-fuse
>                                                      |owfs
>                                                      |ntfs-3g-ntfsprogs
>                                                      |cramfs
>                                                      |smbnetfs
>                                                      |fuse-exfat
>                        |recipes-support------------->|fuse
>                                                      |physfs
>                        |recipes-utils--------------->|f2fs-tools
>                                                      |exfat-utils
>                                                      |xfsprogs
>=20
> *4, upgrade and newly added
> 1) 4 Packages need to be upgraded
>     owfs, 2.8p20-->2.9p1
>     ntfs-3g-ntfsprogs, 2011.4.12-->2013.1.13
>     xfsprogs, 3.1.8-->3.1.11
>     fuse, 2.9.2-->2.9.3
>=20
> 2) 2 Packages are newly added to meta-filesystems
>     fuse-exfat: add version 1.0.1
>     exfat-utils: add version 1.0.1
>=20
> [YOCTO #4178]
>=20
> //Hongxu
>=20
> The following changes since commit fa914e4c80bcb29d2526bda3d0d916f71f8f6d=
f4:
>=20
>   gst-ffmpeg: drop .bbappend, moved to oe-core (2013-08-14 00:20:24 +0200)
>=20
> are available in the git repository at:
>=20
>   git://git.pokylinux.org/poky-contrib hongxu/meta-filesystems
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dhongxu/meta-fil=
esystems
>=20
> Hongxu Jia (13):
>   meta-filesystems creation
>   fuse: move to meta-filesystems and upgrade
>   physfs: move to meta-filesystems
>   ifuse: move to meta-filesystems
>   smbnetfs: move to meta-filesystems
>   sshfs-fuse: move to meta-filesystems
>   owfs: move to meta-filesystems and upgrade
>   cramfs: move to meta-filesystems
>   xfsprogs: move to meta-filesystems and upgrade
>   ntfs-3g-ntfsprogs: move to meta-filesystems and upgrade
>   f2fs-tools: move to meta-filesystems
>   fuse-exfat: add version 1.0.1
>   exfat-utils: add version 1.0.1
>=20
>  meta-filesystems/COPYING.MIT                       |  17 ++
>  meta-filesystems/README                            | 138 +++++++++++++
>  meta-filesystems/conf/layer.conf                   |  10 +
>  .../recipes-filesystems}/cramfs/cramfs_1.1.bb      |   0
>  .../fuse-exfat/fuse-exfat_1.0.1.bb                 |  26 +++
>  .../recipes-filesystems}/ifuse/ifuse_1.1.2.bb      |   0
>  .../ntfs-3g-ntfsprogs_2013.1.13.bb                 |  15 +-
>  .../recipes-filesystems}/owfs/owfs/owhttpd         |   0
>  .../recipes-filesystems}/owfs/owfs/owserver        |   0
>  .../recipes-filesystems/owfs/owfs_2.9p1.bb         |  11 +-
>  .../recipes-filesystems}/smbnetfs/smbnetfs_git.bb  |   0
>  .../sshfs-fuse/sshfs-fuse_2.4.bb                   |   0
>  .../recipes-support/fuse/files}/aarch64.patch      |  15 +-
>  .../fuse/files}/gold-unversioned-symbol.patch      |  76 +++++--
>  .../recipes-support/fuse/fuse_2.9.3.bb             |  13 +-
>  .../recipes-support/physfs/physfs_2.0.3.bb         |   0
>  .../recipes-utils/exfat-utils/exfat-utils_1.0.1.bb |  29 +++
>  .../recipes-utils}/f2fs-tools/f2fs-tools_1.1.0.bb  |   0
>  .../files}/drop-configure-check-for-aio.patch      |  42 ++--
>  .../xfsprogs/files}/remove-install-as-user.patch   | 225 +++------------=
------
>  .../recipes-utils/xfsprogs/xfsprogs_3.1.11.bb      |   5 +-
>  21 files changed, 363 insertions(+), 259 deletions(-)
>  create mode 100644 meta-filesystems/COPYING.MIT
>  create mode 100644 meta-filesystems/README
>  create mode 100644 meta-filesystems/conf/layer.conf
>  rename {meta-oe/recipes-support =3D> meta-filesystems/recipes-filesystem=
s}/cramfs/cramfs_1.1.bb (100%)
>  create mode 100644 meta-filesystems/recipes-filesystems/fuse-exfat/fuse-=
exfat_1.0.1.bb
>  rename {meta-oe/recipes-connectivity =3D> meta-filesystems/recipes-files=
ystems}/ifuse/ifuse_1.1.2.bb (100%)
>  rename meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.=
4.12.bb =3D> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g=
-ntfsprogs_2013.1.13.bb (63%)
>  rename {meta-oe/recipes-extended =3D> meta-filesystems/recipes-filesyste=
ms}/owfs/owfs/owhttpd (100%)
>  rename {meta-oe/recipes-extended =3D> meta-filesystems/recipes-filesyste=
ms}/owfs/owfs/owserver (100%)
>  rename meta-oe/recipes-extended/owfs/owfs_2.8p20.bb =3D> meta-filesystem=
s/recipes-filesystems/owfs/owfs_2.9p1.bb (85%)
>  rename {meta-oe/recipes-connectivity =3D> meta-filesystems/recipes-files=
ystems}/smbnetfs/smbnetfs_git.bb (100%)
>  rename {meta-oe/recipes-connectivity =3D> meta-filesystems/recipes-files=
ystems}/sshfs-fuse/sshfs-fuse_2.4.bb (100%)
>  rename {meta-oe/recipes-support/fuse/fuse-2.9.2 =3D> meta-filesystems/re=
cipes-support/fuse/files}/aarch64.patch (49%)
>  rename {meta-oe/recipes-support/fuse/fuse-2.9.2 =3D> meta-filesystems/re=
cipes-support/fuse/files}/gold-unversioned-symbol.patch (45%)
>  rename meta-oe/recipes-support/fuse/fuse_2.9.2.bb =3D> meta-filesystems/=
recipes-support/fuse/fuse_2.9.3.bb (67%)
>  rename {meta-oe =3D> meta-filesystems}/recipes-support/physfs/physfs_2.0=
=2E3.bb (100%)
>  create mode 100644 meta-filesystems/recipes-utils/exfat-utils/exfat-util=
s_1.0.1.bb
>  rename {meta-oe/recipes-core =3D> meta-filesystems/recipes-utils}/f2fs-t=
ools/f2fs-tools_1.1.0.bb (100%)
>  rename {meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8 =3D> meta-filesy=
stems/recipes-utils/xfsprogs/files}/drop-configure-check-for-aio.patch (67%)
>  rename {meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8 =3D> meta-filesy=
stems/recipes-utils/xfsprogs/files}/remove-install-as-user.patch (46%)
>  rename meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb =3D> meta-file=
systems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb (90%)
>=20
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mln0rGgUGuXEqmuI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlILLoEACgkQN1Ujt2V2gBzppgCgq8YCx9SosfxRWssUVPEv2r+g
d+EAoKFxDMncjOEuAjUnFR/km0rYSj1e
=5Ifu
-----END PGP SIGNATURE-----

--mln0rGgUGuXEqmuI--
