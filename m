Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 016D06093C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 08:13:38 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id l132so20654401wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 01:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=8p3CFs2tNRr4amX+98iDo2mVQ2iLyrmDPTeH/QFbuUs=;
	b=gJQN6idIka5OHi80VrKT6S1d+ssFBfBPLpxy9KtCOf6zjcd5mTzhXInzRlw/2Zk4M+
	0gOowr1Cnj+gxqCYQ/1kvKERUr2JZMe3sQBfGtH2CHNRszTaWQtnzipy1IcZF285N9i5
	lJez6eMKg5hR5grhjlJ8Y/vz0RfShF/jukVU4k9uyqP0WIN9zDOry7JroNw8ei3A+tyb
	nCUiWLNEccmYEaGRV57uNhJYCX5K0wtSTjfV1iC5qbOvSaKFa8XR3cPdnmA0UL23Zr1N
	5eR3rgPosW+gQy9khkHzCPnZE3CXQTcioQOihM6cCE91kOzlBbOFoFWa9zZS/M8bCLrj
	2gCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=8p3CFs2tNRr4amX+98iDo2mVQ2iLyrmDPTeH/QFbuUs=;
	b=daH4Jn81JVIQIlaZpkMs74RUeVjEsDXIOypVadHy0fFK8iZXux6ewyMD1ZQouK0/xQ
	noLE8zKe8JUmfGKrrX4Yomh42nMNmxk6LxAHhDVR36f6sTCtIjuaJiaaTnmpKp9cppru
	mm/ggeMshtP1a3ZhvTT+8bM6mEFlN1hSL2Q5LEktxYDCb3Bhr31bP0Ut+V8JdOc6L12u
	Ux+SBQbrVXt0n5GBEYheDk1/EB2+Wqlri+GHOdC1RHhgxaFMnQctTOZfa7pRq9nRWgIs
	VMwbo+MfuC27Hx0PIHs5yu9QNDCJeLNmTN5V+AyQb4ZWUeL++Gy2NSWgnOfC3z8LfaRh
	s0Fg==
X-Gm-Message-State: AE9vXwPeqNEDCAqLLLsOpLWnD3VDdRjAX+lh7nRcaD62AKsaAyfVohnx6XU+q81hygnFDQIi0itUmEEc3z3Ouw==
X-Received: by 10.28.54.193 with SMTP id y62mr1928525wmh.96.1474359218993;
	Tue, 20 Sep 2016 01:13:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.130.68 with HTTP; Tue, 20 Sep 2016 01:13:38 -0700 (PDT)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA013A2D27EC@ALA-MBA.corp.ad.wrs.com>
References: <cover.1474348826.git.jackie.huang@windriver.com>
	<3eedb5bcccfc787f9673143098f394efa6ae6124.1474348826.git.jackie.huang@windriver.com>
	<20160920064630.GA3461@jama>
	<1B858668EC6A94408DCA5225FDFA85AA013A2D27EC@ALA-MBA.corp.ad.wrs.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 20 Sep 2016 10:13:38 +0200
Message-ID: <CA+chaQd+N5buESNmhYZaSrBR_0PshAajQgXm6sqVFzZnDeenGQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Tue, 20 Sep 2016 08:13:39 -0000
Content-Type: text/plain; charset=UTF-8

something like:
PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind,"


On Tue, Sep 20, 2016 at 9:32 AM, Huang, Jie (Jackie) <
Jackie.Huang@windriver.com> wrote:

