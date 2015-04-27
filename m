Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8925073D37
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 20:13:22 +0000 (UTC)
Received: by wgen6 with SMTP id n6so128252550wge.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 13:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qV6ouSLXew6hB43aQCMa+rSu98kDo8LFlh3TK+irHaQ=;
	b=IYEdYVh0AG5bVo+2NRIgs8vhr4it6fBUIZSrWJlqYU8Vnxf/ysvyrSRkXOcdr4p2Uv
	YUDYDjFzPI19pjb1eozrekC8EDCjYYxWygyfwPGfS+T+IEX+5USTBDHkXz2SI7BpDYQR
	tGGJ52jlMgx3NhY8zWlA/d+Slq+SavBEr+kvGmJAmMLhHyiOrHcHjbE4i8W/nEf7NGIo
	ETfKmB9WmIrIsXoGvDAxtK6QKymLNtVwsg9daceGqcjgIn1487SjbtbY9b/nBsXNhctu
	4g6H0ntn+1WbqXvNdv0K/2czrvzak6nQdZl+AfHcfad7JLKOD85QQwCn5pioO3G+QELH
	obDA==
X-Received: by 10.180.19.166 with SMTP id g6mr23696976wie.56.1430165603454;
	Mon, 27 Apr 2015 13:13:23 -0700 (PDT)
Received: from ubuntu.ebenfeld.local (ip-84-119-99-153.unity-media.net.
	[84.119.99.153]) by mx.google.com with ESMTPSA id
	cf12sm30848805wjb.10.2015.04.27.13.13.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Apr 2015 13:13:22 -0700 (PDT)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Apr 2015 22:13:03 +0200
Message-Id: <1430165584-5634-9-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430165584-5634-1-git-send-email-sven.ebenfeld@gmail.com>
References: <1430165584-5634-1-git-send-email-sven.ebenfeld@gmail.com>
Subject: [meta-java][PATCH v3 08/10] java-test-image: Add openjdk-7-vm-zero package
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
X-List-Received-Date: Mon, 27 Apr 2015 20:13:22 -0000

There is no point in not installing the ZeroVM of
OpenJDK-7 in a java-test-image.

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 recipes-images/images/java-test-image.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-images/images/java-test-image.bb b/recipes-images/images/java-test-image.bb
index 4807858..eb9f253 100644
--- a/recipes-images/images/java-test-image.bb
+++ b/recipes-images/images/java-test-image.bb
@@ -7,7 +7,7 @@ IMAGE_LINGUAS = " "
 
 IMAGE_INSTALL = "busybox modutils-initscripts initscripts opkg udev sysvinit netbase base-files base-passwd busybox-hwclock \
                  ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${CORE_IMAGE_EXTRA_INSTALL} \
-                 openjdk-7-jre openjdk-7-vm-jamvm openjdk-7-vm-cacao \
+                 openjdk-7-jre openjdk-7-vm-zero openjdk-7-vm-jamvm openjdk-7-vm-cacao \
                  openjdk-6-jre openjdk-6-vm-zero openjdk-6-vm-jamvm openjdk-6-vm-cacao \
                  strace dropbear binutils \
                  classpath \
-- 
1.9.1


