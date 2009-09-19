Received: from [85.37.17.114] (helo=smtp-out114.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1Mp7o4-0007Ih-W0
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Sep 2009 23:49:28 +0200
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out114.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 19 Sep 2009 23:48:49 +0200
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 19 Sep 2009 23:48:49 +0200
Received: from [192.168.1.107] ([80.117.40.142]) by FBCMCL01B08.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sat, 19 Sep 2009 23:48:47 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1253188893.12689.556.camel@mill.internal.reciva.com>
References: <20090917054034.GB5465@denix.org>
	<1253188893.12689.556.camel@mill.internal.reciva.com>
Date: Sat, 19 Sep 2009 23:48:46 +0200
Message-Id: <1253396926.1456.14.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.4 
X-OriginalArrivalTime: 19 Sep 2009 21:48:48.0049 (UTC)
	FILETIME=[F7D55A10:01CA3972]
X-SA-Exim-Connect-IP: 85.37.17.114
X-SA-Exim-Mail-From: GNUtoo@no-log.org
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
X-List-Received-Date: Sat, 19 Sep 2009 21:49:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-09-17 at 13:01 +0100, Phil Blundell wrote:
> On Thu, 2009-09-17 at 01:40 -0400, Denys Dmytriyenko wrote:
> > Would it make sense to package stripped version of a static lib into -dev and 
> > the full version into corresponding -dbg?
> 
> I'm not sure that you'd want the debugging .a file in -dbg itself, since
> the -dbg packages are for installation on the target device and the .a
> libraries would be useless there. 
> 
> Punting the debug versions of the .a libraries into a new package
> (-static-dbg or some such) wouldn't be a bad idea.  Or, for SDK
> purposes, you could even consider ditching the .a libraries altogether
> for packages that have a .so since virtually nobody is going to be doing
> static linking in this day and age.
I often do static linking for different reasons:
*different libc on the target(like with android for instance)
*debugging(like in the case where all shared libs segfaulted on mips
+uclibc,I needed a static gdb,a static strace etc...)
Denis



