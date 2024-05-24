Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E9FC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 07:48:59 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.10823.1716536928535196090
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 May 2024 00:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=qPa0nd3c;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-354ba5663c9so2592590f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 00:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1716536926; x=1717141726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hb/pLbvEDzlMm/w8hcEspHwnUPyAnYunscthmRsZxJ4=;
        b=qPa0nd3cKMC2z8HXsKOrq36HrkdoolDJWn3tozm4TV2c0XMplbCdChwuOfOJk53MWk
         b7g+pqGPC2aVyCxnhDZDsL8b/myNMatGojgBZ65SrNR0C5HtWJyUxFaWoCeK3VNPAyeC
         ThdlVdHJU6SKo2SteSNyTM79g9poDdCYlK5YMMprQAucZSEHNO9lntYwzVHEKp2ztdZP
         98lPwiIvzc7J9waQXe4ty4yzNUJJNCQuleXCIilai3EdB5c5Za8yxTLud9ccV8feYaqJ
         vBkSQJcQacbcQbXkZeCdSpN8fncT5b96BgiKFKTBkfevsIuLoiNAnROit/PUEZMZZ9Uq
         ZhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716536926; x=1717141726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hb/pLbvEDzlMm/w8hcEspHwnUPyAnYunscthmRsZxJ4=;
        b=a99eMlekAr/zQCXclSU6he2e8Ur97zmU/r267ZSAWE039V2k5fTQW4NtocBbhLyFqh
         nHDzyV9oDBpFiCYXhOB4icuG5tT+DKvYOzm15IXk7AiakNlcOoUfo1QKI7JqTENbSDJI
         1c8NtaoIXnFCkndmH+DmBg+NQN4KfaIwjwx1PKRrXtConYTF0uIx9uyCSM9L9itIbmlH
         ibmZC4FUfyTRrKc8XUxl2E+irwYsjxd0moVpYljzBxWmUsOVvrRi5qtFIvhbCjIO9psK
         3Clm98yxalypZCg8coYrX1y87ocT4R6HdBP9kj9XQxABpe3pI7S3Ti5fjm/HnbOq8nJK
         P4Pg==
X-Gm-Message-State: AOJu0YyoOj/J6ZcGjIbRr2c001drJgAxZ5MsdyPYAgEiI65aob1llkaG
	OBe6bkFB/UjzI4WjoaZwzUQD4eU5i8V7b4qTm2+oU7WzGgMsLLoVAvH1Q6OwsQtmB7GqR9yFt1b
	1
X-Google-Smtp-Source: AGHT+IHwO+pfifKbJIxRDv2yCnDNVydYOpzhxr3ja/2l/LT0M+2FwHiRSOqoxfmQr/XyxXM7Gtjuuw==
X-Received: by 2002:a05:6000:bd2:b0:355:2d3:c894 with SMTP id ffacd0b85a97d-3552fdf969amr1086726f8f.66.1716536926180;
        Fri, 24 May 2024 00:48:46 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35579d7de62sm952553f8f.6.2024.05.24.00.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 00:48:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Alexandre Truong <alexandre.truong@smile.fr>
Subject: [meta-oe][PATCH] hddtemp: Fix reproducibility in fr locale
Date: Fri, 24 May 2024 09:48:19 +0200
Message-Id: <20240524074819.1981879-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 07:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110507

hddtemp po files lack the Language header and it is derived from
Language-Team header. This process fails for FR and DE locals and an
empty default is used... but reproducibility test has shown that
sometime it succeeds[0].

Fix this non-reproducibility by forcing the Language header to the
correct value.

[0]: https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/23/steps/32/logs/stdio
     https://autobuilder.yocto.io/pub/repro-fail-openembedded/meta-oe/oe-reproducible-20240503-9c4hilsr/packages
     (no nice HTML diffoscope output)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Alexandre Truong <alexandre.truong@smile.fr>
---
 ...Language-header-for-fr-and-de-locals.patch | 46 +++++++++++++++++++
 .../hddtemp/hddtemp_0.3-beta15.bb             |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/hddtemp/hddtemp/0001-po-force-Language-header-for-fr-and-de-locals.patch

diff --git a/meta-oe/recipes-support/hddtemp/hddtemp/0001-po-force-Language-header-for-fr-and-de-locals.patch b/meta-oe/recipes-support/hddtemp/hddtemp/0001-po-force-Language-header-for-fr-and-de-locals.patch
new file mode 100644
index 0000000000..38f5c88997
--- /dev/null
+++ b/meta-oe/recipes-support/hddtemp/hddtemp/0001-po-force-Language-header-for-fr-and-de-locals.patch
@@ -0,0 +1,46 @@
+From 04149f9ec9b37b5bb4c2b6c38d4560b2c122c483 Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Thu, 23 May 2024 23:28:42 +0200
+Subject: [PATCH] po: force Language: header for "fr" and "de" locals
+
+Language: header is "new" and used to be derived from Language-Team
+header. But, for fr.po and de.po, Language can't be derived.
+
+Force "Language" header to avoid having a default Language header.
+
+Upstream-Status: Inactive-Upstream [lastrelease: 26-Apr-2006]
+See: http://download.savannah.nongnu.org/releases/hddtemp/?C=M&O=D
+
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ po/de.po | 1 +
+ po/fr.po | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/po/de.po b/po/de.po
+index 3b79e08..d04976b 100644
+--- a/po/de.po
++++ b/po/de.po
+@@ -13,6 +13,7 @@ msgstr ""
+ "PO-Revision-Date: 2011-08-30 16:40+0200\n"
+ "Last-Translator: Vinzenz Vietzke <vinz@v1nz.org>\n"
+ "Language-Team: <debian-l10n-german@lists.debian.org>\n"
++"Language: de\n"
+ "MIME-Version: 1.0\n"
+ "Content-Type: text/plain; charset=UTF-8\n"
+ "Content-Transfer-Encoding: 8bit"
+diff --git a/po/fr.po b/po/fr.po
+index 2fd97c5..0b3bf19 100644
+--- a/po/fr.po
++++ b/po/fr.po
+@@ -12,6 +12,7 @@ msgstr ""
+ "PO-Revision-Date: 2011-08-30 16:38+0200\n"
+ "Last-Translator: Aurelien Jarno <aurelien@aurel32.net>\n"
+ "Language-Team: FRANCAIS <fr@li.org>\n"
++"Language: fr\n"
+ "MIME-Version: 1.0\n"
+ "Content-Type: text/plain; charset=ISO-8859-1\n"
+ "Content-Transfer-Encoding: 8bit\n"
+-- 
+2.39.2
+
diff --git a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
index b204ea4dd6..9f0d8aabcf 100644
--- a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
+++ b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
@@ -10,6 +10,7 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/hddtemp/hddtemp-0.3-beta15.tar.bz2 \
            file://0001-backtrace-Replace-struct-ucontext-with-ucontext_t.patch \
            file://0001-configure.ac-Rename-to-configure.ac-and-use-external.patch \
            file://0001-sata.c-Declare-ata_get_powermode-prototype.patch \
+           file://0001-po-force-Language-header-for-fr-and-de-locals.patch \
            file://hddtemp.db \
            file://init \
 "
-- 
2.39.2


