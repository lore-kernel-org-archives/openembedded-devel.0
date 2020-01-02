Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id EAA727FC09
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 05:23:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,385,1571673600"; d="scan'208";a="81229644"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Jan 2020 13:23:01 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 59A3549E9310
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 13:14:04 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 2 Jan 2020 13:22:57 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 2 Jan 2020 13:22:57 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Jan 2020 13:24:14 +0800
Message-ID: <20200102052414.8686-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 59A3549E9310.A6CF1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-parse: upgrade 1.12.1 -> 1.14.0
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
X-List-Received-Date: Thu, 02 Jan 2020 05:23:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-parse.inc        | 6 +++---
 .../{python-parse_1.12.1.bb => python-parse_1.14.0.bb}      | 0
 .../{python3-parse_1.12.1.bb => python3-parse_1.14.0.bb}    | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-parse_1.12.1.bb => python-parse_1.14.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-parse_1.12.1.bb => python3-parse_1.14.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-parse.inc b/meta-python/recipes-devtools/python/python-parse.inc
index ccd5a9377..5ce67f11d 100644
--- a/meta-python/recipes-devtools/python/python-parse.inc
+++ b/meta-python/recipes-devtools/python/python-parse.inc
@@ -1,10 +1,10 @@
 SUMMARY = "Parse strings using a specification based on the Python format() syntax"
 HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://parse.py;beginline=1317;endline=1337;md5=fa03bae3f51a2db25e239e869c647437"
+LIC_FILES_CHKSUM = "file://parse.py;beginline=1325;endline=1345;md5=fa03bae3f51a2db25e239e869c647437"
 
-SRC_URI[md5sum] = "8fc634769f1d841f14a52dd731ca447a"
-SRC_URI[sha256sum] = "a5fca7000c6588d77bc65c28f3f21bfce03b5e44daa8f9f07c17fe364990d717"
+SRC_URI[md5sum] = "07cbb5ba1025cbfe92fc3376c372dda5"
+SRC_URI[sha256sum] = "95a4f4469e37c57b5e924629ac99926f28bee7da59515dc5b8078c4c3e779249"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-parse_1.12.1.bb b/meta-python/recipes-devtools/python/python-parse_1.14.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-parse_1.12.1.bb
rename to meta-python/recipes-devtools/python/python-parse_1.14.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-parse_1.12.1.bb b/meta-python/recipes-devtools/python/python3-parse_1.14.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-parse_1.12.1.bb
rename to meta-python/recipes-devtools/python/python3-parse_1.14.0.bb
-- 
2.20.1




