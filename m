Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id EA9ED7F5AC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 08:11:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46H4Tv4Z6Wz4q
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 10:11:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566807107;
	bh=ntubuMzJY85348f9XnFUF4Lb0LLfnxoAM/oRuNYW1AY=;
	h=From:To:Subject:Date:From;
	b=lUr/oLt/Uo7Dhqi8mAXVEUztT3nvRParhsU0dRKdvroLIJuWzf5ucUVCXjKAPmyZC
	gZtrghe1Qais7fJx48I+LYem2B1iHcW7qQH5e5Tx56tCDkda5920HEwNEeX2wjMl/W
	UzoOsKmXeUkKI3BKGy18laQHn8jKf9O/D+JE4vviVhByONMAGfk6mFwgIXrEDnd+w0
	XGqtgRTzzr4QSsQrxBcjtQ/U602iZraEBSzx4DA/4A+JSdNQSdqi1NCTSdDfQayF/a
	JjpZGCaSkdslH2mJXAS7Zky3I+xzbfgW2IwLXGVUxz+vZnhLtCtvw2eBYDpmDVuX/1
	8bIVmSykTml0+O2kdtxraU/z2leJ60+6M85H4t6HNdcePW3zKv4HjgQz71jiWcPh4+
	tlD/J7nQ4dv9CN3BlA2/e2Cy0oAEQ2tgmrFznclygIgKT6rXhEYEk3FNrca3WQV777
	XfXfrVAZOPLjDE6bhk6YAPxRwvzgxf4qQNeWY4oswtL3Bab5aMf7Ujoc3kXzMXYs0A
	YJjyKgYVex0vORN7zRPSvEIuxwQnG0i1kUdX4t5A5urmQ6su5LaxXrBDc7/qHDE17a
	XBQiBjjRx0yzGI6qbKF9h0UYg6lEzX2w7lHnHLo3ss2/hu3Zq7Jkz5HZwezvnoJ6fu
	LkcQ3RgJkPkG8iknC7/DETyw=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Aug 2019 11:11:46 +0300
Message-Id: <20190826081146.27183-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][warrior][PATCH] wireshark: Use an upstream URL that stays valid longer
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
X-List-Received-Date: Mon, 26 Aug 2019 08:11:47 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/wireshark/wireshark_3.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.1.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.1.bb
index 572dc1a45..c2552a95b 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.0.1.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.1.bb
@@ -8,7 +8,7 @@ DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bi
 
 DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
 
-SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz"
+SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz"
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-- 
2.17.1


