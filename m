Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 53226601A4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Jul 2016 12:11:42 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id n132so12638836qka.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jul 2016 05:11:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Mmq7cQwQznny36LKAWinkVGRuwL6/tPHjOTjCQaRMDU=;
	b=PtYeQhJqYJpJdbC5Ty2fmCJF4fqIf/aTWpuPbr5RQ6q1ez6/M3SXmN5ld5aVuXZFvG
	XkfuYhIKkvgf40CeZIxQX2ndIOrR2w/pIIZTNS6YvZglqJjADHNCZfxYdjL8RfHWmwt3
	bOsuD+QF6ZwTeJemQb1WcpuWxa1f1um7JS/ZXmB7fbWH3r/8qsbZJe84tGpqaVGpIznl
	0XclVOsPXclXvO1s1dISYudXCZKOK3ruFIBOkRei/t1W2IhKvp0+t+QKds7UzWrvKxRP
	RcQHOFi9NTU/KPYAtz4YccobVQsTBCQwIzwltFeQ/6YaRFO1KHZ5tFX/W8MEwW4j+kVv
	bHfg==
X-Gm-Message-State: ALyK8tIuk+xFbW4RA64zeh061Z43lLx9qVo7dqWNljqBOGdkiBhnz4GwGDHWIuX75ZtPZQ==
X-Received: by 10.55.175.134 with SMTP id y128mr13850762qke.67.1468066303381; 
	Sat, 09 Jul 2016 05:11:43 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	s127sm2384908qkb.17.2016.07.09.05.11.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Jul 2016 05:11:42 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jul 2016 08:11:27 -0400
Message-Id: <1468066287-9196-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-webserver][PATCH] nginx: update to version 1.11.2
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
X-List-Received-Date: Sat, 09 Jul 2016 12:11:45 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-httpd/nginx/{nginx_1.11.1.bb => nginx_1.11.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.11.1.bb => nginx_1.11.2.bb} (64%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.11.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.11.2.bb
similarity index 64%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.11.1.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.11.2.bb
index eade7ed..d8f78d0 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.11.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.11.2.bb
@@ -6,5 +6,5 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
 
-SRC_URI[md5sum] = "0f3900165b11c417854535f3538913cb"
-SRC_URI[sha256sum] = "5d8dd0197e3ffeb427729c045382182fb28db8e045c635221b2e0e6722821ad0"
+SRC_URI[md5sum] = "9db11337a924a665ff68c1785bcf314e"
+SRC_URI[sha256sum] = "a0327be3e647bdc4a1b3ef98946a8e8fbf258ce8da6bed9a94222b249ae2700a"
-- 
1.9.1


