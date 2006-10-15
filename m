Received: from [64.233.182.185] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <pmiscml@gmail.com>) id 1GZEAK-0006k0-J4
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Oct 2006 00:09:04 +0200
Received: by nf-out-0910.google.com with SMTP id l23so2264472nfc
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Oct 2006 15:02:22 -0700 (PDT)
Received: by 10.48.254.10 with SMTP id b10mr11032933nfi;
	Sun, 15 Oct 2006 15:02:21 -0700 (PDT)
Received: from CUBE ( [85.202.124.214])
	by mx.google.com with ESMTP id i1sm1839982nfe.2006.10.15.15.02.20;
	Sun, 15 Oct 2006 15:02:20 -0700 (PDT)
Date: Mon, 16 Oct 2006 01:02:22 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <161534574.20061016010222@gmail.com>
To: Marcin Juszkiewicz <openembedded@hrw.one.pl>
In-Reply-To: <200610151544.28474.openembedded@hrw.one.pl>
References: <1156715171.5536.60.camel@localhost.localdomain>
	<200610151544.28474.openembedded@hrw.one.pl>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: What is task-base?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Oct 2006 22:09:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Marcin,

Sunday, October 15, 2006, 4:44:27 PM, you wrote:

> Today I added few sections into org.openembedded.documentation repository.
> One of them was about task-base and is available here:

> http://www.openembedded.org/user-manual&dpage=ch04s04

> I also wrote on my blog some stuff about it:

> http://www.hrw.one.pl/2006/10/15/openembedded-documentation-day/


-----------
> TARGET_ARCH = "i686"
> IPKG_EXTRA_ARCHS = "x86 i386 i486 i586"
> 
> PREFERRED_PROVIDER_virtual/kernel = "linux-x86"
> 
> MACHINE_FEATURES = "kernel26 pci alsa usbhost"
> 
> require conf/machine/include/tune-athlonmp.conf
----------

   If it can be made so clean, why do we have so tangled configs for
many machines, at least for PocketPC-based? Do we need more strict
policy of what goes into machine configs and about the order of
variables? For example, I doubt it's good idea to have IMAGE_FSTYPES
in machine configs - how that can be machine's property? It's just
adhoc preference of conf author, which hardly will work for someone
another, so really should be set in local.conf.

   Also, it's good idea to group by some logical sections, for example,
machine properties rooted in hardware vs package selectors
(PREFERRED_PROVIDERs, etc) vs module autoload specification vs
something else.



> Have a nice reading.




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



