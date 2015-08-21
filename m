Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 56598765A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 06:47:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7L6l7dJ027086
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 23:47:07 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Thu, 20 Aug 2015 23:47:07 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Aug 2015 14:46:45 +0800
Message-ID: <5d136124ce625a26bf3bd30a42ed032c142f2ee8.1440139197.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1440139197.git.yi.zhao@windriver.com>
References: <cover.1440139197.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 4/8] libftdi: set correct LIB_SUFFIX for multilib
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
X-List-Received-Date: Fri, 21 Aug 2015 06:47:07 -0000
Content-Type: text/plain

Fix QA issue when enable multilib:
ERROR: QA Issue: libftdi: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/libftdipp1.so
  /usr/lib/libftdi1.so
  /usr/lib/libftdipp1.so.2.1.0
  /usr/lib/libftdi1.so.2
  /usr/lib/libftdipp1.a
  /usr/lib/libftdipp1.so.2
  [snip]
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install. [installed-vs-shipped]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/libftdi/libftdi_1.1.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.1.bb b/meta-oe/recipes-support/libftdi/libftdi_1.1.bb
index d8b189b..44e040c 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.1.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.1.bb
@@ -24,6 +24,8 @@ PACKAGECONFIG[cpp-wrapper] = "-DFTDI_BUILD_CPP=on,-DFTDI_BUILD_CPP=off,boost"
 
 inherit cmake binconfig pkgconfig
 
+EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')}"
+
 FILES_${PN}-dev += "${libdir}/cmake"
 
 BBCLASSEXTEND = "native"
-- 
1.7.9.5


