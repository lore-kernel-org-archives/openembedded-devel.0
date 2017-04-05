Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 18702779C3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Apr 2017 18:36:16 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id g19so5110088wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Apr 2017 11:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=oRh9aDF3j3mgCzC3R5/QvUYTSizKD52BGnhBYEMLi9A=;
	b=S5E/i1IlZyovZ9KRjT5Sv6VM82b/8DTSoJPqxkot+zdsiyIaChVN0JFiT3V1crosSl
	LG+Ux5IRNRnnnMLHX9tdj7dKnrDSmJtDstR/zEKFiNpIIlrmh0ry5EQszJGZi2IDDOmJ
	1412aPzOm8g9bByXAZwiXFwvDXTmyz9yceJ+K6YP+71t4zow/pREM8cpv0875IvQuexe
	KrExpuD3Hqf2A+R1bXj7da79Gmk3szrb1T4/5qq5q/I9GW/4jw54Oqyve118XRncFtf0
	HAMnXqtE9L/0qbyOahI23anYbYyUZsYqf+qXth2X4+SgWmQyNZki6XgWJ8/PIDTYbqP3
	oPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=oRh9aDF3j3mgCzC3R5/QvUYTSizKD52BGnhBYEMLi9A=;
	b=rXVbXVUzuzuZdz+3xEDNIEtm+/ww4UH+66qx92bDIvJKNPNWgZ8ZhBkcFjP54akKdw
	eQ93jwjjOkLaov81zaDNiNrb89YHBra8e6LgrLVb4EeU8bMQixuG9krB9QaVj3TQjpk4
	FLFP80/w6ftiaWz1eMancxtwVVihEX1NOOWbr3HzjzofSn63wM5usMdzHnjnCTc3rka/
	nHsYOzLf2hRjWSMDxsTinVYAwOScWn1enijZ9i7JK7jgHHw2ftxIByphuUA931BaLI3X
	e7YbyohrRhyo5GdG3BmwuFp3P1rolQdqfFrwLhwZpYS8JBwgUElP+f0DbROW4Z5iLIIo
	dCzw==
X-Gm-Message-State: AFeK/H1D3lknZzrInFLt5ppvucut2zaYdavMn4s+r7vo5bwIqYxHSD8X
	ZXT2cjw7ylp8Hg==
X-Received: by 10.28.158.87 with SMTP id h84mr20754765wme.4.1491417377499;
	Wed, 05 Apr 2017 11:36:17 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m21sm23247047wma.19.2017.04.05.11.36.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Apr 2017 11:36:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 5 Apr 2017 20:36:17 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170405183617.GA3301@jama>
References: <20170331164247.5052-1-raj.khem@gmail.com>
	<20170403191914.GF3311@jama>
	<CAMKF1srfnfc5GBCxq4xOriaznKK6OywX1_6Df_JWF-uXOKZaDQ@mail.gmail.com>
	<CA+chaQc3VwgCfecPLG4WopH+RfoEoTRAe6g4N6Ewi3ebZe_hFQ@mail.gmail.com>
	<CAMKF1spExF7mw-SV0uC8x4WzJ1qtCA30--VvLWNNBEOcnVFzZQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spExF7mw-SV0uC8x4WzJ1qtCA30--VvLWNNBEOcnVFzZQ@mail.gmail.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 01/43] gpm: Update to use git src uri
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
X-List-Received-Date: Wed, 05 Apr 2017 18:36:18 -0000
X-Groupsio-MsgNum: 66119
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline

--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2017 at 10:58:37AM -0700, Khem Raj wrote:
> I have created a new branch kraj/master-next which has the changes
> rebased on top of upstream master-next

Thanks!

I've squashed the 2 changes you had there for minicoredumper and fixed
commit message "Fix problem founds during musl build" to
"uml-utilities: Fix problem founds during musl build"

Now it should be all in master-next for next jenkins run.

> On Wed, Apr 5, 2017 at 10:41 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > I've merged many changes from master-next today, only the ones for
> > meta-networking layer are left in master-next now.
> >
> > Can you please resend remaining changes (rebased on master-next) and
> > integrate the fixes into them?
> >
> > Thanks
> >
> > On Wed, Apr 5, 2017 at 6:38 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> Thanks Martin for triaging it. The fix is pushed to kraj/master
> >>
> >>
> >> https://github.com/kraj/meta-openembedded/commit/21b5a2ad436439bfddd8b=
1d30fcfab28d868d063
> >>
> >>
> >> On Mon, Apr 3, 2017 at 12:19 PM, Martin Jansa <martin.jansa@gmail.com>
> >> wrote:
> >> > On Fri, Mar 31, 2017 at 09:42:05AM -0700, Khem Raj wrote:
> >> >> Additional patches are upstream to fix build with gcc6 and clang
> >> >> Add systemd unit file
> >> >>
> >> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> >> ---
> >> >>  .../gpm/gpm-1.99.7/eglibc-2.17.patch               |  12 -
> >> >>  .../gpm/gpm-1.99.7/remove_nested_functions.patch   | 326
> >> >> ---------------------
> >> >>  meta-oe/recipes-support/gpm/gpm/gpm.service.in     |   9 +
> >> >>  .../recipes-support/gpm/{gpm-1.99.7 =3D> gpm}/init   |   0
> >> >>  .../gpm/{gpm-1.99.7 =3D> gpm}/no-docs.patch          |   2 +-
> >> >>  .../gpm/{gpm-1.99.7 =3D> gpm}/processcreds.patch     |   0
> >> >>  meta-oe/recipes-support/gpm/gpm_1.99.7.bb          |  53 ----
> >> >>  meta-oe/recipes-support/gpm/gpm_git.bb             |  44 +++
> >> >>  8 files changed, 54 insertions(+), 392 deletions(-)
> >> >>  delete mode 100644
> >> >> meta-oe/recipes-support/gpm/gpm-1.99.7/eglibc-2.17.patch
> >> >>  delete mode 100644
> >> >> meta-oe/recipes-support/gpm/gpm-1.99.7/remove_nested_functions.patch
> >> >>  create mode 100644 meta-oe/recipes-support/gpm/gpm/gpm.service.in
> >> >>  rename meta-oe/recipes-support/gpm/{gpm-1.99.7 =3D> gpm}/init (100=
%)
> >> >>  rename meta-oe/recipes-support/gpm/{gpm-1.99.7 =3D> gpm}/no-docs.p=
atch
> >> >> (93%)
> >> >>  rename meta-oe/recipes-support/gpm/{gpm-1.99.7 =3D>
> >> >> gpm}/processcreds.patch (100%)
> >> >>  delete mode 100644 meta-oe/recipes-support/gpm/gpm_1.99.7.bb
> >> >>  create mode 100644 meta-oe/recipes-support/gpm/gpm_git.bb
> >> >
> >> > This breaks links build, before this change links detected gpm and
> >> > enabled FB driver:
> >> >
> >> > configure:7756: result: yes
> >> > configure:7756: checking for gpm.h
> >> > configure:7756: result: yes
> >> > configure:7766: checking for Gpm_Open in -lgpm
> >> > configure:7791: i586-oe-linux-gcc  -m32 -march=3Di586
> >> > --sysroot=3D/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/links/2.7=
-r0/recipe-sysroot
> >> > -o conftest  -O2 -pipe -g -feliminate-unused-debug-types
> >> > -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/=
links/2.7-r0=3D/usr/src/debug/links/2.7-r0
> >> > -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/=
links/2.7-r0/recipe-sysroot-native=3D
> >> > -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/=
links/2.7-r0/recipe-sysroot=3D
> >> > -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed conftest.c -lgpm  -lm=
  >&5
