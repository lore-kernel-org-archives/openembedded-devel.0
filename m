Return-Path: <sujith.h@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2240770C8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 14:06:19 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id fa1so13073406pad.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 07:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WhJWbnJrjf9viRkWEkVPH1LgqBXMT1ZNY7A1jJUz2NY=;
	b=z7U56rLjy8fg9SsmS4vLgEgazNejQ+8RdfKKLeXti4VyFD3xTaPVLben2KDhEudEoR
	xO3NqPdnKeFY3v7XoaGyDUq2iyXh+DUGHCVDYOHCtxOeQnHEOC7S7EfdQVi5j9wUiWcl
	3OP2Z1vBYihDnB1ppBkHQdjb6oEq5JC/RRe7gqBg/7ys++FimEh2FtDyVHxXVNLzg2/T
	z5LeEhzIVhN4zZcrpSFpkkLBm/kRKvY3LkBd6pk59RICCcztagbKe+UYoxlYYohe8D64
	WBLjKNW3dA+XPr3hhkMhysZnlXgN5+zorm3rUVYKdL9KGkrn0m06oXnE2yz+3SUPr4j6
	4eyA==
X-Received: by 10.70.101.201 with SMTP id fi9mr4592681pdb.125.1407852380308;
	Tue, 12 Aug 2014 07:06:20 -0700 (PDT)
Received: from linux-z8xt.inp.mentorg.com ([139.181.35.34])
	by mx.google.com with ESMTPSA id hk7sm16664256pdb.4.2014.08.12.07.06.16
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 07:06:18 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Aug 2014 19:31:50 +0530
Message-Id: <1407852110-26705-1-git-send-email-sujith.h@gmail.com>
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
X-List-Received-Date: Tue, 12 Aug 2014 14:06:20 -0000

From: Sujith H <Sujith_Haridasan@mentor.com>

This recipe will provide a set of Python modules that
provide Python programmers an interface to libparted,
the GNU parted library for disk partitioning and filesystem
manipulation.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
---
 meta-python/recipes-extended/pyparted/pyparted_3.9.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-extended/pyparted/pyparted_3.9.bb

diff --git a/meta-python/recipes-extended/pyparted/pyparted_3.9.bb b/meta-python/recipes-extended/pyparted/pyparted_3.9.bb
new file mode 100644
index 0000000..79ebe02
--- /dev/null
+++ b/meta-python/recipes-extended/pyparted/pyparted_3.9.bb
@@ -0,0 +1,19 @@
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
+
+inherit distutils
+
+BBCLASSEXTEND += "native"
-- 
1.8.4


