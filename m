Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id E8FB760FF0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2013 23:18:13 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so1681324eae.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2013 16:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vJJv3i4oU9pJRBLNqko8ggi7t+mqMt6YyhVhIQeySYY=;
	b=l2Ly64qPGIXX1KfrDwJkhcSS8ZGL5dFZo2nVzGDyKFOvKZyi1cMF9jCtKOXsecV5XB
	sxQt6V2ihdkqG8ryQ1tE4fvLkH4zCACWNn0PFcRvCopK6S1DsJjrrmiwoEssaTFoArR1
	a6lrgxhpMhZ85BXEnwWQr+a++dY+d1jl0uCjvFvx3a9Q4psKsLomPGmgxV3sgDNURYdu
	gYXf1Ql+9wKCNjGUNkiO7Ky5kjLQqZWSzbk8c45brRpn7PHrloTbF6jBf6jz2ub69qk0
	ydMVBb8fyNdnhRh/a4gIOHpAoQX9johW+ahQ6frGJI2cnhnrXQVrUBUIi2swm4Zoj6by
	+AfA==
X-Received: by 10.14.210.8 with SMTP id t8mr7184106eeo.39.1379287095024;
	Sun, 15 Sep 2013 16:18:15 -0700 (PDT)
Received: from mizar.localdomain
	(host50-7-dynamic.20-79-r.retail.telecomitalia.it. [79.20.7.50])
	by mx.google.com with ESMTPSA id a43sm36942843eep.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 15 Sep 2013 16:18:14 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2013 01:17:56 +0200
Message-Id: <1379287076-2610-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs][PATCH] linux-yocto-tiny-kexecboot: exclude all packaging tasks
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
X-List-Received-Date: Sun, 15 Sep 2013 23:18:14 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-tiny-kexecboot_3.10.bb       | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb
index 9f9808e..887921e 100644
--- a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb
+++ b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb
@@ -22,5 +22,38 @@ do_install() {
 do_package() {
 }
 
+do_package_deb() {
+    :
+}
+
 do_package_ipk() {
+    :
+}
+
+do_package_rpm() {
+    :
+}
+
+do_package_tar() {
+    :
+}
+
+do_package_write_deb() {
+    :
+}
+
+do_package_write_ipk() {
+    :
+}
+
+do_package_write_rpm() {
+    :
+}
+
+do_package_write_tar() {
+    :
+}
+
+do_packagedata() {
+    :
 }
-- 
1.8.1.5


