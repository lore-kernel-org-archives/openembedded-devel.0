Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA3816D123
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 19:07:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAQJ68vE028624
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 26 Nov 2018 11:06:18 -0800
Received: from yow-masselst-lx1.localnet (128.224.22.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Mon, 26 Nov 2018 11:05:57 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Nov 2018 14:05:56 -0500
Message-ID: <2261962.MaDmmlLXXr@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <CAMKF1sp7GQMf9KpNoOagivmY-eJ3m6nfAm5ZxsfX0-kZkcgTAg@mail.gmail.com>
References: <20181120203814.11500-1-raj.khem@gmail.com>
	<7738387.rbd9zDMNmT@yow-masselst-lx1>
	<CAMKF1sp7GQMf9KpNoOagivmY-eJ3m6nfAm5ZxsfX0-kZkcgTAg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Ivan Maidanski <ivmai@mail.ru>
Subject: Re: [meta-oe][PATCH 06/10] bdwgc: upgrade 7.6.0 -> 7.6.8
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
X-List-Received-Date: Mon, 26 Nov 2018 19:07:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, November 26, 2018 1:10:07 PM EST Khem Raj wrote:
> On Mon, Nov 26, 2018 at 10:07 AM Mark Asselstine
> 
> <mark.asselstine@windriver.com> wrote:
> > On Monday, November 26, 2018 12:02:41 PM EST Khem Raj wrote:
> > > On Mon, Nov 26, 2018 at 7:59 AM Mark Asselstine
> > > 
> > > <mark.asselstine@windriver.com> wrote:
> > > > On Tue, Nov 20, 2018 at 3:39 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > > > From: Ivan Maidanski <ivmai@mail.ru>
> > > > > 
> > > > > Highlights of this upgrade:
> > > > > * Fix numerous bugs (concurrency, overflow, CVE-2016-9427, etc.)
> > > > > * Fix various typos in comments and documentation
> > > > > * AddressSanitizer and MemorySanitizer support
> > > > > * RISC-V support
> > > > > 
> > > > > See the following for detailed changes:
> > > > > * https://github.com/ivmai/bdwgc/releases/tag/v7.6.2
> > > > > * https://github.com/ivmai/bdwgc/releases/tag/v7.6.4
> > > > > * https://github.com/ivmai/bdwgc/releases/tag/v7.6.6
> > > > > * https://github.com/ivmai/bdwgc/releases/tag/v7.6.8
> > > > > 
> > > > > Signed-off-by: Ivan Maidanski <ivmai@mail.ru>
> > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > ---
> > > > 
> > > > This is causing my master-next builds to fail on fetching. Ivan, you
> > > > need
> > > > to
> > > > 
> > > > -SRC_URI = "git://github.com/ivmai/bdwgc.git \
> > > > +SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-7_6 \
> > > > 
> > > > before this commit makes  its way to the master branch.
> > > > 
> > > > Khem, Ivan, let me know if you want to sort this out or have me send a
> > > > patch.
> > > 
> > > Thansk for trying out master-next
> > 
> > I have one of our nightly builds of meta-overc use it to catch stuff like
> > this.
> 
> I think I will stop doing my local integration and directly start
> using master-next to integrate
> which I guess I can leverage more help with. Thoughts ?
> currently, CI happens on a local CI branch and then gets into
> master-next which make merge
> cycles longer.

I don't really have a horse in the CI/CD game but I always assumed that 
master-next was non-fastforward whereas the CI/CD branches would be FF. In 
which case master-next is best suited as the cooling off staging area for new 
work.

But again, I am guilty of only knowing enough to be dangerous.

Mark

> 
> > > its already fixed in my yoe/mut branch
> > > http://git.openembedded.org/meta-openembedded-contrib/log/?h=yoe/mut
> > 
> > Great. Thanks for taking care of this.
> > 
> > Mark
> > 
> > > > Thanks,
> > > > Mark
> > > > 
> > > > >  ...d-check-for-NO_GETCONTEXT-definition.patch | 29
> > > > >  -------------------
> > > > >  .../bdwgc/bdwgc/musl_header_fix.patch         | 27
> > > > >  -----------------
> > > > >  .../bdwgc/{bdwgc_7.6.0.bb => bdwgc_7.6.8.bb}  |  6 ++--
> > > > >  3 files changed, 2 insertions(+), 60 deletions(-)
> > > > >  delete mode 100644
> > > > >  meta-oe/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-for
> > > > >  -NO
> > > > >  _GETCONTEXT-definition.patch delete mode 100644
> > > > >  meta-oe/recipes-support/bdwgc/bdwgc/musl_header_fix.patch rename
> > > > >  meta-oe/recipes-support/bdwgc/{bdwgc_7.6.0.bb => bdwgc_7.6.8.bb}
> > > > >  (85%)>
> > > > > 
> > > > > diff --git
> > > > > a/meta-oe/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-fo
> > > > > r-N
> > > > > O_GETCONTEXT-definition.patch
> > > > > b/meta-oe/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-fo
> > > > > r-N
> > > > > O_GETCONTEXT-definition.patch deleted file mode 100644
> > > > > index 8ef774f0f2..0000000000
> > > > > ---
> > > > > a/meta-oe/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-fo
> > > > > r-N
> > > > > O_GETCONTEXT-definition.patch +++ /dev/null
> > > > > @@ -1,29 +0,0 @@
> > > > > -configure.ac: add check for NO_GETCONTEXT definition
> > > > > -
> > > > > -Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> > > > > -[yann.morin.1998@free.fr: add a comment, change variable name, use
> > > > > - AS_IF, remove debug traces, use AC_CHECK_FUNCS (as suggested by
> > > > > - Thomas)]
> > > > > -Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > > > > -Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > > > > -
> > > > > ----
> > > > > -Upstream-Status: Pending
> > > > > - configure.ac | 6 ++++++
> > > > > - 1 file changed, 6 insertions(+)
> > > > > -
> > > > > ---- bdwgc-7.2f.orig/configure.ac       2014-06-01
> > > > > 19:00:47.000000000
> > > > > +0200
> > > > > -+++ bdwgc-7.2f/configure.ac    2014-12-23 14:13:11.585716713 +0100
> > > > > -@@ -365,6 +365,12 @@
> > > > > -   AC_MSG_RESULT($ac_cv_fno_strict_aliasing)
> > > > > - fi
> > > > > -
> > > > > -+# Check for getcontext (uClibc can be configured without it, for
> > > > > example)
> > > > > -+AC_CHECK_FUNCS([getcontext])
> > > > > -+AS_IF([test "$ac_cv_func_getcontext" = "no"],
> > > > > -+  [CFLAGS="$CFLAGS -DNO_GETCONTEXT"
> > > > > -+   CPPFLAGS="$CPPFLAGS -DNO_GETCONTEXT"])
> > > > > -+
> > > > > - case "$host" in
> > > > > - # While IRIX 6 has libdl for the O32 and N32 ABIs, it's missing
> > > > > for
> > > > > N64
> > > > > - # and unnecessary everywhere.
> > > > > diff --git
> > > > > a/meta-oe/recipes-support/bdwgc/bdwgc/musl_header_fix.patch
> > > > > b/meta-oe/recipes-support/bdwgc/bdwgc/musl_header_fix.patch deleted
> > > > > file mode 100644
> > > > > index 4a18496650..0000000000
> > > > > --- a/meta-oe/recipes-support/bdwgc/bdwgc/musl_header_fix.patch
> > > > > +++ /dev/null
> > > > > @@ -1,27 +0,0 @@
> > > > > -Add missing header to avoid:
> > > > > -
> > > > > -| 1472659610.016355: ../git/pthread_stop_world.c: In function
> > > > > 'GC_brief_async_signal_safe_sleep': -| 1472659610.0540252:
> > > > > ../git/pthread_stop_world.c:397:22: error: storage size of 'tv'
> > > > > isn't
> > > > > known -| 1472659610.0540252:        struct timeval tv;
> > > > > -| 1472659610.0540252:                       ^~
> > > > > -| 1472659610.054099: ../git/pthread_stop_world.c:397:22: warning:
> > > > > unused variable 'tv' [-Wunused-variable] -| 1472659610.054099:
> > > > > struct timeval tv;
> > > > > -| 1472659610.054099:                       ^~
> > > > > -| 1472659610.054099: Makefile:1530: recipe for target
> > > > > 'pthread_stop_world.lo' failed -
> > > > > -in musl builds.
> > > > > -
> > > > > -Upstream-Status: Pending
> > > > > -
> > > > > -Index: git/pthread_stop_world.c
> > > > > -===================================================================
> > > > > ---- git.orig/pthread_stop_world.c
> > > > > -+++ git/pthread_stop_world.c
> > > > > -@@ -45,6 +45,7 @@
> > > > > - #include <semaphore.h>
> > > > > - #include <errno.h>
> > > > > - #include <unistd.h>
> > > > > -+#include <sys/time.h>
> > > > > - #include "atomic_ops.h"
> > > > > -
> > > > > - /* It's safe to call original pthread_sigmask() here.   */
> > > > > diff --git a/meta-oe/recipes-support/bdwgc/bdwgc_7.6.0.bb
> > > > > b/meta-oe/recipes-support/bdwgc/bdwgc_7.6.8.bb similarity index 85%
> > > > > rename from meta-oe/recipes-support/bdwgc/bdwgc_7.6.0.bb
> > > > > rename to meta-oe/recipes-support/bdwgc/bdwgc_7.6.8.bb
> > > > > index dcb68f0282..18722fb441 100644
> > > > > --- a/meta-oe/recipes-support/bdwgc/bdwgc_7.6.0.bb
> > > > > +++ b/meta-oe/recipes-support/bdwgc/bdwgc_7.6.8.bb
> > > > > @@ -19,12 +19,10 @@ DESCRIPTION = "The Boehm-Demers-Weiser
> > > > > conservative
> > > > > garbage collector can be\> >
> > > > > 
> > > > >  HOMEPAGE = "http://www.hboehm.info/gc/"
> > > > >  SECTION = "devel"
> > > > >  LICENSE = "MIT"
> > > > > 
> > > > > -LIC_FILES_CHKSUM =
> > > > > "file://README.QUICK;md5=4f81f24ec69726c312487c2ac740e9e3"
> > > > > +LIC_FILES_CHKSUM =
> > > > > "file://README.QUICK;md5=728501f233050290314d33fb07d883eb"
> > > > > 
> > > > > -SRCREV = "8ac1d84a40eb7a431fec1b8097e3f24b48fb23fa"
> > > > > +SRCREV = "8b2a98209a59c92e1be318e4acda507d83175f4d"
> > > > > 
> > > > >  SRC_URI = "git://github.com/ivmai/bdwgc.git \
> > > > > 
> > > > > -
> > > > > file://0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patc
> > > > > h \
> > > > > -           file://musl_header_fix.patch \
> > > > > 
> > > > >            "
> > > > >  
> > > > >  FILES_${PN}-doc = "${datadir}"
> > > > > 
> > > > > --
> > > > > 2.19.1
> > > > > 
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-devel mailing list
> > > > > Openembedded-devel@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel





