Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OzdvO-0006vR-HE
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 01:13:05 +0200
Received: by pwi10 with SMTP id 10so937571pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 16:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=RUBIXJAKgumCqJFhru3U1hWbSGj/YyZbV6YF6VGqppo=;
	b=AqrL0fCFBdiOT8HH8Gu0SWiosWMtuT/ZqI9c+BaYcYxB0qCFIpUKEI5oFG5iP15e+o
	HlyoSzmTFvnN+SsxlsqTDiYDn/a+XZJeMgYIAWeAqMGC9h/zJBEN4Rm1L35GhP+shVJr
	U2K37E9eS+dLq0rWDczMxdskQ4MBYXjN/zRV4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=hc+7X8cxD9cl1FqTf3sw370wqo58hUrRnOhHLJsi8qZJuEmosS12+Mj8CTUrGe2Kqx
	19TPEQ3qEhlk8VQIBxvJ+AycsCG/v4Tvr3nPB2X1WMfHWUkX7NBiPflF6zUPgN4tA578
	VT/TuT78n131HFk5XeCyMXQCViXM6Yieawllk=
Received: by 10.114.89.16 with SMTP id m16mr5796629wab.187.1285456368697;
	Sat, 25 Sep 2010 16:12:48 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id r37sm6791851wak.23.2010.09.25.16.12.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 25 Sep 2010 16:12:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Sep 2010 16:12:22 -0700
Message-Id: <1285456353-27457-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
References: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 01/12] native.bbclass, package.bbclass, bitbake.conf: Make provisions for system libdir to be something else than '/lib'
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
X-List-Received-Date: Sat, 25 Sep 2010 23:13:05 -0000

* Add base_libdir_native as target libdir could be different e.g. lib32
  lib64

* Dont assume lib to be system libdir during packaging.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/native.bbclass  |    3 ++-
 classes/package.bbclass |    3 ++-
 conf/bitbake.conf       |    1 +
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/classes/native.bbclass b/classes/native.bbclass
index 345bd80..dcedff2 100644
--- a/classes/native.bbclass
+++ b/classes/native.bbclass
@@ -62,7 +62,8 @@ export STRIP = "${HOST_PREFIX}strip"
 base_prefix = "${STAGING_DIR_NATIVE}"
 prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
 exec_prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
-
+libdir = ${base_prefix}${libdir_native}
+base_libdir = ${base_prefix}${base_libdir_native}
 # Since we actually install these into situ there is no staging prefix
 STAGING_DIR_HOST = ""
 STAGING_DIR_TARGET = ""
diff --git a/classes/package.bbclass b/classes/package.bbclass
index c378133..35d9864 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -614,7 +614,8 @@ python package_do_shlibs() {
 		return
 		
 	lib_re = re.compile("^lib.*\.so")
-	libdir_re = re.compile(".*/lib$")
+	libdir = bb.data.getVar('base_libdir', d, True)
+	libdir_re = re.compile(".*%s$" % (libdir))
 
 	packages = bb.data.getVar('PACKAGES', d, True)
 
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index b099499..4e80d97 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -72,6 +72,7 @@ export oldincludedir = "${exec_prefix}/include"
 base_bindir_native = "/bin"
 base_sbindir_native = "/sbin"
 sysconfdir_native = "/etc"
+base_libdir_native = "/lib"
 prefix_native = "/usr"
 bindir_native = "${prefix_native}/bin"
 sbindir_native = "${prefix_native}/sbin"
-- 
1.7.0.4



