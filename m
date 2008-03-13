Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1JZbcd-0000lk-7w
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Mar 2008 01:48:41 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id ACF1FC4F7C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 20:46:32 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Wed, 12 Mar 2008 20:46:32 -0400
X-Sasl-enc: gibU0ziBFqgMXOZLyvg2pbt97A7/R04sdVKeKFHfoBzd 1205369191
Received: from [172.18.92.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 3526FD1B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 20:46:30 -0400 (EDT)
Message-ID: <47D8793C.2050507@whitby.id.au>
Date: Thu, 13 Mar 2008 11:15:48 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1718.1205362131@dls.net> <1205363882.4530.35.camel@dax.rpnet.com>
In-Reply-To: <1205363882.4530.35.camel@dax.rpnet.com>
X-SA-Exim-Connect-IP: 66.111.4.28
X-SA-Exim-Mail-From: rod@whitby.id.au
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
X-List-Received-Date: Thu, 13 Mar 2008 00:48:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> We have a core team and I guess the first step would be
> to put it to a vote there and see where we stand? I'm open to other
> ideas and possibly to representations from non core team developers with
> a case for a vote too.

The nslu2-linux project votes for git, for the following reasons:

1) Most of the nslu2 core team developers are already exposed to git due 
to kernel work.  None of them that I know of are exposed to hg.  Yes, 
that's a selfish position, and yes that means that we're arguing from a 
position of ignorance with respect to hg.

2) None of the nslu2 core team developers have the bandwidth to learn 
yet another SCM, purely for OE.  OE is a means to an end, not an end in 
itself.  Yes, that's a selfish position.

3) Git can support the multiple disconnected-but-syncing servers that 
currently exist in the way that monotone.nslu2-linux.org and 
monotone.openembedded.org work.  We cannot accept a single central 
server model, and I haven't seen anyone state how hg supports the 
multiple equal servers model yet.  But even if hg can support that 
model, we've already dealt with multiple git servers and know how that 
works, so we'd prefer not to need to set up a new system.  Yes, that's a 
selfish position.

4) All arguments against git so far seem to be either "an old version of 
git ate my data" or "git used to be poorly documented".  None of these 
arguments presented seem to be valid going forward in my opinion.

5) I've personally used git, and it does everything I would need it to 
do for OE development.  I haven't used hg, and prefer not to need to 
learn it, even if it did turn out to be technically better.  Yes, that's 
a selfish position.

So the summary is:

Git is good enough, we already use it, so let's just use it for one more 
purpose and get on with the real work.

-- Rod


