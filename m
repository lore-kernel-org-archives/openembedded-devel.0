Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5220D6A687
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2013 07:14:53 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so5016051pbb.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2013 00:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=fAFBCy4GbHG0HdEhHaCf3m632FKxKKrHFUPZxKuxgoI=;
	b=ORVkaUyveS0qzSP8La8utiMqSrZwamybhgysnuUB1vUxWLf76Xb0YKeQmOYeAPhmOK
	3WiSzwYMo4qMe7q1LmhkC8d0Eli6j8/7A7fwC5xgyy2tMNmdtw/+7IUuzVQuMLZaxAVw
	cwfkqUuHz5+D3itUlhTvfDDsUDhsAijK3d+VXvkPzbk9x8pJHBB8kiA7zydvk5r3N+KP
	YvuMcuyR0wYw7A/NVBth4bx2FKgTtIr7pJxhMLn8vEmKPdeuYW/idK+m3hXvUKJbvjbF
	mTLVWVfAQUm0uz50VM0hOsxQw6+MraPrSauZOfYXtzpIQ/xYVQF+tQ5MtnOD6tvL3LiY
	vQig==
X-Received: by 10.68.125.227 with SMTP id mt3mr23833276pbb.153.1371107694320; 
	Thu, 13 Jun 2013 00:14:54 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	qi1sm28085242pac.21.2013.06.13.00.14.53 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 13 Jun 2013 00:14:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jun 2013 00:12:38 -0700
Message-Id: <1371107558-23909-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] libunwind: Fix build on arm < v6
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
X-List-Received-Date: Thu, 13 Jun 2013 07:14:53 -0000

atomics that are needed for libunuwind are not available on
arm < v6

Fixes errors like

| ../src/.libs/libunwind.so: error: undefined reference to
'AO_fetch_and_add1'
| ../src/.libs/libunwind.so: error: undefined reference to
'AO_fetch_and_add'
| collect2: error: ld returned 1 exit status

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libunwind/libunwind.inc |   16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libunwind/libunwind.inc b/meta-oe/recipes-support/libunwind/libunwind.inc
index f028766..2e1504e 100644
--- a/meta-oe/recipes-support/libunwind/libunwind.inc
+++ b/meta-oe/recipes-support/libunwind/libunwind.inc
@@ -6,7 +6,21 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3fced11d6df719b47505837a51c16ae5"
 SRC_URI = "http://download.savannah.nongnu.org/releases/${BPN}/${BPN}-${PV}.tar.gz"
 
 inherit autotools
-
 EXTRA_OECONF_arm = "--enable-debug-frame"
 
+CFLAGS += "${ATOMICOPS}"
+ATOMICOPS_armv5 = "-DAO_USE_PTHREAD_DEFS=1"
+ATOMICOPS_armv4 = "-DAO_USE_PTHREAD_DEFS=1"
+ATOMICOPS ?= ""
+
+LDFLAGS += "${LIBATOMICS}"
+LIBATOMICS_armv5 = "-latomic_ops"
+LIBATOMICS_armv4 = "-latomic_ops"
+LIBATOMICS ?= ""
+
+DEPENDS += "${DEPLIBATOMICS}"
+DEPLIBATOMICS_armv5 = "libatomics-ops"
+DEPLIBATOMICS_armv4 = "libatomics-ops"
+DEPLIBATOMICS ?= ""
+
 BBCLASSEXTEND = "native"
-- 
1.7.9.5


