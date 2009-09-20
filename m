Received: from [85.37.17.112] (helo=smtp-out112.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1MpKrL-00005v-Hn
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Sep 2009 13:45:43 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out112.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 20 Sep 2009 13:45:03 +0200
Received: from FBCMCL01B09.fbc.local ([192.168.171.26]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 20 Sep 2009 13:45:03 +0200
Received: from [192.168.1.107] ([80.117.40.142]) by FBCMCL01B09.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sun, 20 Sep 2009 13:45:03 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1253430822.4490.1515.camel@lenovo.internal.reciva.com>
References: <20090917054034.GB5465@denix.org>
	<1253188893.12689.556.camel@mill.internal.reciva.com>
	<1253396926.1456.14.camel@localhost>
	<1253430822.4490.1515.camel@lenovo.internal.reciva.com>
Date: Sun, 20 Sep 2009 13:45:02 +0200
Message-Id: <1253447102.8671.2.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.4 
X-OriginalArrivalTime: 20 Sep 2009 11:45:03.0539 (UTC)
	FILETIME=[CAC18830:01CA39E7]
X-SA-Exim-Connect-IP: 85.37.17.112
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
X-List-Received-Date: Sun, 20 Sep 2009 11:45:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-09-20 at 08:13 +0100, Phil Blundell wrote:
> On Sat, 2009-09-19 at 23:48 +0200, GNUtoo wrote:
> > Phil Blundell wrote:
> > > Or, for SDK purposes, you could even consider ditching the .a
> > > libraries altogether for packages that have a .so since virtually
> > > nobody is going to be doing static linking in this day and age.
> >
> > I often do static linking for different reasons:
> > *different libc on the target(like with android for instance)
> > *debugging(like in the case where all shared libs segfaulted on mips
> > +uclibc,I needed a static gdb,a static strace etc...)
> 
> Neither of those are really the kind of use-cases that the SDK is
> targeting.  If you are doing initial bringup/debug on a particular
> target system then you would probably want to use an in-tree build just
> as you do today.  
> 
> The SDK exists to support casual software development on relatively
> stable target platforms, by people who don't wish to build the entire
> system from scratch for themselves, and in almost all cases you don't
> want to encourage static linking there.
> 
> p.
ok thanks for the explanations...I think I have read too fast(lots of
mails) (I was thinking that the static libraries were to be removed in
the normal in-tree build)
Denis.



