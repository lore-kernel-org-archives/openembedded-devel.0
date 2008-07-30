Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1KODgV-0005WV-3l
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jul 2008 17:33:51 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id BA7C014B44D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2008 11:32:08 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Wed, 30 Jul 2008 11:32:08 -0400
X-Sasl-enc: qk/EIU2Q5sJlko7gXjDJoaclzFL5qesTgaiIh+16492W 1217431928
Received: from [192.168.1.100] (CPE-121-209-20-127.sa.bigpond.net.au
	[121.209.20.127])
	by mail.messagingengine.com (Postfix) with ESMTPSA id F3906398B6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2008 11:32:07 -0400 (EDT)
Message-ID: <4890891E.7060705@whitby.id.au>
Date: Thu, 31 Jul 2008 01:00:38 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.16 (Windows/20080708)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1217340989.5482.10.camel@dax.rpnet.com>
In-Reply-To: <1217340989.5482.10.camel@dax.rpnet.com>
X-Enigmail-Version: 0.95.6
Subject: Re: Git Migration Status
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 30 Jul 2008 15:33:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> We've made the decision we want to switch to git so what happens now? We
> now have:
> 
> * Agreed policies (pending no major objections from openembedded-devel)
> * A git server setup
> * Web browsing of the git server
> * Commit hooks for CIA and email notification of commits
> 
> What remains:
> 
> * A final mtn -> git conversion
>   - There is a known problem with the mtn -> git conversion which needs 
>     to be addressed. Holger has the details of this
>   - We also need to decide how to map the key names
> * Collection of keys for access to the git server
> * Creating a BKCVS history import and graft this onto the monotone 
>   history
>   - There are some conversion defects. Richard has the details and is 
>     trying to look into this
>   - We also need to decide on key name mappings, preferably consistent 
>     with the git ones.
> * Rename "gittrial" -> "git" on amethyst

BTW, since I'm complaining so much about the identifiers in other 
messages, I just want to say here that I really appreciate all the work 
that Richard and others have put into the monotone to git transition.

I'm very excited by this transition, and have already updated the 
nslu2-linux Master Makefile to use git and have begun the transition of 
nslu2-linux monotone repositories to git so that we can be ready and 
waiting for the OE flag day.

I look forward to the day when I can remove monotone from my laptop and 
from the nslu2-linux project servers ...

Thanks to all involved!

-- Rod


