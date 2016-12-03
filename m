Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 772C071C42
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Dec 2016 03:04:31 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id p66so9590307pga.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2016 19:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pQJ6bgpmLqCJ5xJnIxa6yWuGeXyforkjo34urwKeX1E=;
	b=NIEnm1XJzpg0pZ2ueapG+UboyKHLkEuBS1VOgqD7gC5N+iwQHmhNX/uHY/GRI1hJZB
	9R7Q0oo3673WlJu9KZFk5gn4f5rK6wVXjT9l5LBIJGzmIJUoNvRIKmTzW93DEhmXKYLP
	Uhm97oeAFcJIQf2hYoTEvaG0gRzJXWMDQ/yBGTcIUHEELETU/l0zmGmoMuNcMEU85M2R
	WKlrH9ZtyH6XPUBGXq1xNbfj2JdxgyhhBwfk8sqv4Y8Vn+zxE7ZySTdVXp201siMX+PF
	MlRvn5Q47oymWbqCpHG15icx7GU5iuuSOOU1lNDVJIBihWePkK7f/YIVDfxIYcXr7QLA
	QTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pQJ6bgpmLqCJ5xJnIxa6yWuGeXyforkjo34urwKeX1E=;
	b=OtAJRUwd6H/c3HNljGCj7bUmyGu4NNLWDJMbV+Q6SaPBZODCvqQ24CNDB9mFSXAffd
	pYKnFRN57wnnbLMCB1KxZDS0OQP5u10DLiRBz7XnQUTHIPZ63I6ieKNNuHG5cdG6ePPz
	W9rz5j9h4lnw2yJ5uSVhVUlvIKSL4Ju+AgSz8ODBIjD4tjfakR+FJOqxawofc/BKjX6+
	ANAZrWdpdO6/RTO1OV0VXzNwuL3epC8Y9gldXApO6puf3t6inOgJXB4DStXx97cBGP5Y
	hBeMCgCysQxl/QUsGA7fjoF2FEar7PLHR2mLow9sixSPmfR5SyaQsqd2uiYQxurIAa3h
	0VAg==
X-Gm-Message-State: AKaTC01x1lBEZl+C7hESbVYivILA6CUVO4uS77sO0weEdOf7OUMO0PJqxFsbbBFeCf8kPw==
X-Received: by 10.99.55.30 with SMTP id e30mr84029975pga.75.1480734273088;
	Fri, 02 Dec 2016 19:04:33 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	186sm10624342pfv.61.2016.12.02.19.04.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Dec 2016 19:04:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Dec 2016 19:04:21 -0800
Message-Id: <20161203030422.17285-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161203030422.17285-1-raj.khem@gmail.com>
References: <20161203030422.17285-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 7/8] avro: Add recipe
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
 meta-oe/recipes-support/avro/avro-c_1.8.1.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-support/avro/avro-c_1.8.1.bb

diff --git a/meta-oe/recipes-support/avro/avro-c_1.8.1.bb b/meta-oe/recipes-support/avro/avro-c_1.8.1.bb
new file mode 100644
index 0000000..ebaab4f
--- /dev/null
+++ b/meta-oe/recipes-support/avro/avro-c_1.8.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Apache Avro data serialization system."
+HOMEPAGE = "http://apr.apache.org/"
+SECTION = "libs"
+
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=73bdf70f268f0b3b9c5a83dd7a6f3324"
+
+DEPENDS = "jansson zlib lzma"
+
+SRC_URI = "${APACHE_MIRROR}/avro/avro-${PV}/c/avro-c-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "b268348536714541e10411823a1b59b0"
+SRC_URI[sha256sum] = "e5042088fa47e1aa2860c5cfed0bd061d81f9e96628f8b4d87a24d9b8c5e4ecc"
+
+LDFLAGS_append_libc-uclibc = " -lm"
+
+inherit cmake
-- 
2.10.2


