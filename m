Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PdVPr-0001Vw-9H
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 23:13:11 +0100
Received: by mail-fx0-f47.google.com with SMTP id 17so2115873fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 14:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=FdmXTA9ZwsviVex4gLwx0QupS5lEKbX5VxXjYOBvjJo=;
	b=O25wRe6k0u/bCsXOw1dMmiEWdp1l3UOsEQbWoqwIkSUjzrBhoN/ABI/hWpkFbKXcqc
	J5gx6AN2QMITmNKg3z3RQvp5BFxmDZsZwMtBNmynM5PXNmXVbezcVqbM71dSFnmffCKN
	5bOw8x9vPs9j8F0RxekFCcqHwBwuAQP6NXkfs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=FsgHhJAsT8ISIp3r09Api7viRjI23b9c3O8S4AVP7A93K6RZbATWv173R84wLx9rYo
	7yH2Lnyl/XEck72OtcJp3Q1JJGkSAhXYDAPLJoBxF2ki1tuD/Zb4VLxUgjNLzqiizcAo
	y5BX5jGcJ2S/ZvmvulnkIpcN1FmxZAZf4gMFU=
Received: by 10.223.86.16 with SMTP id q16mr2918942fal.58.1294956733251;
	Thu, 13 Jan 2011 14:12:13 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id n3sm268622faa.29.2011.01.13.14.12.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 13 Jan 2011 14:12:11 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PdVOr-0008R1-Tw; Thu, 13 Jan 2011 23:12:09 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jan 2011 23:12:08 +0100
Message-Id: <1294956728-32390-4-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1294956728-32390-1-git-send-email-rep.dot.nop@gmail.com>
References: <1294956728-32390-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 3/3] gcc-svn: redo patch: Handle uClibc locale
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
X-List-Received-Date: Thu, 13 Jan 2011 22:13:11 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 .../gcc-uclibc-locale-ctype_touplow_t.patch        |  126 ++++++++++++++------
 1 files changed, 88 insertions(+), 38 deletions(-)

diff --git a/recipes/gcc/gcc-svn/gcc-uclibc-locale-ctype_touplow_t.patch b/recipes/gcc/gcc-svn/gcc-uclibc-locale-ctype_touplow_t.patch
index ffb37d2..d525dd2 100644
--- a/recipes/gcc/gcc-svn/gcc-uclibc-locale-ctype_touplow_t.patch
+++ b/recipes/gcc/gcc-svn/gcc-uclibc-locale-ctype_touplow_t.patch
@@ -1,52 +1,102 @@
-Index: gcc-4.4.1/libstdc++-v3/config/locale/generic/c_locale.h
-===================================================================
---- gcc-4.4.1.orig/libstdc++-v3/config/locale/generic/c_locale.h	2009-08-06 23:38:32.398265633 -0700
-+++ gcc-4.4.1/libstdc++-v3/config/locale/generic/c_locale.h	2009-08-06 23:41:09.778242281 -0700
-@@ -41,12 +41,17 @@
- 
- #include <clocale>
- #include <cstddef>
-+#include <features.h> 
-+#include <ctype.h> 
- 
+From 66c29e5dc346d0ea5f426705f46d36f36e057a68 Mon Sep 17 00:00:00 2001
+From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+Date: Tue, 4 Jan 2011 10:29:53 +0100
+Subject: [PATCH 19/20] libstdc++-v3: handle uClibc locale
+
+libstdc++-v3/ChangeLog:
+
+2010-01-03  Bernhard Reutner-Fischer  <aldot@gcc.gnu.org>
+
+	* config/locale/generic/c_locale.h: Handle uClibc locale.
+	* config/os/gnu-linux/ctype_base.h: Likewise.
+	* include/c/clocale: Include ctype.h for uClibc.
+	* include/c_global/clocale: Likewise.
+	* include/c_std/clocale: Likewise.
+
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+---
+ libstdc++-v3/config/locale/generic/c_locale.h |    5 ++++-
+ libstdc++-v3/config/os/gnu-linux/ctype_base.h |    4 ++++
+ libstdc++-v3/include/c/clocale                |    3 +++
+ libstdc++-v3/include/c_global/clocale         |    3 +++
+ libstdc++-v3/include/c_std/clocale            |    4 ++++
+ 5 files changed, 18 insertions(+), 1 deletions(-)
+
+diff --git a/libstdc++-v3/config/locale/generic/c_locale.h b/libstdc++-v3/config/locale/generic/c_locale.h
+index 7d685b8..4f69857 100644
+--- a/libstdc++-v3/config/locale/generic/c_locale.h
++++ b/libstdc++-v3/config/locale/generic/c_locale.h
+@@ -44,8 +44,11 @@
  #define _GLIBCXX_NUM_CATEGORIES 0
  
  _GLIBCXX_BEGIN_NAMESPACE(std)
 -
