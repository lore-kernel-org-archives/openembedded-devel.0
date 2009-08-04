Received: from [209.85.220.224] (helo=mail-fx0-f224.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <maxilos@gmail.com>) id 1MYJO8-0002dK-LA
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Aug 2009 14:45:08 +0200
Received: by fxm24 with SMTP id 24so2980383fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Aug 2009 05:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=zWLB5ysLtra2R/kF4czyIo3iAIjwut5REW2ZZB7+BHM=;
	b=xLYDwIjl27JR/3KTrT1XzDmrTszD5I0/U+m6ZXXkUxfGM4U8UlJdIIQy0W1tF/FtxV
	lMncZjKe0kMzndVfr9JCBawh1pPsmhg0jmyUeM68u21AHw3Y9QkmpCLmFATrit8rUv70
	kzoiVUKnyWDi1fC9rVXW3uqMtGLW1yBkPlMBQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=qZ4ze7D3u4ygRfij4vGcYT4nANEGOm4mck76aRf9/m/gour8DJaKGk1KfsBe0wLbsp
	YwWMVKB6b/dQMF5RDqW/VbmeXW6uFM/AWrXOUUa837jRY6BGxqnFiBgSAMcyCwx363GP
	1n/mohjWzAgyOEt4F3wS1DVXsWBrrrHKbnWWY=
MIME-Version: 1.0
Received: by 10.103.52.13 with SMTP id e13mr2399492muk.67.1249388972841; Tue, 
	04 Aug 2009 05:29:32 -0700 (PDT)
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF94F@hiob.intern.dresearch.de>
References: <AcoU52Sb18YP2SXPQq6rfJAb373LGA==>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF94F@hiob.intern.dresearch.de>
Date: Tue, 4 Aug 2009 15:29:32 +0300
Message-ID: <24aa85dc0908040529v7cf7644x3710335e2102ba0d@mail.gmail.com>
From: Gregory Machairidis <maxilos@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: confusing qemu-native problem
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Aug 2009 12:45:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I had a similar problem after disabled the SELinux everything was fine...

On Tue, Aug 4, 2009 at 12:38 PM, Sledz, Steffen <sledz@dresearch.de> wrote:

