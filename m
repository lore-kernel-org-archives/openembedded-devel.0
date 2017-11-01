Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id BD152605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Nov 2017 16:40:27 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id o187so3406780qke.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Nov 2017 09:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZfXoNTCJCo9kWVfkuKhwA9kEdC3rDSMqdbKjwJEz+YU=;
	b=YbNuwtEHcB4+qRHnqh9CxoOPRHBp8g/DA14B66/IopybESA7mq8H7l+jeLDGJLj6G1
	f2r/naDWUz3NxINPQlXM18kiRP6cmUMXquLBKqsJ0hetvd/m4iyJmBHlPnlsr8dZmIEE
	uCVLMIMNDlKu4grhJyJK0KRjPQMrSMWdoaOkrWbFukNFnKFULnrONYLmayxW923CjvVo
	KNvZuabRjBq6ahGWIb1GPrllKAo63TSx5GRiRoXGQyy5YZ/NRcRmTcNepbuf0eIFQqiR
	3uwN3hiLQQv7iermjgrXDUqjG2BrKdErm3CIRh2HP0gIUwxXMPQcGvneb9JLwOXQ6H0X
	9/Vw==
X-Gm-Message-State: AJaThX6YQ3QvWukzlObN05NQ9KyiTLVFOup4MhErM7lX2LZ5I2mCIhx2
	ZU+JxscJ1K0wUEE8TvfmEXHup8hT
X-Google-Smtp-Source: ABhQp+TF/wl3ZXzvIzvM4cyK7c4rk/uo30dsTXTax/6sROGGEamPAUCeHoMqo3Pzak3qOeS+6GmPJw==
X-Received: by 10.55.192.90 with SMTP id o87mr652539qki.235.1509554428539;
	Wed, 01 Nov 2017 09:40:28 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id 64sm719407qkz.51.2017.11.01.09.40.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Nov 2017 09:40:27 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Nov 2017 12:40:18 -0400
Message-Id: <1509554418-22282-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-attrs: add an initial recipe for version 17.2.0
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
X-List-Received-Date: Wed, 01 Nov 2017 16:40:27 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-attrs.inc        | 9 +++++++++
 meta-python/recipes-devtools/python/python-attrs_17.2.0.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-attrs_17.2.0.bb | 2 ++
 3 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-attrs.inc
 create mode 100644 meta-python/recipes-devtools/python/python-attrs_17.2.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-attrs_17.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python-attrs.inc b/meta-python/recipes-devtools/python/python-attrs.inc
new file mode 100644
index 0000000..85073e9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-attrs.inc
@@ -0,0 +1,9 @@
+DESCRIPTION = "Classes Without Boilerplate"
+HOMEPAGE = "http://www.attrs.org/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
+
+SRC_URI[md5sum] = "3b7136a570f3ff8a4ff42e7360073f9f"
+SRC_URI[sha256sum] = "5d4d1b99f94d69338f485984127e4473b3ab9e20f43821b0e546cc3b2302fd11"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-attrs_17.2.0.bb b/meta-python/recipes-devtools/python/python-attrs_17.2.0.bb
new file mode 100644
index 0000000..a6fdf15
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-attrs_17.2.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-attrs.inc
diff --git a/meta-python/recipes-devtools/python/python3-attrs_17.2.0.bb b/meta-python/recipes-devtools/python/python3-attrs_17.2.0.bb
new file mode 100644
index 0000000..c34693f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-attrs_17.2.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-attrs.inc
-- 
2.7.4


