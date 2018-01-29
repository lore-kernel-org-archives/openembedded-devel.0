Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA5378733
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jan 2018 13:42:09 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id l20so12640473qtj.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jan 2018 05:42:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EDsoTVBJrvOwqksTn7E4xAzvsaCQvin8f/U9YvO0CWY=;
	b=B6EHNYLxFePiM5x0R6bfmeoiuiJTDtg+1D3WxQMQt1tblV3s5MKU9fLJob9Oy8pb5C
	QzBbi2xCie24le7sZPpVKrey8EuS0iAu2lguOHhd1aOgioJIkPsdkwb/Uv8tfzhlWk4X
	WHsjzvzDzJBbdwPqaQpQh1quK7S34ALUcuWcOFragYt2zNC2uzf7AKT4ie3UmobsRcdK
	3K1a2G5/RY3SYTDKDD8/ZpQeXqsJbhoDVaCflvVVzVkaT1IiWS3w3Ym7W2BxI/7wL6qM
	eCRuPVvA4iqyA0Wsx+Crs8LqM8uCGkYOozRV1XbQccz5rf6juHL0JdLwMZoBmtwPnOrv
	FRBg==
X-Gm-Message-State: AKwxytdRPCQinTphHe1B+car296b0JkDVkFKW4wjPrAQUi++PoREGsOG
	bldC2WnMSN1Qgi82YUzsdkA9YJAq
X-Google-Smtp-Source: AH8x225O24X27oKnQO9xd9X/qnk1sstmU65fQZXwXGa9kPjV2OIZ8Y0qFhKdk6jwEQ9pYoJWzcv4tg==
X-Received: by 10.200.37.83 with SMTP id 19mr2951779qtn.270.1517233330585;
	Mon, 29 Jan 2018 05:42:10 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	u9sm10114496qtj.80.2018.01.29.05.42.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Jan 2018 05:42:10 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Jan 2018 08:42:06 -0500
Message-Id: <1517233326-14255-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-networkx: update to version 2.1
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
X-List-Received-Date: Mon, 29 Jan 2018 13:42:10 -0000

Update license checksum and verify the terms remain the same

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-networkx_2.0.bb | 12 ------------
 meta-python/recipes-devtools/python/python-networkx_2.1.bb | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-networkx_2.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-networkx_2.1.bb

diff --git a/meta-python/recipes-devtools/python/python-networkx_2.0.bb b/meta-python/recipes-devtools/python/python-networkx_2.0.bb
deleted file mode 100644
index bd9fe56..0000000
--- a/meta-python/recipes-devtools/python/python-networkx_2.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Python package for creating and manipulating graphs and networks"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=050668f0cfbb54d1861e798b2104b161"
-
-SRC_URI[md5sum] = "34f9cc01b2eca37f362673b8eb65316b"
-SRC_URI[sha256sum] = "cd5ff8f75d92c79237f067e2f0876824645d37f017cfffa5b7c9678cae1454aa"
-
-PYPI_PACKAGE_EXT = "zip"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "python-2to3"
diff --git a/meta-python/recipes-devtools/python/python-networkx_2.1.bb b/meta-python/recipes-devtools/python/python-networkx_2.1.bb
new file mode 100644
index 0000000..bc0c686
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-networkx_2.1.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Python package for creating and manipulating graphs and networks"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3376ff7c9c58048c62d91431f7f08cde"
+
+SRC_URI[md5sum] = "4a2c2a62dfc46ba7d594daca7c834995"
+SRC_URI[sha256sum] = "64272ca418972b70a196cb15d9c85a5a6041f09a2f32e0d30c0255f25d458bb1"
+
+PYPI_PACKAGE_EXT = "zip"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} += "python-2to3"
-- 
2.7.4


