Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OgeOD-0007HD-Qz
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 15:52:39 +0200
Received: by fxm12 with SMTP id 12so2472844fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 06:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=t2K/bQMf9dhxSUKzDJrhuDuFr7BjrUbkHCIyIFdFYbM=;
	b=MYHbqNvhUJG4EUGEsEr9vmraUUvDPu3yeyymxrpImht3FRp9pepJR1QI+84XK52TMo
	Q8XnzJXABnXjgxFnyustBP4NOsO5i51bCTihsuOTvU7Sb6vJ193XDUjsnbtpXXGJgxbN
	q7x+7RxCO/6Lj5GoV+fLBPdBqgwO8j3GP/yvk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=iYyxhv1HsVTZfY912wQH2It9qm4BQgauYS8/D/w2IH58WUBsmYfrihiZVPrWyYwwU/
	lN0LEqs7MOYcvMAkIzG5ZQ/3KOMvA2h1edRbkhHVdtBj8wg7Iz0gt9u4NHs9/CScvtXs
	xCsij2AHxVVZI/y5eCAmIIzGbZQayLqS+au2g=
Received: by 10.223.122.195 with SMTP id m3mr8932968far.86.1280929929799;
	Wed, 04 Aug 2010 06:52:09 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id e20sm2968365fak.47.2010.08.04.06.52.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 06:52:06 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OgeO0-0006E0-5q; Wed, 04 Aug 2010 15:52:00 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Aug 2010 15:51:58 +0200
Message-Id: <1280929918-23818-3-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1280929918-23818-1-git-send-email-rep.dot.nop@gmail.com>
References: <1280929918-23818-1-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/3] openssl: properly handle ipv6 and largefile
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
X-List-Received-Date: Wed, 04 Aug 2010 13:52:40 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/openssl/openssl-0.9.8m/ipv6.patch       |   34 +++++++++++++++++++++++
 recipes/openssl/openssl-0.9.8m/uclibc-lfs.patch |   24 ++++++++++++++++
 recipes/openssl/openssl-1.0.0/uclibc-lfs.patch  |   25 +++++++++++++++++
 recipes/openssl/openssl-native_0.9.8m.bb        |    3 +-
 recipes/openssl/openssl-native_1.0.0.bb         |    1 +
 recipes/openssl/openssl_0.9.8m.bb               |    4 ++-
 recipes/openssl/openssl_1.0.0.bb                |    1 +
 7 files changed, 90 insertions(+), 2 deletions(-)
 create mode 100644 recipes/openssl/openssl-0.9.8m/ipv6.patch
 create mode 100644 recipes/openssl/openssl-0.9.8m/uclibc-lfs.patch
 create mode 100644 recipes/openssl/openssl-1.0.0/uclibc-lfs.patch

