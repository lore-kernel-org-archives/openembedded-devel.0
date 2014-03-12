Return-Path: <ticotimo@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 79C656F725
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 15:01:52 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id p9so6643451lbv.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 08:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=MgpBHtsIG1LWpiymsNjnzajmxwU9839QZWzbYy1Dw/M=;
	b=XDxwM3E6LbdDEvk1P7qPHT6b7x/GXlAYR/wHabPykFx7aB1dyDp+pk00zASI5yW8Hp
	MR9lln41mOqiHRReZt4+BqcWlxg+0tVDbGugs+PD/Cx9MioeWGOT5NF+ShYoyOkMsZ//
	Wuwc3861qJ91CtyzUWlEDrMobKKkLoyTKo+z0QyC9Sjcf+yhgY8HqXTLvPiOtIqFJODk
	MVk1NTCVBgqjex26ak+8NSFdlwWuGC+yL95ksV9K0Pu2en8cdsJjF8Erle+fUNlSuYjp
	6w1Pv3t3XO0xWa3Tao5L5Ghv2EGIhLVxCboER+6v5YgvXv8cGhQdw5DKInUL3PY40+nN
	ACcg==
MIME-Version: 1.0
X-Received: by 10.112.118.20 with SMTP id ki20mr1726933lbb.45.1394636512601;
	Wed, 12 Mar 2014 08:01:52 -0700 (PDT)
Received: by 10.114.191.202 with HTTP; Wed, 12 Mar 2014 08:01:52 -0700 (PDT)
In-Reply-To: <20140311151148.GG2137@jama>
References: <1393516986-25391-1-git-send-email-ticotimo@gmail.com>
	<20140311142639.GE2137@jama> <20140311151148.GG2137@jama>
Date: Wed, 12 Mar 2014 08:01:52 -0700
Message-ID: <CANx9H-CVKLux1oO+GJAXUQq1rXx1vu2Xn0nF9rF9hwK1-m_1yg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-multimedia][PATCH v2] libmusicbrainz: workaround for build-native/do_configure
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
X-List-Received-Date: Wed, 12 Mar 2014 15:01:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Sounds like another reason to go with Mike Looijman's ${B}=${S} route for
this package?


