Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JXgAD-0006PY-9B
	for Openembedded-devel@lists.openembedded.org;
	Fri, 07 Mar 2008 18:15:27 +0100
X-ASG-Debug-ID: 1204910022-447801300000-3ce4Sv
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 8D7D31043B
	for <Openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2008 11:13:45 -0600 (CST)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id Ypjt3CkuKY660o6u for
	<Openembedded-devel@lists.openembedded.org>;
	Fri, 07 Mar 2008 11:13:45 -0600 (CST)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: Openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: AVR32 init segfault: Any resolution?
Date: Fri, 7 Mar 2008 11:13:40 -0600
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200803071113.40387.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1204910025
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
X-SA-Exim-Connect-IP: 209.253.16.26
X-SA-Exim-Mail-From: geoffrey@pager.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: AVR32 init segfault: Any resolution?
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
X-List-Received-Date: Fri, 07 Mar 2008 17:15:28 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

With Richard's help on the toolchain and a patch to the 
conf/machine/at32stk1000.conf (submitted via Bugzilla), I can now boot the 
kernel on my AVR32 based AT32STK1000.

However, init segfaults.  Here's the last boot of the boot activity before the 
segfault:

Waiting 1sec before mounting root device...
mmc0: new SD card at address b368
mmcblk0: mmc0:b368 5     249856KiB
 mmcblk0: p1
VFS: Mounted root (ext2 filesystem).
Freeing init memory: 64K (90000000 - 90010000)
init[1]: segfault at 00000008 pc 2aaabbe8 sp 7ffd0f20 ecr 24
init has generated signal 11 but has no handler for it
Kernel panic - not syncing: Attempted to kill init!


Alex reported the same bug about a month ago to this mailing list.  I haven't 
seen any resolution to it, though.  Is there a resolution to this bug yet?


Thanks,
---
Geoffrey


