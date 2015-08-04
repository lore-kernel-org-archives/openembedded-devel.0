Return-Path: <philip.balister@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1D3D173231
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2015 12:12:09 +0000 (UTC)
Received: by qged69 with SMTP id d69so4440944qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Aug 2015 05:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=AhUA25d8VM7cqBXsqxkT4bFlMC0OG5iHaeo8WlOgIho=;
	b=AQLIPPDT33fxwywyrl/nr4ONH72PZwbLFR29FV5NkTzDDyJfXV2fkMREFB97lU9Hva
	+fJG/RDVnRikXuosecF0MopixgxL+WBU5cxTWWTsWpD+Q5Qe3F7ghwwppbe65GNCcoJX
	LaZenbGy6Jd+8zwYSAEkxv909g39iB6MhlaClygsHZQ+WO0U7t4z5pwO76jduOCTuTzL
	/5PCET6cH4ElgWzc4Mop6kHcW4nkIkPbQjY1Mif1nCXotovOZ+KWL0JfDEGi7QhHtMsx
	A0hzgfw5U55B5CKPeApP3qOpTzOqh22+fNSnyXTtLmzw3SgORWLMv+U8VVOKE8bq7Cb6
	F08Q==
X-Received: by 10.140.91.66 with SMTP id y60mr5824742qgd.90.1438690329558;
	Tue, 04 Aug 2015 05:12:09 -0700 (PDT)
Received: from thuvia.localdomain (pool-71-171-15-102.ronkva.east.verizon.net.
	[71.171.15.102])
	by smtp.gmail.com with ESMTPSA id 74sm359427qgo.13.2015.08.04.05.12.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Aug 2015 05:12:08 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Aug 2015 08:12:03 -0400
Message-Id: <1438690323-23783-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
Subject: [meta-python][PATCH] python-pyro4: Add new recipe.
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
X-List-Received-Date: Tue, 04 Aug 2015 12:12:10 -0000

Pyro4 allows remote execution of objects over the network.

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../python-pyro4/python-pyro4_4.39.bb                    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.39.bb

diff --git a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.39.bb b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.39.bb
new file mode 100644
index 0000000..aed0c9c
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.39.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Python Remote Objects"
+HOMEPAGE = "https://pypi.python.org/pypi/Pyro4/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b48b62dd270c4691fabaa85be3236030"
+
+SRCNAME = "Pyro4"
+
+SRC_URI = "https://pypi.python.org/packages/source/P/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "75ed5cd142803b0a8d587dc8b6bb51ed"
+SRC_URI[sha256sum] = "39c6ca7f86b0f0bebfeada687a5a8b99f66470a52b0f815195ae63c683266f24"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
-- 
2.1.0


