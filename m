Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JTDrk-0002nn-Uh
	for openembedded-devel@openembedded.org; Sun, 24 Feb 2008 11:13:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1OADVe8000376
	for <openembedded-devel@openembedded.org>; Sun, 24 Feb 2008 10:13:31 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32495-09 for <openembedded-devel@openembedded.org>;
	Sun, 24 Feb 2008 10:13:27 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1OADMPE000369
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Sun, 24 Feb 2008 10:13:22 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20080224032919.01451fed@widy.localdomain>
References: <20080224032919.01451fed@widy.localdomain>
Date: Sun, 24 Feb 2008 10:13:22 +0000
Message-Id: <1203848002.8237.2.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Situation with qemu-native and its FB support
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
X-List-Received-Date: Sun, 24 Feb 2008 10:13:56 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2008-02-24 at 03:29 +0200, Paul Sokolovsky wrote:
> I just found that qemu-native no longer supports FB emulation, quitting
> with "Could not initialize SDL - exiting", while it worked some time
> ago (within 2 last months). Tracing thru changes to figure out what
> could have happened, I'm finding that it really couldn't work at all -
> we build libsdl-native with no video driver enabled for quite some
> time, and qemu DEPENDs on it for quite some time either. This is all
> aggravated with XV/OpenGL problems I started to have here after ATI
> drivers upgrade.
> 
> So, does anybody else experience this? Is full-fledged device emulation
> (with FB for example) within scope of qemu-native at all? I have to say
> that the need to have X11 development packages installed to just build
> an OE image (due to need of qemu-native to generate glibc locales)
> wasn't ideal, but at the same time it's convenient to have fresh qemu
> build to do general emulation.

In Poky its actually left "floating". If the build system has X headers
and SDL, qemu-native has graphics support, if not it becomes turned off
and won't have it. This has worked well as a compromise for us.

For contrast, qemu-sdk does build libsdl-sdk which does pull in an X
stack in Poky since its SDK must have graphical qemu.

Cheers,

Richard




