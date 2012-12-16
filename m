Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkIpR-0007xj-86
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 19:20:47 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1966657eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 10:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=o9o/UGbVK0kaP87kW9zlaqVdtvOaSbheB9FOwXwg+xE=;
	b=HXTGJL7Rgvm2ZGYcHf1znixTsV+6//ZrmRXZEl8ww6+TB6uCoxvQBgR04syILRnBxs
	yo9PKUgxlftNDJoQvrY8Vt4XVTtD7BmoUuyQYLNxQkJhlyGq5sl+6avZzsCXoz6SsTRG
	EDVfujvmRjzYaxjJX553Jpdv/SHaXNxyccMKMGg2IJsx5UwXqozVB6QlPETgJD509oeR
	eYsJPUfShb1WI8lynJqbKNuOrVRnb0WBx4Q9zgCN8gEOsfbvzn+lLpHSpjDwGon43ACp
	WCkoDSCPZ4gWC52WNS94hXjFOSeOZHxZNhKd7c6WiGosQMFomge7IPGWgpl8MfYw+x+D
	8Evw==
Received: by 10.14.213.134 with SMTP id a6mr33845152eep.45.1355680721727;
	Sun, 16 Dec 2012 09:58:41 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id e2sm23869638eeo.8.2012.12.16.09.58.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:58:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2012 18:58:06 +0100
Message-Id: <401c272be0d6ac2bcced9dedb9e7f9b053ea300f.1355680285.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 23/26] lvm2: upgrade to 2.02.97 which is compatible with newer udev
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
X-List-Received-Date: Sun, 16 Dec 2012 18:20:47 -0000

* older versions are using symbols removed in newer udev
  | dmsetup.c:985: error: undefined reference to 'udev_get_dev_path'
  | collect2: error: ld returned 1 exit status
  | make[1]: *** [dmsetup] Error 1
  | make[1]: Leaving directory
  `/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/lvm2/2.02.85-r2.0/LVM2.2.02.85/tools'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/lvm2/lvm2_2.02.85.bb | 7 -------
 meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb | 6 ++++++
 2 files changed, 6 insertions(+), 7 deletions(-)
 delete mode 100644 meta-oe/recipes-support/lvm2/lvm2_2.02.85.bb
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb

diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.85.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.85.bb
deleted file mode 100644
index b2a4ff3..0000000
--- a/meta-oe/recipes-support/lvm2/lvm2_2.02.85.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require lvm2.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "91785ca438e5ce679dd3a386b183d552"
-SRC_URI[sha256sum] = "e5c2b0d76e7b1df7630e211734eb09697d66ab879b17eb19545cb77272813eb7"
-
diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb
new file mode 100644
index 0000000..2de17cf
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb
@@ -0,0 +1,6 @@
+require lvm2.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "d18bd01334309db1c422b9bf6b181057"
+SRC_URI[sha256sum] = "edda82012e8a9e1f0b00ba5a331468d3e0201992be14c0dbea71bf564a51fc2b"
-- 
1.8.0.2



