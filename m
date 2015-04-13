Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id DFC046AC24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 07:27:56 +0000 (UTC)
Received: by widjs5 with SMTP id js5so57623448wid.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 00:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qCmu6DW14RsenL5yIhclRpWxTQEqMKsXhJ1DkYdy6bw=;
	b=PRDeOZVN0e08VZ3ADwV5ShTP0C3xeWyXtmRcjV3yCXsv3vEqGCm1lX0BEUS9ObClCX
	gbuNOHVVqWWaLgc5TTKqi4SYJ4rNPotoKFdoGYS0vqS/zQQG9UmFoCACfUlnlZnJul/2
	3Cdf4Arx9UXjgOUPKzCINnAEiYiDtrwi5Dekf/n5lxkNkZsAnBvvGWvDmrvkKibNUw6p
	hPW46ciaucPGlnf4R47qGkaVZGz5yK2Q10SMrWlhuTGKQdK0VNX7FZwqUCBKUIH04jGk
	43VlJzxQdArL5fB/+NQVI1wr0CwF67WmunlvtmkFt2x3L2ivZ8e8RPVzPeY585h8/9w2
	fhkQ==
X-Received: by 10.194.21.193 with SMTP id x1mr24829903wje.144.1428910078042;
	Mon, 13 Apr 2015 00:27:58 -0700 (PDT)
Received: from localhost.localdomain (pD9F9B569.dip0.t-ipconnect.de.
	[217.249.181.105]) by mx.google.com with ESMTPSA id
	i10sm10139643wja.40.2015.04.13.00.27.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Apr 2015 00:27:57 -0700 (PDT)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Apr 2015 09:27:36 +0200
Message-Id: <1428910057-23647-7-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.8.1.rc3
In-Reply-To: <1428910057-23647-6-git-send-email-sven.ebenfeld@gmail.com>
References: <1428910057-23647-1-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-2-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-3-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-4-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-5-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-6-git-send-email-sven.ebenfeld@gmail.com>
Subject: [meta-java][PATCH v2 6/7] java-test-image: Add openjdk-7 ZeroVM and remove busybox-hwclock
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
X-List-Received-Date: Mon, 13 Apr 2015 07:27:57 -0000

busybox-hwclock could not be installed for me and I guess we don't really need it.
I wanted to test OpenJDK 7 ZeroVM so we need to install it.

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 recipes-images/images/java-test-image.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-images/images/java-test-image.bb b/recipes-images/images/java-test-image.bb
index 4807858..22c7bdf 100644
--- a/recipes-images/images/java-test-image.bb
+++ b/recipes-images/images/java-test-image.bb
@@ -5,9 +5,9 @@ inherit core-image
 IMAGE_LINGUAS = " "
 
 
-IMAGE_INSTALL = "busybox modutils-initscripts initscripts opkg udev sysvinit netbase base-files base-passwd busybox-hwclock \
+IMAGE_INSTALL = "busybox modutils-initscripts initscripts opkg udev sysvinit netbase base-files base-passwd \
                  ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${CORE_IMAGE_EXTRA_INSTALL} \
-                 openjdk-7-jre openjdk-7-vm-jamvm openjdk-7-vm-cacao \
+                 openjdk-7-jre openjdk-7-vm-zero openjdk-7-vm-jamvm openjdk-7-vm-cacao \
                  openjdk-6-jre openjdk-6-vm-zero openjdk-6-vm-jamvm openjdk-6-vm-cacao \
                  strace dropbear binutils \
                  classpath \
-- 
1.8.1.rc3


