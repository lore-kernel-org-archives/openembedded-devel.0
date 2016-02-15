Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 527D0731DB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2016 16:07:24 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id s68so56874172qkh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2016 08:07:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3FmHumc38cOP9LQFBvRJxThjPtRLnypAH3Wj0yLFat8=;
	b=TXYKxndpScGrZGGZa0irfYg7p6QZrpQuo4CrXh+vcZ5BY7mK8M4HQUo9yefrjm76Tt
	MYJG8Bb/q8MR4pykx+vSck1GriqpBnZ6w0TmPDWt4purmEXQ8z0ccUnYx7/vvnvVzcQS
	u6FUwtP7xWdA54IgwZT5mCb/57/crWJJZTeW2QEYZXHste2I20NfNWsG+LBxcoRE4QdP
	YuRrkC7bZ7NxoEpyZEjwbDlXyi26GviJEFb4bIqrdk9MaOHgjwEI94vgysM3+NsGC3GG
	6SDl4YTPBonN1jMGZArtLZkop+2if3GtUV2SfUzdDfqZoSZ6fuoS8JQpWaw/IZnk8Aep
	vmyA==
X-Gm-Message-State: AG10YOREnEkhvIOrp+NJnU24SfHCklzaAOr+pWD6LPRpF0Dtsvk5YwM+jvEA4sCpwVOnCA==
X-Received: by 10.55.79.86 with SMTP id d83mr21553879qkb.22.1455552445390;
	Mon, 15 Feb 2016 08:07:25 -0800 (PST)
Received: from build-slave.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	v76sm9888224qkl.15.2016.02.15.08.07.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Feb 2016 08:07:24 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Feb 2016 11:07:13 -0500
Message-Id: <1455552433-24315-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-webserver][PATCH] nginx: update to 1.9.11
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
X-List-Received-Date: Mon, 15 Feb 2016 16:07:25 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-httpd/nginx/{nginx_1.9.10.bb => nginx_1.9.11.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.9.10.bb => nginx_1.9.11.bb} (96%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.9.10.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb
similarity index 96%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.9.10.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb
index 5d63d41..4ea06c7 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.9.10.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb
@@ -19,8 +19,8 @@ SRC_URI = " \
 	file://nginx-volatile.conf \
 	file://nginx.service \
 "
-SRC_URI[md5sum] = "64cc970988356a5e0fc4fcd1ab84fe57"
-SRC_URI[sha256sum] = "fb14d76844cab0a5a0880768be28965e74f9956790f618c454ef6098e26631d9"
+SRC_URI[md5sum] = "76eb5853a1190e0cfc691aa21c545de3"
+SRC_URI[sha256sum] = "6a5c72f4afaf57a6db064bba0965d72335f127481c5d4e64ee8714e7b368a51f"
 
 inherit update-rc.d useradd
 
-- 
1.9.1


