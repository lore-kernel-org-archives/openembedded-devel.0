Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id E93E6771F7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2017 19:47:59 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id w20so1927720qtb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2017 11:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=fI9aknM4n4UIcnWQprV3N8ue4th98lbyz5Gv5i3ceW8=;
	b=rA4YbfbE+NhtKjZ/zAtQbHKkRODifey/3E/hAsmZqLx1sjr1kHTADjfoYHXHTEXxjM
	fKgzC1kCPuyS5AUAyEJFoSUCUr8Kl/I3MiwesC0qzPQdmPq5WLeRfnuhsLexVOHc38YE
	V7UUE4Nqi83KDGieaDBekjxAPtoRd2KvTVU4bnoYHmnTYT9zTOBQlqv3gihDYLQf5juM
	JFCnI+DFXCtdQEopeaoQBTx/DiY1ATh7fJ+c1Aygj+QTOm76eCOEXiowizWxSafbhSHF
	06YzMc1qKPgtlvLIbPGV7IMzg9r/xCqMBeZM7cE+q+EzINQ9g/q+mjERiXWq4F5F0o8A
	3UWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=fI9aknM4n4UIcnWQprV3N8ue4th98lbyz5Gv5i3ceW8=;
	b=mi0xYn5YZTHewqkBbLFIpXPHiNSJTYxrJWes7y1lHLn5aII7XoMxA1J7vY3kodaHaS
	5IYcnPK9ScNLWhFhC5UW5NSlLrxJlJCkNGJ3uBDDZIwIC/heLZBb03SdV6Tw0IddFJMm
	Kl26q6gJjL31Edi9o2SWoEtkRWlpm1jU6tB7mErmD9XsccA6HZPqvcWDnDAN/Shp0Baz
	ZcyVQ+wYT5HFDtxNk6vJR7sb07sKRKwnXsCOnzBTXhZf4vUPF0v2F6HwSlIrpjxYqsMN
	5qdOW6XjwAkx6VwVuRQ3j7jAJYPTEwzYK+vWw6TW257P1pbTwokpMRfINI/29NLR1URL
	fr4A==
X-Gm-Message-State: AMke39mDPhF3NlcQKWcdEZb2e1nhQBZmJYGInt8wVZNsTA2nR9RwfOK9oF91svCb7dfHwA==
X-Received: by 10.200.49.41 with SMTP id g38mr4478019qtb.175.1486669679639;
	Thu, 09 Feb 2017 11:47:59 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	h40sm10055850qtb.6.2017.02.09.11.47.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Feb 2017 11:47:58 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Feb 2017 17:48:21 -0200
Message-Id: <20170209194821.30766-3-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170209194821.30766-1-fabio.berton@ossystems.com.br>
References: <20170209194821.30766-1-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe][PATCH v3 3/3] libwebsockets: Add recipe for version 2.1.0
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
X-List-Received-Date: Thu, 09 Feb 2017 19:48:00 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../libwebsockets/libwebsockets_2.1.0.bb           | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
new file mode 100644
index 000000000..ffade88ac
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Canonical libwebsockets.org websocket library"
+HOMEPAGE = "https://libwebsockets.org/"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;;md5=e3393a657830d4a118c5a6ed35ba53d0"
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


