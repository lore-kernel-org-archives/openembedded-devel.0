Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PAHMs-0006rP-Qx
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 09:21:21 +0200
Received: by fxm3 with SMTP id 3so2708822fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 00:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=bhapVfjmZoM7VlADkoT/8BOm1fU52EXeYcZInh9DM28=;
	b=GFsx+ZO1C/hRDjUXgCREFE70zULhS3m5UBIQTovt5jRGEMhab+lGV35HKLMFNpK1SL
	zxaNleDkI1G0bIQ0jLYAmADbvba+znc8CuGZDUBErgCnndIeRqv25DEzg4sL+bQKAhfF
	k5jaGghqLfQxjxG8VMXYGdGKeRwKxFDfELS9Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=UjIILWDToL2QkxBtcOYiyX41G+eFDIofQFXsRoZCz8dm2qjxbQUSwjmf3Ut+ezUryn
	rjdCmg256lcP9jOGRZS9RXScyBJDVpXbLXNbm1zcl9l+qwM9ByEjUA1fz0ffSKp5nYP3
	0sX0G8/83PE5Ijl3KEjEpIixamdrXCDNWyLms=
Received: by 10.103.108.9 with SMTP id k9mr7666631mum.121.1287991237750;
	Mon, 25 Oct 2010 00:20:37 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id a16sm2693449fak.19.2010.10.25.00.20.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 25 Oct 2010 00:20:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Oct 2010 09:20:36 +0200
Message-Id: <1287991236-22304-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.1
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] udev_15*: fix FILES_libudev
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
X-List-Received-Date: Mon, 25 Oct 2010 07:21:22 -0000

* udev is built with --with-libdir-name= and there is /lib/libudev.*, but
  FILES point aonly to {libdir} add
* all recipes which now RDEPENDS on whole udev package should be PR bumped to pick libudev only

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/udev/udev_151.bb |    4 ++--
 recipes/udev/udev_154.bb |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/udev/udev_151.bb b/recipes/udev/udev_151.bb
index fc33592..554f86b 100644
--- a/recipes/udev/udev_151.bb
+++ b/recipes/udev/udev_151.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
 the hotplug package and requires a kernel not older than 2.6.12."
 LICENSE = "GPLv2+"
 
-PR = "r18"
+PR = "r19"
 
 # Untested
 DEFAULT_PREFERENCE = "-1"
@@ -61,7 +61,7 @@ INITSCRIPT_PARAMS = "start 03 S ."
 
 PACKAGES =+ "libudev libgudev udev-utils"
 
-FILES_libudev = "${libdir}/libudev.so.*"
+FILES_libudev = "${libdir}/libudev.so.* ${base_libdir}/libudev.so.*"
 FILES_libgudev = "${libdir}/libgudev*.so.*"
 
 FILES_udev-utils = "${bindir}/udevinfo ${bindir}/udevtest ${base_sbindir}/udevadm"
diff --git a/recipes/udev/udev_154.bb b/recipes/udev/udev_154.bb
index 9c76184..d7740a6 100644
--- a/recipes/udev/udev_154.bb
+++ b/recipes/udev/udev_154.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
 the hotplug package and requires a kernel not older than 2.6.12."
 LICENSE = "GPLv2+"
 
-PR = "r5"
+PR = "r6"
 
 # Untested
 DEFAULT_PREFERENCE = "-1"
@@ -62,7 +62,7 @@ INITSCRIPT_PARAMS = "start 03 S ."
 
 PACKAGES =+ "libudev libgudev udev-utils"
 
-FILES_libudev = "${libdir}/libudev.so.*"
+FILES_libudev = "${libdir}/libudev.so.* ${base_libdir}/libudev.so.*"
 FILES_libgudev = "${libdir}/libgudev*.so.*"
 
 FILES_udev-utils = "${bindir}/udevinfo ${bindir}/udevtest ${base_sbindir}/udevadm"
-- 
1.7.3.1



