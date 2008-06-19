Received: from [63.80.53.70] (helo=smtp-relay1.palm.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rich.pixley@palm.com>) id 1K9NTO-0000aM-Fo
	for openembedded-devel@openembedded.org; Thu, 19 Jun 2008 18:58:58 +0200
X-IronPort-AV: E=Sophos;i="4.27,673,1204531200"; 
   d="scan'208";a="5804556"
Received: from unknown (HELO mailhost01.palm.com) ([148.92.223.30])
	by smtp-relay1.palm.com with ESMTP; 19 Jun 2008 09:57:45 -0700
Received: from ako.local ([10.100.2.5])
	by mailhost01.palm.com (8.13.6+Sun/8.12.10) with ESMTP id
	m5JGvhUr006021; Thu, 19 Jun 2008 09:57:43 -0700 (PDT)
Message-ID: <485A9008.3030502@palm.com>
Date: Thu, 19 Jun 2008 09:57:44 -0700
From: "K. Richard Pixley" <rich.pixley@palm.com>
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
X-List-Received-Date: Thu, 19 Jun 2008 16:58:58 -0000
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
Thanks.

I'm not seeing any references to BB_STAMP_POLICY in bitbake-1.8.10.  Am 
I looking in the wrong place?

--rich


