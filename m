Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2BAFC7275B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 11:01:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jan 2015 03:01:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="646381139"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2015 03:01:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 11:00:52 +0000
Message-Id: <3e885d401bb47a7fa5a53b39101bb729da7d522f.1420455602.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420455602.git.paul.eggleton@linux.intel.com>
References: <cover.1420455602.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420455602.git.paul.eggleton@linux.intel.com>
References: <cover.1420455602.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 08/10] rfkill: update to 0.5
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
X-List-Received-Date: Mon, 05 Jan 2015 11:01:32 -0000

Also make SUMMARY a bit more useful.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-connectivity/rfkill/{rfkill_0.4.bb => rfkill_0.5.bb}  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-connectivity/rfkill/{rfkill_0.4.bb => rfkill_0.5.bb} (76%)

diff --git a/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb b/meta-oe/recipes-connectivity/rfkill/rfkill_0.5.bb
similarity index 76%
rename from meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
rename to meta-oe/recipes-connectivity/rfkill/rfkill_0.5.bb
index 3b2943c..3e64476 100644
--- a/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
+++ b/meta-oe/recipes-connectivity/rfkill/rfkill_0.5.bb
@@ -1,20 +1,20 @@
-SUMMARY = "rfkill CLI utility"
+SUMMARY = "Radio enable/disable command line utility"
 HOMEPAGE = "http://linuxwireless.org/en/users/Documentation/rfkill"
 SECTION = "base"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c6036d0eb7edbfced28c4160e5d3fa94"
-PR = "r1"
 
 SRC_URI = "http://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.bz2 \
            file://0001-rfkill-makefile-don-t-use-t-the-OE-install-wrapper-d.patch \
            file://dont.call.git.rev-parse.on.parent.dir.patch"
 
-SRC_URI[md5sum] = "727892c0fb35c80ee3849fbe89b45350"
-SRC_URI[sha256sum] = "ca10e4827a5f0a36e093aee6ad81b5febf81f8097d7d858889ac51ff364168c1"
+SRC_URI[md5sum] = "b957713a6cfbcd8ac0e94420aeddcf1a"
+SRC_URI[sha256sum] = "3e160cca504a53679f2b3254f31c53a4fb38a021bc50fed8eb57a436d33dfa07"
 
 do_compile() {
     oe_runmake
 }
+
 do_install() {
     oe_runmake DESTDIR=${D} install
 }
-- 
1.9.3


