Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 33E1A60667
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 14:03:41 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id u62so18247024ywe.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 07:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QzFP9xxJV50Wfy5hlpJNbCmqvzRJC4FmrxejlNydd1w=;
	b=LvJQDIlxmUQYm44saxchT0y3WySjk9zPwpt4/0gTjQGFxDLRBFSdA77/kl75l2QQCw
	c+pFYrRzDk29ono3O/HbcopbH8N1/JnLlx1sh80z1awGm6DUthzheOrogtb90iiJgEtM
	9SX56I4n8xJUPj0SHXAq66ZTeVEry1rrlOeTuEsVwfCgP9iJrT4tin+g07fE4hIz8AbQ
	F153wsL0IlPQO4++28nexSiAzZvV/DIhRYxw8AUn7HoWfc1jf+KEfJqv4/65Y7ayfdi1
	Z3XvwDmYMxQ5dXSq8vMOKCjkh5CDqb2g9Y3EKZNEjXAY/ZadBANMXfBpbOOzCPVxxsTY
	O4SA==
X-Gm-Message-State: AOPr4FVXJfb9aB1W1g/mJjPjuAFbL2uRalt0DjJrZUF33MkoTMjRlzmjd7cEOS3TqjMg1A==
X-Received: by 10.37.111.215 with SMTP id k206mr4652844ybc.47.1463839421934;
	Sat, 21 May 2016 07:03:41 -0700 (PDT)
Received: from localhost.localdomain ([104.129.204.116])
	by smtp.gmail.com with ESMTPSA id
	z17sm3872760ywz.56.2016.05.21.07.03.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 21 May 2016 07:03:41 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 May 2016 10:03:29 -0400
Message-Id: <1463839409-23314-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-thrift: update to version 0.9.3
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
X-List-Received-Date: Sat, 21 May 2016 14:03:43 -0000

update recipe to use pypi class
update license checksum for latest version

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python-thrift/python-thrift_0.9.2.bb                 | 16 ----------------
 .../python-thrift/python-thrift_0.9.3.bb                 |  9 +++++++++
 2 files changed, 9 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.2.bb
 create mode 100644 meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.3.bb

diff --git a/meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.2.bb b/meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.2.bb
deleted file mode 100644
index d0c4af7..0000000
--- a/meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.2.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Python bindings for the Apache Thrift RPC system"
-HOMEPAGE = "https://pypi.python.org/pypi/amqp/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=df17a59cc9e1327ec49c2285e13ac477"
-
-SRCNAME = "thrift"
-
-SRC_URI = "https://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "91f1c224c46a257bb428431943387dfd"
-SRC_URI[sha256sum] = "08f665e4b033c9d2d0b6174d869273104362c80e77ee4c01054a74141e378afa"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
diff --git a/meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.3.bb b/meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.3.bb
new file mode 100644
index 0000000..a8a8ff8
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.3.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Python bindings for the Apache Thrift RPC system"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1203b6a05c3bff3229710e3f063ddca7"
+
+SRC_URI[md5sum] = "b519551d7a086bb0b4f222a8f566b7e8"
+SRC_URI[sha256sum] = "dfbc3d3bd19d396718dab05abaf46d93ae8005e2df798ef02e32793cd963877e"
+PYPI_PACKAGE_HASH = "ae5835e3f0cd290039ff862c2c9d8ae8a76896665d70343d833bdc2f748b8e55"
+
+inherit pypi setuptools
-- 
1.9.1


