Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417E9C5DF76
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:50 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24516.1786747604899802630
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SCOdjl/t;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1362848a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747604; x=1787352404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JMZiZF9aGSz5phlEvbM2U4jLjJ5AK6ujf2tmoo1U4JI=;
        b=SCOdjl/t/uewXiRi/3n9YsUkaqAQvEmxJ0hR25RoUM2n4c/s/tTTs8TXp/I3UZWBsS
         64H9wxBRnz0/0aywA5fxSeOHWx5CV1RsXp1Fl0OWU7PZcprWdoYlGGAw5zgZtTfMXeic
         U/H9MKJUGtAKX7/mB0S+GtdudvK4MmljP04SpyLI7cXEhBlVh1u0v7ckbtRb8c2KZNic
         SakTCDY/JK2g4pAW97H3GgXdvYziYvsG19aIL7BEJuHVOwLQtDoVBlff0HvMEMmxgfZw
         qh+mwOEzy0np7rX0xOJHySGx3+cf1ZT0jlV35HOaKIf+wo8Zb5YPYK48bxJ7ZWyr5o9j
         eyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747604; x=1787352404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JMZiZF9aGSz5phlEvbM2U4jLjJ5AK6ujf2tmoo1U4JI=;
        b=N1OHB9MtX2PpYhN6S4wRpqZq/XZv/WPf8ZviOx7FM+qlf9KCLKy+S5Ii3vF5HlsU1V
         3CkNHw6lsUPOVwDfhzNdk0N4etA4UmeCCVb8f1vTwtLSI0CtgVaaE+P1OYkArxshJXYw
         XHOeBeRC4zHy07h6QfKDK46nDKplVqLFEtEF0rl2yuIAgP7ISli7nwBQSNybglO20ich
         vrAqz7jyFeS7uQp0PbHBgQIc9Rd7dIxYOJRPbGbMu4TvBvN9REBSWenVe6IZHxpKNBpP
         ldzohOceFMpO94jemBrgX3z15e6AtSoQVztbRV+Ba5wOzX/r6dn12Xg57JTgabnSBN9J
         RxaA==
X-Gm-Message-State: AOJu0YyKUA1WvFTM0RBBR0zcgbCnSNsAY7o5LnxJzZLgugWI8uFTlpLZ
	iHUe1t8BOYbg3KOm0rBTM3D+ga66e6wY6z0qLSdPCa7rAaZ6iGwbHs7SscgsuYuU
X-Gm-Gg: AR+sD12I1b7RuvrrHs6ALo+Vcu1uU4AAjNxHcsYA3R/YYOsKXb7/y37fiR7YEYUEYCy
	vnAMzadhk3ggNmHGJ+fhnIjm/gPabf5MrtToex9oby1mlL05tzTAh00Wltro1c/xLR49CgmN3Uk
	VRHBfCWOL/t37hRhjpOBjwaJewA88RQeIw1hs/TCYgBLdt8yccYBOY+5NGStTk9F3uIwvZTlN/8
	fLT2qEpCwRJaO+25zQuMmVlbgjvlF6hS3c/8RZG4BOYcrMTYOxsLYMca6D+xXbGCa9RQtPScZ7w
	xhWaM7YIv5yDrr8HKM8QS+sslaycQUWmb363z6scDsskbmsRDOZwl8Egn9+rg7jK7u28F1Ojsnm
	bl5QwY1lQ0nZb8EBjAaakreV53McL6xsJN9PXYQDagZC8yw6Zq0O4PWQ0ggQUPI1LfygRRzV/B/
	o/uCwME+rehCN3tnVtfYS3qDsDJexhdrCbeIc0nktvchiLXJc93vUC7htM5toOuOTbtgj3MH8Ph
	zD8DceZU7URKNv9RaHBCUDvwwyuphKYlDZvRLcCCroNBVNsboSVmWnVGVJiGO0GY3KA7w8diGRZ
	s2zSR40xtr6dyOC2WwZ+i62OVTfgh6s48hUlWcl3P+GkEHSWNalRpG00mBkaV88lxFePdzJavBQ
	+1BSEf52U3lOMFb29yNn/d3fUIWNrOzYcC3IZykgu+7wXyQ==
X-Received: by 2002:a17:90b:3842:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-3933b828631mr7908908a91.6.1786747604136;
        Fri, 14 Aug 2026 15:46:44 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 055/109] pstack: upgrade 2.12.2 -> 2.17.7
Date: Fri, 14 Aug 2026 15:44:41 -0700
Message-ID: <20260814224539.1523174-55-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129119

Minor release; see upstream release notes for details.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../pstack/{pstack_2.12.2.bb => pstack_2.17.7.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/pstack/{pstack_2.12.2.bb => pstack_2.17.7.bb} (84%)

diff --git a/meta-oe/recipes-devtools/pstack/pstack_2.12.2.bb b/meta-oe/recipes-devtools/pstack/pstack_2.17.7.bb
similarity index 84%
rename from meta-oe/recipes-devtools/pstack/pstack_2.12.2.bb
rename to meta-oe/recipes-devtools/pstack/pstack_2.17.7.bb
index 98cf948de0..a45d6b69ad 100644
--- a/meta-oe/recipes-devtools/pstack/pstack_2.12.2.bb
+++ b/meta-oe/recipes-devtools/pstack/pstack_2.17.7.bb
@@ -9,10 +9,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=671019a96ba80415b696240ed2ca5e80"
 
 DEPENDS = "tcl virtual/libx11 libxt zip-native"
 
-SRC_URI = "git://github.com/peadar/pstack;branch=v2.12-maint;tag=v${PV};protocol=https;tag=v${PV} \
+SRC_URI = "git://github.com/peadar/pstack;branch=master;tag=v${PV};protocol=https \
            file://0001-reader.h-include-cstdint-for-uintmax_t-intmax_t.patch \
           "
-SRCREV = "98c4ddb7f0faa5221ea0a5f38105fc2a2f5cbfe7"
+SRCREV = "a7b64eca7a0a57b6f38de770388013a4fb3be739"
 
 PACKAGES =+ "${PN}-lib"
 

