Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D3A396AB99
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 08:01:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4L816xn012240
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 01:01:06 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 21 May 2015 01:01:05 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 May 2015 16:00:51 +0800
Message-ID: <0d9e175e558bdd1a2abde9c32f4c22fe44b1277c.1432194921.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1432194921.git.yi.zhao@windriver.com>
References: <cover.1432194921.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 4/4] cscope: fix ${PN}-${PV} -> ${BP} for multilib
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
X-List-Received-Date: Thu, 21 May 2015 08:01:05 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-devtools/cscope/cscope_15.8b.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/cscope/cscope_15.8b.bb b/meta-oe/recipes-devtools/cscope/cscope_15.8b.bb
index ecf7e6c..8aa5947 100644
--- a/meta-oe/recipes-devtools/cscope/cscope_15.8b.bb
+++ b/meta-oe/recipes-devtools/cscope/cscope_15.8b.bb
@@ -18,7 +18,7 @@ inherit autotools
 
 DEPENDS += "ncurses"
 
-SRC_URI = "http://downloads.sourceforge.net/project/cscope/cscope/${PV}/${PN}-${PV}.tar.gz"
+SRC_URI = "http://downloads.sourceforge.net/project/cscope/cscope/${PV}/${BP}.tar.gz"
 
 SRC_URI[md5sum] = "8f9409a238ee313a96f9f87fe0f3b176"
 SRC_URI[sha256sum] = "4889d091f05aa0845384b1e4965aa31d2b20911fb2c001b2cdcffbcb7212d3af"
-- 
1.7.9.5


