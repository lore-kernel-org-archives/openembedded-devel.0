Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QczF8-0005kz-6q
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jul 2011 14:24:14 +0200
Received: by mail-fx0-f51.google.com with SMTP id 10so4286957fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jul 2011 05:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=z7RfYNTsoMXoGyPXrL1nykLH9XiBKrVwZvQsE5xuoo0=;
	b=PfPGoi9M7hKo54jkr3Q0xacfLewp2NTJSJKtHB4bAbtW0588j2Og+dxotWldWZSdoe
	cMnQGKpPeUxvnZvabPoC/ryffl1032ADmTD+kO51tdJJ4beFTQG2h3PLcerSUQ4CJk0K
	Hky1wVCMivAeHxJNqwZdwSodgtVJ2BOPIHGwA=
Received: by 10.223.71.194 with SMTP id i2mr6535691faj.42.1309609230820;
	Sat, 02 Jul 2011 05:20:30 -0700 (PDT)
Received: from localhost.localdomain
	(85-127-149-243.dynamic.xdsl-line.inode.at [85.127.149.243])
	by mx.google.com with ESMTPS id f15sm1872531fai.22.2011.07.02.05.20.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jul 2011 05:20:30 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jul 2011 14:20:47 +0200
Message-Id: <5fa6a25857cc7b16ab7fe2ca21ead58aa754f46d.1309608953.git.michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1309608953.git.michael.lippautz@gmail.com>
References: <cover.1309608953.git.michael.lippautz@gmail.com>
Subject: [meta-oe][PATCH 1/4] pyudev: Add intial version
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
X-List-Received-Date: Sat, 02 Jul 2011 12:24:14 -0000

* glib, qt4 and side .py files are deployed. Their RDEPS are however currently
  not (yet) existing, hence no RSUGGESTS.

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 .../recipes-devtools/python/python-pyudev_0.11.bb  |   22 ++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/python/python-pyudev_0.11.bb

diff --git a/meta-oe/recipes-devtools/python/python-pyudev_0.11.bb b/meta-oe/recipes-devtools/python/python-pyudev_0.11.bb
new file mode 100644
index 0000000..e14450f
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
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} = "\
+  python-ctypes \
+  python-subprocess \
+  python-misc \
+	libudev \
+"
+
+SRC_URI[md5sum] = "dca4e69da387f9a6683ee4b5c27ca66a"
+SRC_URI[sha256sum] = "0acfa500219f4bcf711f35c1b2041d035b4bf5f302eca5038572ee788d9e584a"
-- 
1.7.3.4



