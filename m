Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q0aGw-0005Tz-Ro
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 15:03:22 +0100
Received: by bwz10 with SMTP id 10so3155541bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 07:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=28b1YxF3Qzm6upA1Xfpgf5EzOEPAApY2xZh2TL4Rwfg=;
	b=dWXJlj7h7mKRR5XkWd0zIpLcxGg4vZr/x2ROHdn7rYp22kQXsAwjGoJEkjX1NiHWEr
	epiPKEqx8eQc0VMEos2RsQG8KZBf+TAmKmuk0KkusXxg6DJ3XN6dXhFGnbVY/kdJGq1M
	tSvIphANsXYB8+l8f34qFFiJ+9w3DcmBeWCyc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=FAl0BGeDCtWtshi6IhDghZSc9aDGGqsz2r9Rnuo4sxVH+SWjm5dEvRfnW7mbJvWJaG
	29cKR/qalGQ1fT23mTcMjAUvSYJN5dv0z/oml1zgKg+ddFcI3XSloMYxACU2Em0MdpKz
	2lvas7if7Smbwiw/tGuH71kkUue8j1jWvct0c=
Received: by 10.204.26.215 with SMTP id f23mr994784bkc.140.1300456897362;
	Fri, 18 Mar 2011 07:01:37 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id t1sm2165620bkx.19.2011.03.18.07.01.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Mar 2011 07:01:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2011 15:00:22 +0100
Message-Id: <1300456829-25755-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
References: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 05/12] libnl: add libnl.inc and use INC_PR
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
X-List-Received-Date: Fri, 18 Mar 2011 14:03:23 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/libnl/libnl.inc    |    9 +++++++++
 recipes/libnl/libnl_1.1.bb |   10 ++--------
 recipes/libnl/libnl_2.0.bb |    9 ++-------
 recipes/libnl/libnl_git.bb |   16 ++++++----------
 4 files changed, 19 insertions(+), 25 deletions(-)
 create mode 100644 recipes/libnl/libnl.inc

diff --git a/recipes/libnl/libnl.inc b/recipes/libnl/libnl.inc
new file mode 100644
index 0000000..6f502b1
--- /dev/null
+++ b/recipes/libnl/libnl.inc
@@ -0,0 +1,9 @@
+DESCRIPTION = "libnl is a library for applications dealing with netlink sockets"
+SECTION = "libs/network"
+LICENSE = "LGPL"
+HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
+
+INC_PR = "r5"
+
+inherit autotools pkgconfig
+
diff --git a/recipes/libnl/libnl_1.1.bb b/recipes/libnl/libnl_1.1.bb
index f1b2a9d..d9f250e 100644
--- a/recipes/libnl/libnl_1.1.bb
+++ b/recipes/libnl/libnl_1.1.bb
@@ -1,11 +1,6 @@
-DESCRIPTION = "libnl is a library for applications dealing with netlink sockets"
-SECTION = "libs/network"
-LICENSE = "LGPL"
-HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
+require libnl.inc
 
-PR = "r4"
-
-inherit autotools pkgconfig
+PR = "${INC_PR}.0"
 
 CFLAGS += '-DVLAN_FLAG_REORDER_HDR=1'
 
@@ -18,6 +13,5 @@ SRC_URI = "\
   file://dont-link-libnl-from-sysroot.patch \
 "
 
-
 SRC_URI[md5sum] = "ae970ccd9144e132b68664f98e7ceeb1"
 SRC_URI[sha256sum] = "35cea4cfb6cd8af0cafa0f34fff81def5a1f193b8b8384299b4b21883e22edc3"
diff --git a/recipes/libnl/libnl_2.0.bb b/recipes/libnl/libnl_2.0.bb
index 6614478..3038487 100644
--- a/recipes/libnl/libnl_2.0.bb
+++ b/recipes/libnl/libnl_2.0.bb
@@ -1,14 +1,9 @@
-DESCRIPTION = "libnl2 is a library for applications dealing with netlink sockets"
-SECTION = "libs/network"
-LICENSE = "LGPL"
-HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
+require libnl.inc
 PE = "1"
-PR = "r2"
+PR = "${INC_PR}.0"
 
 DEPENDS = "flex-native bison-native"
 
-inherit autotools pkgconfig
-
 SRC_URI = "\
   http://www.infradead.org/~tgr/libnl/files/libnl-${PV}.tar.gz \
   file://fix-pc-file.patch \
diff --git a/recipes/libnl/libnl_git.bb b/recipes/libnl/libnl_git.bb
index e645892..8ce4a6e 100644
--- a/recipes/libnl/libnl_git.bb
+++ b/recipes/libnl/libnl_git.bb
@@ -1,21 +1,17 @@
-DESCRIPTION = "libnl2 is a library for applications dealing with netlink sockets"
-SECTION = "libs/network"
-LICENSE = "LGPL"
-HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
-SRCREV = "d378220c96c3c8b6f27dca33e7d8ba03318f9c2d"
-PV = "1.9+gitr${SRCPV}"
+require libnl.inc
+
 PE = "1"
-PR = "r3"
+PV = "1.9+gitr${SRCPV}"
+PR = "${INC_PR}.0"
 
 DEPENDS = "flex-native bison-native"
 
-inherit autotools
-
+S = "${WORKDIR}/git"
+SRCREV = "d378220c96c3c8b6f27dca33e7d8ba03318f9c2d"
 SRC_URI = "\
   git://git.kernel.org/pub/scm/libs/netlink/libnl.git;protocol=git \
   file://fix-pc-file.patch \
 "
-S = "${WORKDIR}/git"
 
 PACKAGES =+ "${PN}-route ${PN}-nf ${PN}-genl ${PN}-cli"
 FILES_${PN}-route = "${libdir}/libnl-route.so.*"
-- 
1.7.4.1