--  typedef int*			__c_locale;
-+#ifdef __UCLIBC__ 
-+   typedef __ctype_touplow_t*   __c_locale; 
-+#else 
-+   typedef int*         __c_locale; 
-+#endif 
++#ifdef __UCLIBC__
++  typedef __ctype_touplow_t* __c_locale;
++#else
+   typedef int*			__c_locale;
++#endif
  
    // Convert numeric value of type double and long double to string and
    // return length of string.  If vsnprintf is available use it, otherwise
-Index: gcc-4.4.1/libstdc++-v3/config/os/gnu-linux/ctype_base.h
-===================================================================
---- gcc-4.4.1.orig/libstdc++-v3/config/os/gnu-linux/ctype_base.h	2009-08-06 23:42:27.402242608 -0700
-+++ gcc-4.4.1/libstdc++-v3/config/os/gnu-linux/ctype_base.h	2009-08-06 23:43:44.842241959 -0700
-@@ -33,14 +33,21 @@
-  */
- 
- // Information as gleaned from /usr/include/ctype.h
--  
-+
-+#include <features.h> 
-+#include <ctype.h> 
-+
- _GLIBCXX_BEGIN_NAMESPACE(std)
- 
-   /// @brief  Base class for ctype.
+diff --git a/libstdc++-v3/config/os/gnu-linux/ctype_base.h b/libstdc++-v3/config/os/gnu-linux/ctype_base.h
+index ff1f157..e88f569 100644
+--- a/libstdc++-v3/config/os/gnu-linux/ctype_base.h
++++ b/libstdc++-v3/config/os/gnu-linux/ctype_base.h
+@@ -40,7 +40,11 @@ _GLIBCXX_BEGIN_NAMESPACE(std)
    struct ctype_base
    {
      // Non-standard typedefs.
--    typedef const int* 		__to_type;
-+#ifdef __UCLIBC__ 
-+    typedef const __ctype_touplow_t*   __to_type; 
-+#else 
-+    typedef const int*         __to_type; 
++#ifdef __UCLIBC__
++    typedef const __ctype_touplow_t* __to_type;
++#else
+     typedef const int* 		__to_type;
 +#endif
  
      // NB: Offsets into ctype<char>::_M_table force a particular size
      // on the mask type. Because of this, we don't use an enum.
+diff --git a/libstdc++-v3/include/c/clocale b/libstdc++-v3/include/c/clocale
+index 7ea60f0..619f128 100644
+--- a/libstdc++-v3/include/c/clocale
++++ b/libstdc++-v3/include/c/clocale
+@@ -32,5 +32,8 @@
+ #pragma GCC system_header
+ 
+ #include_next <locale.h>
++#ifdef __UCLIBC__
++#include <ctype.h>
++#endif
+ 
+ #endif
+diff --git a/libstdc++-v3/include/c_global/clocale b/libstdc++-v3/include/c_global/clocale
+index 7cf42e2..cd9b37a 100644
+--- a/libstdc++-v3/include/c_global/clocale
++++ b/libstdc++-v3/include/c_global/clocale
+@@ -42,6 +42,9 @@
+ 
+ #include <bits/c++config.h>
+ #include <locale.h>
++#ifdef __UCLIBC__
++#include <ctype.h>
++#endif
+ 
+ #ifndef _GLIBCXX_CLOCALE
+ #define _GLIBCXX_CLOCALE 1
+diff --git a/libstdc++-v3/include/c_std/clocale b/libstdc++-v3/include/c_std/clocale
+index 36d8bd7..7905d5d 100644
+--- a/libstdc++-v3/include/c_std/clocale
++++ b/libstdc++-v3/include/c_std/clocale
+@@ -45,6 +45,10 @@
+ #include <bits/c++config.h>
+ #include <locale.h>
+ 
++#ifdef __UCLIBC__
++#include <ctype.h>
++#endif
++
+ // Get rid of those macros defined in <locale.h> in lieu of real functions.
+ #undef setlocale
+ #undef localeconv
+-- 
+1.7.2.3
+
-- 
1.7.2.3



