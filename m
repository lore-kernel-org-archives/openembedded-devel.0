Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3ft1-0007BR-II
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Aug 2012 06:16:15 +0200
Received: by mail-pz0-f51.google.com with SMTP id t11so2243525daj.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 21:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=aKAN+N0HabFDUzXFpt7sd8kYU57BOSA+XBqe2hTg+DQ=;
	b=iinB1koy+8+4orSDIsk14zKcAHV1fqFBjbxnlyKy06EGv2PJQXvXtBjINmvRRW2lAy
	/+CrBBi1oOq2rRNOeCI3+YNJpVZPfmyQHMZP7GepowjzI/ctMIKVTgd9W9UyHG/laaC3
	GuYCoPRCZR7Que88CLz5JtPg7DJwSkaFn4NHe69ECKWic4eTwIWY68sNhpFCa0P5u9dh
	ZhJc0/pW7tVYtIZWQ/60kQGxemISuvVuT/lkLb1SqhF73U2cFHWHu5yLzyM4b04Q2xu3
	+5jWbnw2dYvZKmStgnoEzcrYUL7zgHMshnuPv+R2P9sGO3NcHLEGyfVR8zNvoerCjKU9
	6PXw==
Received: by 10.68.136.40 with SMTP id px8mr40176237pbb.153.1345521854027;
	Mon, 20 Aug 2012 21:04:14 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id uj3sm526674pbc.39.2012.08.20.21.04.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 21:04:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 21:03:33 -0700
Message-Id: <1345521816-2364-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345521816-2364-1-git-send-email-raj.khem@gmail.com>
References: <1345521816-2364-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-java/openjdk-7.0][PATCH 4/7] llvm: Use default PACKAGES var
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
X-List-Received-Date: Tue, 21 Aug 2012 04:16:15 -0000

avoids packaging errors with oe-core master

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 recipes-core/icedtea/icedtea7-native_2.1.1.bb |    9 +++++++++
 recipes-core/llvm/llvm.inc                    |    2 --
 2 files changed, 9 insertions(+), 2 deletions(-)
 create mode 100644 recipes-core/icedtea/icedtea7-native_2.1.1.bb

diff --git a/recipes-core/icedtea/icedtea7-native_2.1.1.bb b/recipes-core/icedtea/icedtea7-native_2.1.1.bb
new file mode 100644
index 0000000..9fff461
--- /dev/null
+++ b/recipes-core/icedtea/icedtea7-native_2.1.1.bb
@@ -0,0 +1,9 @@
+require openjdk-7-release-03b147.inc
+
+PR = "${INC_PR}.1"
+
+ICEDTEA = "icedtea-2.1.1"
+
+SRC_URI[iced.md5sum] = "32859fa5f7337d58ae848311e2a94761"
+SRC_URI[iced.sha256sum] = "4a015cf3fb8fb9aa6b3ce4a41fd9bc5dcb417a1885a10a01e92d0cc7a5ffdc65"
+
diff --git a/recipes-core/llvm/llvm.inc b/recipes-core/llvm/llvm.inc
index 114c657..185b894 100644
--- a/recipes-core/llvm/llvm.inc
+++ b/recipes-core/llvm/llvm.inc
@@ -65,8 +65,6 @@ EXTRA_OECMAKE = "\
 # We need to reset this to avoid breakage as we build out of tree
 TOOLCHAIN_OPTIONS = ""
 
-PACKAGES = "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}"
-
 PACKAGES_DYNAMIC = "llvm-*"
 
 # the difference to the non-native build is that we do not need
-- 
1.7.9.5



