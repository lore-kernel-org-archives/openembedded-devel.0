Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8C7277D278
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 06:41:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x686fG0M006538
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 7 Jul 2019 23:41:16 -0700 (PDT)
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 7 Jul 2019 23:41:16 -0700
From: Yongxin Liu <yongxin.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Jul 2019 14:38:56 +0800
Message-ID: <20190708063901.13914-4-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20190708063901.13914-1-yongxin.liu@windriver.com>
References: <20190708063901.13914-1-yongxin.liu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v3 4/9] keyutils: improve ptests
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
X-List-Received-Date: Mon, 08 Jul 2019 06:41:15 -0000
Content-Type: text/plain

From: Armin Kuster <akuster808@gmail.com>

Tests need lsb

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 keyutils_1.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/keyutils_1.6.bb b/keyutils_1.6.bb
index 1d7427da5..730e1741e 100644
--- a/keyutils_1.6.bb
+++ b/keyutils_1.6.bb
@@ -43,4 +43,4 @@ do_install_ptest () {
     sed -i -e 's/OSDIST=Unknown/OSDIST=${DISTRO}/' ${D}${PTEST_PATH}/tests/prepare.inc.sh
 }
 
-RDEPENDS_${PN}-ptest += "glibc-utils"
+RDEPENDS_${PN}-ptest += "glibc-utils lsb"
-- 
2.14.4


