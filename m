Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.7811.1613739532361314035
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Feb 2021 04:58:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=NVJQkZZ5;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from anbelski-lsg-linux-yocto-1.irsgb21fvobu5fvmalxug44hib.xx.internal.cloudapp.net (unknown [52.247.218.173])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9D63520B6C40
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Feb 2021 04:58:51 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9D63520B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1613739531;
	bh=0hRwQ0nEMmn8X15f+TzAerkg8YOdycUw9wmOLrMOz0M=;
	h=From:To:Subject:Date:From;
	b=NVJQkZZ53l7DBNtIGvEP3lxPHRBEC5i7uvGz9tPVaTWCqhB/bH2IYcv1Y1Ar3QBHp
	 Kji9aU3FMM89kBbieR3hEPhW4asIA9kWCnolmz/Q0Iuk1ttkDVvRDA+xoZr7+uUqMM
	 cI6bFjBhQ8EwvQ2EqaUniKfGwIMp1BmBnJZ9dSxw=
From: "Anatol Belski" <anbelski@linux.microsoft.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] abseil-cpp: Relax build requirements
Date: Fri, 19 Feb 2021 12:58:45 +0000
Message-Id: <20210219125845.29016-1-anbelski@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1

While better hardware acceleration is definitely advantageous, there is no
hard requirement defined by the upstream. Removing this will allow
builds targeting older hardware where DEFAULTTUNE can't be changed. If
found useful, this can also be backported to lower branches.

Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
---
 .../abseil-cpp/abseil-cpp_git.bb              | 24 -------------------
 1 file changed, 24 deletions(-)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index cc7bf01d73..7d935d523b 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -34,27 +34,3 @@ ALLOW_EMPTY_${PN} = "1"
 FILES_${PN} = "${libdir}/libabsl_*.so ${libdir}/cmake"
 FILES_${PN}-dev = "${includedir}"
 
-python () {
-    arch = d.getVar("TARGET_ARCH")
-
-    if arch == "aarch64":
-        tunes = d.getVar("TUNE_FEATURES")
-        if not tunes:
-            raise bb.parse.SkipRecipe("%s-%s Needs support for crypto on armv8" % (pkgn, pkgv))
-            return
-        pkgn = d.getVar("PN")
-        pkgv = d.getVar("PV")
-        if "crypto" not in tunes:
-            raise bb.parse.SkipRecipe("%s-%s Needs support for crypto on armv8" % (pkgn, pkgv))
-
-    if arch == "x86_64":
-        tunes = d.getVar("TUNE_FEATURES")
-        if not tunes:
-           raise bb.parse.SkipRecipe("%s-%s Needs support for corei7 on x86_64" % (pkgn, pkgv))
-           return
-        pkgn = d.getVar("PN")
-        pkgv = d.getVar("PV")
-        if "corei7" not in tunes:
-            raise bb.parse.SkipRecipe("%s-%s Needs support for corei7 on x86_64" % (pkgn, pkgv))
-
-}
-- 
2.17.1

