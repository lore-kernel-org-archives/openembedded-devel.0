Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JZldi-0003df-PQ
	for openembedded-devel@openembedded.org; Thu, 13 Mar 2008 12:30:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2DBSIu4005125
	for <openembedded-devel@openembedded.org>; Thu, 13 Mar 2008 11:28:18 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04588-09 for <openembedded-devel@openembedded.org>;
	Thu, 13 Mar 2008 11:28:14 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2DBSBqn005113
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Thu, 13 Mar 2008 11:28:11 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20080313101513.3e72ca08@widy.localdomain>
References: <47D71B8F.1030108@balister.org>
	<f96d234e0803120708r3286e264w6fbd21e6381bc235@mail.gmail.com>
	<20080313101513.3e72ca08@widy.localdomain>
Date: Thu, 13 Mar 2008 11:28:10 +0000
Message-Id: <1205407690.4547.29.camel@dax.rpnet.com>
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
Subject: Re: Git versus Hg
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
X-List-Received-Date: Thu, 13 Mar 2008 11:30:40 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-03-13 at 10:15 +0200, Paul Sokolovsky wrote:
> Ok, so let's finally visualize how this unique feature would apply to
> OE. So, we have set up all the BBPATH, build dir to reference to OE
> working copy. Now, one magic spell, and OE working copy transmogrifies
> into something else than it was before. What's next?
> 
> 1. Suppose that we have thought that before, and prepared separate
> build dir for this another local branch. Here, it's important to not
> miss which build dir to use for which of workdir's phases of moon.
> That's a bit harder that it would be with branches checked out into
> separate workdirs, but careful people indeed can run many days before
> making mistake. But all in all, "lightweight branching in OE" is not
> that "lightweight" as just issuing SCM command.

Agreed, using lightweight branches means you do have to be careful what
you're doing with them. The kind of useful usecase I envisage is where
some person says "can you commit foo?". In that case I can switch
whatever checkout I'm using to OE.dev, update it, commit foo and push
and then switch back to what I was doing. I might even merge it into a
temporary merge'd branch of whatever head is compatible with my workdir
so I can test it.

An OE checkout here appears to weigh in at ~222MB. What you're proposing
is that I should keep multiple copies of this around, just so I can do
multiple things at once. If I don't have the right checkout handy that
is 222MB of disk IO before I can do anything and 222MB of disk IO I then
have to remove.

Whilst harddisk space is cheap, its not that cheap and even my new
desktop which was custom spec'd for OE/poky work runs out frequently due
to the number of things I'm working on at once. When I'm on the laptop
the problem is a lot worse and thats with a laptop spec'd to cope with
OE.

> 2. Now suppose that we don't think that multiple builddirs is a must.
> Then, we rm -rf tmp/ with each branch switch, or what? Btw, I wonder
> how kernel people *actually* deal with that problem. Because only CS
> freshman would buy into "very easy to switch context to fix a bug, and
> then resume work on another feature." Real developers know, that fixes
> are accompanied by testing.

See above, I can merge it into my current work tree and test. Yes, this
assumes that my changes in the work tree don't influence the testing but
most kernel developers and most OE developers can usually manage to work
this out.

> 3. Now let's think what happens if mistake was made per above (workdir
> not switched, tmp dir not removed, ...) - we either already see errors
> during build and end up with garbled builddir, or end up with builddir
> garbled, but in silent manner. The latter is obvious good candidate
> case for submitting in a week bugs that OE behaves.

The nature of OE means you can garble a workdir in thousands of
different ways.

We are working on making rebuilds and recovery cheaper and detection of
corruption better. 

> 4. And finally, what happens if we didn't think about all the above?
> That's likely what will happen with newcomers and "mere users". They
> may have no idea that building different OE branches may require
> different builddirs. They may not know if given branch requires that,
> or no. Ability to switch branches in-place would give them false
> premise that it actually can be done easily. And give them good tool to
> shoot themselves in feet.

This is why we now have things like staging ABI versioning. The user
gets warned of the incompatibility. No its not perfect but some of us
are already trying to address this kind of problem which already exists
without the SCM consideration.

Cheers,

Richard



