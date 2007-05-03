Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1HjbK5-0004yX-S9
	for openembedded-devel@openembedded.org; Thu, 03 May 2007 15:26:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l43DGkNV015755;
	Thu, 3 May 2007 14:16:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15265-09; Thu,  3 May 2007 14:16:40 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l43DGdVC015739
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Thu, 3 May 2007 14:16:39 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <35653307.20070503154732@gmail.com>
References: <35653307.20070503154732@gmail.com>
Date: Thu, 03 May 2007 14:16:39 +0100
Message-Id: <1178198199.6312.30.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org
Subject: Re: [ALERT] Security vulnerability with recent OE bitbake.conf	changes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 May 2007 13:26:18 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2007-05-03 at 15:47 +0300, Paul Sokolovsky wrote:
> Hello openembedded-devel,
> 
> A commit made some time ago,
> 
> http://lists.linuxtogo.org/pipermail/openembedded-commits/2007-April/004912.html
> 
> introduced a hole which may lead to unnoticed security vulnerabilities
> slipping into the packages/images produced. Specifically, it defines a
> random application of a random suite to be used for resolving patching
> conflicts/failures. If you don't happen to have that random tool,
> patching failure will be silently swallowed, leading to any adverse
> effects imaginable - from compile failure to the mentioned security
> vulnerabilities.

Patch failure should not be silently swallowed, the builds should abort.
If they don't, we need to fix that underlying problem.

FWIW, your first solution using SHELLRCCMD won't actually work due to
the way IO redirection is done in recent bitbake. 

Your second solution of adding the DEPENDS is impractical due to the
amount of -native packages it would require.

So we need to find the real problem and fix that, probably somewhere in
patch.bbclass an error code isn't being propagated at a guess.

I will also hint at the use of PATCH_RESOLVER = "noop" which means the
user gets the old behaviour of patch failure aborts the build with no
help from any resolver. It should have always been the default but
wasn't. I'm not sure what the current default is but we can change it to
that if its not.

Cheers,

Richard



