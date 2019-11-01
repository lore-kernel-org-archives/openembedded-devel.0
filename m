Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5F30A7FC10
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 06:39:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,254,1569254400"; d="scan'208";a="77783408"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Nov 2019 14:39:52 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 1201141B7076
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 14:31:50 +0800 (CST)
Received: from localhost.localdomain (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 1 Nov 2019 14:39:50 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Nov 2019 14:40:02 +0800
Message-ID: <20191101064002.22685-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 1201141B7076.A7FA0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pycryptodome: upgrade 3.4.11 -> 3.9.0
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
X-List-Received-Date: Fri, 01 Nov 2019 06:39:53 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Add Apache 2.0 license.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pycryptodome.inc | 6 +++---
 ...-pycryptodome_3.4.11.bb => python-pycryptodome_3.9.0.bb} | 0
 ...pycryptodome_3.4.11.bb => python3-pycryptodome_3.9.0.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pycryptodome_3.4.11.bb => python-pycryptodome_3.9.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pycryptodome_3.4.11.bb => python3-pycryptodome_3.9.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pycryptodome.inc b/meta-python/recipes-devtools/python/python-pycryptodome.inc
index c4969f966..113e811b1 100644
--- a/meta-python/recipes-devtools/python/python-pycryptodome.inc
+++ b/meta-python/recipes-devtools/python/python-pycryptodome.inc
@@ -3,10 +3,10 @@ DESCRIPTION = "PyCryptodome is a self-contained Python package of low-level\
  cryptographic primitives."
 HOMEPAGE = "http://www.pycryptodome.org"
 LICENSE = "PD & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=775fe77831c03bf82f35abc0e230d4c1"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=6dc0e2a13d2f25d6f123c434b761faba"
 
-SRC_URI[md5sum] = "a2587b6381b0ef4eb960cea1e7507d04"
-SRC_URI[sha256sum] = "c5dd29e9f1b733e74311bf95d0e544e91bd1d14bc0366e8f443562d8d9920b7d"
+SRC_URI[md5sum] = "97ee98c95f350927bcc0e937976f17ee"
+SRC_URI[sha256sum] = "dbeb08ad850056747aa7d5f33273b7ce0b9a77910604a1be7b7a6f2ef076213f"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pycryptodome_3.4.11.bb b/meta-python/recipes-devtools/python/python-pycryptodome_3.9.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pycryptodome_3.4.11.bb
rename to meta-python/recipes-devtools/python/python-pycryptodome_3.9.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pycryptodome_3.4.11.bb b/meta-python/recipes-devtools/python/python3-pycryptodome_3.9.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pycryptodome_3.4.11.bb
rename to meta-python/recipes-devtools/python/python3-pycryptodome_3.9.0.bb
-- 
2.20.1




