Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id DBEFA782A5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 18:22:52 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id i19so2247756qte.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 11:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vWNCYpuw90x7rzCZov0IzhsNEGELQ9LDuRZCcCSAZKw=;
	b=EEX6aQGdrDjVvUWF8DcX5lNgJPpGFgV0SWZqJ7rnx5nLq3v+dY+7EJ1Ym10Jhb/AXp
	ODgJf1mu6aSH8C8Mnlz1pXT5HNKpcKogU0fjOecAGOeWfFAfIowu136H0YByI7Y760yn
	DvqcflludSw0zmf02kF3DJWtdD/P3T0m+fGbR4jgvz3LfbMH3SOU90vytyxY6huunv24
	WGbvLQ7KmYcSesZu6s/iTLzKMDVnS8riVJO31WepR6WXHmcdWPOOgS45d0NXLYbx9X76
	HMhdgSD8bO880eQ9dkWUJaLNsSwUmgM8kyaaRv2SYkZ8qKCNYskbbVAf1Zo+AqOIxe+q
	VoXA==
X-Gm-Message-State: AIVw111zmZH54PawuH0aJo+Dm2rO3heki9//t2nnS6C5lNnVoiBfzuff
	ioG6PAYFWuvwdNy1kbs=
X-Received: by 10.237.37.136 with SMTP id x8mr20332860qtc.326.1500920573651;
	Mon, 24 Jul 2017 11:22:53 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.81.71])
	by smtp.gmail.com with ESMTPSA id
	z43sm8716519qtg.59.2017.07.24.11.22.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Jul 2017 11:22:52 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jul 2017 14:22:45 -0400
Message-Id: <1500920565-14912-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-webencodings: update to version 0.5.1
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
X-List-Received-Date: Mon, 24 Jul 2017 18:22:53 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-webencodings_0.5.1.bb       | 10 ++++++++++
 meta-python/recipes-devtools/python/python-webencodings_0.5.bb | 10 ----------
 2 files changed, 10 insertions(+), 10 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-webencodings_0.5.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-webencodings_0.5.bb

diff --git a/meta-python/recipes-devtools/python/python-webencodings_0.5.1.bb b/meta-python/recipes-devtools/python/python-webencodings_0.5.1.bb
new file mode 100644
index 0000000..d7e4d2e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-webencodings_0.5.1.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Character encoding aliases for legacy web content"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;startline=8;endline=9;md5=af5c81bfe98855a56d36b6ba5de2906f"
+
+SRC_URI[md5sum] = "32f6e261d52e57bf7e1c4d41546d15b8"
+SRC_URI[sha256sum] = "b36a1c245f2d304965eb4e0a82848379241dc04b865afcc4aab16748587e1923"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} += "${PYTHON_PN}-codecs"
diff --git a/meta-python/recipes-devtools/python/python-webencodings_0.5.bb b/meta-python/recipes-devtools/python/python-webencodings_0.5.bb
deleted file mode 100644
index fbe6285..0000000
--- a/meta-python/recipes-devtools/python/python-webencodings_0.5.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Character encoding aliases for legacy web content"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;startline=8;endline=9;md5=2fc6c99a19e6dbde9f7a2239143c9d13"
-
-SRC_URI[md5sum] = "878714d45241f7970dffd8991d61fff9"
-SRC_URI[sha256sum] = "a5c55ee93b24e740fe951c37b5c228dccc1f171450e188555a775261cce1b904"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "${PYTHON_PN}-codecs"
-- 
2.7.4


