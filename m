Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1LiAwq-0005SQ-0K
	for openembedded-devel@openembedded.org; Fri, 13 Mar 2009 18:13:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n2DHD6f7014171
	for <openembedded-devel@openembedded.org>; Fri, 13 Mar 2009 17:13:06 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14111-01 for <openembedded-devel@openembedded.org>;
	Fri, 13 Mar 2009 17:12:58 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n2DHCu5h014157
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 13 Mar 2009 17:12:56 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <013b01c9a3e7$1b44b3f0$5e3018ac@Glamdring>
References: <1236900736.26901.8.camel@grond.atmel.com>
	<200903121838.58470.raj.khem@gmail.com><20090313034930.GA23252@denix.org>
	<20090313060546.GF26343@smtp.west.cox.net>
	<013b01c9a3e7$1b44b3f0$5e3018ac@Glamdring>
Date: Fri, 13 Mar 2009 17:12:58 +0000
Message-Id: <1236964378.8433.18.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: PARALLEL_MAKE
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
X-List-Received-Date: Fri, 13 Mar 2009 17:13:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-03-13 at 15:19 +0100, Ulf Samuelsson wrote:
> I looked at a few recipies which by a stanrge coincidence had 
> PARALLEL_MAKE="",

That line means the recipe has some kind of Makefile dependency breakage
issues with "make -j" and therefore for that recipe only, parallel make
is disabled.

> Changed to
> PARALLEL_MAKE ="-j8"
> BB_NUMBER_THREADS = "2"

BB_NUMBER_THREADS is the one for real performance and can scale to a lot
of cores and use them all. As others have commented, disk bandwidth
becomes a real problem.

> I see some more cores beeing used.
> The initial setup after you changed local.conf seems to run on a single core 
> though.

When we added parallel core support the condition was it defaulted to
single core (backwards compatible). That has continued to this day and
perhaps the documentation needs to be improved. Poky's sample local.conf
has commented out entries with an explaination of why you'd set those
variables. These days I would accept an argument for:

PARALLEL_MAKE ="-j2"
BB_NUMBER_THREADS = "2"

in OE's sample local.conf as things have been well tested in this area
for a long time now and more cores are becoming the norm.

Cheers,

Richard




