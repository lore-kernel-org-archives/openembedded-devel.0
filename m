Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 202C4780B6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 16:34:26 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id a46so10315321qte.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 09:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=S+5ZmLur3nw84B2bt0PEzVXtWuQPe1ur6rj3xJKT7Dw=;
	b=jElF9vilMcM3diTI+5//boe5C4M9jiJFh5BCgvAnYAV80LddtiOko26DSYEs94Gp/t
	6+cPsyNXZ5sJH/H/hoh/XrFAZf1tw1YxnpfsjXOkL93oFclmmj05iZVsKS1wE3TbrMnS
	OKHMCEgZu3rE2K47Hdo8ItSCTVeWnOrk2NVKWZEzUCUgNu6Yf+3cgNkryH4vdCbuIQEP
	bwEot7qeZ5edKg6FcnpcObDYac2J1ZwBmH0bT7TTyrbGf5V1aCov/ysI1Q1sBHyZClmQ
	qTkGG86IZ+SMgVdJVRNrPxc13mtfh8rCMBBqfXOFOroQnU8YmG8l/F7ZXGb6grkM+qEX
	3iRQ==
X-Gm-Message-State: AODbwcAWwvPk7qRtmEtCEf4VI7x2IpqgGDQzzQ+lhnYMc7Qge2jJs+4w
	fDWPqZemziXbKQ==
X-Received: by 10.237.37.209 with SMTP id y17mr11104742qtc.140.1495211668022; 
	Fri, 19 May 2017 09:34:28 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	d21sm6215231qke.62.2017.05.19.09.34.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 May 2017 09:34:27 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 May 2017 12:34:07 -0400
Message-Id: <1495211647-23387-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] nginx: update development version to 1.13.0
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
X-List-Received-Date: Fri, 19 May 2017 16:34:28 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.11.10.bb | 10 ----------
 meta-webserver/recipes-httpd/nginx/nginx_1.13.0.bb  | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.11.10.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.13.0.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.11.10.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.11.10.bb
deleted file mode 100644
index 37565fc..0000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.11.10.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require nginx.inc
-
-# 1.10.x branch is the current stable branch, the recommended default
-# 1.11.x is the current mainline branches containing all new features
-DEFAULT_PREFERENCE = "-1"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=903753de5f86a1ee0341fd2f9491b282"
-
-SRC_URI[md5sum] = "6fb10f579055d27a2240d51c7d85c190"
-SRC_URI[sha256sum] = "778b3cabb07633f754cd9dee32fc8e22582bce22bfa407be76a806abd935533d"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.13.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.13.0.bb
new file mode 100644
index 0000000..a999acc
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.13.0.bb
@@ -0,0 +1,10 @@
+require nginx.inc
+
+# 1.12.x branch is the current stable branch, the recommended default
+# 1.13.x is the current mainline branches containing all new features
+DEFAULT_PREFERENCE = "-1"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=903753de5f86a1ee0341fd2f9491b282"
+
+SRC_URI[md5sum] = "0ff7057465d5622c5b1279e91b273e96"
+SRC_URI[sha256sum] = "79f52ab6550f854e14439369808105b5780079769d7b8db3856be03c683605d7"
-- 
2.7.4


