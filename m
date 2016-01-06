Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8CC466E64A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jan 2016 09:03:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0693MoW001466
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Jan 2016 01:03:22 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.162]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Wed, 6 Jan 2016 01:03:22 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Thread-Topic: [oe] [meta-networking][PATCH 0/7 v2] waf-samba: fix build
	failure on targets unsupported by qemu
Thread-Index: AQHRLFY7YSjkKlOYPEeIbxltYzSiY57LtR3QgAGjPUCAIRDeEA==
Date: Wed, 6 Jan 2016 09:03:21 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010C786A4B@ALA-MBA.corp.ad.wrs.com>
References: <cover.1447910888.git.jackie.huang@windriver.com>
	<20151201163452.GB4384@mentor.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C76D493@ALA-MBA.corp.ad.wrs.com>
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA010C76D493@ALA-MBA.corp.ad.wrs.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.194]
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
X-List-Received-Date: Wed, 06 Jan 2016 09:03:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Huang, Jie (Jackie)
> Sent: Wednesday, December 16, 2015 4:25 PM
> To: Joe MacDonald
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-networking][PATCH 0/7 v2] waf-samba: fix build fa=
ilure on targets
> unsupported by qemu
>=20
>=20
>=20
> > -----Original Message-----
> > From: Huang, Jie (Jackie)
> > Sent: Tuesday, December 15, 2015 3:09 PM
> > To: 'Joe MacDonald'
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: RE: [oe] [meta-networking][PATCH 0/7 v2] waf-samba: fix build =
failure on targets
> > unsupported by qemu
> >
> >
> >
> > > -----Original Message-----
> > > From: Joe MacDonald [mailto:Joe_MacDonald@mentor.com]
> > > Sent: Wednesday, December 02, 2015 12:35 AM
> > > To: Huang, Jie (Jackie)
> > > Cc: openembedded-devel@lists.openembedded.org
> > > Subject: Re: [oe] [meta-networking][PATCH 0/7 v2] waf-samba: fix buil=
d failure on targets
> > > unsupported by qemu
> > >
> > > Hi Jackie,
> > >
> > > I tried pulling in this patch set from:
> > >
> > >    git://git.pokylinux.org/poky-contrib jhuang0/d_samba-rebase_151119=
-0
> > >
> > > and it quickly crashed into a patching error:
> > >
> > >    http://pastebin.com/k6f0M4c3
> > >
> > > Did you still want that branch considered for merging?
> >
> > Sorry for late response, yes we still want these be merged,
> > It's a month ago when I rebase these patches, I am not surprised
> > It fails to patch, I will rebase again and re-send.
>=20
> Hi Joe,
>=20
> I verified that these still work for me without rebasing, and
> from your pasted logs, it failed at patching:
> 05-fix-gecos-field-with-samlogon.patch
>=20
> which is not part of my fix, it was added along with samba 4.1.12
> recipe months ago, my patches were not started to patch yet :(
>=20
> So it should be some other things broke your builds, could you check
> again? Thanks!

After talloc is renamed to libtalloc, I rebased these and re-sent, please c=
heck.

Thanks,
Jackie

>=20
> Thanks,
> Jackie
>=20
> >
> > Thanks,
> > Jackie
> >
> > >
> > > -J.
> > >
> > > [[oe] [meta-networking][PATCH 0/7 v2] waf-samba: fix build failure on=
 targets unsupported by
> > qemu]
> > > On 15.11.19 (Thu 13:37) jackie.huang@windriver.com wrote:
> > >
> > > > From: Jackie Huang <jackie.huang@windriver.com>
> > > >
> > > > v2 comments:
> > > >
> > > > rebase since samba reladted packages are move to meta-networking
> > > > from meta-oe.
> > > >
> > > > Comments:
> > > >
> > > > samba and required packages started to use waf build
> > > > system since 4.x, and the waf bbclass use qemu user mode
> > > > to help configure checking by default, but not all targets
> > > > are supported by qemu user mode, so it definitely fail on those
> > > > targets (it failed on our fsl_t2xxx and cav-octeon3).
> > > >
> > > > The solution here it so use waf cross-answer mode to avoid
> > > > using qemu, but we need to prepare the cross-answers, it's
> > > > easy and error-prone if we try to get these cross-answers manually,
> > > > but fortunately, waf provides another mode to help generate
> > > > them in newer version, so upgrade related packages and
> > > > backport patches for samba (I also tried to upgrad samba
> > > > to 4.3.1, but it still doesn't work in my runtime testing
> > > > after some bug fixing, so I keep in the current version for
> > > > now, I may upgrade it sometime later if I get better understand
> > > > about the new version).
> > > >
> > > > Build tested on:
> > > >
> > > > intel-x86-64
> > > > qemux86
> > > > qemuarm
> > > > qemuarma9
> > > > qemuarm64
> > > > qemumips
> > > > qemumips64
> > > > fsl-ls20xx
> > > > fsl-t2xxx
> > > > xilinx-zynq
> > > > cav-octeon3
> > > >
> > > >
> > > > --
> > > > The following changes since commit ea319464b673cbf9a416b582dc4766fa=
eb998430:
> > > >
> > > >   vlc: add PACKAGECONFIG for samba, upnp, dvdnav, sftp, vorbis, dc1=
394, dv1394, svg, svgdec
> > (2015-
> > > 11-16 21:50:11 +0100)
> > > >
> > > > are available in the git repository at:
> > > >
> > > >   git://git.pokylinux.org/poky-contrib jhuang0/d_samba-rebase_15111=
9-0
> > > >   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Djhuang0/d=
_samba-rebase_151119-0
> > > >
> > > > Jackie Huang (7):
> > > >   libtdb: upgrade to 1.3.7
> > > >   libldb: upgrade to 1.1.21
> > > >   libtevent: upgrade to 0.9.25
> > > >   talloc: upgrade to 2.1.3
> > > >   samba: fix the incorrect tmpfiles installed directory
> > > >   samba: backport patches for cross-compiling
> > > >   waf-samba.bbclass: add cross-answers option and files
> > > >
> > > >  ...1-waf-sanitize-and-fix-added-cross-answer.patch |  60 ++++++++
> > > >  ...-Adds-a-new-mode-to-samba-cross-compiling.patch | 112 +++++++++=
+++++
> > > >  ...-readability-of-cross-answers-generated-b.patch |  66 ++++++++
> > > >  ...wafsamba-CHECK_SIZEOF-cross-compile-frien.patch |  72 +++++++++
> > > >  .../0005-build-unify-and-fix-endian-tests.patch    | 169 +++++++++=
++++++++++++
> > > >  ...006-avoid-using-colon-in-the-checking-msg.patch |  32 ++++
> > > >  ...sing-of-cross-answers-file-in-case-answer.patch |  36 +++++
> > > >  .../recipes-connectivity/samba/samba_4.1.12.bb     |  16 +-
> > > >  .../libldb/{libldb_1.1.17.bb =3D> libldb_1.1.21.bb}  |   4 +-
> > > >  .../libtdb/{libtdb_1.3.0.bb =3D> libtdb_1.3.7.bb}    |   4 +-
> > > >  .../{libtevent_0.9.21.bb =3D> libtevent_0.9.25.bb}   |   4 +-
> > > >  .../talloc/{talloc_2.1.1.bb =3D> talloc_2.1.3.bb}    |  18 +--
> > > >  meta-oe/classes/waf-samba.bbclass                  |  43 +++++-
> > > >  meta-oe/conf/layer.conf                            |   1 +
> > > >  meta-oe/files/waf-cross-answers/README             |   3 +
> > > >  .../waf-cross-answers/cross-answers-aarch64.txt    |  38 +++++
> > > >  .../files/waf-cross-answers/cross-answers-arm.txt  |  39 +++++
> > > >  .../files/waf-cross-answers/cross-answers-i586.txt |  39 +++++
> > > >  .../files/waf-cross-answers/cross-answers-i686.txt |  39 +++++
> > > >  .../files/waf-cross-answers/cross-answers-mips.txt |  39 +++++
> > > >  .../waf-cross-answers/cross-answers-mips64.txt     |  38 +++++
> > > >  .../waf-cross-answers/cross-answers-powerpc.txt    |  39 +++++
> > > >  .../waf-cross-answers/cross-answers-powerpc64.txt  |  39 +++++
> > > >  .../waf-cross-answers/cross-answers-x86_64.txt     |  38 +++++
> > > >  24 files changed, 965 insertions(+), 23 deletions(-)
> > > >  create mode 100644 meta-networking/recipes-connectivity/samba/samb=
a-4.1.12/0001-waf-
> > > sanitize-and-fix-added-cross-answer.patch
> > > >  create mode 100644 meta-networking/recipes-connectivity/samba/samb=
a-4.1.12/0002-Adds-a-
> > > new-mode-to-samba-cross-compiling.patch
> > > >  create mode 100644 meta-networking/recipes-connectivity/samba/samb=
a-4.1.12/0003-waf-
> > > improve-readability-of-cross-answers-generated-b.patch
> > > >  create mode 100644 meta-networking/recipes-connectivity/samba/samb=
a-4.1.12/0004-build-
> > make-
> > > wafsamba-CHECK_SIZEOF-cross-compile-frien.patch
> > > >  create mode 100644 meta-networking/recipes-connectivity/samba/samb=
a-4.1.12/0005-build-
> > unify-
> > > and-fix-endian-tests.patch
> > > >  create mode 100644 meta-networking/recipes-connectivity/samba/samb=
a-4.1.12/0006-avoid-
> > using-
> > > colon-in-the-checking-msg.patch
> > > >  create mode 100644 meta-networking/recipes-connectivity/samba/samb=
a-4.1.12/0007-waf-Fix-
> > > parsing-of-cross-answers-file-in-case-answer.patch
> > > >  rename meta-networking/recipes-support/libldb/{libldb_1.1.17.bb =
=3D> libldb_1.1.21.bb} (92%)
> > > >  rename meta-networking/recipes-support/libtdb/{libtdb_1.3.0.bb =3D=
> libtdb_1.3.7.bb} (87%)
> > > >  rename meta-networking/recipes-support/libtevent/{libtevent_0.9.21=
.bb =3D>
> libtevent_0.9.25.bb}
> > > (86%)
> > > >  rename meta-networking/recipes-support/talloc/{talloc_2.1.1.bb =3D=
> talloc_2.1.3.bb} (69%)
> > > >  create mode 100644 meta-oe/files/waf-cross-answers/README
> > > >  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-a=
arch64.txt
> > > >  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-a=
rm.txt
> > > >  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-i=
586.txt
> > > >  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-i=
686.txt
> > > >  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-m=
ips.txt
> > > >  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-m=
ips64.txt
> > > >  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-p=
owerpc.txt
> > > >  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-p=
owerpc64.txt
> > > >  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-x=
86_64.txt
> > > >
> > > --
> > > -Joe MacDonald.
> > > :wq
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

