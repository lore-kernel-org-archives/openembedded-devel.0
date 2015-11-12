Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6B82077274
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 20:17:34 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so51382799wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 12:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8frGGVwbb6DKSDGTRI3n6PATRere2ff6tc3Xw8o8Zss=;
	b=LPVpKQBA8qUts2aP7tFhxVmtHkP+BczWzM+DrmZjGKGy+uULiv3Rxl2gDxJGHJ5ryY
	8IW05rjB9nibbR5B/bR8GSQibMWBanoU8YKPyMVxMUcoh33QA+jv1cqewwlQhfdKiBpG
	7S9QlIRCp9nWu0n07MunRSd1nhqgU35cdDnlG+XOOeg251tK5kEsURpYEd2ad9Fpv6wH
	LJ1o/wZG89/bP1poRWkvse/tGFJPjb3qCI9V5nzZm4E0KfUhQeLaISP0zVJX6r76fgd1
	ncxC1fTmFEYCcGP/j9HO+dRlnJbAMOnlz8+lwDcXtREJ9ReeuL/ZeT1N5Gq9obQz8o9d
	0XDA==
X-Received: by 10.194.184.164 with SMTP id ev4mr17606528wjc.19.1447359454499; 
	Thu, 12 Nov 2015 12:17:34 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	u185sm276863wmu.19.2015.11.12.12.17.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 12:17:33 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 13:17:22 -0700
Message-Id: <1447359445-27258-2-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <1447359445-27258-1-git-send-email-kergoth@gmail.com>
References: <1447359445-27258-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 2/5] talloc,libtevent,libtdb: depend on attr
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
X-List-Received-Date: Thu, 12 Nov 2015 20:17:34 -0000

From: Christopher Larson <chris_larson@mentor.com>

These will depend on libattr if it's available, and we need deterministic
builds. This fixes a build-deps failure which occurs when attr is built before
them. There's currently no configuration option to explicitly control this
dependency, and I don't know enough about waf to add such an option, so
unconditionally dep on it for now.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb        | 1 +
 meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb | 2 +-
 meta-oe/recipes-support/talloc/talloc_2.1.1.bb        | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb b/meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb
index 0b9e1f2..e349187 100644
--- a/meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb
+++ b/meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb
@@ -1,6 +1,7 @@
 SUMMARY = "The tdb library"
 SECTION = "libs"
 LICENSE = "LGPL-3.0+ & GPL-3.0+"
+DEPENDS += "attr"
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
                     file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"
diff --git a/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb b/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb
index f297f30..c37eeb3 100644
--- a/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb
+++ b/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://tevent.samba.org"
 SECTION = "libs"
 LICENSE = "LGPLv3+"
 
-DEPENDS += "talloc libcap"
+DEPENDS += "talloc libcap attr"
 RDEPENDS_${PN} += "libtalloc"
 RDEPENDS_python-tevent = "python"
 
diff --git a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb b/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
index 89c390f..7931374 100644
--- a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
+++ b/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
@@ -2,6 +2,7 @@ SUMMARY = "Hierarchical, reference counted memory pool system with destructors"
 HOMEPAGE = "http://talloc.samba.org"
 SECTION = "libs"
 LICENSE = "LGPL-3.0+ & GPL-3.0+"
+DEPENDS += "attr"
 
 SRC_URI = "http://samba.org/ftp/${BPN}/${BPN}-${PV}.tar.gz"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
-- 
2.2.1


