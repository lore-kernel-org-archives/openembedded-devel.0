Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.4509.1585942968390667588
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 12:42:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=k4V2CFCZ;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id EEAAB60481;
	Fri,  3 Apr 2020 21:42:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1585942967;
	bh=7uS5UPeCwjwWm7WF+biI7OnxNrBMl5Ufz16HqfU53js=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k4V2CFCZLmHDa4LbrPu3hJ9WQGIhmO5DJylIkZ9c+RkbuwDY+5UeG+hnRfL3SsxgJ
	 kZgbW8n/PBmZbZusa9DIJgYvpjcNc4uXIHUQzww4uf80DuSjN4C4nIVGnM6yfLSirT
	 XUm0i5AvQstxQ2EgDBJ3AZSu9tE0GNB5FSsVmjUHh3mxx2Iw641x+EWiX1Pw1Uw71r
	 gHaLiGU95tonuyLRkDOqub/IYIynib3XPgiDygH7UPAuJHY1h2TXyDxVxSGqzaoEmC
	 S+mv8FaFFrQcNzFsF0UARRsL5wwxT4AmaQUexMeX/nxdhZGBDcUESkARRYd+RiHBKa
	 EPFIYI7M0x9ZQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-python][PATCH 5/5] python3-semver: consolidate into a single file
Date: Fri,  3 Apr 2020 21:42:43 +0200
Message-Id: <1585942963-20703-5-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585942963-20703-1-git-send-email-pjtexier@koncepto.io>
References: <1585942963-20703-1-git-send-email-pjtexier@koncepto.io>

For details see [1]

[1] - https://lists.openembedded.org/g/openembedded-devel/topic/72718415

Suggested-by: Tim Orling <ticotimo@gmail.com>
Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-python/recipes-devtools/python/python-semver.inc      | 12 ------------
 .../recipes-devtools/python/python3-semver_2.8.1.bb        | 14 ++++++++++++--
 2 files changed, 12 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-semver.inc

diff --git a/meta-python/recipes-devtools/python/python-semver.inc b/meta-python/recipes-devtools/python/python-semver.inc
deleted file mode 100644
index 3c95c06..0000000
--- a/meta-python/recipes-devtools/python/python-semver.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Python module for Semantic Versioning"
-HOMEPAGE = "https://github.com/k-bx/python-semver"
-BUGTRACKER = "https://github.com/k-bx/python-semver/issues"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
-
-SRC_URI[md5sum] = "dc579ba9d0bb2137bad5324d4bdb7e40"
-SRC_URI[sha256sum] = "5b09010a66d9a3837211bb7ae5a20d10ba88f8cb49e92cb139a69ef90d5060d8"
-
-inherit pypi
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-semver_2.8.1.bb b/meta-python/recipes-devtools/python/python3-semver_2.8.1.bb
index 77925ae..a469b23 100644
--- a/meta-python/recipes-devtools/python/python3-semver_2.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-semver_2.8.1.bb
@@ -1,2 +1,12 @@
-inherit setuptools3
-require python-semver.inc
+DESCRIPTION = "Python module for Semantic Versioning"
+HOMEPAGE = "https://github.com/k-bx/python-semver"
+BUGTRACKER = "https://github.com/k-bx/python-semver/issues"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
+
+SRC_URI[md5sum] = "dc579ba9d0bb2137bad5324d4bdb7e40"
+SRC_URI[sha256sum] = "5b09010a66d9a3837211bb7ae5a20d10ba88f8cb49e92cb139a69ef90d5060d8"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4

