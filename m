Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5420478072
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:10:41 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id u5so4582615pgq.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 20:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eLOGSaepGFT43n48dchFA1gL3lPNCwpfzqWME62hnTs=;
	b=moysx7wes4lwquuuCkqYMPGoZBNwZcnRocB6jBlDGIqenzsVIsicCtxh7KW8zLw6l6
	A4HBOppFkffUriBxtTuATLGk6gY9wmLj0/hrXTgGOUidOgzLWIPp7mVHaXRE5gipqc9+
	p/KgZRpgUPhex7/rSTqN1N+7ukrx9dqiquDMd0aYWxAChBOJ5TgCa+g8l5BOSMKDWopA
	U50PD58M1Vk6/EgZfWtP1alceS05MWb1e6rUnjq7qQwJHIkWGqqlKSglNy4zXmEyTNUb
	zn8+mbhlGEPdEh9UabrQtEgfxswIWZfona7jOek12wmSov0SNnuPUn1ibUFFq3EeagES
	Uu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eLOGSaepGFT43n48dchFA1gL3lPNCwpfzqWME62hnTs=;
	b=QwapFgIl3KTbXH3CzBbg42LIN8fXubr5Ycjk/ECuVr31AApZsLwvKU5gso3s0CyjQe
	OA77gdP/goihWLq+RHcKCJlDv6gNsgqaKGmca/F3z3pm+c1+brBTdyPcroq/p4SW4YjO
	QEcNbeS80F0dPhc+boxZ9WvnxIySeJ+ZE7QJbvzNQ0xW/tDD1/slsTGKHC1B8KLGdE8B
	zaoRGbfRjjOSu8fpRkPlWfwnfkeJIiBfem4k8Q1iC9sQrsiseJJLY64BRPm4/UGuB3am
	TAPeOSJSMmXWV1hsV47BCcCwfxcbGMrXHezf8mNquewkMZ9dW/zQ3iWTYl5TLwaV6Q5u
	SBPw==
X-Gm-Message-State: AIVw111pM83m38KxIej315kj0Yzrncvploror7YQgO3iIMhbBgYLgbsX
	/RyjRGkrFZ3NjNvw
X-Received: by 10.99.66.1 with SMTP id p1mr803742pga.120.1500347442384;
	Mon, 17 Jul 2017 20:10:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	w85sm1086674pfj.115.2017.07.17.20.10.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 20:10:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jul 2017 20:10:09 -0700
Message-Id: <20170718031013.44536-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170718031013.44536-1-raj.khem@gmail.com>
References: <20170718031013.44536-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 13/17] phonet-utils: Fix build with musl
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
X-List-Received-Date: Tue, 18 Jul 2017 03:10:42 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Include-limits.h-for-PATH_MAX.patch       | 25 ++++++++++++++++++++++
 .../phonet-utils/phonet-utils_git.bb               |  4 +++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/phonet-utils/phonet-utils/0001-Include-limits.h-for-PATH_MAX.patch

diff --git a/meta-oe/recipes-connectivity/phonet-utils/phonet-utils/0001-Include-limits.h-for-PATH_MAX.patch b/meta-oe/recipes-connectivity/phonet-utils/phonet-utils/0001-Include-limits.h-for-PATH_MAX.patch
new file mode 100644
index 000000000..8bb7e5a18
--- /dev/null
+++ b/meta-oe/recipes-connectivity/phonet-utils/phonet-utils/0001-Include-limits.h-for-PATH_MAX.patch
@@ -0,0 +1,25 @@
+From f7ad9a4471cee2324f216a0d82ba8097ec746c56 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 15 Jul 2017 11:48:12 -0700
+Subject: [PATCH] Include limits.h for PATH_MAX
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/pnstat.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/pnstat.c b/src/pnstat.c
+index 661a5bc..76068e6 100644
+--- a/src/pnstat.c
++++ b/src/pnstat.c
+@@ -35,6 +35,7 @@
+ #include <dirent.h>
+ #include <unistd.h>
+ #include <netinet/tcp.h>
++#include <limits.h>
+ 
+ struct fd
+ {
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb b/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
index 558996391..3c599950f 100644
--- a/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
+++ b/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
@@ -2,7 +2,9 @@ SUMMARY = "This small package provides a few command line tools for Linux Phonet
 HOMEPAGE = ""
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-SRC_URI = "git://gitorious.org/meego-cellular/phonet-utils.git;branch=master"
+SRC_URI = "git://gitorious.org/meego-cellular/phonet-utils.git;branch=master \
+           file://0001-Include-limits.h-for-PATH_MAX.patch \
+           "
 PR = "r2"
 S = "${WORKDIR}/git"
 SRCREV = "4acfa720fd37d178a048fc2be17180137d4a70ea"
-- 
2.13.3


