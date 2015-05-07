Return-Path: <philip.balister@gmail.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 973AB72A2D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 May 2015 21:28:21 +0000 (UTC)
Received: by qcyk17 with SMTP id k17so28338412qcy.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 May 2015 14:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=KEtte1Z4M+WQ1NO8PgVNv/XXklna6ktIYoTkIgmjWyQ=;
	b=vpJlKmvC6D80LLqvjTpNTM/Mx154unQ3PMbUnUyaZAdUM6QxrGbAaFu0CoEUnxfGGe
	wy4tWL2H3dDb8BOEnzo6+jpb+Y5XTDsqYYmc1eCBUZmExY1OW/EvF2I3DdhuUHQrS/ZF
	hIy8+NTG7f02+X2w75ysU25gDb4P4GGbLF9BWgw6565A10IDkRf+dmvAOV7bzNESroi1
	pRiTPZMl7ktMCfinAZEBStnYHUXAA+VOpwl2XpRHDjyR8uXFvcd6wobqG8pL7UGGapGk
	tK5+CYeBIDDEi+la30+S0M/Veu1Ypx9qpuDg5KqESfZJAaaZNjbojU0cLaZ16jHyEqv8
	Qiuw==
X-Received: by 10.229.185.136 with SMTP id co8mr1019144qcb.16.1431034102961;
	Thu, 07 May 2015 14:28:22 -0700 (PDT)
Received: from thuvia.localdomain ([108.44.122.151])
	by mx.google.com with ESMTPSA id
	q105sm2274090qgq.11.2015.05.07.14.28.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 May 2015 14:28:21 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 May 2015 17:28:17 -0400
Message-Id: <1431034097-22716-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
Subject: [meta-python][PATCH] python-thrift: Add recipe.
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
X-List-Received-Date: Thu, 07 May 2015 21:28:23 -0000

Direct copy from recipe in meta-cloud-services. Same recipe is also in
meta-openstack. GNU Radio (in meta-sdr) will needs this recipe
so it seems like time to move the recipe to a central layer.

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../python-thrift/python-thrift_0.9.2.bb                 | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.2.bb

diff --git a/meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.2.bb b/meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.2.bb
new file mode 100644
index 0000000..ec2ea0c
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.2.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Python bindings for the Apache Thrift RPC system"
+HOMEPAGE = "https://pypi.python.org/pypi/amqp/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=df17a59cc9e1327ec49c2285e13ac477"
+
+SRCNAME = "thrift"
+
+SRC_URI = "https://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "91f1c224c46a257bb428431943387dfd"
+SRC_URI[sha256sum] = "08f665e4b033c9d2d0b6174d869273104362c80e77ee4c01054a74141e378afa"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
-- 
2.1.0


