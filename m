Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id BF0E360670
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 13:47:08 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id 12so2441466qtm.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 06:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AobcM6sjHJ3afnoUW4zh1XMQsCwygNA7lBHQNmm9ZQc=;
	b=WszTWuX+lFIUHXxAPQUH/ALxJRAeXzxpB5BHZk9u3Cx74vPCWAfvIAgc52YuBspVtX
	FM0mjE8P7m1BtiPZnRVXgW6jNMM0OrU7lL/4at+fJqVD5+FXcPiR3Ov9rML2X0OdlZAq
	v9xwpMB9ub8xCrCa3ARs6Y8riwGn3b4C7VQ7/7hxgpHdOWRBpomC2nAkZ2mWvW6F12X6
	1k2CGwnY5+r2cUz0Bo1IALbi3e1R9iTp8eJyJ8Cb/IVzA0QrhsN6rUKyCNCKElFjkSo0
	OB0MN7PK97xPCkkdLBa9Dmi5Yht34HlDX6CWhnqsBnBAvlWO3CeRZBDuqNV0Ea4Ep4vA
	DEVw==
X-Gm-Message-State: ABUngvcEvA8QqL/11r0txsCS2m8wBAAkdpx2SgUwVw8WF4gCM1t7xq9zoLfNJDi5k35Uyw==
X-Received: by 10.237.46.1 with SMTP id j1mr8311946qtd.29.1477662429675;
	Fri, 28 Oct 2016 06:47:09 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3])
	by smtp.gmail.com with ESMTPSA id i5sm6267334qtb.14.2016.10.28.06.47.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Oct 2016 06:47:09 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Oct 2016 09:46:58 -0400
Message-Id: <1477662418-29346-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1477662418-29346-1-git-send-email-derek@asterius.io>
References: <1477662418-29346-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-html5lib: update to version 0.999999999
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
X-List-Received-Date: Fri, 28 Oct 2016 13:47:08 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-html5lib_0.9999999.bb   |  8 --------
 .../recipes-devtools/python/python-html5lib_0.999999999.bb | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-html5lib_0.9999999.bb
 create mode 100644 meta-python/recipes-devtools/python/python-html5lib_0.999999999.bb

diff --git a/meta-python/recipes-devtools/python/python-html5lib_0.9999999.bb b/meta-python/recipes-devtools/python/python-html5lib_0.9999999.bb
deleted file mode 100644
index bb92e59..0000000
--- a/meta-python/recipes-devtools/python/python-html5lib_0.9999999.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-SUMMARY = "HTML parser based on the WHATWG HTML specifcation"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c"
-
-SRC_URI[md5sum] = "ef43cb05e9e799f25d65d1135838a96f"
-SRC_URI[sha256sum] = "2612a191a8d5842bfa057e41ba50bbb9dcb722419d2408c78cff4758d0754868"
-
-inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-html5lib_0.999999999.bb b/meta-python/recipes-devtools/python/python-html5lib_0.999999999.bb
new file mode 100644
index 0000000..d0f7b56
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-html5lib_0.999999999.bb
@@ -0,0 +1,14 @@
+SUMMARY = "HTML parser based on the WHATWG HTML specifcation"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c"
+
+SRC_URI[md5sum] = "8578e4e3a341436cb9743a9e4a299239"
+SRC_URI[sha256sum] = "ee747c0ffd3028d2722061936b5c65ee4fe13c8e4613519b4447123fc4546298"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-webencodings \
+    ${PYTHON_PN}-xml \
+    "
-- 
2.7.4


