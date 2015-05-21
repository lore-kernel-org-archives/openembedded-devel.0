Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1EC746AB99
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 08:01:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4L813Yt012226
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 01:01:03 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 21 May 2015 01:01:02 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 May 2015 16:00:50 +0800
Message-ID: <ae61847d6711bd5fcb6c4a3abb3ac0d3a639f74d.1432194921.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1432194921.git.yi.zhao@windriver.com>
References: <cover.1432194921.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 3/4] ctags: fix ${PN}-${PV} -> ${BP} for multilib
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
X-List-Received-Date: Thu, 21 May 2015 08:01:04 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-devtools/ctags/ctags_5.8.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.8.bb b/meta-oe/recipes-devtools/ctags/ctags_5.8.bb
index 6fc3912..d006d83 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.8.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.8.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep
 
-SRC_URI = "http://prdownloads.sourceforge.net/${PN}/${PN}-${PV}.tar.gz"
+SRC_URI = "http://prdownloads.sourceforge.net/${BPN}/${BP}.tar.gz"
 
 SRC_URI[md5sum] = "c00f82ecdcc357434731913e5b48630d"
 SRC_URI[sha256sum] = "0e44b45dcabe969e0bbbb11e30c246f81abe5d32012db37395eb57d66e9e99c7"
-- 
1.7.9.5


