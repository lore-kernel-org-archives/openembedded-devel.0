Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1Qeonh-0008Vc-3Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 15:39:29 +0200
Received: by bwf20 with SMTP id 20so1009142bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2011 06:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=AI4F/Nmswg998s2eFiHZIxBtWu9/mxEFW0+fTnD+/9M=;
	b=SQ6qUQTIU+GNVOiHB8MW4m+BzcajqLqSPV7EWptORwAGivGEi9Viu2Wc+8DZ7qG0dZ
	SYGcARzqDpxgkWrR2/IK5XPKXTSjF0l1jGEiVs9bVgPIcRkhQnQ4yIMGQNDNRXPlAyXc
	AD9YXvU+6dwO0Tj4+fNBgPSAgZ+1/X/IccomM=
Received: by 10.204.39.68 with SMTP id f4mr752932bke.17.1310045737705;
	Thu, 07 Jul 2011 06:35:37 -0700 (PDT)
Received: from localhost.localdomain (wgr614v6.plus.sbg.ac.at
	[141.201.137.156])
	by mx.google.com with ESMTPS id l24sm8547068bkw.15.2011.07.07.06.35.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jul 2011 06:35:37 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jul 2011 15:35:55 +0200
Message-Id: <50751d1b7570089f6aba5072807372c7a31be373.1310045515.git.michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310045515.git.michael.lippautz@gmail.com>
References: <cover.1310045515.git.michael.lippautz@gmail.com>
Subject: [meta-oe][PATCHv2 1/4] python-pyudev: Add version 0.11 (initial recipe)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Jul 2011 13:39:29 -0000

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 .../recipes-devtools/python/python-pyudev_0.11.bb  |   22 ++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/python/python-pyudev_0.11.bb

diff --git a/meta-oe/recipes-devtools/python/python-pyudev_0.11.bb b/meta-oe/recipes-devtools/python/python-pyudev_0.11.bb
new file mode 100644
index 0000000..03a948a
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-pyudev_0.11.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "A libudev binding"
+HOMEPAGE = "http://pypi.python.org/pypi/pyudev"
+SECTION = "devel/python"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
+PR = "r0"
+
+SRCNAME = "pyudev"
+SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "dca4e69da387f9a6683ee4b5c27ca66a"
+SRC_URI[sha256sum] = "0acfa500219f4bcf711f35c1b2041d035b4bf5f302eca5038572ee788d9e584a"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} = "\
+  python-ctypes \
+  python-subprocess \
+  python-misc \
+  libudev \
+"
-- 
1.7.3.4



