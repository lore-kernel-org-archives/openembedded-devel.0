Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B62516AC95
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 01:45:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0Q1jBgI003186
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jan 2015 17:45:11 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 25 Jan 2015 17:45:11 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 25 Jan 2015 17:45:06 -0800
Message-ID: <a3f522af049a44fcbf78eebf45e2e502b65dea3b.1422236615.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422236615.git.liezhi.yang@windriver.com>
References: <cover.1422236615.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking] [PATCH 2/5] dnssec-conf: depends libxslt-native
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
X-List-Received-Date: Mon, 26 Jan 2015 01:45:11 -0000
Content-Type: text/plain

Fixed:
xmlto: Can't continue, xsltproc tool not found or not executable.
Makefile:20: recipe for target 'dnssec-configure.8' failed
make: *** [dnssec-configure.8] Error 3

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../dnssec-conf/dnssec-conf_2.02.bb                |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/dnssec-conf/dnssec-conf_2.02.bb b/meta-networking/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
index d366abd..6a50971 100644
--- a/meta-networking/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
+++ b/meta-networking/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
@@ -12,7 +12,8 @@ HOMEPAGE = "https://github.com/xelerance/dnssec-conf"
 SECTION = "System Environment/Daemons"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0636e73ff0215e8d672dc4c32c317bb3"
-DEPENDS += " xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
+DEPENDS += "xmlto-native docbook-xml-dtd4-native \
+            docbook-xsl-stylesheets-native libxslt-native"
 
 SRC_URI = "git://github.com/xelerance/dnssec-conf.git"
 SRCREV = "8e799683736b4a7b5e5e78f98fba0a6f48393537"
-- 
1.7.9.5


