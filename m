Return-Path: <philip.balister@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 88B7160761
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2015 17:26:24 +0000 (UTC)
Received: by qgec40 with SMTP id c40so10793916qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2015 09:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=YNiUglLwevJUKgm6S0AXvmAgaAtJzhI+Kx256xVAsZ8=;
	b=PpJ1eFiJYKdM23slnycQSxM/ByCqpCnMTqBH7EsPc+xlldzkCWhB1y7TvAGXTA+wI2
	tT3K3jHPh2Q5GNO9wg8rr/lSyz4Umo8MJKHz9jO6EKvElhMppEKocbFB1GxX5ezqYmLR
	sgGj7k69nLmw+R4YpzR9hjfXOet2BKE/3CvjfaLLWsAmkeKTS7mHsZtPEFGk54BCO1TO
	FCRfo86RKUWIU5wnYN0lTTCAsIdi+uGo5eVqRTAtuyxZbNh0ppQ6tZniZiKta4iK4JL9
	lM1lz4fWzIdl9RCYGlqulfuERjnK/SNI+QCXF6d62w597iu1jLGNipUlX7Lw9PwYYtcB
	DNBA==
X-Received: by 10.140.18.199 with SMTP id 65mr83427840qgf.10.1448990785477;
	Tue, 01 Dec 2015 09:26:25 -0800 (PST)
Received: from thuvia.localdomain (pool-108-44-110-59.ronkva.east.verizon.net.
	[108.44.110.59])
	by smtp.gmail.com with ESMTPSA id s105sm88022qge.40.2015.12.01.09.26.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Dec 2015 09:26:24 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Dec 2015 12:26:18 -0500
Message-Id: <1448990780-11060-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
Subject: [meta-python][PATCH 1/3] python-vcversioner: Add new recipe.
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
X-List-Received-Date: Tue, 01 Dec 2015 17:26:25 -0000

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../recipes-devtools/python/python-vcversioner_2.14.0.0.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb b/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
new file mode 100644
index 0000000..f7cd9bb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Twisted Web Sockets"
+HOMEPAGE = "https://github.com/MostAwesomeDude/txWS"
+
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=260625d695c5e0c9dd2c2ef898833c7d"
+
+SRC_URI = "https://pypi.python.org/packages/source/v/vcversioner/vcversioner-${PV}.tar.gz"
+SRC_URI[md5sum] = "7848a365ced9941053bc25d9a9f8f4b4"
+SRC_URI[sha256sum] = "acd43686e92e6c8bbeb4f2eef54408567a7adea9692fa72d591eec5357c03b86"
+
+S = "${WORKDIR}/vcversioner-${PV}"
+
+inherit setuptools
+
-- 
2.1.0


