Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0DBC578961
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 03:36:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="38026084"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Mar 2018 11:36:29 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 07EAA48AE76A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 11:36:30 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 21 Mar 2018 11:36:28 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Mar 2018 11:36:17 +0800
Message-ID: <1521603377-34881-12-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521603377-34881-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1521603377-34881-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 07EAA48AE76A.A656A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-pytest: 3.4.1 -> 3.4.2
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
X-List-Received-Date: Wed, 21 Mar 2018 03:36:29 -0000
Content-Type: text/plain

1.Upgrade python-pytest from 3.4.1 to 3.4.2.
2.Modify pytest_version_fix.patch, since the data has been changed.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pytest.inc                 | 4 ++--
 .../recipes-devtools/python/python-pytest/pytest_version_fix.patch    | 2 +-
 .../python/{python-pytest_3.4.1.bb => python-pytest_3.4.2.bb}         | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest_3.4.1.bb => python-pytest_3.4.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index 60ff830..4feb9a0 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pytest.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c39b24965f4aef64222cb35de9d47cc4"
 
-SRC_URI[md5sum] = "6768537cbb150022387c565051904a1c"
-SRC_URI[sha256sum] = "9ddcb879c8cc859d2540204b5399011f842e5e8823674bf429f70ada281b3cc6"
+SRC_URI[md5sum] = "1b83a25d45fad893f430fc5031653c56"
+SRC_URI[sha256sum] = "117bad36c1a787e1a8a659df35de53ba05f9f3398fb9e4ac17e80ad5903eb8c5"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch \
                    file://pytest_version_fix.patch "
diff --git a/meta-python/recipes-devtools/python/python-pytest/pytest_version_fix.patch b/meta-python/recipes-devtools/python/python-pytest/pytest_version_fix.patch
index 908f862..b373d93 100644
--- a/meta-python/recipes-devtools/python/python-pytest/pytest_version_fix.patch
+++ b/meta-python/recipes-devtools/python/python-pytest/pytest_version_fix.patch
@@ -36,7 +36,7 @@ Index: pytest-3.2.2/setup.py
 +        return version_match.group(1)
 +    raise RuntimeError("Unable to find version string.")
  
- def has_environment_marker_support():
+ def get_environment_marker_support_level():
      """
 @@ -59,9 +72,7 @@ def main():
          name='pytest',
diff --git a/meta-python/recipes-devtools/python/python-pytest_3.4.1.bb b/meta-python/recipes-devtools/python/python-pytest_3.4.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest_3.4.1.bb
rename to meta-python/recipes-devtools/python/python-pytest_3.4.2.bb
-- 
2.7.4




