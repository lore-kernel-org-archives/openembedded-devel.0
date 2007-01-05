Received: from [70.85.129.92] (helo=sasquatch.hezmatt.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mpalmer@hezmatt.org>) id 1H2kgc-0000HP-D1
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jan 2007 09:44:26 +0100
Received: from [10.6.66.6] (helo=hezmatt.org)
	by sasquatch.hezmatt.org with esmtp (Exim 3.35 #1 (Debian))
	id 1H2kfJ-00048g-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jan 2007 19:43:05 +1100
Received: by hezmatt.org (Postfix, from userid 1000)
	id 478C74B576; Fri,  5 Jan 2007 19:43:03 +1100 (EST)
Date: Fri, 5 Jan 2007 19:43:03 +1100
From: Matthew Palmer <mpalmer@hezmatt.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070105084303.GA3124@hezmatt.org>
References: <193b6ba30701050001t75ae1356s3bfb93e4834e1ba7@mail.gmail.com>
	<432beae0701050004n59458e75s53436646452806c0@mail.gmail.com>
	<193b6ba30701050014t25df7b5cw16cd8b1eb40995ef@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <193b6ba30701050014t25df7b5cw16cd8b1eb40995ef@mail.gmail.com>
User-Agent: Mutt/1.5.11
Subject: Re: Please help me
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
X-List-Received-Date: Fri, 05 Jan 2007 08:44:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[Again, a relevant subject line would help]

On Fri, Jan 05, 2007 at 05:14:18PM +0900, Debasree Mallick wrote:
> When i type bitbake nano...then

[snip]

> NOTE: package fakeroot-native-1.2.13: started
> NOTE: package fakeroot-native-1.2.13-r1: task do_fetch: started
> NOTE: fetch http://openzaurus.org/mirror/fakeroot_1.2.13.tar.gz
> --17:11:00--  http://openzaurus.org/mirror/fakeroot_1.2.13.tar.gz
>            => `/root/sources/fakeroot_1.2.13.tar.gz'
> Resolving openzaurus.org... 85.214.40.226
> Connecting to openzaurus.org|85.214.40.226|:80... connected.
> HTTP request sent, awaiting response... 302 Found
> Location: http://openzaurus.linuxtogo.org/mirror/fakeroot_1.2.13.tar.gz[following]
> --17:11:01--  http://openzaurus.linuxtogo.org/mirror/fakeroot_1.2.13.tar.gz
>            => `/root/sources/fakeroot_1.2.13.tar.gz'
> Resolving openzaurus.linuxtogo.org... 85.214.40.226
> Reusing existing connection to openzaurus.org:80.
> HTTP request sent, awaiting response... 404 Not Found
> 17:11:02 ERROR 404: Not Found.

Ooooh bugger.  It looks like the source mirror has lost the fakeroot
tarball; but that's a pretty old version of fakeroot -- I'm surprised there
isn't a newer version in the tree.  I've never needed to build fakeroot to
build things like nano, though.  That might be because I've already got
fakeroot installed on my machine, though, so perhaps you could give that a
shot?  It's not a /solution/, as such, but it'll at least get you going. 
Meanwhile, someone probably needs to either find that source tarball again,
or update the tree to use a newer version of fakeroot.

- Matt

-- 
With enough people around there's a probability ~=1 that one of them is an
MCSE and will give you the wrong answer to your problem.
	-- Toni Lassila, in the Monastery


