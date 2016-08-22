Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 863B176420
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 19:03:16 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id c52so3087613qte.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=n0OcUkHWhhnw8pxqr8E2d9qymuhZ7nvV3HqvKzciVUo=;
	b=M7FC3dLFAu9h3HPniZiqj8zEPvx85Wn+Pn0v9x3t/kP2Sv5a2Qx0RbIVzoxXq45twR
	0P7b0+KlskgGQxMgTGZ66Q9UtSOxOIgEHrr7ZAGo+eJwK1wWcZmLSoHhT6gSu9hALnp+
	tbPWbXYSVzMZmr4CVQkoUvgUsVFGaMT+s+b2izJgZ9pK+7xIzoiPW9QtlEUBQmTzw0rY
	yqvrkzPvBCWRm7ANkPdTIc0RNKyZ3FRYwjkBw5TV6nTCCSxj31jijoXnDTBAyTh4iouM
	Jz6N/A9xg2wtPHBAWFHnVoU9QLrNvjvIL2870DNfIu6M1iIKOyfzAxXvL/Dw0uHIdVPn
	GI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=n0OcUkHWhhnw8pxqr8E2d9qymuhZ7nvV3HqvKzciVUo=;
	b=l9xr42MoD5R+C6xeb4gb4OQKPQiWRVjXLeqpU8bzmgBmMOOs9YXP5jUInXI9qg/odq
	UnK/eW5KYSEp3dcXTyuPpYY61rJ/fapbIt/1IwqvcZ592tgMkjo/pGLUYBld4iFAI0YK
	jmmktrvLDa4wUFohLHUUf/gl79b7mOwRLy1rvvg0+5x2W7Xxobxg5EJHujON2auDqOkd
	Ixs3/B49vVBlUEZh0M17EyqcLrQqLoW5dxvbji+8mj089khFLvJtPUfXvxxYpoEb0gTv
	JZAxF6U76Pid+oYIbibjt9cY5Gm9isUWwT5xaoDu0NwmaABt5iR7HBMA9XaGtRGQQs1k
	BvWQ==
X-Gm-Message-State: AEkoouvGO+oxbHFHPCsP99ToPGR82yanD80Pxv9rHdYNRpjZZnrssdLwlESsXZHR/LC2sw==
X-Received: by 10.237.54.34 with SMTP id e31mr25035430qtb.132.1471892596695;
	Mon, 22 Aug 2016 12:03:16 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	g29sm10452469qtg.12.2016.08.22.12.03.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Aug 2016 12:03:15 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2016 16:01:23 -0300
Message-Id: <1471892491-6177-9-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 09/17] python-iso8601: Extend recipe to support Python 3
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
X-List-Received-Date: Mon, 22 Aug 2016 19:03:16 -0000

  - Add Python 3 recipe
  - Add native and nativesdk to BBCLASSEXTEND

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-iso8601.inc        | 8 ++++++++
 meta-python/recipes-devtools/python/python-iso8601_0.1.11.bb  | 8 +-------
 meta-python/recipes-devtools/python/python3-iso8601_0.1.11.bb | 2 ++
 3 files changed, 11 insertions(+), 7 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-iso8601.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-iso8601_0.1.11.bb

diff --git a/meta-python/recipes-devtools/python/python-iso8601.inc b/meta-python/recipes-devtools/python/python-iso8601.inc
new file mode 100644
index 0000000..dd4b83c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-iso8601.inc
@@ -0,0 +1,8 @@
+SUMMARY = "Simple module to parse ISO 8601 dates"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844"
+
+SRC_URI[md5sum] = "b06d11cd14a64096f907086044f0fe38"
+SRC_URI[sha256sum] = "e8fb52f78880ae063336c94eb5b87b181e6a0cc33a6c008511bac9a6e980ef30"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-iso8601_0.1.11.bb b/meta-python/recipes-devtools/python/python-iso8601_0.1.11.bb
index 484cf12..c543cf9 100644
--- a/meta-python/recipes-devtools/python/python-iso8601_0.1.11.bb
+++ b/meta-python/recipes-devtools/python/python-iso8601_0.1.11.bb
@@ -1,8 +1,2 @@
-SUMMARY = "Simple module to parse ISO 8601 dates"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844"
-
-SRC_URI[md5sum] = "b06d11cd14a64096f907086044f0fe38"
-SRC_URI[sha256sum] = "e8fb52f78880ae063336c94eb5b87b181e6a0cc33a6c008511bac9a6e980ef30"
-
 inherit pypi setuptools
+require python-iso8601.inc
diff --git a/meta-python/recipes-devtools/python/python3-iso8601_0.1.11.bb b/meta-python/recipes-devtools/python/python3-iso8601_0.1.11.bb
new file mode 100644
index 0000000..4a332b5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-iso8601_0.1.11.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-iso8601.inc
-- 
2.1.4


