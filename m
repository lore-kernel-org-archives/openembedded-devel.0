Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1E76060593
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 11:52:51 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d51so4726293eek.23
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 04:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fK6q0Mr8t7/zzJEQ/8IIL8RZoTUYJj9E3+ZADVi0Y0A=;
	b=kuD9z/x30pRWE0+0KeQhn+mVj6Yaw1ttnx2cqz9I9kjhVdbi/1wq7mpXt/kZ6mnMOL
	VepNBw23H6bhfYbeWK6ckWqw79WUGqNmrMsoHMfAQMIFwnV7bhYGhzHagXgv65RMu3L+
	YgMjnYK/+DyRixOxN9aJ4t3rUvkyGPUE4pO00jrWy3T+hJkOv648Gd+ee6aJVJuAgBbN
	kq4FyE7HD4WXTbVh0SVbUhjMjwKV861OnWj6NegynbX2FN3mWI3mjkp52uNi1wM+WBn2
	dCnFSs3UBtShqbICb1b4yegm5mkjlpOv09fxmbh8hwTctIlqKG5oaeDs1lFbLG5vk8PC
	5OxA==
X-Received: by 10.14.6.9 with SMTP id 9mr61049eem.108.1376481172156;
	Wed, 14 Aug 2013 04:52:52 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm74618443eeg.17.2013.08.14.04.52.50 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 14 Aug 2013 04:52:51 -0700 (PDT)
Date: Wed, 14 Aug 2013 13:53:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20130814115342.GW17945@jama>
References: <cover.1376461413.git.hongxu.jia@windriver.com>
	<20130814071513.GS17945@jama> <520B321F.8070301@windriver.com>
MIME-Version: 1.0
In-Reply-To: <520B321F.8070301@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 14 Aug 2013 11:52:52 -0000
X-Groupsio-MsgNum: 45686
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L0mHLbha4YKvhGtu"
Content-Disposition: inline

--L0mHLbha4YKvhGtu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2013 at 03:30:39PM +0800, Hongxu Jia wrote:
> On 08/14/2013 03:15 PM, Martin Jansa wrote:
> > On Wed, Aug 14, 2013 at 02:30:52PM +0800, Hongxu Jia wrote:
> >> Survey the filesystem related items in meta-oe, and move them to the
> >> meta-openembedded/meta-filesystems layer
> > Whole patchset looks good to me. Only thing I've noticed is that we have
> > interesting collection of BBFILE_COLLECTIONS names, I know it's not
> > important as long as we use correct name in other assignments, but
> > maybe some convention (like styleguide for recipes) would be nice:
> >
> > meta-efl/conf/layer.conf:BBFILE_COLLECTIONS +=3D "efl-layer"
> > meta-gnome/conf/layer.conf:BBFILE_COLLECTIONS +=3D "gnome-layer"
> > meta-gpe/conf/layer.conf:BBFILE_COLLECTIONS +=3D "gpe-layer"
> > meta-initramfs/conf/layer.conf:BBFILE_COLLECTIONS +=3D "meta-initramfs"
> > meta-multimedia/conf/layer.conf:BBFILE_COLLECTIONS +=3D "multimedia-lay=
er"
> > meta-networking/conf/layer.conf:BBFILE_COLLECTIONS +=3D "networking"
> > meta-oe/conf/layer.conf:BBFILE_COLLECTIONS +=3D "openembedded-layer"
> > meta-ruby/conf/layer.conf:BBFILE_COLLECTIONS +=3D "ruby-layer"
> > meta-systemd/conf/layer.conf:BBFILE_COLLECTIONS +=3D "systemd-layer"
> > meta-webserver/conf/layer.conf:BBFILE_COLLECTIONS +=3D "webserver"
> > meta-xfce/conf/layer.conf:BBFILE_COLLECTIONS +=3D "xfce-layer"
> > toolchain-layer/conf/layer.conf:BBFILE_COLLECTIONS +=3D "toolchain-laye=
r"
> >
> > meta-filesystems/conf/layer.conf:BBFILE_COLLECTIONS +=3D "filesystems"
> > meta-perl/conf/layer.conf:BBFILE_COLLECTIONS +=3D "perl-layer"
> >
> > What about using <foo>-layer for meta-<foo> layer.conf?
> >
> > Only
> > meta-initramfs, meta-networking, meta-oe, meta-webserver,
> > meta-filesystems, toolchain-layer aren't using that convention now
> Agree, follow the convention is good and I will fix it by hand.

I've already updated layer.conf for meta-filesystems when merging it for
test in "bitbake world"

Now they are in jansa/in-test so you don't need to resend them.

