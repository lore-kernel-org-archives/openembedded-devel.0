Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1ECB171BDF
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Dec 2016 03:04:30 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 3so9603252pgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2016 19:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/p7kpouqoVxdvXb2APEOAPMwGG0+nyXtPDF8obNP1gY=;
	b=u87c03BnbcyzfglZdF0IPimNaTaqk5i34Km9oVLMbAx5auDMwa3Cx3nlMPK0jaEc9Z
	e9F3yS+mlzfzSV0NmOHlTsELgYlYUZZZtVNvaZcM1tb6IbManUjqzZE8q1BBkWwHAdnu
	3BmdBDTxaCSthvGkH0p1RqsinQIDl9foKRI2Rxx9XEa7+crx9syStcT5W1UaAuZj4ZMr
	sgXSbSwDVk7hUM3owZgBVThjDSQldtpRCMKqk0tHPUYaEXhgmRa6SM8PaMGtgUZzfWxv
	7Hindd5jLmU8ghIRE/DhN3JuoUqh70TcaiiVOEb6QJwgU642hBX5YIXG+pHrtjMtbwaT
	4f+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/p7kpouqoVxdvXb2APEOAPMwGG0+nyXtPDF8obNP1gY=;
	b=GT5nJXSiZQTCy+6kPpTFpVZ3x1qQfTYVn0PR6f94J8hQEjwQ9nBrFTbNk0D6N9kOk2
	+qWaP0Y6+qlvaiW3Lws59SzNr3XLBMaEIE/iuK+Kz+SeAo+RxSOIm0U82ivLjus4vfPj
	QYHTn1QOZ0bT1FwxFW7E/QO6SQkls1nvHD5+VGsOcUYtwiN45aUkJ/rA8o2xwUK4TthP
	J6YCDnP51Q1NxNh/4wNbfAEf6NenT3DVH5+rmCaXbEstG6ZsxK8+M/vVkhhwtN6t/tr3
	wlAs3G/Xr+XvHrdDupaEjnSHasaD67AEzzK4vwmmFtkKv6hVmGF+lDsd7W4IgSv4FFTm
	qdKQ==
X-Gm-Message-State: AKaTC03zHyyf9VFhbZmLK0DIcCd1RZUaPFQRZub1kk7Ur6nI9S+nR13oOv2u5DaARmktxQ==
X-Received: by 10.99.241.21 with SMTP id f21mr85114300pgi.110.1480734272223;
	Fri, 02 Dec 2016 19:04:32 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	186sm10624342pfv.61.2016.12.02.19.04.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Dec 2016 19:04:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Dec 2016 19:04:20 -0800
Message-Id: <20161203030422.17285-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161203030422.17285-1-raj.khem@gmail.com>
References: <20161203030422.17285-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/8] msgpack-c: Add recipe
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
X-List-Received-Date: Sat, 03 Dec 2016 03:04:31 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/msgpack/msgpack-c_2.0.0.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/msgpack/msgpack-c_2.0.0.bb

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c_2.0.0.bb b/meta-oe/recipes-devtools/msgpack/msgpack-c_2.0.0.bb
new file mode 100644
index 0000000..14e860d
--- /dev/null
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-c_2.0.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "MessagePack implementation for C and C++"
+DESCRIPTION = "MessagePack is an efficient binary serialization format. It's like JSON. but fast and small"
+HOMEPAGE = "http://msgpack.org/index.html"
+LICENSE = "BSL-1.0"
+LIC_FILES_CHKSUM = "file://NOTICE;md5=7a858c074723608e08614061dc044352 \
+                    file://COPYING;md5=0639c4209b6f2abf1437c813b208f2d3 \
+                    file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c \
+                   "
+SRC_URI = "https://github.com/msgpack/msgpack-c/releases/download/cpp-${PV}/msgpack-${PV}.tar.gz"
+SRC_URI[md5sum] = "55148cd856c72f954a6eb9cc889a7d2a"
+SRC_URI[sha256sum] = "41de0989a3385061ab7307a1005655e780def6fc9c89af0ec942616aa787e136"
+
+inherit cmake pkgconfig
+
+S = "${WORKDIR}/msgpack-${PV}"
-- 
2.10.2


