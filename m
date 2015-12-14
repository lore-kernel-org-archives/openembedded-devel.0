Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1E5E66FFE2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 09:01:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBE91CId008465
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 01:01:12 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 14 Dec 2015 01:01:11 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Dec 2015 17:01:19 +0800
Message-ID: <1450083679-2087-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-java][PATCH] cacao: fix the depends for target package
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
X-List-Received-Date: Mon, 14 Dec 2015 09:01:13 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The target package also depends on classpath, zlib, etc,
which is incorrect overrode, use _append for the
class-target instead.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-core/cacao/cacao_1.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/cacao/cacao_1.6.1.bb b/recipes-core/cacao/cacao_1.6.1.bb
index 9ea0f36..03ce0cc 100644
--- a/recipes-core/cacao/cacao_1.6.1.bb
+++ b/recipes-core/cacao/cacao_1.6.1.bb
@@ -7,7 +7,7 @@ SECTION  = "interpreters"
 DEPENDS_class-native = "zlib-native libtool-native ecj-initial-native fastjar-native classpath-native bdwgc-native"
 #PROVIDES_class-native = "virtual/java-native"
 
-DEPENDS_class-target = " virtual/javac-native "
+DEPENDS_append_class-target = " virtual/javac-native "
 
 DEPENDS = "zlib libtool classpath bdwgc"
 RPROVIDES_${PN} = "java2-runtime"
-- 
2.3.5


