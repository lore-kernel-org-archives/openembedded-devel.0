Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2A3F87F00D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 20:57:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45kWjC6mYLzC6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 22:57:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562792256;
	bh=9Hp8Yl0KcNGfsyf5x3aBKkljVlWFdwhlOcCuFGlqk90=;
	h=From:To:Subject:Date:From;
	b=jcLyYqEng8rdArtog5z7UFS3zVqEk2lFGZbjA0OCEHetFrxELV/smHmTZpTaofmQH
	ZwDTRGEvhucekD5qHU/Q+6eYyvGLofKXsVB0IeWRI4Dc265I1LUcowG1+AxOHnIpIt
	p28rHIJI3EXuFjMQTspLRFqkSaV7w5cyZieyNK4lt+v0RZs7aP40BNI8On4ro4QL0W
	G566Y7hf2nt6jt172Nq1CCsV+wDCNnwKYNOTw8MZV3WZl/SjZuRCJUppj8QlxN/sws
	hUtFpCFz19EurVvSv2M9wnMf8J86aOCNd3+b7hpV3o95PnptFwJQvjVo+k65B7RwUS
	Ah3GmI4cT9E8yE4jUpw5siW5a876fBbeFBpoPiHIoS+zvJCGIt8SPcEXeb8gw6O//F
	71XWUQwGDMq896QfV7EnlKFi3MMVILP8k2hFp3HPw6YLrNjsGX80M6MU7O2of14BEK
	j1mcE8L27Fli45j7YUqLs8YqC7fXSac8wkR8fChjFqzzidQdAiu9V+MtuD1o11Ma55
	uUL0cdihks1Cd4uavTIVm22nisMGRRTzCwsroWVrcxd9undxA93094Sdq1xDIVXbk9
	usPjgu8FMmu14mQTnAuBGZgix79ObDufYnXEqQVwWh7nZ9XIp7YTatgvbOkKB78HxW
	eK1da6Hy0YMRu2ptAQYyiIH8=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jul 2019 23:57:31 +0300
Message-Id: <20190710205734.12377-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] zeromq: Upgrade 4.3.1 -> 4.3.2
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
X-List-Received-Date: Wed, 10 Jul 2019 20:57:36 -0000

This includes the fix for CVE-2019-13132.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../zeromq/{zeromq_4.3.1.bb => zeromq_4.3.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.3.1.bb => zeromq_4.3.2.bb} (85%)

diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.1.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb
similarity index 85%
rename from meta-oe/recipes-connectivity/zeromq/zeromq_4.3.1.bb
rename to meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb
index 6e1337646..adf2c7ba5 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.1.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb
@@ -9,8 +9,8 @@ PACKAGECONFIG[libsodium] = "-DWITH_LIBSODIUM=ON,-DWITH_LIBSODIUM=OFF, libsodium"
 SRC_URI = "http://github.com/zeromq/libzmq/releases/download/v${PV}/zeromq-${PV}.tar.gz \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "64cbf3577afdbfda30358bc757a6ac83"
-SRC_URI[sha256sum] = "bcbabe1e2c7d0eec4ed612e10b94b112dd5f06fcefa994a0c79a45d835cd21eb"
+SRC_URI[md5sum] = "2047e917c2cc93505e2579bcba67a573"
+SRC_URI[sha256sum] = "ebd7b5c830d6428956b67a0454a7f8cbed1de74b3b01e5c33c5378e22740f763"
 
 inherit cmake ptest pkgconfig
 
-- 
2.17.1


