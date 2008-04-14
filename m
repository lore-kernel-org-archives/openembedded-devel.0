Received: from [66.249.92.173] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthijs.van.de.water@gmail.com>) id 1JlRbB-0003ee-Mk
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Apr 2008 18:32:05 +0200
Received: by ug-out-1314.google.com with SMTP id i24so714361ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2008 09:32:02 -0700 (PDT)
Received: by 10.78.200.20 with SMTP id x20mr4660408huf.55.1208190721342;
	Mon, 14 Apr 2008 09:32:01 -0700 (PDT)
Received: by 10.78.160.9 with HTTP; Mon, 14 Apr 2008 09:32:01 -0700 (PDT)
Message-ID: <35a670560804140932s53231dcj1adfa6bc21e0353e@mail.gmail.com>
Date: Mon, 14 Apr 2008 18:32:01 +0200
From: "Matthijs van de Water" <matthijs.van.de.water@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4800DC3B.9080007@gmx.net>
MIME-Version: 1.0
References: <35a670560804100650w7de4cec0gae583d5ae73b8fad@mail.gmail.com>
	<47FE2530.2@gmx.net>
	<35a670560804101007m1d787b4ai97927bb42fcbfe5d@mail.gmail.com>
	<4800DC3B.9080007@gmx.net>
Subject: Re: Building ubuntu/gcc-4_2-branch to get GCJ for arm EABI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Apr 2008 16:32:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

>  >  Please report your results.
>  The build has just failed on glibc-intermediate with a linking error:
>  cannot find -lgcc_eh. I'll look into that now.
I solved this: I was missing a BINV="4.2.3" in my new ubuntu.inc file.
I also needed to specify a "--disable-sjlj-exceptions" as EXTRA_OECONF
and found out that the EXTRA_OECONF from the .inc files in gcc are
overwritten. I patched gcc-configure-common.inc to fix that (I'll
submit a bugreport about this later):
--- meta/packages/gcc/gcc-configure-common.inc       (revision)
+++ meta/packages/gcc/gcc-configure-common.inc       (working copy)
@@ -13,7 +13,8 @@ JAVA_sh3 ?= ""
 FORTRAN ?= ",f77"
 LANGUAGES ?= "c,c++${FORTRAN}${JAVA}"

-EXTRA_OECONF = "${@['--enable-clocale=generic',
''][bb.data.getVar('USE_NLS', d, 1) != 'no']} \
+EXTRA_OECONF ?= ""
+EXTRA_OECONF += "${@['--enable-clocale=generic',
''][bb.data.getVar('USE_NLS', d, 1) != 'no']} \
                 --with-gnu-ld \
                 --enable-shared \
                 --enable-target-optspace \

This time the build successfully generated everything, including a GCJ
cross-compiler. It looks to be working, I'll report back after I've
run some tests with it.
I did need >512MB of memory while building and compiling libjava took
quite a while...

This leads me to think that it would be best to generate a special BB
file and package for GCJ, so that it does not have to be built always
and does not go into the SDK by default. libgcj.so and especially
libgcj.a are huge, I would not want them in my SDK by default. For my
embedded use, I'll also be modifying libgcj to trim down the size and
I'll probably be rebuilding it quite often while doing that. All the
more reason to split it out of the generic gcc-cross, although I'm not
sure how feasible that is and how to go about that.
Anyone have any ideas about that?

>  Have a look at gcc-4.2.2.inc. As you there are many patches applied
>  which for e.g. ARM. It is likely that you need to have those for your
>  GCC recipe, too.
Yes, all of those are applied.

>  Which perhaps it makes sense then to get everything working from GCJ
>  4.3.0 onwards. AFAIK this release contains all the ARM GCJ stuff we need
>  and we can ask Andrew Haley if important GCJ patches have been
>  introduced after the 4.3.0 release.
>
>  GCC 4.3.0 support in OE is still in its infancy and requires some
>  workarounds. Keep an eye on this list for news about that.
Sounds like a good idea for OE in general; I'll be sticking to 4.2.3
for my application however. Once 4.3.0 starts working, I'll see if I
can make the JAVA stuff work on that. The memory usage of the GCJ
compiler while building libjava is a concern though: I couldn't get
things compiled on my machine with 1GB of RAM. Only after putting 1GB
of extra RAM in my machine, I was able to compile nicely... On
dedicated build servers it might work with 1GB of RAM, but this is a
concern.

Regards,
Matthijs


