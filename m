Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <zecke@selfish.org>) id 1IdQpB-0001Bh-Me
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2007 15:33:11 +0200
Received: from dsl-62-220-14-162.berlikomm.net ([62.220.14.162]
	helo=[192.168.1.23]) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1IdQk4-00089a-0F
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2007 15:27:52 +0200
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <1191502502.2516.39.camel@toontown>
References: <1191494488.2516.34.camel@toontown> <4704CC05.40206@klever.net>
	<B9AD73C2-790F-43EE-9FC4-96F1B1FA9415@selfish.org>
	<1191502502.2516.39.camel@toontown>
Message-Id: <EB5E2840-5F10-45F9-8B97-9FCFDC7F5AAE@selfish.org>
From: Holger Freyther <zecke@selfish.org>
Date: Thu, 4 Oct 2007 15:27:21 +0200
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
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
X-List-Received-Date: Thu, 04 Oct 2007 13:33:14 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 04.10.2007 um 14:55 schrieb Tobias Pflug:

> Well luckily I am not an ignorant git-fanboy :) Could you shortly  
> point
> out to me the reasons why you think monotone is favorable over git for
> use with openembedded ? I will admit right away that my limitation  
> with
> SCMs in large projects is more than limited. So i can only speak of
> my user experience with git vs my experience with monotone and i  
> prefer
> the first.

Hi,

this will be my only to this topic but I see that as following:


git:

	pros:
		+ Speed
		+ Momentum
		+ Merging

	cons:
		- Incompats with other versions
		- repacking (even if probably all known races are fixed)
		- shell mess with bashism and GNUism
		- still complicated to use
		- Does not track directories


mtn:
	cons:
		- Speed on rev pulling (I think mtn ls and status, diff is quite fast)
		- we can not easily merge the dreambox branch (this is why I wrote  
mtn2git)

	pros:
		+ trust (I don't feel like remembering the latest over night)
		+ awesome manual
		+ trusting the code base (git is catching up, Linus is a god...  
but...)
		+ certs attachable to revs
		+ attributes and other testresults are attachable to files and it  
is on my todolist to use them
		+ tracks directories
		+ portable


The last three/four reasons are the one why I would propose to stay  
with mtn as the main repository. I'm also working on a git2mtn script  
(after having merged the dreambox branch) which could make git a  
(semi) supported system for OE (if someone will host it).


z.

PS: I almost exclusively use git-svn for my work on WebKit, specially  
for git-reabse...


