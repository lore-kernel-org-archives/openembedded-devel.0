Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id E8F3F781F3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 05:40:46 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id u62so9393866pgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 22:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SP9UWhhRem51aMxVI1kwzQE//QcAkCmcNJnh5GmD9f8=;
	b=XJuXY9hEqolo7d1Ps8qlE6p2lrgDK5np5fGW+dlcsLPxbeE3Oc4hI9amY0vdttjeq4
	aFELzcpOiwCVeA/ba7I7NjekJZPlhdwpP1hr5mgXU5LlS79lijpciekrs0XjecC/b0Kk
	HPS3YHKLxlqw1Qxird5K2LrqbJT48a/iUVBsq9pJnlsuQKqwO/rjZ4/bR2EP4HCTQtl+
	C92WkIZAZw9zh5tO9Enu2R8TrW/4klCEOGKipXm0agmIp5rQim33fdjF5jqzHGi2TacU
	ByMIwQ6kCopuChVQqQQGJMIIDPRyrRTsnYA9bZ+Hd+ttdAPILV+vu5yGdseJGiIeS3Ob
	oEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SP9UWhhRem51aMxVI1kwzQE//QcAkCmcNJnh5GmD9f8=;
	b=n6em+o+2HRh5HFRPus7hRmVfy8aX0RL0NGNjuyQrA0YfX4jQAHoAtYOcRxA8XTcqtB
	R08uovKdnjEkCxRnZkGwnSQoBCOiC2ylD/CsqAoLNIVAFW/OLWhh4Swv8BIzwl9BLC6H
	t65P4wWYKAdaO0ZBuufln+pMUyK+aaGlDNdZSbYSaIiIFRnOEB5sEVgLR4iio/t9qn35
	yFzgCxBnnMu43e9Jbkc5ikWBMqxphdG8GBTJru/lvreptCQ5TfUodoqSpMkeUvgdZM5X
	JwPIkO5wXGZDQBApA+uvQF9dKUMbOJfnY4MOzPciuLsnoFbH5fU9ku/sgDQfgnv7bXv4
	k0Nw==
X-Gm-Message-State: AIVw110b2St9ZOapuZsztJltcauoa8hex9iiNYglrj58gI1sNoq07ATf
	j3t/p9OxLsWU8Y4u
X-Received: by 10.99.97.4 with SMTP id v4mr13150832pgb.254.1500010848218;
	Thu, 13 Jul 2017 22:40:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	z86sm17519420pfl.40.2017.07.13.22.40.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 22:40:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jul 2017 22:40:12 -0700
Message-Id: <20170714054013.34458-17-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170714054013.34458-1-raj.khem@gmail.com>
References: <20170714054013.34458-1-raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 17/18] yaffs2-utils: Fix build with musl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Jul 2017 05:40:47 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-define-loff_t-if-not-already-defined.patch | 30 ++++++++++++++++++++++
 .../recipes-filesystems/yaffs2/yaffs2-utils_git.bb |  3 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0001-define-loff_t-if-not-already-defined.patch

diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0001-define-loff_t-if-not-already-defined.patch b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0001-define-loff_t-if-not-already-defined.patch
new file mode 100644
index 000000000..df202c855
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0001-define-loff_t-if-not-already-defined.patch
@@ -0,0 +1,30 @@
+From 848717da4a28d33f8aa8f889377e61e6b1b8ae67 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Jul 2017 18:29:52 -0700
+Subject: [PATCH] define loff_t if not already defined
+
+Helps to build with musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ yaffs_guts.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/yaffs_guts.h b/yaffs_guts.h
+index 6bcf12d..4af17ce 100644
+--- a/yaffs_guts.h
++++ b/yaffs_guts.h
+@@ -18,6 +18,10 @@
+ 
+ #include "yportenv.h"
+ 
++#ifndef loff_t
++#define loff_t off_t
++#endif
++
+ #define YAFFS_OK	1
+ #define YAFFS_FAIL  0
+ 
+-- 
+2.13.2
+
diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
index e8d187389..67c926b2c 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
@@ -14,7 +14,8 @@ DEPENDS = "mtd-utils"
 # Source is the HEAD of master branch at the time of writing this recipe
 SRC_URI = "git://www.aleph1.co.uk/yaffs2;protocol=git;branch=master \
            file://makefile-add-ldflags.patch \
-          "
+           file://0001-define-loff_t-if-not-already-defined.patch \
+           "
 
 SRCREV = "bc76682d93955cfb33051beb503ad9f8a5450578"
 S = "${WORKDIR}/git"
-- 
2.13.2


