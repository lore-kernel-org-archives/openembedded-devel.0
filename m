Received: from [209.85.216.196] (helo=mail-px0-f196.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MY9rX-0001P7-M2
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Aug 2009 04:34:52 +0200
Received: by pxi34 with SMTP id 34so5432883pxi.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Aug 2009 19:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=6+tCa9e0CN7VSMV+Kj1/XIruBvI1zwtElCSK6SQHBWo=;
	b=Fo/mExdiuSF6JYllCNf1WcWlCR0BiGhKmsXTF5NnztDTDknfGuCOHXSRtwziGFj07Y
	1APgn4dVNZnNm/lSZVIhkXTKwOrJPfQPG44NOZvt/ZCCmCejsS/wFJwo4TAOjpOw4daD
	5zNgQ1HKIAfOrpddjpQz2H+MAmZ3WpN5XgRkk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=Z3ahMnxJbLoxZxmKruLUh0dWPpYpYqagE6ZrXecUMeUiv8TDZQTLCrgiHj/wKgUrhS
	bvh1LU9IwVZYHgYbXNvSRqsoWLeZMsT9/tdOsiKodMpi+rYkWuxhOmje226l8qDAwcht
	0fJn5GzMRQUIS8vtfjSPanluHO3x4oPp1w9R8=
Received: by 10.140.134.10 with SMTP id h10mr4350538rvd.7.1249352355791;
	Mon, 03 Aug 2009 19:19:15 -0700 (PDT)
Received: from ?10.0.0.19? (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	g31sm3545816rvb.56.2009.08.03.19.19.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 03 Aug 2009 19:19:15 -0700 (PDT)
Message-ID: <4A779A94.6080305@gmail.com>
Date: Tue, 04 Aug 2009 11:49:00 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] Fix libgcrypt compilation with GCC-4.4 on mips
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
X-List-Received-Date: Tue, 04 Aug 2009 02:34:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

01234567890123456789012345678901234567890123456789012345678901234567890123456789

Patch taken from https://forum.openwrt.org/viewtopic.php?id=20520
Makes sense and seems to work ok.

libgcrypt.inc has --disable-asm in EXTRA_OECONF, yet strangely the configure
script does nothing with this information beyond parsing it. Assembler is
certainly still being used.

-Graham

diff --git a/recipes/libgcrypt/files/mips-h-constraint.patch b/recipes/libgcrypt/files/mips-h-constraint.patch
new file mode 100644
index 0000000..20566bc
--- /dev/null
+++ b/recipes/libgcrypt/files/mips-h-constraint.patch
@@ -0,0 +1,70 @@
+The MIPS port for GCC-4.4 no longer recognizes the h asm constraint.
+Patch from: https://forum.openwrt.org/viewtopic.php?id=20520
+
+--- libgcrypt/mpi/longlong.h-asdf	2009-08-04 09:58:51.000000000 +0930
++++ libgcrypt/mpi/longlong.h	2009-08-04 10:10:27.000000000 +0930
+@@ -710,18 +710,35 @@
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
++    UDItype __ll = (UDItype)(u) * (v);                                 \
++    w1 = __ll >> 32;                                                   \
++    w0 = __ll;                                                         \
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
+@@ -739,14 +756,24 @@
+  **************  MIPS/64  **************
+  ***************************************/
+ #if (defined (__mips) && __mips >= 3) && W_TYPE_SIZE == 64
+-#if __GNUC__ > 2 || __GNUC_MINOR__ >= 7
++#if __GNUC_PREREQ (4,4)
++#define umul_ppmm(w1, w0, u, v) \
++  do {                                                                 \
++    typedef unsigned int __ll_UTItype __attribute__((mode(TI)));       \
++    __ll_UTItype __ll = (__ll_UTItype)(u) * (v);                       \
++    w1 = __ll >> 64;                                                   \
++    w0 = __ll;                                                         \
++  } while (0)
++#endif
++#if !defined (umul_ppmm) && __GNUC_PREREQ (2,7)
+ #define umul_ppmm(w1, w0, u, v) \
+   __asm__ ("dmultu %2,%3"                                               \
+ 	   : "=l" ((UDItype)(w0)),                                      \
+ 	     "=h" ((UDItype)(w1))                                       \
+ 	   : "d" ((UDItype)(u)),                                        \
+ 	     "d" ((UDItype)(v)))
+-#else
++#endif
++#if !defined (umul_ppmm)
+ #define umul_ppmm(w1, w0, u, v) \
+   __asm__ ("dmultu %2,%3 \n"    \
+ 	   "mflo %0 \n"         \
diff --git a/recipes/libgcrypt/libgcrypt.inc b/recipes/libgcrypt/libgcrypt.inc
index 691f4fe..4f78a0f 100644
--- a/recipes/libgcrypt/libgcrypt.inc
+++ b/recipes/libgcrypt/libgcrypt.inc
@@ -5,7 +5,8 @@ LICENSE = "GPL LGPL FDL"
 DEPENDS = "libgpg-error"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${PV}.tar.gz \
-           file://add-pkgconfig-support.patch;patch=1"
+           file://add-pkgconfig-support.patch;patch=1 \
+	   file://mips-h-constraint.patch;patch=1"
 
 inherit autotools binconfig pkgconfig lib_package
 


