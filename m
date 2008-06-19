Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1K9F3a-0000Kh-9c
	for openembedded-devel@openembedded.org; Thu, 19 Jun 2008 09:59:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m5J7wejl023615
	for <openembedded-devel@openembedded.org>;
	Thu, 19 Jun 2008 08:58:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23247-09-2 for <openembedded-devel@openembedded.org>;
	Thu, 19 Jun 2008 08:58:35 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m5J7wMCF023583
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 19 Jun 2008 08:58:22 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <48598ECE.9030604@palm.com>
References: <48598ECE.9030604@palm.com>
Date: Thu, 19 Jun 2008 08:58:22 +0100
Message-Id: <1213862302.5018.2.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Thu, 19 Jun 2008 07:59:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-06-18 at 15:40 -0700, Rich Pixley wrote:
> If C depends on B depends on A...
> 
> A first build will build A, B, C.
> A second build will build nothing since nothing has changed.  (this is 
> correct behavior).
> However, if I change A and rebuild, only A will be rebuilt, not B or C.
> 
> This is a nuisance for developers who are using bitbake as a build 
> system.  It's a problem for continuous build systems since they must 
> necessarily build everything over from source in order to test whether 
> builds work.
> 
> I'm thinking that it should be fairly easy to adjust which recipe+task 
> pairs are scheduled for execution by looking not only at stamp file 
> existence, but also at the comparative difference in stamp file times.  
> If the stamp file for A is more recent than the stamp file for B, then B 
> needs to be scheduled for execution as does C.
> 
> Does anyone know of any reason why this cannot or should not be done?

It wasn't done for a long time simply because nobody had taken the time
to implement it. It has however recently been implemented, simply set:

BB_STAMP_POLICY = "full" 
or
BB_STAMP_POLICY = "whitelist" 

Whitelist allows you to exempt certain packages from stamp checking, see
packaged-staging.bbclass for an example.

Cheers,

Richard



