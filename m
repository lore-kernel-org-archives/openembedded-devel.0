Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1MUgQ5-0007AW-Ha
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Jul 2009 14:32:09 +0200
Received: from [12.42.230.2] (helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1MUgC4-00041g-Qu for openembedded-devel@lists.openembedded.org;
	Sat, 25 Jul 2009 08:17:40 -0400
Date: Sat, 25 Jul 2009 08:15:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0907250800110.9021@localhost>
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
Subject: getting bitbake-1.8.12 for the org.openembedded.dev branch?
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
X-List-Received-Date: Sat, 25 Jul 2009 12:32:09 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i wasn't sure of the proper ML to post this on, but the OE devel
list seems like a good bet.  i was building angstrom for the
beagleboard on my fedora 11 system, and it was working fine with the
"stable/2009" branch since that branch comes with bitbake-1.8.12
embedded in the checkout under the bitbake/ directory.  so far, so
good.

  however, when i switch to the org.openembedded.dev branch, *that*
branch comes (weirdly?) with an incomplete bitbake directory (no bin/,
just lib/) so, suddenly, i have no bitbake anymore.  there *is* a
bitbake in the fedora repo, but it's only 1.8.10 so it's not
sufficient.  and i can always download the 1.8.12 tarball but
installing a straight tarball is not something i'm crazy about since i
like to go thru the package manager to keep things organized.

  would it not make more sense to have even the "dev" branch come with
the required version of bitbake embedded in the checkout?  or, failing
that, just toss that incomplete bitbake directory entirely?

p.s.  i put in a bugzilla request some time ago to get the newest
bitbake in the fedora repo:

  https://bugzilla.redhat.com/show_bug.cgi?id=503226

so far, no action.  maybe i'll poke someone again.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
"Kernel Newbie Corner" column @ linux.com:          http://cli.gs/WG6WYX
========================================================================


