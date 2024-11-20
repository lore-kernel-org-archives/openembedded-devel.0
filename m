Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC4CD711BF
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 16:01:05 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.17175.1732118457972863990
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 08:00:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TI2z7Oc+;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: hiagofranco@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71e4e481692so4130837b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 08:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732118457; x=1732723257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u9tSghUKFD3ZXgNhTRkHw36Bcmpkg6xazGVbSnFhLLM=;
        b=TI2z7Oc+ZEu1EGY+Tp1LFmX6kqQgBLmfDY1Mtp24S4p9MmXQ2kmf6oHrc4r7Rr03Zw
         uVpguVXWsW2+cHG4S8Lx+PZRBFohEAxOndWa5SR3fQ0w+QEye/qGOK8gpEMYRSHF08yy
         6yHNBrSttXygtI6mVgBIR/zvwESmWvthrIUHKXRBthIms6NG5Aje0D834ose7Usettfx
         Qe3bwMEXvNZYXNKqP2zdOW5XM7vCqplVy/hDE47NUd4HurzjcNU9JtKLzLJSW+g7CZXU
         EMOUt3TECmHI0OMxm2yQZaXi7KRUMs2MbMk9A8PrJObrUEFCHKHPITLyo66Y3ChbX1/4
         Cu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732118457; x=1732723257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9tSghUKFD3ZXgNhTRkHw36Bcmpkg6xazGVbSnFhLLM=;
        b=Ng5S5L7+/b/VCZ+eT6TUbhaQRwFWo63teNPW0SlhflqwZrHf3paczvF2BYerwKISEr
         RGh3cnLK09NzjHfewZZMIzsljrx0wPLNrWKParwRuJZ6YTSKEOxRJeDnukrwP4JNKtTz
         PnHL8TJFJi408CAyPfcSq6K5JiFtgzcmg1qMswcsyJ+gjfrU/4bw8EK81oEi8YSp6C4Y
         XvXFrpa4sRfOG3ggzaZS5eL7Z2HQdrYFzDMWKCvn3c2qfvYUjmv+pKNFU28BgqzTAdzp
         nIdmrJdUhBbulwyJLzPVpxkSdQ4fzlrH8dGuRH2VihOaRGNL13v/dcgetdpZ9PT61MGw
         G6jg==
X-Gm-Message-State: AOJu0YySgYHX2tN0qrM2DgqnKDY755I1Y8Fu7MHuWUhbEX7kZGt8WA6P
	p3/Jod25vsjZ4dqhLiOnmCjHaMFZr4phVNbLtxbdGhotRTgS8UsUF6O3EA==
X-Google-Smtp-Source: AGHT+IGWa6KWCtYcF9bH9s9I1O7wKc4oLe3tjiczFJ5+w9dr+XVPnPv7STOqqdlO5fU/W3lUbSpq7Q==
X-Received: by 2002:aa7:8886:0:b0:71e:cd0:cc99 with SMTP id d2e1a72fcca58-724becd93cemr4572245b3a.4.1732118455496;
        Wed, 20 Nov 2024 08:00:55 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a7c0:c7d3:a476:6822:1e8a:216c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724befe99aasm1853076b3a.184.2024.11.20.08.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 08:00:55 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hiago De Franco <hiago.franco@toradex.com>
Subject: [meta-oe][PATCH] hwdata: allow to build native variant
Date: Wed, 20 Nov 2024 13:00:05 -0300
Message-Id: <20241120160005.8473-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 16:01:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113929

From: Hiago De Franco <hiago.franco@toradex.com>

This is a requirement for libdisplay-info version 0.2.0, which fails
without hwdata-native:

| WARNING: CMake Toolchain: Failed to determine CMake compilers state
| Build-time dependency hwdata found: NO (tried pkgconfig)
|
| ../git/meson.build:24:11: ERROR: File /usr/share/hwdata/pnp.ids does not exist.
|
| ERROR: meson failed
| WARNING: exit code 1 from a shell command.
ERROR: Task
(poky/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_configure)
failed with exit code '1'

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 meta-oe/recipes-support/hwdata/hwdata_0.388.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.388.bb b/meta-oe/recipes-support/hwdata/hwdata_0.388.bb
index 63fcfb22b707..dde9647479a3 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.388.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.388.bb
@@ -24,3 +24,5 @@ do_install() {
 
 FILES:${PN} = "${libdir}/* \
                ${datadir}/* "
+
+BBCLASSEXTEND += "native"
-- 
2.39.5


