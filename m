Received: from mail-gw0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1PTlZd-00083L-IE
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 02:27:02 +0100
Received: by gwj22 with SMTP id 22so708851gwj.28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Dec 2010 17:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=t4vxrfQWYDXkeWe9cHuLPI/gjd/wBOrql4c8ADEV6k8=;
	b=gdl6LG8UDUCRVG8fVlIwLLcvUB+mHOvjd8vkQjSSC0DslKqR5JQfOortrSRICqFGvt
	OXlYcFlBVbQLOg+p1BxnAcjy3uYPoF5IQyUVls4KNjwsWPycQzVv6IWlIB/vd4XikG+9
	vhmpyyYcnbUAWsYczSVMHq+tFefEimDS43KgY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=hNW9dhI1EGTOlkKmG7IEk/7kWLd2Je3UzM+zLSlHVtT64D2qEVOt0RPC56p7JZZsCF
	SVq2DV28F6OGGUaj8uBLs31F9r77ZYL7snR1DPQMW/kd8A59X0bXsJnERgXu8IyE3Ioq
	1cA+NJytKStc3hoFSKmVekYLcz4GBNXiydJB8=
Received: by 10.100.111.1 with SMTP id j1mr5289925anc.65.1292520717471;
	Thu, 16 Dec 2010 09:31:57 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id f10sm3058864anh.25.2010.12.16.09.31.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 16 Dec 2010 09:31:55 -0800 (PST)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Dec 2010 11:31:51 -0600
Message-Id: <1292520711-25044-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH] openssl: create package for openssl configuration file
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
X-List-Received-Date: Sat, 18 Dec 2010 01:27:02 -0000

* Add the openssl-conf package to the list of packages to
  be created.  This package contains the openssl.cnf file
  which is used by both the openssl executable in the
  openssl package and the libcrypto library.
* This is to avoid messages like:
    WARNING: can't open config file: /usr/lib/ssl/openssl.cnf
* When running "openssl req" to request and generate a certificate
  the command will fail without the openssl.cnf file being
  installed on the target system.
* Made this package an RRECOMMENDS for libcrypto since:
    * libcrypto is a RDEPENDS for the openssl package
    * Users can specify a configuration file at another
      location so it is not stricly required and many
      commands will work without it (with warnings)
* Bumped the PR

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/openssl/openssl.inc |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/recipes/openssl/openssl.inc b/recipes/openssl/openssl.inc
index 95572e1..5ef322c 100644
--- a/recipes/openssl/openssl.inc
+++ b/recipes/openssl/openssl.inc
@@ -8,7 +8,7 @@ S = "${WORKDIR}/openssl-${PV}"
 
 inherit siteinfo
 
-INC_PR = "r13"
+INC_PR = "r14"
 
 AR_append = " r"
 CFLAG = "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
@@ -22,10 +22,18 @@ export DIRS = "crypto ssl apps"
 export EX_LIBS = "-lgcc -ldl"
 export AS = "${CC} -c"
 
-PACKAGES =+ "libcrypto libssl ${PN}-misc"
+PACKAGES =+ "libcrypto libssl ${PN}-misc openssl-conf"
 FILES_libcrypto = "${libdir}/libcrypto.so.*"
 FILES_libssl = "${libdir}/libssl.so.*"
-FILES_${PN}-misc = "${libdir}/ssl/misc ${libdir}/ssl/openssl.cnf"
+FILES_${PN}-misc = "${libdir}/ssl/misc"
+
+# Add the openssl.cnf file to the openssl-conf package.  Make the libcrypto
+# package RRECOMMENDS on this package.  This will enable the configuration
+# file to be installed for both the base openssl package and the libcrypto
+# package since the base openssl package depends on the libcrypto package.
+FILES_openssl-conf = "${libdir}/ssl/openssl.cnf"
+CONFFILES_openssl-conf = "${libdir}/ssl/openssl.cnf"
+RRECOMMENDS_libcrypto += "openssl-conf"
 
 do_configure_prepend_darwin () {
 	sed -i -e '/version-script=openssl\.ld/d' Configure
-- 
1.7.0.4



