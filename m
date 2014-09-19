Return-Path: <Pengyu.Ma@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5B8C571477
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Sep 2014 10:38:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8JAc24g029529
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Sep 2014 03:38:04 -0700 (PDT)
Received: from pek-bsp-build1.wrs.com (128.224.179.105) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Fri, 19 Sep 2014 03:38:02 -0700
From: Pengyu Ma <pengyu.ma@windriver.com>
To: <pengyu.ma@windriver.com>, <Bruce.Ashfield@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Sep 2014 18:33:35 +0800
Message-ID: <1411122818-121055-1-git-send-email-pengyu.ma@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: Review request 0/5: [linux-yocto-3.14] create meta for intel-x86 bsp
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Sep 2014 10:38:11 -0000
Content-Type: text/plain

Summary: [linux-yocto-3.14] create meta for intel-x86 bsp
Tech Review: Bruce
Gatekeeper: Bruce
Lockdown Approval (if needed): 
Branch Tag: meta

IP Statement (form link or license statement, usually automated):
Crypto URL(s) (if needed):
Parent Template (where applicable):


-------------------------------------
Impacted area             Impact y/n
-------------------       -----------
docs/tech-pubs                 n
tests                          n
build system                   n
host dependencies              n
RPM/packaging                  n
toolchain                      n
kernel code                    n
user code                      n
configuration files            y
target configuration           n
Other                          n
Applicable to Yocto/upstream   n
New Kernel Warnings            n


Comments (indicate scope for each "y" above):
---------------------------------------------
commit 5414d99831661d472c65e0275d2d79064f3d3588
Author: fupan li <fupan.li@windriver.com>
Date:   Fri Mar 21 15:31:37 2014 +0800

    enable i40e driver for intel-x86 BSP
    
    Signed-off-by: fupan li <fupan.li@windriver.com>
    Signed-off-by: Pengyu Ma <pengyu.ma@windriver.com>

 meta/cfg/kernel-cache/features/i40e/i40e.cfg | 3 +++
 meta/cfg/kernel-cache/features/i40e/i40e.scc | 4 ++++
 2 files changed, 7 insertions(+)

commit 80dbaa4d8ff4857cbb66e1c8ddf1ad055aaae4ea
Author: Pengyu Ma <pengyu.ma@windriver.com>
Date:   Fri Sep 19 13:32:15 2014 +0800

    kexec/kdump: add metadata for to enable kexec/dump.
    
    Signed-off-by: Pengyu Ma <pengyu.ma@windriver.com>

 meta/cfg/kernel-cache/features/kdump/e500-kdump.cfg   | 2 ++
 meta/cfg/kernel-cache/features/kdump/e500-kdump.scc   | 1 +
 meta/cfg/kernel-cache/features/kdump/kdump-enable.scc | 4 ++++
 meta/cfg/kernel-cache/features/kdump/kdump.cfg        | 3 +++
 meta/cfg/kernel-cache/features/kexec/e500-kexec.cfg   | 1 +
 meta/cfg/kernel-cache/features/kexec/e500-kexec.scc   | 1 +
 meta/cfg/kernel-cache/features/kexec/kexec-enable.scc | 4 ++++
 meta/cfg/kernel-cache/features/kexec/kexec.cfg        | 1 +
 8 files changed, 17 insertions(+)

commit 97fc2754b2df35dbf8006c9f4a5d3fb2bb24913e
Author: Pengyu Ma <pengyu.ma@windriver.com>
Date:   Fri Sep 19 10:53:25 2014 +0800

    intel-x86: add metadata for intel-x86 BSP
    
    Signed-off-by: Pengyu Ma <pengyu.ma@windriver.com>

 meta/cfg/kernel-cache/arch/x86/x86.cfg                            |  11 +++
 meta/cfg/kernel-cache/arch/x86/x86.scc                            |   5 ++
 meta/cfg/kernel-cache/arch/x86_64/x86_64.cfg                      |   7 ++
 meta/cfg/kernel-cache/arch/x86_64/x86_64.scc                      |   5 ++
 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-32-preempt-rt.scc   |  10 +++
 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-32-standard.scc     |   8 +++
 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-32.cfg              |  24 +++++++
 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-32.scc              |   6 ++
 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-64-preempt-rt.scc   |   9 +++
 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-64-standard.scc     |   7 ++
 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-64.scc              |   7 ++
 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-acpi.cfg            |  17 +++++
 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-igb-overrides.cfg   |   1 +
 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-ixgbe-overrides.cfg |   1 +
 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-mga.cfg             |   3 +
 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-tigon3.cfg          |   2 +
 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86.cfg                 | 366 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86.scc                 |  37 ++++++++++
 18 files changed, 526 insertions(+)

Testing Applicable to:
----------------------

Testing Commands:
-----------------

Testing, Expected Results:
--------------------------
Testing with wr-testing layer bts-new template:

