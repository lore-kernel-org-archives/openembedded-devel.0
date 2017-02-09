Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id A476671E51
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2017 14:27:31 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id 11so794968qkl.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2017 06:27:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PuAV1EvofVCrBq2f1ZwSP0ozgyJllgM5P5YeshP9y/w=;
	b=J6sda8fMnOzzXIskeZckYGVAu+P923aqeochtl/kGYItRK/I8PELERNXEQ7r6EWlqn
	SgKwvCqWAH58T3KCGd7a0bbeE8SpZkMc2jQA245A0eyW+vezotntzUwVJy4yOh63gVKm
	9TAQB/DJfry0dQhk+YVjZZ2S6YKU2c0EiOBCdkHj8wAAe3TmnLljLRgT/x+rMACHiC96
	UyHJrOnZccRiOAVJvOOezUNj8RV0D1M7x+KXiBcwZ5EiehXfkyy7ICFMKh3irG+wcclR
	qRFjsM5y5PyX80qYxkaR4gU/0V/+xzrhh30AUd51LMse71bInpk9cgFrolZrAf6Cxe5R
	F01g==
X-Gm-Message-State: AMke39lecoOC4QOZsWM+apGHfUM/WDcWCDBkXKQPlc1XJtNM/lQ3z0E+mTDOvAJXampy9Q==
X-Received: by 10.55.151.7 with SMTP id z7mr3277413qkd.316.1486650451976;
	Thu, 09 Feb 2017 06:27:31 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	d20sm9235451qtb.17.2017.02.09.06.27.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Feb 2017 06:27:31 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Feb 2017 09:27:24 -0500
Message-Id: <1486650444-11303-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] nginx: update to version 1.11.9
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
X-List-Received-Date: Thu, 09 Feb 2017 14:27:31 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.11.8.bb | 10 ----------
 meta-webserver/recipes-httpd/nginx/nginx_1.11.9.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.11.8.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.11.9.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.11.8.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.11.8.bb
deleted file mode 100644
index 44249a9..0000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.11.8.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require nginx.inc
-
-# 1.10.x branch is the current stable branch, the recommended default
-# 1.11.x is the current mainline branches containing all new features
-DEFAULT_PREFERENCE = "-1"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
-
-SRC_URI[md5sum] = "8f68f49b6db510e567bba9e0c271a3ac"
-SRC_URI[sha256sum] = "53aef3715d79015314c2dcb18f2b185a0c64368cc01b30bdf0737a215f666b34"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.11.9.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.11.9.bb
new file mode 100644
index 0000000..c142836
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.11.9.bb
@@ -0,0 +1,10 @@
+require nginx.inc
+
+# 1.10.x branch is the current stable branch, the recommended default
+# 1.11.x is the current mainline branches containing all new features
+DEFAULT_PREFERENCE = "-1"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=903753de5f86a1ee0341fd2f9491b282"
+
+SRC_URI[md5sum] = "7aeca793819c2b8df134c0b1cfe98361"
+SRC_URI[sha256sum] = "dc22b71f16b551705930544dc042f1ad1af2f9715f565187ec22c7a4b2625748"
-- 
2.7.4


