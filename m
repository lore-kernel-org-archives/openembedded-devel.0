Return-Path: <sujith.h@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id AF93865D56
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Aug 2014 06:29:02 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id lf10so16129527pab.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Aug 2014 23:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=u0I0C+LcKaozy35ZUmTsChZ7sZyP0aMJbAlbc71nO8k=;
	b=O/ndAIiqBhQZejM3EHWsaMorwduQmU74fPljOsysGmqoNXHsYDHh3CCjD0R/qXzyHd
	y4WT9cDLX0txWlJY0CmgFCx7qF8uvHvSPNBYt21saOix30Ln0QUYoT0wjhT97GCds5Pd
	8eN6oEfDTUDYHLSJpRKVk4aMuWkjFa/keCxqzpnjwuxi35gfWLxkwHxAXBC/6Ibdhazq
	l+Zj7Q85//45lDKRreI+AQ1AW+NcWQrlOZtL4P+EEG2Sw/cFXNw+acJC9Jlib9WudIq7
	UK2c/byFVrkietktuakvbaMQ30YVx169ZIIqchBB23HunDU+L7Pdr+MCSEdaodfi6xSZ
	mWEw==
X-Received: by 10.68.220.71 with SMTP id pu7mr4144776pbc.22.1408688943077;
	Thu, 21 Aug 2014 23:29:03 -0700 (PDT)
Received: from linux-z8xt.inp.mentorg.com ([139.181.35.34])
	by mx.google.com with ESMTPSA id
	lq4sm98744763pab.48.2014.08.21.23.29.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Aug 2014 23:29:02 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Aug 2014 11:55:05 +0530
Message-Id: <1408688705-20179-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.8.4
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [meta-python][PATCH v3] python-pyparted: Add recipe
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
X-List-Received-Date: Fri, 22 Aug 2014 06:29:09 -0000

From: Sujith H <Sujith_Haridasan@mentor.com>

This recipe will provide a set of Python modules that
provide Python programmers an interface to libparted,
the GNU parted library for disk partitioning and filesystem
manipulation.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
---
 .../python-pyparted/python-pyparted_3.9.bb          | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb

diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb
new file mode 100644
index 0000000..919b301
--- /dev/null
+++ b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "pyparted is a set of Python modules that provide Python programmers \
+an interface to libparted, the GNU parted library for disk partitioning and \
+filesystem manipulation."
+SUMMARY = "Python bindings for libparted"
+HOMEPAGE = "https://fedorahosted.org/pyparted/"
+LICENSE = "GPL-2.0+"
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
+    file://src/_pedmodule.c;startline=10;endline=22;md5=70c62bd73782a03f56a0571a9f08ea46 \
+"
+DEPENDS += "parted"
+
+SRC_URI = "https://fedorahosted.org/releases/p/y/pyparted/pyparted-${PV}.tar.gz"
+SRC_URI[md5sum] = "f16c7ef7f5fa4a43fcb2a4654b487e39"
+SRC_URI[sha256sum] = "a56712e3d058ce3d859c158236dbbf45224018919efd3d880ea80f9e0d0bebbb"
+S = "${WORKDIR}/pyparted-${PV}"
+
+inherit distutils
+
+RDEPENDS_${PN} += "python-stringold python-codecs python-math"
+BBCLASSEXTEND += "native"
-- 
1.8.4


