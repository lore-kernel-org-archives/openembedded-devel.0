Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TjAP5-0001uU-GE
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 16:08:55 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Dec 2012 06:53:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,274,1355126400"; d="scan'208";a="180451172"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.1])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Dec 2012 06:53:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Dec 2012 14:53:36 +0000
Message-Id: <e356cf5f6dddf77bf7310e63198f135eac0471f1.1355410208.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1355410208.git.paul.eggleton@linux.intel.com>
References: <cover.1355410208.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1355410208.git.paul.eggleton@linux.intel.com>
References: <cover.1355410208.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH 2/3] Fix erroneous use of "startline" in LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 13 Dec 2012 15:08:55 -0000

"beginline" is the correct parameter name. Checksums have been updated
where necessary (i.e. if the beginning line was something other than the
default of 1).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb |    4 ++--
 meta-networking/recipes-support/mtr/mtr_0.82.bb          |    2 +-
 meta-networking/recipes-support/tunctl/tunctl.inc        |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
index 40294b0..af48455 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
@@ -8,8 +8,8 @@ and should not be enabled unless it is expressly needed."
 DEPENDS = "tcp-wrappers readline"
 SECTION = "network"
 LICENSE = "BSD-4-Clause"
-LIC_FILES_CHKSUM = "file://MCONFIG.in;startline=1;endline=9;md5=c28ba5adb43041fae4629db05c83cbdd \
-                    file://tftp/tftp.c;startline=1;endline=32;md5=988c1cba99d70858a26cd877209857f4"
+LIC_FILES_CHKSUM = "file://MCONFIG.in;beginline=1;endline=9;md5=c28ba5adb43041fae4629db05c83cbdd \
+                    file://tftp/tftp.c;beginline=1;endline=32;md5=988c1cba99d70858a26cd877209857f4"
 
 PR = "r0"
 
diff --git a/meta-networking/recipes-support/mtr/mtr_0.82.bb b/meta-networking/recipes-support/mtr/mtr_0.82.bb
index c6d5152..3a93948 100644
--- a/meta-networking/recipes-support/mtr/mtr_0.82.bb
+++ b/meta-networking/recipes-support/mtr/mtr_0.82.bb
@@ -5,7 +5,7 @@ DEPENDS = "ncurses"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-                    file://mtr.c;startline=5;endline=16;md5=87105f8fe9675e897e074869afaafa6f"
+                    file://mtr.c;beginline=5;endline=16;md5=56e390ced194aff352eefab404883057"
 
 SRC_URI = "ftp://ftp.bitwizard.nl/mtr/mtr-${PV}.tar.gz \
            file://no-gtk.patch"
diff --git a/meta-networking/recipes-support/tunctl/tunctl.inc b/meta-networking/recipes-support/tunctl/tunctl.inc
index 952af24..29aed44 100644
--- a/meta-networking/recipes-support/tunctl/tunctl.inc
+++ b/meta-networking/recipes-support/tunctl/tunctl.inc
@@ -1,7 +1,7 @@
 SUMMARY = "Tool for controlling the Linux TUN/TAP driver"
 SECTION = "net"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://tunctl.c;startline=1;endline=4;md5=ff3a09996bc5fff6bc5d4e0b4c28f999"
+LIC_FILES_CHKSUM = "file://tunctl.c;beginline=1;endline=4;md5=ff3a09996bc5fff6bc5d4e0b4c28f999"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/tunctl/tunctl-${PV}.tar.gz"
 
-- 
1.7.10.4



