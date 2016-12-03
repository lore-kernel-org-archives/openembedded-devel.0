Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 902E471C42
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Dec 2016 03:56:34 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 3so9708125pgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2016 19:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cz4er85cB8NzCo+OJSjY8brzfN4IZj+4lcJb2dWOC4E=;
	b=lewEDCZykzHXaSxlwapyLMhSn6EWfLvshdIZuzy/bI30qe7aItj0WXL665Xd8+7Vhr
	x7QDJ96zc1oYCIh24fb+Xn61eza5kagahjxbG5tS8lh1d/tWGM3e7YyZXjT8icbe3bZI
	DZgQAiloN3zmdwrwfn1XbW4dqbkr8n5TPrP8kJCE50j1c4BNRmNgmtxPDnLmu+x19xFd
	GUCDDub8FxcbLHH2l+LzyddY2GSGE1hVvze9oeXBnP0QxI2df1xoNWo3wbnbNvfw8q7Q
	lhrWidclLNz/TuNry4EqwmgDhgOA8OIJ6mNytuwgGi1G3+GVf2wv5U2TscnWGLVqRPTT
	5lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cz4er85cB8NzCo+OJSjY8brzfN4IZj+4lcJb2dWOC4E=;
	b=jTdAC8o5JISJzZa4OCdlOq8EVWUdvXteIe6uIf0Zhf+eN9bLqoC+ON5YJBVFZNjOom
	nCTbqe+aLiDCMBfhsvDPdmxifkF2QM1/KphKLQCYXkE8IAXxCMxxRp2zQm/ACxs2QDF3
	3eWwbkcKGSE7qHymyqwavJlWmFi1ngCbBX+EvNgILba41Y5qkLue/RTboURKyrb5/D5y
	hXdBQZ6ajLUGajpTiNAFuvsxEY7O2eHgFHfxZRpfwxA86KgBssU1yEUuVI7QRN/Ecl4I
	0iLtSDVHQsKPRZ/LubKfMKI6u+NKrFx7+sexoH9nvi2lgezFal83Nmasfy/BOMRXNEyZ
	/gGg==
X-Gm-Message-State: AKaTC00UVN2NFLy0F2I0q5mvIDI/f9YQiVjOY2u4c/L6ms9vK93WZgYdPZJOJrpnmSyt9Q==
X-Received: by 10.99.160.1 with SMTP id r1mr84114787pge.107.1480737395665;
	Fri, 02 Dec 2016 19:56:35 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	o126sm10838412pga.34.2016.12.02.19.56.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Dec 2016 19:56:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Dec 2016 19:56:29 -0800
Message-Id: <20161203035629.29119-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161203035629.29119-1-raj.khem@gmail.com>
References: <20161203035629.29119-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] nopoll: Add recipe
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
X-List-Received-Date: Sat, 03 Dec 2016 03:56:35 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-protocols/nopoll/nopoll_0.4.2.b297.bb   | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/nopoll/nopoll_0.4.2.b297.bb

diff --git a/meta-networking/recipes-protocols/nopoll/nopoll_0.4.2.b297.bb b/meta-networking/recipes-protocols/nopoll/nopoll_0.4.2.b297.bb
new file mode 100644
index 0000000..611374c
--- /dev/null
+++ b/meta-networking/recipes-protocols/nopoll/nopoll_0.4.2.b297.bb
@@ -0,0 +1,21 @@
+SUMMARY = "OpenSource WebSocket Toolkit"
+DESCRIPTION = "noPoll is a OpenSource WebSocket implementation (RFC 6455), \
+written in ansi C, that allows building pure WebSocket solutions or to \
+provide WebSocket support to existing TCP oriented applications.\
+\
+noPoll provides support for WebSocket (ws://) and TLS (secure) WebSocket (wss://),\
+allowing message based (handler notified) programming or stream oriented access."
+
+HOMEPAGE = "http://www.aspl.es/nopoll/"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f0504124678c1b3158146e0630229298 \
+                   "
+DEPENDS = "openssl"
+SRC_URI = "http://www.aspl.es/nopoll/downloads/nopoll-${PV}.tar.gz \
+          "
+SRC_URI[md5sum] = "8c411cd0f3c0479aed28c4cf7b114fbb"
+SRC_URI[sha256sum] = "f5fbf8aaa16a77b0f265d8c847eb06cb3e68f2b1a50737466dae81181618654c"
+
+inherit autotools pkgconfig
+
+LDFLAGS += "-lpthread"
-- 
2.10.2


