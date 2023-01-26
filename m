Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C409CC54EED
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 07:17:51 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.68542.1674717470144099021
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 23:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bs8186ln;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id z1-20020a17090a66c100b00226f05b9595so1006825pjl.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 23:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NLdeqwGPUgTzQTGEWKQ526JB0d8IQ5UOOcmHgnEip0=;
        b=bs8186lnX0Fw/KCixwmB7SoIZH+ZU6/8/XHyKRneisRqkv3yEKRoMEgKYjLn5njUzC
         CS7n6GgzQG1/9+rM7Vs3UHFDpPTT+kENjnGvo7q+7ntE19SVkRbe4Z5XEBlwiV9jngd6
         MXwBqMFA+QKYTq4aYPoufyfmyZyxXIbagTJKkDhRGZVb+ePCeaFwAZeofGFY6xGyOIWd
         KsqQinfg/WWJOsZSatXWa9+OJMAbIY65Qkh4yMiA8iXuV7ae9xQoOxExWICIEelmeHBK
         iFPP39XOv/32rBxuEGZR8ZeyW2Wl4zBwZ2MpZ+YtmtP3JLu6E/3Qh0Y4kiRQe2LkYqcF
         MKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0NLdeqwGPUgTzQTGEWKQ526JB0d8IQ5UOOcmHgnEip0=;
        b=impqcuU0VsBLxHorOP2c5UCqCP8NTQKMAqQcNVRDGaBa+c4eGdIBXYrZQdYUfS4m3Q
         yOWYoWCHXnW0GMFBVUQgdEPUfBw9PboaS1xZ5WffSWI+Iytws84VcDL2sbD/vrL3vulx
         ZZ0RhIbtXtpv4fcXfuQLjeTCWw4tW2RQeSUU9iDo1mfwBhqgTploMey63WTJR5Seynld
         yGFMC4IRpeww4E0z2/rTKR6MWHQ6wLWKVJvteNQvh9E4CEen49cTwVXigQc57kFJaSef
         9x7HNict6wXLqVeZeRhKJwjpAIbh4b3GhDaXHCifuBHe67t7zNWr5rKg2PVA/Tayi7XZ
         nsEA==
X-Gm-Message-State: AO0yUKWqOBVHKBznAY3FDMzNs9q6wh9/JMJMFbR1BencigsTNbiSHf6i
	caASqNU3VPyTBitwRblrIu/kaOiSji23ng==
X-Google-Smtp-Source: AK7set+USZGRAyjdpis7fi6WVLr9+r9KOVk9xnZFyVRnRWqc1o+d2MJ4UYOfrovxVGgm+UwfBtcbEA==
X-Received: by 2002:a17:902:e293:b0:196:39b2:4ada with SMTP id o19-20020a170902e29300b0019639b24adamr2026119plc.35.1674717469325;
        Wed, 25 Jan 2023 23:17:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id c17-20020a170902b69100b00196025a34b9sm458815pls.159.2023.01.25.23.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 23:17:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 13/13] msktutil: Upgrade to 1.2.1
Date: Wed, 25 Jan 2023 23:17:35 -0800
Message-Id: <20230126071735.2444745-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126071735.2444745-1-raj.khem@gmail.com>
References: <20230126071735.2444745-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 07:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100795

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{msktutil_1.2.bb => msktutil_1.2.1.bb}    |  5 +--
 ...figure.ac-Remove-native-include-path.patch | 31 +++++++++++++++++++
 2 files changed, 34 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/msktutil/{msktutil_1.2.bb => msktutil_1.2.1.bb} (75%)
 create mode 100644 meta-oe/recipes-support/msktutil/mskutil/0001-configure.ac-Remove-native-include-path.patch

diff --git a/meta-oe/recipes-support/msktutil/msktutil_1.2.bb b/meta-oe/recipes-support/msktutil/msktutil_1.2.1.bb
similarity index 75%
rename from meta-oe/recipes-support/msktutil/msktutil_1.2.bb
rename to meta-oe/recipes-support/msktutil/msktutil_1.2.1.bb
index 1b9a04ef29..b4f4651e37 100644
--- a/meta-oe/recipes-support/msktutil/msktutil_1.2.bb
+++ b/meta-oe/recipes-support/msktutil/msktutil_1.2.1.bb
@@ -7,8 +7,9 @@ DESCRIPTION = "Msktutil creates user or computer accounts in Active Directory, \
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a"
 
-SRC_URI = "https://github.com/msktutil/msktutil/releases/download/v${PV}/msktutil-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "27dc078cbac3186540d8ea845fc0ced6b1d9f844e586ccd9eaa2d9f4650c2ce6"
+SRC_URI = "https://github.com/msktutil/msktutil/releases/download/${PV}/${BP}.tar.bz2 \
+           file://0001-configure.ac-Remove-native-include-path.patch"
+SRC_URI[sha256sum] = "f9686237c4e24414802415f4c8627c7343da365c5a3bcdef7a853fa3cd27b45d"
 
 DEPENDS += "krb5 cyrus-sasl openldap"
 
diff --git a/meta-oe/recipes-support/msktutil/mskutil/0001-configure.ac-Remove-native-include-path.patch b/meta-oe/recipes-support/msktutil/mskutil/0001-configure.ac-Remove-native-include-path.patch
new file mode 100644
index 0000000000..1643c08566
--- /dev/null
+++ b/meta-oe/recipes-support/msktutil/mskutil/0001-configure.ac-Remove-native-include-path.patch
@@ -0,0 +1,31 @@
+From bf9795ffbda7bb241b708ff261976016efb943b1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 25 Jan 2023 23:12:19 -0800
+Subject: [PATCH] configure.ac: Remove native include path
+
+On OE com_err.h is found in /usr/include too, therefore adding new path
+to include search path is not needed. Moreover it fixed QA checks where
+it warns about using build system paths.
+
+Upstream-Status: Inappropriate [Cross-compile specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index eaac16f..d23d0b0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -134,7 +134,6 @@ fi
+ # Fedora, RHEL, Centos has com_err.h in /usr/include/et
+ AC_CHECK_HEADERS([et/com_err.h])
+ if test "$ac_cv_header_et_com_err_h" = "yes"; then
+-   CPPFLAGS="-I/usr/include/et $CPPFLAGS"
+    AC_DEFINE(HAVE_COM_ERR_H, 1)
+ fi
+ 
+-- 
+2.39.1
+
-- 
2.39.1


