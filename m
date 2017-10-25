Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id F24D371A74
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 00:22:07 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id y23so28541509qkb.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 17:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5xAVqeqsn6DskebSR1ipggdt8trX8um4VdBrCanH5m8=;
	b=nzsga8GDX6OtKwD4sqoOeleCXxBjsMDwlRyUH8BNQ7aLk9cVOrjHws+kr5yotwF7We
	fctw4qYqNd9P65y891fXd114pdbtbWlFGxI//ZxtZjkMkVxBYyOag8aXKCa3Bl5Ab7Zi
	fUoiUZP9Zx9LyhMJaN8Q7xFzndVPz1/faveu125miaxOgFTC1EKOEa9VqNnwFAF/7Jlr
	q2y7hWMGJuEnccpjgNOCWwolO8tr3OyjUI3Cd5NOfxBWRJmWrKH9j+MY95N0f4bb0a0u
	bDTHkq9EQQRqxBld1mixymLK085ZVxiNNx7NnCTV1/515gG4F6+YVO6JzXNryY/iWhvA
	ByIg==
X-Gm-Message-State: AMCzsaVOWX2L61JC5k8uBBbFKi3djxftFtr0TQAKYijnkH2HYPdrDmVA
	gXKe8eJNbePBzF45s/7Annk51RwA
X-Google-Smtp-Source: ABhQp+RH/xOZo0txoc1u0mFC5JGvMVa9YSQzw6dRPk+sNh149B3caWTLfZZq38K0q+9DZmPezPVoIA==
X-Received: by 10.55.39.5 with SMTP id n5mr607794qkn.106.1508890928640;
	Tue, 24 Oct 2017 17:22:08 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	l207sm994606qke.97.2017.10.24.17.22.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Oct 2017 17:22:08 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Oct 2017 20:22:00 -0400
Message-Id: <1508890920-5689-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-mprpc: update to version 0.1.16
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
X-List-Received-Date: Wed, 25 Oct 2017 00:22:08 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc        | 4 ++--
 .../python-mprpc/{python-mprpc_0.1.14.bb => python-mprpc_0.1.16.bb}   | 0
 .../python-mprpc/{python3-mprpc_0.1.14.bb => python3-mprpc_0.1.16.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-mprpc/{python-mprpc_0.1.14.bb => python-mprpc_0.1.16.bb} (100%)
 rename meta-python/recipes-connectivity/python-mprpc/{python3-mprpc_0.1.14.bb => python3-mprpc_0.1.16.bb} (100%)

diff --git a/meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc b/meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc
index b9535fc..05fbae4 100644
--- a/meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc
+++ b/meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
 DEPENDS += "${PYTHON_PN}-gevent"
 RDEPENDS_${PN} += "${PYTHON_PN}-gevent ${PYTHON_PN}-msgpack ${PYTHON_PN}-gsocketpool"
 
-SRC_URI[md5sum] = "66e6cf367ea71cfed8938a27e9c183c3"
-SRC_URI[sha256sum] = "5ccada6526d48ac4d95a7bbdc093586663841560337032a503f57ccfae69d7bf"
+SRC_URI[md5sum] = "acde1f346411997d76ab89790a356823"
+SRC_URI[sha256sum] = "e8ddd47e7a2fb2d3b203fcc522443ee5be56c8f7e2c6d915c047445951cef1fb"
 
 inherit pypi
diff --git a/meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.14.bb b/meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.16.bb
similarity index 100%
rename from meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.14.bb
rename to meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.16.bb
diff --git a/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.14.bb b/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.16.bb
similarity index 100%
rename from meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.14.bb
rename to meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.16.bb
-- 
2.7.4


