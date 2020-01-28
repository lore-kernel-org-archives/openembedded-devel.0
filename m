Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id BB9307F978
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 01:52:40 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id t2so14134342wrr.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 17:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4mZYp8i+ofwoXpl4JDlba+V4hd4ghnA8VvJXiQbY1VI=;
	b=Or04ImdCR8Aq8yF+drw8+ANaW7z+8E/cYQIJ/XGAueg8mSb77AsAsAEU/EYr1++SnT
	eniNH4AKLJVUMD3QnSj6wqZ+WgCFF41tK7OV+6fNGqMWyYcnTZBJcg9RJ2Zzty0fav/g
	jyYrk3nC9hgTE5rwD7hyjr+UGAPsj+rgenvICjYSErYdVKhXrWMorCttLJjle5NMYX1e
	Ev4/kV17Ap3Tc4BIexPjChU2Xzq5oPig8U1KC4W8fLeBK4ccV2nkCsrcCN8gn6fYFzWA
	YrIWMSTjdapWcFs/gRNYkRzfvZFzGV9lTY+As3xe9WUhp3GE6bSgQ78oMWZBh1NJL9Pq
	ystQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4mZYp8i+ofwoXpl4JDlba+V4hd4ghnA8VvJXiQbY1VI=;
	b=WAtsJAbpfiXquBmXK/pVMQTsE3FoQpuRVO+UTYQgSOvO/OqFPSYYzb9VUAimIGDJQd
	FNcZa1RaFzvny433RML3uOG9wbII7nxiaFc3LUDXfBxz5ics4RJXxb2owIt9rgVpsm2d
	9TigF4FsgFdMFbWwR8Al1i2vwt/khaRtCjhX1AQo7GLWNGl62k65v6El/MIZv01LH9H8
	tOxieCYwHjo+yKEMtD5bXqTJVCfxwIp4KO5XDR4vrK8j4tWqh644/NCaSDAsfHwMrwJC
	qThPGUYfQHvpNw6lsUltGHxdV9z4bIKjhOqZhpyVK+reYhD0nGGSvBfS2p/ajH3wZH5E
	xDzQ==
X-Gm-Message-State: APjAAAWlqv6xrfLs6mCazhdB3W4RNZ6/gtISxmxNsIwqDErMBHquO1+h
	jvq1AhY8708fxMp6gq0PPQyX6KYg
X-Google-Smtp-Source: APXvYqyHvchTGWEqoeaZSMgjeL6nEG7h3UzAFZI61V7KsrlGhN/MYkDeSW+s+r1cP3YEYsvDDFmq7Q==
X-Received: by 2002:a5d:4602:: with SMTP id t2mr24066480wrq.37.1580176361087; 
	Mon, 27 Jan 2020 17:52:41 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id z19sm830956wmi.43.2020.01.27.17.52.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 17:52:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Jan 2020 02:52:34 +0100
Message-Id: <20200128015234.13000-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200128015234.13000-1-Martin.Jansa@gmail.com>
References: <20200128015234.13000-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] xmlsec1: search nspr header files in ${STAGING_INCDIR}/nspr
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Jan 2020 01:52:41 -0000
Content-Transfer-Encoding: 8bit

* the --with-nspr/--with-nss should be just ${prefix} as mentioned in:
  https://www.aleksey.com/pipermail/xmlsec/2005/007172.html
  remove the change-finding-path-of-nss.patch parts handling nspr and
  handling incorrect --with-nspr/--with-nss value in the recipe missing
  "/usr" prefix

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xmlsec1/change-finding-path-of-nss.patch  | 44 +------------------
 .../recipes-support/xmlsec1/xmlsec1_1.2.29.bb |  6 +--
 2 files changed, 5 insertions(+), 45 deletions(-)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/change-finding-path-of-nss.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/change-finding-path-of-nss.patch
index 1cec47fca0..1451ff5647 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/change-finding-path-of-nss.patch
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/change-finding-path-of-nss.patch
@@ -16,12 +16,8 @@ diff --git a/configure.ac b/configure.ac
 index 951b3eb..1fdeb0f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -866,10 +866,10 @@ MOZILLA_MIN_VERSION="1.4"
- NSS_CRYPTO_LIB="$XMLSEC_PACKAGE-nss"
- NSPR_PACKAGE=mozilla-nspr
- NSS_PACKAGE=mozilla-nss
--NSPR_INCLUDE_MARKER="nspr/nspr.h"
-+NSPR_INCLUDE_MARKER="nspr.h"
+@@ -866,7 +866,7 @@ MOZILLA_MIN_VERSION="1.4"
+ NSPR_INCLUDE_MARKER="nspr/nspr.h"
  NSPR_LIB_MARKER="libnspr4$shrext"
  NSPR_LIBS_LIST="-lnspr4 -lplds4 -lplc4"
 -NSS_INCLUDE_MARKER="nss/nss.h"
