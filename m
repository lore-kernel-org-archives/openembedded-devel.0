Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6D47D727D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 12:19:51 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so1606803wiv.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 04:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+3aB5B0SDSvWe1FZ+FOtRjIAt7Vx1qujc3AXyMrrIHM=;
	b=gfPIAb3iQJ0t2VHrhIOSuGP0yNbzgLqYPs+bNA5e3x8YcGoz9kG5bampg0MxbipsoF
	l1uh/dGfus/+zitys/1OUX8m2QJkS5oUYl2EoBFCSpRt85r2o6z90642IVJS3PbWmx5x
	SauVh/Lfj5QXHUEQdQib8cMsCAb+4Wkx3BzdXxTeogd20hG5h5vYFqbmUqcQ/v4LeXfr
	tfKO6aMSoBdBz5uJ7m50wyxWb6Sc5xSCpNJQyVt4y1YKvbCDP37zUns8rX/+HIyk3rg0
	K1Bou53svST7di67w4p3cOMGlEuKe+q5W+cqlhOgZ1NmQuuCyccIZNrKiIHJ9CRQzfA+
	ZbAg==
X-Received: by 10.180.94.230 with SMTP id df6mr4699833wib.25.1418905191674;
	Thu, 18 Dec 2014 04:19:51 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dv9sm9772501wib.14.2014.12.18.04.19.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Dec 2014 04:19:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Dec 2014 13:19:43 +0100
Message-Id: <1418905190-27541-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.0
Subject: [meta-python][PATCH 1/8] python-cmd2: import from meta-openstack
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Dec 2014 12:19:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-devtools/python/python-cmd2_0.6.7.bb     | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-cmd2_0.6.7.bb

diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.6.7.bb b/meta-python/recipes-devtools/python/python-cmd2_0.6.7.bb
new file mode 100644
index 0000000..fc7f024
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-cmd2_0.6.7.bb
@@ -0,0 +1,20 @@
+# Imported from git://git.yoctoproject.org/meta-cloud-services
+
+SUMMARY = "Extra features for standard library's cmd module"
+HOMEPAGE = "http://packages.python.org/cmd2/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=21;endline=21;md5=a00047b7e92e0781452d0beba4e7b44e"
+
+SRCNAME = "cmd2"
+
+SRC_URI = "http://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "842df29ff2f72d64d7f0d917039c0e51"
+SRC_URI[sha256sum] = "8e98c7a1cfd106183559240b269e7cd9fe97e8342b5c05295f591aab6fd2f4f0"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} += "python-pyparsing"
-- 
2.2.0


