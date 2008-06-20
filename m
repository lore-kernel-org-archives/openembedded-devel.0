Received: from [64.28.152.243] (helo=smtp-relay2.palm.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rich.pixley@palm.com>) id 1K9V3C-0003h4-Tr
	for openembedded-devel@openembedded.org; Fri, 20 Jun 2008 03:04:27 +0200
X-IronPort-AV: E=Sophos;i="4.27,676,1204531200"; d="scan'208";a="10245234"
Received: from unknown (HELO mailhost02.palm.com) ([148.92.223.90])
	by smtp-relay2.palm.com with ESMTP; 19 Jun 2008 18:03:11 -0700
Received: from flamingo.palm1.palmone.com (flamingo.palm1.palmone.com
	[148.92.248.64])
	by mailhost02.palm.com (8.13.6+Sun/8.12.10) with ESMTP id
	m5K138XA006357; Thu, 19 Jun 2008 18:03:10 -0700 (PDT)
Message-ID: <485B01CC.3000701@palm.com>
Date: Thu, 19 Jun 2008 18:03:08 -0700
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Thunderbird 2.0.0.14 (Macintosh/20080421)
MIME-Version: 1.0
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
References: <48598ECE.9030604@palm.com> <1213862302.5018.2.camel@dax.rpnet.com>
In-Reply-To: <1213862302.5018.2.camel@dax.rpnet.com>
Subject: Re: bitbake vs incremental builds
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
X-List-Received-Date: Fri, 20 Jun 2008 01:04:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> It wasn't done for a long time simply because nobody had taken the time
> to implement it. It has however recently been implemented, simply set:
>
> BB_STAMP_POLICY = "full"
> or
> BB_STAMP_POLICY = "whitelist"
>
> Whitelist allows you to exempt certain packages from stamp checking, see
> packaged-staging.bbclass for an example.
This isn't working for me simply by taking a top of tree bitbake and 
shoving it into my environment.  However, my OE environment is over a 
year old and is moderately hacked locally.

I tried to write a trivial test case, but I got bogged down.  It's not 
at all clear to me what one would need to do to use bitbake in some 
environment other than OE.  I was hoping it would be simple to just 
write an empty conf/bitbake.conf and a couple of a.bb and b.bb files 
with a depending on b, but 2hrs later I'm still confused.

So this isn't working for me and I don't see an easy way to debug it.  
Any suggestions?

--rich


