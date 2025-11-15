Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC02CEB2EE
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:59:20 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12473.1763225959509678847
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:59:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fQUUMBMS;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47778b23f64so20923875e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 08:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763225958; x=1763830758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ICksslewC9oTZNxZGcNdy1romb5lI7yDDxy2gNq1ozA=;
        b=fQUUMBMStGQ1yJVtILbk5+enBWfAVzxHqcOkigmEp0+MvLEZY4RxrYDrTA26EOL7nx
         TqwFvAb/BDuzTOOdLms+L4OSuQ99e4HJjCjoC5j6pLRtxKdYQD9KsqPtqQoGPI4qQ1A1
         CGP8gp56EnxlGQn2tE3js4Mnw0JefvQLMSuRu6MOpooxpNm4PwaDM3RhCTj4BocYSmfK
         d6kfE/nCAdgOREEBFmXvvd3Ztgk171AGaVTjxwt45MwCutaHrvwQ+HARQ6U4mMUinxpE
         JBH9dj10vAU7Ant0Ll+QBG1k+URgsv3+EKOfaW8F0x6MS0dJyIZVeOMg4znLuM7tSnPk
         s9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763225958; x=1763830758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICksslewC9oTZNxZGcNdy1romb5lI7yDDxy2gNq1ozA=;
        b=IfrGpM6gU2f3wToSLx9/n6o7RPHS/fM/kc6EvDq2IBXMFjzTqtspxSPaGNCGaAtR1P
         1GLgWgmVcd2g9DIt1eUWmvC7u0ythFp5t+ZFOUH0Iuiw5hIB1h26M9u7ot3amxMzd9q4
         ZP4QSBBCXT6w26AwCwbDoThDzuZz2p+DTwTbURPGwgzYNkoUqRdQaRQVxHA6xwiMbhPK
         jBlj7e13aX91xA6+BZFoJBS10uRlZvTHPhS/bCeqvPuD6g+3suw+vg0X3xU62YpN/5sT
         nf3IJXUJ4gA4X8SqUWvcBr+dbeXoJg8Knw2Yd2ydtpTH3R7w6fqifhM1xBojokUrU5Wt
         CaKA==
X-Gm-Message-State: AOJu0YwsyTAjIwSih+nghrrTZxTMyoDgZUWPPd4iCjgbPxV6GkA+TAyJ
	Pp7rSt7kMK2ArI2pyNnEuaCOsnM+0qcIUw+IbECJeR6lSQo4ikJS8mNLcX4nI2Lc
X-Gm-Gg: ASbGnctCR/bp0i9yi7IBtLFjQF8s7tq/8Zk2KyVPsTuv0HvGOR4spwruo2EuwJyvewN
	qmKVbgyFb+UP47dhVxZet7H1ungE62U78+rtiLRPabDe9TNOlD+JdV7f1W8e7Ix8PvEp4sMSAdK
	0eoZeGF4W4P9osveWjF72lmNdBK+GOac1pXMdQt4GOQII4zfSbt6XH3Xvd5EJq1Rd2EVeiSXulI
	agKsABqcZD8n/185y8nmTEYdyoHLAkA0c5AZpW4vzrsDjA1pjFuUzpQFZVx5+ZEVDrEli24WWW6
	ttg2PsiRJeKMNHFYa1UrYhgO/qCO/IRJjjaBlCD9938Fsk/QvPQKJSUiCIfwFaU7IevjNANqzzl
	iPQUNw4GGe9pJ++ly85BpOSFYuvl291+j3lzCEigJajHC6L+tYSt+4gcWUAjITkI8xPHgtyq53G
	weGHH8jTrZ
X-Google-Smtp-Source: AGHT+IEcB3fhZ6CDbuikzJuum7kNuERAKkCG53IhNiDGB+4PL2L8g6yTLP0HLIOsLtYZM8UZiyPNGw==
X-Received: by 2002:a05:600c:c4a2:b0:475:da13:2568 with SMTP id 5b1f17b1804b1-4778fe9a5f6mr58294155e9.25.1763225957555;
        Sat, 15 Nov 2025 08:59:17 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779a684202sm36119825e9.10.2025.11.15.08.59.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 08:59:17 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH] evince: fix typo in CVE_CHECK_IGNORE
Date: Sat, 15 Nov 2025 17:59:16 +0100
Message-ID: <20251115165916.1248653-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 16:59:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121736

The CVE to be ignored is from 2011, not from 2021.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/evince/evince_42.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/evince/evince_42.3.bb b/meta-gnome/recipes-gnome/evince/evince_42.3.bb
index 7b6170a2f8..498e1b0d12 100644
--- a/meta-gnome/recipes-gnome/evince/evince_42.3.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_42.3.bb
@@ -54,4 +54,4 @@ FILES:${PN}-nautilus-extension = "${libdir}/nautilus/*/*so"
 
 CVE_PRODUCT = "evince"
 # fixed-version: No action required. The current version (42.3) is not affected by the CVE which has been patched since version 3.1.2
-CVE_CHECK_IGNORE += "CVE-2021-0433 CVE-2011-5244"
+CVE_CHECK_IGNORE += "CVE-2011-0433 CVE-2011-5244"

