Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6AAAC2BB3F
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 19:06:48 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.21988.1700075205004045406
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 11:06:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nMi5+RtU;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1cc131e52f1so9106185ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 11:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700075204; x=1700680004; darn=lists.openembedded.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O62ITEv9zum16VZfzwcJcVUkHcD38wLHZBdt9ewlAmA=;
        b=nMi5+RtUuRz8aOt/2HeRXHF3wvj5PdF6vcEWXTO/Q5m6Ymbd+xYJ42gz+F8/JvMdR5
         R468Z7PtlSPaXtBBK6Lh8+ajUX9XpzrhBYAiyDwnNDSdWqDn088uGftQtAP0yiskfNV/
         Sr1ukyyftySgNA+peVpwnvDPaCOPeE5uacmjy5mBoziwQ3KPLkf13rvE4T7FoQ9qblbC
         X4bp6UI/2KqfZgasOYPrfuFn/vt5oRgZqU4LTNjY88Fg7YDrYPLuF92pv84v2vON690t
         xOW1MmnBMSCDybHwNrXO2M8gecObEflZkwW1EYsNu8A3QAg/bX0WYT6FM+ARefvSXWna
         I1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700075204; x=1700680004;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O62ITEv9zum16VZfzwcJcVUkHcD38wLHZBdt9ewlAmA=;
        b=X3PaVCg/MG10ZeQTAEGMB1rJ613qiZpTHPha6dAoe6Ayt/lWIFMJfSAmSCP72NXUSF
         RFOtFlgu+4IRfXFXx1meHj/v4iwdt12UIte+ZoY6p4owB+xtvdRuxxLC71y9WOYpb6OL
         m8lQOyo0o0kDCIVZ3Et5WILCl2q4ekXKG+pKrHTiBCne0XmqPweSY2Fof94xByi/1ERo
         7CvJwHkcfzUwtha9EfW/mLiiI/m/A3ADODd8jUBrVQZNSt4Cux/BbzQ/3IrDP1BmPDNY
         OMj4fMdWZH5TRX2MhCMAYUT/b9cjvXJ1osMbwTvGesoCh4on4VQLXq2xJqpEyTMoBtR3
         r1vg==
X-Gm-Message-State: AOJu0Yx6hDVdM/qZ9b5fAiEAiKgmVY3Lm2pEBWOtZ0MOsQyDPR2QZmZm
	CE0l7mLPfoQKza8sUQYkpzz4iPwJxRSJ3Q==
X-Google-Smtp-Source: AGHT+IH8ng8L8v2JfrWLaSTlxTjPHfVmeqzKMhkmdRYKViTkdJ5rc2WunBAmj4mLQrXWOA+pM9sl7Q==
X-Received: by 2002:a17:902:e5cc:b0:1cc:33e7:95f5 with SMTP id u12-20020a170902e5cc00b001cc33e795f5mr9168608plf.33.1700075204079;
        Wed, 15 Nov 2023 11:06:44 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id ji12-20020a170903324c00b001bfd92ec592sm7669004plb.292.2023.11.15.11.06.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 11:06:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Nov 2023 11:06:30 -0800
Subject: [PATCH v2 4/4] Revert "gnome-terminal: Remove recommendation on
 vte-prompt"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231115-remove-vte9-v2-4-c894df1c7af8@gmail.com>
References: <20231115-remove-vte9-v2-0-c894df1c7af8@gmail.com>
In-Reply-To: <20231115-remove-vte9-v2-0-c894df1c7af8@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 19:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106771

This needs vte-prompt if vte from core layer is to be used.

This reverts commit f3d3bc7620427dc1d47daab52a81593509cf2737.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
index 594e1c0b22..8616f2c9b0 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
@@ -35,4 +35,4 @@ FILES:${PN} += " \
     ${systemd_user_unitdir} \
 "
 
-RRECOMMENDS:${PN} += "gsettings-desktop-schemas"
+RRECOMMENDS:${PN} += "vte-prompt gsettings-desktop-schemas"

-- 
2.42.1


