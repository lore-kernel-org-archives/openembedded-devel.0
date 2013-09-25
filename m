Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 54A97610DA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2013 14:39:40 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Wed, 25 Sep 2013 16:39:39 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 9531228BD31;
	Wed, 25 Sep 2013 16:39:39 +0200 (CEST)
From: <maxin.john@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Sep 2013 16:39:38 +0200
Message-ID: <1380119978-22799-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Subject: [meta-oe][PATCH] ser2net: add nativesdk support
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
X-List-Received-Date: Wed, 25 Sep 2013 14:39:42 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

Add nativesdk support to ser2net

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 .../recipes-connectivity/ser2net/ser2net_2.9.1.bb  |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb
index e83b530..4f054d5 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb
@@ -13,4 +13,4 @@ SRC_URI[sha256sum] = "fdee1e69903cf409bdc6f32403a566cbc6006aa9e2a4d6f8f12b90dfd5
 
 inherit autotools pkgconfig
 
-BBCLASSEXTEND += "native"
+BBCLASSEXTEND += "native nativesdk"
-- 
1.7.9.5


