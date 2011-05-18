Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMV2V-0002Iw-MP
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 May 2011 02:55:03 +0200
Received: by pxi6 with SMTP id 6so818690pxi.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 17:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=UbXaTsDFPLT/8Vak06EEiuEwBrQE3IYAbbktn2MC9ys=;
	b=l+61ocdHyCz7wL53Uh8ceUgMl/F9dMrJg7Owp3GcEYHjoy6a18pHUu04vFzQ5/ZoXt
	E2Se1sGt2+grlWBJCqLk72m/zPYQZH7Sqj1s+RUV67PO1TUmx8rtOPLlyBteoCKDs2AT
	/zcpITemd/aFaVeYG1RPAyKG4Dcpw4FCj8kK4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=V1gei/L5d735eLjNHaSwbp7zDNjbcxFUQ0VC7lO4iYNogO2Uo569jeYhz4mYnM579I
	NhwFZzhQmNlGW1jfzhm2/wvE3Sn4JayPOSCWsINUuh2l8e9fmqm1ONtV4sznKzB7sFkF
	uclNIqhtunDQwoxh6LB69UXMh4NWCVZ5+J4R4=
Received: by 10.68.39.69 with SMTP id n5mr1975409pbk.182.1305679928798;
	Tue, 17 May 2011 17:52:08 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id t6sm698685pbc.21.2011.05.17.17.52.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 May 2011 17:52:07 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 May 2011 17:51:53 -0700
Message-Id: <1305679913-8820-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH] uclibc.inc: Package libargp and libbacktrace
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
X-List-Received-Date: Wed, 18 May 2011 00:55:04 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/uclibc/uclibc.inc |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/uclibc/uclibc.inc b/meta-oe/recipes-core/uclibc/uclibc.inc
index 8b8fc95..ca2b929 100644
--- a/meta-oe/recipes-core/uclibc/uclibc.inc
+++ b/meta-oe/recipes-core/uclibc/uclibc.inc
@@ -14,7 +14,7 @@ PRIORITY = "required"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 		    file://COPYING.LIB.boilerplate;md5=aaddeadcddeb918297e0e4afc52ce46f \
 file://${S}/test/regex/testregex.c;startline=1;endline=31;md5=234efb227d0a40677f895e4a1e26e960"
-INC_PR = "r0"
+INC_PR = "r1"
 
 require uclibc-config.inc
 STAGINGCC = "gcc-cross-intermediate"
@@ -59,7 +59,7 @@ RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-PACKAGES =+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db"
+PACKAGES =+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db uclibc-libargp uclibc-libbacktrace"
 
 LEAD_SONAME = "libc.so"
 
@@ -91,7 +91,10 @@ FILES_uclibc-dev_append = "\
 FILES_uclibc-utils = "${bindir} ${sbindir}"
 FILES_uclibc-utils-dbg += "${bindir}/.debug ${sbindir}/.debug"
 FILES_uclibc-gconv = "${libdir}/gconv"
-FILES_uclibc-thread-db = "/lib/libthread_db*"
+FILES_uclibc-thread-db = "${base_libdir}/libthread_db*"
+FILES_uclibc-libuargp = "${base_libdir}/libuargp-*.so ${base_libdir}/libuargp*.so.*"
+FILES_uclibc-libubacktrace = "${base_libdir}/libubacktrace-*.so ${base_libdir}/libubacktrace*.so.*"
+
 RPROVIDES_uclibc-dev += "libc-dev virtual-libc-dev"
 # uclibc does not really have libsegfault but then using the one from glibc is also not
 # going to work. So we pretend that we have it to make bitbake not pull other recipes
-- 
1.7.4.1



