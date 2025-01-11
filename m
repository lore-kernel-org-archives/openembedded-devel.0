Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB15E7719C
	for <webhook@archiver.kernel.org>; Sat, 11 Jan 2025 16:31:37 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.18612.1736613094020542572
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Jan 2025 08:31:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B9wJwHwj;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso1616433f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Jan 2025 08:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736613092; x=1737217892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zlhlJpH8tYNe7cOTaJsVlIDWDtMfRjd0CEDbkpYLUnU=;
        b=B9wJwHwjLENxoIRDo5BWIiidlUp3BS+X3nKR5HC8QT4YzoO+cK0Q2ZtFBnOeAgZU88
         V3RcYJKgbGSWLBBP6swnO/oCVAXrNZ4JIhsRWoEY34hHGVuM8tieKEk1M5tGjY1hC2db
         QBakA72jZMUaa7KbNaSsP3IrFD/yf5skYr61saMsveBS5Va7+Ra1d935mVYHvKFCB246
         Jy+NjzLXZnl5QzPJgSwUmKqPVBmwjHoIUMy6OkLoOcX1/N4iHn2jzLvtQJC9FpgyHNMa
         6LBGqdjLAdQPX/AWu7vVw3LOYbgmKsRmO75FpHtqW4bKpTVihj792vhwAHk9J2P0p/oX
         M1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736613092; x=1737217892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zlhlJpH8tYNe7cOTaJsVlIDWDtMfRjd0CEDbkpYLUnU=;
        b=IyRpyHkRilNhPYtvVoycohRXE5UZ2+JBp28BEVmBqjJLlx2aZKyhHxk6nuh8698J6h
         M+SV/ezFXB6W1/PrSiwcXefec+sjAng949B87NIaONmNYcvE0j+gS5p4P2K0Js1TSSBa
         VV83dYAniXWqXb6YjEqTYRXiI5ynNdgWDl1aJYEzllfUQzwKGcHrRZ4nAxOPhMuEojdB
         9nlyGh1EH5Yflc0EZEM9xgIyQHsHP7G6/+9hOpTv1YbxMr9kToWorjzR2fMNO3/1UJNs
         qUMEVqdogzkVO3mY+rkxC8G+DeeINUV9nWDZ8UGy/bLTYctze5iUuqeNtHQKPLvXTwjH
         9XBg==
X-Gm-Message-State: AOJu0Yzd13MsG/LD2K4tXx+Dq+bvJ/LJD9PzdrvX2oE3zA+xRmCgRnlc
	43j9NryRzQ8wFMjrkteu8EHdSfIM31b7bbp5sCKtOwJcJb61nbGonKHivA==
X-Gm-Gg: ASbGncuPDV+vWnVSyMpPZk8TbPPdVPg0aPFq+G3iMGddJHOVkbnNWINSboevNzyButn
	Rf1iqFvZN6hJVNCTUBOtsbp2ddIirrFLS5WP9sRSCwhtdhjfJuRbfZETeOxuC9c+FH5flOu6yYY
	Se1ZxQpF8/6AYCo5G2mlNUp4wkBDI1AvBKrMp3co5ENQoDBG8mgQtf+wT44SDeuyDlMLPG6S4JP
	i3Z2qY2VYseaAMiozrcelrjP8aliF7WihkwE4ersVJtronysXWSSuatvyDN+vHEVRnniRRaUl+k
	3PcH9g==
X-Google-Smtp-Source: AGHT+IGxPXuiM/FkYlbhubY2P8qBoh0O3Ulbr1RqhJ4CjniDpNuAkvSDxdGQ2V8/eFT2ZIjAMxtRHg==
X-Received: by 2002:a05:6000:1acc:b0:385:db39:2cf with SMTP id ffacd0b85a97d-38a872c943fmr12362436f8f.12.1736613091363;
        Sat, 11 Jan 2025 08:31:31 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b82a4sm7670148f8f.72.2025.01.11.08.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 08:31:30 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: gudnimar <gudni.m.g@gmail.com>
Subject: [meta-multimedia][scarthgap][PATCH] pipewire: upgrade 1.0.5 -> 1.0.9
Date: Sat, 11 Jan 2025 16:31:03 +0000
Message-ID: <20250111163103.911735-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Jan 2025 16:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114815

From: gudnimar <gudni.m.g@gmail.com>

Bug fix releases which are API and ABI compatible with previous 1.0.x
releases.

Changelog can be found here:
https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/1.0.9/NEWS?ref_type=tags

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 .../pipewire/{pipewire_1.0.5.bb => pipewire_1.0.9.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.0.5.bb => pipewire_1.0.9.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.5.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.9.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.5.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.9.bb
index 1c51fcc15..15cd6e9ab 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.5.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.9.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "dbus ncurses"
 
-SRCREV = "a2287be601710eea0d073261223ec34b92384c8a"
+SRCREV = "467fd4a02e37f93a8d27448eef548e247f020466"
 SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=1.0;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


