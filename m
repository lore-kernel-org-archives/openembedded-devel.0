Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1835B7883A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 17:53:09 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id d18so11215514qke.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 09:53:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=F+5TcCkoAR0+t24KDWJU6vqR38AZcrusLjcG7HgtkiE=;
	b=E3xY25c41cjJlsNx2Xi9xS0gsiQCPLhY+eexg6a8bw51WmXnJ7p+lkhpwC3WJc591z
	TOwFcHTFpabESKPhQH2Wf5I0h+Z0Gec60qo9L8XQOj7rRTHhITnm5OsepVO43Sv0qz5X
	yDnPdU950WhQNSeqJzHjDHsFoNdiYpQrccV1uAd3y/laAlJyLaefZZSyucKtwSY0Pveb
	8VfiGsDDYpvVrhcnp8nQDu6/2biL4r4ZtzpalVqBQXh+D8o9jX37Lf+QmV7PdX+hmLah
	cg/fNpvxMicqXvjBBdm2R8V2YbaQddyVxwcHMaE8WnbVH/0brh3Qj1/fdQwYXkDVvdIF
	W4zQ==
X-Gm-Message-State: AKwxyteTSMwQBzxtg9yIBGCLWwxxtxsNVeIEbGzhkNpwY2zNMd/m5YLS
	/0UVOJk66iU4GyNblpfz7OGgMjzw
X-Google-Smtp-Source: AH8x225NpR1b6SiXvzGS7yD7UE+zTezIW0bV0lnyfgabZZIKj0g0xNYzJVGwKEpGTOkAuKryVh5G4g==
X-Received: by 10.55.75.216 with SMTP id y207mr20727018qka.7.1517334790917;
	Tue, 30 Jan 2018 09:53:10 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	d16sm9830965qkj.47.2018.01.30.09.53.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Jan 2018 09:53:10 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Jan 2018 12:52:57 -0500
Message-Id: <1517334778-30445-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-grpcio: update to version 1.8.4
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
X-List-Received-Date: Tue, 30 Jan 2018 17:53:10 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-grpcio_1.8.3.bb => python-grpcio_1.8.4.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-grpcio_1.8.3.bb => python-grpcio_1.8.4.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python-grpcio_1.8.3.bb b/meta-python/recipes-devtools/python/python-grpcio_1.8.4.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python-grpcio_1.8.3.bb
rename to meta-python/recipes-devtools/python/python-grpcio_1.8.4.bb
index ab0b85c..bec9d84 100644
--- a/meta-python/recipes-devtools/python/python-grpcio_1.8.3.bb
+++ b/meta-python/recipes-devtools/python/python-grpcio_1.8.4.bb
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec
 
 inherit pypi setuptools
 
-SRC_URI[md5sum] = "a611ac877a1e613ba7dc24dc06d9bf88"
-SRC_URI[sha256sum] = "6ce5fd3093ddc09a152981d5c477ac645eda19dfcc819e45d8c57da6b743bd53"
+SRC_URI[md5sum] = "7860f7c61de3890323670b7b1ff63e56"
+SRC_URI[sha256sum] = "88d87aab9c7889b3ab29dd74aac1a5493ed78b9bf5afba1c069c9dd5531f951d"
 
 # For usage in other recipes when compiling protobuf files (e.g. by grpcio-tools)
 BBCLASSEXTEND = "native"
-- 
2.7.4


