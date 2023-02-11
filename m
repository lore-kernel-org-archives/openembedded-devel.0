Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9C2C636CC
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 17:06:16 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.13402.1676135166825713635
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Feb 2023 09:06:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pyOBc3NT;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id bi19so7055377oib.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 09:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aqJOxM2dUSlf/dUIL+F36BDQkSxbPDx7kTmrgKbV7o=;
        b=pyOBc3NTIQQB0L1IxCgwty1YDJBh+RmQtEI6jtHCVNIUv3pQjGj4uWjbU+aflVLvNC
         Z9zwEdsYPvXkwRlYL5qvPjXDMIVzJbrxDt4BV4tGQObAeuml6+g6lk6TitPnGYRXWGg2
         T3a6yxETPKb/siTJSgVoQBdl7J69OU+6Xj8h1KOBHPTuAdcREH97d6hE0rb1pCkMJvle
         rnzudx1sPwec9S3el13jVNbzvmambOw7urbbMoIvKc8XbmGcaTP0aYi+CzPJXuNLSdv+
         EBwfkutLBVOcC/Yhi9FHcpF7D8bwYd2UK5XKwsP+NwL0G5M6v2JMZ+06fGugyds556tQ
         7LXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7aqJOxM2dUSlf/dUIL+F36BDQkSxbPDx7kTmrgKbV7o=;
        b=tbmwKU3LVfbOxnzjalbvnAdoX5zg2ASeHGB3CRD4kQpnFNdlBEr1EmD+Pv7wQUc2TE
         HwsE9FCSHGEG4eHQJu6ACCGKnIkHIMEEZHH5We92QYazNGXE1aru5Wa59WqTk2BZEEUg
         oLhCkXzMB8lpKTL+redZeDs3WQYkNrjJhJ2bg0n8Fx8Le+XVBP/Mj2Z/mRAnTlOq7tqN
         GqcN+g5qumGF6pubmYSzVBRmaUpR91AaTPTOK0JS7092jeTZAWhlpvBpNsm1A7tamWRi
         9OsyGqwaCYW9NFgEnUKyZpt6WpMuu7VbHmWDUt5Nhms6W8l31sJueyecBGu7wmUO0a4/
         hmtw==
X-Gm-Message-State: AO0yUKW/p01hrbUJK7DGKI2qMIWF8yf/LZAhXaBpuctTJoW/DKz3jaHQ
	1DOICiwpwogLzP3A7eVgh90u7Ke42iw=
X-Google-Smtp-Source: AK7set/YvsY5ItjmqrNMwYfPsqwljfI0TdrcpqUX8JnVassjFp6aBrQNkdeeduSFemZigYe6izxdEA==
X-Received: by 2002:a05:6808:494:b0:371:fe1:8943 with SMTP id z20-20020a056808049400b003710fe18943mr3404767oid.6.1676135166020;
        Sat, 11 Feb 2023 09:06:06 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:6c32:d739:9179:1de7])
        by smtp.gmail.com with ESMTPSA id p203-20020aca5bd4000000b0037d8670526esm275932oib.52.2023.02.11.09.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 09:06:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH 3/6] net-snmp: Fix build with clang16
Date: Sat, 11 Feb 2023 12:05:58 -0500
Message-Id: <20230211170601.3988339-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230211170601.3988339-1-akuster808@gmail.com>
References: <20230211170601.3988339-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 17:06:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101038

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ee0de616df82937191613c85f9df7e872b99ed6f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.25.1


