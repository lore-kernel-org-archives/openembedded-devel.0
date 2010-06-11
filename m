Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1ON3to-0001Z6-4H
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jun 2010 15:03:56 +0200
Received: from [62.7.80.98] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>)
	id 1ON3pJ-0005Et-Fw; Fri, 11 Jun 2010 13:59:13 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>)
	id 1ON3pJ-0004jU-6k; Fri, 11 Jun 2010 13:59:13 +0100
From: Phil Blundell <philb@gnu.org>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
In-Reply-To: <20100610212029.GX14941@mx.loc>
References: <1276114963.4424.42.camel@lenovo.internal.reciva.com>
	<1276199208-31929-2-git-send-email-rep.dot.nop@gmail.com>
	<AANLkTin367SqiCodgs_CxGiwAihL-SI0nlCJKUWqUZjq@mail.gmail.com>
	<1276201371.13179.20.camel@lenovo.internal.reciva.com>
	<AANLkTinAFdiBJ6jN3WwY75KsNwTPmkyoOL0iTgJ8UPFC@mail.gmail.com>
	<20100610205040.GW14941@mx.loc>
	<1276203991.13179.33.camel@lenovo.internal.reciva.com>
	<20100610212029.GX14941@mx.loc>
Date: Fri, 11 Jun 2010 13:59:12 +0100
Message-ID: <1276261152.31317.193.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-Broken-Reverse-DNS: no host name found for IP address 62.7.80.98
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] busybox: configure according to {MACHINE, DISTRO}_FEATURES
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
X-List-Received-Date: Fri, 11 Jun 2010 13:03:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-06-10 at 23:20 +0200, Bernhard Reutner-Fischer wrote:
> If the machine does not provide a choice to use or not use the MMU then
> it makes no sense to take that into account for the package arch (think
> bfin or i586 or certain coldfires/m68k), yes. If, OTOH, a machine
> supports it (let's say ppc) then there must at least be a nice way to
> distinguish ppc<endian><mmu><floatingpoint> i would have hoped.

Endianness and FPU are clearly both part of the general ABI: virtually
every package which contains compiled code is going to have a dependency
on those two settings.  So, for DISTROs which support multiple values
for either of those options, I would expect them to simply be encoded
into the default PACKAGE_ARCH (either directly or via TARGET_ARCH); this
is indeed what's already done with bi-endian ARM for example.  For
DISTROs which only support one or the other, there's no need to draw the
distinction.

MMU is perhaps a little more complicated since, at least in theory, one
could imagine a DISTRO which supported both MMU-equipped and non-MMU
hardware and where the majority of binaries were capable of running on
both targets.  So in that case there might be a legitimate argument for
making it be a per-package setting in order to get parallel builds of
those packages that do actually care.  But I think the time to worry
about that would be when the situation does actually arise in practice.

p.




