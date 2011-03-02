Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PuoWq-0001N4-TA
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 17:03:58 +0100
Received: from gandalf.denix.org ([unknown] [71.251.48.61])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LHF009IPTVH7LG3@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	02 Mar 2011 10:02:11 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 07AA414AF6A; Wed,
	02 Mar 2011 11:02:05 -0500 (EST)
Date: Wed, 02 Mar 2011 11:02:05 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110302160205.GC10330@denix.org>
References: <4D544976.6010800@drewtech.com> <4D545173.8080904@mentor.com>
	<4D54734B.7060705@drewtech.com> <4D547643.2020600@mentor.com>
	<4D598D30.3080506@drewtech.com>
MIME-version: 1.0
In-reply-to: <4D598D30.3080506@drewtech.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: openembedded with a prebuilt external toolchain
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
X-List-Received-Date: Wed, 02 Mar 2011 16:03:58 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Feb 14, 2011 at 03:14:40PM -0500, Joey Oravec wrote:
> On 2/10/2011 6:35 PM, Tom Rini wrote:
>>> Both the -csl.bb and -generic.bb copy a bunch of stuff to STAGING_DIR in
>>> do_stage(). Of course in the long-run I need for the recipe to copy C
>>> libraries, but for now I should be able to leave the body blank. At
>>> least it'll use my compiler and run to completion. Right?
>>
>> Well, as you saw, it fails in some cases.  This is because, yeah, we're 
>> telling the toolchain stuff lives ...here now, and it doesn't.
>
> Thanks for the additional help on chat! This followup is to share my 
> results with the mailing list.
>
> Regarding my "bitbake nano" failure, that was a symptom of a sysroot issue. 
> An external cross compiler has some default sysroot where it looks for 
> libraries. By default it looks like OE passes nothing to change this. As a 
> result do_configure() didn't look for libraries in staging dir, decided 
> that ncurses didn't exist, and the build failed. One solution is to add:
>
> TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"

That is the default now in conf/bitbake.conf:

http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?h=org.openembedded.dev&id=ebd905685a339814c36bf658a8e58bf8f457f14e

> to your build/conf/local.conf and make sure your compiler's default sysroot 
> (libc, etc) gets copied into the staging dir. That way you can call *-gcc 
> from somewhere in your path but it'll look for everything under OE's 
> staging directory.

-- 
Denys


