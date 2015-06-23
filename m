Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2D84373772
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jun 2015 08:05:28 +0000 (UTC)
Received: by wguu7 with SMTP id u7so2242453wgu.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jun 2015 01:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=6R74K1XFJq0DUMQeBuypV5Gr5ylKQKpZX4nT8OjgwNw=;
	b=QUZ8mIOAzQYabmTqax8MV7suRw355jhm4tQIvF80+4LFj6EXfkVRuDcjS+U8M4k6ez
	vlAKSVWg0i0uWJrQH5CgdIXNPWOhJ8jGGvPXyWPifeEl3plPzq5Enns8K4mgWcNvYpJY
	VjQm18Oo05XBqzgg33/OTB2Pt987o2/uAVEcTB1bfX8wJQl2WubBfj8I7n2afhFRlQMz
	iIRDT2pZIf1EXHnHRQPZml0yQNxigivX1AKS/YRmO+yMVUFphuRS86301zdRwxb/BJBy
	56O8RocEZe0+X+jU+BFDbUI0/5a5x/EnGXEqDh4JXM4QekxcJ6L29Gu4M1E2AHY+1suv
	bgvQ==
MIME-Version: 1.0
X-Received: by 10.180.7.199 with SMTP id l7mr1097664wia.28.1435046728577; Tue,
	23 Jun 2015 01:05:28 -0700 (PDT)
Received: by 10.28.167.2 with HTTP; Tue, 23 Jun 2015 01:05:28 -0700 (PDT)
In-Reply-To: <30DC4EDFD798C94083F3E083754532CC73E10A6B@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1434527353-47017-1-git-send-email-biannm@cn.fujitsu.com>
	<1434527353-47017-4-git-send-email-biannm@cn.fujitsu.com>
	<20150619155637.GA2398@jama>
	<30DC4EDFD798C94083F3E083754532CC73E10A6B@G08CNEXMBPEKD02.g08.fujitsu.local>
Date: Tue, 23 Jun 2015 10:05:28 +0200
Message-ID: <CA+chaQcK+DoksMSVKpFRQzze58CLihk1LEnH0Pn+J-n3rY_DUw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v2 3/7] libldb: add new recipe
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
X-List-Received-Date: Tue, 23 Jun 2015 08:05:30 -0000
Content-Type: text/plain; charset=UTF-8

I don't have access to that build anymore (because it's jenkins job using
tmpfs for TMPDIR, so after the build the TMPDIR is gone), but it's failing
only in qemux86-64 builds, so I assume that it's finding host tdb or python
directories, because it's running on 12.04 Ubuntu x86-64.

Try to install tdb on your build host if it allows you to reproduce the
issue, otherwise I'll try to reproduce it again in some next jenkins build.

On Tue, Jun 23, 2015 at 7:47 AM, Bian, Naimeng <biannm@cn.fujitsu.com>
wrote:

> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> > Martin Jansa
> > Sent: Friday, June 19, 2015 11:57 PM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH v2 3/7] libldb: add new recipe
> >
> > On Wed, Jun 17, 2015 at 03:49:09PM +0800, Bian Naimeng wrote:
> > > libldb is required by samba4
> > >
> > > Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> > > ---
> > >  .../do-not-import-target-module-in-configure.patch | 32
> +++++++++++++++
> > >  meta-oe/recipes-support/libldb/libldb_1.1.17.bb    | 45
> > ++++++++++++++++++++++
> > >  2 files changed, 77 insertions(+)
> > >  create mode 100644
> > > meta-oe/recipes-support/libldb/libldb/do-not-import-target-module-in-c
> > > onfigure.patch  create mode 100644
> > > meta-oe/recipes-support/libldb/libldb_1.1.17.bb
> >
> > Fails to build in bitbake world:
> >
> > | Checking for system tdb >=
> > 1.2.13                                                 : yes
> > | ERROR: Python module pytdb of version 1.2.13 not found, and bundling
> > | disabled
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Function failed: do_configure (log file is located at
> > | /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/libld
> > | b/1.1.17-r0/temp/log.do_configure.22697)
> > NOTE: recipe libldb-1.1.17-r0: task do_configure: Failed
> > ERROR: Task 25505
> >
> (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support
> > /libldb/libldb_1.1.17.bb, do_configure) failed with exit code '1'
> >
>
> tdb.so is provided by libtdb which is DEPEND-ed by libldb, I think it
> should be installed into
> STAGING_DIR_HOST/PYTHON_SITEPACKAGES_DIR.
>
> Because I could not reproduce it in my building, would you mind telling me
> whether does tdb.so exist
> in STAGING_DIR_HOST/PYTHON_SITEPACKAGES_DIR/ while this error was caught.
>
> Thanks
>  Bian
>
> > > diff --git
> > > a/meta-oe/recipes-support/libldb/libldb/do-not-import-target-module-in
> > > -configure.patch
> > > b/meta-oe/recipes-support/libldb/libldb/do-not-import-target-module-in
> > > -configure.patch
> > > new file mode 100644
> > > index 0000000..b4d522a
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/libldb/libldb/do-not-import-target-modul
> > > +++ e-in-configure.patch
> > > @@ -0,0 +1,32 @@
> > > +Some module can be loaded while cross compile, we jst check whether
> > > +the module exist
> > > +
> > > +Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> > > +
> > > +--- ldb-1.1.17.orig/buildtools/wafsamba/samba_bundled.py   2014-05-05
> > 17:00:41.000000000 +0900
> > > ++++ ldb-1.1.17/buildtools/wafsamba/samba_bundled.py        2015-06-15
> > 10:09:50.210000217 +0900
> > > +@@ -1,7 +1,7 @@
> > > + # functions to support bundled libraries
> > > +
> > > + from Configure import conf
> > > +-import sys, Logs
> > > ++import sys, Logs, imp
> > > + from samba_utils import *
> > > +
> > > + def PRIVATE_NAME(bld, name, private_extension, private_library):
> > > +@@ -222,6 +222,16 @@ def CHECK_BUNDLED_SYSTEM_PYTHON(conf, li
> > > +         m = __import__(modulename)
> > > +     except ImportError:
> > > +         found = False
> > > ++
> > > ++        build_arch = os.environ["BUILD_ARCH"]
> > > ++        host_arch = os.environ["HOST_ARCH"]
> > > ++        if build_arch != host_arch:
> > > ++            # Some modules maybe can not be imported while cross
> compile
> > > ++            # We just check whether the module exist
> > > ++            stuff = imp.find_module(modulename,
> > [os.environ["PYTHONPATH"]])
> > > ++            if stuff != None:
> > > ++                Logs.warn('Cross module[%s] has been found, but can
> not
> > be loaded.' % (stuff[1]))
> > > ++                found = True
> > > +     else:
> > > +         try:
> > > +             version = m.__version__
> > > diff --git a/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
> > > b/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
> > > new file mode 100644
> > > index 0000000..17607f7
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
> > > @@ -0,0 +1,45 @@
> > > +SUMMARY = "Hierarchical, reference counted memory pool system with
> > destructors"
> > > +HOMEPAGE = "http://ldb.samba.org"
> > > +SECTION = "libs"
> > > +LICENSE = "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
> > > +
> > > +DEPENDS += "libtdb talloc libtevent libtdb"
> > > +RDEPENDS_${PN} += "libtevent popt libtalloc"
> > > +RDEPENDS_pyldb += "python libtdb libtalloc"
> > > +
> > > +SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
> > > +           file://do-not-import-target-module-in-configure.patch"
> > > +
> > > +LIC_FILES_CHKSUM =
> >
> "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269ff
> > f2b407dd11f2f3083b \
> > > +
> >
> file://${COREBASE}/meta/files/common-licenses/LGPL-2.1;md5=1a6d268fd218675
> > ffea8be556788b780 \
> > > +
> >
> file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=c79ff39f19dfec6d
> > 293b95dea7b07891"
> > > +
> > > +SRC_URI[md5sum] = "7c2ab4e3f2a4186493aa06eabbc61cc0"
> > > +SRC_URI[sha256sum] =
> > "b9a312aad19e9463716d257d8f2529fd7fc1a5ef24f6dcdc0c4a1930d7bdb6e6"
> > > +
> > > +inherit waf-samba
> > > +
> > > +S = "${WORKDIR}/ldb-${PV}"
> > > +
> > > +EXTRA_OECONF += "--disable-rpath \
> > > +                 --disable-rpath-install \
> > > +                 --bundled-libraries=NONE \
> > > +                 --builtin-libraries=replace \
> > > +                 --with-modulesdir=${libdir}/ldb/modules \
> > > +                 --with-privatelibdir=${libdir}/ldb \
> > > +                 --with-libiconv=${STAGING_DIR_HOST}${prefix}\
> > > +                "
> > > +
> > > +PACKAGES += "pyldb pyldb-dbg pyldb-dev"
> > > +
> > > +FILES_${PN} += "${libdir}/ldb/*"
> > > +FILES_${PN}-dbg += "${libdir}/ldb/.debug/* \
> > > +                    ${libdir}/ldb/modules/ldb/.debug/*"
> > > +
> > > +FILES_pyldb = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/* \
> > > +               ${libdir}/libpyldb-util.so.1 \
> > > +               ${libdir}/libpyldb-util.so.1.1.17 \
> > > +              "
> > > +FILES_pyldb-dbg =
> > "${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug \
> > > +                   ${libdir}/.debug/libpyldb-util.so.1.1.17"
> > > +FILES_pyldb-dev = "${libdir}/libpyldb-util.so"
> > > --
> > > 1.9.1
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