>
>
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org [mailto:
> openembedded-devel-
> > bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> > Sent: Tuesday, September 20, 2016 2:47 PM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-networking][PATCH 1/4] libtalloc: fixes for
> deterministic builds
> >
> > On Tue, Sep 20, 2016 at 01:42:23PM +0800, jackie.huang@windriver.com
> wrote:
> > > From: Jackie Huang <jackie.huang@windriver.com>
> > >
> > > * Add configure option and PACKAGECONFIG for
> > >   the following packages:
> > >   - acl
> > >   - attr
> > >   - libaio
> > >   - libcap
> > >   - valgrind
> > >
> > > * They are all optional, so disable by default
> > >   or control them based on DISTRO_FEATURES.
> > >
> > > * Remove the direct dependency on libaio
> > >
> > > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > > ---
> > >  ...talloc-Add-configure-options-for-packages.patch | 124
> +++++++++++++++++++++
> > >  .../recipes-support/libtalloc/libtalloc_2.1.8.bb   |  16 ++-
> > >  2 files changed, 137 insertions(+), 3 deletions(-)
> > >  create mode 100644 meta-networking/recipes-
> support/libtalloc/libtalloc/talloc-Add-configure-
> > options-for-packages.patch
> > >
> > > diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/
> talloc-Add-configure-options-for-
> > packages.patch b/meta-networking/recipes-support/libtalloc/libtalloc/
> talloc-Add-configure-
> > options-for-packages.patch
> > > new file mode 100644
> > > index 0000000..d383df4
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-support/libtalloc/libtalloc/
> talloc-Add-configure-options-for-
> > packages.patch
> > > @@ -0,0 +1,124 @@
> > > +From 77fd757624c9b20073a7abefaca8382caa4fd376 Mon Sep 17 00:00:00
> 2001
> > > +From: Jackie Huang <jackie.huang@windriver.com>
> > > +Date: Wed, 14 Sep 2016 11:11:35 +0800
> > > +Subject: [PATCH] talloc: Add configure options for packages
> > > +
> > > +Add configure options for the following packages:
> > > + - acl
> > > + - attr
> > > + - libaio
> > > + - libcap
> > > + - valgrind
> > > +
> > > +Upstream-Status: Inappropriate [oe deterministic build specific]
> > > +
> > > +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > > +---
> > > + lib/replace/system/wscript_configure |  6 ++++-
> > > + lib/replace/wscript                  | 43
> +++++++++++++++++++++++++++++++-----
> > > + wscript                              |  4 ++++
> > > + 3 files changed, 46 insertions(+), 7 deletions(-)
> > > +
> > > +diff --git a/lib/replace/system/wscript_configure
> b/lib/replace/system/wscript_configure
> > > +index 2035474..10f9ae7 100644
> > > +--- a/lib/replace/system/wscript_configure
> > > ++++ b/lib/replace/system/wscript_configure
> > > +@@ -1,6 +1,10 @@
> > > + #!/usr/bin/env python
> > > +
> > > +-conf.CHECK_HEADERS('sys/capability.h')
> > > ++import Options
> > > ++
> > > ++if Options.options.enable_libcap:
> > > ++    conf.CHECK_HEADERS('sys/capability.h')
> > > ++
> > > + conf.CHECK_FUNCS('getpwnam_r getpwuid_r getpwent_r')
> > > +
> > > + # solaris varients of getXXent_r
> > > +diff --git a/lib/replace/wscript b/lib/replace/wscript
> > > +index fc43e1a..a899dd2 100644
> > > +--- a/lib/replace/wscript
> > > ++++ b/lib/replace/wscript
> > > +@@ -23,6 +23,22 @@ def set_options(opt):
> > > +     opt.PRIVATE_EXTENSION_DEFAULT('')
> > > +     opt.RECURSE('buildtools/wafsamba')
> > > +
> > > ++    opt.add_option('--with-acl',
> > > ++                   help=("Enable use of acl"),
> > > ++                   action="store_true", dest='enable_acl',
> default=False)
> > > ++
> > > ++    opt.add_option('--with-attr',
> > > ++                   help=("Enable use of attr"),
> > > ++                   action="store_true", dest='enable_attr',
> default=False)
> > > ++
> > > ++    opt.add_option('--with-libaio',
> > > ++                   help=("Enable use of libaio"),
> > > ++                   action="store_true", dest='enable_libaio',
> default=False)
> > > ++
> > > ++    opt.add_option('--with-libcap',
> > > ++                   help=("Enable use of libcap"),
> > > ++                   action="store_true", dest='enable_libcap',
> default=False)
> > > ++
> > > + @Utils.run_once
> > > + def configure(conf):
> > > +     conf.RECURSE('buildtools/wafsamba')
> > > +@@ -32,12 +48,25 @@ def configure(conf):
> > > +     conf.DEFINE('HAVE_LIBREPLACE', 1)
> > > +     conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
> > > +
> > > +-    conf.CHECK_HEADERS('linux/types.h crypt.h locale.h acl/libacl.h
> compat.h')
> > > +-    conf.CHECK_HEADERS('acl/libacl.h attr/xattr.h compat.h ctype.h
> dustat.h')
> > > ++    conf.CHECK_HEADERS('linux/types.h crypt.h locale.h compat.h')
> > > ++    conf.CHECK_HEADERS('compat.h ctype.h dustat.h')
> > > +     conf.CHECK_HEADERS('fcntl.h fnmatch.h glob.h history.h krb5.h
> langinfo.h')
> > > +-    conf.CHECK_HEADERS('libaio.h locale.h ndir.h pwd.h')
> > > +-    conf.CHECK_HEADERS('shadow.h sys/acl.h')
> > > +-    conf.CHECK_HEADERS('sys/attributes.h attr/attributes.h
> sys/capability.h sys/dir.h sys/epoll.h')
> > > ++    conf.CHECK_HEADERS('locale.h ndir.h pwd.h')
> > > ++    conf.CHECK_HEADERS('shadow.h')
> > > ++    conf.CHECK_HEADERS('sys/attributes.h sys/dir.h sys/epoll.h')
> > > ++
> > > ++    if Options.options.enable_acl:
> > > ++        conf.CHECK_HEADERS('acl/libacl.h sys/acl.h')
> > > ++
> > > ++    if Options.options.enable_attr:
> > > ++        conf.CHECK_HEADERS('attr/attributes.h attr/xattr.h')
> > > ++
> > > ++    if Options.options.enable_libaio:
> > > ++        conf.CHECK_HEADERS('libaio.h')
> > > ++
> > > ++    if Options.options.enable_libcap:
> > > ++        conf.CHECK_HEADERS('sys/capability.h')
> > > ++
> > > +     conf.CHECK_HEADERS('port.h')
> > > +     conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h
> sys/fs/s5param.h sys/fs/vx/quota.h')
> > > +     conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h
> sys/mode.h sys/ndir.h
> > sys/priv.h')
> > > +@@ -73,7 +102,9 @@ def configure(conf):
> > > +
> > > +     conf.CHECK_CODE('', headers='rpc/rpc.h rpcsvc/yp_prot.h',
> define='HAVE_RPCSVC_YP_PROT_H')
> > > +
> > > +-    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h
> valgrind/memcheck.h')
> > > ++    if Options.options.enable_valgrind:
> > > ++        conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h
> valgrind/memcheck.h')
> > > ++
> > > +     conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
> > > +     conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h
> sys/cdefs.h')
> > > +     conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
> > > +diff --git a/wscript b/wscript
> > > +index 41f3be7..f900c24 100644
> > > +--- a/wscript
> > > ++++ b/wscript
> > > +@@ -35,6 +35,10 @@ def set_options(opt):
> > > +         opt.add_option('--disable-python',
> > > +                        help=("disable the pytalloc module"),
> > > +                        action="store_true", dest='disable_python',
> default=False)
> > > ++        opt.add_option('--with-valgrind',
> > > ++                       help=("enable use of valgrind"),
> > > ++                       action="store_true", dest='enable_valgrind',
> default=False)
> > > ++
> > > +
> > > +
> > > + def configure(conf):
> > > +--
> > > +2.8.3
> > > +
> > > diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.
> 1.8.bb b/meta-
> > networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
> > > index 7c85ab3..8b2ae33 100644
> > > --- a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
> > > +++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
> > > @@ -3,9 +3,11 @@ HOMEPAGE = "http://talloc.samba.org"
> > >  SECTION = "libs"
> > >  LICENSE = "LGPL-3.0+ & GPL-3.0+"
> > >
> > > -DEPENDS += "libaio libbsd"
> > > +DEPENDS += "libbsd"
> > >
> > > -SRC_URI = "http://samba.org/ftp/talloc/talloc-${PV}.tar.gz"
> > > +SRC_URI = "http://samba.org/ftp/talloc/talloc-${PV}.tar.gz \
> > > +           file://talloc-Add-configure-options-for-packages.patch \
> > > +"
> > >  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/
> files/common-licenses/LGPL-
> > 3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
> > >                      file://${COREBASE}/meta/files/
> common-licenses/GPL-
> > 3.0;md5=c79ff39f19dfec6d293b95dea7b07891"
> >
> > I know you haven't changed this, but
> >
> > This is wrong, we should use some files in talloc source, not
> > common-license.
>
> Yes, I will fix this as follow-up.
>
> >
> > >
> > > @@ -15,7 +17,15 @@ SRC_URI[sha256sum] =
> > "22d14911164d4de67ff76b5269fa5250d01f78c955bc77e28615350996
> > >
> > >  inherit waf-samba
> > >
> > > -PACKAGECONFIG[attr] = ",,attr"
> > > +PACKAGECONFIG ??= "\
> > > +    ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
> > > +    ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}
> \
> > > +"
> > > +PACKAGECONFIG[acl] = "--with-acl,,acl"
> > > +PACKAGECONFIG[attr] = "--with-attr,,attr"
> > > +PACKAGECONFIG[libaio] = "--with-libaio,,libaio,"
> > > +PACKAGECONFIG[libcap] = "--with-libcap,,libcap,"
> > > +PACKAGECONFIG[valgrind] = "--with-valgrind,,valgrind,"
> >
> > What about disable options for clarity?
>
> Do you mean something like:
> PACKAGECONFIG[valgrind] = ",--disable-valgrind,valgrind,"
>
> Thanks,
> Jackie
>
> >
> > >
> > >  SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'attr', '',
> 'file://avoid-attr-unless-
> > wanted.patch', d)}"
> > >
> > > --
> > > 2.8.3
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

