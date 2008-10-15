Received: from [66.111.4.27] (helo=out3.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1Kpw2O-0005bj-C6
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 04:23:00 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id D34DC17C43C;
	Tue, 14 Oct 2008 22:17:53 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Tue, 14 Oct 2008 22:17:53 -0400
X-Sasl-enc: ajMiY5/teBzEKfW/BOWpzu3f7Nl28xwyP7d6WTqjOrfM 1224037072
Received: from [172.18.93.11] (au2.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTPSA id EA20816953;
	Tue, 14 Oct 2008 22:17:51 -0400 (EDT)
Message-ID: <48F552C9.5090604@whitby.id.au>
Date: Wed, 15 Oct 2008 12:47:45 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: Holger Freyther <zecke@openmoko.org>
References: <200810080751.15817.zecke@selfish.org>
	<200810142341.06945.zecke@selfish.org>
In-Reply-To: <200810142341.06945.zecke@selfish.org>
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 15 Oct 2008 02:23:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Holger Freyther wrote:
> I think the conversion is complete and we can disable the mtn servers now or 
> leave them readonly for a while.

Thanks to all involved for completing the transition.

Thanks to mwester for making monotone.nslu2-linux.org readonly while I
slept.

> Notes to people with commit access:
> git clone git@git.openembedded.net:openembedded to get the tree
> 
> Notes to people:
> 	DO NOT MERGE the old trial history and this history. We have no commit hook 
> yet to prevent this and solely depend on common sense...

I will put explicit checks in any Makefiles I maintain before I release
updates that use git, to ensure that this cannot happen using one of my
Makefiles.

> Notes to people using the trial git:
>   git-remote add new-origin git://git.openembedded.net/openembedded
>   git-fetch new-origin
>   git-rebase --onto new-origin/org.openembedded.dev 
> origin/org.openembedded.dev org.openembedded.dev (if i got this right from 
> the manpage)

(If it's not there already) Can we put this on the phrasebook page?

> Thins for the near future:
> Remove the nslu2 branches once nslu2 folks have migrated to git as well and 
> created repositories for them.

Please remove all org.nslu2-linux branches from the git.openembedded.net
server immediately.  They were never meant to end up on an OE server
anyway (and the Makefiles specifically prevented this, so someone must
have done it manually by accident).

-- Rod


