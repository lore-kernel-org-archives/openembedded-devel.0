Return-Path: <nickdademo@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id F0FBD6B835
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 May 2014 16:36:23 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id eb12so3109612oac.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 May 2014 09:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=BVKEQbUFv3/rSAMPpNcJ5GkOM4XO5/n9vpneCD8QveY=;
	b=ehZhZU29AiRYnn5WbtwweQUVmBQc+SAbyblb3IsVdYgKxn+gEbHH4vg/W4RVLJqqfA
	alHYvAb/m3bTZ2TwPGkoL5Zr4cRevBSJvXsbl6fSu/1lL8TrkPBvsHnlt+Ptqgg+CMqh
	wb4RFUXk6U5Lo5CAjLrfWf8QmWMGZSl2R1oCuJrtC50hjwNZq83eDsZIYglGoi+gL8OE
	1O3lVzNKkpJlOFY8ykEWeeA/0cyIUwdd9EGWW9lkaw4Y/gtjKuCCEf3C4VujgT2CgKqo
	ySfoaYYt1vEjhL+L7Zt3B9SOIijR785LpdXjCLmnJEBVSNxW9oX01w/JWEj5smf9oMn5
	VmPA==
X-Received: by 10.60.72.100 with SMTP id c4mr25967535oev.25.1401554184339;
	Sat, 31 May 2014 09:36:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.80.67 with HTTP; Sat, 31 May 2014 09:36:04 -0700 (PDT)
In-Reply-To: <20140507165709.GI30955@jama>
References: <1399414836-16702-1-git-send-email-nickdademo@gmail.com>
	<20140506222845.GE30955@jama>
	<CANR6C555Le4jbMW=h3wrSedJgHKWZDnW6WZoz48GJo2dDwd_4A@mail.gmail.com>
	<20140507165709.GI30955@jama>
From: "Nick D'Ademo" <nickdademo@gmail.com>
Date: Sun, 1 Jun 2014 02:36:04 +1000
Message-ID: <CANR6C56P=cU=J6D_xNCPNdY+0smqzjuRxLWWBoJUgY3LBisfvg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] opencv: Bump SRCREV to 2.4.9 release tag, PV is now 2.4.9+git.
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
X-List-Received-Date: Sat, 31 May 2014 16:36:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Apologies for the late reply on this one.

jasper (as a dependency) seems to be fine with this recipe.
However, libdc1394 gives the following error (camera.h header not found):


