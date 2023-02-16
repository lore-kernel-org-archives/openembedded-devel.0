Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC42BC677F1
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 12:28:09 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.8635.1676550487624124150
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 04:28:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j5a7KJoD;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id h24so1899439qtr.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 04:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7aqJOxM2dUSlf/dUIL+F36BDQkSxbPDx7kTmrgKbV7o=;
        b=j5a7KJoD79TyyTnnCELDWNd2xBrged9ETHBOeoWIGOZOcsrCsM6sMYNc4oxKqfLHLW
         Ig2PrHMrlF7lyQdOBGVBBYjVhxhsw4Q1IjYfoJ8YR7y9GuQj2GCAl46eI+mFEv7lTJnR
         mW6lG80PaU9GGoIW2YOuDOuEFU5H9OxJ/2PbP+HdFz3NZn8BkUFoFQhSvhQFMiclWCSr
         DRbRAictFp8FUYzJdsadEEzr2UHbCdhoFUL1pfTsS0iCP8MJWN0mGsOim5oP7NK55AGf
         acFruIkY7I3qmBB4Dqx3XtZfNwzjtj1YoaB1bY7sy+l8ll6Ync2KwUqD9ZTUzoIyzoOB
         Ip+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7aqJOxM2dUSlf/dUIL+F36BDQkSxbPDx7kTmrgKbV7o=;
        b=XOiTqa9G0Tbbcw2YgitM5g1vKUYRTmwd/W4p7wXZiz/oaOberddJPj6A5LWlrNbRW5
         THtdtS4jzzDen6tXrbYP21ABh4TmQeLIhnAKP858nJKr7AL3irnfr+RGjmGwHwd/5RuE
         9+XQrOU9aBf78CPwqaDk1561fzC49FYnUmkVXrNZaao2bJswT5W8Aoir2SvqduXhZNQP
         V5BcrQSQoSB6bmmGaaNKDxCLlzIGwL02BZFrVpBRyjixzOlMKf2NqTB6kneBW9sIjUuA
         Fl+rTXLvPlmh6JnfpyXiQXVEjgQ+DqGDNmaLDVXI2p93DQxFKOL4vfTrAH3HQWE762Iz
         OPfQ==
X-Gm-Message-State: AO0yUKXjsoHVl8mMvWYZP9TWXOddiO6t/lulZC6bCDjjpj/ews9nEG7v
	E8jpLWsTMLPraDPNYDxWJE2KXTAK++Y=
X-Google-Smtp-Source: AK7set+PmNnzUMtlJVyVLTycQ9SMC4WBdXFK3sqrpMVU1M0oDl6sH3V6AiBU6mhzsxML2v32AoqPrw==
X-Received: by 2002:ac8:7dcc:0:b0:3b8:689f:d8ef with SMTP id c12-20020ac87dcc000000b003b8689fd8efmr9124848qte.18.1676550486516;
        Thu, 16 Feb 2023 04:28:06 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:2ead:d6b6:b6e2:9e85])
        by smtp.gmail.com with ESMTPSA id t127-20020a379185000000b0073b4d9e2e8dsm1102362qkd.43.2023.02.16.04.28.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:28:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 10/15] net-snmp: Fix build with clang16
Date: Thu, 16 Feb 2023 07:27:20 -0500
Message-Id: <f6bdd48158fc6141353e331bd3ff9ad50508b492.1676550369.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1676550369.git.akuster808@gmail.com>
References: <cover.1676550369.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 12:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101112

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


