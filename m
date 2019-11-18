Return-Path: <nick83ola@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 812E97F953
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 11:23:15 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id t1so18981793wrv.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 03:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qMdbYOhmKVi4upxqEYYXb3yE4Xr6lFQs8RUW1pa+a5Y=;
	b=UXUoRy/ry+Izh3vmTFJtzy67BepUT6BCTIiM3dE/x9ZrrAFBPTDPXkk6diCqZeX1D7
	o41/40S1fwXuCSVxL8us/bkSGjrn6qTtIuIU4zgQupu48Nt5SyovN2n28j4uPLVPvkHz
	YVkAJDdYOyLYJOW16cRq76NFogi1pFi1isLXQ5iHLbwcrL919Wd5kEeUWyHrzLI67QLS
	ccRJjn+x9MGgTJwxltEQvUCKrCufUkUL28yWeAzrrNxIRFNpOw2S1v7/Y21en23ZrIyR
	r89u2b7KldXmNpN02L6GMEUdLyU0xdNCuELrTrMHRQKqhIsx9KcFl54/3QuFDBGemwAw
	+6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qMdbYOhmKVi4upxqEYYXb3yE4Xr6lFQs8RUW1pa+a5Y=;
	b=ezURhofAh6owZ+iqCa+fzWvGRbLaxGgw3upNFqxohVi8fk9PmYR9xCAa6tj7XhmXIk
	uxPwEALbA1OlJIt5n4gQvi1hjz2xNGiCnvyMrx0plySF7roKsPPpwABp+rW8kBjwqTi7
	Enpu+WzAFptwQYLViBYVoWYj1KLvHaZy5uoa8RFWDA4fIuqn7ef1Et1LkeQQkpCRu97a
	3DIBInNySlfPeQTHmwF5GtOWMsZK4UAteJ6YpfQ96Ku+UeIZOQ3N9rx7wBD9gyYrjN8r
	LC4ukc1cxoFJo10NPdNlyKq1elieqmqQR0ze8orBjz5nkvH+f3myyESqL1+1NdLRCoZ6
	wVMA==
X-Gm-Message-State: APjAAAXUnbdxbOLXL9jD6CMdtb3cccDYpjPqqn5jrUtSAXWuzXIaEoxE
	pR9OIesGv6UzxUtCsBhhlvKw4qGwHEQ=
X-Google-Smtp-Source: APXvYqyKswifv6D2U6ib68RKGY76UlMZwLK28PkofSnRJRsnPan45ro1tVOm6g6bxDtxAnoJLhUAhA==
X-Received: by 2002:a5d:6350:: with SMTP id b16mr20629449wrw.357.1574076195790;
	Mon, 18 Nov 2019 03:23:15 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	n23sm19688866wmc.18.2019.11.18.03.23.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 03:23:15 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Nov 2019 11:22:58 +0000
Message-Id: <20191118112257.40935-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python3-jsonrpcserver: add recipe
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
X-List-Received-Date: Mon, 18 Nov 2019 11:23:15 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../python/python3-jsonrpcserver_4.0.5.bb     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-jsonrpcserver_4.0.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.0.5.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.0.5.bb
new file mode 100644
index 0000000000..bf9eb0a1cc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.0.5.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Library to process JSON-RPC requests"
+HOMEPAGE = "https://github.com/bcb/jsonrpcserver"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c89120516900f96f4c60d35fdc4c3f15"
+
+SRC_URI[md5sum] = "d41e9f6b310cb29b0d8f213ff9d57567"
+SRC_URI[sha256sum] = "240c517f49b0fdd3bfa428c9a7cc581126a0c43eca60d29762da124017d9d9f4"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+    python3-apply-defaults \
+    python3-asyncio \
+    python3-core \
+    python3-json \
+    python3-jsonschema \
+    python3-logging \
+    python3-netclient \
+    python3-pkgutil \
+    python3-typing \
+"
+
+BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
-- 
2.20.1


