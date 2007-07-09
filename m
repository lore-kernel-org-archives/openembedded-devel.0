Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1I7uAg-00066z-3V
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2007 16:25:02 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 7E1C228C013; Mon,  9 Jul 2007 16:18:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,REPTO_OVERQUOTE_THEBAT autolearn=no 
	version=3.1.7-deb
Received: from PROMETHEUS (e180163073.adsl.alicedsl.de [85.180.163.73])
	by srv043.dedi23.de (Postfix) with ESMTP id A479C28C012;
	Mon,  9 Jul 2007 16:18:11 +0200 (CEST)
Date: Mon, 9 Jul 2007 16:19:25 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <4310707680.20070709161925@vanille-media.de>
To: Graeme Gregory <dp@xora.org.uk>
In-Reply-To: <20070709140338.GE2336@p3n3tr4t0r.internal>
References: <513012886.20070708041151@gmail.com> <f6q30v$s2$1@sea.gmane.org>
	<128309124.20070709154303@gmail.com>
	<20070709131744.GC2336@p3n3tr4t0r.internal>
	<1005211919.20070709153513@vanille-media.de>
	<20070709134256.GD2336@p3n3tr4t0r.internal>
	<13810026301.20070709155245@vanille-media.de>
	<20070709140338.GE2336@p3n3tr4t0r.internal>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Adding screen dimensions to machine configs
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
X-List-Received-Date: Mon, 09 Jul 2007 14:25:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Graeme Gregory wrote:
> On Mon, Jul 09, 2007 at 03:52:45PM +0200, Dr. Michael Lauer wrote:
>> Heh, it's not just Opie. Eventually we may want to ship prerendered png's for
>> UI elements. We better know about the size and dpi of the displays to
>> get sane defaults. There's a whole lot of packages which could use the
>> MACHINE namespace to improve targetting the platforms specifics at
>> build time.
>> 
> I just worry what happens to machines without screens but that can have
> gfx cards added.

Which is almost all equipment with USB host.

>  By the current level of thought behind these variables
> a divide by zero is inevitable.

Ok, how about VGA being the default?

>> What makes you worry so much about adding more (imho necessary)
>> information to the MACHINE_ capability namespace?
>> 
> Nothing, but these variables seem little thought out and seem to be being
> rushed into use for one use case (opie backgrounds).

The idea of additional settings like this to the build time machine
database has been around for long, its just that the Opie
backgrounds are IMO a good enough trigger to (finally) add these
attributes.

> And if it is neccessary then it should be the "correct" information, like
> for spitz the screen is 480x640 by default. Deal with it in packages that
> wish to use rotation correctly.

So, what's the correct information? The physical rotation? The
hardware rotation? How about different kernels configuring the gfx
hardware in different ways?

Tell you what... applications don't care! They care about sane
defaults for common use cases.

> Not just this value makes it easy for my
> magic background generator.

Stop hammering on this particular use case, I already pointed out
there's a lot more potential.

> Maybe a MACHINE_DEFAULT_ROTATION is also needed.

I don't think so. What applications care about is if portrait or
landscape is the common default and this is already encoded in HEIGHT
and WIDTH.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



