Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb0-f178.google.com (mail-yb0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 079827908E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 15:30:31 +0000 (UTC)
Received: by mail-yb0-f178.google.com with SMTP id o17-v6so4740065yba.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 08:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XNdHVcrWR7Y3+EfO823PE1+oY1bpXczeV/3y4nTP7NE=;
	b=s6Q5GK8WtrNv9kkCPb4oLxCeHDX2amp0SWJUXW1wADfuJ0uU8MZEFpMEsadffiO3ew
	Lw5RvMw2N6Y6B/LkuZvE517VeVLhBwpvgkZoTw/ag6pCw4jf+/dnUy8jnmaUWB1pj4GX
	kudFizrEFK82vwHU5r8oZyggnFBwQm3rpVPZRhk0Lu8CF2pVVf1naDN2xFVjWxcqzx2l
	ocHukNwG++34+2DxIepHRlw9AywNc7777U/WAEXqplFpu9/ipHA4QK7olsOFRBltJYpL
	gseqcwKKzSjDQ6cL4YHmqYwCZwawv4tPi8d/C5pNbTmKnQ3TFfE4uojTFuigikldLV5h
	836g==
X-Gm-Message-State: AOUpUlEKCIEGMZFv6Bk8K6Ffqja/4ZxHXA35YQYl+ZT7oZjJcI5aCtQ8
	oz6LrAin4hzFXRLSRd2lQZng+J27
X-Google-Smtp-Source: AA+uWPxxuyhDPAy8RTKaM9IGiDdUvjsBKc6BXsyMJyENOewrEfwqvYGy9kAm/mGASKF/uhOU3ur+kw==
X-Received: by 2002:a5b:cd1:: with SMTP id
	e17-v6mr1444412ybr.334.1534779032831; 
	Mon, 20 Aug 2018 08:30:32 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	126-v6sm5213507ywl.48.2018.08.20.08.30.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 08:30:32 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2018 16:30:26 +0100
Message-Id: <20180820153030.10211-1-git@andred.net>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [meta-java][PATCH 1/5] layer.conf: stop OpenJDK-8(native) build dependencies from being installed
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
X-List-Received-Date: Mon, 20 Aug 2018 15:30:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Avoid installation of all openjdk-8-native buildtime dependencies into
a depending recipe's sysroot.
To execute openjdk-8-native as part of a depending recipe's build, we
don't need the openjdk-8-native build time dependencies (like ant-native,
or more importantly icedtea-7-native), just its runtime dependencies,
unless of course that depending recipe's builds needs those tools itself.
In that case, it needs to specify them explicitly, though (of course!).

Use SSTATE_EXCLUDEDEPS_SYSROOT to prevent openjdk-8-native build time
dependencies from being copied in the sysroot unless explicitly requested.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 conf/layer.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index 3b00f61..8e8a300 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -14,3 +14,7 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
 SIGGEN_EXCLUDERECIPES_ABISAFE += "\
     ca-certificates-java \
 "
+
+SSTATE_EXCLUDEDEPS_SYSROOT += "\
+    openjdk-8-native->(ant-native|attr-native|coreutils-native|icedtea7-native|libxslt-native|make-native|openssl-native|zip-native|unzip-native) \
+"
-- 
2.18.0


