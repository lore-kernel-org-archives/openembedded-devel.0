Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OXAnf-0005pJ-Te
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 12:27:21 +0200
Received: from gandalf.denix.org ([unknown] [71.251.56.71])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L59005HU1JD9MG0@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	08 Jul 2010 12:21:19 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 063F114AF60; Thu,
	08 Jul 2010 13:21:13 -0400 (EDT)
Date: Thu, 08 Jul 2010 13:21:12 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100708172112.GD12383@denix.org>
References: <4C356475.2060208@gmail.com>
MIME-version: 1.0
In-reply-to: <4C356475.2060208@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Badness with -ibad, a replacement for	zecke-no-host-includes.patch.
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
X-List-Received-Date: Fri, 09 Jul 2010 10:27:21 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jul 08, 2010 at 03:09:01PM +0930, Graham Gower wrote:
> This patch introduces a new command line parameter to gcc (at
> Zecke's suggestion), -ibad, which may be used to specify
> blacklisted include prefixes. E.g.
> 
> grg@eye7:/tmp$ ~/oe2/tmp/cross/mipsel/bin/mipsel-angstrom-linux-gcc -c test.c -ibad /usr/include -I /usr/include
> CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include
> 
> This makes it much easier to add new blacklisted include paths,
> with a trivial edit to bitbake.conf. No additional paths have
> been added yet, but my motivation for this was to add
> /usr/X11R6/include and /usr/X11/include.
> 
> Please note that the bitbake.conf change will break builds with
> versions of gcc that do not accept this -ibad parameter. I have

Does it mean any external toolchain will be broken or require changes to the 
bitbake.conf?

-- 
Denys

> tested that the ibad patch applies to each of the gcc versions
> in this patch, but only done functional tests for gcc-4.3.3 and
> gcc-.4.1.
> 
> The following gcc versions may need attention:
> 3.3.3
> 3.3.4
> svn
> csl-arm-2007q3
> csl-arm-2008q1
> csl-arm-2008q3
> 
> 3.3.x will require a completely reworked ibad patch. The others
> should be compatible with one of the three ibad patches
> included below.
> 
> -Graham


