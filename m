Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04307C3DA4A
	for <webhook@archiver.kernel.org>; Sat, 10 Aug 2024 15:38:39 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.7842.1723304312185992851
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Aug 2024 08:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eGjtJPD3;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e0e7b421c88so2983691276.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 08:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723304311; x=1723909111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GCVhgv5yqsO42PeAFCz2o7S4rXvi07+PYXqTjYm44/I=;
        b=eGjtJPD3V8h+A7pNBP5b5jb1Nn+AHuU6VTSokAhMJNDbEXq6ThzpnIKVAqXabbRoBU
         HkCFXvSgD91ncdSMgg536Ed+hwo74aXn/QDXuvTIMmCMyef3P2kbdgIGDB1IaPsz+FJE
         alUbPoLkYN3AUU6+eJaMxr5vDfJxozghXMkpRgaLMf+7/byxayvZNfERqhlQabY42ueT
         CIhKKQMEKc2Q6FYCBWYdoh0xcYI35aG/+0S7gOWNqK/tP0HFr3KcYUSKHf26UGk4nKYM
         kXLmEgq8m6kU0KjfOYYwwZggxxa6DRGJBuaAeK0H8PMm8esRqMWVyabexja8NPKZaOdq
         zktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723304311; x=1723909111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GCVhgv5yqsO42PeAFCz2o7S4rXvi07+PYXqTjYm44/I=;
        b=b6HjOpe/TkdBAUs4/yYqgADVFSxDoNM+ScePUp+7fdgxzbH2wEQxKWPC2aWiP509xz
         YXfKofA6EvZYJMUXFg80or2CqtAII3Kwml/HSZ1wbROKIn2gYaFXv/VZb3yzTbOQIrBX
         S6uE5iQ9+kT5hTQX/9059suKx7KxvssYIHVSGNs3MtEALpoGtCU2tPX2QL1FXgPxei+Q
         70hgDMFyZpPFYPg6OgLSmwL17Be8zmb4JmFlw/xnGlWX4dIMoijoSjgnKZddoWrfKHdQ
         n5FpQ+EFhrho8mnFhx1VI9zDFvioSMqNxl4lAMsmGw+cMN0M5t+FV1kJdl9PNUK21ZCN
         T3UA==
X-Gm-Message-State: AOJu0YzbQn9hlHZt+3z1A15e1PQ7zdW+0gr6zeDcrw+hAlzY6h/3wN07
	EQjObzRM1DdbdPXu+EOvWHhnCP+EJ8PVc9SnYChNUkhk/ktQtqwW6K4Q5Q==
X-Google-Smtp-Source: AGHT+IFu+ostF9/1BBqVSt/dBTzo4yyh2NHWAYVrgOsL15rVY7+9Oimx9Y1STUb81eBdfXv+Ajs6Ow==
X-Received: by 2002:a05:6902:280a:b0:e0b:d8ae:cad1 with SMTP id 3f1490d57ef6-e0eb9df989amr4214021276.57.1723304311034;
        Sat, 10 Aug 2024 08:38:31 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:ad:eb2b:7538:7504])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0ec8c0726bsm382526276.39.2024.08.10.08.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Aug 2024 08:38:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ninette Adhikari <ninette@thehoodiefirm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 1/5] imagemagick: Update status for CVE
Date: Sat, 10 Aug 2024 11:38:26 -0400
Message-Id: <20240810153830.900538-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 15:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111745

From: Ninette Adhikari <ninette@thehoodiefirm.com>

Update status for:
CVE-2014-9804, CVE-2014-9805, CVE-2014-9806, CVE-2014-9807, CVE-2014-9808, CVE-2014-9809, CVE-2014-9810, CVE-2014-9811, CVE-2014-9812, CVE-2014-9813, CVE-2014-9814, CVE-2014-9815, CVE-2014-9816, CVE-2014-9817, CVE-2014-9818, CVE-2014-9819, CVE-2014-9820, CVE-2014-9821, CVE-2016-7531

CPE is incorrect, the current version (7.1.1) is not affected.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 388b8017f9c86428d5965f8c45d64f4477984ac0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../imagemagick/imagemagick_7.1.1.bb          | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index 6ab8a61b9b..61dc1b795e 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -99,3 +99,23 @@ ALTERNATIVE_LINK_NAME[montage.1] = "${mandir}/man1/montage.1"
 ALTERNATIVE_TARGET[montage.1] = "${mandir}/man1/montage.im7.1"
 ALTERNATIVE_LINK_NAME[stream.1] = "${mandir}/man1/stream.1"
 ALTERNATIVE_TARGET[stream.1] = "${mandir}/man1/stream.im7.1"
+
+CVE_STATUS[CVE-2014-9804] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9805] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9806] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9807] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9808] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9809] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9810] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9811] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9812] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9813] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9814] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9815] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9816] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9817] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9818] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9819] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9820] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9821] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7531] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.1-0"
-- 
2.34.1


