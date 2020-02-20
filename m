Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0248D60B85
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 17:34:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01KHYV1d012475
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 09:34:31 -0800 (PST)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 20 Feb 2020 09:34:31 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Feb 2020 09:34:31 -0800
Message-ID: <20200220173431.23452-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-python2][PATCH 1/1] python-lxml: fix installation
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
X-List-Received-Date: Thu, 20 Feb 2020 17:34:31 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Inherit setuptools before adding to variables defined in it.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 recipes-devtools/python/python-lxml_4.4.2.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/recipes-devtools/python/python-lxml_4.4.2.bb b/recipes-devtools/python/python-lxml_4.4.2.bb
index 911ba58..0f9cdf7 100644
--- a/recipes-devtools/python/python-lxml_4.4.2.bb
+++ b/recipes-devtools/python/python-lxml_4.4.2.bb
@@ -21,6 +21,11 @@ SRC_URI[sha256sum] = "eff69ddbf3ad86375c344339371168640951c302450c5d3e9936e98d64
 
 DEPENDS += "libxml2 libxslt"
 
+
+inherit setuptools
+
+# add to the defaults which are set in the setuptools bbclass
+#
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
                      --with-xml2-config='pkg-config libxml-2.0' \
@@ -31,7 +36,7 @@ DISTUTILS_INSTALL_ARGS += " \
                      --with-xml2-config='pkg-config libxml-2.0' \
 "
 
-inherit pypi setuptools
+inherit pypi
 
 # {standard input}: Assembler messages:
 # {standard input}:1488805: Error: branch out of range
-- 
2.7.4


