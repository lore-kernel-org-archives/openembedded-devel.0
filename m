Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B7D307F55A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 08:10:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46H4S644FCz4q
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 10:10:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566807014;
	bh=qqST7rB7jQgid46VmNcTFwufiucY9cbr8ZptyxJ6bKw=;
	h=From:To:Subject:Date:From;
	b=pcnHpBfyUgEI/SB1Rb8/PXvoY8PP78zVx3UAujbfBhrYw52Bj2eEO5Jsnl7eEYJpz
	coAN3sA4abJXoheKYkFYO149rIh3YcbapJJL7aXDhS4YTf8fWIy+BimBUi0wDWtn9C
	gQct8/kpQsfR2LxmmN4DamznwGbB55HsG5AEXdgIJxutlngYYFg7H7y7WRWbSeQnO6
	S70y5H8fEHPA021LfwB/l5v4xiLqS7/e5imLGHT17YkTM19Kvk4zE91tFBzQigi4Nv
	n4K4oJiAxA7f5qKh+8PbV5okK17L9s+FASe9/tLDN6hWjCu/UUKdBjixL//Zw09qVc
	ZgN3ITVP7uIoneA9gHUir3Nd09gaFOAqP6PbUrsMIiuMNxmiDBwdi7jyFbqlrKsvFW
	AIDRLJQvODGeDv3E1UKsfx9YCMrPn/QV8HaZMbV/VYrWGCQpMB53NOIetgZXqvP/SU
	ZyOmg9YwXQue6XYI0o+S4FW6mCJkpXIZir/ldm6E9anL7Tx2IWxUmraJoUemBHoEci
	CzJhg/9QZPaf7NdqKReV69db469RpPHuK/vgoBl+BNS4fTuVB2y9HXJSC+U6RrGPaX
	9oaMpdvXeGclIgDm024t6MfkxpgOJzVRvj013dySGSkEKg6/jmcPRo/MQ8dDq3p2qs
	0cxci1eX/PqKBVMSVHfC4KTs=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Aug 2019 11:10:13 +0300
Message-Id: <20190826081013.24064-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][warrior][PATCH] zeromq: Upgrade 4.3.1 -> 4.3.2
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
X-List-Received-Date: Mon, 26 Aug 2019 08:10:15 -0000

This includes the fix for CVE-2019-13132.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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


