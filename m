Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OUU7G-0002Fy-S8
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 02:28:28 +0200
Received: by pvg13 with SMTP id 13so1165919pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 17:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=HzSbSvkKkAgZEWOedEcGbT3njA9hhJoCp/UAcAE9BNo=;
	b=Uy3l/GJEVv0uT8hWE3BjIFkqfKCxlnWI7ZWIYrHIke82lrp+ymSQ/nQh1n3KtDNOAL
	c+j97A5OKQiZVQ9VGMWb63bgKYyzE2zuhrZqFWtw0xTESaiN2nflE5U7rt2iRmY8q9tf
	cBRnijN5IQYKgxq9yO6vrLmQyILMwtQGGtCY4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=E+grbFKVgCjhIXDRnbO+qaHpPJ39fyiV03VaRV4bgAhc1ouvJnexqV0dY4DvR3aftS
	84ez1kydVzv3z/hPVOLap73H3m1MQ+Pc7co5gd0Ga5aXuzNwzoKEqWFZCt0ersy3EvI9
	6Cc/oB7R6+HurSp5X12lsFvzBl27BRIYT2SxI=
Received: by 10.142.229.7 with SMTP id b7mr299992wfh.230.1278030219426;
	Thu, 01 Jul 2010 17:23:39 -0700 (PDT)
Received: from [10.0.0.4] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id l29sm35016rvb.7.2010.07.01.17.23.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 01 Jul 2010 17:23:38 -0700 (PDT)
Message-ID: <4C2D3185.6050803@gmail.com>
Date: Fri, 02 Jul 2010 09:53:33 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100401 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gnupg_1.4.10.bb: fix build on mips(el) with recent gcc.
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
X-List-Received-Date: Fri, 02 Jul 2010 00:28:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Patch "borrowed" from openwrt.
https://dev.openwrt.org/browser/packages/utils/gnupg/patches/001-mips_gcc4.4.patch

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/gnupg/gnupg-1.4.10/mips_gcc4.4.patch |   42 ++++++++++++++++++++++++++
 recipes/gnupg/gnupg_1.4.10.bb                |    3 +-
 2 files changed, 44 insertions(+), 1 deletions(-)
 create mode 100644 recipes/gnupg/gnupg-1.4.10/mips_gcc4.4.patch

diff --git a/recipes/gnupg/gnupg-1.4.10/mips_gcc4.4.patch b/recipes/gnupg/gnupg-1.4.10/mips_gcc4.4.patch
new file mode 100644
index 0000000..b101a5b
--- /dev/null
+++ b/recipes/gnupg/gnupg-1.4.10/mips_gcc4.4.patch
@@ -0,0 +1,42 @@
+Index: gnupg-1.4.10/mpi/longlong.h
+===================================================================
+--- gnupg-1.4.10.orig/mpi/longlong.h	2008-12-11 17:39:43.000000000 +0100
++++ gnupg-1.4.10/mpi/longlong.h	2010-03-27 14:27:53.000000000 +0100
+@@ -706,18 +706,35 @@
+ #endif /* __m88110__ */
+ #endif /* __m88000__ */
+ 
++/* Test for gcc >= maj.min, as per __GNUC_PREREQ in glibc */
++#if defined (__GNUC__) && defined (__GNUC_MINOR__)
++#define __GNUC_PREREQ(maj, min) \
++	((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))
++#else
++#define __GNUC_PREREQ(maj, min)  0
++#endif
++
+ /***************************************
+  **************  MIPS  *****************
+  ***************************************/
+ #if defined (__mips__) && W_TYPE_SIZE == 32
+-#if __GNUC__ > 2 || __GNUC_MINOR__ >= 7
++#if __GNUC_PREREQ (4,4)
++#define umul_ppmm(w1, w0, u, v) \
++  do {                                                                 \
++	UDItype __ll = (UDItype)(u) * (v);                                 \
++	w1 = __ll >> 32;                                                   \
++	w0 = __ll;                                                         \
++  } while (0)
++#endif
++#if !defined (umul_ppmm) && __GNUC_PREREQ (2,7)
+ #define umul_ppmm(w1, w0, u, v) \
+   __asm__ ("multu %2,%3"                                                \
+ 	   : "=l" ((USItype)(w0)),                                      \
+ 	     "=h" ((USItype)(w1))                                       \
+ 	   : "d" ((USItype)(u)),                                        \
+ 	     "d" ((USItype)(v)))
+-#else
++#endif
++#if !defined (umul_ppmm)
+ #define umul_ppmm(w1, w0, u, v) \
+   __asm__ ("multu %2,%3 \n" \
+ 	   "mflo %0 \n"     \
diff --git a/recipes/gnupg/gnupg_1.4.10.bb b/recipes/gnupg/gnupg_1.4.10.bb
index 93bc465..a71ba9f 100644
--- a/recipes/gnupg/gnupg_1.4.10.bb
+++ b/recipes/gnupg/gnupg_1.4.10.bb
@@ -5,9 +5,10 @@ EXTRA_OECONF += "--with-readline=${STAGING_LIBDIR}/.. ac_cv_sys_symbol_underscor
 #   --without-readline      do not support fancy command line editing
 
 SRC_URI += "file://long-long-thumb.patch"
+SRC_URI += "file://mips_gcc4.4.patch"
 SRC_URI[src.md5sum] = "dcf7ed712997888d616e029637bfc303"
 SRC_URI[src.sha256sum] = "a2907f4432d67894e425e48ae85785dd60ecb01658c9682bcd96f5e91043bb38"
 
 S = "${WORKDIR}/gnupg-${PV}"
 
-PR = "r2"
+PR = "r3"
-- 
1.7.1



