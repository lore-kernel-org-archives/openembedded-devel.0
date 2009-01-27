Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1LRsGe-0000iH-D6
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jan 2009 19:02:32 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id BD18C6280CA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2009 18:54:59 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1233047621.4890.119.camel@lenovo.internal.reciva.com>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF5FB@hiob.intern.dresearch.de>
	<497ECDCA.3000302@gmail.com>
	<1233047621.4890.119.camel@lenovo.internal.reciva.com>
Date: Tue, 27 Jan 2009 18:54:59 +0100
Message-Id: <1233078899.4746.16.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1.1 
Subject: Re: AVR XMEGA?
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
X-List-Received-Date: Tue, 27 Jan 2009 18:02:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> On Tue, 2009-01-27 at 10:03 +0100, Marco Cavallini wrote:
> > Sledz, Steffen ha scritto:
> > > Just a short question: Is somebody working on support for Atmel AVR XMEGA (8-bit AVR) architecture in OE?

> > Linux doesn't run on 8 bit CPUs

> As far as I know nobody is working on XMEGA support, anyway.

There is a rudimentary avr-gcc build.

I am thinking about creating of native and Canadian cross recipes for
avr utilities to be able to compile and upload Arduino sources from my
Zaurus.

Support for shared libraries, OS, command line and package management is
far above capabilities of these devices. But I can imagine recipes for
static libraries (e. g. avr-libc; however most standard libraries would
be too heavy for AVR) and just one application package that will become
an "image" (= firmware), linking against these static libraries. Maybe
OE is an overkill for this task. Make could do the same with a smaller
complexity, but on the other hand, at least avr-libc (and the Arduino
library) has to be build in this way.

And finally, it might be interesting to invent a way, how to convert
linux kernel drivers to microcontroller drivers and vice versa. I have
been just thinking about porting of drivers/w1.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx



