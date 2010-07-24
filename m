Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ocb6c-0005wA-O2
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 11:33:19 +0200
Received: by pxi12 with SMTP id 12so1844145pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jul 2010 02:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=3IoJrwjzrFY3E1xsCILVuvByt9VoQ23RgM9tk2T3CSs=;
	b=F9xCXKfnVcJXpw/g9N86Nbm2boql2e62uv3xD5gogXt2H0xbJCqIdAtKgn+dLuUUb2
	rtqpUeMOTta5b7hfVLPaYQ2FtGZ4R4NPywrxZVXRN8bWBv5NVDR3gsGyU5zn9sIFsAni
	B0+fdBG4hkuT2f4tcwvyLBoUqF8pesQjjWFUs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=TKREcFeDIEnRY3aMvBBRBKWHa3xCzjJhlosTv0NuyJsHUHZGFdD9v43Vkh+WRJVWj1
	LXHlQ9gEOJ7WMP0Tg4UfrdEHEsmE3tXht3yXEXw36yhU/UHS09q5GmJ/1tQysv2Gz2cK
	oXSe1vQbGqHTTmAxn064xal61mP4C0gJlpiVs=
Received: by 10.114.77.13 with SMTP id z13mr7237159waa.196.1279963983961;
	Sat, 24 Jul 2010 02:33:03 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d39sm2139120wam.4.2010.07.24.02.33.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 24 Jul 2010 02:33:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Jul 2010 02:32:53 -0700
Message-Id: <1279963975-3736-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1279963975-3736-1-git-send-email-raj.khem@gmail.com>
References: <1279963975-3736-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	UPPERCASE_50_75 autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/3] bitbake.conf: Define HOST_SYS and TARGET_SYS based on target sub-arch
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
X-List-Received-Date: Sat, 24 Jul 2010 09:33:19 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/cross.bbclass |    2 +-
 conf/bitbake.conf     |    5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/classes/cross.bbclass b/classes/cross.bbclass
index 75b2abe..5776a37 100644
--- a/classes/cross.bbclass
+++ b/classes/cross.bbclass
@@ -15,7 +15,6 @@ OLD_PACKAGE_ARCH := "${PACKAGE_ARCH}"
 PACKAGE_ARCH = "${OLD_PACKAGE_ARCH}"
 # Also save BASE_PACKAGE_ARCH since HOST_ARCH can influence it
 OLD_BASE_PACKAGE_ARCH := "${BASE_PACKAGE_ARCH}"
-BASE_PACKAGE_ARCH = "${OLD_BASE_PACKAGE_ARCH}"
 
 HOST_ARCH = "${BUILD_ARCH}"
 HOST_VENDOR = "${BUILD_VENDOR}"
@@ -23,6 +22,7 @@ HOST_OS = "${BUILD_OS}"
 HOST_PREFIX = "${BUILD_PREFIX}"
 HOST_CC_ARCH = "${BUILD_CC_ARCH}"
 HOST_EXEEXT = "${BUILD_EXEEXT}"
+BASE_PACKAGE_ARCH = "${OLD_BASE_PACKAGE_ARCH}"
 BASEPKG_HOST_SYS = "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
 
 CPPFLAGS = "${BUILD_CPPFLAGS}"
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 748abba..dd6ffda 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -101,7 +101,7 @@ BUILD_EXEEXT = ""
 HOST_ARCH = "${TARGET_ARCH}"
 HOST_OS = "${TARGET_OS}"
 HOST_VENDOR = "${TARGET_VENDOR}"
-HOST_SYS = "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
+HOST_SYS = "${BASEPKG_HOST_SYS}"
 HOST_PREFIX = "${TARGET_PREFIX}"
 HOST_CC_ARCH = "${TARGET_CC_ARCH}"
 HOST_EXEEXT = ""
@@ -109,7 +109,7 @@ HOST_EXEEXT = ""
 TARGET_ARCH ?= "INVALID"
 TARGET_OS = "INVALID"
 TARGET_VENDOR = "${BUILD_VENDOR}"
-TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) == ('' or 'custom')]}"
+TARGET_SYS = "${BASE_PACKAGE_ARCH}${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) == ('' or 'custom')]}"
 TARGET_PREFIX = "${TARGET_SYS}-"
 TARGET_CC_ARCH = ""
 TARGET_EXEEXT = ""
@@ -135,6 +135,7 @@ PACKAGE_ARCHS = "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS} ${MACHINE}
 MULTIMACH_ARCH = "${PACKAGE_ARCH}"
 MULTIMACH_TARGET_SYS = "${MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 MULTIMACH_HOST_SYS = "${MULTIMACH_ARCH}${HOST_VENDOR}-${HOST_OS}"
+
 BASEPKG_HOST_SYS = "${BASE_PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
 BASEPKG_TARGET_SYS = "${BASE_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
-- 
1.7.1



