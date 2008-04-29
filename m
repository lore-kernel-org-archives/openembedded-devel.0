Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Jql47-0003iH-Cp
	for openembedded-devel@openembedded.org; Tue, 29 Apr 2008 10:19:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m3T8JQcM021887
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Apr 2008 09:19:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21577-07 for <openembedded-devel@openembedded.org>;
	Tue, 29 Apr 2008 09:19:21 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m3T8JHwu021879
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Apr 2008 09:19:17 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <fv5nfj$3pg$1@ger.gmane.org>
References: <200804281344.32507.zecke@selfish.org>
	<200804281639.04704.zecke@selfish.org>  <fv5nfj$3pg$1@ger.gmane.org>
Date: Tue, 29 Apr 2008 09:19:16 +0100
Message-Id: <1209457156.5642.9.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Summary of an unwanted merge and what I did
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Tue, 29 Apr 2008 08:19:55 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-04-29 at 01:43 +0200, Rolf Leggewie wrote:
> Holger Freyther wrote:
> > it is about time to switch
> 
> I believe the discussion has been done.  I agree, action should follow.
>  What are the next steps?  Do we want a vote on which tool to use?  I
> see three contenders.
> 
>  a) stick with mtn
>  b) switch to hg
>  c) switch git
> 
> I don't recollect anybody advocating anything else.  So, should we have
> a vote on a, b, or is there some technical issue that needs to resolved
> or evaluated first?

The 'core' team discussed it and didn't reach a consensus. I'm planning
to setup a git trial server, the problem is I want to do it properly and
to me this includes reuniting us with our lost history from bitkeeper.

Setting up a git server isn't a problem and I'm halfway there with that
already. The are two main issues. One is I have been trying to convert
the bitkeeper cvs into something sane. If anyone does have some time to
experiment and wants to have a go with that let me know and I can detail
where I'm up to with it and what the problems are. It is possible to add
in the history using tree grafts afterwards but I'd prefer not to do
that if we can help it.

The second issue is one of enabling 'proper' access control. Even with
monotone we don't have something foolproof. With git I've ideas about
how we can do this but until we have a tree setup I can't really test
them.

I have been trying to get this sorted for a while and various things
have ended up taking priority which is frustrating for all, me included.
I will try and get this sorted soon...

Cheers,

Richard




