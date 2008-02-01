Received: from [213.46.255.22] (helo=viefep24-int.chello.at)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mailinglist@miromico.ch>) id 1JL1Ug-0007ti-6W
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Feb 2008 20:24:10 +0100
Received: from [192.168.1.102] (really [217.162.164.39])
	by viefep24-int.chello.at
	(InterMail vM.7.08.02.00 201-2186-121-20061213) with ESMTP
	id <20080201192416.FYBY5971.viefep24-int.chello.at@[192.168.1.102]>
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Feb 2008 20:24:16 +0100
Message-ID: <47A3720F.1060303@miromico.ch>
Date: Fri, 01 Feb 2008 20:25:03 +0100
From: Alex <mailinglist@miromico.ch>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Solution for AVR32 kernel link problem
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
X-List-Received-Date: Fri, 01 Feb 2008 19:24:10 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi

I played around with OE for AVR32.

I think I found a solution for the kernel linking problem. A known 
workaround was to use an external linker.
I tried both, the one from Atmel's toolchain package and the one created 
by Atmel's buildroot. The one created
by buildroot should be the same version as the one created by OE.

I copied binutils patches from builtroot to OE. Even though, they have 
the same "patch number" (500, 501) they are different
from those OE will download during build.

I changed binutils_2.17.bb receipt to use the files from buildroot:

--- snipp ---
#patches from 
http://svn.uclibc.org/cgi-bin/viewcvs.cgi/trunk/buildroot/toolchain/binutils/2.17/

SRC_URI += "\
    file://100-uclibc-conf.patch;patch=1 \
    file://300-006_better_file_error.patch;patch=1 \
    file://702-binutils-skip-comments.patch;patch=1 \
    file://110-arm-eabi-conf.patch;patch=1 \
    file://300-012_check_ldrunpath_length.patch;patch=1 \
    file://300-001_ld_makefile_patch.patch;patch=1 \
    file://400-mips-ELF_MAXPAGESIZE-4K.patch;patch=1 \
        file://500-avr32-atmel.1.3.0.patch;patch=1 \
      file://501-avr32-fix-pool-alignment.patch;patch=1 \
"
#        
http://avr32linux.org/twiki/pub/Main/DevelopmentTools/502-avr32-bfd-dont-allow-direct-refs-to-bss.patch.gz;patch=1 
\
#        file://503-avr32-fix-got-offset-init.patch;patch=1 \
---- snapp ------

Like this kernel will compile and link.

I don't have enough knowledge about OE to say this fix works. I don't 
know why and how the patches are different?
I will try to include the other two patches which are currently 
commented out. The above receipt applies exactly the same patches as the 
buildroot.

Finally, I couldn't test it, as I can't boot the kernel. Something is 
wrong with my load address and entry point. It is set to 0x20008000. I 
tried to
add UBOOT_ENTRYPOINT = "90000000" to atngw100.conf and just recompile 
the kernel by "bitbake virtual/kernel -c clean" and "bitbake 
virtual/kernel".
This didn't change the entry point, but maybe I have to recompile 
everything..

Hope this helps
Alex
-


