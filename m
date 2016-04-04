Return-Path: <eduardo@monkey.io>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id EB3907326D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Apr 2016 06:12:58 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id n1so32245396pfn.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Apr 2016 23:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=monkey-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=XZmF0Dv2c0M7Py4tCqOdiJljJl6dUZ1Bs4xtCYUvQW8=;
	b=ii8bsd0+hqru6SBAkk3XW32tJwI3hIpLV9H/A0qpCIsGbx/oS5rLaWgNakedBeni0B
	P6eHzyNVayT/cOhxt43s7QGWbvDoq8LRW1eadGilIeiEyuS7d0t9CpTht2G+q2vu1q0R
	EpcGNACotj4w2fyCUKiXpdYAYh8GKxQCt+5FPjCs2F6kQ557pGEctDTCVRncgzQqIbCm
	B7iLECAcwuggXm2Bflb82UW9Rn+PoFBj/ERiFi+VJ91R4v9nhc1WooSEzoSbZZ4wIb9+
	jPEuC5jiOswdR2ywTTngAj643tHFuI91cVfm8P/XEIwEALsZ1ZUlq4e8j/tckp4bACHV
	nfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XZmF0Dv2c0M7Py4tCqOdiJljJl6dUZ1Bs4xtCYUvQW8=;
	b=f+imNQ1xwlt9MkbqVpr9o/jr2Y0VDv/q++vZL+SHWH3iWcQTA5cK5ZS7J5R6aY41Sb
	i5qYmPi/N9Hw1POi8YD3ZmQQnIA0ck2VBKjTtL0ixywMANmmerYh5gU43N+FtCH853LJ
	2ehBT9+z0BioOKLNKS0646FhM9hmFSh6GLrag2tZJ7JlysnZ0E5kR/gtlgE0A4NT4Q7L
	yWrufH+ZwztKLcJsNvjyHLkL5gTIuD0TRmbX2/iVGcdxOd1nPjcsXUi8EtXAfe2yHlPA
	NlmIZBoJq4uvBuf2LG0VIjvU+CMpN0b/Ped4qX09EjpyiRULD8daaiD5RMFc62E5JHaS
	EbgQ==
X-Gm-Message-State: AD7BkJLSQ20EQTtdJeLMCxA1msnF3f7NQYK54modxwFn2EuKE6zoYY2Oa95yP/ncXKq5Bg==
X-Received: by 10.98.86.28 with SMTP id k28mr18080611pfb.43.1459750379931;
	Sun, 03 Apr 2016 23:12:59 -0700 (PDT)
Received: from localhost.localdomain (wsip-70-166-88-215.sd.sd.cox.net.
	[70.166.88.215]) by smtp.gmail.com with ESMTPSA id
	i9sm36275794pfi.95.2016.04.03.23.12.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Apr 2016 23:12:59 -0700 (PDT)
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Apr 2016 00:12:38 -0600
Message-Id: <1459750358-12047-1-git-send-email-eduardo@monkey.io>
X-Mailer: git-send-email 2.5.0
Subject: [meta-oe][PATCH v2] fluentbit: add new recipe
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
X-List-Received-Date: Mon, 04 Apr 2016 06:13:00 -0000

Fluent Bit is an open source data collector for Embedded Linux, this
patch adds the recipe for version 0.7.2.

  Project web site: http://fluentbit.io
  Documentation   : http://fluentbit.io/documentation/

Signed-off-by: Eduardo Silva <eduardo@monkey.io>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb
new file mode 100644
index 0000000..e757ee6
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Fast data collector for Embedded Linux"
+HOMEPAGE = "http://fluentbit.io"
+BUGTRACKER = "https://github.com/fluent/fluent-bit/issues"
+
+SRC_URI = "http://fluentbit.io/releases/0.7/fluent-bit-${PV}.tar.gz"
+SRC_URI[md5sum] = "6df9d676e1d2d782a243e655e144e8ae"
+SRC_URI[sha256sum] = "695b56ce378f56855c9554f88f5d8e4f7b11ba7691284903870f779912af4ebe"
+S = "${WORKDIR}/fluent-bit-${PV}"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+
+DEPENDS = "zlib"
+
+inherit cmake
-- 
2.5.0


