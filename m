Return-Path: <dev@codyps.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id AB3DD60621
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 16:11:47 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id j69so1170363itb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 09:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=P0u/1Zr4RfwjEvfgTZl5O4/mwvsTWooHHbycMZX+tns=;
	b=AUylJvTnYxy2Lj4NkmS2j92FtIu2N7MsVat0qUjt+p2KzU3ht4QNIrir5lVGNPth2C
	8uW1AVD2Q+kQFaoxzIv8LzxO7HyqJCGi9srGbOXJv7ZuwzQVylwOyVQlbnL/GypeQ7+w
	h2WJmcK0A+Mx9uT4YCg+SFhEbL/ZlLE+tvc2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=P0u/1Zr4RfwjEvfgTZl5O4/mwvsTWooHHbycMZX+tns=;
	b=AyW2L3/qUaY4pnlTTjbsDT6soAHsh30Z7dHd5WS1ucOk6JnMYOlgKJlWWikM/KrUvh
	TSHiI+0SV2gij/m92l3C6umpk0uMD/d7OQ8ibzfPtSWeWC8MI1+mmz2yNLVixfLIwCI9
	LWQCwcMul22XPnX6KQLv79JqZlMHb6lewzaHfs/3pZ3osHCy7XJSKzqofjbQlR+erVRO
	I97dlHaXUkTK2U43dVlrRft1VnDijbY7mfaOkfVyHFxlFNcmUqxnyqnbf2BXYhG7sSJh
	SGcGmOhFF05gyzLLVvFrd3QXJD9q2nau7wzb16LYLTrLOY9Njk+nnf1HP+HfI01MjyMq
	oP6w==
X-Gm-Message-State: AA6/9RmDyDTHZ6eTGOpI0N6aZe5gXbqbFynvu8wQRuS1zFNs+9TacbBs5f6A6ML87SxXAQ==
X-Received: by 10.36.236.69 with SMTP id g66mr5356260ith.32.1474992708555;
	Tue, 27 Sep 2016 09:11:48 -0700 (PDT)
Received: from localhost (173-15-40-134-Illinois.hfc.comcastbusiness.net.
	[173.15.40.134]) by smtp.gmail.com with ESMTPSA id
	g65sm1189533ioj.24.2016.09.27.09.11.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 27 Sep 2016 09:11:47 -0700 (PDT)
From: Cody P Schafer <dev@codyps.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Sep 2016 11:11:37 -0500
Message-Id: <20160927161137.16473-1-dev@codyps.com>
X-Mailer: git-send-email 2.10.0
Subject: [meta-oe][PATCH] meta-oe/recipes-connectivity/thrift: disable java
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
X-List-Received-Date: Tue, 27 Sep 2016 16:11:48 -0000

Without this, thrift will try to use system java to build it's java
bindings, which is both unexpected and may fail depending on the
version of system java.

Signed-off-by: Cody P Schafer <dev@codyps.com>
---
 meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
index fdea7f1..8648daf 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
@@ -25,7 +25,7 @@ export STAGING_LIBDIR
 export BUILD_SYS
 export HOST_SYS
 
-EXTRA_OECMAKE = "-DWITH_QT4=OFF -DWITH_QT5=OFF"
+EXTRA_OECMAKE = "-DWITH_QT4=OFF -DWITH_QT5=OFF -DWITH_JAVA=OFF"
 EXTRA_OECMAKE_class-native = "-DWITH_QT4=OFF -DWITH_QT5=OFF \
              -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF -DWITH_CPP=OFF"
 EXTRA_OECMAKE_class-nativesdk = "-DWITH_QT4=OFF -DWITH_QT5=OFF \
-- 
2.10.0


