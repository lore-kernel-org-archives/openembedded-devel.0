Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JZ4o8-0001uT-9W
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 14:46:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2BDiLTm022589;
	Tue, 11 Mar 2008 13:44:21 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22331-07; Tue, 11 Mar 2008 13:44:17 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2BDiCEp022574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 11 Mar 2008 13:44:12 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>,
	openembedded-devel <openembedded-devel@openembedded.org>
In-Reply-To: <20080311150320.7c31b2f6@widy.localdomain>
References: <200803110807.11368.zecke@selfish.org>
	<200803111126.04715.openembedded@haerwu.biz>
	<fr5ntp$n0v$1@ger.gmane.org>
	<1205233201.4521.30.camel@dax.rpnet.com>
	<20080311143030.68d6341b@widy.localdomain>
	<1205239153.4521.53.camel@dax.rpnet.com>
	<20080311150320.7c31b2f6@widy.localdomain>
Date: Tue, 11 Mar 2008 13:44:12 +0000
Message-Id: <1205243052.4521.82.camel@dax.rpnet.com>
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
X-List-Received-Date: Tue, 11 Mar 2008 13:46:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-03-11 at 15:03 +0200, Paul Sokolovsky wrote:
> On Tue, 11 Mar 2008 12:39:13 +0000 Richard Purdie <rpurdie@rpsys.net> wrote:
> > You will never have seen me argue git has a nice UI. I've said quite
> > the opposite on many occasions. I have said its powerful but thats
> > different.
> 
> It's nice to have that said explicit - different. Supposedly it's more
> powerful for developers, but how good it is for end users? How many
> industry entities select git as their in-house SCM? I doubt that too
> many, knowing too well that many still select just CVS.

OE is there to serve a multitude of people, both developers and end
users. For the end user, hopefully we can document the basics of "git
clone", "git pull" and "git diff" or documentation already exists for
this. 

Also, I think more end users coming fresh to OE will know how to do this
with git in the current climate than with monotone, hg or any other
distributed SCM.

Regarding industrial entities, hopefully we call agree CVS is a pretty
bad SCM and that proves said industrial entities don't know what they're
doing, usually since it often it comes down to politics rather than
technical merit. I know of a few surprising companies using git FWIW
although I know of a few abominations in use too.
 
> > I'm assuming we're considering distributed scms but you know this ;-)
> 
> Yes, I'm trying to hint that arguments like having something already
> installed, or some niche, but big project already using it, are not
> necessarily valid for the topic of selecting SCM for OE.

You're asking about end users and how we should represent them above
then you claim its irrelevant?

I'm not saying this is the only factor to consider but I am arguing that
its a valid factor to consider.

> I'd really like someone who lead this idea to actually try few
> "advanced" usecases with both git and hg. But if that's not going to
> happen, at least let's not pretend that git is going to be "better"
> than hg or even mtn. It will be just different, possibly, bringing more
> issues overall.

Well, we have use cases explained where mtn has failed and we know git
is better. Some of us use git for other projects like kernel work and in
my/their opinion, we *know* it can do some things better.

Personally my hg knowledge is weak. If thats the case for me, it
probably is for a lot of other people and I think its valid to use that
as a factor. I'm not against learning hg if it solves all our problems,
I just don't think it will.

So, firstly, is anyone else willing to propose any other distributed
SCMs or is this just a choice between hg and git? If so, we have three
options:

1. Continue as we are with monotone
2. Switch to git
3. Switch to hg

We've talked about whether 1 is a good idea or not and assuming its not,
what are the pros/cons of 2/3?

git
---

* Most likely to to be installed on a given newcommer's machine
* Most likely to have been used before by a newcommer
* Has lots of documentation
* Has a lot of users
* Powerful web and visualisation tools
* Very actively growing
[I've not listed the other git features since I don't know how they
compare to hg, help?]

hg
--

* Has a nicer commandline?


These are just the issues I can know for near enough certain. Could one
of the hg proponents please put together a list of what makes its great,
and compare its branching/merge handling features with git?

Another thing we should consider is whether something is likely to
improve over time. This is something we hoped would happen with monotone
and whilst it has to an extent, it hasn't as much as we'd have liked.
Personally I think someone will write a nice frontend (porcelain) for
git eventually but we don't have a guarantee of that. The strength of
the communities in question plays a part here.

Cheers,

Richard




