Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id CD0DA780BA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 16:35:09 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id a46so10317879qte.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 09:35:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aPZjYzwAwtiCmhZPvOCDeHqbU6rzRMCEAGIfe0oto9Y=;
	b=ak4R8HYnwlKu8HHGRzATFBsHS0K5s9ve3dqcKA0PFXw9FM26cXiR+ZEsK3+6JqN9gj
	qqxD7jAk/ESv0oTDsNTCvFjz/p1PSFLjrkD+R9gvWB/rG58uT4qEiobaIX4T0l3G7P9R
	O2pfx6Pa5kjHyJJyJc0mo9BuhjtfFVx992b8sfHXn/8oPnV2h4FRDyrsPZilOYOkNbOy
	ix4HOt5rCWfVFB/kjNT7GtmrkVTXzmkzEX8Z09jcK3BZUzH6UXQSkeLO6fvyJjp/dOoA
	7M4fwgKJhn1mWU1eDQcQ/4BmUxK93y+kfVgX/uaOquHhuNwRtNNxXp15y0uDNiAHNCuG
	MyFw==
X-Gm-Message-State: AODbwcDdNPfedjnJoDfswlHDljqRZwR0eava1UUYwfit3/tVXPZyWnP9
	HAU1meFd3FsiNg==
X-Received: by 10.200.40.46 with SMTP id 43mr10566046qtq.132.1495211710700;
	Fri, 19 May 2017 09:35:10 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	135sm2418922qkh.29.2017.05.19.09.35.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 May 2017 09:35:10 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 May 2017 12:35:01 -0400
Message-Id: <1495211701-23452-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] nginx: update stable version to 1.12.0
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
X-List-Received-Date: Fri, 19 May 2017 16:35:10 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.10.3.bb | 6 ------
 meta-webserver/recipes-httpd/nginx/nginx_1.12.0.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.10.3.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.12.0.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.10.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.10.3.bb
deleted file mode 100644
index b62fd4c..0000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.10.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require nginx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
-
-SRC_URI[md5sum] = "204a20cb4f0b0c9db746c630d89ff4ea"
-SRC_URI[sha256sum] = "75020f1364cac459cb733c4e1caed2d00376e40ea05588fb8793076a4c69dd90"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.12.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.12.0.bb
new file mode 100644
index 0000000..d3e15a8
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.12.0.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=903753de5f86a1ee0341fd2f9491b282"
+
+SRC_URI[md5sum] = "995eb0a140455cf0cfc497e5bd7f94b3"
+SRC_URI[sha256sum] = "b4222e26fdb620a8d3c3a3a8b955e08b713672e1bc5198d1e4f462308a795b30"
-- 
2.7.4


