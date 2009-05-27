Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M9P3h-0008M4-Lz
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 May 2009 21:45:06 +0200
Received: from gandalf.denix.org ([71.127.60.148]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KKB00C5DFE7P6B7@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	27 May 2009 13:30:13 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 77B7314AF5F; Wed,
	27 May 2009 14:30:07 -0400 (EDT)
Date: Wed, 27 May 2009 14:30:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090527183007.GB22904@denix.org>
References: <4A1D5B1F.4060608@gmail.com>
MIME-version: 1.0
In-reply-to: <4A1D5B1F.4060608@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: ti-codec-engine_2.23.bb failed
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
X-List-Received-Date: Wed, 27 May 2009 19:45:06 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, May 27, 2009 at 05:24:15PM +0200, Enrico Castro wrote:
> I build ti-codec-engine_2.23.bb, but the source codec_engine_2_23_01.tar.gz 
> did not found in www.angstrom-distribution.org
>
> NOTE: Running task 1786 of 5760 (ID: 475, 
> /home/enrico/oe/openembedded/recipes/dsplink/ti-codec-engine_2.23.bb, 
> do_fetch)
> NOTE: fetch 
> http://install.tarball.in.source.dir/codec_engine_2_23_01.tar.gz
> --16:48:23--  
> http://install.tarball.in.source.dir/codec_engine_2_23_01.tar.gz
>            => `/home/enrico/oe/tmp/downloads/codec_engine_2_23_01.tar.gz'
> Resolving install.tarball.in.source.dir... failed: Name or service not 

I keep seeing this mysterious "install.tarball.in.source.dir" hostname failing 
to resolve for people over and over again... :) It is obviously a bogus URL and 
supposed to clue users in to read instructions in the recipe, like Philip said.

We could probably enhance this error by checking for the tarball and 
bb.fatal() a big fat error message if it's not found... But this situation 
with CE is temporarily anyway.

-- 
Denys


