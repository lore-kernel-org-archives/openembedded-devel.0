Received: from mail-gx0-f215.google.com ([209.85.217.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NM7mP-0006Gh-Dg
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Dec 2009 23:28:08 +0100
Received: by gxk7 with SMTP id 7so8977535gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Dec 2009 14:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=19koyYEKrNoqFAd/tMo/Zs927GSpJAiioQEgIDY5FYw=;
	b=LFsf/Sg9TM/J0c24w+SFe5GzhHKFdcKpFv10L+rzz8dNWVGY2oCQ5ZzAvcdqkRTrTL
	g2ldNFGsiwLKrMKL0cVT0FSOKs3D18rFYNE9iK6A7qVyplqZwdydTA4I7+1bL8UYmlFq
	EpOW9tYOuulWD/ZO1gEZQKftifiSLxYSawkkI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=thy9F4ISLTv8DRKYedkEnKk1oZg17ksKL04dWXl/PznPcWIM6EH7B75T1BwA7aTuXb
	/JK07rwMriP8Mx4/Y0b2xTAuldRzalFnWBYOdMeb5hmVq8RVhKsFZrBlSELNelwWi8Vs
	h4yMxU6UlWFm+1a+9lkb41GAmd/AA66kIT83k=
Received: by 10.151.92.12 with SMTP id u12mr8923780ybl.32.1261261575282;
	Sat, 19 Dec 2009 14:26:15 -0800 (PST)
Received: from localhost (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 4sm1572110ywd.44.2009.12.19.14.26.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 19 Dec 2009 14:26:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Dec 2009 14:26:09 -0800
Message-Id: <1261261569-19196-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 209.85.217.215
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/3] eglibc: Add libc_nonshared.a to FILE list in eglibc-dev.
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
X-List-Received-Date: Sat, 19 Dec 2009 22:28:08 -0000

* This file is an essential one even for shared linking so
  once one installs libc6-dev package he expects the linking
  to work which will not happen without this file as some
  start up files refer to functions in this library therefore
  package this file in eglibc-dev

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/eglibc/eglibc-package.bbclass |    2 +-
 recipes/eglibc/eglibc.inc             |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
index 27437f6..fcaba47 100644
--- a/recipes/eglibc/eglibc-package.bbclass
+++ b/recipes/eglibc/eglibc-package.bbclass
@@ -48,7 +48,7 @@ FILES_ldd = "${bindir}/ldd"
 FILES_libsegfault = "${base_libdir}/libSegFault*"
 FILES_eglibc-extra-nss = "${base_libdir}/libnss*"
 FILES_sln = "/sbin/sln"
-FILES_eglibc-dev_append = " ${libdir}/*.o ${bindir}/rpcgen"
+FILES_eglibc-dev_append = " ${libdir}/*.o ${bindir}/rpcgen ${libdir}/libc_nonshared.a"
 FILES_nscd = "${sbindir}/nscd*"
 FILES_eglibc-utils = "${bindir}/* ${sbindir}/*"
 FILES_eglibc-gconv = "${libdir}/gconv/*"
diff --git a/recipes/eglibc/eglibc.inc b/recipes/eglibc/eglibc.inc
index 1b655e1..356b838 100644
--- a/recipes/eglibc/eglibc.inc
+++ b/recipes/eglibc/eglibc.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.eglibc.org/home"
 SECTION = "libs"
 PRIORITY = "required"
 LICENSE = "LGPL"
-INC_PR = "r7"
+INC_PR = "r8"
 # nptl needs unwind support in gcc, which can't be built without glibc.
 DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
 #this leads to circular deps, so lets not add it yet
-- 
1.6.3.3



