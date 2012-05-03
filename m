Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1SPr0u-0003UR-PA
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 May 2012 10:03:48 +0200
Received: by bkcjm2 with SMTP id jm2so1190584bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 May 2012 00:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	bh=grXQ83LP2t4/lGS89fLnjH8VQY9OZFTJxkgmxIELOIY=;
	b=PYJot3TZNQ6Dxf838Z3wroUxju2O2sUMzEsSNmsiFoBpYA7OYQZSlPEIPvMQSSztRl
	hVNRy4a79ZUC2AbhWVLamJ8LHhRdjlJmmxTvd47EzqwbIFMg2sX86e4MY1w5Y+8VtGL4
	kKfecxyuAkqS4CFvqwAGccN6kJCIFrLC1a8ph+OrYNXYCV57DCKsOgJvz2LaJ5aZ5PZG
	fA1gkO+Kpgy0e4EpH3HVnF7aRdFNSYqQJBSfRfqjUxgKjCO8b/CxBiyfbsKOHnde7TsC
	5Z7byt8Iw8sM4tZmLxAv9DWR6Ug7W9iRNbD4Os7F79c9ATPevgYqeAGGYg/Aok385AXY
	y7Hg==
Received: by 10.204.145.79 with SMTP id c15mr391212bkv.60.1336031643599;
	Thu, 03 May 2012 00:54:03 -0700 (PDT)
Received: from [10.54.74.16] (64-103-25-233.cisco.com. [64.103.25.233])
	by mx.google.com with ESMTPS id v2sm8330970bkw.16.2012.05.03.00.54.01
	(version=SSLv3 cipher=OTHER); Thu, 03 May 2012 00:54:02 -0700 (PDT)
Message-ID: <4FA23915.6040604@gmail.com>
Date: Thu, 03 May 2012 09:51:49 +0200
From: =?UTF-8?B?TWFydGluIEVydHPDpXM=?= <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.3) Gecko/20120326 Thunderbird/10.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F9A932F.1020400@gmail.com>
	<CAMKF1sroFDS7vqn+DMRRjd368h=YsUX-ijMobhfddkvCp_uNyQ@mail.gmail.com>
	<4F9F8630.3070901@gmail.com>
	<CAMKF1spxTuL1b6yMN=N68tq=MLfJGT9jmgd6VzHmY+TwZvNLsA@mail.gmail.com>
	<4FA0FFD5.6080201@gmail.com> <4FA1A1C8.3030705@gmail.com>
	<4FA22A58.3040100@gmail.com> <jntd9a$pip$1@dough.gmane.org>
In-Reply-To: <jntd9a$pip$1@dough.gmane.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Openembedded and ld-linux-armhf.so.3
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
X-List-Received-Date: Thu, 03 May 2012 08:03:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/03/12 09:48, Koen Kooi wrote:
> Op 03-05-12 08:48, Martin Ertsås schreef:
> > On 05/02/12 23:06, Khem Raj wrote:
> >> On 05/02/2012 02:35 AM, Martin Ertsås wrote:
> >>> The patches posted seems to be working fine. I at least didn't have
> >>> any problems with them.
> >>
> >>
> >> thanks for trying them out. GCC patch is final but eglibc patch I still
> >> got to improve that its not final version yet.
>
> > No problem. Is there also plans for renaming the toolchains created to
> > arm-none-linux-gnueabihf when using hardfloats?
>
> What's the point in that? Renaming the toolchain won't grant it magical
> powers and setting a targetvendor is perfectly valid.
>
> I've seen too many presentations this year at ELC and Collab where someone
> says "renaming the toolchain fixed it" when they actually mean "using a
> bare-metal toolchain for userspace doesn't really work".
> Just look at the building the kernel with LLVM talk, a third of Marks
> presentation was about challenges with calling the right toolchain
> with the
> right arguments.
>
> </rant>

Fair point, I was just told that some packages might look at the name of
the toolchain, and perhaps not give the optimal path for hard floats
with the name of linux-gnueabi. Clearly some packages do actually look
at the name of the toolchain, but for most cases at least, the only
difference will be the hardfloat flag given to the compiler. Also seen
quite a few toolchains using hardfloats which has the hf prefix, to show
that this is actually a hardfloat toolchain.

>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