> I've seen a very confusing, indetermined behaviour of the qemu-native build
> in the last time (current dev branch).
>
> When calling the following three commands back-to-back the first and the
> second fail with something like "/bin/sh:
> .../staging/i686-linux/usr/bin/pod2man: ...bad interpreter: Permission
> denied" but the third call succeeds (details see below).
>
>  bitbake hydraip-hipox-devimage
>  bitbake qemu-native
>  bitbake qemu-native
>
> In general it looks like the success of the qemu-native is really randomly.
>
> Why does the one call of "bitbake qemu-native" fails and the second
> succeeds?
>
> -----------------------------------------------------------------
> Details:
>
> > bitbake hydraip-hipox-devimage
> __builtin__:74: DeprecationWarning: the sets module is deprecated
> __builtin__:74: DeprecationWarning: the sets module is deprecated
> NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it
> to increase performance.
> NOTE: Handling BitBake files: \ (7018/7018) [100 %]
> NOTE: Parsing finished. 6724 cached, 0 parsed, 294 skipped, 0 masked.
> NOTE: Cache is clean, not saving.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> ...
> NOTE: Running task 1660 of 3019 (ID: 1230, /opt/openembedded/recipes/qemu/
> qemu-native_0.10.3.bb, do_compile)
> NOTE: Running task 1661 of 3019 (ID: 2600,
> /opt/openembedded/recipes/libogg/libtheora_1.0.bb, do_package)
> ERROR: function do_compile failed
> ERROR: log data follows
> (/home/DRESEARCH/production/METABUILD/2009-08-03-15-24-27--hydraip-build--28595/OpenEmbedded/tmp.3/work/i686-linux/qemu-native-0.10.3-r1/temp/log.do_compile.31839)
> | NOTE: make -j 2
> |   CC    qemu-nbd.o
> |   CC    qemu-tool.o
> |   CC    osdep.o
> |   CC    cutils.o
> |   CC    qemu-malloc.o
> |   CC    block-cow.o
> |   CC    block-qcow.o
> |   CC    aes.o
> |   CC    block-vmdk.o
> |   CC    block-cloop.o
> |   CC    block-dmg.o
> |   CC    block-bochs.o
> |   CC    block-vpc.o
> |   CC    block-vvfat.o
> |   CC    block-qcow2.o
> |   CC    block-parallels.o
> |   CC    block-nbd.o
> |   CC    nbd.o
> |   CC    block.o
> |   CC    aio.o
> |   CC    posix-aio-compat.o
> |   CC    block-raw-posix.o
> |   CC    qemu-img.o
> | texi2html -monolithic -number qemu-doc.texi
> | texi2html -monolithic -number qemu-tech.texi
> |
> /home/DRESEARCH/production/METABUILD/2009-08-03-15-24-27--hydraip-build--28595/OpenEmbedded/tmp.3/work/i686-linux/qemu-native-0.10.3-r1/qemu-0.10.3/texi2pod.pl
> qemu-doc.texi qemu.pod
> | pod2man --section=1 --center=" " --release=" " qemu.pod > qemu.1
> | /bin/sh:
> /home/DRESEARCH/production/METABUILD/2009-08-03-15-24-27--hydraip-build--28595/OpenEmbedded/tmp.3/staging/i686-linux/usr/bin/pod2man:
> /home/DRESEARCH/production/METABUILD/2009-08-03-15-24-27--hydraip-build--28595:
> bad interpreter: Permission denied
> | make: *** [qemu.1] Error 126
> | make: *** Waiting for unfinished jobs....
> | FATAL: oe_runmake failed
> NOTE: Task failed:
> /home/DRESEARCH/production/METABUILD/2009-08-03-15-24-27--hydraip-build--28595/OpenEmbedded/tmp.3/work/i686-linux/qemu-native-0.10.3-r1/temp/log.do_compile.31839
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /opt/openembedded/recipes/qemu/qemu-native_0.10.3.bbdo_compile failed
> NOTE: Running task 1662 of 3019 (ID: 2574,
> /opt/openembedded/recipes/libmad/libmad_0.15.1b.bb, do_package)
> ERROR: Task 1230 (/opt/openembedded/recipes/qemu/qemu-native_0.10.3.bb,
> do_compile) failed
> NOTE: Waiting for 1 active tasks to finish
> NOTE: 1: /opt/openembedded/recipes/libmad/libmad_0.15.1b.bb, do_package
> (32041)
> NOTE: Tasks Summary: Attempted 1660 tasks of which 1651 didn't need to be
> rerun and 1 failed.
> ERROR: '/opt/openembedded/recipes/qemu/qemu-native_0.10.3.bb' failed
>
> > bitbake qemu-native
> __builtin__:74: DeprecationWarning: the sets module is deprecated
> __builtin__:74: DeprecationWarning: the sets module is deprecated
> NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it
> to increase performance.
> NOTE: Handling BitBake files: \ (7018/7018) [100 %]
> NOTE: Parsing finished. 6724 cached, 0 parsed, 294 skipped, 0 masked.
> NOTE: Cache is clean, not saving.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 118 of 186 (ID: 7, /opt/openembedded/recipes/qemu/
> qemu-native_0.10.3.bb, do_compile)
> NOTE: Running task 177 of 186 (ID: 13, /opt/openembedded/recipes/qemu/
> qemu-native_0.10.3.bb, do_distribute_sources)
> ERROR: function do_compile failed
> ERROR: log data follows
> (/home/DRESEARCH/production/METABUILD/2009-08-03-15-24-27--hydraip-build--28595/OpenEmbedded/tmp.3/work/i686-linux/qemu-native-0.10.3-r1/temp/log.do_compile.32118)
> | NOTE: make -j 2
> |   LINK  qemu-nbd
> |   LINK  qemu-img
> |
> /home/DRESEARCH/production/METABUILD/2009-08-03-15-24-27--hydraip-build--28595/OpenEmbedded/tmp.3/work/i686-linux/qemu-native-0.10.3-r1/qemu-0.10.3/texi2pod.pl
> qemu-img.texi qemu-img.pod
> |
> /home/DRESEARCH/production/METABUILD/2009-08-03-15-24-27--hydraip-build--28595/OpenEmbedded/tmp.3/work/i686-linux/qemu-native-0.10.3-r1/qemu-0.10.3/texi2pod.pl
> qemu-nbd.texi qemu-nbd.pod
> | pod2man --section=1 --center=" " --release=" " qemu-img.pod > qemu-img.1
> | pod2man --section=8 --center=" " --release=" " qemu-nbd.pod > qemu-nbd.8
> | /bin/sh:
> /home/DRESEARCH/production/METABUILD/2009-08-03-15-24-27--hydraip-build--28595/OpenEmbedded/tmp.3/staging/i686-linux/usr/bin/pod2man:
> /home/DRESEARCH/production/METABUILD/2009-08-03-15-24-27--hydraip-build--28595:
> bad interpreter: Permission denied
> | make: *** [qemu-nbd.8] Error 126
> | make: *** Waiting for unfinished jobs....
> | /bin/sh:
> /home/DRESEARCH/production/METABUILD/2009-08-03-15-24-27--hydraip-build--28595/OpenEmbedded/tmp.3/staging/i686-linux/usr/bin/pod2man:
> /home/DRESEARCH/production/METABUILD/2009-08-03-15-24-27--hydraip-build--28595:
> bad interpreter: Permission denied
> | make: *** [qemu-img.1] Error 126
> | FATAL: oe_runmake failed
> NOTE: Task failed:
> /home/DRESEARCH/production/METABUILD/2009-08-03-15-24-27--hydraip-build--28595/OpenEmbedded/tmp.3/work/i686-linux/qemu-native-0.10.3-r1/temp/log.do_compile.32118
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /opt/openembedded/recipes/qemu/qemu-native_0.10.3.bbdo_compile failed
> ERROR: Task 7 (/opt/openembedded/recipes/qemu/qemu-native_0.10.3.bb,
> do_compile) failed
> NOTE: Waiting for 1 active tasks to finish
> NOTE: 1: /opt/openembedded/recipes/qemu/qemu-native_0.10.3.bb,
> do_distribute_sources (32119)
> NOTE: Tasks Summary: Attempted 175 tasks of which 175 didn't need to be
> rerun and 1 failed.
> ERROR: '/opt/openembedded/recipes/qemu/qemu-native_0.10.3.bb' failed
>
>
> > bitbake qemu-native
> __builtin__:74: DeprecationWarning: the sets module is deprecated
> __builtin__:74: DeprecationWarning: the sets module is deprecated
> NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it
> to increase performance.
> NOTE: Handling BitBake files: \ (7018/7018) [100 %]
> NOTE: Parsing finished. 6724 cached, 0 parsed, 294 skipped, 0 masked.
> NOTE: Cache is clean, not saving.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 118 of 186 (ID: 7, /opt/openembedded/recipes/qemu/
> qemu-native_0.10.3.bb, do_compile)
> NOTE: Running task 178 of 186 (ID: 8, /opt/openembedded/recipes/qemu/
> qemu-native_0.10.3.bb, do_install)
> NOTE: Running task 179 of 186 (ID: 12, /opt/openembedded/recipes/qemu/
> qemu-native_0.10.3.bb, do_package)
> NOTE: Running task 180 of 186 (ID: 9, /opt/openembedded/recipes/qemu/
> qemu-native_0.10.3.bb, do_populate_staging)
> NOTE: Running task 181 of 186 (ID: 16, /opt/openembedded/recipes/qemu/
> qemu-native_0.10.3.bb, do_package_write_ipk)
> NOTE: Running task 182 of 186 (ID: 11, /opt/openembedded/recipes/qemu/
> qemu-native_0.10.3.bb, do_package_write)
> NOTE: Running task 183 of 186 (ID: 15, /opt/openembedded/recipes/qemu/
> qemu-native_0.10.3.bb, do_package_stage)
> NOTE: Running task 184 of 186 (ID: 10, /opt/openembedded/recipes/qemu/
> qemu-native_0.10.3.bb, do_qa_staging)
> NOTE: Running task 185 of 186 (ID: 14, /opt/openembedded/recipes/qemu/
> qemu-native_0.10.3.bb, do_package_stage_all)
> NOTE: Running task 186 of 186 (ID: 0, /opt/openembedded/recipes/qemu/
> qemu-native_0.10.3.bb, do_build)
> NOTE: Tasks Summary: Attempted 186 tasks of which 176 didn't need to be
> rerun and 0 failed.
>
> -----------------------------------------------------------------
>
> Steffen
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Grigorios Machairidis
--------------------------------------------
Connect I.T - www.connectit.gr
Bas. Sofias 5
Xanthi - 67100
Greece
Mob: +306945878331
Tel: +30 25410 64089
Fax: +30 25410 64088
--------------------------------------------

