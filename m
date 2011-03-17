Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q0HVR-0005If-Ea; Thu, 17 Mar 2011 19:01:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2HHxMQt023096;
	Thu, 17 Mar 2011 17:59:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22702-07; Thu, 17 Mar 2011 17:59:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2HHxIMi023090
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 17 Mar 2011 17:59:18 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tsc@lists.openembedded.org
In-Reply-To: <AANLkTim51F7=Jt5COph35-KpHEX0oBJwhBUh4KLhgT_W@mail.gmail.com>
References: <4D817FB9.5050404@windriver.com>
	<AANLkTim51F7=Jt5COph35-KpHEX0oBJwhBUh4KLhgT_W@mail.gmail.com>
Date: Thu, 17 Mar 2011 17:59:03 +0000
Message-ID: <1300384743.30423.2087.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Minutes, OE TSC meeting, March 10 2011
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
X-List-Received-Date: Thu, 17 Mar 2011 18:01:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-17 at 09:38 +0100, Frans Meulenbroeks wrote:
> Mark, thanks for the minutes.
> 
> There is one remark I'd like to make and one agenda item i'd like to
> coin for the TSC (I'll do that here since I haven't seen an agenda and
> call for topics for the next TSC meeting)
> 
> 2011/3/17 Mark Hatle <mark.hatle@windriver.com>:
> 
> >
> > Further discussion of deprecation of OE bugzilla.  Yocto intends to keep a bug
> > tracking system for itself.  This might also be the place where OE-Core bugs can
> > be tracked.
> >
> 
> What about the remaining parts of OE?
> Do we also stop to use bugzilla for those?

The current OE bugzilla is a mess, I think that much is clear. Why?

For a bugzilla to work, its needs active maintenance. Yocto has enough
resources to do this for OECore, its is not really able to take on the
whole of OE though, we're simply not resourced to do it. I'd rather take
on something manageable and do it well that try and do too much and do
it badly.

The offer of Yocto looking after OECore bugs and the bugzilla for them
is therefore a positive step but if we want to cover the whole of OE,
the resources need to come from somewhere and there is nobody
volunteering at this time.

I think the TSC is pretty much recommending the existing OE bugzilla
should be shut down as nobody is doing active work with it and it just
misleads people.

> Or will that also be done in the yocto bug tracking system?
> 
> I would like to suggest that the TSC starts to discuss how to deal
> with the non-oe-core recipes that we have.
> We have meta-oe of course. It might be useful to discuss and decide on:
> - do we want to use meta-oe (and if so, how should it be
> sub-structured, e.g. similar to oe-core meta* dirs)

I think the TSC has said yes, it wants to encourage meta-oe and that is
was encouraging a more layered approach there.

> - assuming it'll be meta-oe, how will we deal with it in terms of
> adding recipes, dealing with patches, retention policy, ownership etc
> etc

I think the TSC did discuss and document some of this but its certainly
not crystal clear yet. We're still trying to sort out the documentation
for OE Core though and that is a priority over meta-oe. Note that it
doesn't have to be the just the TSC members who do this and we're open
for any help in writing drafts for discussion...

> - how/where to store deprecated oe-core recipes that are still
> useful/needed (and how to retire them if they are not needed any
> more).

If meta-oe is layered, a layer for these could be created to make this
clear.

Cheers,

Richard



