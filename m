Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5817370178
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2017 14:26:46 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id i34so777635qkh.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2017 06:26:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jdx4ttDvkHBeQ6OQtpo0ViQVrRiQFSWskb+Sm64LjxE=;
	b=msJCC3QnE4LC8RxdTqhmuWAkaHFpkLxNiLhzmhR1r+5A54bmBdLCzsOC98htDwdFsX
	s19L7n0qdDs5x2XR+qJS17P/bc8DxJzmsttse+DVJpydvUq7khLZHJvb+nOqHwqrQhwI
	wlsfLmdrYVMuzwU96eezU+yNekjnuTHVBMN4IMSL2KnhFZJVTscrKKF3TOy/RC6lEZjU
	MZe4Xuojku6QPgDjNxhpYZ0XIQCi6wG/pECGIWqtwKnpCPjk0+FCPyb7KIp5Pyblf/FC
	6aKHKz5gCkXpFV2F2mb4dB6mJxWWRdc6p2DV2g9lSs9BV6U89lHdS7CmbRLNJHxxWDRc
	lyyA==
X-Gm-Message-State: AMke39m+vtjnZixtlXn4scJ5vQHjhPn02ab3afPBkHGzUKunG26IKU+UvycDmvVLcDvYtw==
X-Received: by 10.55.168.137 with SMTP id r131mr2992929qke.177.1486650406747; 
	Thu, 09 Feb 2017 06:26:46 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	y189sm9247820qky.39.2017.02.09.06.26.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Feb 2017 06:26:46 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Feb 2017 09:26:39 -0500
Message-Id: <1486650399-11236-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] nginx: update to version 1.10.3
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
X-List-Received-Date: Thu, 09 Feb 2017 14:26:50 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.10.2.bb | 6 ------
 meta-webserver/recipes-httpd/nginx/nginx_1.10.3.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.10.2.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.10.3.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.10.2.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.10.2.bb
deleted file mode 100644
index ea7d3d5..0000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.10.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require nginx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
-
-SRC_URI[md5sum] = "e8f5f4beed041e63eb97f9f4f55f3085"
-SRC_URI[sha256sum] = "1045ac4987a396e2fa5d0011daf8987b612dd2f05181b67507da68cbe7d765c2"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.10.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.10.3.bb
new file mode 100644
index 0000000..b62fd4c
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.10.3.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
+
+SRC_URI[md5sum] = "204a20cb4f0b0c9db746c630d89ff4ea"
+SRC_URI[sha256sum] = "75020f1364cac459cb733c4e1caed2d00376e40ea05588fb8793076a4c69dd90"
-- 
2.7.4


