Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0CD04727E1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 12:19:54 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so1579119wiv.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 04:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QzpLdsPdRwMb/3nBETzr9E5YRRoISs0CPXeXmvge8hw=;
	b=gO6datn6SxdYXRaEElTNLUKbM7uiE31qRnDYf2ixMwg60cbWDTnukV5MdTPvz/X4Pn
	u4Z1qNYaAw6R8khgDiUOM8tzsvAkZkHBIQ7KyV4rtJVrvSxxlnGomwha2O80PsLf8Zm2
	SvKvemvN5sbDp/8qwDssjtdcylb5Q+f2Krt7D1Xlfeo2DmBGvLxB4CrfJjlqGbThRAr2
	LGa/Ipso9+zigrojESmoMuw66O31ilXAdPuHpVSmxoo1PMTNbYPRR181T8cmopQVpp8c
	dOgsHy+//aMnyjqsf2VrgZyVW0jYcdA7jq43rMMFRmuR7Y7QiFjNI8B8YGU1kMNngWz7
	E8Sg==
X-Received: by 10.180.98.138 with SMTP id ei10mr24038049wib.32.1418905194557; 
	Thu, 18 Dec 2014 04:19:54 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	mo12sm8734640wjc.35.2014.12.18.04.19.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Dec 2014 04:19:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Dec 2014 13:19:45 +0100
Message-Id: <1418905190-27541-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.0
In-Reply-To: <1418905190-27541-1-git-send-email-Martin.Jansa@gmail.com>
References: <1418905190-27541-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-python][PATCH 3/8] python-mock: import from meta-openstack
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
 .../recipes-devtools/python/python-mock_1.0.1.bb   | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-mock_1.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python-mock_1.0.1.bb b/meta-python/recipes-devtools/python/python-mock_1.0.1.bb
new file mode 100644
index 0000000..a23b552
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-mock_1.0.1.bb
@@ -0,0 +1,26 @@
+# Imported from git://git.yoctoproject.org/meta-cloud-services
+
+SUMMARY = "A Python Mocking and Patching Library for Testing"
+HOMEPAGE = "https://pypi.python.org/pypi/mock"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=80e5ba73891255687dff3bee2b4cbb16"
+
+SRCNAME = "mock"
+
+SRC_URI = "https://pypi.python.org/packages/source/m/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "c3971991738caa55ec7c356bbc154ee2"
+SRC_URI[sha256sum] = "b839dd2d9c117c701430c149956918a423a9863b48b09c90e30a6013e7d2f44f"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} += " \
+    python-prettytable \
+    python-cmd2 \
+    python-pyparsing \
+    python-mccabe \
+    python-pep8 \
+    python-pyflakes"
-- 
2.2.0


