Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gizero@gmail.com>) id 1SUN9j-0003h0-5e
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 21:11:35 +0200
Received: by werg55 with SMTP id g55so3167687wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 12:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8xaOf9x4lAU05RkDXJUAkY+58VQWUSKoS4KR7nMyf2w=;
	b=Xo+s53i2940jjRTapwF3CgWZJ+XH5SpCsp98gwcLSROG3fVuxqNox2t5WMj68v/pNY
	OVkxb9Nu4484av7ZwoOVUQarc71zrfjMNqEzeeAVM43+rvMaOHozqNeicOFFdzRe4h4r
	owCIUoAfGa2ftS2qhzAa0Q3Dr3OKVBAtyEvVgb7Y2gXxPMOTXWsIFhot1cn15rr4wJIt
	kY+r6Nr2kDYH731D4aVvjEEeQ8krw8c8QsHWgDcndwAc1eSCo4QI9mgst9ykD2kp1AtS
	NgySeY5eigkUVmDPOFfBA6IvfN3mkLOzFJy/LPHFUrG//7UdtwxFUQ5uoSO3+gIIpL+O
	yCIQ==
Received: by 10.180.80.35 with SMTP id o3mr365032wix.7.1337108494446;
	Tue, 15 May 2012 12:01:34 -0700 (PDT)
Received: from localhost.localdomain
	(host168-65-static.12-87-b.business.telecomitalia.it. [87.12.65.168])
	by mx.google.com with ESMTPS id z3sm44908250wix.0.2012.05.15.12.01.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 May 2012 12:01:33 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 May 2012 21:01:02 +0200
Message-Id: <1337108462-14996-1-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH v3] libmodbus: ported recipe from classic and updated
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
X-List-Received-Date: Tue, 15 May 2012 19:11:35 -0000

 * based on recipe by Radoslav Kolev which was in classic
 * updated to latest released version 3.0.2

 v2:
 * drop git version of recipe
 * drop no longer used PRIORITY

 v3:
 * drop PR = "r0"

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 .../recipes-extended/libmodbus/libmodbus_3.0.2.bb  |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb

diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
new file mode 100644
index 0000000..03b7fcc
--- /dev/null
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
@@ -0,0 +1,16 @@
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
+SRC_URI = "http://github.com/downloads/stephane/libmodbus/libmodbus-${PV}.tar.gz"
+
+inherit autotools pkgconfig
+
+SRC_URI[md5sum] = "1aaacce9d9779d3a84f7d1a75774c943"
+SRC_URI[sha256sum] = "927ec90e0e299a7d4ec7086b1e2590566bdfc3bbc22e12204229361c029f2615"
-- 
1.7.5.4



