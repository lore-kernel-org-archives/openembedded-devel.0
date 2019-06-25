Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id A33B77CE12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 06:19:16 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id EB2BE2203CA;
	Tue, 25 Jun 2019 18:19:15 +1200 (NZST)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jun 2019 18:19:12 +1200
Message-Id: <20190625061912.24524-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libtar: Enable libtar-native build
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
X-List-Received-Date: Tue, 25 Jun 2019 06:19:17 -0000

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta-oe/recipes-support/libtar/libtar_1.2.20.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libtar/libtar_1.2.20.bb b/meta-oe/recipes-support/libtar/libtar_1.2.20.bb
index 60710f416..f93d9c09a 100644
--- a/meta-oe/recipes-support/libtar/libtar_1.2.20.bb
+++ b/meta-oe/recipes-support/libtar/libtar_1.2.20.bb
@@ -19,3 +19,5 @@ inherit autotools-brokensep
 
 PACKAGECONFIG ??= "zlib"
 PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
+
+BBCLASSEXTEND += "native"
-- 
2.17.1


