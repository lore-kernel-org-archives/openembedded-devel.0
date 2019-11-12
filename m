Return-Path: <nick83ola@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 95EB77F74C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2019 12:39:37 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id p4so18331729wrm.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2019 04:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0SfGSLyyeq+VZvyGXAfV248HiQrCDUKBllDFZnUNOFg=;
	b=qyMYA6pbEf42OfCbb9diZ0XbWAYoCtqXpvCbR9V4Gvvar8GjbRqnnMh29ZCoEpCt6y
	0znLNz2g4D4V78s42b5NbDRxQZ3IBPfbW8LrfppszrAmIx/r6HhxSuH7oQFhdi0KT5yo
	LwaCokBrYRnMPilKpegN1TB5ziWd5TQ6UX2+L0W5WPpCgBFnpjv6lkHv5hhFbRqbn373
	z8bttKAJeqASm1zbSY1Bzz24cIiYqjeqJiq+qrRSiX/nzkysPArfN6PJGxaN9HKG607e
	OEBua/N4ELj8aelmPndHtNHnSwJABEZ+Rb+muuhOCMYpvBvzH4tycnyZpRnsSSt1N8FC
	6gtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0SfGSLyyeq+VZvyGXAfV248HiQrCDUKBllDFZnUNOFg=;
	b=ppTgIEnD7ICr4J+IUXg261yNHkmZRf7p6cr0x4NkmkOjqe2Csey0pFu6P844oPOoIg
	awZTjdhecnvcNvEOoJKz9gWY8oqIWMuNpOKVcQHvZPsE0KsEoQzEy6BoIW5d+0OABbL5
	7RLeN7003WvNAgC/M/I+DyWsVa8GC3vTxM2Jbqnn/q7yfHgPCnd+h2AmTGyVBd4570S/
	K40XT6McDQJt5lVv6ReC/URsHQP+9HvMfivM7Mi/La9fCPfDi5vc5DY/Sa3vTZYfF4+D
	o1fTrJngULgG2zmi6CGQsOymP8vDmSeJBfoG2eSJKaYlJkA9prdTHd5yYP0rtZ1Nq8Jm
	SgSg==
X-Gm-Message-State: APjAAAXFWNUuD2M5Hm+ouen0Nh0ZKUgfuL1g75xuaOFMGXBw0T9fXiFq
	BRMbpO9tYXdsmRCRrfMgFvp1jq04xaI=
X-Google-Smtp-Source: APXvYqx0tgPlj3KyGOVeGYll1my6tdkfg7271tTW8w14nfCqu//MNH4lbqWfAD//S7nzrxYUsyW+bQ==
X-Received: by 2002:adf:de86:: with SMTP id w6mr25304170wrl.220.1573562377647; 
	Tue, 12 Nov 2019 04:39:37 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	z6sm23824962wro.18.2019.11.12.04.39.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Nov 2019 04:39:36 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Nov 2019 12:39:12 +0000
Message-Id: <20191112123911.20569-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python3-gmqtt: add recipe
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
X-List-Received-Date: Tue, 12 Nov 2019 12:39:37 -0000
Content-Transfer-Encoding: 8bit

gmqtt is a modern client library for mqtt v5 that uses asyncio to work.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../python/python3-gmqtt_0.4.4.bb             | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-gmqtt_0.4.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.4.4.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.4.4.bb
new file mode 100644
index 0000000000..ff89087a18
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.4.4.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Client for MQTT protocol"
+HOMEPAGE = "https://github.com/wialon/gmqtt"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=903f1792621a3b35ee546da75d139177"
+
+SRC_URI[md5sum] = "af3a2c6c2f8e3c934b31159ffdce5fd6"
+SRC_URI[sha256sum] = "b96bca8a54b8af057d4cc42a79f9e2b40cdbb5a2bfebbc5f05ee35575d3e3089"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+    python3-asyncio \
+    python3-core \
+    python3-datetime \
+    python3-json \
+    python3-logging \
+    python3-netclient \
+    python3-typing \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


