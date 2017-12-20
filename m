Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A25576E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Dec 2017 19:29:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBKJTutT019656
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Dec 2017 11:29:56 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 20 Dec 2017 11:29:55 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Dec 2017 14:29:50 -0500
Message-ID: <1513798190-31437-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-twisted: avoid downloading build dependencies
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
X-List-Received-Date: Wed, 20 Dec 2017 19:29:57 -0000
Content-Type: text/plain

setup.py will attempt to download python-incremental, as it is not
present in the sysroot. This is at the least wrong since some random
version of python-incremental will be used to build against (akin to
host contamination) and at most a build failure (when network access
is unavailable). So make python-incrementa-native available and a
DEPENDS.

Unfortunately python-incremental has a dependency on python-twisted
and vice versa. So we need to forcefully break this circular
dependency. Fortunately this doesn't affect the build of
python-twisted. Unfortunately if anyone else attempts to use
python-incremental-native there might be issues should it ever run the
code that does the import of twisted. This is not an issue now and a
comment has been added to hopefully make this issue known to anyone
else coming along at a later time.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

*NOTE*
This should be applied to the rocko branch as well after
my previous 8 patch python-twisted series is applied.


 meta-python/recipes-devtools/python/python-incremental.inc | 6 ++++++
 meta-python/recipes-devtools/python/python-twisted.inc     | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-incremental.inc b/meta-python/recipes-devtools/python/python-incremental.inc
index 3675458..b63fac9 100644
--- a/meta-python/recipes-devtools/python/python-incremental.inc
+++ b/meta-python/recipes-devtools/python/python-incremental.inc
@@ -12,3 +12,9 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-twisted \
     ${PYTHON_PN}-click \
 "
+
+# -native is needed to build python[3]-twisted, however, we need to take steps to
+# prevent a circular dependency. The build apparently does not use the part of
+# python-incremental which uses python-twisted, so this hack is OK.
+RDEPENDS_${PYTHON_PN}-incremental-native_remove = "${PYTHON_PN}-twisted-native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-twisted.inc b/meta-python/recipes-devtools/python/python-twisted.inc
index 0dd584f..6480ad5 100644
--- a/meta-python/recipes-devtools/python/python-twisted.inc
+++ b/meta-python/recipes-devtools/python/python-twisted.inc
@@ -39,6 +39,10 @@ PACKAGES =+ "\
     ${PN}-bin \
 "
 
+DEPENDS += " \
+    ${PYTHON_PN}-incremental-native \
+"
+
 RDEPENDS_${PN} = "\
     ${PN}-bin \
     ${PN}-core \
-- 
2.7.4


