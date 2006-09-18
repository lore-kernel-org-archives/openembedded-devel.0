Received: from [64.233.166.177] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <pmiscml@gmail.com>) id 1GPRtl-0005E7-7t
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Sep 2006 00:47:33 +0200
Received: by py-out-1112.google.com with SMTP id i75so5112382pye
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2006 15:43:29 -0700 (PDT)
Received: by 10.35.109.2 with SMTP id l2mr24698788pym;
	Mon, 18 Sep 2006 15:43:29 -0700 (PDT)
Received: from CUBE ( [82.193.96.236])
	by mx.gmail.com with ESMTP id r1sm6504519nzd.2006.09.18.15.43.20;
	Mon, 18 Sep 2006 15:43:20 -0700 (PDT)
Date: Tue, 19 Sep 2006 01:43:15 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1228985494.20060919014315@gmail.com>
To: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
In-Reply-To: <1158615816.14182.13.camel@gandalf.tm.informatik.uni-frankfurt.de>
References: <1158615816.14182.13.camel@gandalf.tm.informatik.uni-frankfurt.de>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: kernel vs. binutils: .exit.text problem
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Sep 2006 22:47:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Michael,

Tuesday, September 19, 2006, 12:43:36 AM, you wrote:

> I'm building a 2.6.17.7 kernel for arm using gcc 4.1.1 and binutils
> 2.17:

> | make[1]: Leaving directory kernel-2.6.17.7 |   LD      .tmp_vmlinux1
> | `.exit.text' referenced in section `.init.text' of drivers/built-in.o:
> defined in discarded section `.exit.text' of drivers/built-in.o
> | make: *** [.tmp_vmlinux1] Error 1

> The same kernel is compiled fine (and runs, btw.) w/ binutils 2.15.94.1.

> I can't downgrade binutils because the older binutils don't compile
> other stuff w/ recent gcc's. binutils 2.16 even SIGSEGVs for some
> packages.

> Older binutils treated this as a warning, not an error. Do you have any
> idea how I could revert binutils 2.17 to this behaviour? Or
> alternatively, how can I find and fix the offending
> driver in the said kernel?

  That's kernel issue, upgrade to 2.6.18 (even rc) ;-) . On HH.org, we faced
this with pxa2xx_udc driver. Fix was already in mainline, so we just backported
patch:
http://kernel.org/git/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=a353678d3136306c1d00f0d2319de1dac8a6b1db
(actually applied as is).


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



