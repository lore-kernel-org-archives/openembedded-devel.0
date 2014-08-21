Return-Path: <sujith.h@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0282165D56
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Aug 2014 06:50:46 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id fp1so13316552pdb.41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Aug 2014 23:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=RYas9sJxmYeyfxVAVnkvy8Y22FxA2wA1PHgukfi8YIQ=;
	b=IqzJBuXsQs9wJZbUx8Bp29N3Yz+kwFO9FSzAOJlPDUM0y90WOs0lFtC6jhAIT2HSpk
	55+z96AuI7iS9T6hkGsutjETos7LGrpNd1RqLwqjjuQ8avnvwRYdRPdtKrhBaSB9H3f5
	pbo5zqFvl08ZBidTHhmLRTYNt5N18bvDJkfjqLQpWQciMIUYwhgkxYn5frvg4oFJxU05
	U4ols4EIDADUPSXLLl+FGZ7KvdU57QLWCZMNDgcQ+vi6bQIrSHMaTkOIwPDoctXGy7va
	ygad+6zYaWYH+HGQj0xxX3duafDWFDi5xmlKaPf3sL79uTUvT9SC3/lb7h6Yr/loQgu3
	feBg==
X-Received: by 10.68.190.9 with SMTP id gm9mr32758480pbc.151.1408603847593;
	Wed, 20 Aug 2014 23:50:47 -0700 (PDT)
Received: from linux-z8xt.inp.mentorg.com ([139.181.35.34])
	by mx.google.com with ESMTPSA id
	ux10sm87840494pac.10.2014.08.20.23.50.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Aug 2014 23:50:46 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Aug 2014 12:16:47 +0530
Message-Id: <1408603607-32536-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.8.4
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [meta-python][PATCH] python-pyparted: Add recipe
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
X-List-Received-Date: Thu, 21 Aug 2014 06:50:49 -0000

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
index 0000000..db1b936
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
+RDEPENDS_${PN} += "python-stringold python-codecs python-math"
+
+S="${WORKDIR}/pyparted-${PV}"
+SRC_URI = "https://fedorahosted.org/releases/p/y/pyparted/pyparted-${PV}.tar.gz"
+SRC_URI[md5sum] = "f16c7ef7f5fa4a43fcb2a4654b487e39"
+SRC_URI[sha256sum] = "a56712e3d058ce3d859c158236dbbf45224018919efd3d880ea80f9e0d0bebbb"
+
+inherit distutils
+
+BBCLASSEXTEND += "native"
-- 
1.8.4


