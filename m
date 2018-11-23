Return-Path: <craig.mcqueen@innerrange.com>
X-Greylist: delayed 329 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 Nov 2018 05:09:16 UTC
Received: from remote.innerrange.com (122-143-132.dsl.connexus.net.au
	[203.122.143.132])
	by mail.openembedded.org (Postfix) with ESMTP id 31AF56C645
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 05:09:16 +0000 (UTC)
Received: from ir-craig-vm1.corp.innerrange.com.au (192.168.106.23) by
	IR-CENTRAL.corp.innerrange.com (192.168.1.12) with Microsoft SMTP
	Server id 8.1.436.0; Fri, 23 Nov 2018 16:03:43 +1100
From: Craig McQueen <craig.mcqueen@innerrange.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Nov 2018 16:03:03 +1100
Message-ID: <20181123050302.4692-1-craig.mcqueen@innerrange.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-11.1.0.1278-8.200.1013-24240.004
X-TM-AS-Result: No--0.733900-5.000000-31
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
Subject: [meta-python][PATCH] python3-multidict: Workaround for broken make clean
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
X-List-Received-Date: Fri, 23 Nov 2018 05:09:16 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Note, the issue is fixed in v4.0.0.
https://github.com/aio-libs/multidict/issues/194

Signed-off-by: Craig McQueen <craig.mcqueen@innerrange.com>
---
 .../recipes-devtools/python/python3-multidict_3.3.2.bb        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_3.3.2.bb b/meta-python/recipes-devtools/python/python3-multidict_3.3.2.bb
index 7f9cd5564..e65d7d4f2 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_3.3.2.bb
@@ -7,3 +7,7 @@ inherit pypi setuptools3
 
 SRC_URI[md5sum] = "06ca91d993de2d04c7ee6df0cbb44ea2"
 SRC_URI[sha256sum] = "f82e61c7408ed0dce1862100db55595481911f159d6ddec0b375d35b6449509b"
+
+# Work-around for broken make clean. Note this is fixed in v4.0.0.
+# https://github.com/aio-libs/multidict/issues/194
+CLEANBROKEN = "1"
-- 
2.19.1


