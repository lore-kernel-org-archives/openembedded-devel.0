Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LqVra-00058M-U4
	for openembedded-devel@openembedded.org; Sun, 05 Apr 2009 19:10:34 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LqVow-00071l-H4
	for openembedded-devel@openembedded.org; Sun, 05 Apr 2009 17:07:46 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 05 Apr 2009 17:07:46 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 05 Apr 2009 17:07:46 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 05 Apr 2009 19:07:33 +0200
Message-ID: <graogl$p89$1@ger.gmane.org>
References: <gr7nfd$32a$1@ger.gmane.org>	<be7a9f3d0904041046n65089397g5b82ccab0aec2afb@mail.gmail.com>
	<gran43$m4d$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <gran43$m4d$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Rebuild external kernel modules on kernel change
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
X-List-Received-Date: Sun, 05 Apr 2009 17:10:34 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05-04-09 18:43, Koen Kooi wrote:
> On 04-04-09 19:46, Otavio Salvador wrote:
>> On Sat, Apr 4, 2009 at 10:31 AM, Koen Kooi<k.kooi@student.utwente.nl>
>> wrote:
>>> Hi,
>> [...]
>>> I don't really like this method, but I'm having a hard time coming up
>>> with a
>>> decent solution that:
>> [...]
>>
>> I agree that is not beauty but it works.
>>
>> I also belive it could be used in other recipes too as
>> initramfs-images. This
>> way forcing the rebuild of it if the kernel is changed and machine
>> revision
>> is bumped.
>>
>> Fully support it.
>>
>> +1
>
> Thanks, I'll try cooking up a patch for beagleboard tomorrow to show a
> real life example.

Here it is, this will be done in 2 commits:

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 17e8941..954c407 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -64,6 +64,10 @@ export CMDLINE_CONSOLE = 
"console=${@bb.data.getVar("KERNEL_CONSOLE",d,1) or "tt
  KERNEL_VERSION = "${@get_kernelversion('${S}')}"
  KERNEL_MAJOR_VERSION = "${@get_kernelmajorversion('${KERNEL_VERSION}')}"

+# A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
+# rebuilds for kernel and external modules
+PR = "${MACHINE_KERNEL_PR}"
+
  KERNEL_LOCALVERSION ?= ""


diff --git a/classes/module-base.bbclass b/classes/module-base.bbclass
index c98bace..bc53e1b 100644
--- a/classes/module-base.bbclass
+++ b/classes/module-base.bbclass
@@ -5,6 +5,10 @@ inherit kernel-arch
  export OS = "${TARGET_OS}"
  export CROSS_COMPILE = "${TARGET_PREFIX}"

+# A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
+# rebuilds for kernel and external modules
+PR = "${MACHINE_KERNEL_PR}"
+

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index a0d652a..136f01c 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -162,6 +162,10 @@ EXTENDPEVER = 
"${@['','${PE\x7d:'][bb.data.getVar('PE',d,1) > 0]}"
  EXTENDPV = "${EXTENDPEVER}${PV}-${PR}${DISTRO_PR}"
  P = "${PN}-${PV}"

+# Define a PR for kernels that machines can override so things like
+# modules get rebuilt
+MACHINE_KERNEL_PR ?= "r0"
+

diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
index 78c6301..3d55ebc 100644
--- a/conf/machine/beagleboard.conf
+++ b/conf/machine/beagleboard.conf
@@ -25,6 +25,7 @@ EXTRA_IMAGECMD_jffs2 = "-lnp "
  SERIAL_CONSOLE = "115200 ttyS2"

  PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
+MACHINE_KERNEL_PR = "r20"

  KERNEL_IMAGETYPE = "uImage"

diff --git a/recipes/dsplink/gstreamer-ti_svn.bb 
b/recipes/dsplink/gstreamer-ti_svn.bb
index ab705f3..6944ad5 100644
--- a/recipes/dsplink/gstreamer-ti_svn.bb
+++ b/recipes/dsplink/gstreamer-ti_svn.bb
@@ -4,7 +4,7 @@ SRC_URI = 
"svn://gforge.ti.com/svn/gstreamer_ti/trunk;module=gstreamer_ti;proto=
            "
  SRCREV = "160"

-PR = "r7"
+PR = "${MACHINE_KERNEL_PR}"

diff --git a/recipes/dsplink/ti-codec-engine_2.21.bb 
b/recipes/dsplink/ti-codec-engine_2.21.bb
index 5b1d5e0..f0b0d7e 100644
--- a/recipes/dsplink/ti-codec-engine_2.21.bb
+++ b/recipes/dsplink/ti-codec-engine_2.21.bb
@@ -8,7 +8,6 @@ RDEPENDS = "update-modules"
  inherit module

  # tconf from xdctools dislikes '.' in pwd :/
-PR = "r19"
  PV = "221"


diff --git a/recipes/dsplink/ti-codec-engine_2.23.bb 
b/recipes/dsplink/ti-codec-engine_2.23.bb
index a42c33b..bbf54d4 100644
--- a/recipes/dsplink/ti-codec-engine_2.23.bb
+++ b/recipes/dsplink/ti-codec-engine_2.23.bb
@@ -9,7 +9,6 @@ inherit module
  DEFAULT_PREFERENCE = "-1"

  # tconf from xdctools dislikes '.' in pwd :/
-PR = "r0"
  PV = "223"


diff --git a/recipes/dsplink/ti-dmai_svn.bb b/recipes/dsplink/ti-dmai_svn.bb
index bcbaea8..76fa74a 100644
--- a/recipes/dsplink/ti-dmai_svn.bb
+++ b/recipes/dsplink/ti-dmai_svn.bb
@@ -15,7 +15,7 @@ SRCREV = "36"
  S = 
"${WORKDIR}/BRIJESH_GIT_022309/davinci_multimedia_application_interface/dmai"
  # Yes, the xdc stuff still breaks with a '.' in PWD
  PV = "120+svnr${SRCREV}"
-PR = "r16"
+PR = "${MACHINE_KERNEL_PR}"


diff --git a/recipes/linux/linux-omap_2.6.28.bb 
b/recipes/linux/linux-omap_2.6.28.bb
index bc085c7..92de11e 100644
--- a/recipes/linux/linux-omap_2.6.28.bb
+++ b/recipes/linux/linux-omap_2.6.28.bb
@@ -12,7 +12,6 @@ DEFAULT_PREFERENCE_omap5912osk = "1"
  SRCREV = "79d042a081d3e467c735bb0d9569ed6296f85a3c"

  PV = "2.6.28"
-PR = "r19"


diff --git a/recipes/linux/linux-omap_2.6.29.bb 
b/recipes/linux/linux-omap_2.6.29.bb
index a2391ee..43be953 100644
--- a/recipes/linux/linux-omap_2.6.29.bb
+++ b/recipes/linux/linux-omap_2.6.29.bb
@@ -10,7 +10,7 @@ DEFAULT_PREFERENCE_overo = "1"

  SRCREV = "58cf2f1425abfd3a449f9fe985e48be2d2555022"

-PR = "r7+gitr${SRCREV}"
+PR_append = "+gitr${SRCREV}"


diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1397.bb 
b/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1397.bb
index 985a0c0..fc9f02f 100644
--- a/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1397.bb
+++ b/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1397.bb
@@ -1,8 +1,6 @@
  DESCRIPTION = "Kernel drivers for the PowerVR SGX chipset found in the 
omap3 SoCs"
  LICENSE = "GPLv2"

-PR = "r6"
-
  inherit module



