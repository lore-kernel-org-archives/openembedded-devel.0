Received: from [84.21.108.25] (helo=ns.penguin.cz ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Mgfjv-0005An-2Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 16:14:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 65A3F1416BAC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2009 15:48:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iQ4A2G3jDfWY
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2009 15:48:27 +0200 (CEST)
Received: from [10.20.1.86] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id 3C0431416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2009 15:48:27 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1251379478.27780.31.camel@mill.internal.reciva.com>
References: <E1MgPr6-0006GQ-GT@melo.openembedded.org>
	<4A962EA9.8010908@xora.org.uk>
	<1251357326.4215.577.camel@lenovo.internal.reciva.com>
	<1251372751.3420.30.camel@hammer.suse.cz>
	<1251379478.27780.31.camel@mill.internal.reciva.com>
Date: Thu, 27 Aug 2009 15:56:06 +0200
Message-Id: <1251381366.25803.12.camel@hammer.suse.cz>
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
X-List-Received-Date: Thu, 27 Aug 2009 14:14:17 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> On Thu, 2009-08-27 at 13:32 +0200, Stanislav Brabec wrote:
> > By the way, what is the benefit of not using ldconfig? Strace shows 15
> > extra failing library lookups for each library.

> On the other hand, if you find yourself obliged to spread the libraries
> across many directories, and/or if you plan to use hwcap-based
> searching, installing ldconfig might indeed be a net win.  If you're
> seeing 15 path lookups for each library load then it sounds like your
> system falls into this category.

No, it is not my case. My image is just a plain angstrom-2008.1. These
15 directories don't exist. With ld.so.cache I don't see these lookups.

access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
open("/var/run/ld.so.cache", O_RDONLY)  = -1 ENOENT (No such file or directory)
open("/lib/tls/v5l/fast-mult/half/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/lib/tls/v5l/fast-mult/half", 0xbedce3f0) = -1 ENOENT (No such file or directory)
open("/lib/tls/v5l/fast-mult/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/lib/tls/v5l/fast-mult", 0xbedce3f0) = -1 ENOENT (No such file or directory)
open("/lib/tls/v5l/half/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/lib/tls/v5l/half", 0xbedce3f0) = -1 ENOENT (No such file or directory)
open("/lib/tls/v5l/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/lib/tls/v5l", 0xbedce3f0)      = -1 ENOENT (No such file or directory)
open("/lib/tls/fast-mult/half/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/lib/tls/fast-mult/half", 0xbedce3f0) = -1 ENOENT (No such file or directory)
open("/lib/tls/fast-mult/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/lib/tls/fast-mult", 0xbedce3f0) = -1 ENOENT (No such file or directory)
open("/lib/tls/half/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/lib/tls/half", 0xbedce3f0)     = -1 ENOENT (No such file or directory)
open("/lib/tls/libm.so.6", O_RDONLY)    = -1 ENOENT (No such file or directory)
stat64("/lib/tls", 0xbedce3f0)          = -1 ENOENT (No such file or directory)
open("/lib/v5l/fast-mult/half/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/lib/v5l/fast-mult/half", 0xbedce3f0) = -1 ENOENT (No such file or directory)
open("/lib/v5l/fast-mult/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/lib/v5l/fast-mult", 0xbedce3f0) = -1 ENOENT (No such file or directory)
open("/lib/v5l/half/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/lib/v5l/half", 0xbedce3f0)     = -1 ENOENT (No such file or directory)
open("/lib/v5l/libm.so.6", O_RDONLY)    = -1 ENOENT (No such file or directory)
stat64("/lib/v5l", 0xbedce3f0)          = -1 ENOENT (No such file or directory)
open("/lib/fast-mult/half/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/lib/fast-mult/half", 0xbedce3f0) = -1 ENOENT (No such file or directory)
open("/lib/fast-mult/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/lib/fast-mult", 0xbedce3f0)    = -1 ENOENT (No such file or directory)
open("/lib/half/libm.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
stat64("/lib/half", 0xbedce3f0)         = -1 ENOENT (No such file or directory)
open("/lib/libm.so.6", O_RDONLY)        = 3

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



