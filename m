Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1H0jki-0004mk-Qx
	for openembedded-devel@openembedded.org; Sat, 30 Dec 2006 20:20:24 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kBUJJVhY001712
	for <openembedded-devel@openembedded.org>; Sat, 30 Dec 2006 19:19:31 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01337-07 for <openembedded-devel@openembedded.org>;
	Sat, 30 Dec 2006 19:19:29 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kBUJJSWQ001705
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Sat, 30 Dec 2006 19:19:28 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20061230051641.GA30225@hezmatt.org>
References: <20061230051641.GA30225@hezmatt.org>
Date: Sat, 30 Dec 2006 19:19:29 +0000
Message-Id: <1167506369.5626.46.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: A question of workflow
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
X-List-Received-Date: Sat, 30 Dec 2006 19:20:24 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2006-12-30 at 16:16 +1100, Matthew Palmer wrote:
> I've hacked on the Ruby bitbake spec so it can build commonly-used
> extensions like zlib, socket, and openssl.  However, I'm not sure how to go
> about committing, submitting, and merging this patch with the main OE tree.
> 
> What I've done so far:
> 
> * Gotten a checkout of the org.openembedded.dev branch;
> * Made my modifications;
> * Created a key;
> * Committed my changes to my working copy.
> 
> Now I can't even manage to retrieve the diff of my changes (the 'obvious'
> step of running "mtn diff -r <SHA1>" didn't do anything useful) to submit
> them to the bugzilla.  

I'm not sure what the right command it but you should be able to extract
that diff somehow, I don't know offhand what the command would be.

> Of course, submitting a context-free patch when
> you've got a full distributed RCS at your bidding seems a bit archaic
> anyway.
> 
> So, my questions:
> 
> * How do I get my diff back?
> * How do I submit my changes to the OE project for merging?
> * Will I have problems when the change gets committed to the trunk?
> * (The biggie) is there a guide on the wiki or somewhere describing the
>   preferred workflow for making changes and working effectively with the rest
>   of the OE developer community?  (Google wasn't at all illuminating)

What you've described is how I or any other OE developer with an
authorised monotone key would work with OE. The problem is we can't just
give access to anyone as that wouldn't make any sense for obvious
reasons.

Before we give out such access, we need to have some idea of a persons
capabilities and trust them enough not to break things (too badly ;-).
We generally ask you start submitting patches via the bugzilla and then
when we're happy you might get direct commit access. This doesn't fit in
with the SCM (monotone) that well.

It does mean you shouldn't be committing changes locally via monotone.
If you do this you will have to pull and then merge every time. That
isn't a problem in itself but if you do get direct commit access, we
will not be happy adding hundreds of extra merges to the main
repository.

Richard








