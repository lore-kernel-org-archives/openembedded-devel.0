Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1Op0p8-0008Oo-Sz
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 17:26:48 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 95EC316607E5; Fri, 27 Aug 2010 09:25:48 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id BE3CC166019D;
	Fri, 27 Aug 2010 09:25:27 -0600 (MDT)
Message-ID: <4C77D8E7.3030109@mlbassoc.com>
Date: Fri, 27 Aug 2010 09:25:27 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 64.234.241.98
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] TI tools - make EULA unpack work when /opt is writeable
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
X-List-Received-Date: Fri, 27 Aug 2010 15:26:52 -0000
X-Groupsio-MsgNum: 22758
Content-Type: multipart/mixed; boundary="------------090403050609000401070108"

--------------090403050609000401070108
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This patch addresses the problem where the TI tools that need
the EULA unpack into the wrong place if the user has write
permission in /opt.  The current behaviour of relying on the
unpacker to fall back to the $HOME environment variable should
not be relied on.  The patch changes the unpack step to use
the --prefix= option which will always work.

Note: only tested with these [recent] packages:
   ti-cgt6x-1_6_1_9-r4
   ti-cgt6x-1_6_1_14-r4
   ti-codecs-omap3530-1_1_01_00-r2
   ti-dspbios-5_41_04_18-r1
   ti-edma3lld-01_11_00_03-r0
   ti-xdctools-3_16_01_27-r2

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

--------------090403050609000401070108
Content-Type: text/plain;
 name="0001-Make-EULA-unpacking-work-when-opt-is-writeable.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-Make-EULA-unpacking-work-when-opt-is-writeable.patch"

From cab9a3f415527559aa33f708c59c1e2b7023eac3 Mon Sep 17 00:00:00 2001
From: Gary Thomas <gary@mlbassoc.com>
Date: Fri, 27 Aug 2010 09:01:20 -0600
Subject: [PATCH] Make EULA unpacking work when /opt is writeable

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta-ti/packages/ti/ti-codecs-omap3530_1.00.01.bb |    1 +
 meta-ti/packages/ti/ti-codecs-omap3530_1.01.00.bb |    1 +
 meta-ti/packages/ti/ti-dspbios.inc                |    1 +
 meta-ti/packages/ti/ti-edma3lld.inc               |    1 +
 meta-ti/packages/ti/ti-eula-unpack.inc            |    5 ++++-
 meta-ti/packages/ti/ti-xdctools.inc               |    1 +
 6 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/meta-ti/packages/ti/ti-codecs-omap3530_1.00.01.bb b/meta-ti/packages/ti/ti-codecs-omap3530_1.00.01.bb
index d6d871b..37d2679 100644
--- a/meta-ti/packages/ti/ti-codecs-omap3530_1.00.01.bb
+++ b/meta-ti/packages/ti/ti-codecs-omap3530_1.00.01.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/dv
 
 BINFILE = "cs1omap3530_setuplinux_1_00_01-44.bin"
 TI_BIN_UNPK_CMDS = "Y:Y: qY:workdir"
+TI_BIN_UNPK_WDEXT="/dvsdk/dvsdk_3_00_02_44"
 
 DEPENDS = "ti-cgt6x ti-xdctools ti-dspbios ti-codec-engine ti-linuxutils"
 
diff --git a/meta-ti/packages/ti/ti-codecs-omap3530_1.01.00.bb b/meta-ti/packages/ti/ti-codecs-omap3530_1.01.00.bb
index 57bc7c4..e113883 100644
--- a/meta-ti/packages/ti/ti-codecs-omap3530_1.01.00.bb
+++ b/meta-ti/packages/ti/ti-codecs-omap3530_1.01.00.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_tii/dvsdk/dvsdk_3_0
 
 BINFILE = "cs1omap3530_setupLinux_1_01_00-prebuilt-dvsdk3.01.00.10.bin"
 TI_BIN_UNPK_CMDS = "Y:Y: qY:workdir"
+TI_BIN_UNPK_WDEXT="/dvsdk/dvsdk_3_01_00_10"
 
 DEPENDS = "ti-cgt6x ti-xdctools ti-dspbios ti-codec-engine ti-linuxutils"
 
diff --git a/meta-ti/packages/ti/ti-dspbios.inc b/meta-ti/packages/ti/ti-dspbios.inc
index bd7bcc4..df71da1 100644
--- a/meta-ti/packages/ti/ti-dspbios.inc
+++ b/meta-ti/packages/ti/ti-dspbios.inc
@@ -15,6 +15,7 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bi
 
 BINFILE="bios_setuplinux_${PV}.bin"
 TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
+TI_BIN_UNPK_WDEXT="/bios_${PV}"
 
 do_install() {
     install -d ${D}${BIOS_INSTALL_DIR_RECIPE}
diff --git a/meta-ti/packages/ti/ti-edma3lld.inc b/meta-ti/packages/ti/ti-edma3lld.inc
index 94c0cff..344c357 100644
--- a/meta-ti/packages/ti/ti-edma3lld.inc
+++ b/meta-ti/packages/ti/ti-edma3lld.inc
@@ -13,6 +13,7 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ed
 
 BINFILE="EDMA3_LLD_setuplinux_${PV}.bin"
 TI_BIN_UNPK_CMDS="Y:workdir"
+TI_BIN_UNPK_WDEXT="/edma3_lld_${PV}"
 
 do_install() {
     install -d ${D}${EDMA3_LLD_INSTALL_DIR_RECIPE}
diff --git a/meta-ti/packages/ti/ti-eula-unpack.inc b/meta-ti/packages/ti/ti-eula-unpack.inc
index a812a85..d215b6c 100644
--- a/meta-ti/packages/ti/ti-eula-unpack.inc
+++ b/meta-ti/packages/ti/ti-eula-unpack.inc
@@ -30,6 +30,9 @@ python ti_bin_do_unpack() {
     workdir  = bb.data.getVar('WORKDIR', localdata)
     workdir  = bb.data.expand(workdir, localdata)
     os.chdir(workdir)
+    wdext  = bb.data.getVar('TI_BIN_UNPK_WDEXT', localdata)
+    wdext  = bb.data.expand(wdext, localdata)
+    wdext = workdir + '/' + wdext
 
     # Get unpack commands
     cmd_string = bb.data.getVar('TI_BIN_UNPK_CMDS', localdata)
@@ -39,7 +42,7 @@ python ti_bin_do_unpack() {
     os.chmod(binfile, 0755)
 
     # Run the InstallJammer binary and accept the EULA
-    filename = "HOME=%s ./%s --mode console" % (workdir, binfile)
+    filename = "HOME=%s ./%s --mode console --prefix %s" % (workdir, binfile, wdext)
     
     # Test executable by printing installer version or help screen (--version currently broken for some installers) 
     # - this is currently broken in some IJ installers - comment out for now
diff --git a/meta-ti/packages/ti/ti-xdctools.inc b/meta-ti/packages/ti/ti-xdctools.inc
index 4b451cf..c078e7c 100644
--- a/meta-ti/packages/ti/ti-xdctools.inc
+++ b/meta-ti/packages/ti/ti-xdctools.inc
@@ -15,6 +15,7 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rt
 
 BINFILE="xdctools_setuplinux_${PV}.bin"
 TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
+TI_BIN_UNPK_WDEXT="/xdctools_${PV}"
 
 do_install() {
     install -d ${D}${XDC_INSTALL_DIR_RECIPE}
-- 
1.6.2.5


--------------090403050609000401070108--
