Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.8293.1586437520521728165
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2020 06:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=Kqc++AGe;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 81A7F600BB;
	Thu,  9 Apr 2020 15:05:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586437518;
	bh=m36wn99MyHV4FMPZADL5euW2Ij9MG265BKvJ3pbYG8U=;
	h=From:To:Cc:Subject:Date:From;
	b=Kqc++AGeMKVTMLkVEDra9Y+XHRlx8txCIsY+MuAa1FhvW7V+c5cF8sYYuxXXu5Lqf
	 0/IPHs3M//0Jck5hPScyhwYGQ81ELhZnzQ+CgqNX88+tinEkFUy3sBO31S+6fNNktD
	 eq3y+zLgC3zYU613aMXX/FGk6Mc1uNO0mSp2zM+P7KWK7cCOgiHRLBsNKRLPrK/oih
	 GzKkPjv5PxuzTRTp1veqZgI/qLBdrHQ5l2HpUDHRgcBuufWGHPcxg+jVaA/+CQqamn
	 7bQmu69P6aDue7rX1USETgOqQiHJVxVA+ouCICaEVBrKnrqu6wJImWrP1u47nK8hyV
	 uhyxLM4JFnxgg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-python][PATCH 1/2] python3-dominate: consolidate into a single file
Date: Thu,  9 Apr 2020 15:05:09 +0200
Message-Id: <1586437510-4405-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

For details see [1]

[1] - https://lists.openembedded.org/g/openembedded-devel/topic/72718415

Suggested-by: Tim Orling <ticotimo@gmail.com>
Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-python/recipes-devtools/python/python-dominate.inc     | 11 -----------
 .../recipes-devtools/python/python3-dominate_2.4.0.bb       | 13 ++++++++++++-
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-dominate.inc

diff --git a/meta-python/recipes-devtools/python/python-dominate.inc b/meta-python/recipes-devtools/python/python-dominate.inc
deleted file mode 100644
index 7e499a6..0000000
--- a/meta-python/recipes-devtools/python/python-dominate.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "Dominate is a Python library for creating and manipulating HTML documents using an elegant DOM API."
-LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
-
-SRC_URI[md5sum] = "27d3aa7e0d67902c505e248e705e5e2e"
-SRC_URI[sha256sum] = "a92474b4312bd8b4c1789792f3ec8c571cd8afa8e7502a2b1c64dd48cd67e59c"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-threading \
-    "
diff --git a/meta-python/recipes-devtools/python/python3-dominate_2.4.0.bb b/meta-python/recipes-devtools/python/python3-dominate_2.4.0.bb
index 5304ccc..e76eefb 100644
--- a/meta-python/recipes-devtools/python/python3-dominate_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dominate_2.4.0.bb
@@ -1,2 +1,13 @@
+SUMMARY = "Dominate is a Python library for creating and manipulating HTML documents using an elegant DOM API."
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
+
+SRC_URI[md5sum] = "27d3aa7e0d67902c505e248e705e5e2e"
+SRC_URI[sha256sum] = "a92474b4312bd8b4c1789792f3ec8c571cd8afa8e7502a2b1c64dd48cd67e59c"
+
 inherit pypi setuptools3
-require python-dominate.inc
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-threading \
+    "
-- 
2.7.4

