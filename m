Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Kwb6e-0003v3-HN
	for openembedded-devel@openembedded.org; Sun, 02 Nov 2008 12:26:56 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Kwb5P-0008JQ-4k
	for openembedded-devel@openembedded.org; Sun, 02 Nov 2008 11:25:39 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 02 Nov 2008 11:25:39 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 02 Nov 2008 11:25:39 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 02 Nov 2008 12:25:31 +0100
Message-ID: <gek2nb$gjo$1@ger.gmane.org>
References: <20081031110045.7EF89189333@amethyst.openembedded.net>	<20081031233753.43f5f09d.raster@rasterman.com>	<gef9q7$o65$1@ger.gmane.org>	<20081101085334.8afcd730.raster@rasterman.com>	<geh3kt$bp7$1@ger.gmane.org>
	<1225539496.4090.6.camel@utx.utx.cz>	<20081102100819.ebdb2ce9.raster@rasterman.com>
	<1225623174.3749.24.camel@utx.utx.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081025 Shredder/3.0b1pre
In-Reply-To: <1225623174.3749.24.camel@utx.utx.cz>
Sender: news <news@ger.gmane.org>
Subject: Running one-off target binaries, was: Re: [oe-commits] Koen Kooi : initscripts: only run ldconfig on boot when ld.so. conf is present
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
X-List-Received-Date: Sun, 02 Nov 2008 11:26:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02-11-2008 11:52, Stanislav Brabec wrote:

> Being inspired by DejaGnu, I can also imagine a native host as an
> alternative solution for platforms without qemu support.
>
> - Build (minimal) environment not needing any native run and being able
>    to run on target.
> - Mount a target root as a chroot on native host via a NFS.
> - Using a ssh and chroot command, execute required code and get result
>    back.
>
> ﻿(Well, it would complicate life to Koen a bit.)
>
> It could perform any task﻿ not possible on build system:
> - run ldconfig
> - generate locales (may need swap on native host)
> - compile emacs macros
> ...

We do have sbrsh (from scratchbox fame) in OE, so one could write a 
class reusing scratchbox code to run such binaries on a network-attached 
target. Any volunteers for doing a proof-of-concept bbclass?

regards,

Koen



