Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 98AA979B57
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 04:38:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,267,1571673600"; d="scan'208";a="79419728"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Dec 2019 12:38:20 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 8D43E4CE20E1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 12:29:52 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 2 Dec 2019 12:38:26 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Dec 2019 03:07:20 -0800
Message-ID: <1575284842-97439-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575284842-97439-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1575284842-97439-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 8D43E4CE20E1.A9C0D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH v2] python-pyasn1: upgrade 0.4.7 -> 0.4.8
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
X-List-Received-Date: Mon, 02 Dec 2019 04:38:20 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pyasn1.inc                 | 4 ++--
 .../python/{python-pyasn1_0.4.7.bb => python-pyasn1_0.4.8.bb}         | 0
 .../python/{python3-pyasn1_0.4.7.bb => python3-pyasn1_0.4.8.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyasn1_0.4.7.bb => python-pyasn1_0.4.8.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyasn1_0.4.7.bb => python3-pyasn1_0.4.8.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyasn1.inc b/meta-python/recipes-devtools/python/python-pyasn1.inc
index 014fcf9..d74c2fe 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1.inc
+++ b/meta-python/recipes-devtools/python/python-pyasn1.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=a14482d15c2249de3b6f0e8a47e021fd"
 
-SRC_URI[md5sum] = "50290e833395016c49903f4f9c7e47e5"
-SRC_URI[sha256sum] = "a9495356ca1d66ed197a0f72b41eb1823cf7ea8b5bd07191673e8147aecf8604"
+SRC_URI[md5sum] = "dffae4ff9f997a83324b3f33fe62be54"
+SRC_URI[sha256sum] = "aef77c9fb94a3ac588e87841208bdec464471d9871bd5050a287cc9a475cd0ba"
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-codecs \
diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.4.7.bb b/meta-python/recipes-devtools/python/python-pyasn1_0.4.8.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyasn1_0.4.7.bb
rename to meta-python/recipes-devtools/python/python-pyasn1_0.4.8.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1_0.4.7.bb b/meta-python/recipes-devtools/python/python3-pyasn1_0.4.8.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyasn1_0.4.7.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1_0.4.8.bb
-- 
2.7.4




