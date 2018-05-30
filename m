Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 19FE474F47
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 06:38:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4U6cQLk001865
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 23:38:42 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 May 2018 23:38:16 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 May 2018 14:38:07 +0800
Message-ID: <1527662290-31549-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527662290-31549-1-git-send-email-yi.zhao@windriver.com>
References: <1527662290-31549-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-python][PATCH 1/4] python3-pykickstart: add UPSTREAM_CHECK_GITTAGREGEX
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
X-List-Received-Date: Wed, 30 May 2018 06:38:51 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-extended/python-pykickstart/python3-pykickstart_2.35.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_2.35.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_2.35.bb
index 7fe603b..8c13f3e 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_2.35.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_2.35.bb
@@ -21,4 +21,6 @@ SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=py
            "
 SRCREV = "b2787a818540e678c2f9c5dca0c6bbd65b8b55e5"
 
+UPSTREAM_CHECK_GITTAGREGEX = "r(?P<pver>\d+(\.\d+)+(-\d+)*)"
+
 inherit setuptools3
-- 
2.7.4


