Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4D89777328
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 11:03:36 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id e1so4532650qkh.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 03:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=pa9tqoIyPTMIC29+QOk00S0W8zbDHvFx3PmSAJuii6c=;
	b=WuEmrHZlUPYUFXS5kGXDa3Xpctts1pXbg2Tr71HMW4feXt5zU8Kg8tH7spUzwGB5Kc
	+FZLu3UbWXwZb5/IsB9F4Gaeh1VFeK3lienpTHuBmDXDz8ZW2lDx2X7Q6Ka+0a6raHn3
	i5vuK5TahT++eoGBdhtYwOrtRvTzOVBbEm/R7nh7rYUenxoDtygxdQlM3w4zkeEASiNU
	fyULzuLUC8XipV7feyG1okKb6vkS94Vzq6MPW7QHSOMaNHiU4JoeMuUuoQ5ayDky4tNh
	GzEeTcf3DOBTo02Gu0ht6ZLyxWRssw+4JOUxXQKVyketZlUL4yNTL06VnapoQ6k8cNg1
	wOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=pa9tqoIyPTMIC29+QOk00S0W8zbDHvFx3PmSAJuii6c=;
	b=niN58lVoAdTINksykqi2eNJc9gh+Si/WB1JvqlS2s3YDQmxJ6A51BbTe1/RpT9Ge0P
	on7Cc0Z0v1hhGVKI36Ys9b2fYNmx3vuChJwgi39r7SnMtsjbwqfBCVJybmrevK9Yd7mC
	kECAi8yy2RgQoB+2IiJSqU6p4M/ehvfaESCYFIYHk8Q+kNQMW2CFAKO02lv4CheM53Wc
	v3vyYUC+wbDYOM/OODGyfD+5IVnExp+FN45Tthi8hD4lKdr87GcGJyXfn7EqRS17rM4F
	XqQz9Tqf5No81J/nJO1+bT562NQCjMBYjaJ+JnxsiAzStlsMvrsFKOijnhySfx8nl6Hn
	f8Aw==
X-Gm-Message-State: AMke39n2GfCzN4LI1mXg8oF5NicU1OfQul218nok82JsycXejiYj/v8YIBPosJS4TBzB3Q==
X-Received: by 10.55.214.152 with SMTP id p24mr7394739qkl.223.1486724616459;
	Fri, 10 Feb 2017 03:03:36 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id 11sm1167331qke.38.2017.02.10.03.03.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Feb 2017 03:03:35 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Feb 2017 09:04:09 -0200
Message-Id: <20170210110409.23890-3-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170210110409.23890-1-fabio.berton@ossystems.com.br>
References: <20170210110409.23890-1-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe][PATCH v4 3/3] libwebsockets: Add recipe for version 2.1.0
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
X-List-Received-Date: Fri, 10 Feb 2017 11:03:36 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../libwebsockets/libwebsockets_2.1.0.bb           | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
new file mode 100644
index 000000000..935479987
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Canonical libwebsockets.org websocket library"
+HOMEPAGE = "https://libwebsockets.org/"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e3393a657830d4a118c5a6ed35ba53d0"
+
+DEPENDS = "zlib"
+
+SRC_URI = "https://github.com/warmcat/libwebsockets/archive/v${PV}.tar.gz"
+
+SRC_URI[md5sum] = "4df3be57dee43aeebd54a3ed56568f50"
+SRC_URI[sha256sum] = "bcc96aaa609daae4d3f7ab1ee480126709ef4f6a8bf9c85de40aae48e38cce66"
+
+inherit cmake pkgconfig
+
+PACKAGECONFIG ?= "libuv client server http2 ssl"
+PACKAGECONFIG[client] = "-DLWS_WITHOUT_CLIENT=OFF,-DLWS_WITHOUT_CLIENT=ON,"
+PACKAGECONFIG[http2] = "-DLWS_WITH_HTTP2=ON,-DLWS_WITH_HTTP2=OFF,"
+PACKAGECONFIG[ipv6] = "-DLWS_IPV6=ON,-DLWS_IPV6=OFF,"
+PACKAGECONFIG[libev] = "-DLWS_WITH_LIBEV=ON,-DLWS_WITH_LIBEV=OFF,libev"
+PACKAGECONFIG[libuv] = "-DLWS_WITH_LIBUV=ON,-DLWS_WITH_LIBUV=OFF,libuv"
+PACKAGECONFIG[server] = "-DLWS_WITHOUT_SERVER=OFF,-DLWS_WITHOUT_SERVER=ON,"
+PACKAGECONFIG[ssl] = "-DLWS_WITH_SSL=ON,-DLWS_WITH_SSL=OFF,openssl"
+PACKAGECONFIG[testapps] = "-DLWS_WITHOUT_TESTAPPS=OFF,-DLWS_WITHOUT_TESTAPPS=ON,"
+
+PACKAGES =+ "${PN}-testapps"
+
+FILES_${PN}-dev += "${libdir}/cmake"
+FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
-- 
2.11.0


