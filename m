Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 04EB177EB0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:45 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id o123so18543924pga.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lnb1/z2aLHrcR2FgEympWBxHJOB7ZXxwK/FFRNJaZdQ=;
	b=XF0gT3GU4wlYM4FDtjaEkM4+11oVoo+fYz6A10q/aUfeHKSKVwIHR4DBOonz1CWrGq
	6VOlHVbum8a3MmUHgtCkbInrKeikfkTWNW11MNUSAY4XXz3ZNKvBwAhHEIgGIb9g8tGl
	alM3hV6stmL3dKnwHpRQ0WRUeyG9LsMT2rhhY+cKll6tTylzKCO+U/I3jsBNj3V0jtNo
	mO83DucMg28M0fMB4LOk6g6vdCwAWS5z7JjQsz6y4CiUdBhvbXdOE1Znq8j6JX0PeJ7t
	l94rjgJfTXNHvSHXfCh8kTpv7eJ/w4RZn/sa69PJhvJ3NDb3/gisG/yrJpdsWZ419mEk
	qd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lnb1/z2aLHrcR2FgEympWBxHJOB7ZXxwK/FFRNJaZdQ=;
	b=eFZne2HJ7tj9kFpF2ZORnQhAkKRIcpzd7LuuQTMOhdNIJOaaCiv19riQ/P+4MtNGr7
	Ygp1scda+YYpLTznYKqhC5rNr/dgTFiB8wi87jWWSU3k0BgHfLrUTmxzAtHcbey4rVuf
	LpVIeQuLi6bdzUhvQ8c9zXPgQRg4b9SFL0BslqB+4CjP5qWy2h1VNpgjWiIQYwsxVJDL
	YVTaZDAUCwKWa24pY9ZvXbSjEPIsFfl7jNkTP3TqOZQFhLGFBIPG0KHce2/lui/3jNlM
	yfp6dTHKlugHxzExgLKUhQzCo8+zbNX9J/+WUdF7+Ve/OJ+Cu1nlAbJRNL79Cdj4m0aV
	I9Rw==
X-Gm-Message-State: AFeK/H0VzR3kAxg/NeDmszTg0zqn93uEAoF1vAo1d+vP9mVsj6amLdtF4DJJGjd4KEFngg==
X-Received: by 10.84.241.14 with SMTP id a14mr4435984pll.117.1490978626655;
	Fri, 31 Mar 2017 09:43:46 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:39 -0700
Message-Id: <20170331164247.5052-35-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 35/43] picocom: Upgrade to 2.2
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:45 -0000

Package has moved to github
License file got some cosmetic changes see
https://github.com/npat-efault/picocom/commit/13fd331d410c2e8c39fa041bd54c3b0a93df64e1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/picocom/picocom_1.7.bb | 19 -------------------
 meta-oe/recipes-support/picocom/picocom_git.bb | 23 +++++++++++++++++++++++
 2 files changed, 23 insertions(+), 19 deletions(-)
 delete mode 100644 meta-oe/recipes-support/picocom/picocom_1.7.bb
 create mode 100644 meta-oe/recipes-support/picocom/picocom_git.bb

diff --git a/meta-oe/recipes-support/picocom/picocom_1.7.bb b/meta-oe/recipes-support/picocom/picocom_1.7.bb
deleted file mode 100644
index d2a76c0a9..000000000
--- a/meta-oe/recipes-support/picocom/picocom_1.7.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Lightweight and minimal (~20K) dumb-terminal emulation program"
-SECTION = "console/utils"
-LICENSE = "GPLv2+"
-HOMEPAGE = "http://code.google.com/p/picocom/"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=393a5ca445f6965873eca0259a17f833"
-
-SRC_URI = "http://picocom.googlecode.com/files/picocom-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "8eaba1d31407e8408674d6e57af447ef"
-SRC_URI[sha256sum] = "d0f31c8f7a215a76922d30c81a52b9a2348c89e02a84935517002b3bc2c1129e"
-
-EXTRA_OEMAKE = "'CC=${CC}' 'LD=${LD}' 'VERSION=${PV}' \
-		'CFLAGS=${CFLAGS}' 'LDFLAGS=${LDFLAGS}' "
-
-do_install () {
-    install -d ${D}${bindir}
-    install -m 0755 ${BPN} pcasc pcxm pcym pczm ${D}${bindir}/
-}
-
diff --git a/meta-oe/recipes-support/picocom/picocom_git.bb b/meta-oe/recipes-support/picocom/picocom_git.bb
new file mode 100644
index 000000000..e091094cf
--- /dev/null
+++ b/meta-oe/recipes-support/picocom/picocom_git.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Lightweight and minimal (~20K) dumb-terminal emulation program"
+SECTION = "console/utils"
+LICENSE = "GPLv2+"
+HOMEPAGE = "http://code.google.com/p/picocom/"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000e4830620e310fe65c0eb69df9e8a"
+
+BASEPV = "2.2"
+PV = "${BASEPV}+git${SRCPV}"
+
+SRCREV = "deffd18c24145bd6f965f44e735a50b65810ccdc"
+
+SRC_URI = "git://github.com/npat-efault/picocom"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "'CC=${CC}' 'LD=${CC}' 'VERSION=${BASEPV}' \
+		'CFLAGS=${CFLAGS}' 'LDFLAGS=${LDFLAGS}' "
+
+do_install () {
+    install -d ${D}${bindir}
+    install -m 0755 ${BPN} pcasc pcxm pcym pczm ${D}${bindir}/
+}
+
-- 
2.12.1


