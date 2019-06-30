Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id D69297E6F2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Jun 2019 21:19:41 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 2E37C2204D4;
	Mon,  1 Jul 2019 09:19:41 +1200 (NZST)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Jul 2019 09:19:16 +1200
Message-Id: <20190630211917.16433-2-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190630211917.16433-1-douglas.royds@taitradio.com>
References: <20190624062213.334-1-douglas.royds@taitradio.com>
	<20190630211917.16433-1-douglas.royds@taitradio.com>
Subject: [meta-oe][PATCH 1/2] grpc: DEPENDS on googletest
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
X-List-Received-Date: Sun, 30 Jun 2019 21:19:42 -0000

The gtest and gmock projects were combined under googletest in 2015,
and the former gtest recipe has now been renamed to googletest.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta-networking/recipes-devtools/grpc/grpc_1.14.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-devtools/grpc/grpc_1.14.1.bb b/meta-networking/recipes-devtools/grpc/grpc_1.14.1.bb
index d23671432..0550866e5 100644
--- a/meta-networking/recipes-devtools/grpc/grpc_1.14.1.bb
+++ b/meta-networking/recipes-devtools/grpc/grpc_1.14.1.bb
@@ -7,7 +7,7 @@ LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "gflags c-ares protobuf protobuf-native protobuf-c protobuf-c-native openssl"
-DEPENDS_append_class-target = " gtest grpc-native "
+DEPENDS_append_class-target = " googletest grpc-native "
 DEPENDS_append_class-nativesdk = " grpc-native "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


