Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMbeM-00083f-JP
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 May 2011 09:58:34 +0200
Received: by pxi6 with SMTP id 6so998804pxi.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2011 00:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=UbXaTsDFPLT/8Vak06EEiuEwBrQE3IYAbbktn2MC9ys=;
	b=jyAfXKd56o3w3weuCbf6FCEVuxMBisobXuGgILGMTMFZCamD/7819uaMGbq5V065O6
	ghzmSkLORR/r3r8jxkG6vQ1ONueT6USt9PbNr2neZIfYyCcrkOq+bIKJ6nRL/uMORaRm
	S9rFqaZRKubun3J3U8UMGm6SCgTzVR24P/x/4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=cLODGQDtqfeQpQNtPIh/cQOmzfr4TX5ihlUdzLy1tSmZDjKzPRDnLF/63FjDAYR4FE
	Sma1md2pqp51rK2+CcbzdTzFO3mPgvfYxTy+PBMLzVNQQy6j/AG2+gksykLdvWrbKUid
	EBxE+NEKlNueuk798b+eqYW7jRh2OkGKi5d2E=
Received: by 10.68.68.194 with SMTP id y2mr2468928pbt.329.1305705339132;
	Wed, 18 May 2011 00:55:39 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c10sm897016pbd.87.2011.05.18.00.55.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 00:55:38 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 May 2011 00:55:24 -0700
Message-Id: <1305705324-20768-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1305705324-20768-1-git-send-email-raj.khem@gmail.com>
References: <1305705324-20768-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCHv3 2/2] uclibc.inc: Package libargp and libbacktrace
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
X-List-Received-Date: Wed, 18 May 2011 07:58:34 -0000

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



