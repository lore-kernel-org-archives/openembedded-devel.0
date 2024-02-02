Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA563C48286
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 03:02:35 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.14805.1706842949352878811
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Feb 2024 19:02:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wz+QV5EX;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-295f3bf41d5so274478a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Feb 2024 19:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706842948; x=1707447748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pCHivhntGDwvOCQSVVbxiCtF0OHwhCtYOC7u2s96n+E=;
        b=Wz+QV5EX1XkrOeEn7QH4PyT8fJVSSPXZkWpX/xpwDJ3SJUSOOKfvgSg2XtdeNClxQV
         IREe5pR+A8XC29S8me2RHpmAdfoHYCwz7yIctgZiU508OhsS1uOva/NuZDkn3y+tSNap
         zcugNyBHIhkZT5s04ucRghdXxcnox5DHinnU89py3yLrJadhfb2ePayCcnGvllsBoBt3
         2Xzc0JZHT0kOzC3pAjgy14B7pm9DjuYOvnXQAnWCr+TFBqDhRjbTl63ouC7lo4gPth7/
         geT7iyMblXlE25GtqN8IwadLA5xVyqT7XMRyi+Rwr1bCnyxwLpFvKlyiLah4Axf/BV8G
         pwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706842948; x=1707447748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pCHivhntGDwvOCQSVVbxiCtF0OHwhCtYOC7u2s96n+E=;
        b=uo5ZC452OkOP5VpK2QdOZAuKFu5UyxGTrkqWLobfBW8oqsfFQnmMq6c3Qy95KxFMUh
         H8eTlGRZ6t0IEPauijDoK9HwyYge3FUvVjN0q4dZQVhPTTcFB3/Kh52NC1ldYcYswjvi
         pWFwcdEC1buJJoAalHEJL1FtqmxWWPZj7Nvn6LdFYllW1epLa3UijmXAEyCR0a3d9SGz
         Ryc/ixBb+kTX1XOL905GSB8Feqc9PeRy2KLod1jFsS9k/7lA5p3JSfcSRRm3bAdMNA9S
         mfwQqae7i/IfHTuHMoIaLjxO2FStQvmHfBA5WkV6ynW+fn/Vg10Lb/ZKNWixStJFGeVf
         3lfw==
X-Gm-Message-State: AOJu0YwMmI0T8u2es6z4wPtlhwK9L/+ZylWmvu2BI4Itfo/eUee6xSIz
	wBrp/hEY5z4V7zSRDBr2vALSl0DfOKL2p60E551OXHgkU7ejrjVEe7jqzpf/NjA=
X-Google-Smtp-Source: AGHT+IGp2x/Nq1Ge0Lh5tb2DGBXIGxQ1KxNtfngcgZkx98yqK6SMeHBRQ8zuCqZR7CZHGlJieASZuA==
X-Received: by 2002:a17:90a:868c:b0:295:ef2a:d0fb with SMTP id p12-20020a17090a868c00b00295ef2ad0fbmr1424600pjn.5.1706842948353;
        Thu, 01 Feb 2024 19:02:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e58e])
        by smtp.gmail.com with ESMTPSA id se8-20020a17090b518800b00295bc312ceasm579536pjb.34.2024.02.01.19.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 19:02:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] flatcc: Fix build warnings found with clang-18
Date: Thu,  1 Feb 2024 19:02:26 -0800
Message-ID: <20240202030226.392012-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 03:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108523

Fix what we can, and also disable warning-as-error as some compilers can
be quite ambitious.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ndard-version-23-for-__fallthrough__.patch | 31 +++++++++++++++++++
 meta-oe/recipes-devtools/flatcc/flatcc_git.bb |  2 ++
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/flatcc/flatcc/0001-Check-for-C-standard-version-23-for-__fallthrough__.patch

diff --git a/meta-oe/recipes-devtools/flatcc/flatcc/0001-Check-for-C-standard-version-23-for-__fallthrough__.patch b/meta-oe/recipes-devtools/flatcc/flatcc/0001-Check-for-C-standard-version-23-for-__fallthrough__.patch
new file mode 100644
index 0000000000..c9ff55a167
--- /dev/null
+++ b/meta-oe/recipes-devtools/flatcc/flatcc/0001-Check-for-C-standard-version-23-for-__fallthrough__.patch
@@ -0,0 +1,31 @@
+From 7c199e3b191a6f714694035f1eba40112e71675c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 1 Feb 2024 18:41:51 -0800
+Subject: [PATCH] Check for C standard version >= 23 for [[__fallthrough__]]
+
+This avoids warnings with clang-18+ e.g.
+
+pprintint.h:256:6: error: [[]] attributes are a C23 extension [-Werror,-Wc23-extensions]
+
+Upstream-Status: Submitted [https://github.com/dvidelabs/flatcc/pull/273]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/flatcc/portable/pattributes.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/flatcc/portable/pattributes.h b/include/flatcc/portable/pattributes.h
+index 9240fa3..dd4918a 100644
+--- a/include/flatcc/portable/pattributes.h
++++ b/include/flatcc/portable/pattributes.h
+@@ -57,7 +57,7 @@ extern "C" {
+ 
+ 
+ /* https://en.cppreference.com/w/c/language/attributes/fallthrough */
+-#if PORTABLE_HAS_C_ATTRIBUTE(__fallthrough__)
++#if PORTABLE_HAS_C_ATTRIBUTE(__fallthrough__) && defined(__STDC_VERSION__) && __STDC_VERSION__ >= 202311L
+ # define pattribute_fallthrough [[__fallthrough__]]
+ #elif PORTABLE_HAS_ATTRIBUTE(__fallthrough__)
+ # define pattribute_fallthrough __attribute__((__fallthrough__))
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-devtools/flatcc/flatcc_git.bb b/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
index 660a44c5a5..161c4107b5 100644
--- a/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
+++ b/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
@@ -10,6 +10,7 @@ PV = "0.6.2+gitr${SRCPV}"
 
 SRC_URI = " \
            git://github.com/dvidelabs/flatcc.git;protocol=https;branch=master \
+           file://0001-Check-for-C-standard-version-23-for-__fallthrough__.patch \
 "
 SRCREV = "1653ec964730ec7d9892a08a1695ada6d20f5196"
 
@@ -22,6 +23,7 @@ inherit cmake
 EXTRA_OECMAKE += " \
     -DFLATCC_INSTALL=On \
     -DFLATCC_TEST=Off \
+    -DFLATCC_ALLOW_WERROR=Off \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


