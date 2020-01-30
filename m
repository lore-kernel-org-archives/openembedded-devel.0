Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 56E1860D32
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 21:04:10 +0000 (UTC)
IronPort-SDR: VK4cCENdgng4YlMQN0OQUrjDWhngrTtVUZpwzMagOIIh+cykUBTfrf//NiqbpvN4JpOfUIALg0
	WE58457BpQR5s+/CrbKL0YmNn5V/OyC3zyLuRmSXNhYs2t3BBN9+GIwnS/4S9h+87pASbaF3wW
	uHHZs9resiTkylTyF+GCDBYujbnKN0kT8SldjGtXyrHuP6ELc0Awx82MoKTXiziT2H9M0Kfjwc
	Iqe456vMvqTZFBgFroD/4p2lQYljGYf1Og/z01JcD+ma/UgeeDkAJmXBRTvd0YCwlUWlum5ZMl
	twI=
X-IronPort-AV: E=Sophos;i="5.70,382,1574118000"; 
   d="scan'208";a="4790768"
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Jan 2020 22:04:08 +0100
Message-ID: <20200130210409.29802-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [meta-oe][zeus][PATCH 1/2] libldb: Do not require the "pam" distro feature to be enabled
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Jan 2020 09:28:08 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

It was only added because samba was a dependency, but was not removed
again when the dependency on samba was removed in commit 6207331f.

This effectively reverts commit a190c2e3.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/libldb/libldb_1.5.5.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/libldb/libldb_1.5.5.bb b/meta-networking/recipes-support/libldb/libldb_1.5.5.bb
index b19c964d8..9a93e66b6 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.5.5.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.5.5.bb
@@ -36,8 +36,7 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
 SRC_URI[md5sum] = "339a41ac9efaec680e6d1469dd9aa35b"
 SRC_URI[sha256sum] = "199f5861aa863f538ec66d5fa95ecc13254a2030c53daf0e47363fa9ba235c68"
 
-inherit waf-samba distro_features_check
-REQUIRED_DISTRO_FEATURES = "pam"
+inherit waf-samba
 
 S = "${WORKDIR}/ldb-${PV}"
 
-- 
2.21.1


