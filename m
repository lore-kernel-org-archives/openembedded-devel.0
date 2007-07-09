Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dp@xora.org.uk>) id 1I7twR-0001tm-1Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2007 16:10:24 +0200
Received: from xora.org.uk ([::ffff:87.246.78.27])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,128bits,AES128-SHA)
	by xora.org.uk with esmtp; Mon, 09 Jul 2007 15:04:41 +0100
	id 00030909.46924079.00005351
Date: Mon, 9 Jul 2007 15:03:38 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: "Dr. Michael Lauer" <mickey@vanille-media.de>
Message-ID: <20070709140338.GE2336@p3n3tr4t0r.internal>
References: <513012886.20070708041151@gmail.com> <f6q30v$s2$1@sea.gmane.org>
	<128309124.20070709154303@gmail.com>
	<20070709131744.GC2336@p3n3tr4t0r.internal>
	<1005211919.20070709153513@vanille-media.de>
	<20070709134256.GD2336@p3n3tr4t0r.internal>
	<13810026301.20070709155245@vanille-media.de>
Mime-Version: 1.0
In-Reply-To: <13810026301.20070709155245@vanille-media.de>
User-Agent: Mutt/1.5.15 (2007-04-06)
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
X-List-Received-Date: Mon, 09 Jul 2007 14:10:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jul 09, 2007 at 03:52:45PM +0200, Dr. Michael Lauer wrote:
> Heh, it's not just Opie. Eventually we may want to ship prerendered png's for
> UI elements. We better know about the size and dpi of the displays to
> get sane defaults. There's a whole lot of packages which could use the
> MACHINE namespace to improve targetting the platforms specifics at
> build time.
> 
I just worry what happens to machines without screens but that can have
gfx cards added. By the current level of thought behind these variables
a divide by zero is inevitable.

It also triggers my gut feeling of "this is the wrong way to crack the nut"

> What makes you worry so much about adding more (imho necessary)
> information to the MACHINE_ capability namespace?
> 
Nothing, but these variables seem little thought out and seem to be being
rushed into use for one use case (opie backgrounds).

And if it is neccessary then it should be the "correct" information, like
for spitz the screen is 480x640 by default. Deal with it in packages that
wish to use rotation correctly. Not just this value makes it easy for my
magic background generator.

Maybe a MACHINE_DEFAULT_ROTATION is also needed.

Graeme



