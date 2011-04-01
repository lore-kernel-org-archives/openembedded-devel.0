Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1Q5fek-0004KW-V1
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 16:48:59 +0200
Received: by vws2 with SMTP id 2so3119509vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 07:46:57 -0700 (PDT)
Received: by 10.220.62.201 with SMTP id y9mr1034288vch.250.1301669215931;
	Fri, 01 Apr 2011 07:46:55 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id p29sm593213vcr.7.2011.04.01.07.46.55
	(version=SSLv3 cipher=OTHER); Fri, 01 Apr 2011 07:46:55 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2011 09:46:53 -0500
Message-Id: <1301669213-5566-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
Subject: [PATCH] u-boot: BeagleBoard: add rev xM-C detection
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
X-List-Received-Date: Fri, 01 Apr 2011 14:49:00 -0000


Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 ...0017-BeagleBoard-add-xM-rev-C-to-ID-table.patch |   68 ++++++++++++++++++++
 recipes/u-boot/u-boot_git.bb                       |    3 +-
 2 files changed, 70 insertions(+), 1 deletions(-)
 create mode 100644 recipes/u-boot/u-boot-git/beagleboard/0017-BeagleBoard-add-xM-rev-C-to-ID-table.patch

diff --git a/recipes/u-boot/u-boot-git/beagleboard/0017-BeagleBoard-add-xM-rev-C-to-ID-table.patch b/recipes/u-boot/u-boot-git/beagleboard/0017-BeagleBoard-add-xM-rev-C-to-ID-table.patch
new file mode 100644
index 0000000..1125c88
--- /dev/null
+++ b/recipes/u-boot/u-boot-git/beagleboard/0017-BeagleBoard-add-xM-rev-C-to-ID-table.patch
@@ -0,0 +1,68 @@
+From fd6e8e5ca04fea310ff4f03faa7747d061217cba Mon Sep 17 00:00:00 2001
+From: Jason Kridner <jkridner@beagleboard.org>
+Date: Wed, 30 Mar 2011 10:44:17 -0500
+Subject: [PATCH] BeagleBoard: add xM rev C to ID table
+Cc: Sandeep Paulraj <s-paulraj@ti.com>
+
+A simple addition to the revision IDs.
+
+This patch depends upon http://patchwork.ozlabs.org/patch/85303/.
+
+Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
+---
+ board/ti/beagle/beagle.c |   12 ++++++++++++
+ board/ti/beagle/beagle.h |    1 +
+ 2 files changed, 13 insertions(+), 0 deletions(-)
+
+diff --git a/board/ti/beagle/beagle.c b/board/ti/beagle/beagle.c
+index 905b151..0596443 100644
+--- a/board/ti/beagle/beagle.c
++++ b/board/ti/beagle/beagle.c
+@@ -168,6 +168,7 @@ void display_init(void)
+ 		break;
+ 	case REVISION_XM_A:
+ 	case REVISION_XM_B:
++	case REVISION_XM_C:
+ 	default:
+ 		omap3_dss_panel_config(&dvid_cfg_xm);
+ 		break;
+@@ -227,6 +228,16 @@ int misc_init_r(void)
+ 					TWL4030_PM_RECEIVER_VAUX2_DEV_GRP,
+ 					TWL4030_PM_RECEIVER_DEV_GRP_P1);
+ 		break;
++	case REVISION_XM_C:
++		printf("Beagle xM Rev C\n");
++		setenv("beaglerev", "xMC");
++		MUX_BEAGLE_XM();
++		/* Set VAUX2 to 1.8V for EHCI PHY */
++		twl4030_pmrecv_vsel_cfg(TWL4030_PM_RECEIVER_VAUX2_DEDICATED,
++					TWL4030_PM_RECEIVER_VAUX2_VSEL_18,
++					TWL4030_PM_RECEIVER_VAUX2_DEV_GRP,
++					TWL4030_PM_RECEIVER_DEV_GRP_P1);
++		break;
+ 	default:
+ 		printf("Beagle unknown 0x%02x\n", get_board_revision());
+ 		MUX_BEAGLE_XM();
+@@ -372,6 +383,7 @@ int do_userbutton (cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
+ 		break;
+ 	case REVISION_XM_A:
+ 	case REVISION_XM_B:
++	case REVISION_XM_C:
+ 	default:
+ 		gpio = 4;
+ 		break;
+diff --git a/board/ti/beagle/beagle.h b/board/ti/beagle/beagle.h
+index bdf2a6f..f31ce31 100644
+--- a/board/ti/beagle/beagle.h
++++ b/board/ti/beagle/beagle.h
+@@ -41,6 +41,7 @@ const omap3_sysinfo sysinfo = {
+ #define REVISION_C4	0x5
+ #define REVISION_XM_A	0x0
+ #define REVISION_XM_B	0x1
++#define REVISION_XM_C	0x2
+ 
+ /*
+  * IEN  - Input Enable
+-- 
+1.5.6.4
+
diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
index b99e650..9c5fa13 100644
--- a/recipes/u-boot/u-boot_git.bb
+++ b/recipes/u-boot/u-boot_git.bb
@@ -1,5 +1,5 @@
 require u-boot.inc
-PR = "r74"
+PR = "r75"
 
 FILESPATHPKG =. "u-boot-git:"
 
@@ -42,6 +42,7 @@ SRC_URI_beagleboard = "git://www.denx.de/git/u-boot.git;protocol=git \
                        file://0014-Corrected-LED-name-match-finding-avoiding-extraneous.patch \
                        file://0015-omap3_beagle-Switch-default-console-from-ttyS2-to-tt.patch \
                        file://0016-BeagleBoard-Load-kernel-via-MMC-ext2-not-fat.patch \
+		       file://0017-BeagleBoard-add-xM-rev-C-to-ID-table.patch \
                        file://fw_env.config \
 "
 SRCREV_beagleboard = "c7977858dcf1f656cbe91ea0dc3cb9139c6a8cc8"
-- 
1.5.6.4



