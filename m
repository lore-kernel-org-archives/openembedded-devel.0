Received: from hsp-52.hspserver.com ([85.197.80.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ml@vdm-design.de>) id 1NfvGC-00050O-0s
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 14:08:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by hsp-52.hspserver.com (Postfix) with ESMTP id 31429A2C39C;
	Fri, 12 Feb 2010 14:06:07 +0100 (CET)
Received: from hsp-52.hspserver.com ([127.0.0.1])
	by localhost (hsp-52.hspserver.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Liv8SP1GktNA; Fri, 12 Feb 2010 14:06:06 +0100 (CET)
Received: from localhost.localdomain (pD9E1505D.dip.t-dialin.net
	[217.225.80.93])
	by hsp-52.hspserver.com (Postfix) with ESMTP id BC4C2A2C012;
	Fri, 12 Feb 2010 14:06:06 +0100 (CET)
From: Thomas Zimmermann <ml@vdm-design.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Feb 2010 14:05:53 +0100
Message-Id: <1265979953-4327-1-git-send-email-ml@vdm-design.de>
X-Mailer: git-send-email 1.6.6.1
X-SA-Exim-Connect-IP: 85.197.80.179
X-SA-Exim-Mail-From: ml@vdm-design.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] eglibc:
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
X-List-Received-Date: Fri, 12 Feb 2010 13:08:43 -0000

* ldd has shebang #!/bin/bash: so add bash RDEPNDS
* add libpthread_nonshared.a to eglibc-dev, needed for building
  multithreaded apps on the device
---
 recipes/eglibc/eglibc-package.bbclass |    3 ++-
 recipes/eglibc/eglibc.inc             |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
index fcaba47..7187363 100644
--- a/recipes/eglibc/eglibc-package.bbclass
+++ b/recipes/eglibc/eglibc-package.bbclass
@@ -45,10 +45,11 @@ libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${ba
 
 FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig', '', d)}"
 FILES_ldd = "${bindir}/ldd"
+RDEPENDS_ldd = "bash"
 FILES_libsegfault = "${base_libdir}/libSegFault*"
 FILES_eglibc-extra-nss = "${base_libdir}/libnss*"
 FILES_sln = "/sbin/sln"
-FILES_eglibc-dev_append = " ${libdir}/*.o ${bindir}/rpcgen ${libdir}/libc_nonshared.a"
+FILES_eglibc-dev_append = " ${libdir}/*.o ${bindir}/rpcgen ${libdir}/libc_nonshared.a ${libdir}/libpthread_nonshared.a"
 FILES_nscd = "${sbindir}/nscd*"
 FILES_eglibc-utils = "${bindir}/* ${sbindir}/*"
 FILES_eglibc-gconv = "${libdir}/gconv/*"
diff --git a/recipes/eglibc/eglibc.inc b/recipes/eglibc/eglibc.inc
index 356b838..5c06ae6 100644
--- a/recipes/eglibc/eglibc.inc
+++ b/recipes/eglibc/eglibc.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.eglibc.org/home"
 SECTION = "libs"
 PRIORITY = "required"
 LICENSE = "LGPL"
-INC_PR = "r8"
+INC_PR = "r9"
 # nptl needs unwind support in gcc, which can't be built without glibc.
 DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
 #this leads to circular deps, so lets not add it yet
-- 
1.6.6.1



