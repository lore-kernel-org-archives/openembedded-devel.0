Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JZWzn-0004Qc-9M
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 20:52:21 +0100
X-ASG-Debug-ID: 1205351407-552800190000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 0B4F21D6D7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 14:50:07 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id xbCAcNy0NQ9JTf3g for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 14:50:07 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Eureka!  AVR32 ld-uClibc.so segfault solved
Date: Wed, 12 Mar 2008 14:50:09 -0500
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200803121450.09688.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1205351408
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
X-SA-Exim-Connect-IP: 209.253.16.26
X-SA-Exim-Mail-From: geoffrey@pager.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Eureka! AVR32 ld-uClibc.so segfault solved
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
X-List-Received-Date: Wed, 12 Mar 2008 19:52:21 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

I just tracked down the culprit for my AVR32 system always segfaulting 
whenever ld-uClibc.so ran (usually as soon as the kernel attempted to run the 
init process).

Turns out that while most of uClibc is not particularly sensitive to the 
CFLAGS, ld-uClibc.so is extremely sensitive.  The uclibc.inc file was doing 
some things that screwed up the CFLAGS being used to compile ld-uClibc.so.

Here's the diff that made it all work:
--- uclibc.inc  7 Mar 2008 21:50:53 -0000       1.3
+++ uclibc.inc  12 Mar 2008 20:35:44 -0000
@@ -70,7 +70,7 @@

 # do_stage barfs on a CC with whitepspace, therefore put the 'HOST_CC_ARCH' 
in
 # the CFLAGS (for when building the utils).
-OEMAKE_NO_CC= "'OPTIMIZATION=' 'CPU_CFLAGS=${CFLAGS}' 'STRIPTOOL=true' 'LD=${LD}'\
+OEMAKE_NO_CC = "'STRIPTOOL=true' 'LD=${LD}' \
                'LOCALE_DATA_FILENAME=${UCLIBC_LOCALE_FILE}'"
 EXTRA_OEMAKE = "${OEMAKE_NO_CC} 'CC=${CC}'"
 EXTRA_OEMAKE_task_do_populate_staging = "${OEMAKE_NO_CC}"


Now, I'm not sure what consequences this has to the overall system and other 
platforms.  I'm not exactly sure why you'd always want to wipe out the 
OPTIMIZATION and CPU_CFLAGS that the uClibc Rules.mak sets up, either.  
Comments on these points?


So I now have a working OE based AVR32 build system, using binutils 
2.17.atmel.0.0.99 20060623, gcc 4.2.1-atmel.1.0.3, and uClibc 0.9.29-atmel.1.  
This is essentially the same as Atmel's buildroot-avr32-v2.1.0.  As soon as I 
clean stuff up a little, I'll submit patches for this via bugzilla.  Minus 
this uclibc.inc diff.  I need more expert opinion on this.

Thanks to all those who helped!
---
Geoffrey


