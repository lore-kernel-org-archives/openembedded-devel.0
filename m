Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MgeQi-00054M-2K
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 14:50:16 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 9121D1B10C06
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2009 12:36:34 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Aug 2009 14:31:56 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <E1MgPr6-0006GQ-GT@melo.openembedded.org>
	<1251357326.4215.577.camel@lenovo.internal.reciva.com>
	<1251372751.3420.30.camel@hammer.suse.cz>
In-Reply-To: <1251372751.3420.30.camel@hammer.suse.cz>
MIME-Version: 1.0
Message-Id: <200908271431.56785.holger+oe@freyther.de>
Subject: Re: [oe-commits] Stanislav Brabec : glibc: Install	ld.so.conf , so ldconfig does not complain .
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
X-List-Received-Date: Thu, 27 Aug 2009 12:50:16 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 27 August 2009 13:32:31 Stanislav Brabec wrote:
> Phil Blundell wrote:
> > > I have the feeling this is the reversal of a previous decision to
> > > remove ld.so.conf from rootfs.
> > >
> > > Also its a core change and I don't see any Acked-By:
> >
> > Agreed, that change seems wrong.  If a particular DISTRO wants to ship
> > ld.so.conf in glibc then that's fine,
>
> I just reverted this change. Sorry for that. It looked just like a typo:
> ld.so.conf was copied to source tree and the patch suppressing the
> warning on missing ld.so.conf (ldconfig.patch) was commented out...
>
> If missing ld.so.conf is intended, ld.co.sonf could be removed from
> recipes and ldconfig.patch (or at least its last chunk) should be
> applied.
>
> > but it shouldn't be standard and
> > definitely not without a USE_LDCONFIG conditional.
>
> It was inside USE_LDCONFIG, if ldconfig is installed.
>
> By the way, what is the benefit of not using ldconfig? Strace shows 15
> extra failing library lookups for each library.

did we disable the hwcaps patch once again?

z.


