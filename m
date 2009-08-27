Received: from [84.21.108.25] (helo=ns.penguin.cz ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MgdUx-0005DM-NM
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 13:50:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id AB89D1416BC5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2009 13:24:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gAgIiZZe0JMt
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2009 13:24:52 +0200 (CEST)
Received: from [10.20.1.86] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id 8BDD51416BAC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2009 13:24:52 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1251357326.4215.577.camel@lenovo.internal.reciva.com>
References: <E1MgPr6-0006GQ-GT@melo.openembedded.org>
	<4A962EA9.8010908@xora.org.uk>
	<1251357326.4215.577.camel@lenovo.internal.reciva.com>
Date: Thu, 27 Aug 2009 13:32:31 +0200
Message-Id: <1251372751.3420.30.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.27.90 
Subject: Re: [oe-commits] Stanislav Brabec : glibc: Install	ld.so.conf, so ldconfig does not complain .
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
X-List-Received-Date: Thu, 27 Aug 2009 11:50:36 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
   
> > I have the feeling this is the reversal of a previous decision to remove 
> > ld.so.conf from rootfs.
> > 
> > Also its a core change and I don't see any Acked-By:
> 
> Agreed, that change seems wrong.  If a particular DISTRO wants to ship
> ld.so.conf in glibc then that's fine,

I just reverted this change. Sorry for that. It looked just like a typo:
ld.so.conf was copied to source tree and the patch suppressing the
warning on missing ld.so.conf (ldconfig.patch) was commented out...

If missing ld.so.conf is intended, ld.co.sonf could be removed from
recipes and ldconfig.patch (or at least its last chunk) should be
applied.

> but it shouldn't be standard and
> definitely not without a USE_LDCONFIG conditional.

It was inside USE_LDCONFIG, if ldconfig is installed.

By the way, what is the benefit of not using ldconfig? Strace shows 15
extra failing library lookups for each library.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



