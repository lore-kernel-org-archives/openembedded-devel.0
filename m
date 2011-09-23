Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1R73NM-0002LV-BB
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Sep 2011 12:53:00 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id A1D6816602CF; Fri, 23 Sep 2011 04:47:38 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 1B37A16601DC;
	Fri, 23 Sep 2011 04:47:37 -0600 (MDT)
Message-ID: <4E7C63C8.3050900@mlbassoc.com>
Date: Fri, 23 Sep 2011 04:47:36 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1316770597.99899.YahooMailNeo@web121512.mail.ne1.yahoo.com>
In-Reply-To: <1316770597.99899.YahooMailNeo@web121512.mail.ne1.yahoo.com>
Subject: Re: ti_cgt_c6000_6.1.17_setup_linux_x86.bin error while installing ti-codec-engine
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
X-List-Received-Date: Fri, 23 Sep 2011 10:53:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-09-23 03:36, ibrahim demir wrote:
> Dear developers,
>
>
> I mentioned that an error at my last message half our ago, but when i run this commands there appear another error:
>
> #bitbake -f -c fetch ti-cgt6x
> #bitbake ti-codec-engine
>
> The result of first command is:
>
> *****************************************************************************
> parana@parana-desktop:/media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts$ bitbake -f -c fetch ti-cgt6x
> NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it to increase performance.
> Loading cache: 100% |###########################################| ETA:  00:00:00
> Loaded 7202 entries from dependency cache.
> NOTE: Angstrom DOES NOT support fso-apm because regular apmd is good enough--:--
> NOTE: Angstrom DOES NOT support ipkg because ipkg has been superseded by opkg:16
> NOTE: Angstrom DOES NOT support libiconv because the glibc builtin iconv replacement is used
> NOTE: Angstrom DOES NOT support libiconv because the glibc builtin iconv replacement is used
> NOTE: Angstrom DOES NOT support libiconv because the glibc builtin iconv replacement is used
> NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x has been replaced by bluez4
> NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
> NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
> NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
> NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x has been replaced by bluez4
> NOTE: Angstrom DOES NOT support bash-noemu because doesn't work on the target:03
> Parsing recipes: 100% |#########################################| Time: 00:00:19
> Parsing of 7333 .bb files complete (6576 cached, 757 parsed). 7979 targets, 316 skipped, 0 masked, 0 errors.
>
> Build Configuration:
> BB_VERSION        = "1.12.0"
> METADATA_BRANCH   = "2011.03-maintenance"
> METADATA_REVISION = "ece41e4"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "beagleboard"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "2011.03"
> TARGET_FPU        = "hard"
>
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing RunQueue Tasks
> NOTE: Running task 2 of 2 (ID: 0, /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/sources/openembedded/recipes/ti/ti-cgt6x_6.1.17.bb, do_fetch)
> NOTE: package ti-cgt6x-1_6_1_17-r4: task do_fetch: Started
> NOTE: package ti-cgt6x-1_6_1_17-r4: task do_fetch: Succeeded
> NOTE: Tasks Summary: Attempted 2 tasks of which 1 didn't need to be rerun and 0 failed.
> *****************************************************************************
>
> Then the second and the error is can be seen at log:
>
> *****************************************************************************
> parana@parana-desktop:/media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts$ bitbake ti-codec-engine
> NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it to increase performance.
> Loading cache: 100% |###########################################| ETA:  00:00:00
> Loaded 7202 entries from dependency cache.
> NOTE: Angstrom DOES NOT support fso-apm because regular apmd is good enough--:--
> NOTE: Angstrom DOES NOT support ipkg because ipkg has been superseded by opkg:13
> NOTE: Angstrom DOES NOT support libiconv because the glibc builtin iconv replacement is used
> NOTE: Angstrom DOES NOT support libiconv because the glibc builtin iconv replacement is used
> NOTE: Angstrom DOES NOT support libiconv because the glibc builtin iconv replacement is used
> NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
> NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x has been replaced by bluez4
> NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
> NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
> NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x has been replaced by bluez4
> NOTE: Angstrom DOES NOT support bash-noemu because doesn't work on the target:03
> Parsing recipes: 100% |#########################################| Time: 00:00:16
> Parsing of 7333 .bb files complete (6576 cached, 757 parsed). 7979 targets, 316 skipped, 0 masked, 0 errors.
>
> Build Configuration:
> BB_VERSION        = "1.12.0"
> METADATA_BRANCH   = "2011.03-maintenance"
> METADATA_REVISION = "ece41e4"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "beagleboard"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "2011.03"
> TARGET_FPU        = "hard"
>
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing RunQueue Tasks
> NOTE: Running task 743 of 1240 (ID: 275, /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/sources/openembedded/recipes/ti/ti-cgt6x_6.1.17.bb, do_unpack)
> NOTE: Running task 744 of 1240 (ID: 290, /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/sources/openembedded/recipes/ti/ti-cgt6x_6.1.17.bb, do_distribute_sources)
> NOTE: package ti-cgt6x-1_6_1_17-r4: task do_unpack: Started
> NOTE: package ti-cgt6x-1_6_1_17-r4: task do_distribute_sources: Started
> NOTE: package ti-cgt6x-1_6_1_17-r4: task do_distribute_sources: Succeeded
>
> This will install C6000 Code Generation Tools on your computer.  Continue? [n/Y]
>      Software License Agreement for
>         Code Generation Tools, Utilities and Run-Time Libraries
>
> /--------------------------------------------------------------------
> | IMPORTANT - PLEASE READ THE FOLLOWING LICENSE AGREEMENT CAREFULLY. |
> |                                                                    |
> | THIS IS A LEGALLY BINDING  AGREEMENT.  AFTER YOU READ THIS LICENSE |
> | AGREEMENT, YOU WILL  BE ASKED WHETHER YOU ACCEPT  AND AGREE TO THE |
> | TERMS OF  THIS LICENSE AGREEMENT.  DO  NOT CLICK "I  HAVE READ AND |
> | AGREE" UNLESS: (1)  YOU ARE AUTHORIZED TO ACCEPT  AND AGREE TO THE |
> | TERMS OF  THIS LICENSE  AGREEMENT ON BEHALF  OF YOURSELF  AND YOUR |
> | COMPANY; AND (2)  YOU INTEND TO ENTER INTO AND TO  BE BOUND BY THE |
> | TERMS OF THIS LEGALLY BINDING  AGREEMENT ON BEHALF OF YOURSELF AND |
> | YOUR COMPANY.                                                      |
> \--------------------------------------------------------------------/
>
> IMPORTANT   --  READ  CAREFULLY:   This  software   license  agreement
> ("Agreement") is  a legal agreement between you  (either an individual
> or entity)  and Texas  Instruments Incorporated (TI").   The "Licensed
> Materials"  subject to  this Agreement  include the  software programs
> that TI has granted you access to download with this Agreement and any
> "on-line" or electronic  documentation associated with these programs,
> or any  portion thereof, as  well as any  updates or upgrades  to such
> -- Press space to continue or 'q' to quit --
> Do you accept the TI CG EULA in LICENSE.txt? [y/N]
>
> Where do you want to install C6000 Code Generation Tools?
> [/opt/TI/TI_CGT_C6000_6.1.17]
> Installing C6000 Code Generation Tools...
>
> Installing Linux Code Generation Tools...
> Installing Unix Format READMEs...
> Installing Linux Format Include Files...
> Installing Linux Format Libraries...
> Installing Unix Manual Pages...
>
> Installation complete.
>
> ---------------------------------------------------------------------------
>
> Remember to set environment variables appropriate to your shell. Examples:
>
> (ba)sh -
>    export
> C6X_C_DIR="/opt/TI/TI_CGT_C6000_6.1.17/include;/opt/TI/TI_CGT_C6000_6.1.17/lib"
>
> tcsh   -
>    setenv C6X_C_DIR
> "/opt/TI/TI_CGT_C6000_6.1.17/include;/opt/TI/TI_CGT_C6000_6.1.17/lib"
>
> DOS    -
>    set
> C6X_C_DIR=/opt/TI/TI_CGT_C6000_6.1.17\include;/opt/TI/TI_CGT_C6000_6.1.17\lib
>
> ---------------------------------------------------------------------------
>
> -- Press space to continue ---- Press space to continue --NOTE: package ti-cgt6x-1_6_1_17-r4: task do_unpack: Succeeded
> NOTE: Running task 1184 of 1240 (ID: 276, /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/sources/openembedded/recipes/ti/ti-cgt6x_6.1.17.bb, do_patch)
> NOTE: package ti-cgt6x-1_6_1_17-r4: task do_patch: Started
> NOTE: package ti-cgt6x-1_6_1_17-r4: task do_patch: Succeeded
> NOTE: Running task 1185 of 1240 (ID: 286, /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/sources/openembedded/recipes/ti/ti-cgt6x_6.1.17.bb, do_configure)
> NOTE: package ti-cgt6x-1_6_1_17-r4: task do_configure: Started
> NOTE: package ti-cgt6x-1_6_1_17-r4: task do_configure: Succeeded
> NOTE: Running task 1186 of 1240 (ID: 287, /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/sources/openembedded/recipes/ti/ti-cgt6x_6.1.17.bb, do_qa_configure)
> NOTE: package ti-cgt6x-1_6_1_17-r4: task do_qa_configure: Started
> NOTE: package ti-cgt6x-1_6_1_17-r4: task do_qa_configure: Succeeded
> NOTE: Running task 1187 of 1240 (ID: 288, /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/sources/openembedded/recipes/ti/ti-cgt6x_6.1.17.bb, do_compile)
> NOTE: package ti-cgt6x-1_6_1_17-r4: task do_compile: Started
> NOTE: package ti-cgt6x-1_6_1_17-r4: task do_compile: Succeeded
> NOTE: Running task 1188 of 1240 (ID: 277, /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/sources/openembedded/recipes/ti/ti-cgt6x_6.1.17.bb, do_install)
> NOTE: package ti-cgt6x-1_6_1_17-r4: task do_install: Started
> ERROR: Logfile of failure stored in: /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-cgt6x-1_6_1_17-r4/temp/log.do_install.24167
> Log data follows:
> | + do_install
> | + install -d /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-cgt6x-1_6_1_17-r4/image/usr/share/ti/ti-cgt6x-tree
> | + cp -pPrf '/media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-cgt6x-1_6_1_17-r4/cgt6x_6_1_17/*' /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-cgt6x-1_6_1_17-r4/image/usr/share/ti/ti-cgt6x-tree
> | cp: cannot stat `/media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-cgt6x-1_6_1_17-r4/cgt6x_6_1_17/*': No such file or directory
> NOTE: package ti-cgt6x-1_6_1_17-r4: task do_install: Failed
> ERROR: Function 'do_install' failed (see /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-cgt6x-1_6_1_17-r4/temp/log.do_install.24167 for further information)
> ERROR: Task 277 (/media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/sources/openembedded/recipes/ti/ti-cgt6x_6.1.17.bb, do_install) failed with exit code '1'
> ERROR: '/media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/sources/openembedded/recipes/ti/ti-cgt6x_6.1.17.bb' failed
> *****************************************************************************
>
>   Even if i didnt understand why i get all the errors bitbake can generate:) , i still wonder what is wrong..

Check to make sure that you don't have write permission to /opt
If you have write permission in the directory /opt, the installer
fails to put the tools where they belong in your OE build.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


