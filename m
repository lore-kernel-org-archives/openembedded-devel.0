Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LZYrf-0003ID-K2
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Feb 2009 23:56:31 +0100
Received: from gandalf.denix.org ([71.251.57.220]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KF800GZ5FMPBSHB@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	17 Feb 2009 16:54:26 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id AFE476B83B5; Tue,
	17 Feb 2009 17:54:24 -0500 (EST)
Date: Tue, 17 Feb 2009 17:54:24 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090217225424.GC9047@denix.org>
References: <20090217022412.GA3240@denix.org>
MIME-version: 1.0
In-reply-to: <20090217022412.GA3240@denix.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Enterprise kills BBMASK
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
X-List-Received-Date: Tue, 17 Feb 2009 22:56:31 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Feb 16, 2009 at 09:24:12PM -0500, Denys Dmytriyenko wrote:
> Sorry for the "sensational" subject... :)
> 
> Basically, some time back I noticed that BBMASK stopped working. I didn't have 
> time to look into it, until today. One of Mickey's commits broke the tree, 
> because bunch of recipes require a missing .inc file, leading to Bitbake 
> parsing failure.
> 
> Now, trying to set BBMASK leads to nothing. The problem is with 
> conf/enterprise.conf, which re-sets it to empty if ENTERPRISE_DISTRO is not 
> set. So, not matter what you set BBMASK to in your local.conf, it ends up 
> being empty. Unfortunately, it can't be done with "+=", as it has to be a 
> regular expression...
> 
> Any ideas how to fix it?

So, does it mean nobody cares that BBMASK is broken? Or maybe I didn't explain 
the problem clearly enough the first time? :)

-- 
Denys


