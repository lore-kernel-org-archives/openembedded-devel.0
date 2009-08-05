Received: from [209.85.222.193] (helo=mail-pz0-f193.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MYVpb-0003Kg-FT
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Aug 2009 04:02:19 +0200
Received: by pzk31 with SMTP id 31so4706365pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Aug 2009 18:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=j9eaeHpni7r8+pE4mTdad0WzLaB5gaoZhkgh75FSQmQ=;
	b=GTqUzyXfB/U6cxaQ25KDdj+UGJZM9PfvgqUOXl//4GZog1C6dfEsiBadJdswd9ak14
	iL2bgduxFfJunFxRzQrX7JQiLTdV7b/nOa1YrepPUhCSHEgBOS3bdBe8IDcRqf9sP7YT
	ouz3ISxVTsrfX1b+1FJhbCi3VneCSRVyp4GmU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=l57WU4WcBHS/8y/bJQ5q0MRI+kp/2yDIWDAOZTSB1jqWUYf+OzVvz+LCW0eqGU+7AV
	5lmqiUgJc8Ftb69iw1fz/uB39ytVKENJnRWo12bpVUOW9h3ZNOjaGyjMfhTR/jB5/HAu
	b1tME0Xb/5ghZM5dKepx9qxXAIZ7cohP4Yvbg=
Received: by 10.114.158.6 with SMTP id g6mr10896119wae.145.1249436798660;
	Tue, 04 Aug 2009 18:46:38 -0700 (PDT)
Received: from ?10.0.0.19? (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	l37sm12636590waf.40.2009.08.04.18.46.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 04 Aug 2009 18:46:37 -0700 (PDT)
Message-ID: <4A78E474.1030607@gmail.com>
Date: Wed, 05 Aug 2009 11:16:28 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] fix libmad compilation with GCC-4.4 on mips
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
X-List-Received-Date: Wed, 05 Aug 2009 02:02:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Fix build failure due to removal of the h asm constraint in GCC-4.4 mips port.

-Graham

diff --git a/recipes/libmad/files/mad-mips-h-constraint.patch b/recipes/libmad/files/mad-mips-h-constraint.patch
new file mode 100644
index 0000000..b65555e
--- /dev/null
+++ b/recipes/libmad/files/mad-mips-h-constraint.patch
@@ -0,0 +1,70 @@
+diff -ur libmad-0.15.1b-orig/fixed.h libmad-0.15.1b/fixed.h
+--- libmad-0.15.1b-orig/fixed.h	2004-02-17 12:32:03.000000000 +1030
++++ libmad-0.15.1b/fixed.h	2009-08-05 10:46:30.000000000 +0930
+@@ -299,6 +299,23 @@
+ 
+ # elif defined(FPM_MIPS)
+ 
++/* Test for gcc >= maj.min, as per __GNUC_PREREQ in glibc */
++#if defined (__GNUC__) && defined (__GNUC_MINOR__)
++#define __GNUC_PREREQ(maj, min) \
++	((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))
++#else
++#define __GNUC_PREREQ(maj, min)  0
++#endif
++
++#if __GNUC_PREREQ(4,4)
++  typedef unsigned int u64_di_t __attribute__ ((mode (DI)));
++# define MAD_F_MLX(hi, lo, x, y) \
++   do { \
++      u64_di_t __ll = (u64_di_t) (x) * (y); \
++      hi = __ll >> 32; \
++      lo = __ll; \
++   } while (0) 
++#else
+ /*
+  * This MIPS version is fast and accurate; the disposition of the least
+  * significant bit depends on OPT_ACCURACY via mad_f_scale64().
+@@ -328,6 +345,7 @@
+ 	 : "%r" ((x) >> 12), "r" ((y) >> 16))
+ #  define MAD_F_MLZ(hi, lo)  ((mad_fixed_t) (lo))
+ # endif
++#endif /* __GNU_PREREQ(4,4) */
+ 
+ # if defined(OPT_SPEED)
+ #  define mad_f_scale64(hi, lo)  \
+diff -ur libmad-0.15.1b-orig/mad.h libmad-0.15.1b/mad.h
+--- libmad-0.15.1b-orig/mad.h	2004-02-17 13:25:44.000000000 +1030
++++ libmad-0.15.1b/mad.h	2009-08-05 10:42:40.000000000 +0930
+@@ -344,6 +344,23 @@
+ 
+ # elif defined(FPM_MIPS)
+ 
++/* Test for gcc >= maj.min, as per __GNUC_PREREQ in glibc */
++#if defined (__GNUC__) && defined (__GNUC_MINOR__)
++#define __GNUC_PREREQ(maj, min) \
++	((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))
++#else
++#define __GNUC_PREREQ(maj, min)  0
++#endif
++
++#if __GNUC_PREREQ(4,4)
++  typedef unsigned int u64_di_t __attribute__ ((mode (DI)));
++# define MAD_F_MLX(hi, lo, x, y) \
++   do { \
++      u64_di_t __ll = (u64_di_t) (x) * (y); \
++      hi = __ll >> 32; \
++      lo = __ll; \
++   } while (0) 
++#else
+ /*
+  * This MIPS version is fast and accurate; the disposition of the least
+  * significant bit depends on OPT_ACCURACY via mad_f_scale64().
+@@ -373,6 +390,7 @@
+ 	 : "%r" ((x) >> 12), "r" ((y) >> 16))
+ #  define MAD_F_MLZ(hi, lo)  ((mad_fixed_t) (lo))
+ # endif
++#endif /* __GNU_PREREQ(4,4) */
+ 
+ # if defined(OPT_SPEED)
+ #  define mad_f_scale64(hi, lo)  \
diff --git a/recipes/libmad/libmad_0.15.1b.bb b/recipes/libmad/libmad_0.15.1b.bb
index 4a75c2d..738dcc2 100644
--- a/recipes/libmad/libmad_0.15.1b.bb
+++ b/recipes/libmad/libmad_0.15.1b.bb
@@ -7,7 +7,8 @@ PR = "r4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/mad/libmad-${PV}.tar.gz \
            file://add-pkgconfig.patch;patch=1 \
-	   file://mad.diff;patch=1 "
+	   file://mad.diff;patch=1 \
+	   file://mad-mips-h-constraint.patch;patch=1"
 
 S = "${WORKDIR}/libmad-${PV}"
 


