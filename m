Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4D71E771F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 02:06:39 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id q11so1176827qtb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Aug 2016 19:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=H0hdL0zIHwGwIO7pTWDbtV0An/d7QzwlYevjtxglBcI=;
	b=VWAS+qT8EHPBLDO4xYylwAfyJmc0ROWdnqlPpo06ibJ0u/9FCRuDS785Fd/4S/9pV/
	0wEao8IL4nhxtfKsGXr66RMrEyrSi8+ExaSR/rHp7EwwhMCV3sKgQP0xdj0OIM3zEGe7
	y8bEMcqBgh8ZeWtbKlW2PccBPzChdtueTMyyjdo6g/lEMzklbb/bXNjqwRxIC7ybNdve
	OMHzPRlCDMB4bogfpsphdTKdQO7lQV+B7Oj/NSJ3k84hQ7QbAFyK/kzS2ZaXEn8kZIsq
	gxPCibvIr1TJcx3ufGU9T9A4yTyyc3af5km89e0diHJ0jVjeUvXvJnDvZN6oRYt7QwxQ
	oHMg==
X-Gm-Message-State: AEkoouuvJ+E0IZ3Ua5sAwLJIhKrC75KUyLM0mO6VsFG+e0HwRMJyjFZHOrCKJpiRopcx+Q==
X-Received: by 10.237.47.225 with SMTP id m88mr1701482qtd.106.1470794799843;
	Tue, 09 Aug 2016 19:06:39 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id p70sm9771107qke.1.2016.08.09.19.06.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 19:06:39 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Aug 2016 22:06:33 -0400
Message-Id: <1470794793-3976-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1470794793-3976-1-git-send-email-derek@asterius.io>
References: <1470794793-3976-1-git-send-email-derek@asterius.io>
Subject: [meta-webserver][PATCH 2/2] nginx: update to version 1.11.3
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
X-List-Received-Date: Wed, 10 Aug 2016 02:06:39 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.11.2.bb | 10 ----------
 meta-webserver/recipes-httpd/nginx/nginx_1.11.3.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.11.2.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.11.3.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.11.2.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.11.2.bb
deleted file mode 100644
index d8f78d0..0000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.11.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require nginx.inc
-
-# 1.10.x branch is the current stable branch, the recommended default
-# 1.9.x is the current mainline branches containing all new features
-DEFAULT_PREFERENCE = "-1"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
-
-SRC_URI[md5sum] = "9db11337a924a665ff68c1785bcf314e"
-SRC_URI[sha256sum] = "a0327be3e647bdc4a1b3ef98946a8e8fbf258ce8da6bed9a94222b249ae2700a"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.11.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.11.3.bb
new file mode 100644
index 0000000..4e17c8a
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.11.3.bb
@@ -0,0 +1,10 @@
+require nginx.inc
+
+# 1.10.x branch is the current stable branch, the recommended default
+# 1.11.x is the current mainline branches containing all new features
+DEFAULT_PREFERENCE = "-1"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
+
+SRC_URI[md5sum] = "18275c1daa39c5fac12e56c34907d45b"
+SRC_URI[sha256sum] = "4a667f40f9f3917069db1dea1f2d5baa612f1fa19378aadf71502e846a424610"
-- 
1.9.1


