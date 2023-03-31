Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6EE3C761AF
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 15:47:29 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.58626.1680277648471471086
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Mar 2023 08:47:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qa2wYJy5;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id le6so21586999plb.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 08:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680277647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38kr+Ytsc6Fze/dP6FHbo5xFbaT07rQKUslgOapSXZE=;
        b=Qa2wYJy5Z4iiUsb/ZwzI+y/ZtKdeWbF1yCwBxnTtmHfCvqE/SCnd53RG0JI6yOj9k6
         9bGXcKxNs8X580UXVC9IoBQ1UyXnrGhYwtmTk8Drpj1bmb4cDpuxCTUD3h470IX8cqK8
         Ehy7Hwn9Pvq7TuieoqQJQWDvzqCTAl2zMs9G9cxvQGChHEE3hqBGjyMXgCoIbEBr93gV
         2L91+FWPdypeKcdi5hH/lrutcdSa8j7Col7YIx15kWnPk35xWuvMWrkeJidVTPquyEip
         6stppZbxrcILUv/gKp7/4MCyNkP2rkfzkrEFqnL7ywlR0MWfW/H662CvIh/xi+9580wD
         97mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680277647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38kr+Ytsc6Fze/dP6FHbo5xFbaT07rQKUslgOapSXZE=;
        b=fmykHtJ+gIcIPxmehFI7Gfe76XSnenVvsj7qgK40QeTeSVA5wwW3/Q0pWgAzX/JKd+
         UKcGkIwbs41ta0j62VEwpWhkUxSgwn6fnpVkZEs8n2PKVKvIwk9d7Bf0eUawWIXbvSEi
         XHSVsGbWKVeui0t+2srJ5UmupxaDZ1Y/vaWzgp6QptN2PDkkk6QgNVArIkQ7iR6vIv4z
         HAyKkWlc+/QvbCAJhm+GCm05zbjz6TcNzaPziBwLELvkFM6QDfT1wYxyLT74GPlDsi/h
         LZLBm9gK9V27LlW13zv6S7YO/JkQi6p1mw6HDji0Hd6NT9KfsV4ouFb/r4qtDJyQmYQt
         OnEg==
X-Gm-Message-State: AO0yUKUwqnze0TkSi6LX5Jn+cMgn4b0GxqEuNT9zW6ODyBYHOr884zS6
	xrOpzxop3XiXRaparMZGhBicGf9RSZbaDw==
X-Google-Smtp-Source: AK7set+c1MMg/6r2/RQxESmmgtqIlhJcr1RTpB705pqhXSnawCgU8I8pEXOOPVETKXsnEWs2xBYVMQ==
X-Received: by 2002:a17:90a:9485:b0:23c:feb9:2cea with SMTP id s5-20020a17090a948500b0023cfeb92ceamr31277039pjo.42.1680277647425;
        Fri, 31 Mar 2023 08:47:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::bed3])
        by smtp.gmail.com with ESMTPSA id u18-20020a17090adb5200b00233d6547000sm1624567pjx.54.2023.03.31.08.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 08:47:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] cyrus-sasl: Fix autoconf patch to work with new autoconf 2.72
Date: Fri, 31 Mar 2023 08:47:22 -0700
Message-Id: <20230331154724.1302078-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331154724.1302078-1-raj.khem@gmail.com>
References: <20230331154724.1302078-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 15:47:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101859

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../cyrus-sasl/0001-Fix-time.h-check.patch    |  9 +--
 .../cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch | 73 ++++++++-----------
 2 files changed, 32 insertions(+), 50 deletions(-)

diff --git a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/0001-Fix-time.h-check.patch b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/0001-Fix-time.h-check.patch
index a6df213fee..3b7054a799 100644
--- a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/0001-Fix-time.h-check.patch
+++ b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/0001-Fix-time.h-check.patch
@@ -28,11 +28,9 @@ Signed-off-by: Sam James <sam@gentoo.org>
  plugins/cram.c | 4 ++++
  2 files changed, 5 insertions(+), 1 deletion(-)
 
-diff --git a/configure.ac b/configure.ac
-index e1bf53b6..ad781830 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1290,7 +1290,7 @@ AC_CHECK_HEADERS_ONCE([sys/time.h])
+@@ -1231,7 +1231,7 @@ AC_CHECK_HEADERS_ONCE([sys/time.h])
  
  AC_HEADER_DIRENT
  AC_HEADER_SYS_WAIT