On Tue, Mar 11, 2014 at 8:11 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Tue, Mar 11, 2014 at 03:26:39PM +0100, Martin Jansa wrote:
> > On Thu, Feb 27, 2014 at 08:03:06AM -0800, Tim Orling wrote:
> > > From: Tim Orling <TicoTimo@gmail.com>
> > >
> > > Changes in v2:
> > >     bump PR to r2 rather than drop (doh!)
> > >
> > > Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> > > ---
> > >  .../musicbrainz/libmusicbrainz_git.bb              | 50
> +++++++++++++++++++++-
> > >  1 file changed, 48 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/
> libmusicbrainz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/
> libmusicbrainz_git.bb
> > > index f6a8f53..2928587 100644
> > > --- a/meta-multimedia/recipes-multimedia/musicbrainz/
> libmusicbrainz_git.bb
> > > +++ b/meta-multimedia/recipes-multimedia/musicbrainz/
> libmusicbrainz_git.bb
> > > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING.txt;md5=fbc093901857fcd118f065f900982c24"
> > >  DEPENDS = "expat neon"
> > >
> > >  PV = "5.0.1+git${SRCPV}"
> > > -PR = "r1"
> > > +PR = "r2"
> > >
> > >  SRCREV = "0749dd0a35b4a54316da064475863a4ac6e28e7e"
> > >  SRC_URI = "git://github.com/metabrainz/libmusicbrainz.git \
> > > @@ -30,9 +30,55 @@ do_configure_prepend() {
> > >            -DCMAKE_C_COMPILER=${BUILD_CC} \
> > >            -DCMAKE_CXX_FLAGS=${BUILD_CXXFLAGS} \
> > >            -DCMAKE_CXX_COMPILER=${BUILD_CXX} \
> > > -          ..
> > > +          ${S}
> > >      make make-c-interface
> > >      cd ..
> > > +
> > > +    # the first thing cmake_do_configure does is delete ${B}
> > > +    # stash it first
> > > +    cp -r build-native ..
> > > +}
> > > +
> > > +# recreate default here, with work around for build-native
> > > +cmake_do_configure() {
> > > +   if [ "${OECMAKE_BUILDPATH}" -o "${OECMAKE_SOURCEPATH}" ]; then
> > > +           bbnote "cmake.bbclass no longer uses OECMAKE_SOURCEPATH
> and OECMAKE_BUILDPATH.  The default behaviour is now out-of-tree builds
> with B=WORKDIR/build."
> > > +   fi
> > > +
> > > +   if [ "${S}" != "${B}" ]; then
> > > +           rm -rf ${B}
> > > +           mkdir -p ${B}
> > > +           cd ${B}
> > > +   fi
> > > +
> > > +   # bring build-native back into build/
> > > +   mv ../build-native .
> > > +
> > > +   # Just like autotools cmake can use a site file to cache result
> that need generated binaries to run
> > > +   if [ -e ${WORKDIR}/site-file.cmake ] ; then
> > > +           OECMAKE_SITEFILE=" -C ${WORKDIR}/site-file.cmake"
> > > +   else
> > > +           OECMAKE_SITEFILE=""
> > > +   fi
> > > +
> > > +   cmake \
> > > +     ${OECMAKE_SITEFILE} \
> > > +     ${S} \
> > > +     -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
> > > +     -DCMAKE_INSTALL_BINDIR:PATH=${bindir} \
> > > +     -DCMAKE_INSTALL_SBINDIR:PATH=${sbindir} \
> > > +     -DCMAKE_INSTALL_LIBEXECDIR:PATH=${libexecdir} \
> > > +     -DCMAKE_INSTALL_SYSCONFDIR:PATH=${sysconfdir} \
> > > +     -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=${sharedstatedir} \
> > > +     -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=${localstatedir} \
> > > +     -DCMAKE_INSTALL_LIBDIR:PATH=${libdir} \
> > > +     -DCMAKE_INSTALL_INCLUDEDIR:PATH=${includedir} \
> > > +     -DCMAKE_INSTALL_DATAROOTDIR:PATH=${datadir} \
> > > +     -DCMAKE_INSTALL_SO_NO_EXE=0 \
> > > +     -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
> > > +     -DCMAKE_VERBOSE_MAKEFILE=1 \
> > > +     ${EXTRA_OECMAKE} \
> > > +     -Wno-dev
> > >  }
> >
> > There is still some issue with this patch applied:
> >
> > ERROR: Function failed: do_configure (log file is located at
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/libmusicbrainz/5.0.1+gitAUTOINC+0749dd0a35-r2/temp/log.do_configure.20744)
> > ERROR: Logfile of failure stored in:
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/libmusicbrainz/5.0.1+gitAUTOINC+0749dd0a35-r2/temp/log.do_configure.20744
> > Log data follows:
> > | DEBUG: Executing python function sysroot_cleansstate
> > | DEBUG: Python function sysroot_cleansstate finished
> > | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
> 'bit-64', 'x86_64-linux', 'common']
> > | DEBUG: Executing shell function autotools_preconfigure
> > | DEBUG: Shell function autotools_preconfigure finished
> > | DEBUG: Executing python function autotools_copy_aclocals
> > | DEBUG: Python function autotools_copy_aclocals finished
> > | DEBUG: Executing shell function do_configure
> > | fatal: Not a git repository (or any parent up to mount parent
> /home/jenkins/oe/shr-core-branches/shr-core)
> > | Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not
> set).
> > | WARNING: exit code 128 from a shell command.
> > | ERROR: Function failed: do_configure (log file is located at
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/libmusicbrainz/5.0.1+gitAUTOINC+0749dd0a35-r2/temp/log.do_configure.20744)
> > NOTE: recipe libmusicbrainz-5.0.1+gitAUTOINC+0749dd0a35-r2: task
> do_configure: Failed
> > ERROR: Task 1242
> (/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-multimedia/recipes-multimedia/musicbrainz/
> libmusicbrainz_git.bb, do_configure) failed with exit code '1'
> >
> > (link to full log in last State of bitbake world, Failed tasks
> 2014-03-11 e-mail)
>
> Ah, it seems like I've reported this before :)
>
> Yes it's caused by:
> do_configure() {
>     # The native build really doesn't like being rebuilt, so delete
>     # it if it's already present. Also delete all other files not
>     # known to Git to fix subsequent invocations of do_configure.
>     git clean -dfx -e /.pc/ -e /patches/ .
> ...
>
> which is executed in ${B} which isn't git repo:
> cd
> '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libmusicbrainz/5.0.1+gitAUTOINC+0749dd0a35-r2/build'
> do_configure
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

