Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HK29C-0003AT-H7
	for openembedded-devel@openembedded.org; Thu, 22 Feb 2007 01:49:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l1M0nC1L026269;
	Thu, 22 Feb 2007 00:49:12 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25528-07; Thu, 22 Feb 2007 00:49:09 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l1M0n8Wf026261
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Thu, 22 Feb 2007 00:49:08 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Florian Boor <florian.boor@kernelconcepts.de>
In-Reply-To: <45DCD020.1050002@kernelconcepts.de>
References: <E1HFb2e-0007GK-Jp@linuxtogo.org>
	<45D9CFF7.8060502@kernelconcepts.de>
	<1908706584.20070220225528@gmail.com>
	<1172009681.5884.108.camel@localhost.localdomain>
	<45DCD020.1050002@kernelconcepts.de>
Date: Thu, 22 Feb 2007 00:49:08 +0000
Message-Id: <1172105348.5790.71.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org
Subject: Re: [oe-commits] org.oe.dev xserver-common 1.13:	Re-add	calibrate-only-if-ts.patch after merge.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Feb 2007 00:49:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2007-02-22 at 00:05 +0100, Florian Boor wrote:
> Richard Purdie wrote:
> > As for xserver-common, I'd like to see the standard version of the
> > scripts remain detect-stylus free as it can work on the majority of
> > targets supported by OE without that now. If some legacy devices need
> > it, lets give them a machine specific customised xserver-common like
> > tslib. OE can handle that kind of thing really easily.
> 
> It should not be necessary to have machine specific versions of that package
> which is something we should try to avoid where ever possible.
> Just make that patch a little bit more smart... maybe check if TSLIB_TSDEVICE is
> set and honor is in this case.

If it references detect-stylus in the script, it RDEPENDS on
detect-stylus and we have a needless dependency. This is why I'm
suggesting two versions as a lot of devices don't need that dependency.

> > needs even if not acceptable "upstream". Issues like this is one reason
> > poky "forked" those scripts as we knew our needs might not always match
> 
> Well... in this case it is that easy to avoid forking, so why wasting
> time maintaining a fork?

I didn't and don't want to spend time having to justify whatever changes
we make in poky in that area to OE/GPE/whoever. I can guarantee I've
already spent more time in this thread than any time I've spent
maintaining that "fork". I say "fork" as I'm not blocking changes
passing to/from poky, I actively encourage it and if I made any
fundamental changes useful to upstream I would pass them on. I just know
we need certain changes in Poky but I know upstream won't like certain
changes and therefore I choose not to sync them. Some of the changes
we're discussing originated in poky which kind of proves my point :-(.

Cheers,

Richard



