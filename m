Received: from p3plsmtpa01-05.prod.phx3.secureserver.net ([72.167.82.85])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1OByZd-0008Dd-Fg
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 01:09:14 +0200
Received: (qmail 4875 invoked from network); 11 May 2010 23:05:18 -0000
Received: from unknown (209.242.7.154)
	by p3plsmtpa01-05.prod.phx3.secureserver.net (72.167.82.85) with ESMTP;
	11 May 2010 23:05:18 -0000
Message-ID: <4BE9E2AB.5020106@mwester.net>
Date: Tue, 11 May 2010 18:05:15 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201005111904.06230.khimov@altell.ru>
In-Reply-To: <201005111904.06230.khimov@altell.ru>
X-SA-Exim-Connect-IP: 72.167.82.85
X-SA-Exim-Mail-From: mike@mwester.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] logrotate scripts policy
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
X-List-Received-Date: Tue, 11 May 2010 23:09:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Roman I Khimov wrote:
...
> This way all *-logrotate packages will get installed by default, but not the 
> logrotate program. So, it will eat some little space in /etc/logrotate.d for 
> everyone by default (but you can get rid of those packages if you really don't 
> want them), but would allow to switch rotation on/off easily with just one 
> package included or not in the image.

The NSLU2 has a grand total of 8MB of flash space for bootloader,
kernel, and the filesystem.  We don't have even a few KB left right now
for those extra packages.  Keep in mind that even a 20-byte script will
have a large footprint in the opkg database that's on the filesystem, so
that space is in addition.

It's really really difficult to build an image without a whole lot of
extraneous stuff in it, and I suspect that extraneous stuff is all in
there for the same reasoning, which goes along the lines of "It's only a
little bit of space..." -- but it all adds up, and when your total
rootfs can only be 5.5 MB or so...

I'm not going to NAK this, but I will ask that if you do this please
spend some time with the SlugOS image recipes to remove all the packages
that this adds by default, with whatever mechanism you meant when you
say "but you can get rid of those packages if you really don't want them".

-Mike (mwester)


