Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MQoCx-0003NF-4K
	for openembedded-devel@openembedded.org; Tue, 14 Jul 2009 22:02:35 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n6EJmMJp004260 for <openembedded-devel@openembedded.org>;
	Tue, 14 Jul 2009 20:48:22 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xlIPZlzPRUGq for <openembedded-devel@openembedded.org>;
	Tue, 14 Jul 2009 20:48:22 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n6EJmJTD004237
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>;
	Tue, 14 Jul 2009 20:48:21 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20090713035713.GA21203@denix.org>
References: <200907121334.38852.raj.khem@gmail.com>
	<20090713035713.GA21203@denix.org>
Date: Tue, 14 Jul 2009 20:47:12 +0100
Message-Id: <1247600832.29960.18.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: e2fsprogs-libs build failure analysis
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
X-List-Received-Date: Tue, 14 Jul 2009 20:02:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Sun, 2009-07-12 at 23:57 -0400, Denys Dmytriyenko wrote:
> On Sun, Jul 12, 2009 at 01:34:34PM -0700, Khem Raj wrote:
> > Like many others I was also getting this problem reported on this mailing list in past 
> > 
> > http://article.gmane.org/gmane.comp.handhelds.openembedded/24445/match=e2fsprogs+libs
> > 
> > I looked a bit into this and the problem is that PN gets overwritten when 
> > do_package_write_ipk -> read_subpackage_metadata 
>
> Have you seen this thread several months ago with the same analysis:
> http://thread.gmane.org/gmane.comp.handhelds.openembedded/22376/focus=22556
> 
> As I said before, pkgdata/runtime handling needs fixing - if multiple recipes 
> (or even target vs. native/sdk of the same package, like it was with curl) 
> provide the identically named .so library (libblkid in this case) during the 
> build, there may be a conflict in the pkgdata/runtime files.
> 
> What are the pkgdata files are used for ultimately? Do they need to contain 
> PN/PV/PR? That was introduced by the commit mentioned in the thread above... 
> Should it be reverted?
> 
> Lets ask Richard - he made this change in Poky, maybe he has a better fix for 
> it... :)

The real problem here is two packages providing the same library. This
is actually a critical error and means your distro is screwed unless
handled very carefully. Rather than hacking around the problem, I'd much
rather we detect and abort in this case and warn the user something is
about to break and that any package feeds will need careful attention.

Cheers,

Richard


-- 
Richard Purdie
Intel Open Source Technology Centre



