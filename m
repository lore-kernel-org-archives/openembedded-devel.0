Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6F40E7D53B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Apr 2019 19:05:12 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id l7so12272449ljg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2019 12:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=TXBUZ2JC8HuKwXgFWwZokJej0TIcilnf9uxNBtJDGDw=;
	b=mySE8qHQv/rAr+5qFFPhzRgR6NQjEohM9DFlySZfj+gVrkE/zCGT7BqyVegAEGJlp+
	4piFBvNFFzxpSF0sNEGeSEnQKP/09k9cQXYOmQczaKm7MJ9NsuViLufhzazJ0bKrNwZB
	oDpl6XDA6JNCHzO7KA8B4GWHcwTJTpH7ZzM9i6bdDoKKYtgd2LoxZc0s1OyTbAxAGqKx
	+ZAMa+MzbNGA450PkCfJ0r+4Y6JDrDb1a+oHETspSbufg9TVOdaWMuv7Xut5UocUb76N
	iyCy0b8O12IfOj5OML6mZGOrr6fipUOOnJALtOtjRQ2jPy5NWTsCLdOVN3eYuZXmeElf
	JU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TXBUZ2JC8HuKwXgFWwZokJej0TIcilnf9uxNBtJDGDw=;
	b=qm3bQnyiH5kqWlBpK8ADtJCgvy37M3UZuEbf5Igbnh603tn1iQeSOdVeH2SZq48p8O
	P7ddeCmvoWhT7zY1G78Ziei85boONzn9oq93yfDws8SpbrmsqVKf7ycDDOmJhpKLHTLO
	NiehG2hfXxNUTDszyEPRBxoBchUCQ4oMEcWu+Y1ZCseIvHlEiu9qmy9PMqoBMj6k5EmZ
	5OGv0noGqkW+k2lInb2o0GNofNest9nqMA3GdDc8EOH+9xPQQ1i6fnj0/BkD2QYmMgHL
	aE+11psU4HDkVrVkB5Wkv4TOZel2QoBHf5Rdas9kSJEL4F8TsdG0T2VguNX+RJraUiL8
	lKkw==
X-Gm-Message-State: APjAAAWC1U2rf5DYz10ksV9c21IhtybOaqshsc1LWOFdOZF5eVk+6Usc
	pTZduwYciQndauBf1iYdGLeW48ewBWE=
X-Google-Smtp-Source: APXvYqzW0KzMJN/loXZOP3oFZGxlYh8eBHAupNRrQPPYIoJB+OE5/BS6r8z1Qq8+WtLcrE8NCV4mpg==
X-Received: by 2002:a2e:9d12:: with SMTP id t18mr16767414lji.163.1554750312433;
	Mon, 08 Apr 2019 12:05:12 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	v19sm2199963lfd.41.2019.04.08.12.05.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Apr 2019 12:05:11 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Apr 2019 21:05:09 +0200
Message-Id: <20190408190509.29416-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v3][meta-networking] macchanger: update to 1.7.0
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
X-List-Received-Date: Mon, 08 Apr 2019 19:05:12 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../macchanger/0001-Fix-musl-build.patch      | 31 +++++++++++++++++++
 .../macchanger/macchanger_1.5.0.bb            | 24 --------------
 .../macchanger/macchanger_1.7.0.bb            | 25 +++++++++++++++
 3 files changed, 56 insertions(+), 24 deletions(-)
 create mode 100644 meta-networking/recipes-support/macchanger/macchanger/0001-Fix-musl-build.patch
 delete mode 100644 meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
 create mode 100644 meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb

diff --git a/meta-networking/recipes-support/macchanger/macchanger/0001-Fix-musl-build.patch b/meta-networking/recipes-support/macchanger/macchanger/0001-Fix-musl-build.patch
new file mode 100644
index 000000000..d36087d55
--- /dev/null
+++ b/meta-networking/recipes-support/macchanger/macchanger/0001-Fix-musl-build.patch
@@ -0,0 +1,31 @@
+From 12d1cc9da14b0cd0265bca3c4289a335ddf2e357 Mon Sep 17 00:00:00 2001
+From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
+Date: Mon, 8 Apr 2019 21:00:20 +0200
+Subject: [PATCH] Fix musl build
+
+Fixes compilation error on musl:
+| ../macchanger-1.7.0/src/netinfo.c:116:26: error: expected ';' before 'epa'
+|   req.ifr_data = (caddr_t)epa;
+
+Missing data type is defined in <sys/types.h>.
+
+Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
+---
+ src/netinfo.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/netinfo.c b/src/netinfo.c
+index 3525123..1aa3293 100644
+--- a/src/netinfo.c
++++ b/src/netinfo.c
+@@ -28,6 +28,7 @@
+ #include <string.h>
+ #include <unistd.h>
+ #include <sys/ioctl.h>
++#include <sys/types.h>
+ 
+ #include <linux/ethtool.h>
+ #include <linux/sockios.h>
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb b/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
deleted file mode 100644
index a90177f19..000000000
--- a/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Tool to view/change network interface MAC addresses"
-DESCRIPTION = "A GNU/Linux utility for viewing/manipulating the MAC address of network interfaces."
-HOMEPAGE = "http://www.alobbs.com/macchanger"
-LICENSE  = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-SECTION = "net"
-
-SRC_URI  = "${GNU_MIRROR}/macchanger/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "79b7cdaeca3d8ebafa764c4b0dd03ab7"
-SRC_URI[sha256sum] = "d44bfa27cb29c5a718627cb3ef3aa42eb5130426545eb2031120826cd73fa8fe"
-
-FILES_${PN} = " \
-    ${bindir}/${BPN} \
-    ${datadir}/${BPN}/wireless.list \
-    ${datadir}/${BPN}/OUI.list \
-"
-
-FILES_${PN}-doc = " \
-    ${datadir}/info \
-    ${datadir}/man \
-"
-
-inherit autotools
diff --git a/meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb b/meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb
new file mode 100644
index 000000000..6506fd8ef
--- /dev/null
+++ b/meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Tool to view/change network interface MAC addresses"
+DESCRIPTION = "A GNU/Linux utility for viewing/manipulating the MAC address of network interfaces."
+HOMEPAGE = "https://github.com/alobbs/macchanger"
+LICENSE  = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+SECTION = "net"
+
+SRC_URI = "https://github.com/alobbs/macchanger/releases/download/${PV}/${BPN}-${PV}.tar.gz \
+           file://0001-Fix-musl-build.patch \
+"
+SRC_URI[md5sum] = "ca56f16142914337391dac91603eb332"
+SRC_URI[sha256sum] = "dae2717c270fd5f62d790dbf80c19793c651b1b26b62c101b82d5fdf25a845bf"
+
+FILES_${PN} = " \
+    ${bindir}/${BPN} \
+    ${datadir}/${BPN}/wireless.list \
+    ${datadir}/${BPN}/OUI.list \
+"
+
+FILES_${PN}-doc = " \
+    ${datadir}/info \
+    ${datadir}/man \
+"
+
+inherit autotools
-- 
2.17.1


