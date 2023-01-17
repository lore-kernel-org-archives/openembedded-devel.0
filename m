Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73263C6379F
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 05:22:42 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.189983.1673932962151714170
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 21:22:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fxoj5yt+;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id s13-20020a17090a6e4d00b0022900843652so14454264pjm.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Jan 2023 21:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omAIoQjgZmeCrM1HDUfSXDqBgAAYtyDatWRgOgzOZzA=;
        b=Fxoj5yt+kxwQjekWPWgSKGByW3s8kpya+7XvxeKT0ykvLI0ar4JHogH8jErgxXzbI5
         PpCucpApGhTwlw3hRk03rp23Tbmqe5E8I6Zr55lyf1cZ+ZCnJjenqzqBVeIpWKZ73fy1
         nF7ScxGE45bLGIDtVJ81CAVvIU0TnthHwkvoQ7WFVDmKMPUAFLI0y1tNeq0b0Tjd2RNM
         vZMjX4YHsoW3vBTJr/5jilPdJx+i+kjzYIrZsmd16FinvUdlSypAOIeCKO/C0HVdjCM5
         qDGyiCgIvTB+UJZhgmDhDO2YGZ+kXarmKkjyrPl3Svknnlwy4PxqZZIH7POiE2JZU8Zk
         VphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omAIoQjgZmeCrM1HDUfSXDqBgAAYtyDatWRgOgzOZzA=;
        b=8Io5vyQ7Z/fCb3U2on1Vm39mSN8mV2VqEJzVi0bVuoMqXw6Sh6bt0umleR5KkLXjcv
         fYIdgncerkTUK64jWyggFa7N+eOYYi2j+VuhLOunXN5gMs47COFtki/iqV3TGqvIOlcW
         7z9eCsVyhORvpymvluJHcPNFQdf0aAvu6/YLaZ2+nUy8ddaGZcjpL8ve7XmSwbZqrxo7
         LotQmo2YeoxqS93D6eBlxSjdUqIkgydR/lXvv0DQelo6GEzaQ+qtBnd7K3TSZ2e0f+kw
         Gr2//ipJEQ+jsnfyPcKMcPDqgl+HLNnIj9WFKg1aKfaZ8JrgRLxnwfPn8zuoCyoxrioX
         gPhA==
X-Gm-Message-State: AFqh2koKqVV1r6TQ5KgNQjuxVTFHKopT/Rrdi1TMeXqNL4ZiRXPZitWm
	poX+IuXWjVCMPDbTzh3TiTiuXitnXOmIJw==
X-Google-Smtp-Source: AMrXdXuG1Wqq0logeVFXXsRikYep0jIDeWLw0JKjfsyRuZHTxeuVAV4XH41c7Pm5uVkt5cHWot3bgA==
X-Received: by 2002:a05:6a20:2a86:b0:a3:8d47:6aa9 with SMTP id v6-20020a056a202a8600b000a38d476aa9mr1844739pzh.34.1673932961276;
        Mon, 16 Jan 2023 21:22:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id c22-20020a6566d6000000b0045dc85c4a5fsm12682692pgw.44.2023.01.16.21.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 21:22:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-perl][PATCH 3/7] libxml-libxml-perl: Fix function pointer types
Date: Mon, 16 Jan 2023 21:22:33 -0800
Message-Id: <20230117052237.3117521-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117052237.3117521-1-raj.khem@gmail.com>
References: <20230117052237.3117521-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 05:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100589

Newer clang is warning about this.
Fixes -Wincompatible-function-pointer-types

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nction-prototypes-in-function-pointe.patch | 51 +++++++++++++++++++
 .../libxml/libxml-libxml-perl_2.0134.bb       |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libxml/libxml-libxml-perl/0001-libxml-mm-Fix-function-prototypes-in-function-pointe.patch

diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl/0001-libxml-mm-Fix-function-prototypes-in-function-pointe.patch b/meta-perl/recipes-perl/libxml/libxml-libxml-perl/0001-libxml-mm-Fix-function-prototypes-in-function-pointe.patch
new file mode 100644
index 0000000000..7ff61c5709
--- /dev/null
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl/0001-libxml-mm-Fix-function-prototypes-in-function-pointe.patch
@@ -0,0 +1,51 @@
+From 25451c0a56ef8d3b32fd23847bef516486bd8ed4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 16 Jan 2023 18:50:10 -0800
+Subject: [PATCH] libxml-mm: Fix function prototypes in function pointers
+
+This is now detected with latest clang16+
+
+Fixes
+error: incompatible function pointer types passing 'void (void *, void *, xmlChar *)' (aka 'void (void *, void *, unsigned char *)') to parameter of type 'xmlHashScanner' (aka 'void (*)(void *, void *, const unsigned char *)') [-Wincompatible-function-pointer-types]
+                xmlHashScan(r, PmmRegistryDumpHashScanner, NULL);
+
+Upstream-Status: Submitted [https://github.com/shlomif/perl-XML-LibXML/pull/75]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ perl-libxml-mm.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/perl-libxml-mm.c b/perl-libxml-mm.c
+index a3e78a2..ec2b5ea 100644
+--- a/perl-libxml-mm.c
++++ b/perl-libxml-mm.c
+@@ -121,7 +121,7 @@ PmmFreeHashTable(xmlHashTablePtr table)
+ extern SV* PROXY_NODE_REGISTRY_MUTEX;
+ 
+ /* Utility method used by PmmDumpRegistry */
+-void PmmRegistryDumpHashScanner(void * payload, void * data, xmlChar * name)
++void PmmRegistryDumpHashScanner(void * payload, void * data, const xmlChar * name)
+ {
+ 	LocalProxyNodePtr lp = (LocalProxyNodePtr) payload;
+ 	ProxyNodePtr node = (ProxyNodePtr) lp->proxy;
+@@ -215,7 +215,7 @@ PmmRegisterProxyNode(ProxyNodePtr proxy)
+ /* PP: originally this was static inline void, but on AIX the compiler
+    did not chew it, so I'm removing the inline */
+ static void
+-PmmRegistryHashDeallocator(void *payload, xmlChar *name)
++PmmRegistryHashDeallocator(void *payload, const xmlChar *name)
+ {
+ 	Safefree((LocalProxyNodePtr) payload);
+ }
+@@ -279,7 +279,7 @@ PmmRegistryREFCNT_dec(ProxyNodePtr proxy)
+  * internal, used by PmmCloneProxyNodes
+  */
+ void *
+-PmmRegistryHashCopier(void *payload, xmlChar *name)
++PmmRegistryHashCopier(void *payload, const xmlChar *name)
+ {
+ 	ProxyNodePtr proxy = ((LocalProxyNodePtr) payload)->proxy;
+ 	LocalProxyNodePtr lp;
+-- 
+2.39.0
+
diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
index c2ea47ae5b..f184b89e59 100644
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV}.
     file://disable-libxml2-check.patch \
     file://fix-CATALOG-conditional-compile.patch \
     file://using-DOCB-conditional.patch \
+    file://0001-libxml-mm-Fix-function-prototypes-in-function-pointe.patch \
 "
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=64eda1bc135f0ece1d1187f2a8ac82c1 \
     file://LICENSE;md5=97871bde150daeb5e61ad95137ff2446 \
-- 
2.39.0


