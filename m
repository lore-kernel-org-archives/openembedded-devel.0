Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 71E35600A3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 11:33:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7EBXYv6016207
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 04:33:34 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 14 Aug 2013 04:33:32 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id A5B487FE3	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 07:32:58 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 4F7DB40498; Wed,
	14 Aug 2013 07:33:31 -0400 (EDT)
Date: Wed, 14 Aug 2013 07:33:31 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130814113331.GA3894@windriver.com>
References: <cover.1376461413.git.hongxu.jia@windriver.com>
	<20130814071513.GS17945@jama>
MIME-Version: 1.0
In-Reply-To: <20130814071513.GS17945@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
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
X-List-Received-Date: Wed, 14 Aug 2013 11:33:32 -0000
X-Groupsio-MsgNum: 45684
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline

--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [RFC PATCH 00/13] create meta-filesystems layer to collect filesy=
stem related recipes] On 13.08.14 (Wed 09:15) Martin Jansa wrote:

> On Wed, Aug 14, 2013 at 02:30:52PM +0800, Hongxu Jia wrote:
> > Survey the filesystem related items in meta-oe, and move them to the
> > meta-openembedded/meta-filesystems layer
>=20
> Whole patchset looks good to me. Only thing I've noticed is that we have
> interesting collection of BBFILE_COLLECTIONS names, I know it's not
> important as long as we use correct name in other assignments, but
> maybe some convention (like styleguide for recipes) would be nice:
>=20
> meta-efl/conf/layer.conf:BBFILE_COLLECTIONS +=3D "efl-layer"
> meta-gnome/conf/layer.conf:BBFILE_COLLECTIONS +=3D "gnome-layer"
> meta-gpe/conf/layer.conf:BBFILE_COLLECTIONS +=3D "gpe-layer"
> meta-initramfs/conf/layer.conf:BBFILE_COLLECTIONS +=3D "meta-initramfs"
> meta-multimedia/conf/layer.conf:BBFILE_COLLECTIONS +=3D "multimedia-layer"
> meta-networking/conf/layer.conf:BBFILE_COLLECTIONS +=3D "networking"
> meta-oe/conf/layer.conf:BBFILE_COLLECTIONS +=3D "openembedded-layer"
> meta-ruby/conf/layer.conf:BBFILE_COLLECTIONS +=3D "ruby-layer"
> meta-systemd/conf/layer.conf:BBFILE_COLLECTIONS +=3D "systemd-layer"
> meta-webserver/conf/layer.conf:BBFILE_COLLECTIONS +=3D "webserver"
> meta-xfce/conf/layer.conf:BBFILE_COLLECTIONS +=3D "xfce-layer"
> toolchain-layer/conf/layer.conf:BBFILE_COLLECTIONS +=3D "toolchain-layer"
>=20
> meta-filesystems/conf/layer.conf:BBFILE_COLLECTIONS +=3D "filesystems"
> meta-perl/conf/layer.conf:BBFILE_COLLECTIONS +=3D "perl-layer"
>=20
> What about using <foo>-layer for meta-<foo> layer.conf?
>=20
> Only
> meta-initramfs, meta-networking, meta-oe, meta-webserver,
> meta-filesystems, toolchain-layer aren't using that convention now

I've got no strong feelings on the matter, so if that's the convention
we want to adopt, I'll go make the change in meta-networking right away.
It does seem to make sense based on what all of the other layers are
doing.

-J.