diff --git a/recipes/openssl/openssl-0.9.8m/ipv6.patch b/recipes/openssl/openssl-0.9.8m/ipv6.patch
new file mode 100644
index 0000000..05df761
--- /dev/null
+++ b/recipes/openssl/openssl-0.9.8m/ipv6.patch
@@ -0,0 +1,34 @@
+diff -rdup openssl-0.9.8m.old1/crypto/bio/bss_dgram.c openssl-0.9.8m/crypto/bio/bss_dgram.c
+--- openssl-0.9.8m.old1/crypto/bio/bss_dgram.c	2009-09-22 13:33:58.000000000 +0200
++++ openssl-0.9.8m/crypto/bio/bss_dgram.c	2010-08-03 10:04:03.716585233 +0200
+@@ -429,12 +429,14 @@ static long dgram_ctrl(BIO *b, int cmd,
+ 				&sockopt_val, sizeof(sockopt_val))) < 0)
+ 				perror("setsockopt");
+ 			break;
++#if defined _POSIX_IPV6
+ 		case AF_INET6:
+ 			sockopt_val = IPV6_PMTUDISC_DO;
+ 			if ((ret = setsockopt(b->num, IPPROTO_IPV6, IPV6_MTU_DISCOVER,
+ 				&sockopt_val, sizeof(sockopt_val))) < 0)
+ 				perror("setsockopt");
+ 			break;
++#endif
+ 		default:
+ 			ret = -1;
+ 			break;
+@@ -470,6 +472,7 @@ static long dgram_ctrl(BIO *b, int cmd,
+ 				ret = data->mtu;
+ 				}
+ 			break;
++#if defined _POSIX_IPV6
+ 		case AF_INET6:
+ 			if ((ret = getsockopt(b->num, IPPROTO_IPV6, IPV6_MTU, (void *)&sockopt_val,
+ 				&sockopt_len)) < 0 || sockopt_val < 0)
+@@ -485,6 +488,7 @@ static long dgram_ctrl(BIO *b, int cmd,
+ 				ret = data->mtu;
+ 				}
+ 			break;
++#endif
+ 		default:
+ 			ret = 0;
+ 			break;
diff --git a/recipes/openssl/openssl-0.9.8m/uclibc-lfs.patch b/recipes/openssl/openssl-0.9.8m/uclibc-lfs.patch
new file mode 100644
index 0000000..c91bea8
--- /dev/null
+++ b/recipes/openssl/openssl-0.9.8m/uclibc-lfs.patch
@@ -0,0 +1,24 @@
+diff -rdup openssl-0.9.8m.old/crypto/bio/bss_file.c openssl-0.9.8m/crypto/bio/bss_file.c
+--- openssl-0.9.8m.old/crypto/bio/bss_file.c	2009-10-04 16:04:36.000000000 +0200
++++ openssl-0.9.8m/crypto/bio/bss_file.c	2010-07-30 15:21:51.436093098 +0200
+@@ -65,6 +65,7 @@
+ #ifndef HEADER_BSS_FILE_C
+ #define HEADER_BSS_FILE_C
+ 
++#include <features.h>
+ #if defined(__linux) || defined(__sun) || defined(__hpux)
+ /* Following definition aliases fopen to fopen64 on above mentioned
+  * platforms. This makes it possible to open and sequentially access
+@@ -78,10 +79,12 @@
+  * sequential access of large files without extra "magic" comprise *BSD,
+  * Darwin, IRIX...
+  */
++#if (defined __UCLIBC__ && defined __UCLIBC_HAS_LFS__) || !defined __UCLIBC__
+ #ifndef _FILE_OFFSET_BITS
+ #define _FILE_OFFSET_BITS 64
+ #endif
+ #endif
++#endif
+ 
+ #include <stdio.h>
+ #include <errno.h>
diff --git a/recipes/openssl/openssl-1.0.0/uclibc-lfs.patch b/recipes/openssl/openssl-1.0.0/uclibc-lfs.patch
new file mode 100644
index 0000000..664bbc0
--- /dev/null
+++ b/recipes/openssl/openssl-1.0.0/uclibc-lfs.patch
@@ -0,0 +1,25 @@
+diff -rdup openssl-1.0.0.orig/crypto/bio/bss_file.c openssl-1.0.0/crypto/bio/bss_file.c
+--- openssl-1.0.0.orig/crypto/bio/bss_file.c	2010-03-22 23:39:46.000000000 +0100
++++ openssl-1.0.0/crypto/bio/bss_file.c	2010-08-02 19:17:26.642347341 +0200
+@@ -65,6 +65,8 @@
+ #ifndef HEADER_BSS_FILE_C
+ #define HEADER_BSS_FILE_C
+ 
++#include <features.h>
++
+ #if defined(__linux) || defined(__sun) || defined(__hpux)
+ /* Following definition aliases fopen to fopen64 on above mentioned
+  * platforms. This makes it possible to open and sequentially access
+@@ -78,10 +80,12 @@
+  * sequential access of large files without extra "magic" comprise *BSD,
+  * Darwin, IRIX...
+  */
++#if (defined __UCLIBC__ && defined __UCLIBC_HAS_LFS__) || !defined __UCLIBC__
+ #ifndef _FILE_OFFSET_BITS
+ #define _FILE_OFFSET_BITS 64
+ #endif
+ #endif
++#endif
+ 
+ #include <stdio.h>
+ #include <errno.h>
diff --git a/recipes/openssl/openssl-native_0.9.8m.bb b/recipes/openssl/openssl-native_0.9.8m.bb
index 1b82645..53ec4f6 100644
--- a/recipes/openssl/openssl-native_0.9.8m.bb
+++ b/recipes/openssl/openssl-native_0.9.8m.bb
@@ -12,7 +12,8 @@ export BUILD_OPTIMIZATION = " "
 
 SRC_URI += "file://configure-targets.patch \
             file://shared-libs.patch \
-            file://debian.patch"
+            file://debian.patch \
+            file://uclibc-lfs.patch"
 
 PARALLEL_MAKE = ""
 
diff --git a/recipes/openssl/openssl-native_1.0.0.bb b/recipes/openssl/openssl-native_1.0.0.bb
index 7029bfe..7507c37 100644
--- a/recipes/openssl/openssl-native_1.0.0.bb
+++ b/recipes/openssl/openssl-native_1.0.0.bb
@@ -18,6 +18,7 @@ SRC_URI += "file://configure-targets.patch \
             file://shared-libs.patch \
             file://debian.patch \
 	    file://libdeps-first.patch \
+            file://uclibc-lfs.patch \
 	   "
 
 PARALLEL_MAKE = ""
diff --git a/recipes/openssl/openssl_0.9.8m.bb b/recipes/openssl/openssl_0.9.8m.bb
index a7eb332..6ee1929 100644
--- a/recipes/openssl/openssl_0.9.8m.bb
+++ b/recipes/openssl/openssl_0.9.8m.bb
@@ -11,6 +11,8 @@ export OE_LDFLAGS="${LDFLAGS}"
 SRC_URI += "file://configure-targets.patch \
             file://shared-libs.patch \
             file://debian.patch \
-            file://oe-ldflags.patch"
+            file://oe-ldflags.patch \
+            file://uclibc-lfs.patch \
+            file://ipv6.patch"
 
 PARALLEL_MAKE = ""
diff --git a/recipes/openssl/openssl_1.0.0.bb b/recipes/openssl/openssl_1.0.0.bb
index 4f7dcb7..a13d471 100644
--- a/recipes/openssl/openssl_1.0.0.bb
+++ b/recipes/openssl/openssl_1.0.0.bb
@@ -17,6 +17,7 @@ SRC_URI += "file://configure-targets.patch \
             file://oe-ldflags.patch \
 	    file://libdeps-first.patch \
 	    file://engines-install-in-libdir-ssl.patch \
+            file://uclibc-lfs.patch \
 	   "
 
 PARALLEL_MAKE = ""
-- 
1.7.1



