Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 35C8571C7A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 13:27:09 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id 31so34682520qtz.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 06:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jrmVcQLs+10YgeBXzLUGqvFECdFV7T7GPqTk1Ta+Xf8=;
	b=haZbstJhrxIOk4gSELjAH6Ae9uCqhnA22OqNRqBy9TpvXKDReIqdwfO9E+whSmHcy2
	OyeI22CgYxuQIw9k5/Bk8h4/dLQuJEMXpbEuFD0RQ7KsKlIdZh9jq80a43JcfOIIqAeR
	HaPo6PUNSBc6FJjscP/GslYDbrDSQEWdJcUlQwK+pNmPqEn8pWq+ujg9CsoAhl6RcIfT
	gnE3FmhyDOBHe7mkJTfrQM9ygnb+MsG9oYxWR+40FlPE42R1/88YvakNQKoCKS2pZQPT
	CEIEVluw4qldIwh/WWwx36EQ+Hn2DsYcyOTXms+UaPmtyImRQVwBii1pZogkgNk2omf5
	MnAg==
X-Gm-Message-State: AMCzsaUADSB4lTVpdQ8+IzmpqVzmQfAgEvZfykARvwUnLQ26UMAMfVH0
	itIjKnqxeKqU0W20QFt16Z8F9xL4
X-Google-Smtp-Source: ABhQp+QAVgOBeqnisfigwRk5PYnHQMGZVax8PLkQEh7F4iu7heu2Qzvun2XZGHUc6Wmx5bYN7BhEVQ==
X-Received: by 10.200.44.77 with SMTP id e13mr31241431qta.238.1508938030840;
	Wed, 25 Oct 2017 06:27:10 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	o138sm1717860qke.76.2017.10.25.06.27.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Oct 2017 06:27:10 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Oct 2017 09:27:02 -0400
Message-Id: <1508938022-6274-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-grpcio: update to version 1.6.3
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
X-List-Received-Date: Wed, 25 Oct 2017 13:27:10 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-grpcio_1.6.0.bb => python-grpcio_1.6.3.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-grpcio_1.6.0.bb => python-grpcio_1.6.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python-grpcio_1.6.0.bb b/meta-python/recipes-devtools/python/python-grpcio_1.6.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python-grpcio_1.6.0.bb
rename to meta-python/recipes-devtools/python/python-grpcio_1.6.3.bb
index 7155f42..203bb36 100644
--- a/meta-python/recipes-devtools/python/python-grpcio_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python-grpcio_1.6.3.bb
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec
 
 inherit pypi setuptools
 
-SRC_URI[md5sum] = "c91b8c105ff4163b41790f3b63db92e1"
-SRC_URI[sha256sum] = "6cd793d515ec53587a8968f2a53647f1449763ad06be0d287e3c1e47418e1e50"
+SRC_URI[md5sum] = "6637c4dfee8166f69be7571591b6c57c"
+SRC_URI[sha256sum] = "e9662782c58bc21be26163b78136eaed091dfd45fac699cb711ee9eeeb7e2f9b"
 
 # For usage in other recipes when compiling protobuf files (e.g. by grpcio-tools)
 BBCLASSEXTEND = "native"
-- 
2.7.4


