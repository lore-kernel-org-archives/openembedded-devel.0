Received: from mail-iw0-f178.google.com ([209.85.214.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P6e4B-0001e6-Cm
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 08:47:01 +0200
Received: by iwn41 with SMTP id 41so475897iwn.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 23:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=dh6/nhG+gxNQG073IFCLswXpRxJDnSxsYs2XRbEIZeE=;
	b=cow2vchmcGXXXLAN/fka+JQ5JPkMw/hpjc0DK/5pmnMLKZ9RhruyPvJEgxeluxtQjj
	8bczDqfNzfncWR/uNUg+pmW9wqk2u5PVWfPPgEmG+UzdBsesw1tjJuWJY7TEn8PwHmFL
	hO+2S/oFPcqrKVg4qVgLEVaSB49f5ZaxdqKJw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=JlX7DpMoN/ulPhx80aul1+n4eSNduKYYCJoNjpEZ3l+qL/kP62hGv1OigY97ak5CII
	KYHJY3SPwW9WXyTYetMPHR4hWo4sAv2T/2dCY2TLmUTnzv+ESEXbXxwHzsNkk1I8Kh71
	Eyjr8/31hDRatL0S2vJ1uHFOtCR7glrMxB2Y4=
Received: by 10.231.145.1 with SMTP id b1mr212447ibv.69.1287125173121;
	Thu, 14 Oct 2010 23:46:13 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p1sm626316ybn.5.2010.10.14.23.46.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 14 Oct 2010 23:46:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Oct 2010 23:46:04 -0700
Message-Id: <1287125165-25527-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.214.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] gcc-cross-intermediate.inc: Move libgcc from cross dir to target sysroot
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
X-List-Received-Date: Fri, 15 Oct 2010 06:47:01 -0000

shared version of libgcc is also installed by gcc-cross-intermediate
which we did not move to staging as a result cross gcc found this libgcc
and used it compailing about missing libc.so stuff.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/gcc/gcc-cross-intermediate.inc |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/recipes/gcc/gcc-cross-intermediate.inc b/recipes/gcc/gcc-cross-intermediate.inc
index 6dbdb94..2b6b24f 100644
--- a/recipes/gcc/gcc-cross-intermediate.inc
+++ b/recipes/gcc/gcc-cross-intermediate.inc
@@ -18,8 +18,16 @@ EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
 		${@get_gcc_mips_plt_setting(bb, d)}"
 
 do_install () {
-	oe_runmake 'DESTDIR=${D}' install
+        oe_runmake 'DESTDIR=${D}' install
+        install -d ${D}${target_base_libdir}
+        install -d ${D}${target_libdir}
 
+        for d in ${TARGET_SYS}/lib/nof ${TARGET_SYS}/lib64 ${TARGET_SYS}/lib; do
+                if [ -d ${D}${prefix}/$d/ ]; then
+                        mv -f ${D}${prefix}/$d/libgcc* ${D}${target_base_libdir} || true
+                        mv -f ${D}${prefix}/$d/* ${D}${target_libdir} || true
+                fi
+        done
     # If this is important, we should remove the staging package here
 	# get rid of dummy libc.so
 	#if [ -z "`file ${STAGING_DIR_TARGET}${target_libdir}/libc.so | grep "ASCII C program text"`" ]; then
-- 
1.7.1



