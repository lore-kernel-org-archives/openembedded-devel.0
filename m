Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5A39E7275B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 11:01:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jan 2015 03:01:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="646381141"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2015 03:01:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 11:00:53 +0000
Message-Id: <e651ee653fc441c06432689de86bdb16f64d61c0.1420455602.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420455602.git.paul.eggleton@linux.intel.com>
References: <cover.1420455602.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420455602.git.paul.eggleton@linux.intel.com>
References: <cover.1420455602.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 09/10] picocom: update to 1.7
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

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-support/picocom/{picocom_1.6.bb => picocom_1.7.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/picocom/{picocom_1.6.bb => picocom_1.7.bb} (67%)

diff --git a/meta-oe/recipes-support/picocom/picocom_1.6.bb b/meta-oe/recipes-support/picocom/picocom_1.7.bb
similarity index 67%
rename from meta-oe/recipes-support/picocom/picocom_1.6.bb
rename to meta-oe/recipes-support/picocom/picocom_1.7.bb
index 6b5200c..8141106 100644
--- a/meta-oe/recipes-support/picocom/picocom_1.6.bb
+++ b/meta-oe/recipes-support/picocom/picocom_1.7.bb
@@ -4,7 +4,10 @@ LICENSE = "GPLv2+"
 HOMEPAGE = "http://code.google.com/p/picocom/"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=393a5ca445f6965873eca0259a17f833"
 
-SRC_URI = "http://picocom.googlecode.com/files/picocom-1.6.tar.gz"
+SRC_URI = "http://picocom.googlecode.com/files/picocom-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "8eaba1d31407e8408674d6e57af447ef"
+SRC_URI[sha256sum] = "d0f31c8f7a215a76922d30c81a52b9a2348c89e02a84935517002b3bc2c1129e"
 
 CPPFLAGS_append = '-DVERSION_STR=\\"${PV}\\" -DUUCP_LOCK_DIR=\\"/var/lock\\" -DHIGH_BAUD'
 
@@ -13,5 +16,3 @@ do_install () {
     install -m 0755 ${PN} pcasc pcxm pcym pczm ${D}${bindir}/
 }
 
-SRC_URI[md5sum] = "426c3d30b82cbc80b0dafdccd6020c6c"
-SRC_URI[sha256sum] = "df5774072de805ff06c6b1420dbcc932b1b00e919b49e22a7be14bcad5a0b3a1"
-- 
1.9.3


