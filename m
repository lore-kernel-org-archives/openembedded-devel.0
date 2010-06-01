Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OJZNn-0006gb-IR
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 23:52:25 +0200
Received: by fxm9 with SMTP id 9so535372fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jun 2010 14:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=V3kr3x227q2ZLHnz8J9Yy3o98cBzTQkSPZn0rG1xrKc=;
	b=WOxsMScqRQDB7/2WbVr2Rez9PV2eOh96lJE4421KgJWtapFXArBkiPMYDAnUB532Ke
	RL0YeEIiRKKGy7iGzzN5CjVpaMmjsLc7kg2sstwwbMYJ7OGpoMGwbUyg3iYDZVj1nR+1
	rQd/eXmUNkTajD+HUVQX0Re9e43SGUFSr4UNs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=kKFv3ddbAt7w61x+XVD1da4Ab2pFw1g6wKCQAQW+qVzAF7Om5GIcmCeb4oY25Phz14
	Za19anr9u+kXsscp8m3cQzyPXYv7U3J621q4xP0p0I1aLdvnn157EJVRXj46s+X7Tq65
	e2VYfLXh3taOcpZwo3YnPE/3Iw0VEt/uKnXSE=
Received: by 10.223.98.83 with SMTP id p19mr7749144fan.27.1275428889558;
	Tue, 01 Jun 2010 14:48:09 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm48995103fad.10.2010.06.01.14.48.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 01 Jun 2010 14:48:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Jun 2010 23:47:56 +0200
Message-Id: <1275428876-1406-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <20100601195258.GF5446@jama>
References: <20100601195258.GF5446@jama>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] klibc: fix packaging without moving PACKAGES and FILES_ back to recipes
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
X-List-Received-Date: Tue, 01 Jun 2010 21:52:25 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/klibc/klibc-common.inc |    2 +-
 recipes/klibc/klibc-utils.inc  |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/klibc/klibc-common.inc b/recipes/klibc/klibc-common.inc
index 7b7a3cb..5aba9e5 100644
--- a/recipes/klibc/klibc-common.inc
+++ b/recipes/klibc/klibc-common.inc
@@ -9,7 +9,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/libs/klibc/${KLIBC_FETCHDIR}/klibc-${PV
 
 S = "${WORKDIR}/klibc-${PV}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-INC_PR = "r14"
+INC_PR = "r16"
 
 KLIBC_ARCH = '${TARGET_ARCH}'
 KLIBC_ARCH_armeb = 'arm'
diff --git a/recipes/klibc/klibc-utils.inc b/recipes/klibc/klibc-utils.inc
index 7bbcee3..912b774 100644
--- a/recipes/klibc/klibc-utils.inc
+++ b/recipes/klibc/klibc-utils.inc
@@ -43,11 +43,9 @@ do_install_append() {
 # only in 1.5
 # install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/insmod ${D}${base_bindir}
 
-# only in >= 1.5.15
+# only in >= 1.5.18 (can be moved to do_install_append above as soon as klibc_1.5 is dropped from tree)
 # install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/dmesg ${D}${base_bindir}
 # install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/sync ${D}${base_bindir}
-
-# only in >= 1.5.15+1.5.16
 # install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/ls ${D}${base_bindir}
 
 PACKAGES += "${KLIBC_UTILS_PKGNAME}-sh \
@@ -85,6 +83,7 @@ PACKAGES += "${KLIBC_UTILS_PKGNAME}-sh \
              ${KLIBC_UTILS_PKGNAME}-modprobe \
              ${KLIBC_UTILS_PKGNAME}-losetup \
              ${KLIBC_UTILS_PKGNAME}-wc \
+             ${KLIBC_UTILS_PKGNAME}-insmod \
              ${KLIBC_UTILS_PKGNAME}-ls"
 
 FILES_${KLIBC_UTILS_PKGNAME}-sh = "${base_bindir}/sh"
@@ -122,4 +121,5 @@ FILES_${KLIBC_UTILS_PKGNAME}-uname = "${base_bindir}/uname"
 FILES_${KLIBC_UTILS_PKGNAME}-modprobe = "${base_sbindir}/modprobe"
 FILES_${KLIBC_UTILS_PKGNAME}-losetup = "${base_bindir}/losetup"
 FILES_${KLIBC_UTILS_PKGNAME}-wc = "${base_bindir}/wc"
+FILES_${KLIBC_UTILS_PKGNAME}-insmod = "${base_bindir}/insmod"
 FILES_${KLIBC_UTILS_PKGNAME}-ls = "${base_bindir}/ls"
-- 
1.7.1



