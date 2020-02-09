Return-Path: <straka.derek@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 581BD60D1F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Feb 2020 16:01:11 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id h9so3919947otj.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 08:01:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9gzcGQNbty7Dt8TI2g5s+dbnTgz+XHe72TBMNr/0x8M=;
	b=kyKs666zQISnf2ZPuq7DH1qwbXas8M4S+IpuVsNd0ka6ER/1jdJuUKLoRghbhT4p/+
	rgAIACDXl7SxvqFPmSeSyfBCPsMg3AU03w+Te2HmFs81ObXEkUsVtioi4B7jzODiN5AV
	DQceujTK5v435HWf8gdN7WOM4ykyId432YxhYQkagTQWKwUsOWS1iAt4U3G6hkMpCr90
	xrRfS5ffop4EyKyHgcvMFXugmTpTQ90DWEX6rEz4r1d8nHCMsydrrhY7Fk19mn3AsRcC
	mdoTwyVYFWr0gbuwBg/fYXQ/sizXZVQBkxE8iemD5K2AuOJIn1RSkxwVa4exIW2dBvW2
	p8hQ==
X-Gm-Message-State: APjAAAXs3ZIee4GL6G9/sjyiRjE3OUJbWgWoURnV1cdPz/y7KadKejR8
	08/RHBwxWhYPVUmJ8eVJC5Xgy9Ae1lg=
X-Google-Smtp-Source: APXvYqwA3TXTdABIKzPz16/GLex5QKboLtQ2PVmEWyiYT8pGkMVtcVpfgCwaI9w6Zr2X6xapV1tPOg==
X-Received: by 2002:a9d:7a96:: with SMTP id l22mr7183167otn.217.1581264072209; 
	Sun, 09 Feb 2020 08:01:12 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id h1sm3473001otm.34.2020.02.09.08.01.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:01:11 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 11:00:35 -0500
Message-Id: <20200209160035.8589-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-webserver][PATCH] nginx: update to the latest stable version (1.16.1)
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
X-List-Received-Date: Sun, 09 Feb 2020 16:01:12 -0000

See changlog here: https://nginx.org/en/CHANGES-1.16
  * Fixes CVE-2019-9511, CVE-2019-9513, CVE-2019-9516

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.16.0.bb | 10 ----------
 meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb |  6 ++++++
 2 files changed, 6 insertions(+), 10 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.16.0.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.16.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.16.0.bb
deleted file mode 100644
index cad0db6fc6..0000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.16.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require nginx.inc
-
-# 1.16.x branch is the current stable branch, the recommended default
-# 1.17.x is the current mainline branches containing all new features
-DEFAULT_PREFERENCE = "-1"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
-
-SRC_URI[md5sum] = "97207283f30cd90cdba638c3ea30323a"
-SRC_URI[sha256sum] = "4fd376bad78797e7f18094a00f0f1088259326436b537eb5af69b01be2ca1345"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb
new file mode 100644
index 0000000000..207642575b
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
+
+SRC_URI[md5sum] = "45a80f75336c980d240987badc3dcf60"
+SRC_URI[sha256sum] = "f11c2a6dd1d3515736f0324857957db2de98be862461b5a542a3ac6188dbe32b"
-- 
2.17.1


