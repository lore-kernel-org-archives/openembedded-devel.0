Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MpGcx-0003Sa-Mp
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Sep 2009 09:14:36 +0200
Received: from [81.170.68.179] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MpGcE-0006ia-4c
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Sep 2009 08:13:48 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1253396926.1456.14.camel@localhost>
References: <20090917054034.GB5465@denix.org>
	<1253188893.12689.556.camel@mill.internal.reciva.com>
	<1253396926.1456.14.camel@localhost>
Date: Sun, 20 Sep 2009 08:13:42 +0100
Message-Id: <1253430822.4490.1515.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-Broken-Reverse-DNS: no host name found for IP address 81.170.68.179
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] -dbg for static libraries?
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
X-List-Received-Date: Sun, 20 Sep 2009 07:14:36 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-09-19 at 23:48 +0200, GNUtoo wrote:
> Phil Blundell wrote:
> > Or, for SDK purposes, you could even consider ditching the .a
> > libraries altogether for packages that have a .so since virtually
> > nobody is going to be doing static linking in this day and age.
>
> I often do static linking for different reasons:
> *different libc on the target(like with android for instance)
> *debugging(like in the case where all shared libs segfaulted on mips
> +uclibc,I needed a static gdb,a static strace etc...)

Neither of those are really the kind of use-cases that the SDK is
targeting.  If you are doing initial bringup/debug on a particular
target system then you would probably want to use an in-tree build just
as you do today.  

The SDK exists to support casual software development on relatively
stable target platforms, by people who don't wish to build the entire
system from scratch for themselves, and in almost all cases you don't
want to encourage static linking there.

p.




