Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gizero@gmail.com>) id 1SQhRV-0002mG-Do
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 May 2012 18:02:45 +0200
Received: by wibhj13 with SMTP id hj13so1986662wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 May 2012 08:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=r2fVpZ+U9XaFxeXmpZS3usZZ+dF5w0jyHJZnggbLRdM=;
	b=nPqwXN/wVWw52IOPhGGA9TuZ5yQ1CZy5DdMAuc+FmGo3HZ0tiLzQIgbzi/JPTdrhvu
	GTqmjJBDftx1kAIprdD0sovu5Yjly0cBwJ2KYvyTcPaXj1yIYkTjUtaEJMobiuY8WZS5
	CZ02OR+S3ATJrv+1SIk2LCxyRDZTST/CBFSlPFimG+m1CXVvH4Z69g+YS4PlHm2ho6U7
	CYfqp0+wDiH4TUPLIA9EFo1+zGC81HIgjg3f5U9L68J/FcsUzwOiRVBjFAe95g69dldX
	T9yN6aQlr0tiO8q03fZUWvq/rx2s5Ec6T6Cq4Gm6fT3DSl21HeVENsN1dRVqrgAKin58
	VWyw==
Received: by 10.180.95.34 with SMTP id dh2mr21880517wib.15.1336233177340;
	Sat, 05 May 2012 08:52:57 -0700 (PDT)
Received: from localhost.localdomain
	(host168-65-static.12-87-b.business.telecomitalia.it. [87.12.65.168])
	by mx.google.com with ESMTPS id ff2sm10376020wib.9.2012.05.05.08.52.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 05 May 2012 08:52:56 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 May 2012 17:51:49 +0200
Message-Id: <1336233109-26164-1-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1336166708-14019-1-git-send-email-gizero@gmail.com>
References: <1336166708-14019-1-git-send-email-gizero@gmail.com>
Subject: [meta-oe][PATCH v2] libmodbus: ported recipe from classic and updated
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
X-List-Received-Date: Sat, 05 May 2012 16:02:45 -0000

* based on recipe by Radoslav Kolev which was in classic
* updated to latest released version 3.0.2
* v2 drops git version of recipe
* v2 drops no longer used PRIORITY

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 .../recipes-extended/libmodbus/libmodbus_3.0.2.bb  |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb

diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
new file mode 100644
index 0000000..5926bc4
--- /dev/null
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
@@ -0,0 +1,18 @@
+SUMMARY = "A Modbus library"
+DESCRIPTION = "libmodbus is a C library designed to provide a fast and robust \
+implementation of the Modbus protocol. It runs on Linux, Mac OS X, FreeBSD, \
+QNX and Windows."
+HOMEPAGE = "http://www.libmodbus.org/"
+SECTION = "libs"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
+
+PR = "r0"
+
+SRC_URI = "http://github.com/downloads/stephane/libmodbus/libmodbus-${PV}.tar.gz"
+
+inherit autotools pkgconfig
+
+SRC_URI[md5sum] = "1aaacce9d9779d3a84f7d1a75774c943"
+SRC_URI[sha256sum] = "927ec90e0e299a7d4ec7086b1e2590566bdfc3bbc22e12204229361c029f2615"
-- 
1.7.5.4



