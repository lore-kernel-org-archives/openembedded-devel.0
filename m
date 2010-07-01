Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OUDDn-0004ff-OI
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 08:26:05 +0200
Received: by iwn34 with SMTP id 34so1726137iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 23:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=LacGVv0UR4U1rWPyiwrw9q8OjAF79aSNQfClsV0PtRI=;
	b=D/3RZgpF8DK+rDzwI5i4/pYIaaezkJJ5tjUK3YThGQCanvieu0lGCaH4KF0BNmSJ42
	qxdyMgxpxJ6nDZoSHNxYp+/eeYH9t0xVNHkTdLB68WTHEPDp7Y6i10NKHfVAVT4bhIbF
	hbprJ9triDtKaaKcN9rD1aOizESNd5kwd7mMU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=oC5Hu+tHMnBDUT91IzCpf5Zui26/5+Hylubxv+Dw04l+SpTDkxH69H6fU2qYVrUmVh
	aYFEQiNMFTiLzOajSxYWOOvdahHhzVSCcGI+ThPV6TbMs1eK5CoOSTOEX8TKvjYuJcDa
	gSHfi3ahbPmPLmCQtJh4NsW86o/pOecCBX6p0=
Received: by 10.231.149.203 with SMTP id u11mr9343860ibv.6.1277965277593; Wed, 
	30 Jun 2010 23:21:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Wed, 30 Jun 2010 23:20:56 -0700 (PDT)
In-Reply-To: <1F636E49-E311-4487-A341-8CAD71822723@keylevel.com>
References: <1F636E49-E311-4487-A341-8CAD71822723@keylevel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Jun 2010 23:20:56 -0700
Message-ID: <AANLkTimUb1oZwkDumunRgMatNtM5Mno1hpkeH2_mPJeA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux-geodelx build failure
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
X-List-Received-Date: Thu, 01 Jul 2010 06:26:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 30, 2010 at 3:57 PM, Chris Tapp <dokuwiki@keylevel.com> wrote:
> Whilst investigating an issue I have with 'swapper' using all the cpu tim=
e I
> decided to try and use the linux-geodelx kernel as my target is an LX800.
>
> I changed my configuration to use Angstrom for the geodelx machine and ra=
n
> 'bitbake linux-geodelx'. This failed to build due to:
>
> ERROR: log data follows
> (/home/chris/oe-dev/build/tmp/work/geode-angstrom-linux/glibc-2.9-r36.3/t=
emp/log.do_configure.29301)
> | configure.in:2204: warning: AC_CACHE_VAL(pic_default, ...): suspicious
> cache-id, must contain _cv_ to be cached
> | ../../lib/autoconf/general.m4:1999: AC_CACHE_VAL is expanded from...
> | ../../lib/autoconf/general.m4:2020: AC_CACHE_CHECK is expanded from...
> | configure.in:2204: the top level
> | checking build system type... i686-pc-linux-gnu
> | checking host system type... i486-angstrom-linux-gnu
> | configure: running configure fragment for add-on nptl
> | checking sysdep dirs... configure: error: The geode subspecies of i486 =
is
> not supported.
> NOTE: Task failed:
> /home/chris/oe-dev/build/tmp/work/geode-angstrom-linux/glibc-2.9-r36.3/te=
mp/log.do_configure.29301
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/chris/oe-dev/openembedded/recipes/glibc/glibc_2.9.b=
b
> do_configure failed
> ERROR: Task 170 (/home/chris/oe-dev/openembedded/recipes/glibc/glibc_2.9.=
bb,
> do_configure) failed
>
> I'm thinking I've done something wrong here as I would expect a geode bui=
ld
> to support the 'geode subspecies' :-) Except that it seems as if a patch =
was
> proposed in the past to change the geodelx (and gx) machine recipes to us=
e
> i586. This does not appear to have been applied to the current version. S=
ee
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2009-November/014=
489.html
>

there were concerns around performance. Thats why it was
not applied but I guess there is no other way if we
wanted to use modern glibc on it.


