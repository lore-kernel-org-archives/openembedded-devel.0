Received: from [70.85.129.92] (helo=sasquatch.hezmatt.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mpalmer@hezmatt.org>) id 1H2Nx3-0004BZ-GC
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jan 2007 09:27:53 +0100
Received: from [10.6.66.6] (helo=hezmatt.org)
	by sasquatch.hezmatt.org with esmtp (Exim 3.35 #1 (Debian))
	id 1H2Nvq-00009J-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jan 2007 19:26:39 +1100
Received: by hezmatt.org (Postfix, from userid 1000)
	id 909EA4C2D3; Thu,  4 Jan 2007 19:26:32 +1100 (EST)
Date: Thu, 4 Jan 2007 19:26:32 +1100
From: Matthew Palmer <mpalmer@hezmatt.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070104082632.GA11300@hezmatt.org>
References: <193b6ba30701032221u5d680767q8bc3db738ba89b47@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <193b6ba30701032221u5d680767q8bc3db738ba89b47@mail.gmail.com>
User-Agent: Mutt/1.5.11
Subject: Re: Help me
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Jan 2007 08:27:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[For your own benefit, I'd suggest a better choice of subject line in future]

On Thu, Jan 04, 2007 at 03:21:57PM +0900, Debasree Mallick wrote:
> Hi,
> When i try to run this command
> mtn --db=OE.mtn co -b org.openembedded.dev
> It givs a error..Error is
> 
> mtn: misuse: layout of database /stuff/OE.mtn doesn't match this version
> of monotone

You're running a newer version of monotone than the version which was used
to create the database.  If you just want to get the source, and don't have
commit access, I've found that:

> mtn: misuse: try 'mtn db migrate' to upgrade

Does a nice job of making everything work again (I'm using mtn 0.32).

I've got no idea if things will still work properly if you're pushing
changes back to trunk, since I'm not So Blessed.

- Matt

-- 
I don't do veggies if I can help it.			-- stevo
If you could see your colon, you'd be horrified.	-- Iain Broadfoot
If he could see his colon, he'd be management.		-- David Scheidt


