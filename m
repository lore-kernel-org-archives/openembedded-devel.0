Return-Path: <gary.robertson@linaro.org>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 26568717DB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Nov 2014 19:23:38 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id uz6so1392551obc.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Nov 2014 11:23:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8f0MWjfQhAoIBMxZ6hy5Y39Bq5USAo0L80vzgoAGY4Y=;
	b=dUwxBSmBJoJJn/K44MhG6GNJBJJPNhKJXl7Zd/3lVVsL7AkEYEyDNQBMJOyCqu0uj2
	eNbAlpckYMHRu6NcghZJS/xjTA5BTz6ndQ5X5b2z+RXQjUMdLWRh32Wg4sgED3OVDqRi
	id/1b84QF0jEVf9tMufcdX4JswrztYPcILa2cmzG0X76gcawZforVtuWz/PPHiXlkGpO
	tWjMhJ13Bq4D+XxjJTljNWBdKcDKdQpV81qg6Ro1qoNG/1FktSRH5JiIU3DZ0K8vPb4h
	kgl5+yBHt0Dgwy7TFaUuiPhW1lexxif38+bdmfZZSclBol/s7iuIoQ7M0D+3L0qoGxXb
	X+dw==
X-Gm-Message-State: ALoCoQnxCtxcrNpnUaDcw+sTx6DzK+0OFN8W7xfxUkh5M8bYLhJdDU73c6YP3uT8GcNDwMzEMDCc
X-Received: by 10.202.52.135 with SMTP id b129mr1029988oia.126.1415301819593; 
	Thu, 06 Nov 2014 11:23:39 -0800 (PST)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id 2sm3016019obq.29.2014.11.06.11.23.38
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 06 Nov 2014 11:23:38 -0800 (PST)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Nov 2014 13:23:02 -0600
Message-Id: <1415301783-5342-3-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1415301783-5342-1-git-send-email-gary.robertson@linaro.org>
References: <1415301783-5342-1-git-send-email-gary.robertson@linaro.org>
Subject: [PATCH 2/3] libhugetlbfs: Recognize all ix86 arches
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
X-List-Received-Date: Thu, 06 Nov 2014 19:23:45 -0000

From: "Gary S. Robertson" <gary.robertson@linaro.org>

The makefile for libhugetlbfs recognized only i386 or x86_64 arch designators.
Extended this to also recognize i486, i586, and i686

Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
---
 ...01-libhugetlbfs-Recognize-all-ix86-arches.patch |   31 ++++++++++++++++++++
 .../libhugetlbfs/libhugetlbfs_git.bb               |    1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-libhugetlbfs-Recognize-all-ix86-arches.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-libhugetlbfs-Recognize-all-ix86-arches.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-libhugetlbfs-Recognize-all-ix86-arches.patch
new file mode 100644
index 0000000..4eade89
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-libhugetlbfs-Recognize-all-ix86-arches.patch
@@ -0,0 +1,31 @@
+From fcb166479d3ccd9b79fd07e89b1ed2d8899b4391 Mon Sep 17 00:00:00 2001
+From: "Gary S. Robertson" <gary.robertson@linaro.org>
+Date: Wed, 24 Sep 2014 15:27:31 -0500
+Subject: [libhugetlbfs][PATCH] Recognize all ix86 arches
+
+The makefile only recognized i386 or x86_64 arches.  Added support
+to recognize i486, i586, i686.
+
+Upstream Status: Submitted
+
+Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 91502e1..0bfaee8 100644
+--- a/Makefile
++++ b/Makefile
+@@ -71,7 +71,7 @@ ELF64 = aarch64elf
+ TMPLIB64 = lib64
+ CUSTOM_LDSCRIPTS = no
+ else
+-ifeq ($(ARCH),i386)
++ifneq (,$(filter i386 i486 i586 i686,$(ARCH)))
+ CC32 = $(CC)
+ ELF32 = elf_i386
+ TMPLIB32 = lib
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 737acb9..0af77f1 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
     file://0001-aarch64-fix-page-size-not-properly-computed.patch \
     file://0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch \
     file://0001-Extend-arm32-support-to-include-BE-variants.patch \
+    file://0001-libhugetlbfs-Recognize-all-ix86-arches.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.7.9.5