> However, =A0if I make these changes and try to build I get:
>
> ERROR: function do_compile failed
> ERROR: log data follows
> (/home/chris/oe-dev/build-2/tmp/work/geodelx-angstrom-linux/linux-geodelx=
-2.6.11-r0/temp/log.do_compile.2242)
> | NOTE: make -j 4 include/linux/version.h CC=3Di586-angstrom-linux-gcc
> =A0LD=3Di586-angstrom-linux-ld
> | =A0 CHK =A0 =A0 include/linux/version.h
> | NOTE: make -j 4 bzImage CC=3Di586-angstrom-linux-gcc
> =A0LD=3Di586-angstrom-linux-ld
> | =A0 CHK =A0 =A0 include/linux/version.h
> | make[1]: `arch/i386/kernel/asm-offsets.s' is up to date.
> | =A0 CHK =A0 =A0 include/linux/compile.h
> | =A0 CHK =A0 =A0 usr/initramfs_list
> | =A0 CC =A0 =A0 =A0arch/i386/kernel/process.o
> | =A0 CC =A0 =A0 =A0arch/i386/kernel/semaphore.o
> | =A0 CC =A0 =A0 =A0arch/i386/mach-default/setup.o
> | =A0 LD =A0 =A0 =A0arch/i386/crypto/built-in.o
> | =A0 CC =A0 =A0 =A0kernel/sched.o
> | =A0 CC =A0 =A0 =A0arch/i386/kernel/signal.o
> | =A0 CC =A0 =A0 =A0arch/i386/mach-default/topology.o
> | arch/i386/kernel/process.c: Assembler messages:
> | arch/i386/kernel/process.c:400: Error: suffix or operands invalid for
> `mov'
> | arch/i386/kernel/process.c:401: Error: suffix or operands invalid for
> `mov'
> | arch/i386/kernel/process.c:477: Error: suffix or operands invalid for
> `mov'
> | arch/i386/kernel/process.c:478: Error: suffix or operands invalid for
> `mov'
> | include/linux/elfcore.h:92: Error: suffix or operands invalid for `mov'
> | include/linux/elfcore.h:92: Error: suffix or operands invalid for `mov'
> | arch/i386/kernel/process.c:599: Error: suffix or operands invalid for
> `mov'
> | arch/i386/kernel/process.c:600: Error: suffix or operands invalid for
> `mov'
> | arch/i386/kernel/process.c:607: Error: suffix or operands invalid for
> `mov'
> | arch/i386/kernel/process.c:608: Error: suffix or operands invalid for
> `mov'
> | make[1]: *** [arch/i386/kernel/process.o] Error 1
> | make[1]: *** Waiting for unfinished jobs....
> | =A0 CC =A0 =A0 =A0kernel/fork.o
> | =A0 LD =A0 =A0 =A0arch/i386/mach-default/built-in.o
> | =A0 CC =A0 =A0 =A0mm/bootmem.o
> | arch/i386/kernel/signal.c: Assembler messages:
> | arch/i386/kernel/signal.c:165: Error: suffix or operands invalid for `m=
ov'
> | arch/i386/kernel/signal.c:166: Error: suffix or operands invalid for `m=
ov'
> | make[1]: *** [arch/i386/kernel/signal.o] Error 1
> | make: *** [arch/i386/kernel] Error 2
> | make: *** Waiting for unfinished jobs....
> | =A0 CC =A0 =A0 =A0mm/filemap.o
> | =A0 CC =A0 =A0 =A0kernel/exec_domain.o
> | =A0 CC =A0 =A0 =A0mm/mempool.o
> | =A0 CC =A0 =A0 =A0kernel/panic.o
> | =A0 CC =A0 =A0 =A0kernel/printk.o
> | =A0 CC =A0 =A0 =A0kernel/profile.o
> | =A0 CC =A0 =A0 =A0mm/oom_kill.o
> | mm/filemap.c: In function '__generic_file_aio_write_nolock':
> | mm/filemap.c:1799: sorry, unimplemented: inlining failed in call to
> 'generic_write_checks': function body not available
> | mm/filemap.c:2087: sorry, unimplemented: called from here
> | make[1]: *** [mm/filemap.o] Error 1
> | make[1]: *** Waiting for unfinished jobs....
> | =A0 CC =A0 =A0 =A0kernel/exit.o



2.6.11 is a bit old kernel version and you have to use
older binutils (i.e. lower than 2.18) to build it.





>
> Chris
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


