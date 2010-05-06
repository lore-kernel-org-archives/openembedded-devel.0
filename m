Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1O9zz0-0001an-51
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 14:15:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o46CAerH020682
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 6 May 2010 13:10:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20377-05 for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 May 2010 13:10:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o46CAUE0020674
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 6 May 2010 13:10:31 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hrtpja$lag$1@dough.gmane.org>
References: <1273102999.5743.49.camel@rex> <hrtn8s$e9m$1@dough.gmane.org>
	<hrtpja$lag$1@dough.gmane.org>
Date: Thu, 06 May 2010 13:10:27 +0100
Message-ID: <1273147827.5743.104.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: The rpurdie/work-in-progress branch has been merged
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
X-List-Received-Date: Thu, 06 May 2010 12:15:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-05-06 at 09:03 +0200, Koen Kooi wrote:
> On 06-05-10 08:23, Koen Kooi wrote:
> > On 06-05-10 01:43, Richard Purdie wrote:
> >> I finally felt the time was right so I've merged the work-in-progress
> >> branch I've been talking about to OE.dev. This contains various
> >> architecture improvements and legacy staging cleanups that have been
> >> used in Poky for a while with great benefit.
> > 
> > With bitbake 1.10 I get:
> > 
> > NOTE: Preparing runqueue
> > Traceback (most recent call last):
> >   File "/OE/bitbake/lib/bb/server/none.py", line 128, in idle_commands
> >     retval = function(self, data, False)
> >   File "/OE/bitbake/lib/bb/cooker.py", line 730, in buildTargetsIdle
> >     retval = rq.execute_runqueue()
> >   File "/OE/bitbake/lib/bb/runqueue.py", line 830, in execute_runqueue
> >     self.prepare_runqueue()
> >   File "/OE/bitbake/lib/bb/runqueue.py", line 513, in prepare_runqueue
> >     if len(runq_recrdepends[task]) > 0:
> > IndexError: list index out of range
> > 
> > when doing MACHINE=beagleboard bitbake console-image
> 
> Bitbake 1.8, 1.10 and master exhibit the same behaviour. 'bitbake gcc'
> does work, trying to narrow down which recipe is causing this, it's not
> the toolchain.

Someone just told me OE was broken as this email hadn't been replied
too. For reference, Koen and I talked elsewhere, a fix was pushed and
this issue was resolved. 

To further update, Khem pushed updates for eglibc and gcc 4.5 (thanks).
Koen also pushed some legacy staging removals which had some issues but
these have also all been fixed. There was also an error appearing about
"bb" being unknown and that is also fixed.

So in summary, we don't have any known problems due to these changes at
the moment :).

I wasn't clear in my original email but all issues that people raised
testing the branch had been addressed before it was pushed. Thanks go to
the people who did test it.

Cheers,

Richard



