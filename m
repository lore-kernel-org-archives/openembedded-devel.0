Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Myzkb-00022L-Pw
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Oct 2009 05:14:41 +0200
Received: from gandalf.denix.org ([71.127.57.136]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KRN0037L2A3G614@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	16 Oct 2009 22:13:21 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4AD1914AF60; Fri,
	16 Oct 2009 23:13:15 -0400 (EDT)
Date: Fri, 16 Oct 2009 23:13:15 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091017031315.GB12337@denix.org>
References: <4AD90574.1080800@mwester.net>
MIME-version: 1.0
In-reply-to: <4AD90574.1080800@mwester.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: commit 806811bf2d72827d3031bfcd5dbab1e82324d34e breaks	distros
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
X-List-Received-Date: Sat, 17 Oct 2009 03:14:41 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 16, 2009 at 06:44:52PM -0500, Mike Westerhof wrote:
> The following commit breaks numerous non-angstrom distros:
> 
> commit 806811bf2d72827d3031bfcd5dbab1e82324d34e
> Author: Denys Dmytriyenko <denis@denix.org>
> Date:   Wed Oct 14 14:25:07 2009 -0400
> 
>     angstrom: clean ups of the external toolchain support
> 
> 
> The symptom of the problem is this:
> 
> $ bitbake slugos-image
> ERROR: Unable to parse conf/bitbake.conf (Could not include required
> file conf/distro/include/glibc.inc)
> $
> 
> It seems that glibc.inc has been removed, and possibly replaced by
> either an external or an internal variant, but no non-angstrom distros
> have been updated.
> 
> Please forgive me if there was a discussion of this change on the
> mailing list; I have been locked away behind corporate firewalls, and
> living on-the-road for the past months, and just haven't been able to
> keep up. :(
> 
> How do I fix this, please?

Mike,

I'm sorry to hear you are having problems with my commit.

I was told conf/distro/include/glibc.inc was only used by Angstrom. And 
grepping through files recursively kind of proves it - there are no in-tree 
distros using this file. There is another glibc.inc in recipes/glibc, but 
that's obviously a different one.

I also ran a test build of minimal-image using minimal distro w/o any parsing 
issues.

It looks like you may have out-of-tree distro which uses glibc.inc file in the 
conf directory. If this is the case, I apologize for removing it and would be 
happy to restore it for you.

-- 
Denys


