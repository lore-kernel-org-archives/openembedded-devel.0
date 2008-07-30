Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1KOChD-0007Ix-G0
	for openembedded-devel@openembedded.org; Wed, 30 Jul 2008 16:30:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m6UESn26017575
	for <openembedded-devel@openembedded.org>;
	Wed, 30 Jul 2008 15:28:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17229-05 for <openembedded-devel@openembedded.org>;
	Wed, 30 Jul 2008 15:28:43 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m6UESZ84017552
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 30 Jul 2008 15:28:36 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <4890678A.5040005@balister.org>
References: <1217340989.5482.10.camel@dax.rpnet.com>
	<488FAE77.7050107@whitby.id.au>
	<200807300920.37221.openembedded@haerwu.biz>
	<f96d234e0807300429j2fff8df0oc494e4a5beb9f8ff@mail.gmail.com>
	<87myjz34uv.fsf@neumann.lab.ossystems.com.br>
	<4890678A.5040005@balister.org>
Date: Wed, 30 Jul 2008 15:28:36 +0100
Message-Id: <1217428116.5510.26.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Wed, 30 Jul 2008 14:30:31 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-07-30 at 09:07 -0400, Philip Balister wrote:
> Otavio Salvador wrote:
> > "Cliff Brake" <cliff.brake@gmail.com> writes:
> > 
> >> Using real email addresses would also simplify server admin and be one
> >> less load on the server.  When the spam starts flowing, this can
> >> require a significant amount of network bandwidth.  Where I host my
> >> main web site and domain, the owner claims spam to email accounts is
> >> by far the greatest use of bandwidth, and he spends a lot of time
> >> implementing anti-spam measures.  With limited resources, simple is
> >> good!
> > 
> > +1
> > 
> 
> I also agree. I would prefer to commit with my own address. I own all 
> the domains, so they should last as long as I do.

Before we all start jumping on this wagon let me explain some of the
background to what I proposed. I was trying to keep that announcement
brief and it assumes some understanding of git so let me explain
further:

Git commit IDs are a totally free form fields. There is nothing stopping
me making commit A as "Richard <rp@localhost>", commit B as "rpurdie
rurdie@laptop" and then commit C as "Joe <someone@somewhere>". Commit A
was my desktop, commit B was my laptop, commit C was on some account I
borrowed.

One problem with git is that its all too easy to screw up setting the
author/commit IDs. I've done it before, I suspect I will again next time
I change machine and I'm sure others will too intentionally or
otherwise.

Going back in time, we had the same problem with bitkeeper. Anyone
looking through the bkcvs commit ids will see exactly what I mean -
there are some entries in there that are totally untraceable now, e.g.
account@1.2.3.4

Why does it matter? I'd like to be able to go to the SCM and *know* who
made a commit (knowing who authored the patch is different). I'd like to
be able to view all commits for a given "identity".

Also note that git makes a distinction between git commit IDs and git
author IDs. It makes sense to standardise the commit IDs and these are
the ones I'm suggesting match a pattern like "Foo
<id@dev.openembedded.org>". Note I'm not too bothered about the author
IDs as long as they're valid email addresses (i.e. not localhost) and
I'm also not bothered about the name used against the commit address
(Foo in the above example).  That could be "Foo (@Work)" or anything
else anyone desires as long as the id@ is valid which is what I care
about and allows us to obtain meaningful information from our metadata.

Gitweb and cgit usually show the author ID, and you have to look harder
for the commit IDs.

Also, "the kernel does this, why can't we" is a totally bogus argument:

1. If the kernel jumped off a cliff, would you too?
2. The kernel uses a pull model for development and people check IDs for
some sanity before pulling. With the push model we're going for we don't
have that luxury.

Hope that clears some of this up.

Cheers,

Richard




