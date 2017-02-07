Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 506B671A50
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 19:32:32 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id w20so20247235qtb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2017 11:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=qDO68GtS2A0EYS6ziMJaVsLjscSSIFQwGky2XAAF2KA=;
	b=S89rpp9LJ8NFBXYLG4UQd7ocBPaj8EpfzW4UUxV/HgKRhGgTkiYVc4wEA4nWLxzpn3
	7oRX8BUCr5ebCxrQwpr6MfGzO6ZoTKU+cRPbONZ8W7t/ofsqh6dh6X1z5cfM6k7XbcRW
	+CNfXi+YLZ8Pf847qKJQoEEiane+6MQe14ZiSg/ke2psQIeTR0YFhJgEZhqweO3sCqiE
	1fMnoY5a7kpKPr3sCDlnqGMwf0foJULQF1GlBlQaAc9p8GGBAWkm6flWt3FKVsBLz3o4
	OyKqyqNJSUAL1N5RKev7GtMyGJz27gZLtdkjpbX7XzR79GqOA9u90Kjq6u9blWW1TZ2c
	EOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=qDO68GtS2A0EYS6ziMJaVsLjscSSIFQwGky2XAAF2KA=;
	b=luxuOJxYna9wiYMmpXAx/59M9Sts4ia+vUqhYfdMAuQHrFeGS5O5givepfspAV1sFe
	24kMx/Ji2GG5L7aNVMnK0iGONNHsOKUYlzTVD+UwjLCzg0nAFLRy3mv9En6W9/G0RTN0
	x0XFQwr3kC+8u4+wdOfPiC8zJzni5xeaCpPiETRseB7wsnyGwmTpcLg0sqcgsU/mFBnl
	CnFQ53Sm7jxujL7Vx46rZKUtYbIufPe+0D+7roHaJm70klQwM2oYB8OA1skZN7Nm+a33
	7RjjdnidS0lcm3Js3JLuDOce+hmkQ6HAY2DB2gqXz91L206UhrBBKSSeRNZjFX15JwGX
	FxZA==
X-Gm-Message-State: AMke39ldRYgGh/QU/dbiLLxRHFLn92OcN76t0+2ET2YCM9ObTZyUd8MrC+6PUZ48maVdpA==
X-Received: by 10.200.56.196 with SMTP id g4mr17340969qtc.71.1486495953433;
	Tue, 07 Feb 2017 11:32:33 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	h62sm4171846qkc.23.2017.02.07.11.32.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 07 Feb 2017 11:32:32 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2017 17:32:08 -0200
Message-Id: <20170207193208.5051-3-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170207193208.5051-1-fabio.berton@ossystems.com.br>
References: <20170207193208.5051-1-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe][PATCH 3/3] libwebsockets: Add recipe for version 2.1.0
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
X-List-Received-Date: Tue, 07 Feb 2017 19:32:33 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../libwebsockets/libwebsockets_2.1.0.bb           | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
new file mode 100644
index 000000000..316b38d3b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Canonical libwebsockets.org websocket library"
+HOMEPAGE = "https://libwebsockets.org/"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+DEPENDS = "zlib"
+
+SRC_URI = "https://github.com/warmcat/libwebsockets/archive/v${PV}.tar.gz"
+
+SRC_URI[md5sum] = "4df3be57dee43aeebd54a3ed56568f50"
+SRC_URI[sha256sum] = "bcc96aaa609daae4d3f7ab1ee480126709ef4f6a8bf9c85de40aae48e38cce66"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+inherit cmake pkgconfig
+
+PACKAGECONFIG ?= "libuv client server http2 ssl"
+PACKAGECONFIG[libev] = "-DLWS_WITH_LIBEV=ON,-DLWS_WITH_LIBEV=OFF,libev"
+PACKAGECONFIG[libuv] = "-DLWS_WITH_LIBUV=ON,-DLWS_WITH_LIBUV=OFF,libuv"
+PACKAGECONFIG[client] = "-DLWS_WITHOUT_CLIENT=OFF,-DLWS_WITHOUT_CLIENT=ON,"
+PACKAGECONFIG[server] = "-DLWS_WITHOUT_SERVER=OFF,-DLWS_WITHOUT_SERVER=ON,"
+PACKAGECONFIG[http2] = "-DLWS_WITH_HTTP2=ON,-DLWS_WITH_HTTP2=OFF,"
+PACKAGECONFIG[ipv6] = "-DLWS_IPV6=ON,-DLWS_IPV6=OFF,"
+PACKAGECONFIG[ssl] = "-DLWS_WITH_SSL=ON,-DLWS_WITH_SSL=OFF,openssl"
+PACKAGECONFIG[testapps] = "-DLWS_WITHOUT_TESTAPPS=OFF,-DLWS_WITHOUT_TESTAPPS=ON,"
+
+PACKAGES =+ "${PN}-testapps"
+
+FILES_${PN}-dev += "${libdir}/cmake/libwebsockets/*.cmake"
+FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
+
+RDEPENDS_${PN} += "zlib"
-- 
2.11.0


