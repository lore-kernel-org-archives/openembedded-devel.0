Received: from [66.111.4.27] (helo=out3.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1Kniov-0007WQ-Cx
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Oct 2008 01:51:57 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 786CE1771EE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Oct 2008 19:47:17 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Wed, 08 Oct 2008 19:47:17 -0400
X-Sasl-enc: /QQon8uRoyKZosZwPE+WI0Xhs/X4qMkWqwp1Wf6b2wda 1223509636
Received: from [192.168.1.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 95B85C5A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Oct 2008 19:47:16 -0400 (EDT)
Message-ID: <48ED467B.5080208@whitby.id.au>
Date: Thu, 09 Oct 2008 10:17:07 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200810080751.15817.zecke@selfish.org>	<200810081303.35934.zecke@selfish.org>
	<gci4to$pcf$1@ger.gmane.org> <200810081757.57676.zecke@selfish.org>
In-Reply-To: <200810081757.57676.zecke@selfish.org>
Subject: Re: ETA on git conversion
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
X-List-Received-Date: Wed, 08 Oct 2008 23:51:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Holger Freyther wrote:
> On Wednesday 08 October 2008 13:18:16 Koen Kooi wrote:
> 
>> The old wiki had one, dunno if the new wiki overlords decided to move it
>> to the new wiki. Ask them.
> 
> http://wiki.openembedded.net/index.php/GitPhraseBook
> 
> is this any good?

Some comments (open for discussion before I change the wiki page):

> git clone git://git.openembedded.net/FIXME openembedded.git

Does it need to create openembedded.git as the directory name rather
than just openembedded?

> git config user.name "Your Name"
> git config user.mail "you@name"

Do we want to use the --global flag so that the scope of these commands
covers all git repos for that user and they don't forget to do it for
every new repo they clone?

> git commit --amend

Add a comment that this should only be done on commits that have not
been pushed anywhere, and should *never* be done on commits that have
been pushed to a public repo?


BTW, the git commands that I've been using for FSO work can be found in
the FSO Makefile at http://downloads.freesmartphone.org/Makefile

In particular, this is how I clone the OE trial git repo:

> .PHONY: setup-openembedded
> .PRECIOUS: openembedded/.git/config
> setup-openembedded openembedded/.git/config:
> 	[ -e openembedded/.git/config ] || \
> 	( git clone git://git.openembedded.net/org.openembedded.dev openembedded ; \
> 	  cd openembedded ; \
> 	  git config --add remote.origin.fetch '+refs/remotes/*:refs/remotes/*' )
> 	( cd openembedded && \
> 	  ( git branch | egrep -e ' org.openembedded.dev$$' > /dev/null || \
> 	    git checkout -b org.openembedded.dev --track origin/org.openembedded.dev ))
> 	( cd openembedded && git checkout org.openembedded.dev )
> 	touch openembedded/.git/config

Comments on that strategy are welcome.
Generic prejudices about Makefiles are not :-)

-- Rod




