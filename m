Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 7060C74FAC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 06:38:26 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 56DA020B19;
	Thu, 10 May 2018 02:38:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute4.internal (MEProxy); Thu, 10 May 2018 02:38:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=AokRBnNMQ6yV52cjZvlg10GRthsY4JwAV/fgIMGb6
	8Y=; b=oCem16yNGk+vnH61zkQT/nad0vJwYGPKdlxDZKguMV52ph/idmUahe96R
	RrYypt9YUMIHFu9i8HcSmxdSRiGJ3BmpSQFdflQhucYp7TyUykM2DuxMErlSSG/9
	G44De40qEO1fUtfQFGhDKWRo7BKuqTKvW9xZya8lzwGZk/07fXLJtoK8ly1UHquU
	Kpz+zih7P/DAtkoE7Veh0atFjg7AQUbB+KUoqCddS7p3hyWy+6H93/fpdohG40p4
	IExuJbdkIHUEiHuF+AE/eaojKgGdeetlIPmRMKgMtUL50kzS/crr5mteHEdLd7lp
	dE051gTF/BX7OEMW8UA8o10XmErzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=AokRBnNMQ6yV52cjZ
	vlg10GRthsY4JwAV/fgIMGb68Y=; b=jO6BEvgu6sXj65TXMc7G+Py/yAdijWU9c
	8e4BoZezbJbhapjQMmfyzDSI/wTylrCtWk8jmbRTK1Pg89mwCMbTakwqtm3jLCpr
	BMZiel6Ihw7iFFvgFPCzWCdm2CLjsxGrWWd9g9RVggG8RsZQgSlIMBMa4nXBcnfY
	jWVWG1Ray9rlfvT2QNnjwQ/7hgOVOOJZCibnEHjECuO6x4Gadux3rE698PsYrjfK
	+R0V3ZGt4kcyp/o2uMjB8ez6e0AMIU/jAVsJ7nJJQcIi+VxTnT7c6LcnqTIwrHLB
	AkOO7u3Lnk2iI3dooC/NnPT6PlrzcUNN+ybAqJiyNgVnmGmAM2uVA==
X-ME-Sender: <xms:4ejzWnJMBC3vi0pPtTzwmyrG4glVi1UTPAQ9EPWfMIXQJisvJojfXw>
Received: from dave.aj.id.au (ppp118-210-26-60.bras1.adl4.internode.on.net
	[118.210.26.60])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0C37F10253;
	Thu, 10 May 2018 02:38:23 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 May 2018 16:07:16 +0930
Message-Id: <20180510063718.16913-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
Cc: openbmc@lists.ozlabs.org
Subject: [meta-python][PATCH v2 1/3] meta-python: Add python-pyflame recipe
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
X-List-Received-Date: Thu, 10 May 2018 06:38:26 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta-python/recipes-devtools/python/python-pyflame.inc      | 12 ++++++++++++
 meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb |  1 +
 2 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyflame.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb

diff --git a/meta-python/recipes-devtools/python/python-pyflame.inc b/meta-python/recipes-devtools/python/python-pyflame.inc
new file mode 100644
index 000000000000..3b84a7e8f8e3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyflame.inc
@@ -0,0 +1,12 @@
+SUMMARY = "Pyflame: A Ptracing Profiler For Python"
+HOMEPAGE = "https://github.com/uber/pyflame"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+DEPENDS = "python"
+
+SRC_URI = "git://github.com/uber/pyflame.git;protocol=https;tag=v${PV}"
+S = "${WORKDIR}/git"
+
+inherit pkgconfig autotools
+
diff --git a/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
new file mode 100644
index 000000000000..96f03305f883
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
@@ -0,0 +1 @@
+require python-pyflame.inc
-- 
2.14.1


