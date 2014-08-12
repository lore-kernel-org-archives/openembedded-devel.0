Return-Path: <sujith.h@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2100665D5E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 13:22:43 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id g10so12641173pdj.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 06:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+1GEIbYhFHhpX2HtSdYWM/QlOCLGdhkuUIzTsm6hSAw=;
	b=HHzdjt/k6J/ACiOi+4NRQ5I3YjmC8b+OeffdfuDOUbZzPY2RqAnCASHEAh5xhYxLas
	y3UakBp9LvYljXCx0bu7uE8fZSPXe+wKelXAMh6y2WZmqiMOnxCNEoFPzMfLROMmsub+
	cNjzbt1wqc/oxHS9sfOtR5HMP7wUOgCWlFAlfonrU2+W36sHfA97hHsxM8BrjLUGfD4w
	43vXqlLcXk8S7ITD2tUz6wR18AODex4wQT5332o1hnOu1YuHrA6LBw1JUBCMqPbToCpj
	c0JwlqqX4MEPNX2tPEoSFK+2LNHr7808QPTY147PIebBb3irpR0g/q8BXPSZjEiUWEJC
	yRAA==
X-Received: by 10.66.165.34 with SMTP id yv2mr4290567pab.27.1407849764676;
	Tue, 12 Aug 2014 06:22:44 -0700 (PDT)
Received: from linux-z8xt.inp.mentorg.com ([139.181.35.34])
	by mx.google.com with ESMTPSA id
	rq7sm13063347pab.15.2014.08.12.06.22.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 06:22:43 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Aug 2014 18:48:16 +0530
Message-Id: <1407849496-25893-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.8.4
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [meta-python][PATCH] pyparted: Add recipe
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
X-List-Received-Date: Tue, 12 Aug 2014 13:22:46 -0000

From: Sujith H <Sujith_Haridasan@mentor.com>

This recipe will provide a set of Python modules that
provide Python programmers an interface to libparted,
the GNU parted library for disk partitioning and filesystem
manipulation.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
---
 .../recipes-extended/pyparted/pyparted_3.9.bb       | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-extended/pyparted/pyparted_3.9.bb

diff --git a/meta-python/recipes-extended/pyparted/pyparted_3.9.bb b/meta-python/recipes-extended/pyparted/pyparted_3.9.bb
new file mode 100644
index 0000000..7b284cc
--- /dev/null
+++ b/meta-python/recipes-extended/pyparted/pyparted_3.9.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "pyparted is a set of Python modules that provide Python programmers \
+an interface to libparted, the GNU parted library for disk partitioning and \
+filesystem manipulation."
+SUMMARY = "Python bindings for libparted"
+HOMEPAGE = "https://fedorahosted.org/pyparted/"
+SCM_URI = "git://git.fedorahosted.org/pyparted.git"
+LICENSE = "GPL-2.0+"
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
+    file://src/_pedmodule.c;startline=10;endline=22;md5=70c62bd73782a03f56a0571a9f08ea46 \
+"
+DEPENDS += "parted"
+PR = "r0"
+
+SRC_URI = "https://fedorahosted.org/releases/p/y/pyparted/pyparted-${PV}.tar.gz"
+SRC_URI[md5sum] = "f16c7ef7f5fa4a43fcb2a4654b487e39"
+SRC_URI[sha256sum] = "a56712e3d058ce3d859c158236dbbf45224018919efd3d880ea80f9e0d0bebbb"
+
+inherit distutils
+
+BBCLASSEXTEND += "native"
-- 
1.8.4


