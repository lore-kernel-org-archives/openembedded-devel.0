Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JWzdk-0006LY-27
	for Openembedded-devel@lists.openembedded.org;
	Wed, 05 Mar 2008 20:51:05 +0100
X-ASG-Debug-ID: 1204746575-6cc7009c0000-3ce4Sv
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id C1BEB8EA21
	for <Openembedded-devel@lists.openembedded.org>;
	Wed,  5 Mar 2008 13:49:35 -0600 (CST)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id ds2Hdv7grzVHOkX5 for
	<Openembedded-devel@lists.openembedded.org>;
	Wed, 05 Mar 2008 13:49:35 -0600 (CST)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: Openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: AVR32 + OpenEmbedded: Problems with uclibc-initial
	do_populate_staging()
Date: Wed, 5 Mar 2008 13:49:39 -0600
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200803051349.39583.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1204746575
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
X-SA-Exim-Connect-IP: 209.253.16.26
X-SA-Exim-Mail-From: geoffrey@pager.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: AVR32 + OpenEmbedded: Problems with uclibc-initial do_populate_staging()
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
X-List-Received-Date: Wed, 05 Mar 2008 19:51:06 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

I'm working on getting OpenEmbeddded to build for an AVR32 system.  Right now 
I'm using an AT32STK1000, although eventually I'll be running on custom 
hardware.

I've been having problems getting past the uclibc-initial (0.9.28).  I get an 
error when it attempts do_populate_staging().  Here's the error I've been 
getting.

--begin--
NOTE: package uclibc-initial-0.9.28-r10: task do_populate_staging: started
ERROR: function do_stage failed
ERROR: log data follows 
(/home/geoff/lrs/playpaq/tmp/work/avr32-angstrom-linux-uclibc/uclibc-initial-0.9.28-r10/temp/log.do_stage.17824)
| make: avr32-angstrom-linux-uclibc-gcc: Command not found
| make: avr32-angstrom-linux-uclibc-gcc: Command not found
| 
+ ./extra/scripts/fix_includes.sh -k /home/geoff/lrs/playpaq/tmp/cross/avr32-angstrom-linux-uclibc -t 
avr32
|
|
| The 
file /home/geoff/lrs/playpaq/tmp/cross/avr32-angstrom-linux-uclibc/Makefile 
or /home/geoff/lrs/playpaq/tmp/cross/avr32-angstrom-linux-uclibc/include/linux/version.h 
is missing!
| Perhaps your kernel source is broken?
|
|
| make: *** [headers] Error 1
NOTE: Task 
failed: /home/geoff/lrs/playpaq/tmp/work/avr32-angstrom-linux-uclibc/uclibc-initial-0.9.28-r10/temp/log.do_stage.17824
NOTE: package uclibc-initial-0.9.28-r10: task do_populate_staging: failed
ERROR: TaskFailed event exception, aborting
NOTE: package uclibc-initial-0.9.28: failed
--end--


I was able to get past this by modifying uclibc_0.9.28.bb so that 
KERNEL_SOURCE is now getting to what I think is correct.  It was:
KERNEL_SOURCE = "${CROSS_DIR}/${TARGET_SYS}"
and I changed it to:
KERNEL_SOURCE = "${STAGING_DIR_HOST}/${exec_prefix}"

It also looks like I could have re-enabled the nokernelheader.patch.  Any 
comments on what the "proper" fix is here?


With that change made, the do_populate_staging went further, but not much 
further.  In uclibc-initial_0.9.28.bb, there is the following command:
	make PREFIX= DEVEL_PREFIX=${UCLIBC_PREFIX}/ \
		RUNTIME_PREFIX=${UCLIBC_PREFIX}/ \
		pregen install_dev

UCLIBC_PREFIX used to be defined in uclibc.inc, but that was changed about a 
week ago.  Changing uclibc-initial_0.9.28.bb to use UCLIBC_STAGING_PREFIX 
instead of UCLIBC_PREFIX got me past this issue.  Any comments about 
the "correct" fix here?

Thanks,
---
Geoffrey



