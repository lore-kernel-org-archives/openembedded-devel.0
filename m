Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E000A1099B23
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 17:02:16 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18037.1774026126952058260
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 10:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L+QL9Ad1;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c0c955a481so930478eec.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 10:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774026126; x=1774630926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ik0rOdkmEDRi9tLGuFywGeXApPnQNKGkOuvvOyIxidY=;
        b=L+QL9Ad1UMyfDi/hbumWJn70eKPFim9g7j1zymS1rfPE+mfd7TR57OP+hldrtWl83r
         2KI/n295TPN6GYvDkuliPEdFp7HAziBsfYeetTXdlg4vg7dLnFP4EmTlExmse5uQmITD
         Y1uIKu5JhlcfiuaPjYsnPX3c9HlRfydBwIDmMc/PzkhUZ585hONYrsxieW26MsxvognZ
         YuPwrH0ZAyj2kjP0/GiDY8QNT1wRN2CfEvvBUx2JmSQsHuDm2z4AiJB/C+9Bfn1/gWsu
         U10RGWi8qMlwNMfcsvjaTg9/BkhZ+uLFggNa8T3bUsGbN4GLGM/74j1UAavjPMrloSXF
         6yzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774026126; x=1774630926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ik0rOdkmEDRi9tLGuFywGeXApPnQNKGkOuvvOyIxidY=;
        b=hGGwHEbNbn/VM0VCpgNW4omX3/wQ+erszxM+kHcD2kJtLCgeZ0AwKjYzxYOyfzmQvp
         pELD1Stm/gjFjFnbPGf3dQDAKBWvhqSUesHeKsGeZ0/BTCymV3C7oCxWD/dh9htwLc++
         ggrFhGzKamC8XqRGCRNQownlfpcIdCyvaeAuNe/9ZAgxZyDwKSf17s+2g8GAGnkCFYCa
         74nrNOXDGGT2hvUx9oNwfnVJVBBRzkr76aE8qckiorXJm9ldvICMvuE4i/LTfG3YzAjp
         fj2N5nA+rH5fDubPMGwj1J5Bt3cBaE39fOHh7DtksIm5rhX6a5kKeSc6vF38resRWKDH
         rnGA==
X-Gm-Message-State: AOJu0YzoqvJbNbB1ffX6uEojJLzWYBZonl55GkyhZYNSqH9kPizW6G+Q
	Zy8KvPyX74Z4QU+WqUtEPmFiTde0w7QU3DPiZ0luVRCOHTK5XA7ZxF0uM//MCOQl
X-Gm-Gg: ATEYQzyMbv7dl/6LuZargu7IMm2YPJ0FrcL5zaMuXeeKRx2zGRMcc+mXrlN9Mf+YxwA
	chCqS7uZHOOM/tSVCLvjwCdFrBPA1OkAIUd+Uh0kX6YeGTEQQfGT2S0UvgrFzmh0+o9S71mhcrW
	1LcHHgk8EzLxn1UbxnGFWW2Bgl6IOPveec4tSeSelBNTjPfB1OyGh41qBLhRXYIb+B3bbxRpDKk
	NJKFdmp6ZC5xofxCTTUsjtGFS3mt/lNvq5lxK0CcccPhov0TBznIAXdI7yHylyIWcIyFPyJD8lx
	uxh1K7xJvFc7ONOUYTNjV5YS21KjgMOx7Y6quOSKkTwYaUepJJaUQ2jYBLx2dULbWKkfQki8M9O
	qFRWt+hm+39ijolEjG9jStwFCL9V3BSF/PhDs4y0zmKigPinf6Vpigr0MIM0qMeUrF516aygyY9
	hgSCs2I/Ros52MErOl1GaoMm2v/dfKlvFUS8FA94nLthfLgss354wWAorlID7M+qfd9t390w1O8
	14rBc6/+sT5ZOieZ3WdT6aGvdjNkb05yfjEyfAGllJmtY4og6/xwPiR6XtL
X-Received: by 2002:a05:7022:41a8:b0:127:33e0:ea33 with SMTP id a92af1059eb24-12a726b3177mr1805861c88.22.1774026125571;
        Fri, 20 Mar 2026 10:02:05 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14caf3sm5148632eec.5.2026.03.20.10.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:02:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 7/8] memstat: Pass OE environment CFLAGS to makefile
Date: Fri, 20 Mar 2026 10:01:54 -0700
Message-ID: <20260320170155.1413929-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320170155.1413929-1-khem.raj@oss.qualcomm.com>
References: <20260320170155.1413929-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 17:02:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125448

From: Khem Raj <raj.khem@gmail.com>

Helps with reproducible builds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-makefile-Do-not-override-cflags.patch | 30 +++++++++++++++++++
 .../recipes-devtools/memstat/memstat_1.0.bb   |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/memstat/memstat/0001-makefile-Do-not-override-cflags.patch

diff --git a/meta-oe/recipes-devtools/memstat/memstat/0001-makefile-Do-not-override-cflags.patch b/meta-oe/recipes-devtools/memstat/memstat/0001-makefile-Do-not-override-cflags.patch
new file mode 100644
index 0000000000..8ac7a8ff54
--- /dev/null
+++ b/meta-oe/recipes-devtools/memstat/memstat/0001-makefile-Do-not-override-cflags.patch
@@ -0,0 +1,30 @@
+From a0806283da1b82b511aa879fa2f71deb01f849bd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 26 Jan 2026 22:22:54 -0800
+Subject: [PATCH] makefile: Do not override cflags
+
+bitbake environment passes correct clfags for OE env
+overriding it means some important flags for cross-compiling
+go missing and causes
+
+memstat-1.0-r0 do_package_qa: QA Issue: File /usr/bin/.debug/memstat in package memstat-dbg contains reference to TMPDIR [buildpaths]
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 29f8129..5426bf4 100644
+--- a/Makefile
++++ b/Makefile
+@@ -3,7 +3,6 @@
+ # Copyright 1998, by Bernd Eckenfels <ecki@debian.org>
+ # This file is under the GPL.
+ #
+-CFLAGS = -g -Wall -O2
+ prefix = $(DESTDIR)/
+ exec_prefix = $(prefix)/usr
+
diff --git a/meta-oe/recipes-devtools/memstat/memstat_1.0.bb b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
index 6289f3a27a..a0b4d0b9cc 100644
--- a/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
+++ b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=87be186443b1ac2cfa466f475e1ee0cb

 SRC_URI = "http://sourceforge.net/projects/memstattool/files/memstat_${PV}.tar.gz \
            file://0001-Include-limits.h-for-PATH_MAX-definition.patch \
+           file://0001-makefile-Do-not-override-cflags.patch \
            "

 SRC_URI[sha256sum] = "245d5fc7fb87bcfd14486cd34917cae2856e799559ac568434af12c4852bce94"

