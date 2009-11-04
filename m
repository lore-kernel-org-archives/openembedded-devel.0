Received: from [87.193.137.100] (helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1N5xUM-00089x-7D
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 09:14:41 +0100
Received: from hiob.intern.dresearch.de (unknown [10.32.0.138])
	by mail.dresearch.de (Postfix) with ESMTP id 5A7A44912AB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2009 09:13:26 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 4 Nov 2009 17:06:41 +0100
Message-ID: <4AF1A5E2.3020002@dresearch.de>
Date: Wed, 04 Nov 2009 17:03:46 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 04 Nov 2009 16:06:41.0109 (UTC)
	FILETIME=[CBD36050:01CA5D68]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: qemu again :(
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
X-List-Received-Date: Thu, 05 Nov 2009 08:14:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Yesterday i tried to use OE at my new notebook for the first time. But
i hit a qemu problem again:

# bitbake emacs (clean build)

ERROR: function do_compile failed
ERROR: log data follows
(/home/sledz/work/HydraIP/OE/tmp.4/work/armv5te-angstrom-linux-gnueabi/emacs-22.3-r1/temp/log.do_compile.8552)
| NOTE: make -j 8 QEMU=qemu-arm  -s 1048576 -L
/home/sledz/work/HydraIP/OE/tmp.4/work/armv5te-angstrom-linux-gnueabi/emacs-22.3-r1/qemu-treedir
...
| mmap: Permission denied
| make[1]: *** [test-distrib] Error 255

All solutions for this problem i found see the cause in a wrong
setting of mmap_min_addr (see e.g.
<http://www.bugcommunity.com/wiki/index.php/Kernel_and_Rootfs_Build_System#Potential_Problems_.26_Their_Solutions:>).

But this setting is correct at my notebook:

# cat /proc/sys/vm/mmap_min_addr
0

Hmmmm? What else could be the cause for this error?

Steffen