@@ -41,8 +39,6 @@ index e1bf53b6..ad781830 100644
  
  IPv6_CHECK_SS_FAMILY()
  IPv6_CHECK_SA_LEN()
-diff --git a/plugins/cram.c b/plugins/cram.c
-index d02e9baa..695aaa91 100644
 --- a/plugins/cram.c
 +++ b/plugins/cram.c
 @@ -53,6 +53,10 @@
@@ -56,6 +52,3 @@ index d02e9baa..695aaa91 100644
  #include <sasl.h>
  #include <saslplug.h>
  #include <saslutil.h>
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch
index 1e6f99603c..308d88204f 100644
--- a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch
+++ b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch
@@ -1,50 +1,39 @@
-From 288430d3c2d3f36a4c9d40c4fffa85288f44549a Mon Sep 17 00:00:00 2001
-From: "Roy.Li" <rongqing.li@windriver.com>
-Date: Tue, 25 Jun 2013 09:22:59 +0800
-Subject: [PATCH] Avoid to call AC_TRY_RUN
+Remove AC_TRY_RUN
 
-Upstream-Status: Inappropriate [configuration]
+It can not be run during cross compile
 
-Avoid to call AC_TRY_RUN to check if GSSAPI libraries support SPNEGO
-on cross-compile environment by definition AC_ARG_ENABLE enable-spnego
-
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
----
- m4/sasl2.m4 | 14 +++++++++++++-
- 1 file changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/m4/sasl2.m4 b/m4/sasl2.m4
-index 80371ef..ff70083 100644
+Upstream-Status: Inappropriate [Cross-compile specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 --- a/m4/sasl2.m4
 +++ b/m4/sasl2.m4
-@@ -316,6 +316,18 @@ if test "$gssapi" != no; then
+@@ -316,28 +316,8 @@ if test "$gssapi" != no; then
    AC_CACHE_CHECK([for SPNEGO support in GSSAPI libraries],[ac_cv_gssapi_supports_spnego],[
      cmu_save_LIBS="$LIBS"
      LIBS="$LIBS $GSSAPIBASE_LIBS"
-+    AC_ARG_ENABLE([spnego],
-+                [AC_HELP_STRING([--enable-spnego=<DIR>],
-+                                [enable SPNEGO support in GSSAPI libraries [no]])],
-+                [spnego=$enableval],
-+                [spnego=no])
-+  
-+    if test "$spnego" = no; then
-+         echo "no"
-+    elif test "$spnego" = yes; then
-+         AC_DEFINE(HAVE_GSS_SPNEGO,,[Define if your GSSAPI implementation supports SPNEGO])
-+    else
-+         AC_MSG_CHECKING([for SPNEGO support in GSSAPI libraries])
-     AC_TRY_RUN([
- #ifdef HAVE_GSSAPI_H
- #include <gssapi.h>
-@@ -343,7 +355,7 @@ int main(void)
-   AS_IF([test "$ac_cv_gssapi_supports_spnego" = yes],[
-     AC_DEFINE(HAVE_GSS_SPNEGO,,[Define if your GSSAPI implementation supports SPNEGO])
-   ])
+-    AC_TRY_RUN([
+-#ifdef HAVE_GSSAPI_H
+-#include <gssapi.h>
+-#else
+-#include <gssapi/gssapi.h>
+-#endif
 -
-+   fi
- else
-   AC_MSG_RESULT([disabled])
- fi
--- 
-2.25.1
-
+-int main(void)
+-{
+-    gss_OID_desc spnego_oid = { 6, (void *) "\x2b\x06\x01\x05\x05\x02" };
+-    gss_OID_set mech_set;
+-    OM_uint32 min_stat;
+-    int have_spnego = 0;
+-                                                                               
+-    if (gss_indicate_mechs(&min_stat, &mech_set) == GSS_S_COMPLETE) {
+-	gss_test_oid_set_member(&min_stat, &spnego_oid, mech_set, &have_spnego);
+-	gss_release_oid_set(&min_stat, &mech_set);
+-    }
+-
+-    return (!have_spnego);  // 0 = success, 1 = failure
+-}
+-],[ac_cv_gssapi_supports_spnego=yes],[ac_cv_gssapi_supports_spnego=no])
++    AC_DEFINE(HAVE_GSS_SPNEGO,,[Define if your GSSAPI implementation supports SPNEGO])
++    AC_MSG_RESULT(yes)
+     LIBS="$cmu_save_LIBS"
+   ])
+   AS_IF([test "$ac_cv_gssapi_supports_spnego" = yes],[
-- 
2.40.0