> BTW, it's better to modify the script 'yocto-layer' in meta-oe
> which I used to create the new layer.
>=20
> The layer.conf format defined in=20
> 'scripts/lib/bsp/substrate/target/arch/layer/conf/layer.conf'
>=20
> //Hongxu
>=20
> >> *1, already layout in meta-oe, they will be moved to meta-filesystems =
with
> >>      the exception of lvm2 and udisks.
> >>      - lvm2 is depended by udisks/cryptsetup/multipath-tools.
> >>      - udisks has close relations with systemd.
> >> meta-oe--------------->|recipes-core---------------->|f2fs-tools
> >>                         |recipes-extended------------>|owfs
> >>                         |recipes-connectivity-------->|ifuse
> >>                                                       |sshfs-fuse
> >>                                                       |smbnetfs
> >>                         |recipes-support------------->|ntfs-3g-ntfspro=
gs
> >>                                                       |xfsprogs
> >>                                                       |cramfs
> >>                                                       |physfs
> >>                                                       |fuse
> >>                                                       |lvm2
> >>                                                       |udisks
> >>
> >> *2, already layout in oe-core/meta, they will stay where they are.
> >> oe-core/meta---------->|recipes-devtools------------>|file
> >>                                                       |dosfstools
> >>                                                       |squashfs-tools
> >>                                                       |devel-config---=
---->nfs-export-root
> >>                                                       |btrfs-tools
> >>                                                       |genext2fs
> >>                                                       |e2fsprogs
> >>                                                       |util-linux
> >>                                                       |packagegroups--=
---->packagegroup-base.bb
> >>                                                       |sysfsutils
> >>                         |recipes-extended------------>|stat
> >>                         |recipes-support------------->|attr
> >>
> >> *3, TOBE layout in meta-filesystems layer.
> >> ifuse, sshfs-fuse, owfs, smbnetfs, ntfs-3g-ntfsprogs, fuse-exfat are b=
ased on fuse
> >>
> >> meta-filesystems------>|recipes-filesystems--------->|ifuse
> >>                                                       |sshfs-fuse
> >>                                                       |owfs
> >>                                                       |ntfs-3g-ntfspro=
gs
> >>                                                       |cramfs
> >>                                                       |smbnetfs
> >>                                                       |fuse-exfat
> >>                         |recipes-support------------->|fuse
> >>                                                       |physfs
> >>                         |recipes-utils--------------->|f2fs-tools
> >>                                                       |exfat-utils
> >>                                                       |xfsprogs
> >>
> >> *4, upgrade and newly added
> >> 1) 4 Packages need to be upgraded
> >>      owfs, 2.8p20-->2.9p1
> >>      ntfs-3g-ntfsprogs, 2011.4.12-->2013.1.13
> >>      xfsprogs, 3.1.8-->3.1.11
> >>      fuse, 2.9.2-->2.9.3
> >>
> >> 2) 2 Packages are newly added to meta-filesystems
> >>      fuse-exfat: add version 1.0.1
> >>      exfat-utils: add version 1.0.1
> >>
> >> [YOCTO #4178]
> >>
> >> //Hongxu
> >>
> >> The following changes since commit fa914e4c80bcb29d2526bda3d0d916f71f8=
f6df4:
> >>
> >>    gst-ffmpeg: drop .bbappend, moved to oe-core (2013-08-14 00:20:24 +=
0200)
> >>
> >> are available in the git repository at:
> >>
> >>    git://git.pokylinux.org/poky-contrib hongxu/meta-filesystems
> >>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dhongxu/meta=
-filesystems
> >>
> >> Hongxu Jia (13):
> >>    meta-filesystems creation
> >>    fuse: move to meta-filesystems and upgrade
> >>    physfs: move to meta-filesystems
> >>    ifuse: move to meta-filesystems
> >>    smbnetfs: move to meta-filesystems
> >>    sshfs-fuse: move to meta-filesystems
> >>    owfs: move to meta-filesystems and upgrade
> >>    cramfs: move to meta-filesystems
> >>    xfsprogs: move to meta-filesystems and upgrade
> >>    ntfs-3g-ntfsprogs: move to meta-filesystems and upgrade
> >>    f2fs-tools: move to meta-filesystems
> >>    fuse-exfat: add version 1.0.1
> >>    exfat-utils: add version 1.0.1
> >>
> >>   meta-filesystems/COPYING.MIT                       |  17 ++
> >>   meta-filesystems/README                            | 138 +++++++++++=
++
> >>   meta-filesystems/conf/layer.conf                   |  10 +
> >>   .../recipes-filesystems}/cramfs/cramfs_1.1.bb      |   0
> >>   .../fuse-exfat/fuse-exfat_1.0.1.bb                 |  26 +++
> >>   .../recipes-filesystems}/ifuse/ifuse_1.1.2.bb      |   0
> >>   .../ntfs-3g-ntfsprogs_2013.1.13.bb                 |  15 +-
> >>   .../recipes-filesystems}/owfs/owfs/owhttpd         |   0
> >>   .../recipes-filesystems}/owfs/owfs/owserver        |   0
> >>   .../recipes-filesystems/owfs/owfs_2.9p1.bb         |  11 +-
> >>   .../recipes-filesystems}/smbnetfs/smbnetfs_git.bb  |   0
> >>   .../sshfs-fuse/sshfs-fuse_2.4.bb                   |   0
> >>   .../recipes-support/fuse/files}/aarch64.patch      |  15 +-
> >>   .../fuse/files}/gold-unversioned-symbol.patch      |  76 +++++--
> >>   .../recipes-support/fuse/fuse_2.9.3.bb             |  13 +-
> >>   .../recipes-support/physfs/physfs_2.0.3.bb         |   0
> >>   .../recipes-utils/exfat-utils/exfat-utils_1.0.1.bb |  29 +++
> >>   .../recipes-utils}/f2fs-tools/f2fs-tools_1.1.0.bb  |   0
> >>   .../files}/drop-configure-check-for-aio.patch      |  42 ++--
> >>   .../xfsprogs/files}/remove-install-as-user.patch   | 225 +++--------=
----------
> >>   .../recipes-utils/xfsprogs/xfsprogs_3.1.11.bb      |   5 +-
> >>   21 files changed, 363 insertions(+), 259 deletions(-)
> >>   create mode 100644 meta-filesystems/COPYING.MIT
> >>   create mode 100644 meta-filesystems/README
> >>   create mode 100644 meta-filesystems/conf/layer.conf
> >>   rename {meta-oe/recipes-support =3D> meta-filesystems/recipes-filesy=
stems}/cramfs/cramfs_1.1.bb (100%)
> >>   create mode 100644 meta-filesystems/recipes-filesystems/fuse-exfat/f=
use-exfat_1.0.1.bb
> >>   rename {meta-oe/recipes-connectivity =3D> meta-filesystems/recipes-f=
ilesystems}/ifuse/ifuse_1.1.2.bb (100%)
> >>   rename meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2=
011.4.12.bb =3D> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntf=
s-3g-ntfsprogs_2013.1.13.bb (63%)
> >>   rename {meta-oe/recipes-extended =3D> meta-filesystems/recipes-files=
ystems}/owfs/owfs/owhttpd (100%)
> >>   rename {meta-oe/recipes-extended =3D> meta-filesystems/recipes-files=
ystems}/owfs/owfs/owserver (100%)
> >>   rename meta-oe/recipes-extended/owfs/owfs_2.8p20.bb =3D> meta-filesy=
stems/recipes-filesystems/owfs/owfs_2.9p1.bb (85%)
> >>   rename {meta-oe/recipes-connectivity =3D> meta-filesystems/recipes-f=
ilesystems}/smbnetfs/smbnetfs_git.bb (100%)
> >>   rename {meta-oe/recipes-connectivity =3D> meta-filesystems/recipes-f=
ilesystems}/sshfs-fuse/sshfs-fuse_2.4.bb (100%)
> >>   rename {meta-oe/recipes-support/fuse/fuse-2.9.2 =3D> meta-filesystem=
s/recipes-support/fuse/files}/aarch64.patch (49%)
> >>   rename {meta-oe/recipes-support/fuse/fuse-2.9.2 =3D> meta-filesystem=
s/recipes-support/fuse/files}/gold-unversioned-symbol.patch (45%)
> >>   rename meta-oe/recipes-support/fuse/fuse_2.9.2.bb =3D> meta-filesyst=
ems/recipes-support/fuse/fuse_2.9.3.bb (67%)
> >>   rename {meta-oe =3D> meta-filesystems}/recipes-support/physfs/physfs=
_2.0.3.bb (100%)
> >>   create mode 100644 meta-filesystems/recipes-utils/exfat-utils/exfat-=
utils_1.0.1.bb
> >>   rename {meta-oe/recipes-core =3D> meta-filesystems/recipes-utils}/f2=
fs-tools/f2fs-tools_1.1.0.bb (100%)
> >>   rename {meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8 =3D> meta-fi=
lesystems/recipes-utils/xfsprogs/files}/drop-configure-check-for-aio.patch =
(67%)
> >>   rename {meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8 =3D> meta-fi=
lesystems/recipes-utils/xfsprogs/files}/remove-install-as-user.patch (46%)
> >>   rename meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb =3D> meta-=
filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb (90%)
> >>
> >> --=20
> >> 1.8.1.2
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--L0mHLbha4YKvhGtu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlILb8YACgkQN1Ujt2V2gBxzcQCfejbXAPRdGh3G29GRHLzTYpKO
2R8AoJwriAndEVbt5SupQA4jfKL45Ut7
=Sf6y
-----END PGP SIGNATURE-----

--L0mHLbha4YKvhGtu--
