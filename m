Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FA5EE0AE9
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 12:23:42 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3905.1770467012243454894
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 04:23:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TQSNwiyH;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso17367125e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 04:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770467011; x=1771071811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wo53EsEwgcw2A0tazzRv9AsCUy/Fq2w6zCsCung2ns8=;
        b=TQSNwiyHHNT3os6xF92riAZ2+HZEEtDBR80lW7DDIgvlyjCYExsNKxaDhE0wBUvZZa
         QYGOZB2vem3K1vGtiM4WvpPYoMjFsomfUHIjydWahW46eOMRkc7DgTgvSgRZBLPsg3oH
         XP1ApIZBz5xtLXCc9dvjmT/nae5ClvlanhXadoFyf1TEyur8l0AHJo3LWHOVfNx8AvnQ
         EkG16jNvEcQnZgi0QgTt1jG+8cp7HUGdfvO8pojtEc1Wfi0n0ID9O5KMN5hqgz8UOKG7
         ihaK7QWZ5rXxDJaysRMNo1Fb6QmPOl57aJKjC9oBo0RuL5y3X3IJPxUq27w089fZTgIT
         tYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770467011; x=1771071811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wo53EsEwgcw2A0tazzRv9AsCUy/Fq2w6zCsCung2ns8=;
        b=Hu9Ih9JEhYBZ9ui4EF/zaCk3SxT27KC6Ad/B8gzbbTtl6TfPG1nfWwFOeAJpTF1w9y
         2pjB4ijCeZkIlWj81iSskaDrHDVWX1mEMZpfraofI27ajz5P2wkUJIdm7QCNTmd8CoY0
         ie5XiZgDgjMpZ8DriognrDc4ffZgpDd8qL4iew+C/4ww09Mptmw6MR2HsQPI56NWR3Tp
         sNx/0/bcw2ToqZ8woLbb0bALwq0fhWNR+TWdRuZASGG+st4UDRXSwSbPbdT+I/x8KGmO
         ahhfUR4HG5cBSQHHQy3G5OqcZtMLC7d/0q7PvDyHXTwwgL6LgS0KpW/2efWiVObNZWBz
         /6lA==
X-Gm-Message-State: AOJu0YzY7Du+Kpw4G2g3nILYuy2uuAkx9Z/32U9iJvio+a9SsY82UcoE
	mAQRxLhydlqLCywScODnByMeA1nTaj1mIJ933ccywBn+cRKkkgioS1hTOQxPGw==
X-Gm-Gg: AZuq6aKDYM52l81RYl5g7znJoC9Y+eW9WUrgpyec18CY2E7fxpgHZOkqkWOfHT0uTBm
	iZzzEFfA+bVTQ1lHQIDxAfs3PWzog6+HRKA4CWyZpb24Leq3+aBavgs12A9Qt7L2NC+8SEaLhip
	oPDdnwdIA/M6WKqTGuiBZYoYCUCnaFGgecvmjiJyL+gX+wgmeb6+HqaDfCItkjKfM3xsJIYD/jI
	X3oXgCThSYCnnULuIq7oxgmsGv0wIqvAE17yslVTcAHT26ugaKVOqpHz0jpvgvNLR1IQHdKraxI
	e02imbzf9wIb0pQfi+HCTmD0UegmsSg7Qo6MwEMS2ZV4S1uh/ey6tB8E3eGW0g97HpDiRkKDlsb
	v4FM8wtg2jeFLP0knexpHA8PIaV0PXtZ/I/UWVkdsp/jex7q4+97OmA85hgvTXjg6J2TK8tnPCY
	mxLdaMR2IF
X-Received: by 2002:a05:600c:c106:b0:483:3384:a873 with SMTP id 5b1f17b1804b1-4833384a95fmr8034055e9.36.1770467010531;
        Sat, 07 Feb 2026 04:23:30 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320719bf4sm112653835e9.10.2026.02.07.04.23.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 04:23:30 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 04/12] gnome-calculator: upgrade 46.0 -> 46.2
Date: Sat,  7 Feb 2026 13:23:19 +0100
Message-ID: <20260207122327.664604-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207122327.664604-1-skandigraun@gmail.com>
References: <20260207122327.664604-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 12:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124260

Changes:
46.2:
    * Updated translations
    * Fixed currency conversions not working

46.1:
    * Updated translations
    * Disable undo action if nothing to undo
    * Keep last conversion options at launch
    * Fixed event controller propagation phase

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{gnome-calculator_46.0.bb => gnome-calculator_46.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-calculator/{gnome-calculator_46.0.bb => gnome-calculator_46.2.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_46.0.bb b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_46.2.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_46.0.bb
rename to meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_46.2.bb
index 5c7e27378c..2f25135963 100644
--- a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_46.2.bb
@@ -29,7 +29,7 @@ def gnome_verdir(v):
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-SRC_URI[archive.sha256sum] = "44694fda6b6233923f5c10a48d02d2cf5724e011a8a85789074c953101f33bf1"
+SRC_URI[archive.sha256sum] = "d631bf43838b259d0c21f70dd4cb5b8fb7782a024f464a334f9d3cf1dc137b4b"
 
 FILES:${PN} += " \
     ${datadir}/dbus-1 \

