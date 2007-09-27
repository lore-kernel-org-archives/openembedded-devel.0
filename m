Received: from [81.187.81.52] (helo=smtp.aaisp.net.uk)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rdunlop@guralp.com>) id 1IawB8-0004CP-FN
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Sep 2007 18:25:30 +0200
Received: from home.pinkhut.co.uk ([81.187.28.34] helo=neddie.private.net)
	by smtp.aaisp.net.uk with esmtp (Exim 4.62)
	(envelope-from <rdunlop@guralp.com>) id 1Iaw6e-00042m-NG
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Sep 2007 17:20:52 +0100
Received: by neddie.private.net (Postfix, from userid 1000)
	id 4DF01C3B3F; Thu, 27 Sep 2007 17:20:40 +0100 (BST)
Date: Thu, 27 Sep 2007 17:20:40 +0100
From: Bob Dunlop <rdunlop@guralp.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070927162040.GA25054@guralp.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: arm kexec commandline support
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
X-List-Received-Date: Thu, 27 Sep 2007 16:25:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hans Henry von Tresckow wrote:
>On 6/7/07, Thomas Kunze <thommycheck at gmx.de> wrote:
...
>> I have written a quick hack to support custom commandlines for arm with
>> kexec. You need:
>>
>>
>> http://www2.informatik.hu-berlin.de/~tkunze/zaurus/patches/kexec_commandline-3.patch
>>
>> and:
>>
>>
>> http://www2.informatik.hu-berlin.de/~tkunze/zaurus/patches/atag_support.patch
>>
>> (from lak)
...
>
>I  tested this  with linux-rp-2.6.20 on poodle. The kernel will boot and I
>can kexec other kernels with built in cmdlines. If I try to set a new
>cmdline however, it segfaults. Here is the crash dump:
>
><0>Starting new kernel
><1>Unable to handle kernel paging request at virtual address e0000100

I to am searching for a kexec solution (for a Compulab CM-X270)

I can progress this code a little further and eliminate the segfault with
the following patch, but still nothing after the final Bye! message :(


--- linux-2.6.22.9/arch/arm/kernel/setup.c-orig 2007-09-27 15:23:22.000000000 +0100
+++ linux-2.6.22.9/arch/arm/kernel/setup.c      2007-09-27 16:57:17.000000000 +0100
@@ -769,6 +769,8 @@
 }
 arch_initcall(customize_machine);
 
+extern unsigned long kexec_atag_list;
+
 void __init setup_arch(char **cmdline_p)
 {
        struct tag *tags = (struct tag *)&init_tags;
@@ -782,10 +784,18 @@
        if (mdesc->soft_reboot)
                reboot_setup("s");
 
+       printk(KERN_INFO "__atags_pointer %x, mdesc->boot_params %x\n",
+                                       __atags_pointer, mdesc->boot_params);
        if (__atags_pointer)
+       {
                tags = phys_to_virt(__atags_pointer);
+               kexec_atag_list = __atags_pointer;
+       }
        else if (mdesc->boot_params)
+       {
                tags = phys_to_virt(mdesc->boot_params);
+               kexec_atag_list = mdesc->boot_params;
+       }
 
        /*
         * If we have the old style parameters, convert them to

-- 
        Bob Dunlop


