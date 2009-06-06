Received: from [206.46.173.11] (helo=vms173011pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MCrwj-0008V3-27
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Jun 2009 11:12:13 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KKT00KJ77SVJB99@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	06 Jun 2009 04:02:56 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DB8D214AF5F; Sat,
	06 Jun 2009 05:02:54 -0400 (EDT)
Date: Sat, 06 Jun 2009 05:02:54 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090606090254.GA14042@denix.org>
References: <046B8D02-FF75-4D9E-BBB9-2D2DF22E37BC@mac.com>
	<20090606074606.GF4988@denix.org>
	<EE778AE5-9E7A-4138-A500-2466E830C8DA@mac.com>
MIME-version: 1.0
In-reply-to: <EE778AE5-9E7A-4138-A500-2466E830C8DA@mac.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Where do the extra #include <mach/board-overo.h> come	from in linux-omap3-2.6.29.bb recipe?
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
X-List-Received-Date: Sat, 06 Jun 2009 09:12:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Jun 06, 2009 at 12:00:46PM +0400, Elvis Dowson wrote:
> Thanks Denys,
> 				So shall I just comment out the SRCREV entry? How do I find out what 
> the current SRCREV value is, as of today, to lock down on a particular 
> SRCREV version?

$ git log -1

That would show you the last commit with its hash#.

Or you can go to gitweb and select any commit from the list and get its hash#:
http://git.kernel.org/?p=linux/kernel/git/tmlind/linux-omap-2.6.git 


> On Jun 6, 2009, at 11:46 AM, Denys Dmytriyenko wrote:
>
>>> aster branch?
>>
>> The recipe pulls 2.6.29 version (specified by SRCREV), while you are 
>> looking
>> at the latest source after git clone. Somewhere in between the file was
>> removed:
>>
>> http://git.kernel.org/?p=linux/kernel/git/tmlind/linux-omap-2.6.git;a=commitdiff;h=ed99db8e5c53acced1a7c02aa9a94d50bea48409


