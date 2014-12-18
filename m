Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 33EAF727D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 12:19:58 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id bs8so1384310wib.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 04:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SN5yRUB4NwYk4lFMhMBiBNlRN5tmVbvVd8ypOmMqwqs=;
	b=lu/VRCaZd8EwpHY7+2FXA2Z7k69SfHEN+YrPwc+jXqJwIzHxNwT7eRSJuOsofRsas8
	ZYlFxlKp81KRaMDFeEjK2bjo2plgYl8sN6hrKnKevuw6zbyji8scUl7wDpQZSJzz5qmi
	U26Q4Q/20WPVsWAU9MK1xHF/psR3eBgMy044i1ctCBqvNDkfK4WTg0e1ognmRBA18al+
	KCFiwRtHBpXFTaj59nnMPCHKvAJNqKLn4SL/sMfqnfQiGij/JrHOabBiTSKGN4p50U5o
	0VbQWJMdAZl7pp7sCYJDPAW2TnyTr04L6YnvDfH1RuruD1jCRcQ4fKxitiFc82LSuH5k
	vi2Q==
X-Received: by 10.194.85.161 with SMTP id i1mr3813236wjz.35.1418905199358;
	Thu, 18 Dec 2014 04:19:59 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ex8sm8727642wjd.41.2014.12.18.04.19.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Dec 2014 04:19:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Dec 2014 13:19:48 +0100
Message-Id: <1418905190-27541-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.0
In-Reply-To: <1418905190-27541-1-git-send-email-Martin.Jansa@gmail.com>
References: <1418905190-27541-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-python][PATCH 6/8] python-pyflakes: import from meta-openstack
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
X-List-Received-Date: Thu, 18 Dec 2014 12:19:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../python/python-pyflakes_0.7.3.bb                | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyflakes_0.7.3.bb

diff --git a/meta-python/recipes-devtools/python/python-pyflakes_0.7.3.bb b/meta-python/recipes-devtools/python/python-pyflakes_0.7.3.bb
new file mode 100644
index 0000000..ce48cd7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyflakes_0.7.3.bb
@@ -0,0 +1,23 @@
+# Imported from git://git.yoctoproject.org/meta-cloud-services
+
+SUMMARY = "passive checker of Python programs"
+HOMEPAGE = "https://github.com/dreamhost/cliff"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README.rst;md5=1815018ebbbfc8659a9df33681a0936e"
+
+SRCNAME = "pyflakes"
+
+SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "ec94ac11cb110e6e72cca23c104b66b1"
+SRC_URI[sha256sum] = "dbd2c940a1030a4f811afc1a04017a44011c0cb54f8f384b66aa624097d9b5e3"
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


