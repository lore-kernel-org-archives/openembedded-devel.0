Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id B6D3D782AF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 18:07:38 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id t2so10626208qkc.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 11:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4Q1ANDgt1mhCeeKNgzN+hsR1mVYZWlOV4vT+eG+CYJ4=;
	b=dV1Q70KFDBhwhNDTCk9kc/IRgu5l894hAM9fOppFgQJ+NRF8Zf8oaEnaoiksSujz8A
	IXqjALQyydCHLQB4izghdHl5aqdk9l5ifi5omt0pOJlA4vCdvumBvgzOZy2a6C2fKeiw
	eijRTz7hMEFyCeu2sXH32P0bOQNo7yZOz/Qlsz3S85ggc+rotlnZ0nWdvVovGC+O86Ah
	r9MXzXfqNTZHfV3JKh5iZ1RfGL5UJSkzq/KMzFRoa4IKazmQe/jpvDivLRmJjle9jReF
	xtIjlUCGnQpnL874lk04eByRtvjPUwXAjV24mEZUCZ3m3lIx/5f+Aol7Rz8eC5BbzgkC
	9uZg==
X-Gm-Message-State: AIVw112b9QDu+sSpxZbXsJGwvtsSbLnF14KXDTSBYp0gx7Sqi25Y4aDD
	8esfIMadUJQklh+OVDA=
X-Received: by 10.55.217.157 with SMTP id q29mr21855741qkl.152.1500919659595; 
	Mon, 24 Jul 2017 11:07:39 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.81.71])
	by smtp.gmail.com with ESMTPSA id 27sm8807293qts.61.2017.07.24.11.07.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Jul 2017 11:07:38 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jul 2017 14:07:30 -0400
Message-Id: <1500919650-14646-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python3-cassandra-driver: update to version 3.8.1
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
X-List-Received-Date: Mon, 24 Jul 2017 18:07:38 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cassandra-driver.inc       | 4 ++--
 ...n3-cassandra-driver_3.8.0.bb => python3-cassandra-driver_3.8.1.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cassandra-driver_3.8.0.bb => python3-cassandra-driver_3.8.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cassandra-driver.inc b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
index 3146bc7..43c346d 100644
--- a/meta-python/recipes-devtools/python/python-cassandra-driver.inc
+++ b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
@@ -8,8 +8,8 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 SRCNAME = "cassandra-driver"
 
-SRC_URI[md5sum] = "7561a89cd8a432a22cf33abef76b64ee"
-SRC_URI[sha256sum] = "10b0c88854f3bddcfd994cb208d780507de62524ef8dcb4f068c084d335b7054"
+SRC_URI[md5sum] = "67b107df88b0a609497814609685d0a3"
+SRC_URI[sha256sum] = "2c35138c52fb85f3889a2841af1d39a0fe91e2f58a6205b1676944d2f4cbefec"
 
 DISTUTILS_BUILD_ARGS += " \
     --no-libev \
diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.8.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.8.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cassandra-driver_3.8.0.bb
rename to meta-python/recipes-devtools/python/python3-cassandra-driver_3.8.1.bb
-- 
2.7.4


