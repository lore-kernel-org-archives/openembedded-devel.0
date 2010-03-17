Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NrmqC-0007dk-Ul
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 07:34:56 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id E0223D39E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Mar 2010 07:31:49 +0100 (CET)
X-SENDER-IP: [83.227.59.242]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AmgWALcUoEtT4zvyPGdsb2JhbAAHmwcBAQEBN7dHhHYEhhk
X-IronPort-AV: E=Sophos;i="4.49,655,1262559600"; d="scan'208";a="51579280"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.224]) ([83.227.59.242])
	by ipb2.telenor.se with ESMTP; 17 Mar 2010 07:31:49 +0100
Message-ID: <4BA07754.9070909@atmel.com>
Date: Wed, 17 Mar 2010 07:31:48 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1268773130-4625-1-git-send-email-ulf.samuelsson@atmel.com>	<1268786621.20395.4.camel@trini-m4400>
	<201003170303.49144.holger+oe@freyther.de>
In-Reply-To: <201003170303.49144.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 62.127.194.20
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/1] libstdc++.bb: copy libstdc++.so* to rootfs
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
X-List-Received-Date: Wed, 17 Mar 2010 06:34:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther skrev:
> On Wednesday 17 March 2010 01:43:41 Tom Rini wrote:
> 
>> Checking in a non-external-toolchain based build I have around, I see
>> staging/<target>/usr/lib/libstdc++.so / libstc++.so.6 which point at
>> libstdc++.so.6.0.10, which exists.  Can you explain how you're getting a
>> lack of libstdc++?  Thanks.

I can also see this in the target but it is needed also during the build
of gnome-mplayer, or that will fail.

> 
> I assume he is using gcc to link and some external lib linked C++ symbols into 
> the global scope... This was a bug in some versions of gcc and we solved it in 
> WebKit/GTK+ by having a linker script and excluding everything _Z*.
> 
> So I would nack this change and instead figure out which C library is exposing 
> C++ symbols.
> 

When building gnome-mplayer, it complains that "libmusicbrainz"
needs the symbols from libstdc++.so.6.


> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Best Regards
Ulf Samuelsson



