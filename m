Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 55FCD719B5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Feb 2017 01:11:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1J1BPgR029206
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 17:11:25 -0800
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Sat, 18 Feb 2017 17:11:24 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 18 Feb 2017 20:11:24 -0500
Message-ID: <1487466684-16593-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] netcat-openbsd: fix implicit dependency on pkg-config
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
X-List-Received-Date: Sun, 19 Feb 2017 01:11:33 -0000
Content-Type: text/plain

In the report at http://errors.yoctoproject.org/Errors/Details/130673/
we see the following:

i586-oe-linux-gcc  -m32 -march=i586 <snip> netcat.o atomicio.o socks.o `pkg-config --libs libbsd` -lresolv -o nc
/bin/sh: 1: pkg-config: not found

What follows is a bunch of link errors for BSD library functions, as
the backtick didn't return anything but an empty string and hence no
BSD library was involved in the link.

I was able to reproduce this by temporarily removing my host version
of pkg-config, and then validated that this fix solves it while still
having the host binary removed.  So it should fix the reported issue.
I also confirmed pkg-config was in the sysroot after the change.

Cc: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
index bb21e0cfeede..06206a5a59d1 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://ftp.debian.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=ee6bbaacb5db5f2973818f0902c3ae6f"
 
-DEPENDS += "glib-2.0 libbsd"
+DEPENDS += "glib-2.0 libbsd pkgconfig-native"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}.orig.tar.gz;name=netcat \
            ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}-7.debian.tar.gz;name=netcat-patch"
@@ -42,5 +42,3 @@ do_install() {
     install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
 }
 ALTERNATIVE_PRIORITY = "60"
-
-PNBLACKLIST[netcat-openbsd] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130673/"
-- 
2.7.4