ERROR: Function failed: do_compile (log file is located at
/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/temp/log.do_compile.10117)
ERROR: Logfile of failure stored in:
/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/temp/log.do_compile.10117
Log data follows:
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
'bit-64', 'x86_64-linux', 'common']
| DEBUG: Executing shell function do_compile
| NOTE: make -j 8
| make  all-recursive
| make[1]: Entering directory
`/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/build'
| Making all in dc1394
| make[2]: Entering directory
`/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/build/dc1394'
| Making all in linux
| make[3]: Entering directory
`/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/build/dc1394/linux'
| make[3]: Nothing to be done for `all'.
| make[3]: Leaving directory
`/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/build/dc1394/linux'
| Making all in juju
| make[3]: Entering directory
`/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/build/dc1394/juju'
| ../../x86_64-poky-linux-libtool  --tag=CC   --mode=compile
x86_64-poky-linux-gcc  -m64 -march=corei7 -mtune=corei7 -mfpmath=sse
-msse4.2 --sysroot=/home/nick/poky/build/tmp/sysroots/8tree -DHAVE_CONFIG_H
-I.
-I/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju
-I../..
-I/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/git/libdc1394/dc1394
-Wall -Wunused -std=gnu99  -O2 -pipe -g -feliminate-unused-debug-types -c
-o control.lo
/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju/control.c
| ../../x86_64-poky-linux-libtool  --tag=CC   --mode=compile
x86_64-poky-linux-gcc  -m64 -march=corei7 -mtune=corei7 -mfpmath=sse
-msse4.2 --sysroot=/home/nick/poky/build/tmp/sysroots/8tree -DHAVE_CONFIG_H
-I.
-I/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju
-I../..
-I/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/git/libdc1394/dc1394
-Wall -Wunused -std=gnu99  -O2 -pipe -g -feliminate-unused-debug-types -c
-o capture.lo
/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju/capture.c
| x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64
-march=corei7 -mtune=corei7 -mfpmath=sse -msse4.2
--sysroot=/home/nick/poky/build/tmp/sysroots/8tree -DHAVE_CONFIG_H -I.
-I/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju
-I../..
-I/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/git/libdc1394/dc1394
-Wall -Wunused -std=gnu99 -O2 -pipe -g -feliminate-unused-debug-types -c
/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju/control.c
-fPIC -DPIC -o .libs/control.o
| x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64
-march=corei7 -mtune=corei7 -mfpmath=sse -msse4.2
--sysroot=/home/nick/poky/build/tmp/sysroots/8tree -DHAVE_CONFIG_H -I.
-I/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju
-I../..
-I/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/git/libdc1394/dc1394
-Wall -Wunused -std=gnu99 -O2 -pipe -g -feliminate-unused-debug-types -c
/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju/capture.c
-fPIC -DPIC -o .libs/capture.o
| In file included from
/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju/control.c:35:0:
|
/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/git/libdc1394/dc1394/platform.h:27:27:
fatal error: dc1394/camera.h: No such file or directory
|  #include <dc1394/camera.h>
|                            ^
| compilation terminated.
| make[3]: *** [control.lo] Error 1
| make[3]: *** Waiting for unfinished jobs....
| In file included from
/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/git/libdc1394/dc1394/internal.h:28:0,
|                  from
/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju/juju.h:29,
|                  from
/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju/capture.c:37:
|
/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/git/libdc1394/dc1394/platform.h:27:27:
fatal error: dc1394/camera.h: No such file or directory
|  #include <dc1394/camera.h>
|                            ^
| compilation terminated.
| make[3]: *** [capture.lo] Error 1
| make[3]: Leaving directory
`/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/build/dc1394/juju'
| make[2]: *** [all-recursive] Error 1
| make[2]: Leaving directory
`/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/build/dc1394'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/build'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING:
/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/temp/run.do_compile.10117:1
exit 1 from
|   exit 1
| ERROR: Function failed: do_compile (log file is located at
/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrAUTOINC+b90342933b-r0/temp/log.do_compile.10117)
ERROR: Task 1372
(/home/nick/poky/meta-openembedded/meta-multimedia/recipes-multimedia/libdc1394/
libdc1394_git.bb, do_compile) failed with exit code '1'




On Thu, May 8, 2014 at 2:57 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Wed, May 07, 2014 at 11:57:09PM +1000, Nick D'Ademo wrote:
> > The recipe successfully builds without errors (multilib build) -
> however, I
> > also had no dependencies issues with the previous version of the recipe
> > either (2.4.8+git).
>
> Have you tried building opencv before and after building jasper nad
> libdc1394 in the same sysroot and comparing opencv output?
>
> >
> >
> > On Wed, May 7, 2014 at 8:28 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > > On Wed, May 07, 2014 at 08:20:36AM +1000, Nick D'Ademo wrote:
> > > > Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>
> > >
> > > Does it fix this issue reported in test-dependencies report?
> > >
> > > opencv/libopencv-highgui/latest lost dependency on  jasper libdc1394
> > >
> > > > ---
> > > >  meta-oe/recipes-support/opencv/opencv_2.4.bb |    4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git
> a/meta-oe/recipes-support/opencv/opencv_2.4.bbb/meta-oe/recipes-support/opencv/
> > > opencv_2.4.bb
> > > > index df512f6..43e6a2b 100644
> > > > --- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
> > > > +++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
> > > > @@ -9,12 +9,12 @@ ARM_INSTRUCTION_SET = "arm"
> > > >
> > > >  DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib
> > > glib-2.0"
> > > >
> > > > -SRCREV = "a4b34e7ae10351fc4d30dc55995679340efc488e"
> > > > +SRCREV = "df8e28283f09825cca0c2902160b7abebcfe1b64"
> > > >  SRC_URI = "git://github.com/Itseez/opencv.git;branch=2.4 \
> > > >             file://opencv-fix-pkgconfig-generation.patch \
> > > >  "
> > > >
> > > > -PV = "2.4.8+git${SRCPV}"
> > > > +PV = "2.4.9+git${SRCPV}"
> > > >
> > > >  S = "${WORKDIR}/git"
> > > >
> > > > --
> > > > 1.7.9.5
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
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

