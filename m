Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MdOL5-00022P-Hq
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 15:02:59 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 6EB481B10C07
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 12:49:37 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Aug 2009 14:45:14 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <E1Md2kK-0008Uz-Fd@melo.openembedded.org>
	<200908180350.02392.holger+oe@freyther.de>
	<20090818042332.GN2227@smtp.west.cox.net>
In-Reply-To: <20090818042332.GN2227@smtp.west.cox.net>
MIME-Version: 1.0
Message-Id: <200908181445.14786.holger+oe@freyther.de>
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
X-List-Received-Date: Tue, 18 Aug 2009 13:02:59 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 18 August 2009 06:23:32 Tom Rini wrote:
> On Tue, Aug 18, 2009 at 03:50:02AM +0200, Holger Hans Peter Freyther wrote:
> > On Monday 17 August 2009 17:24:08 Tom Rini wrote:
> > > Given that the answer is the same for mipsel-linux and
> > > mipsel-linux-uclibc, this is probably the wrong place.  The right place
> > > is either a mips common one or a linux common one (if it's also the
> > > same for every other linux platform).
> >
> > To be honest CONFIG_SITE is always a bit of black magic to me. Can I just
> > create mipsel-common and it will be picked up? Actually I should just try
> > it.
>
> What's picked up depends on siteinfo.bbclass.  So you'd have to add it
> there.  But, it's quite likely these belong in common-linux:
> $ grep ac_cv_sys_restartable_syscalls *
> armeb-linux:ac_cv_sys_restartable_syscalls=yes
> armeb-linux-uclibc:ac_cv_sys_restartable_syscalls=yes
> arm-linux:ac_cv_sys_restartable_syscalls=yes
> arm-linux-uclibc:ac_cv_sys_restartable_syscalls=yes
> ix86-common:ac_cv_sys_restartable_syscalls=yes
> ix86-common:ac_cv_sys_restartable_syscalls=yes
> powerpc-common:ac_cv_sys_restartable_syscalls=yes
> sh-common:ac_cv_sys_restartable_syscalls=yes
> sparc-linux:ac_cv_sys_restartable_syscalls=yes
> $ grep ac_cv_conv_longlong_to_float *
> arm-common:ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
> ix86-common:ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes
>}
> powerpc-common:ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=
>yes}
> sh-common:ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}

Good points,

I started creating a mipsel-common and the net result would be that the 
mipsel-linux,mipsel-linux-uclibc files will be empty. I will need some more 
time to do this cleanup...


