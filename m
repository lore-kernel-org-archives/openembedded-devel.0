Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1Mj8yM-0008Aa-2T
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Sep 2009 11:51:18 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Mj8g7-0003oA-0m
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Sep 2009 10:32:27 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1Mj8g6-0001Jp-UD
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Sep 2009 10:32:26 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090903043630.GQ23034@smtp.west.cox.net>
References: <1251620948.4215.673.camel@lenovo.internal.reciva.com>
	<20090830094809.GB26823@gmail.com>
	<200908311333.20189.marcin@juszkiewicz.com.pl>
	<20090901055731.GA22534@gmail.com>
	<57768.87.139.24.177.1251793302.squirrel@home.opfer.tk>
	<20090901153102.GA12420@gmail.com> <20090901230722.GA25864@gmail.com>
	<20090902192044.GA18621@gmail.com>
	<1251923389.4490.20.camel@lenovo.internal.reciva.com>
	<19c1b8a90909021407k5610f615q41c7d13bc3b38ff0@mail.gmail.com>
	<20090903043630.GQ23034@smtp.west.cox.net>
Date: Thu, 03 Sep 2009 10:32:22 +0100
Message-Id: <1251970342.27780.192.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS?= linux-gnuspe for e500
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
X-List-Received-Date: Thu, 03 Sep 2009 09:51:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-09-02 at 21:36 -0700, Tom Rini wrote:
> Can we get away with that?  'linux-gnu' over 'linux' should be fine I
> think but I'm worried about 'linux-uclibceabi', is that really a normal
> standard and known host?  Also, there's some overrides that depend on
> 'uclibcgnueabi' iirc, which need to be updated for libc-uclibc override
> instead.

I think Khem's patch does update most/all of the overrides in question,
but if this requires an OELAYOUT_ABI change then it seems like a lot of
disruption to fix what is (if I understand correctly) only a cosmetic
problem in the first place.

p.




