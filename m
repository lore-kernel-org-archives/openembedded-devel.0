Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8C767766DF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 07:45:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7C7jjd0009825
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 00:45:45 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Wed, 12 Aug 2015 00:45:44 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Aug 2015 15:45:34 +0800
Message-ID: <82869c777900cec1414f9945e9b0f9ebfbd5f408.1439365242.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1439365242.git.yi.zhao@windriver.com>
References: <cover.1439365242.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 1/3] sgpio: fix PN -> BPN for multilib
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
X-List-Received-Date: Wed, 12 Aug 2015 07:45:48 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb b/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
index 9807a31..ed7c413 100644
--- a/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
+++ b/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 SRC_URI[md5sum] = "a417bf68da4e9bd79a4664c11d7debd1"
 SRC_URI[sha256sum] = "9bf8c42acaa247efd9321bdb1fc2390022f0c554d77fbbd4a7363d990fc0270b"
 
-S = "${WORKDIR}/${PN}"
+S = "${WORKDIR}/${BPN}"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE_GPL;md5=393a5ca445f6965873eca0259a17f833"
-- 
1.7.9.5


