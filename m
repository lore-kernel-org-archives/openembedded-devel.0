Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NjrMi-0001f6-4S
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 10:47:43 +0100
Received: from tamarin.localnet (siminn-int-gw.on-waves.com [157.157.59.158])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id E7F3F1B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 09:46:18 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2010 23:50:39 +0100
User-Agent: KMail/1.13.0 (Linux/2.6.33-rc8; KDE/4.4.0; i686; ; )
References: <mailman.3892.1266855314.14961.openembedded-devel@lists.openembedded.org>
	<4B82D6E0.7030005@tycoelectronics.com>
In-Reply-To: <4B82D6E0.7030005@tycoelectronics.com>
MIME-Version: 1.0
Message-Id: <201002222350.39544.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Build GCC QA Issue: with objc: No GNU_HASH in the elf binary: '/home/oe/build/tmp/work/i686-angstrom-linux/gcc-4.3.3-r10.1/packages-split/objc/usr/lib/libobjc.so.2.0.0'
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
X-List-Received-Date: Tue, 23 Feb 2010 09:47:43 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 22 February 2010 20:11:28 Jay Snyder wrote:

> Is there any way to configure OE to ingore the QA stuff?     The
> GNU_HASH is not required for a working executable is it?


The most easy way to turn it off is to not build with GNU HASH style, This can 
be made by not using "--hash-style=SOMETHING" in the LDFLAGS.

The GNU HASH is not a security mechanism but a dynamic linker optimization to 
be able to resolve symbols faster.

It was added later as the feature is not that old. Everything I do build is 
building fine, so in case you see an "awful" lot of breakage it would be nice 
if you could clarify this.

z.


