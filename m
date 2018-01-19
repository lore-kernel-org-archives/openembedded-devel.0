Return-Path: <athoik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id AE2EF6011C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jan 2018 22:05:23 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id x4so9077494wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jan 2018 14:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pMwZwjfkDM9h0V9DMsr2u3Wa9vZpJMsgyK9Jmk54egM=;
	b=WT70c9tqRIaTRXGLmyV9qKUyRwIEkzJbdyrjQlTF8oJv9MhZcsj06OBnq5OdY9iyvi
	5Q/bcl3fX3l7R6Bg5WBXogOiJ0CX3a/u/vW7z6YZMNC/m6zvLRilM3cd/SnmZW/S05p9
	QxKuHPlc2z3fXsKmt9hCRyU0Kv2hs0t97qWd1cDmrCgAxAL+juN7TVuU1P9+wX8YqVFj
	7zumEIQepFWno0FsxwjlU05S7APpdxWO7wEbI2P42+YA2I/nIRWWLmCEzxibgXBoW8Wx
	Bge+QuwUfgyLW4X/hsjBG3RSQ8EBnPoOSYizzaCa/znSbYCeZ1WS7qmNCRMJC0oXv1Cg
	FFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pMwZwjfkDM9h0V9DMsr2u3Wa9vZpJMsgyK9Jmk54egM=;
	b=H2MsM0JmDtp/a+M+AwI+UcDb/dEbVCn+EZ9J9RZK8nNXO6eMIGpVyKYYAxtYD73LDS
	f0eF15De0CQQ0eqtRl2NO4QKkSHHlGinAb5VL+YBhMSONb3dEIE8VynkHQuXcSoQRhJI
	iozK4CqZRsTvIBUOPTlbrBilYqiKjN5DJqRl/ZBT4QpRPoQ3M1DnfxGxK8y3A2LU1g9A
	i8/6MspiRSRqKQxa4++Nz9OnhHoPFAqSLT8GKdHVXApFeunTz9/DQ9Sbi4IQlCQC6kz5
	Dducb3oGn33TaOuWWKywYagyoLjyS66CBBIhbIWcxl9GRzvBxM4tKVWaH9KqzAtDHoa6
	H73Q==
X-Gm-Message-State: AKwxytez5y+gvjfGohLTJ31ZKChsWLb01lxXcsxbj+5Y2Vv/4ae6NJ6r
	V+5EWQLSMxE+HLBOIafpqZHI
X-Google-Smtp-Source: AH8x225aKvs/m7erI+4i4h2cZIeex658WGqetMu0bJbHPDOnvZNh5a9Y9G0dEwZOOHC8sYrrcL+phw==
X-Received: by 10.28.146.141 with SMTP id u135mr234083wmd.26.1516399523778;
	Fri, 19 Jan 2018 14:05:23 -0800 (PST)
Received: from images.net (ns380618.ip-188-165-252.eu. [188.165.252.42])
	by smtp.gmail.com with ESMTPSA id
	z71sm25730157wrc.11.2018.01.19.14.05.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Jan 2018 14:05:22 -0800 (PST)
From: Athanasios Oikonomou <athoik@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Jan 2018 00:05:02 +0200
Message-Id: <1516399502-19193-1-git-send-email-athoik@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Athanasios Oikonomou <athoik@gmail.com>
Subject: [meta-oe][PATCH] nis, opencv: Update getVar/setVar syntax
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
X-List-Received-Date: Fri, 19 Jan 2018 22:05:24 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The deprecated APIs are removed from bitbake, update two old style references
in meta-oe/meta-networking.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
---
 meta-networking/recipes-support/nis/nis.inc  | 2 +-
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/nis/nis.inc b/meta-networking/recipes-support/nis/nis.inc
index c4aa10e..e027a1c 100644
--- a/meta-networking/recipes-support/nis/nis.inc
+++ b/meta-networking/recipes-support/nis/nis.inc
@@ -25,7 +25,7 @@ do_install() {
 # so force the package to be skipped here (this will cause a
 # 'nothing provides' error)
 python () {
-    os = bb.data.getVar("TARGET_OS", d, 1)
+    os = d.getVar("TARGET_OS", True)
     if os == "linux-uclibc":
         raise bb.parse.SkipPackage("NIS functionality requires rpcsvc/yp.h, uClibC does not provide this")
 }
diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 1bbb965..cf7fd62 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -108,7 +108,7 @@ python populate_packages_prepend () {
     for pkg in packages[1:]:
         if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') and not pkg.endswith('-locale'):
             metapkg_rdepends.append(pkg)
-    bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
+    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
 
 }
 
-- 
2.1.4


