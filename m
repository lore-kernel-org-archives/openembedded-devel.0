Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HJdG3-0001nh-CZ
	for openembedded-devel@openembedded.org; Tue, 20 Feb 2007 23:14:47 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l1KMEiv8011110;
	Tue, 20 Feb 2007 22:14:44 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10446-04; Tue, 20 Feb 2007 22:14:42 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l1KMEecp011099
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 20 Feb 2007 22:14:40 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1908706584.20070220225528@gmail.com>
References: <E1HFb2e-0007GK-Jp@linuxtogo.org>
	<45D9CFF7.8060502@kernelconcepts.de>
	<1908706584.20070220225528@gmail.com>
Date: Tue, 20 Feb 2007 22:14:41 +0000
Message-Id: <1172009681.5884.108.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] org.oe.dev xserver-common 1.13: Re-add	calibrate-only-if-ts.patch after merge.
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
X-List-Received-Date: Tue, 20 Feb 2007 22:14:48 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-02-20 at 22:55 +0200, Paul Sokolovsky wrote:
> > pfalcon commit schrieb:
> >> xserver-common 1.13: Re-add calibrate-only-if-ts.patch after merge.
> 
> > that's a very good idea but I am sure the patch will break calibration on quite
> > some devices because the device might have a different name. Maybe use
> > detect-stylus for this purpose.
> 
>   There was RFC to standardize name of touchscreen device in OE, and
> at the beginning of year corresponding changes were made (not by me
> ;-) ). For all 2.6 devices (which has standardized touchscreen support),
> there's a udevd rule which creates symlink from /dev/input/touchscreen0 to
> real device. Maintainers of 2.4 devices (which are mostly replaced with 2.6
> versions in OE.dev by now) are expected to provide such link by other
> means - either create link specific to some device, or use tool like
> detect-stylus.
> 
>   Such change does good job of clarifying touchscreen detection in system
> (you might remember my tries few months ago to implement it cleanly in
> Familiar).
> 
>   I understand that such a change would be too liberal for GPE mainline
> at this time, but OE.dev provides nice staging ground for that, so
> let's see how it goes.

Since I was the one who pushed some of this, let me clarify my position
at least.

My intention was to standardise all 2.6 kernels using udev to use the
udev rule, use /dev/touchscreen* and therefore remove the need for
detect-stylus and machine specific ts-conf packages. I have no problem
having custom tslib conf files for a 2.4 device which needs to work
differently. I have now changed the defaults to reflect what the
majority of new users will be using though.

As for xserver-common, I'd like to see the standard version of the
scripts remain detect-stylus free as it can work on the majority of
targets supported by OE without that now. If some legacy devices need
it, lets give them a machine specific customised xserver-common like
tslib. OE can handle that kind of thing really easily.

I make no comment about what GPE itself might want, the needs of GPE and
the needs of OE look to be differing but the patch is valid for OE's
needs even if not acceptable "upstream". Issues like this is one reason
poky "forked" those scripts as we knew our needs might not always match
GPEs or OEs.

Cheers,

Richard



