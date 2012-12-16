Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkIi8-0005nM-Tf
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 19:13:13 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1964853eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 09:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=q1AVDyZQh+a5zeI8AbNI16Efhx0BmoFaQtWxBatnmY8=;
	b=d2mOvCaoWz/vhekLkz90D+oRWOxjyttVl2C5EMPW3pWpjzTx6/652jz5a3IPTQK5xP
	U2WEk92ElEs1+yG0cGMOCCqutPLlnWxxo4R0bNNdVySdl3FJ4+yDtou+Nigk0sNIivWc
	LPY8hUy2W9lWKXKefvfEXPVBZzwUHgA+9CzeYDtTbl0SxHwkN/qOWXQ2Q1gAGhm+qnpo
	ZhImsF8XCq1g5uQSzRPZhjL7kQEmACLRiGcbG1jbJCFtX/GdfPUbg3gEW/cqllX4oaw6
	zs031TF0j9GDfan5ljBmOQ4vYjaiCQSvifNL6D0szxPJqfJenHsTD1cLjqzamjZ1RJyl
	B/qA==
Received: by 10.14.184.131 with SMTP id s3mr33704305eem.38.1355680713940;
	Sun, 16 Dec 2012 09:58:33 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id r1sm23881197eeo.2.2012.12.16.09.58.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:58:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2012 18:58:00 +0100
Message-Id: <14e212ca82763e4250dff73b8d012f188dc1b0f8.1355680285.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 17/26] wpa-supplicant, gcc-common-4.6, packagegroup-qte-toolchain-target: use correct PRINC form
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
X-List-Received-Date: Sun, 16 Dec 2012 18:13:13 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappend | 2 +-
 .../recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend     | 2 +-
 toolchain-layer/recipes-devtools/gcc/gcc-common-4.6.inc                 | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappend b/meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappend
index 7ca6c59..f379101 100644
--- a/meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappend
+++ b/meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappend
@@ -1,3 +1,3 @@
 RDEPENDS_${PN} += "qwt-e-dev"
 
-PRINC = "1"
+PRINC := "${@int(PRINC) + 1}"
diff --git a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
index a4dceb4..609a1f3 100644
--- a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
@@ -1,4 +1,4 @@
-PRINC = "2"
+PRINC := "${@int(PRINC) + 2}"
 
 inherit systemd
 
diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-common-4.6.inc b/toolchain-layer/recipes-devtools/gcc/gcc-common-4.6.inc
index cbb90e9..f6b4929 100644
--- a/toolchain-layer/recipes-devtools/gcc/gcc-common-4.6.inc
+++ b/toolchain-layer/recipes-devtools/gcc/gcc-common-4.6.inc
@@ -1,4 +1,4 @@
 # this will prepend this layer to FILESPATH
 FILESEXTRAPATHS := "${THISDIR}/gcc-4.6"
-PRINC = "6"
+PRINC := "${@int(PRINC) + 6}"
 ARM_INSTRUCTION_SET = "arm"
-- 
1.8.0.2



