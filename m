Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E9FC76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 15:47:29 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.58725.1680277647729919659
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Mar 2023 08:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CLtfiZ4+;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id e15-20020a17090ac20f00b0023d1b009f52so25823360pjt.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 08:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680277647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0FLRefZgeD/75TJbLnwRMDXgUYVbsM+X1WiV8iUvu9o=;
        b=CLtfiZ4+DCXw2Q3AGloHUVEFXoqmS0cBEMUMEZ8PoVgpc+KN9e6oD2AcEjGF7Lj897
         EKe1rhBXybrNkZMddAhXveCLfaslb8QphzgBhbOOLbvYU/O8yLVB1YMgbkmXQEMRYtxg
         Ci3jjjb7ynRIU/blAU1rIRQiMqDdVAjzw8SU6VSmTi/APYrdHBmfXN327CXCI/+L1hGq
         EwRDsFxza/vCXUJZG3+y1i+uccyq3lhXk2EbZRAnLZ2Bgy6GktTyHKlAlSTA/KujxB5Q
         tBXC4Nrp9B8V63m1+7694ZfowSAdBhpsUirlesLshUfT8reaupAch3DPYSd0aWycwFpm
         2ErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680277647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0FLRefZgeD/75TJbLnwRMDXgUYVbsM+X1WiV8iUvu9o=;
        b=FYqQUFnyrcgIeojFb2vFjWCezdhN3gk94Il6xe9p5FzWrBpggZMfci62nbcscwHqhd
         rWQ2biE5cPquzfFl14tuJ/B9I4P8EMO633LncKw+BPXO9TnW71GtAT+EqhodNYg+vrtA
         UgXbRa75+FpN/AjbgVBI91YpSs8FvJW0lzrmPnIk70flbfDkgkO/TgsCMSlVXuhH6mIG
         u3ir7m0w/xL62fF7BWfdcsJ2f7PMx5p30HR9H3+KTlOpu6SZ4v2mJpUIoB21b0TviA39
         RhRV84/z5vjPVCktMCC6DdYNVmsqggl4W1LILWa3Cidylr2e0I1A94QQn7qKTkh5Okvh
         l5uA==
X-Gm-Message-State: AAQBX9fNLX56cSOJ4HLHcOG9qHqwjJ/uWA3E1HVPRbL16hKzPJh2EiY0
	wI9FZRSrxBmnJNnHoeup8SEHHjsIr797IQ==
X-Google-Smtp-Source: AKy350YLOgROFGJ1qvqXyGCWhhVCEiPDwLXiWveJA+GjUTK2xv5GvpzqxMvNMhOVx5Gq9XHoWLxZMA==
X-Received: by 2002:a17:90b:4c45:b0:23d:35d9:d065 with SMTP id np5-20020a17090b4c4500b0023d35d9d065mr27851146pjb.48.1680277646750;
        Fri, 31 Mar 2023 08:47:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::bed3])
        by smtp.gmail.com with ESMTPSA id u18-20020a17090adb5200b00233d6547000sm1624567pjx.54.2023.03.31.08.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 08:47:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] krb5: Fix build with autoconf 2.72
Date: Fri, 31 Mar 2023 08:47:21 -0700
Message-Id: <20230331154724.1302078-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 15:47:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101858

Fixes
checking for IPv6 compile-time support without -DINET6... ./configure: line 10004: syntax error near unexpected token `;;'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...al.m4-syntax-error-for-autoconf-2.72.patch | 40 +++++++++++++++++++
 .../recipes-connectivity/krb5/krb5_1.20.1.bb  |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0001-Fix-aclocal.m4-syntax-error-for-autoconf-2.72.patch

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/0001-Fix-aclocal.m4-syntax-error-for-autoconf-2.72.patch b/meta-oe/recipes-connectivity/krb5/krb5/0001-Fix-aclocal.m4-syntax-error-for-autoconf-2.72.patch
new file mode 100644
index 0000000000..9d0b066b10
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/0001-Fix-aclocal.m4-syntax-error-for-autoconf-2.72.patch
@@ -0,0 +1,40 @@
+From 0aa127afa52fd265a4f1bbded1623201390ae96a Mon Sep 17 00:00:00 2001
+From: Julien Rische <jrische@redhat.com>
+Date: Thu, 17 Nov 2022 15:01:24 +0100
+Subject: [PATCH] Fix aclocal.m4 syntax error for autoconf 2.72
+
+An incorrect closure inside KRB5_AC_INET6 is innocuous with autoconf
+versions up to 2.71, but will cause an error at configure time with
+the forthcoming autoconf 2.72.
+
+[ghudson@mit.edu: added more context to commit message]
+
+ticket: 9077 (new)
+tags: pullup
+target_version: 1.20-next
+target_version: 1.19-next
+
+Upstream-Status: Backport [https://github.com/krb5/krb5/commit/d864d740d019fdf2c640460f2aa2760c7fa4d5e9]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/aclocal.m4 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/aclocal.m4 b/src/aclocal.m4
+index 9920476..3d66a87 100644
+--- a/src/aclocal.m4
++++ b/src/aclocal.m4
+@@ -409,8 +409,8 @@ else
+       [[struct sockaddr_in6 in;
+         AF_INET6;
+         IN6_IS_ADDR_LINKLOCAL(&in.sin6_addr);]])],
+-    [krb5_cv_inet6=yes], [krb5_cv_inet6=no])])
+-fi
++    [krb5_cv_inet6=yes], [krb5_cv_inet6=no])
++fi])
+ AC_MSG_RESULT($krb5_cv_inet6)
+ if test "$krb5_cv_inet6" = no && test "$ac_cv_func_inet_ntop" = yes; then
+ AC_MSG_CHECKING(for IPv6 compile-time support with -DINET6)
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
index 6fc630d99a..10fff11c25 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
@@ -22,6 +22,7 @@ SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://debian-suppress-usr-lib-in-krb5-config.patch;striplevel=2 \
            file://crosscompile_nm.patch \
+           file://0001-Fix-aclocal.m4-syntax-error-for-autoconf-2.72.patch;striplevel=2 \
            file://etc/init.d/krb5-kdc \
            file://etc/init.d/krb5-admin-server \
            file://etc/default/krb5-kdc \
-- 
2.40.0


