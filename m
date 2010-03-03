Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NmoLI-000754-SQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 14:10:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o23D7VU2017872;
	Wed, 3 Mar 2010 13:07:31 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17364-09; Wed,  3 Mar 2010 13:07:16 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o23D7CbW017866
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 3 Mar 2010 13:07:12 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <141020e31003030454i59ed2d9fpcc32ac4ec1b65c0c@mail.gmail.com>
References: <1267218939-6086-1-git-send-email-Martin.Jansa@gmail.com>
	<141020e31003030454i59ed2d9fpcc32ac4ec1b65c0c@mail.gmail.com>
Date: Wed, 03 Mar 2010 13:07:11 +0000
Message-ID: <1267621631.2259.19.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] package_ipk.bbclass DON'T PUSH THIS, but PLEASE read it
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
X-List-Received-Date: Wed, 03 Mar 2010 13:10:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-03-03 at 13:54 +0100, Martin Jansa wrote:
> On Fri, Feb 26, 2010 at 10:15 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> > There is quite common error about non-existent lockfile path
> >
> > I've seen that everytime when recipe changes ARCH (ie when removed machine specific config)
> > and package is no longer in tmp/work/om-gta01.. but tmp/work/armv4t.., then whole build works
> > ok, but in the end it's looking for lockfile in right directory but in wrong arch dir.
> >
> > Today I've seen similar error from mwester:
> > 18:10:59 < mwester> ERROR: Error, lockfile path does not exist!: /u/slug/slugos/tmp/work/armv5teb-linux-gnueabi/gpsd-2.39-r0/packages-split
> 
> ping?
> 
> I think this is quite big bug as wrong vars can be used in more places
> and create bigger problems than missing lockfile path.
> 
> At least please point me to example why we need collapsed subpackage
> data in global scope.
> 
> RP: sorry for adding you to CC directly, but you would probably know,
> if the variable name collapsing fuction from Poky:
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=634c76d02e5796f5e908b6d6a79dcfef6f8af3d1
> should be somewhere in this code path.

Its a serious bug I agree but a very hard one to fix. The correct fix is
to have staging under full control of a packaging system, then when you
clean packages, all the right bits are actually removed.

In that sense this is no better or worse than the other 101 ways you can
break staging.

So in summary, no easy fix, we need to fix the big general problem -
packaged staging needs to be on by default and used by everything. Only
then will we nail all these problems.

Cheers,

Richard






