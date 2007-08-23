Received: from [64.233.166.177] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <yakov.zaytsev@gmail.com>) id 1IO9Cs-0007Xr-0o
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Aug 2007 11:42:26 +0200
Received: by py-out-1112.google.com with SMTP id a25so919130pyi
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2007 02:41:15 -0700 (PDT)
Received: by 10.35.14.18 with SMTP id r18mr1899026pyi.1187862074912;
	Thu, 23 Aug 2007 02:41:14 -0700 (PDT)
Received: by 10.35.93.7 with HTTP; Thu, 23 Aug 2007 02:41:14 -0700 (PDT)
Message-ID: <1ef816af0708230241s62454f78oa0147b10cae53ce6@mail.gmail.com>
Date: Thu, 23 Aug 2007 13:41:14 +0400
From: yakov.zaytsev@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90708221646p6cfd0e6do6574668bbe15d775@mail.gmail.com>
MIME-Version: 1.0
References: <1ef816af0708221151m5c3c2b4ds9b90fdbddc56d8d1@mail.gmail.com>
	<19c1b8a90708221646p6cfd0e6do6574668bbe15d775@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: binutils-cross_2.17.50.0.5.bb failed
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
X-List-Received-Date: Thu, 23 Aug 2007 09:42:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

..binutils-cross-2.17.50.0.5-r1/temp/log.do_configure.8057 contains

--
/Volumes/OE/stuff/build/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-
cross-2.17.50.0.5-r1/temp/run.do_configure.8057: line 782: do_configure:
command not found
--

On 8/23/07, Khem Raj <raj.khem@gmail.com> wrote:
>
> Can you post
>
> /Volumes/OE/stuff/build/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-
> cross-2.17.50.0.5-r1/temp/log.do_configure.8057
>
> my guess is you might be missing the prerequisites needed.
>
> check here
>
> http://www.openembedded.org/wiki/RequiredSoftware
>
> and
>
> http://www.openembedded.org/wiki/BuildOnOSX
>
> HTH
>
> -Khem
> On 8/22/07, yakov.zaytsev@gmail.com <yakov.zaytsev@gmail.com> wrote:
> > Hi,
> >
> > I'm using Mac OSX 10.4.10 on MacBook Core 2 Duo 2.16.. I've done usual
> setup
> > as it described in the Wiki..
> >
> > Here's the problem
> >
> > Any OE/Mac OSX users? How is it possible to fix this issue. I'm quite
> new to
> > OpenEmbedded world, so I will be really thankful if you give some more
> > details..
> >
> > Thanks in advance!
> >
> > $ bitbake nano
> > NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it
> to
> > increase performance.
> > NOTE: Handling BitBake files: \ (4573/4573) [100 %]
> > NOTE: Parsing finished. 4355 cached, 0 parsed, 218 skipped, 0 masked.
> > NOTE: build 200708222235: started
> >
> > OE Build Configuration:
> > BB_VERSION     = "1.8.9"
> > OE_REVISION    = "4ceb0ef60a086087bfe7a232b07d6fb71c3ccd04"
> > TARGET_ARCH    = "arm"
> > TARGET_OS      = "linux-gnueabi"
> > MACHINE        = "c7x0"
> > DISTRO         = "angstrom"
> > DISTRO_VERSION = "test-20070822"
> > TARGET_FPU     = "soft"
> >
> > NOTE: Resolving missing task queue dependencies
> > NOTE: preferred version 2.5 of glibc not available (for item
> > virtual/arm-angstrom-linux-gnueabi-libc-for-gcc)
> > NOTE: Preparing runqueue
> > NOTE: Executing runqueue
> > NOTE: Running task 128 of 314 (ID: 237,
> >
> /Volumes/OE/stuff/org.openembedded.dev/packages/binutils/binutils-cross_2.17.50.0.5.bb,
> > do_configure)
> > NOTE: package binutils-cross-2.17.50.0.5: started
> > NOTE: package binutils-cross-2.17.50.0.5-r1: task do_configure: started
> > ERROR: Information not available for target 'i386-darwin'
> > NOTE: <type 'exceptions.AttributeError'>:'NoneType' object has no
> attribute
> > 'append' while evaluating:
> > ${@siteinfo_get_files(d)}
> > ERROR: Information not available for target 'i386-darwin'
> > NOTE: <type 'exceptions.AttributeError'>:'NoneType' object has no
> attribute
> > 'append' while evaluating:
> > ${@siteinfo_get_files(d)}
> > NOTE: <type 'exceptions.AttributeError'>:'NoneType' object has no
> attribute
> > 'append' while evaluating:
> >         (cd ${S}; gnu-configize) || die "Failed to run gnu-configize"
> >         oe_runconf
> > #
> > # must prime config.cache to ensure the build of libiberty
> > #
> >         mkdir -p ${B}/build-${BUILD_SYS}
> >         for i in ${CONFIG_SITE}; do
> >             cat $i >> ${B}/build-${BUILD_SYS}/config.cache
> >         done
> >
> > ERROR: function do_configure failed
> > ERROR: log data follows
> >
> (/Volumes/OE/stuff/build/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-
> > cross-2.17.50.0.5-r1/temp/log.do_configure.8057)
> > |
> /Volumes/OE/stuff/build/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-
> > cross-2.17.50.0.5-r1/temp/run.do_configure.8057: line 782: do_configure:
> > command not found
> > NOTE: Task failed:
> >
> /Volumes/OE/stuff/build/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-
> > cross-2.17.50.0.5-r1/temp/log.do_configure.8057
> > NOTE: package binutils-cross-2.17.50.0.5-r1: task do_configure: failed
> > ERROR: TaskFailed event exception, aborting
> > NOTE: package binutils-cross-2.17.50.0.5: failed
> > ERROR: Build of
> >
> /Volumes/OE/stuff/org.openembedded.dev/packages/binutils/binutils-cross_2.17.50.0.5.bb
> > do_configure failed
> > ERROR: Task 237
> >
> (/Volumes/OE/stuff/org.openembedded.dev/packages/binutils/binutils-cross_2.17.50.0.5.bb,
> > do_configure) failed
> > NOTE: Tasks Summary: Attempted 127 tasks of which 127 didn't need to be
> > rerun and 1 failed.
> > ERROR:
> >
> '/Volumes/OE/stuff/org.openembedded.dev/packages/binutils/binutils-cross_2.17.50.0.5.bb'
> > failed
> >
> >
> >
> > Best wishes,
> > Yakov
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

