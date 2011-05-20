Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNJdA-0007Qu-QM
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 May 2011 08:56:17 +0200
Received: by pvc30 with SMTP id 30so1589568pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 May 2011 23:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=BoWJdVxA59Kx3EHQXjl9QRaKpDynPasey5pIUBTygKo=;
	b=bDmET5bwmyiDas5j9+lQfIcogc9PrFR+xqcxk/8MrrJTm01HI3pyAiSp68WhOcFvco
	z4k3GEmj1sdAOK2DgFexjXrtpzebSBtfmpWc1o3Q1Wc5xlp19tpEhasFnFpwgXF0Y7Uv
	k3YZNSnHEr11tQH0EhbQJmsL1wlvMk8kO7fjM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=erywg/hx5eVV320Lf2m6ll5kLfyicC0qc1trSijc07GJQ8kMcXAh7vHw3pE5vuV50I
	OZC4O8MJs0em9MfhQrmmTth4KLH6JbA4T/CAFUyWoFLUwnBauWr+J13VZq/Y8kA505pG
	CVCA0aE+C6xMw4M9vHwscunHBsepfglsHVtlw=
Received: by 10.68.18.201 with SMTP id y9mr6373008pbd.370.1305874388843;
	Thu, 19 May 2011 23:53:08 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 3sm2263201pbf.29.2011.05.19.23.53.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 May 2011 23:53:07 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 May 2011 23:52:53 -0700
Message-Id: <1305874373-7977-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCHv2] uclibc: Rename uclibc-libargp -> uclibc-argp and uclibc-libbacktrace -> uclibc-backtrace
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
X-List-Received-Date: Fri, 20 May 2011 06:56:18 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/uclibc/uclibc.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/uclibc/uclibc.inc b/meta-oe/recipes-core/uclibc/uclibc.inc
index ca2b929..e7d8846 100644
--- a/meta-oe/recipes-core/uclibc/uclibc.inc
+++ b/meta-oe/recipes-core/uclibc/uclibc.inc
@@ -14,7 +14,7 @@ PRIORITY = "required"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 		    file://COPYING.LIB.boilerplate;md5=aaddeadcddeb918297e0e4afc52ce46f \
 file://${S}/test/regex/testregex.c;startline=1;endline=31;md5=234efb227d0a40677f895e4a1e26e960"
-INC_PR = "r1"
+INC_PR = "r2"
 
 require uclibc-config.inc
 STAGINGCC = "gcc-cross-intermediate"
@@ -59,7 +59,7 @@ RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-PACKAGES =+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db uclibc-libargp uclibc-libbacktrace"
+PACKAGES =+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db uclibc-argp uclibc-backtrace"
 
 LEAD_SONAME = "libc.so"
 
@@ -92,8 +92,8 @@ FILES_uclibc-utils = "${bindir} ${sbindir}"
 FILES_uclibc-utils-dbg += "${bindir}/.debug ${sbindir}/.debug"
 FILES_uclibc-gconv = "${libdir}/gconv"
 FILES_uclibc-thread-db = "${base_libdir}/libthread_db*"
-FILES_uclibc-libuargp = "${base_libdir}/libuargp-*.so ${base_libdir}/libuargp*.so.*"
-FILES_uclibc-libubacktrace = "${base_libdir}/libubacktrace-*.so ${base_libdir}/libubacktrace*.so.*"
+FILES_uclibc-argp = "${base_libdir}/libuargp-*.so ${base_libdir}/libuargp*.so.*"
+FILES_uclibc-backtrace = "${base_libdir}/libubacktrace-*.so ${base_libdir}/libubacktrace*.so.*"
 
 RPROVIDES_uclibc-dev += "libc-dev virtual-libc-dev"
 # uclibc does not really have libsegfault but then using the one from glibc is also not
-- 
1.7.4.1



