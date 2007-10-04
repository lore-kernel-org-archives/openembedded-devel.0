Received: from [72.29.79.205] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1IdRBp-0002Gh-At
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2007 15:56:34 +0200
Received: from pd953ad30.dip0.t-ipconnect.de ([217.83.173.48]
	helo=olympus.klever.net)
	by rhodos.klever.net with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.67) (envelope-from <hacker@klever.net>) id 1IdR6g-0007IN-HJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2007 15:51:14 +0200
Message-ID: <4704EFCE.6040407@klever.net>
Date: Thu, 04 Oct 2007 15:51:10 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.6 (X11/20070815)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1191494488.2516.34.camel@toontown>
	<4704CC05.40206@klever.net>	<B9AD73C2-790F-43EE-9FC4-96F1B1FA9415@selfish.org>	<1191502502.2516.39.camel@toontown>
	<EB5E2840-5F10-45F9-8B97-9FCFDC7F5AAE@selfish.org>
In-Reply-To: <EB5E2840-5F10-45F9-8B97-9FCFDC7F5AAE@selfish.org>
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
X-List-Received-Date: Thu, 04 Oct 2007 13:56:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

> this will be my only to this topic but I see that as following:

Why won't you clarify your points?

> git:
> 	cons:
> 		- Incompats with other versions

What do you mean?

> 		- repacking (even if probably all known races are fixed)

That's not a contra if we compare with monotone.

> 		- shell mess with bashism and GNUism

Very true and, likely to be a show-stopper, anyway.

> 		- still complicated to use

Well, if you use the monotone subset of git, it's not ;-)

> 		- Does not track directories

Is it a problem with OE?

> mtn:
> 	cons:
> 		- Speed on rev pulling (I think mtn ls and status, diff is quite fast)
> 		- we can not easily merge the dreambox branch (this is why I wrote  
> mtn2git)

Aha, now I know the script exists :-)

> 	pros:
> 		+ trust (I don't feel like remembering the latest over night)

Can you elaborate on the expression in parentheses?

> 		+ awesome manual

I wouldn't call it awesome when it goes beyond trivialities, but I don't 
think it's a problem with either SCM.

> 		+ trusting the code base (git is catching up, Linus is a god...  
> but...)

Well, OE relies on git codebase indirectly anyway ;-)

> 		+ certs attachable to revs
> 		+ attributes and other testresults are attachable to files and it  
> is on my todolist to use them
> 		+ tracks directories
> 		+ portable
> 
> 
> The last three/four reasons are the one why I would propose to stay  
> with mtn as the main repository. I'm also working on a git2mtn script  
> (after having merged the dreambox branch) which could make git a  
> (semi) supported system for OE (if someone will host it).

The bottom line is - we're not going to move anytime soon. And I agree 
it makes sense. I'm yet to see what are these attributes and other 
testresults attachable to files (sounds interesting), but I'm a bit 
afraid of your idea of (ab)using it, since that may make us get stuck 
with mtn in the future no matter what.

Love,
H


