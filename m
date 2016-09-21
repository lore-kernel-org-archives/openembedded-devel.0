Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AC91C6080F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 00:51:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8L0pBN0029200
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 17:51:12 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.129]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0294.000;
	Tue, 20 Sep 2016 17:51:10 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH 1/4] libtalloc: fixes for
	deterministic builds
Thread-Index: AQHSEwrX03pbgyKyPkGpIFn0sZSpIaCB+fJAgACDGACAAJ1L8A==
Date: Wed, 21 Sep 2016 00:51:09 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA013A2D3698@ALA-MBA.corp.ad.wrs.com>
References: <cover.1474348826.git.jackie.huang@windriver.com>
	<3eedb5bcccfc787f9673143098f394efa6ae6124.1474348826.git.jackie.huang@windriver.com>
	<20160920064630.GA3461@jama>
	<1B858668EC6A94408DCA5225FDFA85AA013A2D27EC@ALA-MBA.corp.ad.wrs.com>
	<CA+chaQd+N5buESNmhYZaSrBR_0PshAajQgXm6sqVFzZnDeenGQ@mail.gmail.com>
In-Reply-To: <CA+chaQd+N5buESNmhYZaSrBR_0PshAajQgXm6sqVFzZnDeenGQ@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.131]
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCH 1/4] libtalloc: fixes for deterministic builds
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
X-List-Received-Date: Wed, 21 Sep 2016 00:51:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Tuesday, September 20, 2016 4:14 PM
> To: openembedded-devel
> Subject: Re: [oe] [meta-networking][PATCH 1/4] libtalloc: fixes for deter=
ministic builds
>=20
> something like:
> PACKAGECONFIG[valgrind] =3D "--with-valgrind,--without-valgrind,valgrind,=
"

That's what I wanted as well, but there is not an implicit option "--withou=
t-pkg" when
"--with-pkg" is added, we have to explicitly add both of them, which I thou=
ght may not
be necessary.

It's definitely more clear, so I will add them as suggested in v2.

Thanks,
Jackie

