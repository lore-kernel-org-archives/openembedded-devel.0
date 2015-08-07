Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2E26776720
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2015 05:34:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99374628"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Aug 2015 13:38:23 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t775X1mS019754
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 7 Aug 2015 13:33:01 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 7 Aug 2015 13:34:55 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 7 Aug 2015 13:34:49 +0800
Message-ID: <1438925689-1647-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-python][PATCH] python-pip: upgrade 1.5.6 -> 7.1.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Aug 2015 05:35:00 -0000
Content-Type: text/plain

Version numbers are now simply "X.Y" where the leading "1"
has been dropped.
Reference: https://github.com/pypa/pip/blob/develop/CHANGES.txt

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../python/{python-pip_1.5.6.bb => python-pip_7.1.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pip_1.5.6.bb => python-pip_7.1.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python-pip_1.5.6.bb b/meta-python/recipes-devtools/python/python-pip_7.1.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python-pip_1.5.6.bb
rename to meta-python/recipes-devtools/python/python-pip_7.1.0.bb
index b4ce9e5..ae02e86 100644
--- a/meta-python/recipes-devtools/python/python-pip_1.5.6.bb
+++ b/meta-python/recipes-devtools/python/python-pip_7.1.0.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=45665b53032c02b35e29ddab8e61fa91"
 
 SRC_URI = "https://pypi.python.org/packages/source/p/pip/pip-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "01026f87978932060cc86c1dc527903e"
-SRC_URI[sha256sum] = "b1a4ae66baf21b7eb05a5e4f37c50c2706fa28ea1f8780ce8efe14dcd9f1726c"
+SRC_URI[md5sum] = "d935ee9146074b1d3f26c5f0acfd120e"
+SRC_URI[sha256sum] = "d5275ba3221182a5dd1b6bcfbfc5ec277fb399dd23226d6fa018048f7e0f10f2"
 
 S = "${WORKDIR}/pip-${PV}"
 
-- 
1.8.4.2


