Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MdGUt-0000C1-0k
	for openembedded-devel@openembedded.org; Tue, 18 Aug 2009 06:40:35 +0200
Received: (qmail 15289 invoked from network); 18 Aug 2009 04:23:32 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 17 Aug 2009 21:23:32 -0700
Date: Mon, 17 Aug 2009 21:23:32 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090818042332.GN2227@smtp.west.cox.net>
References: <E1Md2kK-0008Uz-Fd@melo.openembedded.org>
	<20090817152407.GA2227@smtp.west.cox.net>
	<200908180350.02392.holger+oe@freyther.de>
MIME-Version: 1.0
In-Reply-To: <200908180350.02392.holger+oe@freyther.de>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [oe-commits] Holger Hans Peter Freyther : site: Add ac	value?for mipsel-linux and mipsel-linux-uclibc
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
X-List-Received-Date: Tue, 18 Aug 2009 04:40:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 18, 2009 at 03:50:02AM +0200, Holger Hans Peter Freyther wrote:
> On Monday 17 August 2009 17:24:08 Tom Rini wrote:
> 
> > Given that the answer is the same for mipsel-linux and
> > mipsel-linux-uclibc, this is probably the wrong place.  The right place
> > is either a mips common one or a linux common one (if it's also the same
> > for every other linux platform).
> 
> To be honest CONFIG_SITE is always a bit of black magic to me. Can I just 
> create mipsel-common and it will be picked up? Actually I should just try it.

What's picked up depends on siteinfo.bbclass.  So you'd have to add it
there.  But, it's quite likely these belong in common-linux:
$ grep ac_cv_sys_restartable_syscalls *
armeb-linux:ac_cv_sys_restartable_syscalls=yes
armeb-linux-uclibc:ac_cv_sys_restartable_syscalls=yes
arm-linux:ac_cv_sys_restartable_syscalls=yes
arm-linux-uclibc:ac_cv_sys_restartable_syscalls=yes
ix86-common:ac_cv_sys_restartable_syscalls=yes
ix86-common:ac_cv_sys_restartable_syscalls=yes
powerpc-common:ac_cv_sys_restartable_syscalls=yes
sh-common:ac_cv_sys_restartable_syscalls=yes
sparc-linux:ac_cv_sys_restartable_syscalls=yes
$ grep ac_cv_conv_longlong_to_float *
arm-common:ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
ix86-common:ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
powerpc-common:ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
sh-common:ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}

-- 
Tom Rini


