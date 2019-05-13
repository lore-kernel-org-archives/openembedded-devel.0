Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8A4957C7A4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 May 2019 05:42:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,464,1549900800"; d="scan'208";a="62702021"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 May 2019 13:42:02 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 0BE9B4CDB300
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 May 2019 13:42:03 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 13 May 2019 13:42:02 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 May 2019 13:42:58 +0800
Message-ID: <20190513054258.4720-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 0BE9B4CDB300.AB922
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pyperclip: upgrade 1.6.2 -> 1.7.0
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
X-List-Received-Date: Mon, 13 May 2019 05:42:03 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-pyperclip_1.6.2.bb to python-pyperclip_1.7.0.bb.

-Upgrade from python3-pyperclip_1.6.2.bb to python3-pyperclip_1.7.0.bb.

-License-Update: updated package information.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pyperclip.inc    | 6 +++---
 ...{python-pyperclip_1.6.2.bb => python-pyperclip_1.7.0.bb} | 0
 ...ython3-pyperclip_1.6.2.bb => python3-pyperclip_1.7.0.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyperclip_1.6.2.bb => python-pyperclip_1.7.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyperclip_1.6.2.bb => python3-pyperclip_1.7.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyperclip.inc b/meta-python/recipes-devtools/python/python-pyperclip.inc
index 4ee47eef5..85a4312c2 100644
--- a/meta-python/recipes-devtools/python/python-pyperclip.inc
+++ b/meta-python/recipes-devtools/python/python-pyperclip.inc
@@ -1,9 +1,9 @@
 DESCRIPTION = "A cross-platform clipboard module for Python. (only handles plain text for now)"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=4a3129a2c1b8bdc0e2895a1ec0e2dae2"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a428356ada7737b416ec4b63dc65d581"
 
-SRC_URI[md5sum] = "3680607974f99d6e4411b102358b1884"
-SRC_URI[sha256sum] = "43496f0a1f363a5ecfc4cda5eba6a2a3d5056fe6c7ffb9a99fbb1c5a3c7dea05"
+SRC_URI[md5sum] = "6bbb8598579cc3ee50554b4c59d0cfae"
+SRC_URI[sha256sum] = "979325468ccf682104d5dcaf753f869868100631301d3e72f47babdea5700d1c"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pyperclip_1.6.2.bb b/meta-python/recipes-devtools/python/python-pyperclip_1.7.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyperclip_1.6.2.bb
rename to meta-python/recipes-devtools/python/python-pyperclip_1.7.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyperclip_1.6.2.bb b/meta-python/recipes-devtools/python/python3-pyperclip_1.7.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyperclip_1.6.2.bb
rename to meta-python/recipes-devtools/python/python3-pyperclip_1.7.0.bb
-- 
2.20.1