> >> > configure:7791: $? =3D 0
> >> > configure:7800: result: yes
> >> > configure:7813: checking for Gpm_GetLibVersion
> >> > configure:7813: i586-oe-linux-gcc  -m32 -march=3Di586
> >> > --sysroot=3D/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/links/2.7=
-r0/recipe-sysroot
> >> > -o conftest  -O2 -pipe -g -feliminate-unused-debug-types
> >> > -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/=
links/2.7-r0=3D/usr/src/debug/links/2.7-r0
> >> > -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/=
links/2.7-r0/recipe-sysroot-native=3D
> >> > -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/=
links/2.7-r0/recipe-sysroot=3D
> >> > -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed conftest.c -lgpm -lm =
 >&5
> >> > configure:7813: $? =3D 0
> >> > configure:7813: result: yes
> >> >
> >> >
> >> > with this change:
> >> > configure:7756: checking for gpm.h
> >> > configure:7756: result: yes
> >> > configure:7766: checking for Gpm_Open in -lgpm
> >> > configure:7791: x86_64-oe-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dco=
re2
> >> > -msse3 -mfpmath=3Dsse
> >> > --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-=
oe-linux/links/2.7-r0/recipe-sysroot
> >> > -o conftest  -O2 -pipe -g -feliminate-unused-debug-types
> >> > -fdebug-prefix-map=3D/home/jenkins/oe/world/shr-core/tmp-glibc/work/=
core2-64-oe-linux/links/2.7-r0=3D/usr/src/debug/links/2.7-r0
> >> > -fdebug-prefix-map=3D/home/jenkins/oe/world/shr-core/tmp-glibc/work/=
core2-64-oe-linux/links/2.7-r0/recipe-sysroot-native=3D
> >> > -fdebug-prefix-map=3D/home/jenkins/oe/world/shr-core/tmp-glibc/work/=
core2-64-oe-linux/links/2.7-r0/recipe-sysroot=3D
> >> > -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed conftest.c -lgpm  -lm=
  >&5
