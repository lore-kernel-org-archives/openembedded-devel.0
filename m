Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C1E3B6FF97
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 07:09:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBF78uV9023464
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 14 Dec 2015 23:08:56 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.84]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0248.002;
	Mon, 14 Dec 2015 23:08:56 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Thread-Topic: [oe] [meta-networking][PATCH 0/7 v2] waf-samba: fix build
	failure on targets unsupported by qemu
Thread-Index: AQHRLFY7YSjkKlOYPEeIbxltYzSiY57LtR3Q
Date: Tue, 15 Dec 2015 07:08:55 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010C76C08E@ALA-MBA.corp.ad.wrs.com>
References: <cover.1447910888.git.jackie.huang@windriver.com>
	<20151201163452.GB4384@mentor.com>
In-Reply-To: <20151201163452.GB4384@mentor.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.144]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 0/7 v2] waf-samba: fix build failure on targets unsupported by qemu
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
X-List-Received-Date: Tue, 15 Dec 2015 07:09:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Joe MacDonald [mailto:Joe_MacDonald@mentor.com]
> Sent: Wednesday, December 02, 2015 12:35 AM
> To: Huang, Jie (Jackie)
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-networking][PATCH 0/7 v2] waf-samba: fix build fa=
ilure on targets
> unsupported by qemu
>=20
> Hi Jackie,
>=20
> I tried pulling in this patch set from:
>=20
>    git://git.pokylinux.org/poky-contrib jhuang0/d_samba-rebase_151119-0
>=20
> and it quickly crashed into a patching error:
>=20
>    http://pastebin.com/k6f0M4c3
>=20
> Did you still want that branch considered for merging?

Sorry for late response, yes we still want these be merged,
It's a month ago when I rebase these patches, I am not surprised
It fails to patch, I will rebase again and re-send.

Thanks,
Jackie

>=20
> -J.
>=20
> [[oe] [meta-networking][PATCH 0/7 v2] waf-samba: fix build failure on tar=
gets unsupported by qemu]
> On 15.11.19 (Thu 13:37) jackie.huang@windriver.com wrote:
>=20
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > v2 comments:
> >
> > rebase since samba reladted packages are move to meta-networking
> > from meta-oe.
> >
> > Comments:
> >
> > samba and required packages started to use waf build
> > system since 4.x, and the waf bbclass use qemu user mode
> > to help configure checking by default, but not all targets
> > are supported by qemu user mode, so it definitely fail on those
> > targets (it failed on our fsl_t2xxx and cav-octeon3).
> >
> > The solution here it so use waf cross-answer mode to avoid
> > using qemu, but we need to prepare the cross-answers, it's
> > easy and error-prone if we try to get these cross-answers manually,
> > but fortunately, waf provides another mode to help generate
> > them in newer version, so upgrade related packages and
> > backport patches for samba (I also tried to upgrad samba
> > to 4.3.1, but it still doesn't work in my runtime testing
> > after some bug fixing, so I keep in the current version for
> > now, I may upgrade it sometime later if I get better understand
> > about the new version).
> >
> > Build tested on:
> >
> > intel-x86-64
> > qemux86
> > qemuarm
> > qemuarma9
> > qemuarm64
> > qemumips
> > qemumips64
> > fsl-ls20xx
> > fsl-t2xxx
> > xilinx-zynq
> > cav-octeon3
> >
> >
> > --
> > The following changes since commit ea319464b673cbf9a416b582dc4766faeb99=
8430:
> >
> >   vlc: add PACKAGECONFIG for samba, upnp, dvdnav, sftp, vorbis, dc1394,=
 dv1394, svg, svgdec (2015-
> 11-16 21:50:11 +0100)
> >
> > are available in the git repository at:
> >
> >   git://git.pokylinux.org/poky-contrib jhuang0/d_samba-rebase_151119-0
> >   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Djhuang0/d_sam=
ba-rebase_151119-0
> >
> > Jackie Huang (7):
> >   libtdb: upgrade to 1.3.7
> >   libldb: upgrade to 1.1.21
> >   libtevent: upgrade to 0.9.25
> >   talloc: upgrade to 2.1.3
> >   samba: fix the incorrect tmpfiles installed directory
> >   samba: backport patches for cross-compiling
> >   waf-samba.bbclass: add cross-answers option and files
> >
> >  ...1-waf-sanitize-and-fix-added-cross-answer.patch |  60 ++++++++
> >  ...-Adds-a-new-mode-to-samba-cross-compiling.patch | 112 +++++++++++++=
+
> >  ...-readability-of-cross-answers-generated-b.patch |  66 ++++++++
> >  ...wafsamba-CHECK_SIZEOF-cross-compile-frien.patch |  72 +++++++++
> >  .../0005-build-unify-and-fix-endian-tests.patch    | 169 +++++++++++++=
++++++++
> >  ...006-avoid-using-colon-in-the-checking-msg.patch |  32 ++++
> >  ...sing-of-cross-answers-file-in-case-answer.patch |  36 +++++
> >  .../recipes-connectivity/samba/samba_4.1.12.bb     |  16 +-
> >  .../libldb/{libldb_1.1.17.bb =3D> libldb_1.1.21.bb}  |   4 +-
> >  .../libtdb/{libtdb_1.3.0.bb =3D> libtdb_1.3.7.bb}    |   4 +-
> >  .../{libtevent_0.9.21.bb =3D> libtevent_0.9.25.bb}   |   4 +-
> >  .../talloc/{talloc_2.1.1.bb =3D> talloc_2.1.3.bb}    |  18 +--
> >  meta-oe/classes/waf-samba.bbclass                  |  43 +++++-
> >  meta-oe/conf/layer.conf                            |   1 +
> >  meta-oe/files/waf-cross-answers/README             |   3 +
> >  .../waf-cross-answers/cross-answers-aarch64.txt    |  38 +++++
> >  .../files/waf-cross-answers/cross-answers-arm.txt  |  39 +++++
> >  .../files/waf-cross-answers/cross-answers-i586.txt |  39 +++++
> >  .../files/waf-cross-answers/cross-answers-i686.txt |  39 +++++
> >  .../files/waf-cross-answers/cross-answers-mips.txt |  39 +++++
> >  .../waf-cross-answers/cross-answers-mips64.txt     |  38 +++++
> >  .../waf-cross-answers/cross-answers-powerpc.txt    |  39 +++++
> >  .../waf-cross-answers/cross-answers-powerpc64.txt  |  39 +++++
> >  .../waf-cross-answers/cross-answers-x86_64.txt     |  38 +++++
> >  24 files changed, 965 insertions(+), 23 deletions(-)
> >  create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.=
1.12/0001-waf-
> sanitize-and-fix-added-cross-answer.patch
> >  create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.=
1.12/0002-Adds-a-
> new-mode-to-samba-cross-compiling.patch
> >  create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.=
1.12/0003-waf-
> improve-readability-of-cross-answers-generated-b.patch
> >  create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.=
1.12/0004-build-make-
> wafsamba-CHECK_SIZEOF-cross-compile-frien.patch
> >  create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.=
1.12/0005-build-unify-
> and-fix-endian-tests.patch
> >  create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.=
1.12/0006-avoid-using-
> colon-in-the-checking-msg.patch
> >  create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.=
1.12/0007-waf-Fix-
> parsing-of-cross-answers-file-in-case-answer.patch
> >  rename meta-networking/recipes-support/libldb/{libldb_1.1.17.bb =3D> l=
ibldb_1.1.21.bb} (92%)
> >  rename meta-networking/recipes-support/libtdb/{libtdb_1.3.0.bb =3D> li=
btdb_1.3.7.bb} (87%)
> >  rename meta-networking/recipes-support/libtevent/{libtevent_0.9.21.bb =
=3D> libtevent_0.9.25.bb}
> (86%)
> >  rename meta-networking/recipes-support/talloc/{talloc_2.1.1.bb =3D> ta=
lloc_2.1.3.bb} (69%)
> >  create mode 100644 meta-oe/files/waf-cross-answers/README
> >  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-aarch=
64.txt
> >  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-arm.t=
xt
> >  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-i586.=
txt
> >  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-i686.=
txt
> >  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-mips.=
txt
> >  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-mips6=
4.txt
> >  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-power=
pc.txt
> >  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-power=
pc64.txt
> >  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-x86_6=
4.txt
> >
> --
> -Joe MacDonald.
> :wq

