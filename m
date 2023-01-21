Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E65C54E94
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:47 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.2071.1674324099363399348
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MAQsrgs1;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so11049302pjq.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/OoG2E/ViMfwlb/cwkls7blrjZeLpnE2kRoHSoBG8Y=;
        b=MAQsrgs18dANFtymAwES0u1DNQaw8NMZmSgxGDEI/nKXfqpytxh2kmpUzAS4Xhhexh
         LzFlRpq2vDvxkm89KSL0jMMInq0mLw0H1A7vq1a+bCFCYf04KQG8jlQeXX/ce4DdBaSk
         6OBmtBihkly0IyTuqT1Xyl0uQVFyYB08cTLg4JLyTYg9t1SX8E7ZQA65vdPx/gJl2I6V
         J/f7VvayMAy4i5qM/Z4tvofadUZDN+9RYgiRHmB3wYk7dSYy4jrDuB+pmfPLwhR7yU3S
         P76GIYDntroI1hx4kCPiy97q8DVuhrn1Tl/hHH4I3A6PqGg1Kp4atjW41IthGQryE/yS
         kUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/OoG2E/ViMfwlb/cwkls7blrjZeLpnE2kRoHSoBG8Y=;
        b=kBhpUFQxMbWlityhZw+YA798RQ7uTBoE6k5l2DLJO4TruOvjQkuMCCFBZ8bu29itvX
         ZUNtQYJI8wu9nwWDdsUJqSNnofzdvu6HK44w2gYARtTx9B1fXIrTcu5gq7/jC8h3J67w
         86qcZAkKZiIxggqkHZQNv8UDqIefoA4IHWj4/u1QDliuc5x6ZUQ0JLrjkzQ7e2j2fM4G
         W8ofC3IT/iufXq3lszIPi+Os6j3Z/JKIdrVVKU22wNaKCir4OZYkrZyKXMzzQBiUsni3
         aSoh1FyyTfJz1mglkqzSClWls7I2Sd9nKDhoMaYSMUQCbalG87WqYRjHUbQeAMesH2Zn
         GGMw==
X-Gm-Message-State: AFqh2kr4FM1eSa068ayxqs+TcGs3cyDLiv/XfZfxAyenupscgxz2b8Th
	iCvTfvM1XtNc4+wkZM9GRtOSrZ5yVlzWew==
X-Google-Smtp-Source: AMrXdXvSc8bIHLjK+W6gmYYn6l70Q24arsxi3vYyeOAZcWuNkpBQcFtIZirAHFzc7MGJ6T/0B8CrQg==
X-Received: by 2002:a17:90a:41:b0:229:f580:e68a with SMTP id 1-20020a17090a004100b00229f580e68amr10277726pjb.17.1674324098562;
        Sat, 21 Jan 2023 10:01:38 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 18/30] net-snmp: Fix build with clang16
Date: Sat, 21 Jan 2023 10:01:09 -0800
Message-Id: <20230121180121.1229895-18-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100685

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...eturn-attribute-to-netsnmp_pci_error.patch | 32 +++++++++++++++++++
 .../net-snmp/net-snmp_5.9.3.bb                |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-noreturn-attribute-to-netsnmp_pci_error.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-noreturn-attribute-to-netsnmp_pci_error.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-noreturn-attribute-to-netsnmp_pci_error.patch
new file mode 100644
index 0000000000..6fbace75a5
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-noreturn-attribute-to-netsnmp_pci_error.patch
@@ -0,0 +1,32 @@
+From 5719f40db65a72624a0b0f08e546d12bf823bd1e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Jan 2023 14:38:44 -0800
+Subject: [PATCH] Add noreturn attribute to netsnmp_pci_error()
+
+Fixes build with clang16
+| mibgroup/if-mib/data_access/interface_linux.c:152:23: error: incompatible function pointer types assigning to 'void (*)(char *, ...) __attribute__((noreturn))' from 'void (char *, ...)' [-Wincompatible-function-pointer-types]
+|     pci_access->error = netsnmp_pci_error;
+|                       ^ ~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ agent/mibgroup/if-mib/data_access/interface_linux.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/agent/mibgroup/if-mib/data_access/interface_linux.c b/agent/mibgroup/if-mib/data_access/interface_linux.c
+index c6cc54e..12eb865 100644
+--- a/agent/mibgroup/if-mib/data_access/interface_linux.c
++++ b/agent/mibgroup/if-mib/data_access/interface_linux.c
+@@ -31,7 +31,7 @@ static struct pci_access *pci_access;
+ /* Avoid letting libpci call exit(1) when no PCI bus is available. */
+ static int do_longjmp =0;
+ static jmp_buf err_buf;
+-static void
++__attribute__((noreturn))  static void
+ netsnmp_pci_error(char *msg, ...)
+ {
+     va_list args;
+-- 
+2.39.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
index 7af5147566..78d711fbfd 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
@@ -26,6 +26,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://net-snmp-fix-for-disable-des.patch \
            file://reproducibility-have-printcap.patch \
            file://0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch \
+           file://0001-Add-noreturn-attribute-to-netsnmp_pci_error.patch \
            "
 SRC_URI[sha256sum] = "2097f29b7e1bf3f1300b4bae52fa2308d0bb8d5d3998dbe02f9462a413a2ef0a"
 
-- 
2.39.1


