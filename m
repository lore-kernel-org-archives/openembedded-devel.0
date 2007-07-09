Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dp@xora.org.uk>) id 1I7tE0-0000eZ-1S
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2007 15:24:24 +0200
Received: from xora.org.uk ([::ffff:87.246.78.27])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,128bits,AES128-SHA)
	by xora.org.uk with esmtp; Mon, 09 Jul 2007 14:18:47 +0100
	id 00030909.469235B8.00005249
Date: Mon, 9 Jul 2007 14:17:44 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070709131744.GC2336@p3n3tr4t0r.internal>
References: <513012886.20070708041151@gmail.com> <f6q30v$s2$1@sea.gmane.org>
	<128309124.20070709154303@gmail.com>
Mime-Version: 1.0
In-Reply-To: <128309124.20070709154303@gmail.com>
User-Agent: Mutt/1.5.15 (2007-04-06)
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
X-List-Received-Date: Mon, 09 Jul 2007 13:24:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jul 09, 2007 at 03:43:03PM +0300, Paul Sokolovsky wrote:
>   As was pointed out, interpretation of those vars should depend on
> presence of "screen" in machine features. And yes, then we need to set
> their bitbake.conf default to 0, so only screen'ed machines specify
> them.
> 
>   Also a note of exact semantics of those vars - they provide *some
> default* screen resolution and orientation. Actually not some, but the
> most appropriate after-install default. So, in particular,
> notebook-style keyboarded devices would have:
> 
> MACHINE_DISPLAY_WIDTH_PIXELS=640
> MACHINE_DISPLAY_HEIGHT_PIXELS=480
> 
> A device with vertical PDA layout would have
> 
> MACHINE_DISPLAY_WIDTH_PIXELS=480
> MACHINE_DISPLAY_HEIGHT_PIXELS=640
> 

The problem with this interpretation is that although spitz boots and looks
like it is 640x480 it is in fact 480x640 with rotation. So it may just
be a mistake in your example that spitz happens to show up. Or it may be
something that has not been considered.

Graeme



