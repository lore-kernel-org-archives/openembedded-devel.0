Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1D139765A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 06:47:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7L6l4Yk007979
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 23:47:04 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Thu, 20 Aug 2015 23:47:04 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Aug 2015 14:46:44 +0800
Message-ID: <b6f310c18a91743a40a9e08f93449bbb5fe524d4.1440139197.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1440139197.git.yi.zhao@windriver.com>
References: <cover.1440139197.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 3/8] wbxml2: set correct LIB_SUFFIX for multilib
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
X-List-Received-Date: Fri, 21 Aug 2015 06:47:05 -0000
Content-Type: text/plain

Fix QA issue when enable multilib:
ERROR: QA Issue: wbxml2: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/libwbxml2.so.0.0.17
  /usr/lib/libwbxml2.so
  /usr/lib/libwbxml2.so.0
  /usr/lib/.debug
  /usr/lib/pkgconfig
  /usr/lib/.debug/libwbxml2.so.0.0.17
  /usr/lib/pkgconfig/libwbxml2.pc
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install. [installed-vs-shipped]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb b/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
index d383c65..bd15bba 100644
--- a/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
+++ b/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
@@ -15,6 +15,8 @@ S = "${WORKDIR}/libwbxml-${PV}"
 
 inherit cmake pkgconfig
 
+EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')}"
+
 PACKAGES += "${PN}-tools"
 
 FILES_${PN}-tools = "${bindir}"
-- 
1.7.9.5


