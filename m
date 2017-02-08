Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id A34C771C90
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 18:12:51 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id 11so18961150qkl.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 10:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=qDO68GtS2A0EYS6ziMJaVsLjscSSIFQwGky2XAAF2KA=;
	b=BMiAlIQYYPHWP5ptzg/kl+TVcGUOb1U406tP8iKNaQq/7p59j1V0CFuItYo92vehiQ
	yfR0I55WQ6DiRYIUGBVvvsHAGLYRiKfztUhlYiJoIxIGUnpGiKvnmOvQ9KW6csFZiC2t
	JzAYdFnKF5INbUbyOctmqfH5jZzMJarJ7X0R3g54RG1BYXUJU2HjRPNesNexJ03ntLBe
	9HohwSM4ExdT2IVzT00qvtj3btBpxA9jnFUbmogA/t0c2LVs/vZeCQ163yABASRhL8Ge
	h037lrPK8pMvxMTUG1PDD0YAy77cj89EAl/vXdEIVAkOpECBXaR22+7Apy2TuhNMST74
	LH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=qDO68GtS2A0EYS6ziMJaVsLjscSSIFQwGky2XAAF2KA=;
	b=nkESZYiCWh0tcB9pjJbviQpqhrrvz36d+IVeLcGMQMJIJ5GaZiYlKYOFsSvnBAITGh
	mCsV/wcJ1D8QG7HszBQVEh/HhqtYEZ/aiafV8lDbU0nP1YwtU2GN4LNZVzIttyfMhDFN
	2gQ75f3CxQ0zf0A21o/u8Qvdjy+V14Ia+6b2uYGfz9Fj1JKkLlc2Lo7lHs1AjGzfZsIK
	GpBmm8a5vF3E/+oPMy2Ccp43dhSWC2nj3BV7gdnp6zUu0gmhHSUVm/bix9bxCAbBuK8k
	owwGhKH8rKLJ1nnUAP2Y6gCJn5kEhqIOmN1MjaPqE2bU5MztoTH1aYDnbE2LeVix6wDK
	XIhA==
X-Gm-Message-State: AMke39kKgo/wNOQJaMh1fCUGIzAQaGbrRsv9L8+OmR7CWfzOgQSlKVDUjcI3TPOMHWvxIg==
X-Received: by 10.55.69.72 with SMTP id s69mr23207527qka.21.1486577571518;
	Wed, 08 Feb 2017 10:12:51 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	y23sm6792676qtc.38.2017.02.08.10.12.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Feb 2017 10:12:50 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 16:13:20 -0200
Message-Id: <20170208181320.21119-3-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170208181320.21119-1-fabio.berton@ossystems.com.br>
References: <20170208181320.21119-1-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe][PATCH v2 3/3] libwebsockets: Add recipe for version 2.1.0
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
X-List-Received-Date: Wed, 08 Feb 2017 18:12:51 -0000

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


