Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JZ291-0007tX-Mc
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 11:55:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2BArlPq009918
	for <openembedded-devel@openembedded.org>; Tue, 11 Mar 2008 10:53:47 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09692-06 for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 10:53:42 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2BArgls009905
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 11 Mar 2008 10:53:42 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200803110807.11368.zecke@selfish.org>
References: <200803110807.11368.zecke@selfish.org>
Date: Tue, 11 Mar 2008 10:53:41 +0000
Message-Id: <1205232821.4521.25.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Tue, 11 Mar 2008 10:55:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-03-11 at 08:07 +0100, Holger Freyther wrote:
> I'm anything but happy with the way we work with our repository. We have a 
> dreambox branch that is not mergable due issues with our SCM system, the 
> OpenMoko guys have to go back to diffing and applying the diff and merging by 
> hand, we just commit fundamental changes like sysroot, packaged-staging, RFCs 
> in one go and then do weeks of fixing. And I can continue with this list.
[...]
> I think the two options are hg and git, I tend to favor git due the size of 
> its community. I want to switch OE to one of these systems by the end of this 
> month and start using more branches and creating perfect patch series again.

Thanks for raising this, I think one by one we're all getting frustrated
with monotone as my email at the end of January showed in my case.

One major concern I have is the amount of 'pointless' merging we're
doing. Each developers commits should just have a maximum of one merge
at the end of each commit series and we have way more than that going
on.

I also worry that we don't have decent visualisation tools with monotone
and our website is often broken. By contrast http://git.o-hand.com/ has
worked since I set it up and there are alternatives out there too for
git (competition is good).

I don't think git is the perfect SCM, its syntax is insane. I do think
its powerful and now has widespread enough use creating a momentum that
monotone never had. I also think you could write a nice UI around it,
the backend is sound and I remain optimistic this will happen in time.

I don't really know hg but to me thats a good reason to favour git, its
has a bigger userbase. I'd not like to see OE making the "mistake" we
made with monotone and picking something which isn't widely understood
or used :/.

My concern with git is how we'll run the server. OH has been thinking
about using git but the server setup is tricky for "push" access which
is the model OE would use. The two choices seem to be ssh or webdav and
the latter isn't something I've found time to look into setting up but
people keep telling me its possible.

Anyhow, my vote is for git...

Cheers,

Richard





