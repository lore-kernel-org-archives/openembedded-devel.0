Received: from [64.233.182.189] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1H4LPc-0007ij-1v
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Jan 2007 19:09:28 +0100
Received: by nf-out-0910.google.com with SMTP id l24so194530nfc
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jan 2007 10:07:42 -0800 (PST)
Received: by 10.49.8.1 with SMTP id l1mr482823nfi.1168366062630;
	Tue, 09 Jan 2007 10:07:42 -0800 (PST)
Received: from CUBE ( [82.193.96.238])
	by mx.google.com with ESMTP id o53sm1458458nfa.2007.01.09.10.07.41;
	Tue, 09 Jan 2007 10:07:42 -0800 (PST)
Date: Tue, 9 Jan 2007 20:07:55 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1583587988.20070109200755@gmail.com>
To: Marcin Juszkiewicz <openembedded@hrw.one.pl>, 
	"pHilipp Zabel" <philipp.zabel@gmail.com>
In-Reply-To: <200701081618.46665.openembedded@hrw.one.pl>
References: <200701081618.46665.openembedded@hrw.one.pl>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Status of ARM machines in OE
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
X-List-Received-Date: Tue, 09 Jan 2007 18:09:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Marcin,

Monday, January 8, 2007, 5:18:46 PM, you wrote:

> During weekend I build 'task-base' for all ARM (armv4t and better) 
> machines and Angstrom distribution.

  Thanks!

> The list included:

[]

> h1910 - kernel broken:
> arch/arm/mach-pxa/built-in.o: In function `h4000_set_led':
> dma_needs_bounce.c:(.text+0x1ca0): undefined reference to `ipaq_asic3_set_led'
> dma_needs_bounce.c:(.text+0x1cd0): undefined reference to `ipaq_asic3_set_led'
> dma_needs_bounce.c:(.text+0x1ce4): undefined reference to `ipaq_asic3_set_led'
> dma_needs_bounce.c:(.text+0x1d04): undefined reference to `ipaq_asic3_set_led'
> dma_needs_bounce.c:(.text+0x1d18): undefined reference to `ipaq_asic3_set_led'
> make: *** [.tmp_vmlinux1] Error 1

> Full log: 
> http://ewi546.ewi.utwente.nl/tinderbox/showlog.pl?machine_id=177&logfile=20070107150654.log

> =============================================================================

> htcblueangel - kernel broken is same place as h1910

> =============================================================================

> rx3000 - kernel broken is same place as h1910

  Well, all these 3 actually "no defconfig" cases, with some "default"
one being used, I'll take care of this. But htcblueangel and rx3000
are more complex, they are not supported by Angstrom formally, and
Angstrom's default linux-handhelds-2.6 version doesn't work for them,
they require much more recent versions. I'm going to add ?= version
spec to machine config, this way it will be fully overridable by
local.conf/distro.


> =============================================================================

> htcuniversal - kernel broken:

CONFIG_AUDIT is broken in latest versions, old defconfig... Will be
taken care of.

[]

> =============================================================================

> magician is OK - builds without problem. But as this is HTC Magician then
> maybe we should rename it to htcmagician to follow other htc phones
> (htcblueangel, htcuniversal) which are in OE?

  Philipp, please, please!!! ;-)))

  Generally, we should start to think about machine naming convention.
As an informal proposal, I would like to ask machine maintainers
considering adopting naming scheme where device name/model is
prepended with vendor or well-known brand ID. "htc*" devices are good
example of this.

  iPaqs also used to be, starting with well-known "h" prefix ;-). But
no longer, with series have expanded. So, they'd ideally be called
like "ipaq-hx4700", etc. Yes, that applies to Zaurus too ;-).

  So again, I don't think it's good time to set some rules right now,
but sooner or later OE will need them. So, it would be nice to start
exchanging ideas now, and one of them is above ;-).


> =============================================================================

> Maintainers of 'broken' machines - would be nice if you will try to fix
> those problems. I will try to do such builds in future.

  Such regression builds are very good thing. It would be nice if
there was some background info available about them - are they
automated and to what extent, how often they are run, etc. I
understand that at this time that info will be likely "this is test,
pilot run", but if you have some plans/ideas regarding that, please
share them.



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



