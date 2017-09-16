Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5A0767833C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Sep 2017 22:43:59 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id r66so3506406qke.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Sep 2017 15:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jKhGMADuib0tt8y2/ciuqgRCX4Y26x5HHkZV+QZnIDY=;
	b=ttmsyLwRzZc6T+BIf7Ps/jwxPtp380iEiA9pOQNudp7ODiqLUdHbH2zCArIxh/uOB+
	FDWoBp1xkTpl+Apg0XSK2FayKLOzNCXqxcVzPq1/J+kZpduPTV3drDf1I2F4mT1ZWQzn
	f4R1b5vM4AHiRjc0t111B664kF0QXN+00fp2hbASVogaOndXIXNscp5YkJN4+ASJsQ8v
	hKovCVB4hgVrGetN7i4P6DHP4X8/6kEvpB0R6FQgwJIgDnEigb9p4qGKvpwy0dHQbQN4
	Ox1E4sq2isz3VwlEUSeXSRcOixonSWt6nA6z5974erN0aaPEszhNOCtCpISJc9qUM8K3
	0L8Q==
X-Gm-Message-State: AHPjjUhOOXOXIn8KZVYYpIXNfM3YG4FBKXiVJxiQRuO89KD4X01yOSM2
	RIVU8g7i3GHcPxU1ePA=
X-Google-Smtp-Source: AOwi7QD323wwoTPVOtga9VJE4qxOxTn+w0kctKEHBPagAtr6hw+aS68UQOQ3waGs4fYXoMBqR9bicQ==
X-Received: by 10.55.75.75 with SMTP id y72mr5027586qka.118.1505601840096;
	Sat, 16 Sep 2017 15:44:00 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id w5sm2654913qkd.47.2017.09.16.15.43.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Sep 2017 15:43:59 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Sep 2017 18:43:51 -0400
Message-Id: <1505601831-14782-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-ndg-httpsclient: update to version 0.4.3
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
X-List-Received-Date: Sat, 16 Sep 2017 22:43:59 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-ndg-httpsclient.inc        | 4 ++--
 ...ython-ndg-httpsclient_0.4.2.bb => python-ndg-httpsclient_0.4.3.bb} | 0
 ...hon3-ndg-httpsclient_0.4.2.bb => python3-ndg-httpsclient_0.4.3.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-ndg-httpsclient_0.4.2.bb => python-ndg-httpsclient_0.4.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-ndg-httpsclient_0.4.2.bb => python3-ndg-httpsclient_0.4.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc b/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
index 3c6253f..133cab1 100644
--- a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
+++ b/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://MANIFEST.in;md5=ce22c0cd986d2de3f7073cd6b5523ae0"
 
-SRC_URI[md5sum] = "b3a958c0e9aaf4d3f8dd933f46f8c1a9"
-SRC_URI[sha256sum] = "580987ef194334c50389e0d7de885fccf15605c13c6eecaabd8d6c43768eb8ac"
+SRC_URI[md5sum] = "59a2f0a5b3b60e6c520a9cc7be9aff87"
+SRC_URI[sha256sum] = "7bfd8c5cfcbc241a93ca6a4e45f952650f5c7ecf7c49b1dbcf5f4d390240be0b"
 
 PYPI_PACKAGE = "ndg_httpsclient"
 
diff --git a/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.4.2.bb b/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.4.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-ndg-httpsclient_0.4.2.bb
rename to meta-python/recipes-devtools/python/python-ndg-httpsclient_0.4.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.2.bb b/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.2.bb
rename to meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.3.bb
-- 
2.7.4


