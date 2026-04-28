Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D6C3FF8870
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 09:10:09 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9060.1777367407243180668
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2026 02:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PJ7+2xq7;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-78fc4425b6bso111269927b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 02:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777367404; x=1777972204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YIq+uxuvqkak4rwWDBXaXOXbg0ugG9TQvyz+376GQo8=;
        b=PJ7+2xq7DOwYqHsZJvkK3ZI5FPfzCjeHlwSvnlf7mYmHyqYGCuxc53eIO8xRhMQ7rh
         Xqs/UDcEaQIJ2PQH16g4LQLFZFXulfiFcxWD10HxHIQxNR48U8JQhBDX4znbEbGiFKJZ
         Ym5lioyspMpQURJ/bzVNt7S5f6pV72XPt0uTQ9aNYwqWwCCpj0PHQ5+27IBor+FgtSri
         Ed74ewiiX+W5PlLT+dOIqsrWNHq23jTNy81Hnwji5Lg9pfOPl6dn3V/ArTQImKvAiZVR
         qOeRq/iKthvA1V2UR8cXOq1F5EyehNa9zlgnxkWknIHV5qP07JEAUj2o0SAiv/CENdUn
         irIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777367404; x=1777972204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIq+uxuvqkak4rwWDBXaXOXbg0ugG9TQvyz+376GQo8=;
        b=VPHIofi3Kmk49rKtmvqfHHfAjtCVXPt4rmFBCecEncS4Sr+zCPTYqtrdyUaWOoY0P2
         GVf8sF626HnwsUBPcssNrse+cLDt5ieB73sjCiBPj18ljpEYuqjsquLG63VxtMTI+BiG
         NV4C11Q1Z8LwwByq5OQLufUKNEiVs+3tcHf3jKsC6rbWiFO5x68YEd6A26oTvZLOleaB
         fjhR45XoVSa2LK1+qUUktzBCZpZXNvG1a2+HkX89JN5SEI9De5uyORJ3Do2yZllsKrQI
         KQQ/S7fSQSRJTImrH75ahr2gPE/vsl+ApMsAYVHIpRQagrMqQzXAAGA2AjKnyWVpKsXp
         D1OQ==
X-Gm-Message-State: AOJu0YyQNiUrTJueL3Wl39U2dJWkxRj+r0WNGVZne2PFQA9+HPABW2CG
	jn8cOVUh7Hjn36UINB/5vO2qpPVSQgqO/HfTTfRB3+PjZj0MIAE5nfFKVnmXYWK+
X-Gm-Gg: AeBDiev4RdUhan241vlQFX4PcS63KQ6/k2i+liJieO6md80xujKd9M6XQVEOn5OIMj1
	0gFmJICDZyklmPGuee2p0gXvB/bHvf0ZChCzUwzQcpUGQzOIiHe/eWfE/eChBjzqLLo46HevYN+
	R/gK6Pyqv2RFZrVdhluYt6qoGudO5l/fdwMuselWa27VvzlIFSHgzzZf7tKf1ZSjnU901UCNhAS
	ZytaWz4gGSHFW9UdfQAYEyhqIF6pDro35i8PH9wd+jfuTrjQBXqNeLm+sKnf/znblymxzf1DBZC
	PZ1cQ23i3UNC9ANgqAD5BgAEdM1PEcWwyR1mlV3Nz3WO+BpIsejTQKwrKoIjtaFIe2E8ud52Fc0
	lyPRF2Bfg/AdA2gZwcPBunpKKuA7izE/rLh128PUxmzOQT1PgCz+uMde8IfWeiRu7qpFetPzrd9
	mjIwd5wabQQb1TBsIHIRNhzvH3ZxJSpzft+0L3b53W6YLmYS8jzctThMUUP+PhcBz+CpCTd3hxo
	MqVHUfiUp2AFejMGWB74QHqc0qXPK/5pi7wLh9XXRa1t/8fAVGRuW66WQKYfQ==
X-Received: by 2002:a05:690c:8e17:b0:7b2:64f4:a2d8 with SMTP id 00721157ae682-7bcf50d4f41mr15115867b3.7.1777367403621;
        Tue, 28 Apr 2026 02:10:03 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf04bd5cesm13630427b3.6.2026.04.28.02.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:10:03 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] xfdesktop: upgrade 4.20.1 -> 4.20.2
Date: Tue, 28 Apr 2026 05:09:52 -0400
Message-ID: <20260428090953.387849-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 09:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126651

Changelog: https://gitlab.xfce.org/xfce/xfdesktop/-/tags/xfdesktop-4.20.2

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../xfdesktop/{xfdesktop_4.20.1.bb => xfdesktop_4.20.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.20.1.bb => xfdesktop_4.20.2.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.1.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.2.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.1.bb
rename to meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.2.bb
index 5cd0213951..996330cc45 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.1.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.2.bb
@@ -24,7 +24,7 @@ inherit xfce features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "acccde849265bbf4093925ba847977b7abf70bb2977e4f78216570e887c157b8"
+SRC_URI[sha256sum] = "1d9bd76015fb6e9aca05e73cd998c7c66ed4fc8c10b626e08fc2eb7c39df3f7b"
 
 PACKAGECONFIG ??= "notify"
 PACKAGECONFIG[notify] = "-Dnotifications=enabled,-Dnotifications=disabled,libnotify"
-- 
2.43.0


