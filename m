Received: from [209.85.146.181] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <raj.khem@gmail.com>) id 1J2eq9-0001e5-34
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2007 04:34:25 +0100
Received: by wa-out-1112.google.com with SMTP id l24so875355waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2007 19:30:01 -0800 (PST)
Received: by 10.114.110.1 with SMTP id i1mr1654711wac.112.1197516601483;
	Wed, 12 Dec 2007 19:30:01 -0800 (PST)
Received: by 10.114.208.4 with HTTP; Wed, 12 Dec 2007 19:30:01 -0800 (PST)
Message-ID: <19c1b8a90712121930i73dcf071wff373d0d9e4fc6c6@mail.gmail.com>
Date: Wed, 12 Dec 2007 19:30:01 -0800
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4760A2AD.8050709@gmail.com>
MIME-Version: 1.0
References: <fjq200$d43$1@ger.gmane.org> <4760A2AD.8050709@gmail.com>
Subject: Re: Why is package external-toolchain-1.0 failing?
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
X-List-Received-Date: Thu, 13 Dec 2007 03:34:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Can you attach your local conf file that you might have created.

Khem

On Dec 12, 2007 7:10 PM, Jacob Thebault-Spieker
<summatusmentis@gmail.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> I was having that trouble, and I'm not exactly sure what happened, but
> it magically fixed itself. I just kept updating every day, and I believe
> I re-pulled the tree at one point. Again, I don't know why my build
> wasn't finishing, it kept throwing errors that weren't true. Regardless,
> it fixed itself, sorry I can't be more help.
>
> - --
> Jacob Thebault-Spieker
> Cell: (207) 717-5114
>
>
>
> Grant Edwards wrote:
> > I've followed the step-by-step instructions on the "getting
> > started with OE" web page for a Zaurus SL5500, but when I try
> > to do the example build command "bitbake nano" it fails.
> > Google didn't really find anything that seemed helpful.  I
> > searched the mailing list and found a posting a coule weeks ago
> > from somebody who had the exact same issue, but that posting
> > got no useful responses (possibly because it hijacked a
> > thread).
> >
> > What is an "external toolchain", do I need one to build for an
> > SL5500 target?  If I do need one, why doesn't bitbake know how
> > to build one?
> >
> > Here's the output from the "bitbake nano" command:
> >
> > ________________________________________________________________________
> > Parsing .bb files, please wait...done.
> > NOTE: Parsing finished. 4675 cached, 0 parsed, 218 skipped, 0 masked.
> > NOTE: build 200712121925: started
> >
> > OE Build Configuration:
> > BB_VERSION     = "1.8.8"
> > OE_REVISION    = "47aec7f5811a7e41e48a85cc8ca83a9ef745e862"
> > TARGET_ARCH    = "arm"
> > TARGET_OS      = "linux"
> > MACHINE        = "collie"
> > DISTRO         = "angstrom"
> > DISTRO_VERSION = "2007.9-test-20071213"
> > TARGET_FPU     = "soft"
> >
> > NOTE: Resolving missing task queue dependencies
> > NOTE: multiple providers are available for linux-libc-headers (linux-libc-headers, external-toolchain);
> > NOTE: consider defining PREFERRED_PROVIDER_linux-libc-headers
> > NOTE: multiple providers are available for virtual/arm-angstrom-linux-binutils (external-toolchain, binutils-cross);
> > NOTE: consider defining PREFERRED_PROVIDER_virtual/arm-angstrom-linux-binutils
> > NOTE: preferred version 2.5 of glibc not available (for item virtual/arm-angstrom-linux-libc-for-gcc)
> > NOTE: Preparing runqueue
> > NOTE: Executing runqueue
> > NOTE: Running task 88 of 281 (ID: 126, /home/grante/quarq/oe/org.openembedded.dev/packages/meta/external-toolchain.bb, do_populate_staging)
> > NOTE: package external-toolchain-1.0: started
> > NOTE: package external-toolchain-1.0-r1: task do_populate_staging: started
> > ERROR: function do_stage failed
> > ERROR: log data follows (/home/grante/quarq/oe/tmp/work/i686-arm-oabi-sdk-angstrom-linux/external-toolchain-1.0-r1/temp/log.do_stage.8896)
> > | The external toolchain could not be found in /usr/local/angstrom/arm!
> > NOTE: Task failed: /home/grante/quarq/oe/tmp/work/i686-arm-oabi-sdk-angstrom-linux/external-toolchain-1.0-r1/temp/log.do_stage.8896
> > NOTE: package external-toolchain-1.0-r1: task do_populate_staging: failed
> > ERROR: TaskFailed event exception, aborting
> > NOTE: package external-toolchain-1.0: failed
> > ERROR: Build of /home/grante/quarq/oe/org.openembedded.dev/packages/meta/external-toolchain.bb do_populate_staging failed
> >
> > NOTE: Parsing finished. 4675 cached, 0 parsed, 218 skipped, 0 masked.
> > NOTE: build 200712121925: started
> >
> > OE Build Configuration:
> > BB_VERSION     = "1.8.8"
> > OE_REVISION    = "47aec7f5811a7e41e48a85cc8ca83a9ef745e862"
> > TARGET_ARCH    = "arm"
> > TARGET_OS      = "linux"
> > MACHINE        = "collie"
> > DISTRO         = "angstrom"
> > DISTRO_VERSION = "2007.9-test-20071213"
> > TARGET_FPU     = "soft"
> >
> > NOTE: Resolving missing task queue dependencies
> > NOTE: multiple providers are available for linux-libc-headers (linux-libc-headers, external-toolchain);
> > NOTE: consider defining PREFERRED_PROVIDER_linux-libc-headers
> > NOTE: multiple providers are available for virtual/arm-angstrom-linux-binutils (external-toolchain, binutils-cross);
> > NOTE: consider defining PREFERRED_PROVIDER_virtual/arm-angstrom-linux-binutils
> > NOTE: preferred version 2.5 of glibc not available (for item virtual/arm-angstrom-linux-libc-for-gcc)
> > NOTE: Preparing runqueue
> > NOTE: Executing runqueue
> > NOTE: Running task 88 of 281 (ID: 126, /home/grante/quarq/oe/org.openembedded.dev/packages/meta/external-toolchain.bb, do_populate_staging)
> > ERROR: Task 126 (/home/grante/quarq/oe/org.openembedded.dev/packages/meta/external-toolchain.bb, do_populate_staging) failed
> > NOTE: Tasks Summary: Attempted 87 tasks of which 87 didn't need to be rerun and 1 failed.
> > ERROR: '/home/grante/quarq/oe/org.openembedded.dev/packages/meta/external-toolchain.bb' failed
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.7 (Darwin)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
>
> iD8DBQFHYKKttXjjJ1zu9YARAstxAJwPEf2DdK55zVcnSOtRNsYeD/piTgCgrBVc
> oe3MdlRaq0wQExFvyUqDqNk=
> =ybrf
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


