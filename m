Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb0-f179.google.com (mail-yb0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id ABBCE7908E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 15:32:36 +0000 (UTC)
Received: by mail-yb0-f179.google.com with SMTP id l16-v6so4742996ybk.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 08:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XNdHVcrWR7Y3+EfO823PE1+oY1bpXczeV/3y4nTP7NE=;
	b=nIphVrpBWrXkIZAiHnlUti4vt05u6i86Z3IfMDiN5n9lpSYcj3pB/ffwV3t+b4sBq0
	eJJqAoo8TaS2ssmqOKVAtIaKg7q9y3es7aXJjCbNAZt9LSgOihCWDwEMe7FmyCoEzRoF
	jEn+QepmezkRDCzKJtbNdABySJ9PRuD9WPjPYA+7RHWwWpk9oD1eIXmY4GbhU7rzqLZL
	7lsidpe9q1sShSkjEZ29ImjciwMT0IephKgXcHYj/u8Um6bvZCKVox8a54s68XBH+KoT
	vmNwNE/hdAaEZKvBYejLl5QXhmJZ79aujena5xEHQIqpq0VVwEvTetFdgGh7bl/98c1l
	kASw==
X-Gm-Message-State: AOUpUlEtjPMkhFyGC0n5r2hmaYMWXoPf4irkzcygh2XlHUv8p6kW4wur
	WKMV4si/ChY/vxmpJpfwOjp77l3q
X-Google-Smtp-Source: AA+uWPw2fCxqpe7fomVxfdq8zO7OE+6KJNFYqGC3P9B5AT/IxRNKsRJbT54qO8Noq0AxxNjOez89dg==
X-Received: by 2002:a25:99c3:: with SMTP id
	q3-v6mr11737085ybo.107.1534779157537; 
	Mon, 20 Aug 2018 08:32:37 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	z193-v6sm1496775ywd.90.2018.08.20.08.32.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 08:32:36 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2018 16:32:30 +0100
Message-Id: <20180820153234.10990-1-git@andred.net>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [meta-java][PATCH v2 1/5] layer.conf: stop OpenJDK-8(native) build dependencies from being installed
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
X-List-Received-Date: Mon, 20 Aug 2018 15:32:36 -0000
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


