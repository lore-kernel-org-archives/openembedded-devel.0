Received: from [212.60.202.195] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1HK0WL-0007JW-2a
	for openembedded-devel@openembedded.org; Thu, 22 Feb 2007 00:05:09 +0100
Received: from [87.193.44.191] (helo=[192.168.7.104])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50)
	id 1HK0gW-0005QU-Ls; Thu, 22 Feb 2007 00:15:41 +0100
Message-ID: <45DCD020.1050002@kernelconcepts.de>
Date: Thu, 22 Feb 2007 00:05:04 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 1.5.0.9 (X11/20070103)
MIME-Version: 1.0
To: Richard Purdie <rpurdie@rpsys.net>
References: <E1HFb2e-0007GK-Jp@linuxtogo.org>	
	<45D9CFF7.8060502@kernelconcepts.de>
	<1908706584.20070220225528@gmail.com>
	<1172009681.5884.108.camel@localhost.localdomain>
In-Reply-To: <1172009681.5884.108.camel@localhost.localdomain>
X-Enigmail-Version: 0.94.0.0
Cc: openembedded-devel@openembedded.org
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
X-List-Received-Date: Wed, 21 Feb 2007 23:05:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Richard Purdie wrote:

> My intention was to standardise all 2.6 kernels using udev to use the
> udev rule, use /dev/touchscreen* and therefore remove the need for
> detect-stylus and machine specific ts-conf packages. I have no problem
> having custom tslib conf files for a 2.4 device which needs to work
> differently. I have now changed the defaults to reflect what the
> majority of new users will be using though.

right, basically a good idea I like as well, but not a hack that is likely
break things.

> As for xserver-common, I'd like to see the standard version of the
> scripts remain detect-stylus free as it can work on the majority of
> targets supported by OE without that now. If some legacy devices need
> it, lets give them a machine specific customised xserver-common like
> tslib. OE can handle that kind of thing really easily.

It should not be necessary to have machine specific versions of that package
which is something we should try to avoid where ever possible.
Just make that patch a little bit more smart... maybe check if TSLIB_TSDEVICE is
set and honor is in this case.

> needs even if not acceptable "upstream". Issues like this is one reason
> poky "forked" those scripts as we knew our needs might not always match

Well... in this case it is that easy to avoid forking, so why wasting
time maintaining a fork?

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-14
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


