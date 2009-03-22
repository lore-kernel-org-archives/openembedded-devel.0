Received: from [206.46.173.17] (helo=vms173017pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LlTDx-0001qu-De
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Mar 2009 20:20:49 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGX00DK69N1LGNA@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	22 Mar 2009 14:18:43 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 667E06B83B5; Sun,
	22 Mar 2009 15:18:37 -0400 (EDT)
Date: Sun, 22 Mar 2009 15:18:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090322191837.GA17150@denix.org>
References: <80a0c20d0903221131r263367bcw9c401d93a75f98d3@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <80a0c20d0903221131r263367bcw9c401d93a75f98d3@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Issue with the cvs and wget fetching obey PATH workaround
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
X-List-Received-Date: Sun, 22 Mar 2009 19:20:49 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Mar 22, 2009 at 07:31:04PM +0100, Matthieu Poullet wrote:
> Hi,
> 
> I've a problem with the commit
> 2652dfa9fb6da4423f9d556aaa289ac6fc198fe5 "bitbake.conf: make cvs and
> wget fetching obey PATH from the metadata."
> 
> Instead of downloading in DL_DIR, it downloads in DL_DIR/--no-check-certificate.
> If I revert the commit everything works.
> 
> It's probably a simple syntax issue, but I'm not sure on how to fix it.

Actually, it appears the syntax issue was introduced earlier for the 
RESUMECOMMAND_wget - the extra --no-check-certificate was added in a wrong 
place.
Can you check if 681aba468c62f9542c25e32b42b676d56bcc7b92 fixes the issue for 
you? Thanks.

-- 
Denys


