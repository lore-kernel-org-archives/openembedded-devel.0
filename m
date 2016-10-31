Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 47E9471A31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 22:11:05 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c17so20256406wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 15:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=vQ9I672terd/QTuZzPTKWUfIunTQD3VeML1jnWk/0vE=;
	b=npWzHYWjzJNN9sVXoEy/c8nyLawhoPsqMn8wlLGwrPAfEjKaCvjkg0Boy2F8ZK8sfF
	mWyNSnSxr9o6Wf1HVyq8CC/au6Tox0LJzVVyhOsQeNu0mi8LkiHrdfo0FzLI898ZoX0n
	qkmWg3bALEGt+eGK4A2yywSFDAcWho7MgzM+nWS7jChUs5DWzZv5o3diOM2AzGkmYOqe
	+d3fO/xjxdVAPd9h/8xrJCPjNFah2LNpe+DXH7idDOiP0Odpasc/6SP7AKMtORLatJy1
	WYuuRv61of1KNhH32lpiifUCJEcoNLKDvey4YJSYW3mqbQAMW8TbT9LBIK8HUqru1x0c
	qQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vQ9I672terd/QTuZzPTKWUfIunTQD3VeML1jnWk/0vE=;
	b=FOW+mKMJuXLoomcDVjMzIlol5f999IwwPnuuFPIdjb097VCpuSr89AjVhwbCmPjz9+
	wd9DEKAxlSDG5D18kEjZAB7JFsE/Ftf0Gi+1ghhj9HqCRSlirSjC2P7BHuEC1M53X0+g
	Fcul03aZOLF4MCA1R+5cn0k1Uq9hWa4gc30v0NWXX3PL6JsaPlcLpVHDca+Zwq5FOVnw
	3UlYG3OxGMaFHJKAtsgcKyP1bIzfW6vkNXNMttgQ2CLPsWxXfrbRbLkrz+9nQ26Mbk5w
	ZlfrSS2lWHVjR6wd9En/hNKzEbSsQcUe31tap870hGwTxJ60IXDEhxcHPoiWjSjsSDaT
	tLUw==
X-Gm-Message-State: ABUngveHgixHadrwa9jRQSeBiHGIOJwBpQhKxBxmqo/rrkoy6WKfdOis/8KKY3LKJjcFIg==
X-Received: by 10.194.111.102 with SMTP id ih6mr9613239wjb.214.1477951866784; 
	Mon, 31 Oct 2016 15:11:06 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3FE5.dip0.t-ipconnect.de.
	[91.10.63.229]) by smtp.googlemail.com with ESMTPSA id
	129sm26918697wmq.9.2016.10.31.15.11.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Oct 2016 15:11:06 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Oct 2016 23:10:38 +0100
Message-Id: <1477951849-32149-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
References: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 02/13] python3-psutil: add python3 version of psutil
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
X-List-Received-Date: Mon, 31 Oct 2016 22:11:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Split out common code to python-psutil.inc

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-python/recipes-devtools/python/python-psutil.inc       | 10 ++++++++++
 meta-python/recipes-devtools/python/python-psutil_4.2.0.bb  | 12 +++---------
 meta-python/recipes-devtools/python/python3-psutil_4.2.0.bb |  6 ++++++
 3 files changed, 19 insertions(+), 9 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-psutil.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-psutil_4.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
new file mode 100644
index 0000000..33573fc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-psutil.inc
@@ -0,0 +1,10 @@
+SUMMARY = "A cross-platform process and system utilities module for Python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
+
+SRC_URI[md5sum] = "713f259f917a0c26acfbb7e6ae632ef7"
+SRC_URI[sha256sum] = "544f013a0aea7199e07e3efe5627f5d4165179a04c66050b234cc3be2eca1ace"
+
+RDEPENDS_${PN} += " \
+    python-subprocess \
+"
diff --git a/meta-python/recipes-devtools/python/python-psutil_4.2.0.bb b/meta-python/recipes-devtools/python/python-psutil_4.2.0.bb
index a5703da..d718011 100644
--- a/meta-python/recipes-devtools/python/python-psutil_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python-psutil_4.2.0.bb
@@ -1,12 +1,6 @@
-SUMMARY = "A cross-platform process and system utilities module for Python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
-
-SRC_URI[md5sum] = "713f259f917a0c26acfbb7e6ae632ef7"
-SRC_URI[sha256sum] = "544f013a0aea7199e07e3efe5627f5d4165179a04c66050b234cc3be2eca1ace"
+inherit pypi setuptools
+require python-psutil.inc
 
 RDEPENDS_${PN} += " \
     python-subprocess \
-    "
-
-inherit pypi setuptools
+"
diff --git a/meta-python/recipes-devtools/python/python3-psutil_4.2.0.bb b/meta-python/recipes-devtools/python/python3-psutil_4.2.0.bb
new file mode 100644
index 0000000..d95332c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-psutil_4.2.0.bb
@@ -0,0 +1,6 @@
+inherit pypi setuptools3
+require python-psutil.inc
+
+RDEPENDS_${PN} += " \
+    python3-subprocess \
+"
-- 
2.5.5


