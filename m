Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1KODPF-00005V-34
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jul 2008 17:16:01 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id B83F2146DA2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2008 11:14:18 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Wed, 30 Jul 2008 11:14:18 -0400
X-Sasl-enc: INatX0p27iQEZpyCVOQjl5+MAsw7bw2+oXmRH9VJDPtz 1217430858
Received: from [192.168.1.100] (CPE-121-209-20-127.sa.bigpond.net.au
	[121.209.20.127])
	by mail.messagingengine.com (Postfix) with ESMTPSA id C6AF925A12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2008 11:14:17 -0400 (EDT)
Message-ID: <489084EE.9070407@whitby.id.au>
Date: Thu, 31 Jul 2008 00:42:46 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.16 (Windows/20080708)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1217340989.5482.10.camel@dax.rpnet.com>	<488FAE77.7050107@whitby.id.au>	<200807300920.37221.openembedded@haerwu.biz>	<f96d234e0807300429j2fff8df0oc494e4a5beb9f8ff@mail.gmail.com>	<87myjz34uv.fsf@neumann.lab.ossystems.com.br>	<4890678A.5040005@balister.org>
	<1217428116.5510.26.camel@dax.rpnet.com>
In-Reply-To: <1217428116.5510.26.camel@dax.rpnet.com>
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
X-List-Received-Date: Wed, 30 Jul 2008 15:16:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> Git commit IDs are a totally free form fields. There is nothing stopping
> me making commit A as "Richard <rp@localhost>", commit B as "rpurdie
> rurdie@laptop" and then commit C as "Joe <someone@somewhere>". Commit A
> was my desktop, commit B was my laptop, commit C was on some account I
> borrowed.

However, a git commit ID is intended to be a real name and a real email 
address, and the distinction between an author id and a commit id is 
meant to have real meaning (i.e. two different people were involved in 
how this change came into being and how it got accepted into the SCM).

Note that both the author ID and commit ID are meant to be real names 
and real email addresses.  You do want to be able to contact each of 
those two people under different circumstances.

> One problem with git is that its all too easy to screw up setting the
> author/commit IDs. I've done it before, I suspect I will again next time
> I change machine and I'm sure others will too intentionally or
> otherwise.

I agree that this can be a problem.

My proposal is to keep an AUTHORS file at the top level of the OE 
repository, and make git check the commit ID against that file in the 
commit hook.

This would be *much* easier to manage than having to have pseudo email 
address aliases.  It would also mean that anyone with existing commit 
privs could update the AUTHORS file for someone else if that someone 
else needs to change their contact email address for some reason.

> Why does it matter? I'd like to be able to go to the SCM and *know* who
> made a commit (knowing who authored the patch is different). I'd like to
> be able to view all commits for a given "identity".

I'd like to do the same, and I'd like those identifiers to (a) be real 
email addresses and (b) be the same identifiers those people use on 
other git repositories so I can judge the pedigree of the person making 
the commit.

> Also, "the kernel does this, why can't we" is a totally bogus argument:
> 
> 1. If the kernel jumped off a cliff, would you too?

If it involved how to use git, yes.  Otherwise, no.

> 2. The kernel uses a pull model for development and people check IDs for
> some sanity before pulling. With the push model we're going for we don't
> have that luxury.

That is true.  However, you also need to account for a multi-level push 
model, where the second and subsequent levels may not have the same 
restrictions on IDs that you are proposing for the master OE repository. 
  In this case, the author and committer will really be two different 
people, and you want to have real contact email addresses for both.

In summary, I'm dead against identifiers that are not the usual 
identifier that OE contributors use everywhere on the internet.

-- Rod



