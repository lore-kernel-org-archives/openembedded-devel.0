Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SyNgP-0007dW-LA
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2012 15:49:21 +0200
Received: by bkcik5 with SMTP id ik5so904682bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Aug 2012 06:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=t7KsZ7yw795aPFjIKid06K0Is29jP5S2BAgqFjcwZVU=;
	b=ZeKduExRwb9+hPOKsO9R8xMPSfyB+w72FmqklOh/Re619ljvhiknGG5poFW4rzgn+u
	UNeVISyBaEh6+loIr39jqSAqMgOaO9SUTn24Sk6WzQIn2EfT2Zq8MJhttmK2A0pc4KsA
	KbRwP1DL23V47daOmCT7RHgzdSIgQLk4AqcYtBKsf1VFwyRQ0MFEK31YECG2gVSLojYB
	DcM9HOPY32Rph1p10fOGSDqvdi2ioKCiJbQkyqilpAK7UQ8to7PxDDy8/83qRBXZAtVL
	mCdjUeF02lpyQedAO+gNt19Iyd5LkH01Ek7fwVoPDvhb27ZMLDt/3ksWyldvePjHt/gh
	vDww==
Received: by 10.204.145.76 with SMTP id c12mr4214518bkv.70.1344260257016;
	Mon, 06 Aug 2012 06:37:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n5sm7453797bkv.14.2012.08.06.06.37.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Aug 2012 06:37:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Aug 2012 15:37:07 +0200
Message-Id: <e56d2a196e4ab87ac74f237852c2d419a35e746f.1344259248.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <5dd20f461ce240ffcaf43bd048e9b5e6ffd06bd0.1344259248.git.Martin.Jansa@gmail.com>
References: <cover.1343859304.git.Martin.Jansa@gmail.com>
	<5dd20f461ce240ffcaf43bd048e9b5e6ffd06bd0.1344259248.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344259248.git.Martin.Jansa@gmail.com>
References: <cover.1344259248.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 12/12] php: add build-defs.h to SSTATE_SCAN_FILES it defines path to sysroot where pear.conf is later created
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
X-List-Received-Date: Mon, 06 Aug 2012 13:49:21 -0000

* without this fails in do_install (shr-core-branches is workspace where
  we got SSTATE_MIRROR):
  | [PEAR] PEAR           - installed: 1.9.2
  | Wrote PEAR system config file at:
  /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/php-5.3.6-r0.0/image//var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/etc/pear.conf
  | You may want to add: /usr/lib/php to your php.ini include_path
  | Installing header files:
  /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/php-5.3.6-r0.0/image/usr/include/php/
  | sed: can't read
  /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/php-5.3.6-r0.0/image//etc/pear.conf:
  No such file or directory
  | ERROR: Function failed: do_install (see
  /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/php-5.3.6-r0.0/temp/log.do_install.3783
  for further information)
  NOTE: package php-5.3.6-r0.0: task do_install: Failed
* it also has couple of unpackaged dirs in ${D} (all used in STAGING_DIR_NATIVE)
  WARNING: QA Issue: php: Files/directories were installed but not shipped
  /var
  /var/lib
  /var/lib/jenkins
  /var/lib/jenkins/jobs
  /var/lib/jenkins/jobs/shr-core
  /var/lib/jenkins/jobs/shr-core/workspace
  /var/lib/jenkins/jobs/shr-core/workspace/shr-core
  /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc
  /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/php/php.inc |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 7c03798..320696c 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -7,7 +7,7 @@ DEPENDS = "zlib libxml2 virtual/libiconv php-native lemon-native mysql5 \
            libc-client openssl"
 DEPENDS_virtclass-native = "zlib-native libxml2-native"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2"
 
@@ -15,6 +15,8 @@ S = "${WORKDIR}/php-${PV}"
 
 inherit autotools pkgconfig pythonnative
 
+SSTATE_SCAN_FILES += "build-defs.h"
+
 # Common EXTRA_OECONF
 COMMON_EXTRA_OECONF = "--enable-sockets --enable-pcntl --enable-shared"
 EXTRA_OECONF = "--enable-mbstring --enable-discard-path --enable-wddx \
-- 
1.7.8.6



