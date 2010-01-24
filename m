Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NZ4hs-0001B2-Ve
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 16:49:00 +0100
Received: from cpe00e0b8e80755-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.244.198] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NZ4fe-0002mA-Rq for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 10:46:38 -0500
Date: Sun, 24 Jan 2010 10:45:47 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100124154357.GG15943@jama>
Message-ID: <alpine.LFD.2.00.1001241044240.14413@localhost>
References: <687C35F4-E7DC-4898-907F-8C1CE8890887@mac.com>
	<9210BA9D-8420-46C3-BDD6-CEE4E853B42F@mac.com>
	<20100124154357.GG15943@jama>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Build failure module-init-tools-cross_3.2.2.bb on Fedora 12 x86_64
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
X-List-Received-Date: Sun, 24 Jan 2010 15:49:00 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 24 Jan 2010, Martin Jansa wrote:

> On Sun, Jan 24, 2010 at 07:37:36PM +0400, Elvis Dowson wrote:
> > Hi,
>
> Hi
>
> > | /usr/bin/ld: cannot find -lc
> > | collect2: ld returned 1 exit status
> > | make: *** [insmod.static] Error 1
>
> Thomas White had the same problem and reported that:
>
> in F12 there's a separate package for glibc static linking ok, after
> installing the static package, it works
>
> Not sure if it's correct fix (I would expect that static libc should
> be in staging already for module-init-tools-cross), but you can give
> it a try.

  i'm guessing that's it:

  # yum install glibc-static

given that i run f12, i ran across that issue some time back.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


