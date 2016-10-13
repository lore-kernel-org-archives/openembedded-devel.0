Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7DCDE71957
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 22:33:51 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n189so7269695qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 15:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Y7s1nGaZ7yMsrjt/0EzUBQ/tAvqlKDb0owmyT3+mP2s=;
	b=il6/vC5ywB/wgCIR/wyPwFsrY8vzcoz3VXzKOOK9bENilhBFbQh++wHqVfeTJZCYsy
	5XWpOCZBRnv+7zd9rDSqI8+vt7eoeeAeOxpRnKal+VvHSz08vrNP+uv8so6jhUvnK0kR
	g/D1umdYmi+vrKsC9bR2MGmXzr9M1fDuQ7LwJeQPRECmXrbLGyNcwLwJ8j8CCKqgQ6DE
	c2+xLrix/b0puD2OSd6BvdshqvkgtICpOOB9bYdaOzRazJcMk2wO0WnQsx6LSG8qkBQN
	XOpHf9AqaAKtKqgD5JkEx9XjdNRjGhEKR46guORq7iAyOdyuzvyHwPHDMM8zelpPxRQt
	RacQ==
X-Gm-Message-State: AA6/9RmC8H8kj72OcMWNebO9Z1FsLiHPhIs8DOKbU99zu9Y8loV3q5SLdktOEHI3it6sQg==
X-Received: by 10.55.145.129 with SMTP id t123mr8585393qkd.130.1476398033357; 
	Thu, 13 Oct 2016 15:33:53 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	e36sm4527964qtd.42.2016.10.13.15.33.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Oct 2016 15:33:51 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Oct 2016 18:33:37 -0400
Message-Id: <1476398017-22934-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] nginx: update to version 1.11.5
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
X-List-Received-Date: Thu, 13 Oct 2016 22:33:52 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-httpd/nginx/{nginx_1.11.3.bb => nginx_1.11.5.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.11.3.bb => nginx_1.11.5.bb} (64%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.11.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.11.5.bb
similarity index 64%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.11.3.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.11.5.bb
index 4e17c8a..ae05c96 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.11.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.11.5.bb
@@ -6,5 +6,5 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
 
-SRC_URI[md5sum] = "18275c1daa39c5fac12e56c34907d45b"
-SRC_URI[sha256sum] = "4a667f40f9f3917069db1dea1f2d5baa612f1fa19378aadf71502e846a424610"
+SRC_URI[md5sum] = "db43f2b19746f6f47401c3afc3924dc6"
+SRC_URI[sha256sum] = "223f8a2345a75f891098cf26ccdf208b293350388f51ce69083674c9432db6f6"
-- 
2.7.4