@@ -29,39 +25,3 @@ index 951b3eb..1fdeb0f 100644
  NSS_LIB_MARKER="libnss3$shrext"
  NSS_LIBS_LIST="-lnss3 -lsmime3"
  
-@@ -898,24 +898,24 @@ fi
- dnl Priority 1: User specifies the path to installation
- if test "z$NSPR_FOUND" = "zno" -a "z$with_nspr" != "z" -a "z$with_nspr" != "zyes" ; then
-     AC_MSG_CHECKING(for nspr library installation in "$with_nspr" folder)
--    if test -f "$with_nspr/include/$NSPR_INCLUDE_MARKER" -a -f "$with_nspr/lib/$NSPR_LIB_MARKER" ; then
--        NSPR_INCLUDE_PATH="$with_nspr/include"
--        NSPR_LIB_PATH="$with_nspr/lib"
-+    if test -f "$with_nspr/usr/include/$NSPR_INCLUDE_MARKER" -a -f "$with_nspr/${libdir}/$NSPR_LIB_MARKER" ; then
-+        NSPR_INCLUDE_PATH="$with_nspr/usr/include"
-+        NSPR_LIB_PATH="$with_nspr/${libdir}"
-         NSPR_FOUND="yes"
-         AC_MSG_RESULT([yes])
-     else
--        AC_MSG_ERROR([not found: "$with_nspr/include/$NSPR_INCLUDE_MARKER" and/or "$with_nspr/lib/$NSPR_LIB_MARKER" files don't exist), typo?])
-+        AC_MSG_ERROR([not found: "$with_nspr/usr/include/$NSPR_INCLUDE_MARKER" and/or "$with_nspr/${libdir}/$NSPR_LIB_MARKER" files don't exist), typo?])
-     fi
- fi
- if test "z$NSS_FOUND" = "zno" -a "z$with_nss" != "z" -a "z$with_nss" != "zyes" ; then
-     AC_MSG_CHECKING(for nss library installation in "$with_nss" folder)
--    if test -f "$with_nss/include/$NSS_INCLUDE_MARKER" -a -f "$with_nss/lib/$NSS_LIB_MARKER" ; then
--        NSS_INCLUDE_PATH="$with_nss/include"
--        NSS_LIB_PATH="$with_nss/lib"
-+    if test -f "$with_nss/usr/include/$NSS_INCLUDE_MARKER" -a -f "$with_nss/${libdir}/$NSS_LIB_MARKER" ; then
-+        NSS_INCLUDE_PATH="$with_nss/usr/include/nss3"
-+        NSS_LIB_PATH="$with_nss/${libdir}"
-         NSS_FOUND="yes"
-         AC_MSG_RESULT([yes])
-     else
--        AC_MSG_ERROR([not found: "$with_nss/include/$NSS_INCLUDE_MARKER" and/or "$with_nss/lib/$NSS_LIB_MARKER" files don't exist), typo?])
-+        AC_MSG_ERROR([not found: "$with_nss/usr/include/$NSS_INCLUDE_MARKER" and/or "$with_nss/${libdir}/$NSS_LIB_MARKER" files don't exist), typo?])
-     fi
- fi
- 
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.29.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.29.bb
index 40c585ee10..3e25e8d35f 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.29.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.29.bb
@@ -25,13 +25,13 @@ SRC_URI[sha256sum] = "b1d1deba966019930f608d1f2b95c40ca3450f1393bcd3a3c001a8ba1d
 
 inherit autotools-brokensep ptest pkgconfig
 
-CFLAGS += "-I${STAGING_INCDIR}/nspr4 -I${STAGING_INCDIR}/nss3"
-CPPFLAGS += "-I${STAGING_INCDIR}/nspr4 -I${STAGING_INCDIR}/nss3"
+#CFLAGS += "-I${STAGING_INCDIR}/nss3"
+#CPPFLAGS += "-I${STAGING_INCDIR}/nss3"
 
 PACKAGECONFIG ??= "gnutls libgcrypt nss openssl des"
 PACKAGECONFIG[gnutls] = ",,gnutls"
 PACKAGECONFIG[libgcrypt] = ",,libgcrypt"
-PACKAGECONFIG[nss] = "--with-nss=${STAGING_LIBDIR}/../.. --with-nspr=${STAGING_LIBDIR}/../..,,nss nspr"
+PACKAGECONFIG[nss] = "--with-nss=${STAGING_LIBDIR}/.. --with-nspr=${STAGING_LIBDIR}/..,,nss nspr"
 PACKAGECONFIG[openssl] = ",,openssl"
 PACKAGECONFIG[des] = ",--disable-des,,"
 
-- 
2.20.1


