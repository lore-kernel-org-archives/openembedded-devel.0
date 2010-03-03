Received: from smtpauth05.prod.mesa1.secureserver.net ([64.202.165.99])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1NmoB5-00023f-Hn
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 13:59:54 +0100
Received: (qmail 8466 invoked from network); 3 Mar 2010 12:50:18 -0000
Received: from unknown (209.242.7.187)
	by smtpauth05.prod.mesa1.secureserver.net (64.202.165.99) with ESMTP;
	03 Mar 2010 12:50:18 -0000
Message-ID: <4B8E5AFC.7010404@mwester.net>
Date: Wed, 03 Mar 2010 06:50:04 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <hml6l5$oj0$1@dough.gmane.org>
In-Reply-To: <hml6l5$oj0$1@dough.gmane.org>
X-SA-Exim-Connect-IP: 64.202.165.99
X-SA-Exim-Mail-From: mike@mwester.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: DL_DIR on nfs mount -> lockfile mayhem
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
X-List-Received-Date: Wed, 03 Mar 2010 12:59:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> One of my coworkers ran out of diskspace again and decided to move his
> DL_DIR to the filer and access it over NFS. Now do_fetch just hangs for
> nearly everything and we can get it to continue after removing the
> lockfiles in DL_DIR manually, but that's not a good solution.
> 
> I don't touch NFS with a bargepole, but my coworker insists it's a valid
> use-case :) So, is DL_DIR on nfs supported and if so, any clues why it
> could break with lockfiles?
> 
> This is with bitbake 1.8 from git.

Works great over NFS; I've used it this way for years now.  There should
be messages in syslog or on the console that might provide a clue.

(But lately I've had reasonably good luck by starting _any_
troubleshooting for odd problems like this by looking at selinux first,
or better yet just turn selinux off and see if whatever strange issue
you have doesn't just go away.)

-Mike (mwester)


