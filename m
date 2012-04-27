Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1SNmH4-0000P8-U5
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Apr 2012 16:35:54 +0200
Received: by wibhm17 with SMTP id hm17so544590wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2012 07:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=5AGVIlp9NZIs6zC5cPOhZZ8r+hh7MuKF5oddOs00FTY=;
	b=AB6FqV5BWUKszzuhN4lTCLjomRnhqHSPBQMFbzQzH3WZabVD4NvmBNo9osw/FCMoOl
	sYp73sFmpllmiUqmKTLK+lL4cA7OCzVuBegzTupE7Lr7s/VoYSqgAC2UXWxTizuwJNNl
	UY2EM7CYeIaNkYrl1R3vXvxZwRzPkthSamucEuGiK3C9oftpwKqk34sqX0ti6aS2Fj+O
	4wLQtgQFiOK+MdMOugIacYB5FLyhvt2zRbtfMiEwneaI5WXXcz9wVQtT595Cp/nCialb
	ksRogqSrAHKXzqivT4ild45n3qFrfNYxtdpy6ISzvl8I04W+WS+fCDoc8yZ63LVEGwt6
	MhnA==
Received: by 10.180.81.37 with SMTP id w5mr6479403wix.16.1335536776637;
	Fri, 27 Apr 2012 07:26:16 -0700 (PDT)
Received: from s42.loc (85-127-86-115.dynamic.xdsl-line.inode.at.
	[85.127.86.115])
	by mx.google.com with ESMTPS id fl2sm8005479wib.2.2012.04.27.07.26.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Apr 2012 07:26:16 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.77)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1SNm7i-0000PR-VL; Fri, 27 Apr 2012 16:26:15 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Apr 2012 16:26:12 +0200
Message-Id: <1335536773-1543-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.9.1
Subject: [PATCH 1/2] busybox: mdev was removed
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
X-List-Received-Date: Fri, 27 Apr 2012 14:35:55 -0000

bea936913fcf684c23d36f740050dea118d5caad removed mdev, so rm now unused
file, too.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/busybox/files/mdev |    9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 recipes/busybox/files/mdev

diff --git a/recipes/busybox/files/mdev b/recipes/busybox/files/mdev
deleted file mode 100644
index 14ba837..0000000
--- a/recipes/busybox/files/mdev
+++ /dev/null
@@ -1,9 +0,0 @@
-#!/bin/sh
-
-mount proc /proc -t proc
-mount sys /sys -t sysfs
-mount -t tmpfs tmpfs /dev  -o size=64k,mode=0755
-mkdir /dev/pts /dev/shm
-mount -t devpts devpts /dev/pts
-echo "/sbin/mdev" > /proc/sys/kernel/hotplug
-mdev -s
-- 
1.7.10



