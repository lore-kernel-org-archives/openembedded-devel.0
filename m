Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id E316760807
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Dec 2017 15:39:17 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id m59so45191336qte.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Dec 2017 07:39:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SSjuKXBBfwNxrV7vommvOGG1PGHyALUjZDmMsIHJpXs=;
	b=jml5KIcOokcHFxACBoxXiFN5RErn6/NB+p0cj+ZFa/nhoRJy1iuP7vP1FVKwMT+DWN
	twygX2j+IxzNffQNdD4W6rhbdSVmocCkvFrE03gKAsn+dbqP236GujeKVc6HSZcfIcRH
	8VLe/0zdY07+MS2jUHib2hfhhl8qWCY/e+MaBJJdJO1sDzA/EVntTfIA7kMmN5mQ+x5K
	31zCriP3oggoE9SYpCq8uU9O7IGTylo7V6A59Fbwh9hmFfHv+ckCJzWAexnkblTgivXB
	z2mSnDMy2WzEgaY4eu6omMQuc6BxNpziryB1LTGCirZ9kOfCpilKhqvwKgz3wqdk0+bL
	O1HA==
X-Gm-Message-State: AKGB3mLna/wsl9rZYUb6ghLWgq+S6hbcUmjRjpETFmtVimZ6GVqS1BA3
	o2/+rhGeszz6Aqay+4th2XZnljbF
X-Google-Smtp-Source: ACJfBosFYuYKMGXPEvKiciLr7t/tRN18G/jscdOiv6N/LSdKoCl50fsiTdWw2cdj5R4goppjjhSIJQ==
X-Received: by 10.200.3.23 with SMTP id q23mr37394706qtg.229.1514302758336;
	Tue, 26 Dec 2017 07:39:18 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id 6sm8342995qkk.93.2017.12.26.07.39.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Dec 2017 07:39:17 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Dec 2017 10:39:12 -0500
Message-Id: <1514302752-32244-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-networkx: update to version 2.0
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
X-List-Received-Date: Tue, 26 Dec 2017 15:39:18 -0000

Verified license terms remain the same and update checksum

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-networkx_1.11.bb | 10 ----------
 meta-python/recipes-devtools/python/python-networkx_2.0.bb  | 12 ++++++++++++
 2 files changed, 12 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-networkx_1.11.bb
 create mode 100644 meta-python/recipes-devtools/python/python-networkx_2.0.bb

diff --git a/meta-python/recipes-devtools/python/python-networkx_1.11.bb b/meta-python/recipes-devtools/python/python-networkx_1.11.bb
deleted file mode 100644
index bda8ae3..0000000
--- a/meta-python/recipes-devtools/python/python-networkx_1.11.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "Python package for creating and manipulating graphs and networks"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=925586ea588eb990de840dc71ea3752f"
-
-SRC_URI[md5sum] = "6ef584a879e9163013e9a762e1cf7cd1"
-SRC_URI[sha256sum] = "0d0e70e10dfb47601cbb3425a00e03e2a2e97477be6f80638fef91d54dd1e4b8"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "python-2to3"
diff --git a/meta-python/recipes-devtools/python/python-networkx_2.0.bb b/meta-python/recipes-devtools/python/python-networkx_2.0.bb
new file mode 100644
index 0000000..bd9fe56
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-networkx_2.0.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Python package for creating and manipulating graphs and networks"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=050668f0cfbb54d1861e798b2104b161"
+
+SRC_URI[md5sum] = "34f9cc01b2eca37f362673b8eb65316b"
+SRC_URI[sha256sum] = "cd5ff8f75d92c79237f067e2f0876824645d37f017cfffa5b7c9678cae1454aa"
+
+PYPI_PACKAGE_EXT = "zip"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} += "python-2to3"
-- 
2.7.4