> >=20
> > *1, already layout in meta-oe, they will be moved to meta-filesystems w=
ith
> >     the exception of lvm2 and udisks.
> >     - lvm2 is depended by udisks/cryptsetup/multipath-tools.
> >     - udisks has close relations with systemd.
> > meta-oe--------------->|recipes-core---------------->|f2fs-tools
> >                        |recipes-extended------------>|owfs
> >                        |recipes-connectivity-------->|ifuse
> >                                                      |sshfs-fuse
> >                                                      |smbnetfs
> >                        |recipes-support------------->|ntfs-3g-ntfsprogs
> >                                                      |xfsprogs
> >                                                      |cramfs
> >                                                      |physfs
> >                                                      |fuse
> >                                                      |lvm2
> >                                                      |udisks
> >=20
> > *2, already layout in oe-core/meta, they will stay where they are.
> > oe-core/meta---------->|recipes-devtools------------>|file
> >                                                      |dosfstools
> >                                                      |squashfs-tools
> >                                                      |devel-config-----=
-->nfs-export-root
> >                                                      |btrfs-tools
> >                                                      |genext2fs
> >                                                      |e2fsprogs
> >                                                      |util-linux
> >                                                      |packagegroups----=
-->packagegroup-base.bb
> >                                                      |sysfsutils
> >                        |recipes-extended------------>|stat
> >                        |recipes-support------------->|attr
> >=20
> > *3, TOBE layout in meta-filesystems layer.
> > ifuse, sshfs-fuse, owfs, smbnetfs, ntfs-3g-ntfsprogs, fuse-exfat are ba=
sed on fuse
> >=20
> > meta-filesystems------>|recipes-filesystems--------->|ifuse
> >                                                      |sshfs-fuse
> >                                                      |owfs
> >                                                      |ntfs-3g-ntfsprogs
> >                                                      |cramfs
> >                                                      |smbnetfs
> >                                                      |fuse-exfat
> >                        |recipes-support------------->|fuse
> >                                                      |physfs
> >                        |recipes-utils--------------->|f2fs-tools
> >                                                      |exfat-utils
> >                                                      |xfsprogs
> >=20
> > *4, upgrade and newly added
> > 1) 4 Packages need to be upgraded
> >     owfs, 2.8p20-->2.9p1
> >     ntfs-3g-ntfsprogs, 2011.4.12-->2013.1.13
> >     xfsprogs, 3.1.8-->3.1.11
> >     fuse, 2.9.2-->2.9.3
> >=20
> > 2) 2 Packages are newly added to meta-filesystems
> >     fuse-exfat: add version 1.0.1
> >     exfat-utils: add version 1.0.1
> >=20
> > [YOCTO #4178]
> >=20
> > //Hongxu
> >=20
> > The following changes since commit fa914e4c80bcb29d2526bda3d0d916f71f8f=
6df4:
> >=20
> >   gst-ffmpeg: drop .bbappend, moved to oe-core (2013-08-14 00:20:24 +02=
00)
> >=20
> > are available in the git repository at:
> >=20
> >   git://git.pokylinux.org/poky-contrib hongxu/meta-filesystems
> >   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dhongxu/meta-f=
ilesystems
> >=20
> > Hongxu Jia (13):
> >   meta-filesystems creation
> >   fuse: move to meta-filesystems and upgrade
> >   physfs: move to meta-filesystems
> >   ifuse: move to meta-filesystems
> >   smbnetfs: move to meta-filesystems
> >   sshfs-fuse: move to meta-filesystems
> >   owfs: move to meta-filesystems and upgrade
> >   cramfs: move to meta-filesystems
> >   xfsprogs: move to meta-filesystems and upgrade
> >   ntfs-3g-ntfsprogs: move to meta-filesystems and upgrade
> >   f2fs-tools: move to meta-filesystems
> >   fuse-exfat: add version 1.0.1
> >   exfat-utils: add version 1.0.1
> >=20
> >  meta-filesystems/COPYING.MIT                       |  17 ++
> >  meta-filesystems/README                            | 138 +++++++++++++
> >  meta-filesystems/conf/layer.conf                   |  10 +
> >  .../recipes-filesystems}/cramfs/cramfs_1.1.bb      |   0
> >  .../fuse-exfat/fuse-exfat_1.0.1.bb                 |  26 +++
> >  .../recipes-filesystems}/ifuse/ifuse_1.1.2.bb      |   0
> >  .../ntfs-3g-ntfsprogs_2013.1.13.bb                 |  15 +-
> >  .../recipes-filesystems}/owfs/owfs/owhttpd         |   0
> >  .../recipes-filesystems}/owfs/owfs/owserver        |   0
> >  .../recipes-filesystems/owfs/owfs_2.9p1.bb         |  11 +-
> >  .../recipes-filesystems}/smbnetfs/smbnetfs_git.bb  |   0
> >  .../sshfs-fuse/sshfs-fuse_2.4.bb                   |   0
> >  .../recipes-support/fuse/files}/aarch64.patch      |  15 +-
> >  .../fuse/files}/gold-unversioned-symbol.patch      |  76 +++++--
> >  .../recipes-support/fuse/fuse_2.9.3.bb             |  13 +-
> >  .../recipes-support/physfs/physfs_2.0.3.bb         |   0
> >  .../recipes-utils/exfat-utils/exfat-utils_1.0.1.bb |  29 +++
> >  .../recipes-utils}/f2fs-tools/f2fs-tools_1.1.0.bb  |   0
> >  .../files}/drop-configure-check-for-aio.patch      |  42 ++--
> >  .../xfsprogs/files}/remove-install-as-user.patch   | 225 +++----------=
--------
> >  .../recipes-utils/xfsprogs/xfsprogs_3.1.11.bb      |   5 +-
> >  21 files changed, 363 insertions(+), 259 deletions(-)
> >  create mode 100644 meta-filesystems/COPYING.MIT
> >  create mode 100644 meta-filesystems/README
> >  create mode 100644 meta-filesystems/conf/layer.conf
> >  rename {meta-oe/recipes-support =3D> meta-filesystems/recipes-filesyst=
ems}/cramfs/cramfs_1.1.bb (100%)
> >  create mode 100644 meta-filesystems/recipes-filesystems/fuse-exfat/fus=
e-exfat_1.0.1.bb
> >  rename {meta-oe/recipes-connectivity =3D> meta-filesystems/recipes-fil=
esystems}/ifuse/ifuse_1.1.2.bb (100%)
> >  rename meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_201=
1.4.12.bb =3D> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-=
3g-ntfsprogs_2013.1.13.bb (63%)
> >  rename {meta-oe/recipes-extended =3D> meta-filesystems/recipes-filesys=
tems}/owfs/owfs/owhttpd (100%)
> >  rename {meta-oe/recipes-extended =3D> meta-filesystems/recipes-filesys=
tems}/owfs/owfs/owserver (100%)
> >  rename meta-oe/recipes-extended/owfs/owfs_2.8p20.bb =3D> meta-filesyst=
ems/recipes-filesystems/owfs/owfs_2.9p1.bb (85%)
> >  rename {meta-oe/recipes-connectivity =3D> meta-filesystems/recipes-fil=
esystems}/smbnetfs/smbnetfs_git.bb (100%)
> >  rename {meta-oe/recipes-connectivity =3D> meta-filesystems/recipes-fil=
esystems}/sshfs-fuse/sshfs-fuse_2.4.bb (100%)
> >  rename {meta-oe/recipes-support/fuse/fuse-2.9.2 =3D> meta-filesystems/=
recipes-support/fuse/files}/aarch64.patch (49%)
> >  rename {meta-oe/recipes-support/fuse/fuse-2.9.2 =3D> meta-filesystems/=
recipes-support/fuse/files}/gold-unversioned-symbol.patch (45%)
> >  rename meta-oe/recipes-support/fuse/fuse_2.9.2.bb =3D> meta-filesystem=
s/recipes-support/fuse/fuse_2.9.3.bb (67%)
> >  rename {meta-oe =3D> meta-filesystems}/recipes-support/physfs/physfs_2=
=2E0.3.bb (100%)
> >  create mode 100644 meta-filesystems/recipes-utils/exfat-utils/exfat-ut=
ils_1.0.1.bb
> >  rename {meta-oe/recipes-core =3D> meta-filesystems/recipes-utils}/f2fs=
-tools/f2fs-tools_1.1.0.bb (100%)
> >  rename {meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8 =3D> meta-file=
systems/recipes-utils/xfsprogs/files}/drop-configure-check-for-aio.patch (6=
7%)
> >  rename {meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8 =3D> meta-file=
systems/recipes-utils/xfsprogs/files}/remove-install-as-user.patch (46%)
> >  rename meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb =3D> meta-fi=
lesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb (90%)
> >=20
> > --=20
> > 1.8.1.2
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
--=20
-Joe MacDonald.
:wq

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlILawUACgkQPN8S4W6ZZncs+ACePKo8WVW9tIG322iWiACow5P4
tpUAn2qDpJC23J0PbBJO5pCj6+TdIDW+
=2eEU
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
