Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjaquez@igalia.com>) id 1PKvO9-0005J5-JR
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 17:06:39 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApsEAHN160xbdWOb/2dsb2JhbACjWL4UhUsEiW0
X-IronPort-AV: E=Sophos;i="4.59,242,1288566000"; d="scan'208";a="702347910"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 23 Nov 2010 17:05:26 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1PKvN0-0001Qe-7g
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 17:05:26 +0100
Received: from ip148.dynamic.igalia.com ([192.168.10.148]
	helo=lit.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1PKvN0-0006W7-3h
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 17:05:26 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PKvMz-0001Ut-QJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 17:05:25 +0100
Date: Tue, 23 Nov 2010 17:05:25 +0100
From: =?iso-8859-1?Q?V=EDctor_M=2E_J=E1quez_L=2E?= <vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101123160525.GB3032@lit.local.igalia.com>
References: <20101123113706.GA3533@lit.local.igalia.com>
	<4CEBD252.7000502@mentor.com>
	<20101123145713.GA3032@lit.local.igalia.com>
	<4CEBDABB.1060607@mentor.com>
	<6EB1C564-9BA3-4833-B7F3-72EA4B2F8C51@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <6EB1C564-9BA3-4833-B7F3-72EA4B2F8C51@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 212.51.32.151
X-SA-Exim-Mail-From: vjaquez@igalia.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: external-toolchain-csl-1.0-r6 fails
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
X-List-Received-Date: Tue, 23 Nov 2010 16:06:40 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Nov 23, 2010 at 04:58:54PM +0100, Koen Kooi wrote:
> 
> Op 23 nov 2010, om 16:16 heeft Tom Rini het volgende geschreven:
> 
> > On 11/23/2010 07:57 AM, Víctor M. Jáquez L. wrote:
> >> On Tue, Nov 23, 2010 at 07:40:18AM -0700, Tom Rini wrote:
> >>> On 11/23/2010 04:37 AM, Víctor M. Jáquez L. wrote:
> >>>> I'm trying to build minimal-image with CSL toolchain, but I got this error:
> >>>> 
> >>>> NOTE: package external-toolchain-csl-1.0-r6: task do_install: Started
> >>>> ERROR: TaskFailed event exception, aborting
> >>>> ERROR: Build of /media/DISK/vjaquez-angstrom-setup-scripts/sources/openembedded/recipes/meta/external-toolchain-csl.bb do_install failed
> >>>> ERROR: Task 187 (/media/DISK/vjaquez-angstrom-setup-scripts/sources/openembedded/recipes/meta/external-toolchain-csl.bb, do_install) failed with 256
> >>>> ERROR: '/media/DISK/vjaquez-angstrom-setup-scripts/sources/openembedded/recipes/meta/external-toolchain-csl.bb' failed
> >>>> ERROR: Function do_install failed
> >>>> NOTE: Task failed: ('function do_install failed', '/media/DISK/vjaquez-angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/external-toolchain-csl-1.0-r6/temp/log.do_install.22227')
> >>>> ERROR: Logfile of failure stored in: /media/DISK/vjaquez-angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/external-toolchain-csl-1.0-r6/temp/log.do_install.22227
> >>>> Log data follows:
> >>>> | cp: cannot stat `/media/DISK/sgpp/arm-2010q1/arm-angstrom-linux-gnueabi/libc/lib/*': No such file or directory
> >>>> | ERROR: Function do_install failed
> >>>> NOTE: package external-toolchain-csl-1.0-r6: task do_install: Failed
> >>>> ERROR: TaskFailed event exception, aborting
> >>>> 
> >>>> For some reason the variable ${TARGET_SYS} is evaluated as
> >>>> arm-angstrom-linux-gnueabi instead of arm-none-linux-gnueabi which is the
> >>>> correct value.
> >>> 
> >>> Please post your local.conf settings as well as what version of
> >>> openembedded (and what branch) you are using.
> >> 
> >> I'm using the openembedded's branch org.openembedded.dev (HEAD)
> > [snip]
> >> 
> >> If I apply this patch[1] the problem seems to be solved.
> >> 
> >> 1. http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg11415.html
> > 
> > I thought the patch had been applied.  Koen, do you still object after it was explained that currently angstrom is always going to win setting that variable unless it's made a ?= ?  Thanks!
> 
> I still object to that patch, since a different solution has been applied
> already.

But they not seem to work (at least for me).

> And I still don't see why people want to use known broken
> toolchains...

If you make the statement that angstrom distribution _cannot_ be built using any
external toolchain, I wouldn't object anything. Meanwhile, this patch makes my
configuration work.

vmjl

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 


