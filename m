Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1Oqrzh-0005zk-9t
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 20:25:20 +0200
Received: by yxk30 with SMTP id 30so3315645yxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 11:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=A2XrVt+HQ2WlUE9fvCwFfWHdHmEu3RJRFan8ytfYjw8=;
	b=ejcAoI0Mhg9MqzWgdHQwz2C4l66Ab+ltG6EJJipDyVyvlFiIMlwyWs7hf8Tg/x5RkI
	HFKRrD/lVA8SGqzybdqAZr0LVg6EBPMAee2j1MJ48CrxgSHIEVNcS/y30uBUlyEu222k
	goi2tT+IZ+byKpZ3Dk9CQcwQOoeB1UJajpTdE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=JAogTbV/Gzl0fj8gdkywf8Bffb3bRtfQu7nGThfXInJSZbE8QS0ZCmX4GQJ1gdzVkn
	xaSpHcFsuQHvNED+V+TOkJS4Hn+LOswVFAArzzqcaAOhdnJWG//4N1XMB2df2F543Ma3
	aoG8EfEDBOvi4bgQrU6p5uJmy0mu7CjRF95kA=
Received: by 10.150.146.15 with SMTP id t15mr909265ybd.305.1283365445550;
	Wed, 01 Sep 2010 11:24:05 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id u42sm10435313yba.0.2010.09.01.11.24.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Sep 2010 11:24:04 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Sep 2010 13:15:08 -0500
Message-Id: <1283364908-21950-2-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1283364908-21950-1-git-send-email-chase.maupin@ti.com>
References: <1283364908-21950-1-git-send-email-chase.maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] ti-graphics-sdk: display full license during build
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
X-List-Received-Date: Wed, 01 Sep 2010 18:25:21 -0000

* Change the TI_BIN_UNPK_CMDS to feed in enought spaces to
  display the entire EULA during the build process.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/powervr-drivers/libgles-omap3.inc          |    7 +++++--
 .../omap3-sgx-modules_1.4.14.2514.bb               |    5 ++++-
 .../omap3-sgx-modules_1.4.14.2616.bb               |    5 ++++-
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/recipes/powervr-drivers/libgles-omap3.inc b/recipes/powervr-drivers/libgles-omap3.inc
index 5b248b0..1c00708 100644
--- a/recipes/powervr-drivers/libgles-omap3.inc
+++ b/recipes/powervr-drivers/libgles-omap3.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "libGLES for the omap3"
 LICENSE = "proprietary-binary"
 
-PR = "r6"
+PR = "r7"
 
 COMPATIBLE_MACHINE = "(dm37x-evm|am37x-evm|am3517-evm|beagleboard|cm-t35|igep0020|omap3-pandora|omap3-touchbook|omap3evm|omapzoom|omapzoom2|overo|palmpre)"
 
@@ -37,7 +37,10 @@ SRC_URI = "http://install.source.dir.local/OMAP35x_Graphics_SDK_setuplinux_${SGX
 S = "${WORKDIR}/OMAP35x_Graphics_SDK_${SGXPV}"
 
 # Logic to unpack installjammer file
-TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
+# NOTE: It takes 16 spaces to display the full EULA.  Too many spaces
+#       will cause the package to be installed into the wrong directory
+#       and you will see build failures.  This EULA should not change.
+TI_BIN_UNPK_CMDS="Y:                qY:workdir:Y"
 require ../ti/ti-eula-unpack.inc
 
 BINLOCATION ?= "${S}/gfx_rel"
diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb
index a2fcf22..350dc09 100644
--- a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb
+++ b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb
@@ -7,7 +7,10 @@ PR_append = "a"
 # http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/3_01_00_02/index_FDS.html
 # see libgles-omap3.inc for detailed installation instructions
 
-TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
+# NOTE: It takes 16 spaces to display the full EULA.  Too many spaces
+#       will cause the package to be installed into the wrong directory
+#       and you will see build failures.  This EULA should not change.
+TI_BIN_UNPK_CMDS="Y:                qY:workdir:Y"
 require ../ti/ti-eula-unpack.inc
 
 SGXPV = "3_01_00_02"
diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
index 4ed2540..ba6e925 100644
--- a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
+++ b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
@@ -7,7 +7,10 @@ PR_append = "c"
 # http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/3_01_00_06/index_FDS.html
 # see libgles-omap3.inc for detailed installation instructions
 
-TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
+# NOTE: It takes 16 spaces to display the full EULA.  Too many spaces
+#       will cause the package to be installed into the wrong directory
+#       and you will see build failures.  This EULA should not change.
+TI_BIN_UNPK_CMDS="Y:                qY:workdir:Y"
 require ../ti/ti-eula-unpack.inc
 
 SGXPV = "3_01_00_06"
-- 
1.7.0.4



