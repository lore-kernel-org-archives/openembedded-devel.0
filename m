Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09743C43327
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:33 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69107.1782634286500880314
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BxORxFOK;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so4928215eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634286; x=1783239086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YJxC89gq7RTzRiTIEC+h/1ElvCFiGnO8NIeE16Ce0RU=;
        b=BxORxFOKEdROh8hr48J88UehqG+Dde4EAavqvxjAbzTnEFrUpzSNwZ8KTvU/wXv6/N
         njCegzrnbqOrw/Z/KPoM1gz+R0Hdmb+nhYj/sQX/oDhfBGVTAFx9Qs0CVHhjbBkzaDKD
         o74N1rCxk3onnb3BLTFJrb92DtyhnXkZg91C4hXXcqxH+QLUtOsRpFeF0vDrKHYA84lW
         V7ir5MWOYq+jwgqY3EVSvred4DC81jJWzMQzP3gIXJWcXoCVDsfhYykxpPGrIESvWyIM
         OIAO+AqeX2TN6rdki5d9cgeS4fKTEv2q+tbrII4tq9FgDy7vEatuz9O8TB2oOxFT54wU
         Bkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634286; x=1783239086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJxC89gq7RTzRiTIEC+h/1ElvCFiGnO8NIeE16Ce0RU=;
        b=Cnd2769BehbmQ4PnIs/Q83L/HeLPl7YuH0ENVvUrOeqkmc4xTa75bEpEHXSo7z+MYO
         FHH8g+bn7DdvOYaeEH+Pk2B/GXWz6ChkbTue6RUd8q0ZJ/Ylu7abMwNL22K/+je3x0xH
         V/rxqRw1DNxxBd73HbIkl/DzYqVpipuFPWL4PjuA0EwUD6jE1oFrSVJKB5yunfh1ghL+
         WLSJoy20b3JvujnjZ4A51pFEkF3UDmbpiOgQPlWiOpAY1oqiRjiYbzceVcTjgvlCiAhq
         59AtxAE/u3xvj75yG2gHcYZGs7w8y9QK6R2jAwC9hRBff6GkREBotCZnYn7evi3sEOa6
         V7Yg==
X-Gm-Message-State: AOJu0YyySohL6gDxIAkK5AezD1PO0hAYlowJvDIncgxhTS8+PR+zeC2A
	m9o67dG4bZ61M9ZZzmsaOUwdfTUP68mWAekVG11FNE1+AMWd+K3OmlEfrZqXQdiXY4ggNA==
X-Gm-Gg: AfdE7cl+nRmlD16/Zz2/t38+B6PntHEPr2khZK1D2b7w/3rhJQHNumRCaMemcWM2Teo
	LFmA6SVYgm2pProe8O0BOh9NGeCTkrzh7D/zSUQZfVJz/9wsgMSH1SgUAKaKLxJRgGhK4yJd3qm
	Ar9ti5rR7YIEjulnQz0Iy6ZUvhdLPw8q0vWRNBkAengBPRWWYYvFxoNmUvfygfKYNzU/mu8LALE
	kxpcBwhgb9UNZBR3mD+c7Bxy+WEVjzfXg9aMF3r2VINwONeqy3dvIkz1T6iz2BqmMZIvn2CWXIa
	hBuXR/D3j5eAmsbRpvdafKz1KceMkwRo1gvDP/ik42fGnBh7jbBQCs5/VpiuWZX8JmdWFxrl+mp
	MfIYdW84FVa2Qg0oQacvORagoKiBTsU/1drhaZlsoHZQkX9xDks+6AVIr+DC/v/OwREXSXcrX6h
	bLZft4SPCMSILoxAbyqSDQCydr4BNp+cZJ3Q89WmFO7GezUyCb4xJtNgktn+A2/AZ7tIFg76JLU
	FRn8DtJbi971Lve8C9ZONBICdFC00zx3926zaOmg7xTlZYigHT0FprrZb26q356hhhYmcEC1WAR
	iDIh3B1fx0dAFOGtK2Ojmc2Si3FS9A==
X-Received: by 2002:a05:7300:8bab:b0:30c:56a0:ce3f with SMTP id 5a478bee46e88-30caae2f116mr7733632eec.2.1782634285635;
        Sun, 28 Jun 2026 01:11:25 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 001/128] ifuse: upgrade 1.2.0 -> 1.2.1
Date: Sun, 28 Jun 2026 01:09:12 -0700
Message-ID: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127811

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../ifuse/{ifuse_1.2.0.bb => ifuse_1.2.1.bb}                    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/ifuse/{ifuse_1.2.0.bb => ifuse_1.2.1.bb} (83%)

diff --git a/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.2.0.bb b/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.2.1.bb
similarity index 83%
rename from meta-filesystems/recipes-filesystems/ifuse/ifuse_1.2.0.bb
rename to meta-filesystems/recipes-filesystems/ifuse/ifuse_1.2.1.bb
index daeb5b9be2..82dc3b714c 100644
--- a/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.2.0.bb
+++ b/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.2.1.bb
@@ -7,7 +7,7 @@ DEPENDS = "fuse3 libimobiledevice"
 
 SRC_URI = "https://github.com/libimobiledevice/ifuse/releases/download/${PV}/ifuse-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "5c584ae999ed52b386b0d2d1af8f8dcba451cddf31d7cd24367b18db0a9a5a9e"
+SRC_URI[sha256sum] = "9d490470ba6553f8052b385bb5330462e46fbe82131ebe65be47a1cc1c70e857"
 
 inherit autotools pkgconfig
 

