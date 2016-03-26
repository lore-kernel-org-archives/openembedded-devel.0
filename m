Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5B4BF6067D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:18 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id c67so8515094qgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=xdV6gJfAnyXV6XPlFCeeKduFq3IdhRZVw/NzgnE1ua8=;
	b=frj57EtNzM+L0SKKpJ3j6Wtepi6j+MEljZ2KfGrKwPEIwUCnKTpAP9z666ZeljCK/5
	sLCQtsI/YNIHLoqQz8u4iRtm+q1dmYxkZ7RQxo5TEiCBZRDQWavjzc32bhUoauCbbc16
	kVwwpFegG+MUe770Hk3zH4vBfnzOIwcdEi0tvQPZ6Es1K/AeCLWJdjBewWZRju0+JDco
	R/xGyC5ZwAQdD6sI7w2CpxB/7ssvGPcOW1rBa296XXInOlQtlBmLvxNswMXG7+BTGKd7
	c9pW5Y8DqMI1cGNrwDun+nxVVk5uGnsmsL689XRfD4vjLjbMdKzbLLJcvU961iZr/KVs
	0NGA==
X-Gm-Message-State: AD7BkJJcDUvcVmotHBCaLDwkZGVYHLWGyCofRUYjT8q7xCh4b1hHb6Wl77txBagtoY7xDQ==
X-Received: by 10.140.145.151 with SMTP id 145mr24675758qhr.95.1458997519192; 
	Sat, 26 Mar 2016 06:05:19 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:18 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:37 -0400
Message-Id: <4d4904daa728e8b95245db6396761e7ad662df6e.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 17/30] python-pep8: update to 1.7.0
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:18 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pep8_1.4.6.bb => python-pep8_1.7.0.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pep8_1.4.6.bb => python-pep8_1.7.0.bb} (50%)

diff --git a/meta-python/recipes-devtools/python/python-pep8_1.4.6.bb b/meta-python/recipes-devtools/python/python-pep8_1.7.0.bb
similarity index 50%
rename from meta-python/recipes-devtools/python/python-pep8_1.4.6.bb
rename to meta-python/recipes-devtools/python/python-pep8_1.7.0.bb
index e3a421e..262b862 100644
--- a/meta-python/recipes-devtools/python/python-pep8_1.4.6.bb
+++ b/meta-python/recipes-devtools/python/python-pep8_1.7.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Python style guide checker"
 HOMEPAGE = "https://github.com/dreamhost/cliff"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=b0d37793ab91ca25ad5c200e9ea22331"
+LIC_FILES_CHKSUM = "file://README.rst;md5=d8ebbbe831259ce010179d2f310b0f3e"
 
-SRC_URI[md5sum] = "a03bb494859e87b42601b61b1b043a0c"
-SRC_URI[sha256sum] = "603a46e5c358ce20ac4807a0eeafac7505d1125a4c1bd8378757ada06f61bed8"
+SRC_URI[md5sum] = "2b03109b0618afe3b04b3e63b334ac9d"
+SRC_URI[sha256sum] = "a113d5f5ad7a7abacef9df5ec3f2af23a20a28005921577b15dd584d099d5900"
 
 inherit pypi setuptools
 
-- 
1.9.1


