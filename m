Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0070A77352
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 17:40:57 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y68so7827312pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 09:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hMcyRbML22exdN4lBNwXBdeeEq9HiFEgEI/XDB1lDXA=;
	b=tXNLpvZLWIXXhBss1HU4hTGgXUZ5/uV/UEUWjUEL5/6HcAFZVQlNXemHgXc3UZ5zG5
	NOqYdeF6F4uq8n1hp5ifdmEsKIOae09+orbvVt5U6Ny7QPggcnVuKot9QvKwSoezF5Uq
	zGUg5g49yojcyGQs4zJK2c1vR2vRbGQMIaSPmTi5YyH9pnRfAEHjbUb7KKjcZepnFiM5
	ziFZaYN6Af7uE/U0MwGHAZAOWogzGaB6Y8+38mre7dK/hGLs/GosGsXyGTEc1iUw7NQE
	VNKmV9uU1XfXRbxsNmL6Q4xG0nMqISJXqXNkPIolX34/7hTIaX/OJjqaTZR/B8mkmpdW
	+uBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hMcyRbML22exdN4lBNwXBdeeEq9HiFEgEI/XDB1lDXA=;
	b=btAkwI1nt5tkO6l87t+EjYdidexyI4ByL+DagKCblOYUYNAfekPSsEZYjiWdvdrdv1
	D53+4xDb0KyktlatSLQUjnVrkOEyTXKboUxhVQruYwyI50udzDyDF/0JxCR3+QK6bWp1
	VV2SNypW8M8ibN0Xb1L3+hknX96cEwXg2lWiD6l8pzx0ZSFv0wHksjaQUQQuy69XXqdU
	he3tkcgiQnpTiiwOWZGDrE1JNBfICY+Cu/v3LLYqkZ5D0EF+RCDMjyIGpbsmECqRBp7G
	rtuxm9dFMPM7lqUv8mtGQ95Kv2V0wLsxb0eJS7C7aX4QG620juKPcxDsvFNVLQZL9Waa
	cyTw==
X-Gm-Message-State: AKaTC02xwUuAZyPJw2xF2/kd7CjSOFSixnDSPd9TKpgB3DItfTEzulNr8U0za89Az5eMGA==
X-Received: by 10.99.228.5 with SMTP id a5mr30956467pgi.1.1482169258990;
	Mon, 19 Dec 2016 09:40:58 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	n25sm32986493pfi.33.2016.12.19.09.40.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Dec 2016 09:40:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	obi@opendreambox.org
Date: Mon, 19 Dec 2016 09:40:52 -0800
Message-Id: <20161219174052.9440-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH V2] libmng: Add recipe
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
X-List-Received-Date: Mon, 19 Dec 2016 17:40:58 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb

diff --git a/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb b/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
new file mode 100644
index 000000000..377184050
--- /dev/null
+++ b/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
@@ -0,0 +1,22 @@
+# Copyright (C) 2016 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Development files for the Multiple-image Network Graphics library"
+HOMEPAGE = "http://www.libmng.com/"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=32becdb8930f90eab219a8021130ec09"
+SECTION = "devel"
+DEPENDS = "zlib lcms"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${P}.tar.gz"
+
+SRC_URI[md5sum] = "7e9a12ba2a99dff7e736902ea07383d4"
+SRC_URI[sha256sum] = "cf112a1fb02f5b1c0fce5cab11ea8243852c139e669c44014125874b14b7dfaa"
+
+inherit autotools-brokensep pkgconfig
+
+PACKAGECONFIG ??= "jpeg"
+
+PACKAGECONFIG[jpeg] = "--with-jpeg,--without-jpeg,jpeg"
+PACKAGECONFIG[lcms] = "---with-lcms2,--without-lcms2,lcms"
+
-- 
2.11.0


