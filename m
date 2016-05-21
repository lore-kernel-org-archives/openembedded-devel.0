Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id D0DDD73181
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 13:36:14 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id y6so18189906ywe.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 06:36:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qCko1DwKBn14oPgwJ6bmPagg3Mmd9d4DFGmWzcaFXjw=;
	b=A8QNzecE4oxmQhw19/ZI1m9rtpwpZfRkPp/yR+0xhop4LoUy/WwlhJKya4UItw7ISH
	T1j1JdbMF19O0ELr1gNiuwN7EuVKtB4Wv7HgQa9vJ/QX/qZ4WMGWBQhnZxhtUvp9KLhL
	tAz6XWH3t9dlgtomJk7Qu0RkHcE2ctKnHxeIye5pcieZa3zGw13miC2jfJ40Y17Qn2CI
	NR3sJFRWOZXtm30ZLQp1As5ZJTyVFLjoj944iMhzVT+MZyixolEbAK2tKcOLTWkiG+xQ
	OYlTU8NYpXM/VCn3jYC2wvofT0B46X5ErrJ2DJ5pr13EQTgN5KYByxy5d7JwF91DDRvi
	QGgg==
X-Gm-Message-State: AOPr4FXXqruFZKZHhXgKBTN9Oi+07WZ4DOUNv178RSPln1Wti4/1laBL9uvgLoxI5O2KfQ==
X-Received: by 10.13.207.131 with SMTP id r125mr4636763ywd.246.1463837775321; 
	Sat, 21 May 2016 06:36:15 -0700 (PDT)
Received: from localhost.localdomain ([104.129.204.70])
	by smtp.gmail.com with ESMTPSA id
	p69sm14030895ywe.8.2016.05.21.06.36.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 21 May 2016 06:36:14 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 May 2016 09:36:07 -0400
Message-Id: <1463837767-17383-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-pyparsing: update to version 2.1.4
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
X-List-Received-Date: Sat, 21 May 2016 13:36:17 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyparsing_2.1.1.bb | 10 ----------
 meta-python/recipes-devtools/python/python-pyparsing_2.1.4.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyparsing_2.1.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pyparsing_2.1.4.bb

diff --git a/meta-python/recipes-devtools/python/python-pyparsing_2.1.1.bb b/meta-python/recipes-devtools/python/python-pyparsing_2.1.1.bb
deleted file mode 100644
index 94a99e5..0000000
--- a/meta-python/recipes-devtools/python/python-pyparsing_2.1.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Python parsing module"
-HOMEPAGE = "http://pyparsing.wikispaces.com/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a"
-
-SRC_URI[md5sum] = "2a1d3a63ddc2ec9a3da961d1b7f258b2"
-SRC_URI[sha256sum] = "4bd04badfda39b1e2fd0d77cb78b488c881d88c31734791a0ae902979ae10575"
-
-PYPI_PACKAGE_EXT = "zip"
-inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-pyparsing_2.1.4.bb b/meta-python/recipes-devtools/python/python-pyparsing_2.1.4.bb
new file mode 100644
index 0000000..48caa40
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyparsing_2.1.4.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Python parsing module"
+HOMEPAGE = "http://pyparsing.wikispaces.com/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a"
+
+SRC_URI[md5sum] = "322059c57f0c9f11da1c6c06a2ba2197"
+SRC_URI[sha256sum] = "a9234dea79b50d49b92a994132cd1c84e873f3936db94977a66f0a4159b1797c"
+PYPI_PACKAGE_HASH = "ae0cb6ce7eea7ccf020ae68db1119bacaa07ad91fedaefaf8f3265e8dd156813"
+
+inherit pypi setuptools
-- 
1.9.1