> >> >
> >> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/lin=
ks/2.7-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_6=
4-oe-linux/gcc/x86_64-oe-linux/6.3.0/ld:
> >> > error: cannot find -lgpm
> >> > /usr/src/debug/links/2.7-r0/build/conftest.c:117: error: undefined
> >> > reference to 'Gpm_Open'
> >> > collect2: error: ld returned 1 exit status
> >> > configure:7791: $? =3D 1
> >> > configure: failed program was:
> >> > | /* confdefs.h */
> >> > | #define PACKAGE_NAME ""
> >> > | #define PACKAGE_TARNAME ""
> >> > | #define PACKAGE_VERSION ""
> >> > | #define PACKAGE_STRING ""
> >> > | #define PACKAGE_BUGREPORT ""
> >> > | #define PACKAGE_URL ""
> >> > | #define PACKAGE "links"
> >> > | #define VERSION "2.7"
> >> > | #define STDC_HEADERS 1
> >> > | #define HAVE_TYPEOF 1
> >> > | #define HAVE_LONG_LONG 1
> >> > ...
> >> > | #define HAVE_LIBM 1
> >> > | #define HAVE_GPM_H 1
> >> > | /* end confdefs.h.  */
> >> > |
> >> > | /* Override any GCC internal prototype to avoid an error.
> >> > |    Use char because int might match the return type of a GCC
> >> > |    builtin and then its argument prototype would still apply.  */
> >> > | #ifdef __cplusplus
> >> > | extern "C"
> >> > | #endif
> >> > | char Gpm_Open ();
> >> > | int
> >> > | main ()
> >> > | {
> >> > | return Gpm_Open ();
> >> > |   ;
> >> > |   return 0;
> >> > | }
> >> > configure:7800: result: no
> >> > configure:7813: checking for Gpm_GetLibVersion
> >> > configure:7813: x86_64-oe-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dco=
re2
> >> > -msse3 -mfpmath=3Dsse
> >> > --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-=
oe-linux/links/2.7-r0/recipe-sysroot
> >> > -o conftest  -O2 -pipe -g -feliminate-unused-debug-types
> >> > -fdebug-prefix-map=3D/home/jenkins/oe/world/shr-core/tmp-glibc/work/=
core2-64-oe-linux/links/2.7-r0=3D/usr/src/debug/links/2.7-r0
> >> > -fdebug-prefix-map=3D/home/jenkins/oe/world/shr-core/tmp-glibc/work/=
core2-64-oe-linux/links/2.7-r0/recipe-sysroot-native=3D
> >> > -fdebug-prefix-map=3D/home/jenkins/oe/world/shr-core/tmp-glibc/work/=
core2-64-oe-linux/links/2.7-r0/recipe-sysroot=3D
> >> > -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed conftest.c -lm  >&5
> >> > /usr/src/debug/links/2.7-r0/build/conftest.c:140: error: undefined
> >> > reference to 'Gpm_GetLibVersion'
> >> > collect2: error: ld returned 1 exit status
> >> > configure:7813: $? =3D 1
> >> > configure: failed program was:
> >> > | /* confdefs.h */
> >> > | #define PACKAGE_NAME ""
> >> > | #define PACKAGE_TARNAME ""
> >> > ...
> >> > | #define HAVE_LIBM 1
> >> > | #define HAVE_GPM_H 1
> >> > | /* end confdefs.h.  */
> >> > | /* Define Gpm_GetLibVersion to an innocuous variant, in case
> >> > <limits.h> declares Gpm_GetLibVersion.
> >> > |    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
> >> > | #define Gpm_GetLibVersion innocuous_Gpm_GetLibVersion
> >> > |
> >> > | /* System header to define __stub macros and hopefully few prototy=
pes,
> >> > |     which can conflict with char Gpm_GetLibVersion (); below.
> >> > |     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
> >> > |     <limits.h> exists even on freestanding compilers.  */
> >> > |
> >> > | #ifdef __STDC__
> >> > | # include <limits.h>
> >> > | #else
> >> > | # include <assert.h>
> >> > | #endif
> >> > |
> >> > | #undef Gpm_GetLibVersion
> >> > |
> >> > | /* Override any GCC internal prototype to avoid an error.
> >> > |    Use char because int might match the return type of a GCC
> >> > |    builtin and then its argument prototype would still apply.  */
> >> > | #ifdef __cplusplus
> >> > | extern "C"
> >> > | #endif
> >> > | char Gpm_GetLibVersion ();
> >> > | /* The GNU C library defines this for functions which it implements
> >> > |     to always fail with ENOSYS.  Some functions are actually named
> >> > |     something starting with __ and the normal name is an alias.  */
> >> > | #if defined __stub_Gpm_GetLibVersion || defined
> >> > __stub___Gpm_GetLibVersion
> >> > | choke me
> >> > | #endif
> >> > |
> >> > | int
> >> > | main ()
> >> > | {
> >> > | return Gpm_GetLibVersion ();
> >> > |   ;
> >> > |   return 0;
> >> > | }
> >> > configure:7813: result: no
> >> >
> >> >
> >> > The dependency is there and library as well:
> >> >
> >> > work/core2-64-oe-linux/links/2.7-r0$ find . -name libgpm\*
> >> > ./recipe-sysroot/usr/lib/libgpm.so.1
> >> > ./recipe-sysroot/usr/lib/libgpm.so.2
> >> > ./recipe-sysroot/usr/lib/libgpm.a
> >> > ./recipe-sysroot/usr/lib/libgpm.so.2.1.0
> >> >
> >> > but libgpm.so.1 link is broken:
> >> >
> >> > work/core2-64-oe-linux/links/2.7-r0$ ls -lah
> >> > ./recipe-sysroot/usr/lib/libgpm*
> >> > -rw-r--r-- 2 jenkins Jenkins 103K Apr  3 08:50
> >> > ./recipe-sysroot/usr/lib/libgpm.a
> >> > lrwxrwxrwx 1 jenkins Jenkins   16 Apr  3 08:56
> >> > ./recipe-sysroot/usr/lib/libgpm.so.1 -> libgpm.so.1.19.0
> >> > lrwxrwxrwx 1 jenkins Jenkins   15 Apr  3 08:56
> >> > ./recipe-sysroot/usr/lib/libgpm.so.2 -> libgpm.so.2.1.0
> >> > -rw-r--r-- 2 jenkins Jenkins  23K Apr  3 08:50
> >> > ./recipe-sysroot/usr/lib/libgpm.so.2.1.0
> >> >
> >> > with this change there is only the 2.1.0 version:
> >> > lrwxrwxrwx 1 jenkins Jenkins  15 Apr  3 09:12
> >> > ./recipe-sysroot/usr/lib/libgpm.so.2 -> libgpm.so.2.1.0
> >> > -rwxr-xr-x 3 jenkins Jenkins 23K Apr  2 12:59
> >> > ./recipe-sysroot/usr/lib/libgpm.so.2.1.0
> >> >
> >> >
> >> >> diff --git a/meta-oe/recipes-support/gpm/gpm-1.99.7/eglibc-2.17.pat=
ch
> >> >> b/meta-oe/recipes-support/gpm/gpm-1.99.7/eglibc-2.17.patch
> >> >> deleted file mode 100644
> >> >> index e43bdcb22..000000000
> >> >> --- a/meta-oe/recipes-support/gpm/gpm-1.99.7/eglibc-2.17.patch
> >> >> +++ /dev/null
> >> >> @@ -1,12 +0,0 @@
> >> >> -Upstream-Status: pending
> >> >> -
> >> >> ---- gpm-1.99.7.orig/src/daemon/open_console.c        2008-07-24
> >> >> 12:33:05.000000000 +0200
> >> >> -+++ gpm-1.99.7/src/daemon/open_console.c     2013-01-10
> >> >> 12:39:47.975461947 +0100
> >> >> -@@ -23,6 +23,7 @@
> >> >> - #include <fcntl.h>              /* open and co.  */
> >> >> - #include <sys/stat.h>           /* stat() */
> >> >> - #include <sys/ioctl.h>          /* ioctl() */
> >> >> -+#include <sys/types.h>          /* major() */
> >> >> -
> >> >> - /* Linux specific (to be outsourced in gpm2 */
> >> >> - #include <linux/serial.h>       /* for serial console check */
> >> >> diff --git
> >> >> a/meta-oe/recipes-support/gpm/gpm-1.99.7/remove_nested_functions.pa=
tch
> >> >> b/meta-oe/recipes-support/gpm/gpm-1.99.7/remove_nested_functions.pa=
tch
> >> >> deleted file mode 100644
> >> >> index d2d6cb8a8..000000000
> >> >> ---
> >> >> a/meta-oe/recipes-support/gpm/gpm-1.99.7/remove_nested_functions.pa=
tch
> >> >> +++ /dev/null
> >> >> @@ -1,326 +0,0 @@
> >> >> -Remove nested functions, they are not available in all compilers
> >> >> -e.g. clang will not support them.
> >> >> -
> >> >> -Upstream-Status: Pending
> >> >> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> >> -
> >> >> -Index: gpm-1.99.7/src/drivers/summa/i.c
> >> >> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> >> ---- gpm-1.99.7.orig/src/drivers/summa/i.c
> >> >> -+++ gpm-1.99.7/src/drivers/summa/i.c
> >> >> -@@ -36,6 +36,28 @@ extern int summamaxy;
> >> >> -
> >> >> - extern signed char summaid;
> >> >> -
> >> >> -+static void resetsumma(int fd)
> >> >> -+{
> >> >> -+   write(fd, 0, 1);          /* Reset */
> >> >> -+   usleep(400000);           /* wait */
> >> >> -+}
> >> >> -+
> >> >> -+static int waitsumma(int fd)
> >> >> -+{
> >> >> -+   struct timeval timeout;
> >> >> -+
> >> >> -+   fd_set readfds;
> >> >> -+
> >> >> -+   int err;
> >> >> -+
> >> >> -+   FD_ZERO(&readfds);
> >> >> -+   FD_SET(fd, &readfds);
> >> >> -+   timeout.tv_sec =3D 0;
> >> >> -+   timeout.tv_usec =3D 200000;
> >> >> -+   err =3D select(FD_SETSIZE, &readfds, NULL, NULL, &timeout);
> >> >> -+   return (err);
> >> >> -+}
> >> >> -+
> >> >> - Gpm_Type *I_summa(int fd, unsigned short flags, struct Gpm_Type
> >> >> *type, int argc,
> >> >> -                   char **argv)
> >> >> - {
> >> >> -@@ -43,24 +65,6 @@ Gpm_Type *I_summa(int fd, unsigned short
> >> >> -    flags =3D argc =3D 0;            /* FIXME: 1.99.13 */
> >> >> -    argv =3D NULL;
> >> >> -
> >> >> --   void resetsumma() {
> >> >> --      write(fd, 0, 1);          /* Reset */
> >> >> --      usleep(400000);           /* wait */
> >> >> --   }
> >> >> --   int waitsumma() {
> >> >> --      struct timeval timeout;
> >> >> --
> >> >> --      fd_set readfds;
> >> >> --
> >> >> --      int err;
> >> >> --
> >> >> --      FD_ZERO(&readfds);
> >> >> --      FD_SET(fd, &readfds);
> >> >> --      timeout.tv_sec =3D 0;
> >> >> --      timeout.tv_usec =3D 200000;
> >> >> --      err =3D select(FD_SETSIZE, &readfds, NULL, NULL, &timeout);
> >> >> --      return (err);
> >> >> --   }
> >> >> -    int err;
> >> >> -
> >> >> -    char buffer[255];
> >> >> -@@ -91,7 +95,7 @@ Gpm_Type *I_summa(int fd, unsigned short
> >> >> -     */
> >> >> -    setspeed(fd, 1200, 9600, 1,
> >> >> -             B9600 | CS8 | CREAD | CLOCAL | HUPCL | PARENB | PAROD=
D);
> >> >> --   resetsumma();
> >> >> -+   resetsumma(fd);
> >> >> -
> >> >> -    write(fd, SS_PROMPT_MODE, strlen(SS_PROMPT_MODE));
> >> >> -
> >> >> -@@ -103,7 +107,7 @@ Gpm_Type *I_summa(int fd, unsigned short
> >> >> -        * read the Summa Firm-ID
> >> >> -        */
> >> >> -       write(fd, SS_FIRMID, strlen(SS_FIRMID));
> >> >> --      err =3D waitsumma();
> >> >> -+      err =3D waitsumma(fd);
> >> >> -       if(!((err =3D=3D -1) || (!err))) {
> >> >> -          summaid =3D 10;          /* Original Summagraphics */
> >> >> -          read(fd, buffer, 255); /* Read Firm-ID */
> >> >> -@@ -111,14 +115,14 @@ Gpm_Type *I_summa(int fd, unsigned short
> >> >> -    }
> >> >> -
> >> >> -    if(summaid < 0) {            /* Genius-test */
> >> >> --      resetsumma();
> >> >> -+      resetsumma(fd);
> >> >> -       write(fd, GEN_MMSERIES, 1);
> >> >> -       write(fd, &GEN_MODELL, 1);        /* Read modell */
> >> >> --      err =3D waitsumma();
> >> >> -+      err =3D waitsumma(fd);
> >> >> -       if(!((err =3D=3D -1) || (!err))) {    /* read Genius-ID */
> >> >> --         err =3D waitsumma();
> >> >> -+         err =3D waitsumma(fd);
> >> >> -          if(!((err =3D=3D -1) || (!err))) {
> >> >> --            err =3D waitsumma();
> >> >> -+            err =3D waitsumma(fd);
> >> >> -             if(!((err =3D=3D -1) || (!err))) {
> >> >> -                read(fd, &config, 1);
> >> >> -                summaid =3D (config[0] & 224) >> 5;        /* geni=
us
> >> >> tablet-id
> >> >> -@@ -135,14 +139,14 @@ Gpm_Type *I_summa(int fd, unsigned short
> >> >> -     * unknown tablet ?
> >> >> -     */
> >> >> -    if((summaid < 0) || (summaid =3D=3D 11)) {
> >> >> --      resetsumma();
> >> >> -+      resetsumma(fd);
> >> >> -       write(fd, SS_BINARY_FMT SS_PROMPT_MODE, 3);
> >> >> -    }
> >> >> -
> >> >> -    /*
> >> >> -     * read tablet size
> >> >> -     */
> >> >> --   err =3D waitsumma();
> >> >> -+   err =3D waitsumma(fd);
> >> >> -    if(!((err =3D=3D -1) || (!err)))
> >> >> -       read(fd, buffer, sizeof(buffer));
> >> >> -    write(fd, SS_READCONFIG, 1);
> >> >> -Index: gpm-1.99.7/src/drivers/wacom/i.c
> >> >> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> >> ---- gpm-1.99.7.orig/src/drivers/wacom/i.c
> >> >> -+++ gpm-1.99.7/src/drivers/wacom/i.c
> >> >> -@@ -30,10 +30,6 @@
> >> >> - #include "message.h"            /* gpm_report */
> >> >> - #include "wacom.h"              /* wacom */
> >> >> -
> >> >> --Gpm_Type *I_wacom(int fd, unsigned short flags, struct Gpm_Type
> >> >> *type, int argc,
> >> >> --                  char **argv)
> >> >> --{
> >> >> --
> >> >> - /* wacom graphire tablet */
> >> >> - #define UD_RESETBAUD     "\r$"  /* reset baud rate to default (wa=
com
> >> >> V) */
> >> >> -    /*
> >> >> -@@ -45,83 +41,91 @@ Gpm_Type *I_wacom(int fd, unsigned short
> >> >> - #define UD_COORD         "~C\r" /* Request max coordinates */
> >> >> - #define UD_STOP          "\nSP\r"       /* stop sending coordinat=
es
> >> >> */
> >> >> -
> >> >> --   flags =3D 0;                   /* FIXME: 1.99.13 */
> >> >> -
> >> >> --   void reset_wacom() {
> >> >> --      /*
> >> >> --       * Init Wacom communication; this is modified from xf86Waco=
m.so
> >> >> module
> >> >> --       */
> >> >> --      /*
> >> >> --       * Set speed to 19200
> >> >> --       */
> >> >> --      setspeed(fd, 1200, 19200, 0, B19200 | CS8 | CREAD | CLOCAL |
> >> >> HUPCL);
> >> >> --      /*
> >> >> --       * Send Reset Baudrate Command
> >> >> --       */
> >> >> --      write(fd, UD_RESETBAUD, strlen(UD_RESETBAUD));
> >> >> --      usleep(250000);
> >> >> --      /*
> >> >> --       * Send Reset Command
> >> >> --       */
> >> >> --      write(fd, UD_RESET, strlen(UD_RESET));
> >> >> --      usleep(75000);
> >> >> --      /*
> >> >> --       * Set speed to 9600bps
> >> >> --       */
> >> >> --      setspeed(fd, 1200, 9600, 0, B9600 | CS8 | CREAD | CLOCAL |
> >> >> HUPCL);
> >> >> --      /*
> >> >> --       * Send Reset Command
> >> >> --       */
> >> >> --      write(fd, UD_RESET, strlen(UD_RESET));
> >> >> --      usleep(250000);
> >> >> --      write(fd, UD_STOP, strlen(UD_STOP));
> >> >> --      usleep(100000);
> >> >> --   }
> >> >> -+static void reset_wacom(int fd)
> >> >> -+{
> >> >> -+   /*
> >> >> -+    * Init Wacom communication; this is modified from xf86Wacom.so
> >> >> module
> >> >> -+    */
> >> >> -+   /*
> >> >> -+    * Set speed to 19200
> >> >> -+    */
> >> >> -+   setspeed(fd, 1200, 19200, 0, B19200 | CS8 | CREAD | CLOCAL |
> >> >> HUPCL);
> >> >> -+   /*
> >> >> -+    * Send Reset Baudrate Command
> >> >> -+    */
> >> >> -+   write(fd, UD_RESETBAUD, strlen(UD_RESETBAUD));
> >> >> -+   usleep(250000);
> >> >> -+   /*
> >> >> -+    * Send Reset Command
> >> >> -+    */
> >> >> -+   write(fd, UD_RESET, strlen(UD_RESET));
> >> >> -+   usleep(75000);
> >> >> -+   /*
> >> >> -+    * Set speed to 9600bps
> >> >> -+    */
> >> >> -+   setspeed(fd, 1200, 9600, 0, B9600 | CS8 | CREAD | CLOCAL | HUP=
CL);
> >> >> -+   /*
> >> >> -+    * Send Reset Command
> >> >> -+    */
> >> >> -+   write(fd, UD_RESET, strlen(UD_RESET));
> >> >> -+   usleep(250000);
> >> >> -+   write(fd, UD_STOP, strlen(UD_STOP));
> >> >> -+   usleep(100000);
> >> >> -+}
> >> >> -
> >> >> --   int wait_wacom() {
> >> >> --      /*
> >> >> --       *  Wait up to 200 ms for Data from Tablet.
> >> >> --       *  Do not read that data.
> >> >> --       *  Give back 0 on timeout condition, -1 on error and 1 for
> >> >> DataPresent
> >> >> --       */
> >> >> --      struct timeval timeout;
> >> >> --
> >> >> --      fd_set readfds;
> >> >> --
> >> >> --      int err;
> >> >> --
> >> >> --      FD_ZERO(&readfds);
> >> >> --      FD_SET(fd, &readfds);
> >> >> --      timeout.tv_sec =3D 0;
> >> >> --      timeout.tv_usec =3D 200000;
> >> >> --      err =3D select(FD_SETSIZE, &readfds, NULL, NULL, &timeout);
> >> >> --      return ((err > 0) ? 1 : err);
> >> >> --   }
> >> >> -+static int wait_wacom(int fd)
> >> >> -+{
> >> >> -+   /*
> >> >> -+    *  Wait up to 200 ms for Data from Tablet.
> >> >> -+    *  Do not read that data.
> >> >> -+    *  Give back 0 on timeout condition, -1 on error and 1 for
> >> >> DataPresent
> >> >> -+    */
> >> >> -+   struct timeval timeout;
> >> >> -
> >> >> --   char buffer[50], *p;
> >> >> -+   fd_set readfds;
> >> >> -
> >> >> --   int RequestData(char *cmd) {
> >> >> --      int err;
> >> >> -+   int err;
> >> >> -
> >> >> --      /*
> >> >> --       * Send cmd if not null, and get back answer from tablet.
> >> >> --       * Get Data to buffer until full or timeout.
> >> >> --       * Give back 0 for timeout and !0 for buffer full
> >> >> --       */
> >> >> --      if(cmd)
> >> >> --         write(fd, cmd, strlen(cmd));
> >> >> --      memset(buffer, 0, sizeof(buffer));
> >> >> --      p =3D buffer;
> >> >> --      err =3D wait_wacom();
> >> >> --      while(err !=3D -1 && err && (p - buffer) < (int) (sizeof(bu=
ffer)
> >> >> - 1)) {
> >> >> --         p +=3D read(fd, p, (sizeof(buffer) - 1) - (p - buffer));
> >> >> --         err =3D wait_wacom();
> >> >> --      }
> >> >> --      /*
> >> >> --       * return 1 for buffer full
> >> >> --       */
> >> >> --      return ((strlen(buffer) >=3D (sizeof(buffer) - 1)) ? !0 : 0=
);
> >> >> -+   FD_ZERO(&readfds);
> >> >> -+   FD_SET(fd, &readfds);
> >> >> -+   timeout.tv_sec =3D 0;
> >> >> -+   timeout.tv_usec =3D 200000;
> >> >> -+   err =3D select(FD_SETSIZE, &readfds, NULL, NULL, &timeout);
> >> >> -+   return ((err > 0) ? 1 : err);
> >> >> -+}
> >> >> -+
> >> >> -+static int RequestData(int fd, char *cmd, char *buffer)
> >> >> -+{
> >> >> -+   int err;
> >> >> -+   char *p;
> >> >> -+   /*
> >> >> -+    * Send cmd if not null, and get back answer from tablet.
> >> >> -+    * Get Data to buffer until full or timeout.
> >> >> -+    * Give back 0 for timeout and !0 for buffer full
> >> >> -+    */
> >> >> -+   if(cmd)
> >> >> -+      write(fd, cmd, strlen(cmd));
> >> >> -+   memset(buffer, 0, sizeof(buffer));
> >> >> -+   p =3D buffer;
> >> >> -+   err =3D wait_wacom(fd);
> >> >> -+   while(err !=3D -1 && err && (p - buffer) < (int) (sizeof(buffe=
r) -
> >> >> 1)) {
> >> >> -+      p +=3D read(fd, p, (sizeof(buffer) - 1) - (p - buffer));
> >> >> -+      err =3D wait_wacom(fd);
> >> >> -    }
> >> >> -+   /*
> >> >> -+    * return 1 for buffer full
> >> >> -+    */
> >> >> -+   return ((strlen(buffer) >=3D (sizeof(buffer) - 1)) ? !0 : 0);
> >> >> -+}
> >> >> -+
> >> >> -+Gpm_Type *I_wacom(int fd, unsigned short flags, struct Gpm_Type
> >> >> *type, int argc,
> >> >> -+                  char **argv)
> >> >> -+{
> >> >> -+
> >> >> -+   flags =3D 0;                   /* FIXME: 1.99.13 */
> >> >> -+
> >> >> -+   char buffer[50];
> >> >> -
> >> >> -    /*
> >> >> -     * We do both modes, relative and absolute, with the same
> >> >> function.
> >> >> -@@ -143,17 +147,17 @@ Gpm_Type *I_wacom(int fd, unsigned short
> >> >> -    };
> >> >> -    parse_argv(optioninfo, argc, argv);
> >> >> -    type->absolute =3D WacomAbsoluteWanted;
> >> >> --   reset_wacom();
> >> >> -+   reset_wacom(fd);
> >> >> -
> >> >> -    /*
> >> >> -     * "Flush" input queque
> >> >> -     */
> >> >> --   while(RequestData(NULL)) ;
> >> >> -+   while(RequestData(fd, NULL, buffer)) ;
> >> >> -
> >> >> -    /*
> >> >> -     * read WACOM-ID
> >> >> -     */
> >> >> --   RequestData(UD_FIRMID);
> >> >> -+   RequestData(fd, UD_FIRMID, buffer);
> >> >> -
> >> >> -    /*
> >> >> -     * Search for matching modell
> >> >> -@@ -180,7 +184,7 @@ Gpm_Type *I_wacom(int fd, unsigned short
> >> >> -     * read Wacom max size
> >> >> -     */
> >> >> -    if(WacomModell !=3D (-1) && (!wcmodell[WacomModell].maxX)) {
> >> >> --      RequestData(UD_COORD);
> >> >> -+      RequestData(fd, UD_COORD, buffer);
> >> >> -       sscanf(buffer + 2, "%d,%d", &wmaxx, &wmaxy);
> >> >> -       wmaxx =3D (wmaxx - wcmodell[WacomModell].border);
> >> >> -       wmaxy =3D (wmaxy - wcmodell[WacomModell].border);
> >> >> diff --git a/meta-oe/recipes-support/gpm/gpm/gpm.service.in
> >> >> b/meta-oe/recipes-support/gpm/gpm/gpm.service.in
> >> >> new file mode 100644
> >> >> index 000000000..ee6c040fa
> >> >> --- /dev/null
> >> >> +++ b/meta-oe/recipes-support/gpm/gpm/gpm.service.in
> >> >> @@ -0,0 +1,9 @@
> >> >> +[Unit]
> >> >> +Description=3DVirtual console mouse server
> >> >> +
> >> >> +[Service]
> >> >> +Type=3Dforking
> >> >> +ExecStart=3D@bindir@/gpm -m /dev/input/mice -t imps2
> >> >> +
> >> >> +[Install]
> >> >> +WantedBy=3Dmulti-user.target
> >> >> diff --git a/meta-oe/recipes-support/gpm/gpm-1.99.7/init
> >> >> b/meta-oe/recipes-support/gpm/gpm/init
> >> >> similarity index 100%
> >> >> rename from meta-oe/recipes-support/gpm/gpm-1.99.7/init
> >> >> rename to meta-oe/recipes-support/gpm/gpm/init
> >> >> diff --git a/meta-oe/recipes-support/gpm/gpm-1.99.7/no-docs.patch
> >> >> b/meta-oe/recipes-support/gpm/gpm/no-docs.patch
> >> >> similarity index 93%
> >> >> rename from meta-oe/recipes-support/gpm/gpm-1.99.7/no-docs.patch
> >> >> rename to meta-oe/recipes-support/gpm/gpm/no-docs.patch
> >> >> index f10217a94..3faef84ee 100644
> >> >> --- a/meta-oe/recipes-support/gpm/gpm-1.99.7/no-docs.patch
> >> >> +++ b/meta-oe/recipes-support/gpm/gpm/no-docs.patch
> >> >> @@ -11,7 +11,7 @@ Index: gpm-1.99.7/Makefile.in
> >> >>   # user-overridable flags, but it's also all the implicit rule loo=
ks
> >> >> at.
> >> >>   # missing ?
> >> >>
> >> >> --SUBDIRS =3D src doc contrib gpm2
> >> >> +-SUBDIRS =3D src doc contrib
> >> >>  +SUBDIRS =3D src
> >> >>
> >> >>
> >> >> diff --git a/meta-oe/recipes-support/gpm/gpm-1.99.7/processcreds.pa=
tch
> >> >> b/meta-oe/recipes-support/gpm/gpm/processcreds.patch
> >> >> similarity index 100%
> >> >> rename from meta-oe/recipes-support/gpm/gpm-1.99.7/processcreds.pat=
ch
> >> >> rename to meta-oe/recipes-support/gpm/gpm/processcreds.patch
> >> >> diff --git a/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
> >> >> b/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
> >> >> deleted file mode 100644
> >> >> index bbb8c28ac..000000000
> >> >> --- a/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
> >> >> +++ /dev/null
> >> >> @@ -1,53 +0,0 @@
> >> >> -DESCRIPTION =3D "GPM (General Purpose Mouse) is a mouse server \
> >> >> -for the console and xterm, with sample clients included \
> >> >> -(emacs, etc)."
> >> >> -SECTION =3D "console/utils"
> >> >> -LICENSE =3D "GPLv2+"
> >> >> -LIC_FILES_CHKSUM =3D
> >> >> "file://gpm2/core/main.c;endline=3D19;md5=3D66d3c205c4e7ee5704b2ee3=
51dfed72f"
> >> >> -
> >> >> -PR =3D "r2"
> >> >> -
> >> >> -DEPENDS =3D "ncurses"
> >> >> -
> >> >> -SRC_URI =3D "ftp://arcana.linux.it/pub/gpm/gpm-${PV}.tar.bz2 \
> >> >> -           file://no-docs.patch \
> >> >> -           file://processcreds.patch \
> >> >> -           file://eglibc-2.17.patch \
> >> >> -           file://remove_nested_functions.patch \
> >> >> -           file://init"
> >> >> -
> >> >> -inherit autotools-brokensep update-rc.d
> >> >> -
> >> >> -INITSCRIPT_NAME =3D "gpm"
> >> >> -INITSCRIPT_PARAMS =3D "defaults"
> >> >> -
> >> >> -#export LIBS =3D "-lm"
> >> >> -
> >> >> -# all fields are /* FIXME: gpm 1.99.13 */
> >> >> -# gpm-1.99.7/src/lib/libhigh.c:171:43: error: parameter 'clientdat=
a'
> >> >> set but not used [-Werror=3Dunused-but-set-parameter]
> >> >> -# gpm-1.99.7/src/lib/report-lib.c:28:21: error: parameter 'line' s=
et
> >> >> but not used [-Werror=3Dunused-but-set-parameter]
> >> >> -# gpm-1.99.7/src/lib/report-lib.c:28:33: error: parameter 'file' s=
et
> >> >> but not used [-Werror=3Dunused-but-set-parameter]
> >> >> -# gpm-1.99.7/src/drivers/empty/i.c:26:23: error: parameter 'fd' set
> >> >> but not used [-Werror=3Dunused-but-set-parameter]
> >> >> -# gpm-1.99.7/src/drivers/empty/i.c:26:42: error: parameter 'flags'=
 set
> >> >> but not used [-Werror=3Dunused-but-set-parameter]
> >> >> -# gpm-1.99.7/src/drivers/etouch/i.c:34:43: error: parameter 'flags'
> >> >> set but not used [-Werror=3Dunused-but-set-parameter]
> >> >> -# gpm-1.99.7/src/drivers/msc/r.c:32:12: error: variable 'dy' set b=
ut
> >> >> not used [-Werror=3Dunused-but-set-variable]
> >> >> -# gpm-1.99.7/src/drivers/msc/r.c:32:8: error: variable 'dx' set but
> >> >> not used [-Werror=3Dunused-but-set-variable]
> >> >> -# cc1: all warnings being treated as errors
> >> >> -CFLAGS +=3D "-Wno-extra -Wno-error=3Dunused-but-set-parameter
> >> >> -Wno-error=3Dunused-but-set-variable"
> >> >> -
> >> >> -# twiddler is WIP in 1.99.7 and probably not worth fixing (a lot of
> >> >> changes in gpm-2-dev after 1.99.7
> >> >> -# gpm-1.99.7/src/drivers/twid/twiddler.c:503:14: error: cast to
> >> >> pointer from integer of different size [-Werror=3Dint-to-pointer-ca=
st]
> >> >> -# /gpm-1.99.7/src/mice.c:221:5: error: (near initialization for
> >> >> 'mice[32].init') [-Werror]
> >> >> -CFLAGS +=3D "-Wno-error=3Dint-to-pointer-cast -Wno-error"
> >> >> -
> >> >> -do_install () {
> >> >> -    oe_runmake 'DESTDIR=3D${D}' install
> >> >> -    install -m 0644 src/headers/gpm.h ${D}${includedir}
> >> >> -    install -d ${D}/${sysconfdir}/init.d
> >> >> -    install -m 0755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/gpm
> >> >> -    cd ${D}${libdir} && ln -sf libgpm.so.1.19.0 libgpm.so.1
> >> >> -}
> >> >> -SRC_URI[md5sum] =3D "9fdddf5f53cb11d40bb2bb671d3ac544"
> >> >> -SRC_URI[sha256sum] =3D
> >> >> "6071378b24494e36ca3ef6377606e7e565040413c86704753a162d2180af32ee"
> >> >> -
> >> >> -FILES_${PN} +=3D "${datadir}/emacs"
> >> >> diff --git a/meta-oe/recipes-support/gpm/gpm_git.bb
> >> >> b/meta-oe/recipes-support/gpm/gpm_git.bb
> >> >> new file mode 100644
> >> >> index 000000000..4c0e9434d
> >> >> --- /dev/null
> >> >> +++ b/meta-oe/recipes-support/gpm/gpm_git.bb
> >> >> @@ -0,0 +1,44 @@
> >> >> +DESCRIPTION =3D "GPM (General Purpose Mouse) is a mouse server \
> >> >> +for the console and xterm, with sample clients included \
> >> >> +(emacs, etc)."
> >> >> +SECTION =3D "console/utils"
> >> >> +LICENSE =3D "GPLv2+"
> >> >> +LIC_FILES_CHKSUM =3D
> >> >> "file://COPYING;md5=3D18810669f13b87348459e611d31ab760"
> >> >> +
> >> >> +PV =3D "1.99.7+git${SRCREV}"
> >> >> +PR =3D "r2"
> >> >> +SRCREV =3D "1fd19417b8a4dd9945347e98dfa97e4cfd798d77"
> >> >> +
> >> >> +DEPENDS =3D "ncurses"
> >> >> +
> >> >> +SRC_URI =3D "git://github.com/telmich/gpm;protocol=3Dgit \
> >> >> +           file://no-docs.patch \
> >> >> +           file://processcreds.patch \
> >> >> +           file://gpm.service.in \
> >> >> +           file://init"
> >> >> +
> >> >> +S =3D "${WORKDIR}/git"
> >> >> +
> >> >> +inherit autotools-brokensep update-rc.d systemd
> >> >> +
> >> >> +INITSCRIPT_NAME =3D "gpm"
> >> >> +INITSCRIPT_PARAMS =3D "defaults"
> >> >> +
> >> >> +do_configure_prepend() {
> >> >> +    (cd ${S};./autogen.sh;cd -)
> >> >> +}
> >> >> +
> >> >> +do_install_append () {
> >> >> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
> >> >> 'false', d)}; then
> >> >> +        install -d ${D}${systemd_system_unitdir}
> >> >> +        sed 's:@bindir@:${bindir}:' < ${WORKDIR}/gpm.service.in
> >> >> >${D}${systemd_system_unitdir}/gpm.service
> >> >> +    fi
> >> >> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true',
> >> >> 'false', d)}; then
> >> >> +        install -D -m 0755 ${WORKDIR}/init
> >> >> ${D}/${sysconfdir}/init.d/gpm
> >> >> +    fi
> >> >> +    install -D -m 0644 ${S}/src/headers/gpm.h ${D}${includedir}/gp=
m.h
> >> >> +}
> >> >> +
> >> >> +SYSTEMD_SERVICE_${PN} =3D "gpm.service"
> >> >> +
> >> >> +FILES_${PN} +=3D "${datadir}/emacs"
> >> >> --
> >> >> 2.12.1
> >> >>
> >> >> --
> >> >> _______________________________________________
> >> >> Openembedded-devel mailing list
> >> >> Openembedded-devel@lists.openembedded.org
> >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >> >
> >> > --
> >> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWOU45wAKCRA3VSO3ZXaA
HJCxAJ9KJGF3+MA+A10fJ67kiqRXZi6JrwCfVeajQYX2BPwOxrpKPjKkoOLXnJc=
=r8er
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
