Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JZDHQ-0008I2-JR
	for Openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 23:49:13 +0100
X-ASG-Debug-ID: 1205275616-77b3000a0000-3ce4Sv
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 9AA651656E
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2008 17:46:57 -0500 (CDT)
Received: from [192.168.1.71] (LRS-CiscoRouter [192.168.1.1]) by
	barracuda.pager.net with ESMTP id cnZHbl7yDlHWZre1 for
	<Openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2008 17:46:57 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: Openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Stuck with AVR32 segfaults in init
Date: Tue, 11 Mar 2008 17:46:58 -0500
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200803111746.59194.geoffrey@pager.net>
X-Barracuda-Connect: LRS-CiscoRouter[192.168.1.1]
X-Barracuda-Start-Time: 1205275617
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
X-SA-Exim-Connect-IP: 209.253.16.26
X-SA-Exim-Mail-From: geoffrey@pager.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Stuck with AVR32 segfaults in init
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
X-List-Received-Date: Tue, 11 Mar 2008 22:49:13 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

I can't seem to get past a problem with init segfaulting at boot time on my 
AVR32 board.  Here's the error I get:

Freeing init memory: 64K (90000000 - 90010000)
init[1]: segfault at 00000008 pc 2aaabc84 sp 7fec2f30 ecr 24
init has generated signal 11 but has no handler for it
Kernel panic - not syncing: Attempted to kill init!


I started out using the toolchain already in OE.  This was:
binutils 2.17.atmel.0.0.99 20060623
gcc 4.1.2-atmel.1.1.0
uClibc 0.9.28-avr32-20061019 (or somesuch)

It was suggested I move up to uClibc 0.9.29, so I got that working quickly.  
No dice.  Exact same error.

I tried passing init=/bin/sh, and that segfaulted with almost exactly the same 
error message, so it seems to be a more general problem than with sysvinit.


Now, Atmel's buildroot for the AVR32 version 2.1.0 can build a fully bootable 
image (with a little prodding).  It uses:
binutils 2.17.atmel.0.0.99 20060623
gcc 4.2.1-atmel.1.0.3
uClibc 0.9.29-atmel.1 (or somesuch)


So I hacked around a little bit, and got OE setup with:
binutils 2.17.atmel.0.0.99 20060623
gcc 4.2.1-atmel.1.0.3
uClibc 0.9.29-atmel.1

That ought to work the same.  No, same exact error.  Comparing the source code 
of the tool chains, binutils and uClibc are the same, but gcc is only ALMOST 
the same.  I don't think the differences I found impact this problem, but 
here they are:

--- gcc-4.2.1/gcc/config/avr32/avr32.c	2007-10-16 03:21:32.000000000 -0500
+++ /home/geoff/src/buildroot-avr32-v2.1.0/toolchain_build_avr32_nofpu/gcc-4.2.1/gcc/config/avr32/avr32.c	
2008-02-25 09:09:42.000000000 -0600
@@ -705,8 +705,8 @@
       {
         if (avr32_const_ok_for_constraint_p (mi_delta, 'I', "Is21"))
           {
-            fprintf (file, "\tsub\t%s, -0x%x\n", reg_names[this_regno],
-                mi_delta);
+            fprintf (file, "\tsub\t%s, %d\n", reg_names[this_regno],
+                -mi_delta);
           }
         else
           {

--- gcc-4.2.1/gcc/config/avr32/linux-elf.h	2007-10-01 08:43:09.000000000 -0500
+++ /home/geoff/src/buildroot-avr32-v2.1.0/toolchain_build_avr32_nofpu/gcc-4.2.1/gcc/config/avr32/linux-elf.h	
2008-02-25 09:09:42.000000000 -0600
@@ -68,7 +68,7 @@
   "%{!shared:crtend.o%s} %{shared:crtendS.o%s} crtn.o%s"
 
 #undef ASM_SPEC
-#define ASM_SPEC "%{!mno-pic:%{!fno-pic:--pic}} %{mrelax|O*:%{mno-relax|O0|
O1: ;:--linkrelax}} %{mcpu=*:-mcpu=%*}"
+#define ASM_SPEC "%{!mno-pic:--pic} %{mrelax|O*:%{mno-relax|O0|
O1: ;:--linkrelax}} %{mcpu=*:-mcpu=%*}"
  
 #undef  LINK_SPEC
 #define LINK_SPEC "%{version:-v} \


Since both sysvinit and busybox both segfault with about the same error, I'm 
thinking it might be related to runtime linking.  I tried configuring uClibc 
to with SUPPORT_LD_DEBUG and SUPPORT_LD_DEBUG_EARLY, and then passing 
LD_DEBUG=all on the kernel command line to get it to the init environment.  
Nothing was printed out, so either I didn't do the LD debug properly, or 
something is really wrong.

I've never had an issue building a kernel that boots, but I haven't been able 
to get past whatever the init process is segfaulting.

Does anyone have an ideas?

Thanks,
---
Geoffrey





