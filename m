Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JxUSp-00006H-Pi
	for openembedded-devel@openembedded.org; Sun, 18 May 2008 00:01:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m4HLxGYm015698
	for <openembedded-devel@openembedded.org>;
	Sat, 17 May 2008 22:59:16 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15471-05 for <openembedded-devel@openembedded.org>;
	Sat, 17 May 2008 22:59:11 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m4HLx8nk015691
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sat, 17 May 2008 22:59:08 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0805161444m831aa10pdd558b05990f258d@mail.gmail.com>
References: <c384c5ea0805141436m9f5151dje832c2da95379127@mail.gmail.com>
	<1210869726.7097.93.camel@localhost.localdomain>
	<c384c5ea0805151151v35e28a99i2ccb39157d5d47f6@mail.gmail.com>
	<1210887932.7097.107.camel@localhost.localdomain>
	<c384c5ea0805161444m831aa10pdd558b05990f258d@mail.gmail.com>
Date: Sat, 17 May 2008 22:59:08 +0100
Message-Id: <1211061548.5272.21.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Stop on multiple providers but none explicitly	specified
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
X-List-Received-Date: Sat, 17 May 2008 22:01:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2008-05-16 at 23:44 +0200, Leon Woestenberg wrote:
> > You're making this sound clear cut and its not quite that easy :).
> > Firstly, 50% isn't a good figure, there is no limit to the number of
> > different packages which provide a given target so it could be 33%, 25%
> > or worse.
> >
> No in fact, the chance of making the wrong decision is 50%, 67%, 75%
> (or worse) for n = 2, 3, 4 etc.

I was referring of to the chance of making the right decision so yes,
the chance of making the wrong decisions is the opposite and increases
with provider numbers.

> (but I think you meant this).
> 
> > Secondly, there often is a good default choice its just bitbake doesn't
> > have the information to make it.
> >
> Well this is exactly my point; Let's give bitbake that information for
> the remaining cases.
> 
> PROVIDER_PREFERENCE seems a bridge too far for me, but hey, any
> solution that solves it is better then the current situation.

Its the only solution I can see which addresses the problem but it does
further complicate the providers logic in bitbake which is already
painful and in need of rewriting :/. Other solutions welcome... 

Cheers,

Richard



