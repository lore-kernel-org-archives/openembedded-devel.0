Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1Nkwky-00017q-RT
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 10:45:13 +0100
Received: by fxm20 with SMTP id 20so6745403fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 01:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=k++8jRhByeoX0a/fjVF4uVSnKT4siaGxO6ELS6BDO5Y=;
	b=HSLFaYdjmaSTUr9acYUFGGMRVgpNzvM0OadOCVo0YIBGM8nxAcPzoeixiw6qCIL43t
	1UZCnLS4LDPSrhfF4RjKXxCrLEgUGrnMw/sCnTdSd0v/CJ4JjCHFtzdr2UbfQkecJpFE
	A9XSsng/bCzabtqlwB8CyUQll8t7rToFPiuJI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=WmSBD5KiT3ndeQ8nuKV3jhAmRS2JzrQYIrs2Rkk1tK50XNN44xluwfeONXCSjMbom/
	a96mNaFvw1aD4yeqvq9Qp6rJA3kt/DWCiiCSyxtieh575lU5Wtuk+mDyx2qtqDYkldKe
	i0KFg3a6CJOkNSl2+gKWN5jyjNcKEIGyPqi6g=
Received: by 10.103.80.1 with SMTP id h1mr75018mul.101.1267177345588;
	Fri, 26 Feb 2010 01:42:25 -0800 (PST)
Received: from localhost.localdomain ([62.218.44.194])
	by mx.google.com with ESMTPS id i7sm18468016mue.4.2010.02.26.01.42.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 26 Feb 2010 01:42:24 -0800 (PST)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Feb 2010 10:42:47 +0100
Message-Id: <1267177367-24176-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <n>
References: <n>
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] base.bbclass, distutils.bbclass, native.bbclass: Allow BBEXTENDS native for python distutils based recipes
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
X-List-Received-Date: Fri, 26 Feb 2010 09:45:13 -0000

* Enable BBCLASSEXTEND for python recipe that use distutils class
* Uses new staging system
---
 classes/base.bbclass      |    2 ++
 classes/distutils.bbclass |    2 ++
 classes/native.bbclass    |    3 +++
 3 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 990e75e..9d38150 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -1107,6 +1107,8 @@ def is_legacy_staging(d):
         legacy = False
     elif bb.data.getVar('NATIVE_INSTALL_WORKS', d, 1) == "1":
         legacy = False
+    elif stagefunc.strip() == "do_stage_native" and bb.data.getVar('DISTUTILS_NATIVE_STAGE_INSTALL', d, 1) == "1":
+        legacy = False
     if bb.data.getVar('PSTAGE_BROKEN_DESTDIR', d, 1) == "1":
         legacy = True
     if bb.data.getVar('FORCE_LEGACY_STAGING', d, 1) == "1":
diff --git a/classes/distutils.bbclass b/classes/distutils.bbclass
index 4d1fc8c..b06965f 100644
--- a/classes/distutils.bbclass
+++ b/classes/distutils.bbclass
@@ -1,5 +1,7 @@
 inherit distutils-base
 
+DISTUTILS_NATIVE_STAGE_INSTALL = "1"
+
 DISTUTILS_BUILD_ARGS ?= ""
 DISTUTILS_STAGE_HEADERS_ARGS ?= "--install-dir=${STAGING_INCDIR}/${PYTHON_DIR}"
 DISTUTILS_STAGE_ALL_ARGS ?= "--prefix=${STAGING_DIR_HOST}${prefix} \
diff --git a/classes/native.bbclass b/classes/native.bbclass
index 6698b61..044f92d 100644
--- a/classes/native.bbclass
+++ b/classes/native.bbclass
@@ -70,6 +70,9 @@ do_stage_native () {
 	if [ "${AUTOTOOLS_NATIVE_STAGE_INSTALL}" == "1" ]
 	then
 		autotools_stage_all
+    elif [ "${DISTUTILS_NATIVE_STAGE_INSTALL}" == "1" ]
+    then
+        distutils_stage_all
 	else
 		oe_runmake install
 	fi
-- 
1.6.4.4



