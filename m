Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0DCC25B7E
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:10:38 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.3092.1716315034774941177
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HU8b4a1e;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ec69e3dbcfso3612755ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 11:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716315034; x=1716919834; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TQR1bekewoarKPm7NfK2B+SiAVN+H0dggRIFr7YOxo=;
        b=HU8b4a1efEuhhphViPcsSvSFCj7oq+WYhMviBCpoPXY6jk01Ehr6X27eYBrTMGNl/t
         YVnWV7oKcYViRUkIPmByTT9cdFtd+Q/7QHaWjhgveIEFlZqibp34kmWJRIKRzGjbNzH7
         LhYIHlGqEWsr5ignVKcT2b6MARWmcIdpznPK/AzXpnBJs6rsEUyx3Lo3M2Fkk+RXo6YR
         dP84c49RcWLEawUa9lvUnkJiTbap6kjibBSeTyk+dcAoM36UJkr44OP5SJBCsaesc2BX
         8iwZKoyMhjY2EWKdA593LrXPv+koGL85NAW4WiIFPEQqeuVNmSf09wiZ4+gIQDg0+UDd
         CpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716315034; x=1716919834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TQR1bekewoarKPm7NfK2B+SiAVN+H0dggRIFr7YOxo=;
        b=KRUlsXh2IrCfpRySJMOA4JDDcPZP4EaMssohSwmDMepbLvy+31FepPSyOX/8PeCXGG
         b6x1D48sN5xBvbK0zI08NEi4SGnIv+d5GJoXz0NCU7SsOzAfa63J8k8utpsguzoOB6NB
         YmiUBcBIu3rn0mYimwaufJqwF1sz0eYXWcfrKf2qCO3l6LCjhjRaa6Hk/pbLe6uM6VE2
         wqPf0VhMcM3BMirYs7fnUzkNYkcLiBNvhJ8dlFDJRyusTy84o2oKxJJX+SXShRzBgEZ9
         nBMAmPn1aqq1eOiQl5Xv8m0/euMHnxJHX2U7cxLy19nl6KbX9xAsOA+ET7OG+tYuuIlM
         79BQ==
X-Gm-Message-State: AOJu0YxQi3gcB+O1ChYBkIu3VyopoIOR0HNiuD/YH2ce3gd3ztYGVIMf
	JZMAiMOKoX9aUyy7eaRLqHVD3MJXPVXE0IHTIjkbILgtzvwxdMFedRQXbPDaRzo=
X-Google-Smtp-Source: AGHT+IFEmITY/n0pm0HbMS4/OrrMf7h3JkK9RrhDdd6iINPY0pIqV7QXI7P5YWhXBzQ58XdnwZwfWw==
X-Received: by 2002:a17:902:8f85:b0:1eb:1af6:e7ea with SMTP id d9443c01a7336-1ef43d2e9abmr312442565ad.34.1716315033895;
        Tue, 21 May 2024 11:10:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c136354sm224799075ad.244.2024.05.21.11.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 11:10:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][ 08/22] xfmpc: Disable incompatible-pointer-types warning as error
Date: Tue, 21 May 2024 11:10:09 -0700
Message-ID: <20240521181024.426176-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521181024.426176-1-raj.khem@gmail.com>
References: <20240521181024.426176-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110457

Fixes build with GCC-14

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.1.bb b/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.1.bb
index 1e02bbe54f..73eafeebcf 100644
--- a/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.1.bb
+++ b/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.1.bb
@@ -13,3 +13,6 @@ RRECOMMENDS:${PN} = "mpd"
 inherit xfce-app
 
 SRC_URI[sha256sum] = "4867d5dd100fa42ab39ebde6c784ec21ee31717f1adb3f4da070dafb3848d96d"
+
+# Fixes build with GCC-14 which enables incompatible-pointer-types as error
+CFLAGS += "-Wno-error=incompatible-pointer-types"
-- 
2.45.1


