Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7D04C787CE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 20:56:33 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id d21so938054qkj.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 12:56:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KkTTMxorIPpV0YONMg1U4BhvO8NWAPI/8GzUlZAi7Gk=;
	b=ZujSglA727Yn0fEftxfqutr9sUwrL26QT5tYSe5l0XbgRbYPsUeye6hfQXJHx7BTyT
	wmJ5dI7/0lh41Sf3X5iorSWfkmqTt5Cu1eYC5dJ6SOD6L+NqmrQEaOJ0DTc/CLuT1irP
	isGRt8pv9dmdKgRMkv/C2q3zTsLBRvZYzjG1LQTFI5VCqLkjdKmFrE++dFuY2HqmZ7KV
	AQT4/cNX7lPbhN3MFWbXjBNvlyn3sSRdo1SHplpgdPXF26ULdpke794V7k3lG/UkJNOY
	dRk8FNJZRHFu0Mxx/iJv38nNYKzyhGz3nm+t22hzZ97Fc4TctEJkAjLYUAcC4qfijPqB
	5DBw==
X-Gm-Message-State: AKwxytcmCDF46MGZmV0JAT4d/AS24k3PPRFJqV/oixAKBK431R/FE+CW
	GOhXlDv0Fjw8DeOxcAqZk1/7wM+q
X-Google-Smtp-Source: ACJfBovsk4/IyT38O6YPMm2d1BmiVB/K/Hy2VKXmTsxc2kxS+0YZQBLXWfoxFrovhIRrXrWpPbx/Jw==
X-Received: by 10.55.245.19 with SMTP id l19mr26460491qkk.184.1515617794041;
	Wed, 10 Jan 2018 12:56:34 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	w41sm11148076qtc.19.2018.01.10.12.56.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Jan 2018 12:56:33 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jan 2018 15:56:25 -0500
Message-Id: <1515617786-1202-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-grpcio: update to version 1.8.3
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
X-List-Received-Date: Wed, 10 Jan 2018 20:56:33 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-grpcio_1.8.2.bb => python-grpcio_1.8.3.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-grpcio_1.8.2.bb => python-grpcio_1.8.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python-grpcio_1.8.2.bb b/meta-python/recipes-devtools/python/python-grpcio_1.8.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python-grpcio_1.8.2.bb
rename to meta-python/recipes-devtools/python/python-grpcio_1.8.3.bb
index 5b0724e..ab0b85c 100644
--- a/meta-python/recipes-devtools/python/python-grpcio_1.8.2.bb
+++ b/meta-python/recipes-devtools/python/python-grpcio_1.8.3.bb
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec
 
 inherit pypi setuptools
 
-SRC_URI[md5sum] = "4d4ce91b5a56d724227aa116f971402c"
-SRC_URI[sha256sum] = "1ea1336f0d1158c4e00e96a94df84b75f6bbff9816abb6cc68cbdc9442a9ac55"
+SRC_URI[md5sum] = "a611ac877a1e613ba7dc24dc06d9bf88"
+SRC_URI[sha256sum] = "6ce5fd3093ddc09a152981d5c477ac645eda19dfcc819e45d8c57da6b743bd53"
 
 # For usage in other recipes when compiling protobuf files (e.g. by grpcio-tools)
 BBCLASSEXTEND = "native"
-- 
2.7.4


