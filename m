Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AD96F71C0F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 02:18:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7G2IhON022961
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 19:18:43 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 15 Aug 2017 19:18:42 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Aug 2017 19:18:42 -0700
Message-ID: <20170816021842.141532-1-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] tcpdump: update to 4.9.1 to fix CVE-2017-11108
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
X-List-Received-Date: Wed, 16 Aug 2017 02:18:42 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Summary for 4.9.1 tcpdump release
  CVE-2017-11108/Fix bounds checking for STP.
  Make assorted documentation updates and fix a few typos in tcpdump output.
  Fixup -C for file size >2GB (GH #488).
  Show AddressSanitizer presence in version output.
  Fix a bug in test scripts (exposed in GH #613).
  On FreeBSD adjust Capsicum capabilities for netmap.
  On Linux fix a use-after-free when the requested interface does not exist.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../recipes-support/tcpdump/{tcpdump_4.9.0.bb => tcpdump_4.9.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.9.0.bb => tcpdump_4.9.1.bb} (90%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.0.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.1.bb
similarity index 90%
rename from meta-networking/recipes-support/tcpdump/tcpdump_4.9.0.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.9.1.bb
index 43e388ccc..261c78427 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.0.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.1.bb
@@ -13,8 +13,8 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRC_URI[md5sum] = "2b83364eef53b63ca3181b4eb56dab0c"
-SRC_URI[sha256sum] = "eae98121cbb1c9adbedd9a777bf2eae9fa1c1c676424a54740311c8abcee5a5e"
+SRC_URI[md5sum] = "1e0293210b0dea5ef18e88e4150394b7"
+SRC_URI[sha256sum] = "f9448cf4deb2049acf713655c736342662e652ef40dbe0a8f6f8d5b9ce5bd8f3"
 
 export LIBS=" -lpcap"
 
-- 
2.13.0


