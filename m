Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NnCoo-00077E-QL
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Mar 2010 16:18:32 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o24FFbnQ032365
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Mar 2010 15:15:37 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32221-02-2 for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Mar 2010 15:15:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o24FAiNh032127
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Mar 2010 15:10:45 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hmm5jv$e77$1@dough.gmane.org>
References: <b6ebd0a51003030909u58f72751u19f5b3caab614450@mail.gmail.com>
	<hmm5jv$e77$1@dough.gmane.org>
Date: Thu, 04 Mar 2010 10:15:02 +0000
Message-ID: <1267697702.2259.243.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=AWL,BAYES_00,
	DATE_IN_PAST_03_06, RDNS_DYNAMIC, TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Initial Proposal for Packaged Staging Revamp (was [RFC] Make some big changes right after next stable)
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
X-List-Received-Date: Thu, 04 Mar 2010 15:18:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-03-03 at 18:17 +0100, Koen Kooi wrote:
> On 03-03-10 18:09, Chris Larson wrote:
> > To summarize, I propose the creation of an archive/package which acts as the
> > primary artifact to come out of the build of a recipe. 
> 
> That sounds like a good way to do packaged-staging without making my
> head explode :)

This is mainly due to the constraints that were placed upon its
development. If we can relax some of the constraints, we can make it
simpler.

> I think the 'private staging' approach is the way to go, it makes the
> build determistic instead of "might pick up extras from staging". And I
> think it will also cure the mysterious "every python recipe breaks when
> some, yet unknown, recipe is built"

Yes, private staging areas are something we need and I don't think
anyone believes otherwise. This isn't something either proposal is
offering directly. Its only something that it will be possible to
develop more easily once we have staging packages working well.

Cheers,

Richard



