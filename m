Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5565F7547F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 01:55:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9A1tHm0011774
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Oct 2018 18:55:41 -0700
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 9 Oct 2018 18:55:18 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Oct 2018 21:55:17 -0400
Message-ID: <20181010015517.16921-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] postfix: update the upstream regex too
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
X-List-Received-Date: Wed, 10 Oct 2018 01:55:50 -0000
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-networking/recipes-daemons/postfix/postfix_3.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.3.1.bb b/meta-networking/recipes-daemons/postfix/postfix_3.3.1.bb
index 7f00c3c19..960356999 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.3.1.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.3.1.bb
@@ -8,4 +8,4 @@ SRC_URI += "file://0001-makedefs-Use-native-compiler-to-build-makedefs.test.patc
 SRC_URI[md5sum] = "4381c6492f415e4a69cf5099d4acea76"
 SRC_URI[sha256sum] = "54f514dae42b5275cb4bc9c69283f16c06200b71813d0bb696568c4ba7ae7e3b"
 
-UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.2(\.\d+)+).tar.gz"
+UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.3(\.\d+)+).tar.gz"
-- 
2.17.0