Getting system software environment information ... OK
Getting cpu and memory information ... OK
Getting network environment information ... OK
Getting hard disk environment information ... OK
Creating environment configure file ... OK

	>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	The test case list : 
	 BOOTCHECK 10GNIC CPU_FREQ CPU_IDLE DMA EDAC ETHERNET HWWATCHDOG I2C INTEL_IDLE IPMI LTP NUMA PCI POSIX QAT RTC SATA SENSORS SERIALSYSRQ STANDBY SUSPEND_TO_DISK SUSPEND_TO_RAM USBHOST WIFI input_event kvm_mem_x86 perf_withload turbostat
	<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

	Start bts Case BOOTCHECK at Fri Sep 19 09:55:38 UTC 2014 with duration 600 s
	[BOOTCHECK] results:[  PASSED  ]
	==========================================

	Start bts Case 10GNIC at Fri Sep 19 09:55:38 UTC 2014 with duration 1200 s
	[10GNIC] results:[ Should be executed manually ]
	==========================================

	Start bts Case CPU_FREQ at Fri Sep 19 09:55:43 UTC 2014 with duration 3600 s
	[CPU_FREQ] results:[ UNTESTED ]
	==========================================

	Start bts Case CPU_IDLE at Fri Sep 19 09:55:43 UTC 2014 with duration 1800 s
	[CPU_IDLE] results:[  PASSED  ]
	==========================================

	Start bts Case ETHERNET at Fri Sep 19 09:56:45 UTC 2014 with duration 600 s
	[ETHERNET] results:[ PASSED ]
	==========================================

	Start bts Case HWWATCHDOG at Fri Sep 19 09:59:52 UTC 2014 with duration 600 s
	[HWWATCHDOG] results:[ Should be executed manually ]
	==========================================

	Start bts Case I2C at Fri Sep 19 09:59:52 UTC 2014 with duration 600 s
	[I2C] results:[  PASSED  ]
	==========================================

	Start bts Case INTEL_IDLE at Fri Sep 19 09:59:53 UTC 2014 with duration 600 s
	[INTEL_IDLE] results:[  PASSED  ]
	==========================================

	Start bts Case IPMI at Fri Sep 19 09:59:54 UTC 2014 with duration 600 s
	[IPMI] results:[ UNTESTED ]
	==========================================

	Start bts Case LTP at Fri Sep 19 09:59:54 UTC 2014 with duration 60 s
	[LTP] results:[ Should be executed manually ]
	==========================================

	Start bts Case NUMA at Fri Sep 19 09:59:54 UTC 2014 with duration 1800 s
	[NUMA] results:[  PASSED  ]
	==========================================

	Start bts Case PCI at Fri Sep 19 10:01:16 UTC 2014 with duration 600 s
	[PCI] results:[  PASSED  ]
	==========================================

	Start bts Case POSIX at Fri Sep 19 10:01:24 UTC 2014 with duration 60 s
	[POSIX] results:[ Should be executed manually ]
	==========================================

	Start bts Case QAT at Fri Sep 19 10:01:25 UTC 2014 with duration 1200 s
	[QAT] results:[  PASSED  ]
	==========================================

	Start bts Case RTC at Fri Sep 19 10:01:26 UTC 2014 with duration 600 s
	[RTC] results:[  PASSED  ]
	==========================================

	Start bts Case SATA at Sat Jun 16 00:09:03 UTC 2001 with duration 600 s
	[SATA] results:[ Should be executed manually ]
	==========================================

	Start bts Case SENSORS at Sat Jun 16 00:09:03 UTC 2001 with duration 600 s
	[SENSORS] results:[  PASSED  ]
	==========================================

	Start bts Case SERIALSYSRQ at Sat Jun 16 00:09:05 UTC 2001 with duration 600 s
	[SERIALSYSRQ] results:[ Should be executed manually ]
	==========================================

	Start bts Case SUSPEND_TO_DISK at Sat Jun 16 00:10:20 UTC 2001 with duration 1200 s
	[SUSPEND_TO_DISK] results:[ Should be executed manually ]
	==========================================

	Start bts Case SUSPEND_TO_RAM at Sat Jun 16 00:10:20 UTC 2001 with duration 1200 s
	[SUSPEND_TO_RAM] results:[ Should be executed manually ]
	==========================================

	Start bts Case USBHOST at Sat Jun 16 00:10:20 UTC 2001 with duration 1800 s
	[USBHOST] results:[ Should be executed manually ]
	==========================================

	Start bts Case WIFI at Sat Jun 16 00:10:21 UTC 2001 with duration 1800 s
	[WIFI] results:[ Should be executed manually ]
	==========================================

	Start bts Case kvm_mem_x86 at Sat Jun 16 00:10:21 UTC 2001 with duration 1200 s
	[kvm_mem_x86] results:[  PASSED  ]
	==========================================

	Start bts Case perf_withload at Sat Jun 16 00:12:12 UTC 2001 with duration 1200 s
	[perf_withload] results:[  PASSED  ]
	==========================================

	Start bts Case turbostat at Sat Jun 16 00:13:54 UTC 2001 with duration 120 s
	[turbostat] results:[  PASSED  ]
	==========================================

Total Tests:    		25
      Passed:   		12
      Failed:   		0
      Skipped:  		2
      Exception:		0
      Manual:   		11
Test completed unsuccessfully

Conditions of submission:
-------------------------


Arch    built      boot     boardname
-------------------------------------
MIPS      n         n
MIPS64    n         n
MIPS64n32 n         n
ARM       n         n
x86       y         y
x86_64    y         y
PPC       n         n
PPC64     n         n
SPARC64   n         n


