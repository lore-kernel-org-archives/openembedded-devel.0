Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 20FF6727D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 12:19:54 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id em10so1585502wid.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 04:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RS8O2CfF1nWUuVKAeRUvHsTPWL7ikoujF4noh9C8Oq4=;
	b=fsAnUU2WKY6nV1nRRx05MYVNhZO2R2Z4JkVz/9Zz5k5KeAAcuzFbpsvHihq19cWO33
	BHMXdzZrb0VYsh61eCntHOUSJ0Z6MSk+MKT6zF7YtU5XNzXIWGkeNWGZF3lLg+N70wOf
	3l8s7igIOhYIxdySByYaZCVqYQidECA9z1ayQIy2rOWspu7HFPLRYBggt5B0FH3yUAzV
	nirD34x3BH5Duiw7px81AEh+Gn5pvnhs0U/b50nJPh65hk9U/V+MoalnVZ6My25iietu
	hBG7ddO/V5EaPlwcOLYZ7FQugDqZAH25qZ75+Ddu6pi67/cHhO5WZ21axWeuvX+3hjZg
	Zq/A==
X-Received: by 10.180.73.206 with SMTP id n14mr4726866wiv.60.1418905193295;
	Thu, 18 Dec 2014 04:19:53 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cp4sm8752109wjb.16.2014.12.18.04.19.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Dec 2014 04:19:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Dec 2014 13:19:44 +0100
Message-Id: <1418905190-27541-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.0
In-Reply-To: <1418905190-27541-1-git-send-email-Martin.Jansa@gmail.com>
References: <1418905190-27541-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-python][PATCH 2/8] python-mccabe: import from meta-openstack
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
X-List-Received-Date: Thu, 18 Dec 2014 12:19:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-devtools/python/python-mccabe_0.2.1.bb | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-mccabe_0.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python-mccabe_0.2.1.bb b/meta-python/recipes-devtools/python/python-mccabe_0.2.1.bb
new file mode 100644
index 0000000..a056c09
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-mccabe_0.2.1.bb
@@ -0,0 +1,23 @@
+# Imported from git://git.yoctoproject.org/meta-cloud-services
+
+SUMMARY = "McCabe checker, plugin for flake8"
+HOMEPAGE = "https://github.com/dreamhost/cliff"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README.rst;md5=aa0383f6aee4f5c20084a97cd13164c4"
+
+SRCNAME = "mccabe"
+
+SRC_URI = "https://pypi.python.org/packages/source/m/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "5a3f3fa6a4bad126c88aaaa7dab682f5"
+SRC_URI[sha256sum] = "5a2a170e47de5593a6abfae1e9542bd2c3924ac62bbe4e6ed96c953c0352243a"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} += " \
+    python-prettytable \
+    python-cmd2 \
+    python-pyparsing"
-- 
2.2.0


