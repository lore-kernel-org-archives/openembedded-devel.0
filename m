Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1LtrNm-0003ZV-Or
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 00:45:50 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 92F3FDB15C2;
	Wed, 15 Apr 2009 00:41:46 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 6CBC7DB15B8;
	Wed, 15 Apr 2009 00:41:45 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225072070.adsl.alicedsl.de
	[92.225.72.70]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Wed, 15 Apr 2009 00:41:45 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 63E823C227; Wed, 15 Apr 2009 00:41:41 +0200 (CEST)
Date: Wed, 15 Apr 2009 00:41:41 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090414224141.GA6479@rhein.zuhause.netz>
References: <SNT105-W20AA5F2E8A600866EEDD6D907C0@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <SNT105-W20AA5F2E8A600866EEDD6D907C0@phx.gbl>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_40,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: uclibc build error
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
X-List-Received-Date: Tue, 14 Apr 2009 22:45:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 14, 2009 at 11:30:49PM +0300, Mauri Sandberg wrote:
> 
> There are two peculiarities when I am trying to build uclibc for DNS-323 using angstrom stable/2009.
> 
> For some reason OE chooses version 0.9.30 over 0.9.30.1. I had to specifically choose the latter.
> 
> Anyhow, both of these fail miserably with something that does not really tell me much.
> 
> <clip>
> NOTE: make STRIPTOOL=true LD=arm-angstrom-linux-uclibcgnueabi-ld LOCALE_DATA_FILENAME=uClibc-locale-030818.arm.tgz CC=ccache arm-angstrom-linux-uclibcgnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mthumb HOSTCFLAGS=-I/home/maukka/oe/dns323/build/tmp-dns323/staging/i686-linux/usr/include
>   GEN include/bits/sysnum.h
>   GEN include/bits/uClibc_config.h
>   LN include/pthread.h
> ...
>   CC ldso/ldso/ldso.oS
> ldso/ldso/dl-elf.c: In function '_dl_dprintf':
> ldso/ldso/dl-elf.c:913: error: unable to find a register to spill in class 'LO_REGS'
> ldso/ldso/dl-elf.c:913: error: this is the insn:
> (insn 121 120 122 6 (set (reg/f:SI 406)
>         (plus:SI (reg/f:SI 25 sfp)
>             (reg:SI 405))) 5 {*thumb_addsi3} (nil)
>     (expr_list:REG_DEAD (reg:SI 405)
>         (nil)))
> ldso/ldso/dl-elf.c:913: confused by earlier errors, bailing out
> make: *** [ldso/ldso/ldso.oS] Error 1
> FATAL: oe_runmake failed
> </clip>
> 
> Full log at http://tinderbox.openembedded.net/builds/138258/
> 
> -- Mauri

This is the error comes from building uclibc with thumb support. Khem started to fix it, but
it isnt fixed already yet. Try to use ARM_INSTRUCTION_SET = "arm" in the uclibc.inc for now.


Bye Henning


