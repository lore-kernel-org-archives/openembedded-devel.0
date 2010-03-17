Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Nrifa-0002h3-Ht
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 03:07:39 +0100
Received: from tamarin.localnet (123-192-181-204.dynamic.kbronet.com.tw
	[123.192.181.204])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 1222A1B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Mar 2010 02:07:45 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Mar 2010 03:03:48 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc8; KDE/4.4.1; i686; ; )
References: <1268773130-4625-1-git-send-email-ulf.samuelsson@atmel.com>
	<1268786621.20395.4.camel@trini-m4400>
In-Reply-To: <1268786621.20395.4.camel@trini-m4400>
MIME-Version: 1.0
Message-Id: <201003170303.49144.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
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
X-List-Received-Date: Wed, 17 Mar 2010 02:07:39 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 17 March 2010 01:43:41 Tom Rini wrote:

> Checking in a non-external-toolchain based build I have around, I see
> staging/<target>/usr/lib/libstdc++.so / libstc++.so.6 which point at
> libstdc++.so.6.0.10, which exists.  Can you explain how you're getting a
> lack of libstdc++?  Thanks.

I assume he is using gcc to link and some external lib linked C++ symbols into 
the global scope... This was a bug in some versions of gcc and we solved it in 
WebKit/GTK+ by having a linker script and excluding everything _Z*.

So I would nack this change and instead figure out which C library is exposing 
C++ symbols.



