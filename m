Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4973273259
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 19:02:56 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id o1so8981763qkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=gxytN8gxFirufjzjoRbtfc22bg9skZr7hml+wiD1Ox0=;
	b=jEf4rc49pTle8HyqynjwOEOedv04kFdzyqSSrBAP8Lwm370S5mvpTvXlcNVSmFnQfa
	n75ME0rBULPxJvwUYsq/hj0VwoVRKJeA2jDyoZuidwdv/a5SZF9CY2FvQBd8FijIKKd6
	jbjagKUYiXmWrGEIcHwCsEe+ZoW6fmnhG5AmRDD4LTt01O9n3J4tfckmJgpzU7Q/Yid4
	7QUIgeDua5lVHFP3/c/FCJbTWpByfsyszkQXEW9gkNNhfxHXclq4Fea1TTCn7mAXYDMh
	NsFJRn50Ikk0/6Z71YRzqAyRvd/nfZ7OLW4h4ElyFjfbzWtARkZqVcfzT5xNAOe7fX6W
	dBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=gxytN8gxFirufjzjoRbtfc22bg9skZr7hml+wiD1Ox0=;
	b=OpBKnLKAZp+t/aRZEf+3nHKHXWEBR8IYiorJx9u32tABHb4M3KIeHEAnd+W2zt+6Hw
	OEtz6i3DSMOs3Q4d7zoVF6VgU6dypavsVVhMqHtZFQjm3whBE1GMm7mVpmx4sSwAyW2c
	Z9d81O8uwdDHHY3REKhyfv+SSrT5V8ZbmXBCiAyZRqbVMK/Dg2un9TdOiFcrDr1tfJ8q
	rPw3nYnuHsT4X6GfEBTbUPey9I8Yf28W9YcQVnJR/05ABfWIyoQsDeMdlq033XoV1Ydu
	SkI+FRRDG6JksJordbHTPHwlxmJwlgDH7xOnmt6k4d9EukInA2GzsRitAVLEIvNvQNRi
	39wQ==
X-Gm-Message-State: AEkoousLeNhYEIL+sIK7rBe0mg5u+sMcPUS4VryWnpjXf4zpZF+9mHxh2N4Kzy9FOCDe9Q==
X-Received: by 10.55.16.11 with SMTP id a11mr26180886qkh.222.1471892577466;
	Mon, 22 Aug 2016 12:02:57 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	g29sm10452469qtg.12.2016.08.22.12.02.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Aug 2016 12:02:56 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2016 16:01:18 -0300
Message-Id: <1471892491-6177-4-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 04/17] python-pyasn1: Extend recipe to support Python 3
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
X-List-Received-Date: Mon, 22 Aug 2016 19:02:58 -0000

  - Add Python 3 recipe
  - Add native and nativesdk to BBCLASSEXTEND
  - Add python-lang and python-shell to RDEPENDS

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-pyasn1.inc      | 14 ++++++++++++++
 meta-python/recipes-devtools/python/python-pyasn1_0.1.9.bb | 11 +----------
 .../recipes-devtools/python/python3-pyasn1_0.1.9.bb        |  2 ++
 3 files changed, 17 insertions(+), 10 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pyasn1.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pyasn1_0.1.9.bb

diff --git a/meta-python/recipes-devtools/python/python-pyasn1.inc b/meta-python/recipes-devtools/python/python-pyasn1.inc
new file mode 100644
index 0000000..7c25de8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyasn1.inc
@@ -0,0 +1,14 @@
+SUMMARY = "Python library implementing ASN.1 types."
+HOMEPAGE = "http://pyasn1.sourceforge.net/"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=425e62320d430219736139b134db2fc4"
+
+SRC_URI[md5sum] = "f00a02a631d4016818659d1cc38d229a"
+SRC_URI[sha256sum] = "853cacd96d1f701ddd67aa03ecc05f51890135b7262e922710112f12a2ed2a7f"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-lang \
+    ${PYTHON_PN}-shell \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.1.9.bb b/meta-python/recipes-devtools/python/python-pyasn1_0.1.9.bb
index 017adfe..4461918 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1_0.1.9.bb
+++ b/meta-python/recipes-devtools/python/python-pyasn1_0.1.9.bb
@@ -1,11 +1,2 @@
-SUMMARY = "Python library implementing ASN.1 types."
-HOMEPAGE = "http://pyasn1.sourceforge.net/"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=425e62320d430219736139b134db2fc4"
-
-SRC_URI[md5sum] = "f00a02a631d4016818659d1cc38d229a"
-SRC_URI[sha256sum] = "853cacd96d1f701ddd67aa03ecc05f51890135b7262e922710112f12a2ed2a7f"
-
 inherit pypi setuptools
-
-RDEPENDS_${PN} += "python-lang python-shell"
+require python-pyasn1.inc
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1_0.1.9.bb b/meta-python/recipes-devtools/python/python3-pyasn1_0.1.9.bb
new file mode 100644
index 0000000..a5e2a71
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyasn1_0.1.9.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-pyasn1.inc
-- 
2.1.4


