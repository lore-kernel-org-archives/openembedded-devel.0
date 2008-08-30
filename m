Received: from [64.28.152.243] (helo=smtp-relay2.palm.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <prvs=rich.pixley=1216973ab@palm.com>)
	id 1KZSmc-00015H-GT
	for openembedded-devel@openembedded.org; Sat, 30 Aug 2008 17:54:38 +0200
X-IronPort-AV: E=Sophos;i="4.32,297,1217833200"; d="scan'208";a="12784522"
Received: from unknown (HELO mailhost01.palm.com) ([148.92.223.30])
	by smtp-relay2.palm.com with ESMTP; 30 Aug 2008 08:52:46 -0700
Received: from ako.local ([10.100.2.47])
	by mailhost01.palm.com (8.13.6+Sun/8.12.10) with ESMTP id
	m7UFqZut001955; Sat, 30 Aug 2008 08:52:35 -0700 (PDT)
Message-ID: <48B96CC3.2060807@palm.com>
Date: Sat, 30 Aug 2008 08:52:35 -0700
From: "K. Richard Pixley" <rich.pixley@palm.com>
User-Agent: Thunderbird 2.0.0.16 (Macintosh/20080707)
MIME-Version: 1.0
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
References: <48B90081.30105@whitby.id.au>
In-Reply-To: <48B90081.30105@whitby.id.au>
Subject: Re: RFC: When PREFERRED_PROVIDER does not build, don't try other alternatives by default
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
X-List-Received-Date: Sat, 30 Aug 2008 15:54:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I have a similar issue to address.  I haven't gone looking, but what I'm 
hoping for is a hard fail exit from bitbake if the PROVIDER isn't 
available.  I'm hoping for either a global switch that turns 
PREFERRED_PROVIDER from advisory to mandatory.  Or, even better, a 
MANDATORY_PROVIDER which is hard fail while other PREFERRED_PROVIDERs 
remain optional.

It's on my of features to add, but our OE tree is over a year and a half 
old now, and an OE merge doesn't seem to be much of a priority here, so 
it could be some time before I get to it.

The rationale here is the same difference I had with Cygnus configure vs 
Autoconf.  Autoconf's job is to infer itself into new environments as 
best it can.  This is great for systems that are compiled once each on 
millions of personal and academic systems of which no two are exactly alike.

However, for commercial grade software, we really do know exactly what 
our environment is and any time the compiling environment doesn't fit 
our expectations, we really would prefer a hard fail immediately so that 
we can track down that difference.

In our case, we want to use virtual packages as a way of selecting 
one-of-N options for our different products.  But there's absolutely no 
reason to even consider using an option that hasn't been specifically 
selected for a particular product.

--rich

Rod Whitby wrote:
> Whenever I build virtual/kernel, and for some reason (perhaps a git
> fetcher problem, or a patch doesn't apply cleanly) it doesn't build,
> bitbake decides to then go and build every other kernel under the sun
> trying to complete virtual/kernel.
>
> This is undesirable to the extreme, but I realise that there might have
> in the history of OE been a good reason for that behaviour.
>
> My proposal is that bitbake is changed so that if PREFERRED_PROVIDER is
> defined, then bitbake does *not* try other providers.  Only if
> PREFERRED_PROVIDER is *not* defined should bitbake ever try more than
> one package.
>
> Objections?
>
> Here is the IRC log of the discussion with RP about this issue:
>
> <rwhitby> RP: a question for you
> <rwhitby> when using virtual/kernel, and your PREFERRED kernel fails to
> build, why does bitbake then go and build every other kernel under the sun?
> <rwhitby> (and is there a way to stop that happening)
> <RP> rwhitby: That is the traditional bitbake behaviour
> <RP> rwhitby: I don't actually agree with it but changing it would
> breakbacwards compatibilty
> <RP> I guess it was once a feature but its turned out no to be so useful
> <RP> We should make that behaviour configurable. It only happens with
> the -k option anyway
> <rwhitby> RP: what was the use case in which it was useful, when
> PREFERRED_PROVIDER was defined?
> <RP> rwhitby: The idea was it would allow builds to complete rather than
> fail
> <rwhitby> I can understand it if PREFERRED_PROVIDER is not defined, but
> cannot think of a good reason why bitbake should go against explicit
> directions for a PREFERRED_PROVIDER
> <RP> rwhitby: It comes does to the variable name - "PREFERRED"
> <RP> Would it be useful to change the design, I say yes
> <RP> but there is history there and as the maintainer I need to be
> careful with this
> <rwhitby> understood
> <rwhitby> can we make it configurable and configure to not do it by
> default ?
> <RP> We can make it configurable
> <RP> I would want to see a discussion about defaults
> <RP> Feel free to start that on the bitbake+OE list
> <RP> I'm actually in favour of changing it
> <RP> but it must be discussed
> <rwhitby> nod
>
> -- Rod
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   


