Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 812B7C6FA8B
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:54 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.11375.1662276880309196795
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xn5lPB/R;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id f24so5799741plr.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=yj7R0ve/q1qFFOwZCa8+f3OD9eIZCJf6QQIZ5Oo5KBo=;
        b=Xn5lPB/RCIWuLYTfV+Fe7LGHZrmeFl2vX0XwizlEpbbaRRr8GtbuRRbGBdyDPVgHNl
         AYKW6GjLzidOyve3TBWJd03g1hvkkQ8iU8g7niQPCugwa74W51QeoMgyBbYbi72sb2XJ
         3v4kb+6vNND7qhEgXhtDedZ/GHll2OWPcE6teLSgA/bngxARDwJLZz5ZAB+/ToeKX2yV
         JQk5CX/S/x86hgeee2pANdHfDUqjbxMoICDO2eW32NkLnjnnt6wo9HR2aeJOLnwg5bvs
         NDKsHn5ZvFg8weCSvBqHXGVaF6K6e31VQ8B82Y3ObZKtg7j7kuJhN5Y4gLxkuqFuMl6/
         l4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=yj7R0ve/q1qFFOwZCa8+f3OD9eIZCJf6QQIZ5Oo5KBo=;
        b=V0KoagxmSLI/sLHdrgVSD1ORPkce928pZM67+GaV0CQJNMoqWvXDozTk5s39j6PQxO
         bQGSHdmQq8/e4h+sJejJJBxl2PCLaf3vpUSywzQeuyb8z0kBFMFGZY47ZLatmlwn9ORC
         KxkcF6V2fXHMpSyNJUCxZXGhKlAWMT9gAXIXt/tjXEh1g6MOugz7upPV6hibIGbeEzXg
         ZPPMH4W5wX/1eBzpzGh1KzpBUq+rqLQWavcxnoD8PhF3+VS5EWqQC0w8NI7McpY46B4g
         fEW2hU1QmTTY6zAe1gKQ/jfct7KNLWxKwTFWa3zY4EfTf2d9oJPWU091pc5qulx2/NdD
         1OYg==
X-Gm-Message-State: ACgBeo104VqhmzAVE2wPnHPWv6g9JYteKLc2EJ3MEAuy6B1prQy5MyMw
	5qgCMiiat3DEx8Ic/2pSb6zl1fH+dHZVsg==
X-Google-Smtp-Source: 
 AA6agR4tnqV7B7tCWJvBPLBa7D2zo5GwwHKq6mMGDL0KYTQWtpQoDBh/BUGlAxT6H2K2A2bjILMkMw==
X-Received: by 2002:a17:90a:9a9:b0:1f6:a38b:e0bc with SMTP id
 38-20020a17090a09a900b001f6a38be0bcmr13623903pjo.212.1662276884532;
        Sun, 04 Sep 2022 00:34:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 23/63] sblim-sfcb: Fix AC_CHECK_LIB tests for various
 libraries
Date: Sun,  4 Sep 2022 00:33:37 -0700
Message-Id: <20220904073417.3251865-23-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98617

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...for-function-from-respective-library.patch | 72 +++++++++++++++++++
 .../sblim-sfcb/sblim-sfcb_1.4.9.bb            |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-configure-Check-for-function-from-respective-library.patch

diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-configure-Check-for-function-from-respective-library.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-configure-Check-for-function-from-respective-library.patch
new file mode 100644
index 0000000000..5ee368f6ee
--- /dev/null
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-configure-Check-for-function-from-respective-library.patch
@@ -0,0 +1,72 @@
+From 366c4a1c8b7724241ad2b703e48615ca5affa32e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 1 Sep 2022 12:46:07 -0700
+Subject: [PATCH] configure: Check for function from respective library in
+ AC_CHECK_LIB
+
+This helps in doing correct checks especially with newer autoconf and
+toolchain
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d4915a1..6154514 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -332,8 +332,8 @@ if [test "$enable_tests"]; then
+ fi
+ 
+ if [test "$test_gcov" == "yes"]; then
+-    AC_CHECK_LIB(gcc,main)
+-    AC_CHECK_LIB(gcov,main)
++    AC_CHECK_LIB(gcc,_Unwind_GetIP)
++    AC_CHECK_LIB(gcov,gcov_write_summary)
+     AC_PATH_PROG(LCOV,lcov,yes,no)
+     AC_PATH_PROG(GENHTML,genhtml,yes,no)
+     if test "$LCOV" == "no" -o "$GENHTML" == "no" ; then
+@@ -400,7 +400,7 @@ fi
+ 
+ if test "$enable_pam" == "yes"; then
+    AC_DEFINE(HAVE_PAM,,[PAM support enabled.])
+-   AC_CHECK_LIB(pam,main,[SFCB_LIBPAM=-lpam],[AC_MSG_ERROR(Could not find required pam library.)])
++   AC_CHECK_LIB(pam,pam_start,[SFCB_LIBPAM=-lpam],[AC_MSG_ERROR(Could not find required pam library.)])
+    SFCB_CONF_BASICAUTHLIB=sfcBasicPAMAuthentication   
+    SFCB_CONF_DOBASICAUTH=true
+ else
+@@ -470,16 +470,16 @@ if test "$HAVE_UNZIP" = "no" ; then
+ fi
+ 
+ # Checks for libraries.
+-AC_CHECK_LIB(pthread,main)
+-AC_CHECK_LIB(dl,main)
+-AC_CHECK_LIB(z,main,[SFCB_LIBZ=-lz],[AC_MSG_ERROR([Could not find required libz])])
++AC_CHECK_LIB(pthread,pthread_create)
++AC_CHECK_LIB(dl,dlopen)
++AC_CHECK_LIB(z,inflate,[SFCB_LIBZ=-lz],[AC_MSG_ERROR([Could not find required libz])])
+ # Test for the newest function here to make sure it's up to date.
+ AC_CHECK_LIB(sfcUtil,invalid_uint,, \
+   [AC_MSG_ERROR([Function invalid_uint not found. Is the required version of sfcCommon installed?])])
+ if test "$enable_indications" = "yes" ; then
+    LOAD_INDICATION_PROVIDER=
+    AC_DEFINE(HAVE_INDICATIONS,1,[Indication support enabled.])
+-   AC_CHECK_LIB(curl,main)
++   AC_CHECK_LIB(curl,curl_easy_init)
+ else
+    LOAD_INDICATION_PROVIDER='#'
+ fi
+@@ -487,7 +487,7 @@ fi
+ AC_SUBST(LOAD_INDICATION_PROVIDER)
+ 
+ if test "$enable_ssl" = "yes"; then
+-   AC_CHECK_LIB(ssl,main)
++   AC_CHECK_LIB(ssl,SSL_CTX_new)
+    SFCB_CONF_HTTPS=true
+    SFCB_CONF_HTTP=false
+ else
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index 4b9ae4758f..5f398fb0d2 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://downloads.sourceforge.net/sblim/${BP}.tar.bz2 \
            file://0001-Replace-need-for-error.h-when-it-does-not-exist.patch \
            file://sblim-sfcb-1.4.9-fix-sfcbinst2mof.patch \
            file://0001-Avoid-variable-definition-in-header-files.patch \
+           file://0001-configure-Check-for-function-from-respective-library.patch \
 "
 
 SRC_URI[md5sum] = "28021cdabc73690a94f4f9d57254ce30"
-- 
2.37.3


