Received: from [91.121.247.18] (helo=posta.altrarete.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ottavio@campana.vi.it>) id 1MC87r-0006Bp-Gi
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 10:16:39 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by posta.altrarete.it (Postfix) with ESMTP id E84F957C191
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2009 10:07:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at posta.altrarete.it
Received: from posta.altrarete.it ([127.0.0.1])
	by localhost (posta.altrarete.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w8PbUGKNpMMP
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2009 10:07:37 +0200 (CEST)
Received: from computer-di-ottavio-campana.local
	(host19-88-static.184-82-b.business.telecomitalia.it [82.184.88.19])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by posta.altrarete.it (Postfix) with ESMTPSA id B84E957C043
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2009 10:07:34 +0200 (CEST)
Message-ID: <4A2780E0.3000709@campana.vi.it>
Date: Thu, 04 Jun 2009 10:08:00 +0200
From: Ottavio Campana <ottavio@campana.vi.it>
User-Agent: Postbox 1.0b12 (Macintosh/2009051120)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: unable to build codec engine 2.21 in stable/2009
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
X-List-Received-Date: Thu, 04 Jun 2009 08:16:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm having problems building coded engine 2.21 using stable/2009 and
angstrong distribution.

I cut and paste the final error that I have:

| make -C
/db/toolsrc/library/toolsC38/vendors/mvl/arm/dm6446/REL_LSP_02_00_00_010/montavista/pro/devkit/lsp/ti-davinci/linux-2.6.18_pro500
M=/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstrom-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packages/ti/bios/power/modules/dm6446/lpm
ARCH=arm
CROSS_COMPILE=/db/toolsrc/library/toolsC38/vendors/mvl/arm/mvl5.0/montavista/pro/devkit/arm/v5t_le/bin/arm_v5t_le-
\
|         EXTRA_CFLAGS="-DUSE_UDEV -DOS_LINUX -DLINUX_KERNEL -DRELEASE
-DOS_LINUX -DMAX_DSPS=1 -DMAX_PROCESSORS=2 -DID_GPP=1 -DDAVINCI
-DDSPLINK_LEGACY_SUPPORT -DPROC_COMPONENT -DPOOL_COMPONENT
-DNOTIFY_COMPONENT -DMPCS_COMPONENT -DRINGIO_COMPONENT
-DMPLIST_COMPONENT -DMSGQ_COMPONENT -DMSGQ_ZCPY_LINK -DZCPY_LINK
-DKFILE_DEFAULT -DDM6446GEM -DDM6446GEM_PHYINTERFACE=SHMEM_INTERFACE
-D__KERNEL__ -DMODULE -DTRACE_KERNEL -DDDSP_DEBUG
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstrom-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packages/dsplink/../dsplink/gpp/src/inc
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstrom-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packages/dsplink/../dsplink/gpp/src/inc/sys/arch
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstrom-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packages/dsplink/../dsplink/gpp/src/inc/usr
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstrom-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packages/dsplink/../dsplink/gpp/src/inc/sys
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstrom-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packages/dsplink/../dsplink/gpp/src/inc/sys/Linux
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstrom-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packages/dsplink/../dsplink/gpp/src/inc/sys/Linux/2.6.18
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstrom-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packages/dsplink/../dsplink/gpp/src/inc/sys/arch/DM6446GEM
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstrom-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packages/dsplink/../dsplink/gpp/src/inc/sys/arch/DM6446GEM/Linux
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstrom-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packages/dsplink/../dsplink/gpp/src/pmgr
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstrom-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packages/dsplink/../dsplink/gpp/src/pmgr/Linux
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstrom-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packages/dsplink/../dsplink/gpp/src/pmgr/Linux/2.6.18
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstrom-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packages/dsplink/../dsplink/gpp/BUILD/INCLUDE
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstrom-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packages/dsplink/../dsplink/gpp/BUILD/INCLUDE/USER
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstrom-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packages/dsplink/../dsplink/gpp/BUILD/INCLUDE/KRNL
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstrom-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packages/dsplink/../dsplink/gpp/export/INCLUDE/Linux/DAVINCI/internal
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstrom-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packages/dsplink/../dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal"
modules
| make: ***
/db/toolsrc/library/toolsC38/vendors/mvl/arm/dm6446/REL_LSP_02_00_00_010/montavista/pro/devkit/lsp/ti-davinci/linux-2.6.18_pro500:
No such file or directory.  Stop.
| make: *** [default] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstrom-linux-gnueabi/ti-codec-engine-221-r19/temp/log.do_compile.23591
NOTE: package ti-codec-engine-221-r19: task do_compile: failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/ottavio/Projects/stuff/openembedded/recipes/dsplink/ti-codec-engine_2.21.bb
do_compile failed
ERROR: Task 249
(/home/ottavio/Projects/stuff/openembedded/recipes/dsplink/ti-codec-engine_2.21.bb,
do_compile) failed
NOTE: Tasks Summary: Attempted 1490 tasks of which 1490 didn't need to
be rerun and 1 failed.
ERROR:
'/home/ottavio/Projects/stuff/openembedded/recipes/dsplink/ti-codec-engine_2.21.bb'
failed
NOTE: build 200906040933: completed
ottavio@debian2:~/Projects/stuff/openembedded$



So the question is: what is the directory
/db/toolsrc/library/toolsC38/vendors/mvl/arm/dm6446/REL_LSP_02_00_00_010/montavista/pro/devkit/lsp/ti-davinci/linux-2.6.18_pro500
required by make in the first line that I pasted?

Thanks,

Ottavio



