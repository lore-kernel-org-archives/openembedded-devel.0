Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1KOLgU-0000eX-Co
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jul 2008 02:06:23 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 1B64214B8E3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2008 20:04:38 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Wed, 30 Jul 2008 20:04:38 -0400
X-Sasl-enc: cPcMu7F2nHikW1VPxu0ZtI5T1qkVHGhTAaXyQj6Nbg/d 1217462677
Received: from [192.168.124.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 335CDFE28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2008 20:04:36 -0400 (EDT)
Message-ID: <4891013A.5040005@whitby.id.au>
Date: Thu, 31 Jul 2008 09:33:06 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.16 (Windows/20080708)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1217340989.5482.10.camel@dax.rpnet.com>	<488FAE77.7050107@whitby.id.au>	<200807300920.37221.openembedded@haerwu.biz>	<f96d234e0807300429j2fff8df0oc494e4a5beb9f8ff@mail.gmail.com>	<87myjz34uv.fsf@neumann.lab.ossystems.com.br>	<4890678A.5040005@balister.org>	<1217428116.5510.26.camel@dax.rpnet.com>	<489084EE.9070407@whitby.id.au>
	<1217434487.5510.64.camel@dax.rpnet.com>
In-Reply-To: <1217434487.5510.64.camel@dax.rpnet.com>
X-Enigmail-Version: 0.95.6
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
X-List-Received-Date: Thu, 31 Jul 2008 00:06:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> I'm going to skip the rest of your argument, I don't agree the other
> bits but this bit did does lead to something important: 

Yeah, if we couldn't convince each other in an hour of IRC discussion, 
then we're not going to do so via email.

> Say I have some tree outside OE and I commit things to is as a developer
> with no access to OE directly. "We" then want to merge that into OE.
> Even assuming the commit hooks allow this (there are ways and means) we
> immediately lose our namespace protection. There are 101 other scenarios
> that would allow this to happen and they show that namespace protection
> is pointless with git.

Agreed.

> Note that your AUTHORS file would also break with this approach unless
> at merge time you grep the external tree for all email addresses and
> then add them which would be tedious at best.

Yes, I thought it would only check the final committer, but others have 
pointed out that it checks each one in the imported tree.  So I withdraw 
that proposal.

> I think we've lost sight of the original problems so lets go back to
> them:
> 
> The points I had in mind with this was to:
> 
> a) stop insane IDs entering the repository (ich@1.2.3.4)

Agreed.

> b) gain something we could feed into the final mtn -> git and bkcvs -> 
>    git conversions which would make more sense of the data. 
>    "crofton@openembedded.org" really isn't a useful identifier.

I agree with your proposed solution on this one.

> c) ensure we have accurate records about our committers on the wiki

I agree with your proposed solution on this one.

> d) remove problems trying to associate related commit IDs e.g.  when 
>    someone changes email address frequently and solve that problem once 
>    and for all.

People will usually retain the same Real Name part of the ID, so we can 
match quite well using that when the email address changes.

> For a) I guess the best we can do is add some checking for insane commit
> and author IDs like containing "localhost", not setting a name or
> containing an IP address. I'd also like to add something to the commit
> policy about only committing using sane IDs, commits with invalid IDs
> are at risk of being reverted.

I'm very happy with that solution, and fully agree that the policy must 
mandate sane IDs and we must forcefully reject with extreme prejudice 
any commits without a valid ID.

> How does that sound?

I'm very happy with your proposal.  Thanks for taking my views into account.

-- Rod


