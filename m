Received: from [72.29.79.205] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1IdQsc-0001Ps-IW
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2007 15:36:42 +0200
Received: from pd953ad30.dip0.t-ipconnect.de ([217.83.173.48]
	helo=[192.168.4.12])
	by rhodos.klever.net with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.67) (envelope-from <hacker@klever.net>) id 1IdQnT-0003af-Bm
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2007 15:31:24 +0200
Message-ID: <4704EAE3.8050702@klever.net>
Date: Thu, 04 Oct 2007 15:30:11 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.6 (X11/20070911)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1191494488.2516.34.camel@toontown>
	<4704CC05.40206@klever.net>	<B9AD73C2-790F-43EE-9FC4-96F1B1FA9415@selfish.org>
	<1191502502.2516.39.camel@toontown>
In-Reply-To: <1191502502.2516.39.camel@toontown>
Subject: Re: monotone/git (was hello...)
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
X-List-Received-Date: Thu, 04 Oct 2007 13:36:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> Well luckily I am not an ignorant git-fanboy :) Could you shortly point
> out to me the reasons why you think monotone is favorable over git for
> use with openembedded ? I will admit right away that my limitation with
> SCMs in large projects is more than limited. So i can only speak of
> my user experience with git vs my experience with monotone and i prefer
> the first.

Well, 1st - OE folks are used to monotone now. That's primary reason.
The second primary reason is that I know of some developers who seem to
dislike git. And if we're talking about technical reason, one I can
think of is that there's no non-ssh transport allowing push, which
complicates administration of our "central" repository. Basically,
monotone is not really used as a DSCM in OE, it's just a somewhat
centralized SCM which allows merges as well as forks.

Personally, I think the lack of tools like gitk makes mtn history almost
opaque which gets even more opaque and unreadable due to the lack of
features like rebase.

I do think also that potential corporate users of OE would appreciate
git (the mirror would mostly solve this, though) as *I* think it's much
easier with git to maintain own branch while picking the important
changes from our tree (contributing back will be more complicated, though).

The above is my personal opinion and I have to admit I may miss
something about monotone, since, although I've had no problems using it
both ways, I wouldn't say I'm a monotonic guru.

Love,
H