>=20
>=20
> On Tue, Sep 20, 2016 at 9:32 AM, Huang, Jie (Jackie) <
> Jackie.Huang@windriver.com> wrote:
>=20
> >
> >
> > > -----Original Message-----
> > > From: openembedded-devel-bounces@lists.openembedded.org [mailto:
> > openembedded-devel-
> > > bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> > > Sent: Tuesday, September 20, 2016 2:47 PM
> > > To: openembedded-devel@lists.openembedded.org
> > > Subject: Re: [oe] [meta-networking][PATCH 1/4] libtalloc: fixes for
> > deterministic builds
> > >
> > > On Tue, Sep 20, 2016 at 01:42:23PM +0800, jackie.huang@windriver.com
> > wrote:
> > > > From: Jackie Huang <jackie.huang@windriver.com>
> > > >
> > > > * Add configure option and PACKAGECONFIG for
> > > >   the following packages:
> > > >   - acl
> > > >   - attr
> > > >   - libaio
> > > >   - libcap
> > > >   - valgrind
> > > >
> > > > * They are all optional, so disable by default
> > > >   or control them based on DISTRO_FEATURES.
> > > >
> > > > * Remove the direct dependency on libaio
> > > >
> > > > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > > > ---
> > > >  ...talloc-Add-configure-options-for-packages.patch | 124
> > +++++++++++++++++++++
> > > >  .../recipes-support/libtalloc/libtalloc_2.1.8.bb   |  16 ++-
> > > >  2 files changed, 137 insertions(+), 3 deletions(-)
> > > >  create mode 100644 meta-networking/recipes-
> > support/libtalloc/libtalloc/talloc-Add-configure-
> > > options-for-packages.patch
> > > >
> > > > diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/
> > talloc-Add-configure-options-for-
> > > packages.patch b/meta-networking/recipes-support/libtalloc/libtalloc/
> > talloc-Add-configure-
> > > options-for-packages.patch
> > > > new file mode 100644
> > > > index 0000000..d383df4
> > > > --- /dev/null
> > > > +++ b/meta-networking/recipes-support/libtalloc/libtalloc/
> > talloc-Add-configure-options-for-
> > > packages.patch
> > > > @@ -0,0 +1,124 @@
> > > > +From 77fd757624c9b20073a7abefaca8382caa4fd376 Mon Sep 17 00:00:00
> > 2001
> > > > +From: Jackie Huang <jackie.huang@windriver.com>
> > > > +Date: Wed, 14 Sep 2016 11:11:35 +0800
> > > > +Subject: [PATCH] talloc: Add configure options for packages
> > > > +
> > > > +Add configure options for the following packages:
> > > > + - acl
> > > > + - attr
> > > > + - libaio
> > > > + - libcap
> > > > + - valgrind
> > > > +
> > > > +Upstream-Status: Inappropriate [oe deterministic build specific]
> > > > +
> > > > +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > > > +---
> > > > + lib/replace/system/wscript_configure |  6 ++++-
> > > > + lib/replace/wscript                  | 43
> > +++++++++++++++++++++++++++++++-----
> > > > + wscript                              |  4 ++++
> > > > + 3 files changed, 46 insertions(+), 7 deletions(-)
> > > > +
> > > > +diff --git a/lib/replace/system/wscript_configure
> > b/lib/replace/system/wscript_configure
> > > > +index 2035474..10f9ae7 100644
> > > > +--- a/lib/replace/system/wscript_configure
> > > > ++++ b/lib/replace/system/wscript_configure
> > > > +@@ -1,6 +1,10 @@
> > > > + #!/usr/bin/env python
> > > > +
> > > > +-conf.CHECK_HEADERS('sys/capability.h')
> > > > ++import Options
> > > > ++
> > > > ++if Options.options.enable_libcap:
> > > > ++    conf.CHECK_HEADERS('sys/capability.h')
> > > > ++
> > > > + conf.CHECK_FUNCS('getpwnam_r getpwuid_r getpwent_r')
> > > > +
> > > > + # solaris varients of getXXent_r
> > > > +diff --git a/lib/replace/wscript b/lib/replace/wscript
> > > > +index fc43e1a..a899dd2 100644
> > > > +--- a/lib/replace/wscript
> > > > ++++ b/lib/replace/wscript
> > > > +@@ -23,6 +23,22 @@ def set_options(opt):
> > > > +     opt.PRIVATE_EXTENSION_DEFAULT('')
> > > > +     opt.RECURSE('buildtools/wafsamba')
> > > > +
> > > > ++    opt.add_option('--with-acl',
> > > > ++                   help=3D("Enable use of acl"),
> > > > ++                   action=3D"store_true", dest=3D'enable_acl',
> > default=3DFalse)
> > > > ++
> > > > ++    opt.add_option('--with-attr',
> > > > ++                   help=3D("Enable use of attr"),
> > > > ++                   action=3D"store_true", dest=3D'enable_attr',
> > default=3DFalse)
> > > > ++
> > > > ++    opt.add_option('--with-libaio',
> > > > ++                   help=3D("Enable use of libaio"),
> > > > ++                   action=3D"store_true", dest=3D'enable_libaio',
> > default=3DFalse)
> > > > ++
> > > > ++    opt.add_option('--with-libcap',
> > > > ++                   help=3D("Enable use of libcap"),
> > > > ++                   action=3D"store_true", dest=3D'enable_libcap',
> > default=3DFalse)
> > > > ++
> > > > + @Utils.run_once
> > > > + def configure(conf):
> > > > +     conf.RECURSE('buildtools/wafsamba')
> > > > +@@ -32,12 +48,25 @@ def configure(conf):
> > > > +     conf.DEFINE('HAVE_LIBREPLACE', 1)
> > > > +     conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
> > > > +
> > > > +-    conf.CHECK_HEADERS('linux/types.h crypt.h locale.h acl/libacl=
.h
> > compat.h')
> > > > +-    conf.CHECK_HEADERS('acl/libacl.h attr/xattr.h compat.h ctype.=
h
> > dustat.h')
> > > > ++    conf.CHECK_HEADERS('linux/types.h crypt.h locale.h compat.h')
> > > > ++    conf.CHECK_HEADERS('compat.h ctype.h dustat.h')
> > > > +     conf.CHECK_HEADERS('fcntl.h fnmatch.h glob.h history.h krb5.h
> > langinfo.h')
> > > > +-    conf.CHECK_HEADERS('libaio.h locale.h ndir.h pwd.h')
> > > > +-    conf.CHECK_HEADERS('shadow.h sys/acl.h')
> > > > +-    conf.CHECK_HEADERS('sys/attributes.h attr/attributes.h
> > sys/capability.h sys/dir.h sys/epoll.h')
> > > > ++    conf.CHECK_HEADERS('locale.h ndir.h pwd.h')
> > > > ++    conf.CHECK_HEADERS('shadow.h')
> > > > ++    conf.CHECK_HEADERS('sys/attributes.h sys/dir.h sys/epoll.h')
> > > > ++
> > > > ++    if Options.options.enable_acl:
> > > > ++        conf.CHECK_HEADERS('acl/libacl.h sys/acl.h')
> > > > ++
> > > > ++    if Options.options.enable_attr:
> > > > ++        conf.CHECK_HEADERS('attr/attributes.h attr/xattr.h')
> > > > ++
> > > > ++    if Options.options.enable_libaio:
> > > > ++        conf.CHECK_HEADERS('libaio.h')
> > > > ++
> > > > ++    if Options.options.enable_libcap:
> > > > ++        conf.CHECK_HEADERS('sys/capability.h')
> > > > ++
> > > > +     conf.CHECK_HEADERS('port.h')
> > > > +     conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h
> > sys/fs/s5param.h sys/fs/vx/quota.h')
> > > > +     conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h
> > sys/mode.h sys/ndir.h
> > > sys/priv.h')
> > > > +@@ -73,7 +102,9 @@ def configure(conf):
> > > > +
> > > > +     conf.CHECK_CODE('', headers=3D'rpc/rpc.h rpcsvc/yp_prot.h',
> > define=3D'HAVE_RPCSVC_YP_PROT_H')
> > > > +
> > > > +-    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h
> > valgrind/memcheck.h')
> > > > ++    if Options.options.enable_valgrind:
> > > > ++        conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h
> > valgrind/memcheck.h')
> > > > ++
> > > > +     conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
> > > > +     conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h
> > sys/cdefs.h')
> > > > +     conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
> > > > +diff --git a/wscript b/wscript
> > > > +index 41f3be7..f900c24 100644
> > > > +--- a/wscript
> > > > ++++ b/wscript
> > > > +@@ -35,6 +35,10 @@ def set_options(opt):
> > > > +         opt.add_option('--disable-python',
> > > > +                        help=3D("disable the pytalloc module"),
> > > > +                        action=3D"store_true", dest=3D'disable_pyt=
hon',
> > default=3DFalse)
> > > > ++        opt.add_option('--with-valgrind',
> > > > ++                       help=3D("enable use of valgrind"),
> > > > ++                       action=3D"store_true", dest=3D'enable_valg=
rind',
> > default=3DFalse)
> > > > ++
> > > > +
> > > > +
> > > > + def configure(conf):
> > > > +--
> > > > +2.8.3
> > > > +
> > > > diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.
> > 1.8.bb b/meta-
> > > networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
> > > > index 7c85ab3..8b2ae33 100644
> > > > --- a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
> > > > +++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
> > > > @@ -3,9 +3,11 @@ HOMEPAGE =3D "http://talloc.samba.org"
> > > >  SECTION =3D "libs"
> > > >  LICENSE =3D "LGPL-3.0+ & GPL-3.0+"
> > > >
> > > > -DEPENDS +=3D "libaio libbsd"
> > > > +DEPENDS +=3D "libbsd"
> > > >
> > > > -SRC_URI =3D "http://samba.org/ftp/talloc/talloc-${PV}.tar.gz"
> > > > +SRC_URI =3D "http://samba.org/ftp/talloc/talloc-${PV}.tar.gz \
> > > > +           file://talloc-Add-configure-options-for-packages.patch =
\
> > > > +"
> > > >  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/
> > files/common-licenses/LGPL-
> > > 3.0;md5=3Dbfccfe952269fff2b407dd11f2f3083b \
> > > >                      file://${COREBASE}/meta/files/
> > common-licenses/GPL-
> > > 3.0;md5=3Dc79ff39f19dfec6d293b95dea7b07891"
> > >
> > > I know you haven't changed this, but
> > >
> > > This is wrong, we should use some files in talloc source, not
> > > common-license.
> >
> > Yes, I will fix this as follow-up.
> >
> > >
> > > >
> > > > @@ -15,7 +17,15 @@ SRC_URI[sha256sum] =3D
> > > "22d14911164d4de67ff76b5269fa5250d01f78c955bc77e28615350996
> > > >
> > > >  inherit waf-samba
> > > >
> > > > -PACKAGECONFIG[attr] =3D ",,attr"
> > > > +PACKAGECONFIG ??=3D "\
> > > > +    ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} =
\
> > > > +    ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d=
)}
> > \
> > > > +"
> > > > +PACKAGECONFIG[acl] =3D "--with-acl,,acl"
> > > > +PACKAGECONFIG[attr] =3D "--with-attr,,attr"
> > > > +PACKAGECONFIG[libaio] =3D "--with-libaio,,libaio,"
> > > > +PACKAGECONFIG[libcap] =3D "--with-libcap,,libcap,"
> > > > +PACKAGECONFIG[valgrind] =3D "--with-valgrind,,valgrind,"
> > >
> > > What about disable options for clarity?
> >
> > Do you mean something like:
> > PACKAGECONFIG[valgrind] =3D ",--disable-valgrind,valgrind,"
> >
> > Thanks,
> > Jackie
> >
> > >
> > > >
> > > >  SRC_URI +=3D "${@bb.utils.contains('PACKAGECONFIG', 'attr', '',
> > 'file://avoid-attr-unless-
> > > wanted.patch', d)}"
> > > >
> > > > --
> > > > 2.8.3
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

