Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>)
	id 1K4yeI-0006QA-KD; Sat, 07 Jun 2008 15:40:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m57DZ5ft004671;
	Sat, 7 Jun 2008 14:35:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04474-04; Sat,  7 Jun 2008 14:34:55 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m57DYst9004648
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 7 Jun 2008 14:34:54 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <f96d234e0806070423k5361f4a7g2b48cee0f8f0a659@mail.gmail.com>
References: <f96d234e0805301122s1b48445ardf7d268fcebdec50@mail.gmail.com>
	<200806021019.50397.openembedded@haerwu.biz>
	<f96d234e0806020753l21423d51kef19c7bc00f02244@mail.gmail.com>
	<loom.20080605T225939-65@post.gmane.org>
	<loom.20080606T002255-512@post.gmane.org>
	<f96d234e0806060651g12575666k2699643198a78262@mail.gmail.com>
	<f96d234e0806070423k5361f4a7g2b48cee0f8f0a659@mail.gmail.com>
Date: Sat, 07 Jun 2008 14:34:55 +0100
Message-Id: <1212845695.5179.42.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Using OE <openembedded-users@openembedded.org>
Subject: Re: adding German local files to an image
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
X-List-Received-Date: Sat, 07 Jun 2008 13:40:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Sat, 2008-06-07 at 07:23 -0400, Cliff Brake wrote:
> The reason for the above behavior is locale packages are created
> dynamically, so bitbake has no knowledge of them.  Adding the
> following to bitbake.conf as as suggested on IRC last night would fix
> that:
> 
> PACKAGES_DYNAMIC = "${PN}-locale-*"
> 
> Any objections to adding this?

Not an objection but a technical problem: With the above, you will get a
crash from bitbake since that expands to "uclibc++-locale-*" for the
uclibc++ package and that variable is treated as a regexp.

I'm undecided what the best fix for that is at the moment...

Cheers,

Richard




