Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OsMz5-0006Zx-RS
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Sep 2010 23:42:45 +0200
Received: by pwj8 with SMTP id 8so919888pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Sep 2010 14:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=c8QxpNbQXxqMfEN5U7DNzVO72093ofKMEL4Kbn+ethY=;
	b=jZ4/jVMAEPNMFnzSck9Uq7ipeZYudmP4R0wdiXNJnzBZHfpIxVzKj4x3V5tBgYVL7a
	fmCFKYVsGc/2Ng/85u0SxDykS7mhVfWY8T7+n9p+AU7JkYzNLuThfElK8jdJETIoI+Hm
	QkqvHwwCMaa1Gl8+O0co2rdCDKemGiHccH+RI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=aR+ic8jMbwbuw13oOe03r3eY1kSIZTCkcVUOnahNpRR7yYRVRXbBNs2PPYcZMcWXnr
	zVRewr38JG9S6DdvhYUy5rSXBZWufOfL74eHU0ZJrcB7OnR3Tu2L+1R3IBVkeN60mdcK
	kHNAJaLgTzp7cuG4i/2mDSLavSZGD8n5IXXtA=
Received: by 10.114.106.13 with SMTP id e13mr2162677wac.153.1283722923961;
	Sun, 05 Sep 2010 14:42:03 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id r37sm9740100wak.11.2010.09.05.14.42.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 05 Sep 2010 14:42:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Sep 2010 14:41:53 -0700
Message-Id: <1283722913-25949-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] bitbake.conf: Redefine STAGING_DIR_JAVA to point to target sysroot by default
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
X-List-Received-Date: Sun, 05 Sep 2010 21:42:45 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 677c76a..b099499 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -295,7 +295,6 @@ B = "${S}"
 
 STAGING_DIR = "${TMPDIR}/sysroots"
 
-STAGING_DIR_JAVA = "${STAGING_DIR}/java"
 STAGING_DIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}"
 STAGING_BINDIR_NATIVE = "${STAGING_DIR_NATIVE}${bindir_native}"
 STAGING_SBINDIR_NATIVE = "${STAGING_DIR_NATIVE}${sbindir_native}"
@@ -321,6 +320,7 @@ STAGING_PYDIR = "${STAGING_DIR}/lib/python2.4"
 # This should really be MULTIMACH_TARGET_SYS but that breaks "all" and machine 
 # specific packages - hack around it for now.
 STAGING_DIR_TARGET = "${STAGING_DIR}/${BASEPKG_TARGET_SYS}"
+STAGING_DIR_JAVA = "${STAGING_DATADIR}/java"
 
 STAGING_DIR_SDK = "${STAGING_DIR}/${SDK_SYS}"
 
-- 
1.7.1



