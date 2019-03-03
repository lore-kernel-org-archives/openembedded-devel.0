Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id C59A47C863
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Mar 2019 16:56:52 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id a17so2237614ljd.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Mar 2019 08:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=qpaEVHvx0WyQ/y+Bz3rX7JaY9oCElX78OxOFL3LZvgU=;
	b=afsC211gcdIyrAI48cWPVaJwYqzcN5g8nhQrUUfP0Z1PAHNAephE+o/7K2mWekp5sM
	J4JIa94fIYq65J2uzjEN2k6r4jkmRZPJWtue5ScAzCA4+vTk6d7MQVsRM4AtklE16IQo
	sKTBGlHejhRA30wv3LjjuzRLfiJDm0/6pZcPmeMBokRg3vZedy2A0d6+c5EGpEItgS/l
	yMi2FbwLJNMPfrdxHnP7Iti3Qs4sYKqzQRYZaDGyvYdeOaZfCA3JgquFF6yH2RES8tzV
	vLyxVpVAafFJEhu8+c4Kz1vLW+J76Jq41TPSRMFvPNDZf65hI8CGgvH+1qqI61PKbq4w
	+GEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qpaEVHvx0WyQ/y+Bz3rX7JaY9oCElX78OxOFL3LZvgU=;
	b=L13YEh5psfoHu/5VfasAO1/onf9CuJCXARWqHiXfBxlRHrsPoqurT7B9MFS6Vbdt9q
	k1y+67yX9ON3wBVnocouEAgfaG1LYECRyPcVzJgoPWEzAKryYLKdLVa7gKvkJHvGV8CW
	EH1QW8AzjLNwjcnaVv9c5FR3yfkz5yjh5Cad+dYG1jPJHJflXlmTe9+a6PBohh+arxJO
	lMqbY0smmv7dTbbIPnM7bNKeVlN4tN6uvbFhovpmRKCPMfSj0J91H9b+gaIiLbUCSFn/
	3kfCGW/TALfxowFJ7kZ3/laYyX2z4Nu32JV11dJzS8wlr7ydB4/HTR7Cf0rSaiDcJZ5c
	v7Wg==
X-Gm-Message-State: APjAAAUI+A+u66V1LdgnT7dNnW9eLSXZxvzui8WnbZmIhrbIvWTBVvve
	2rBWLsLhGCXxqPum3G/lKc1fr7xARt8=
X-Google-Smtp-Source: APXvYqyyrdqux5VeWC5cb7vVwH7Y0H44TW76IRIWjDPgPNn5RFmPZhLwBA0VGYI5dEcWSvRFRtNaMQ==
X-Received: by 2002:a2e:131a:: with SMTP id
	26-v6mr7968882ljt.107.1551632212753; 
	Sun, 03 Mar 2019 08:56:52 -0800 (PST)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id p3sm1047656lfc.64.2019.03.03.08.56.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Mar 2019 08:56:52 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Mar 2019 17:55:30 +0100
Message-Id: <20190303165530.22532-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] nghttp2: update to 1.36
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
X-List-Received-Date: Sun, 03 Mar 2019 16:56:53 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../nghttp2/{nghttp2_1.26.0.bb => nghttp2_1.36.0.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/nghttp2/{nghttp2_1.26.0.bb => nghttp2_1.36.0.bb} (66%)

diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.26.0.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.36.0.bb
similarity index 66%
rename from meta-networking/recipes-support/nghttp2/nghttp2_1.26.0.bb
rename to meta-networking/recipes-support/nghttp2/nghttp2_1.36.0.bb
index 3ccd486be..920e78280 100644
--- a/meta-networking/recipes-support/nghttp2/nghttp2_1.26.0.bb
+++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.36.0.bb
@@ -4,9 +4,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
-SRC_URI = "https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.bz2"
-SRC_URI[md5sum] = "926f07ad3b50f38f7d8935ced04716cf"
-SRC_URI[sha256sum] = "0df4229f4123b5aa96e834ebcfdffe954e93d986f0252fd10123d50c6f010983"
+SRC_URI = "https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.xz"
+SRC_URI[md5sum] = "f2ef3dd1e9fc6dc29fcdd4a465ebc020"
+SRC_URI[sha256sum] = "e9bb86157b88eda5a6844a232e039febbb52c1aa44b640acbbfabe729b8287fc"
 
 DEPENDS = "libxml2 openssl zlib jansson cunit c-ares"
 
-- 
2.17.1


