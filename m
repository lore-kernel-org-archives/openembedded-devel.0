Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109E3C61DDE
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 00:50:51 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1036.1788051048496872480
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Aug 2026 17:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ka57Kw4d;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-39682983a0fso2801213a91.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 17:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788051048; x=1788655848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5xRRWbPzq85LPENEa5RemzaLgM4wy2zLBa2gwodi2Xs=;
        b=ka57Kw4dlDfeRZSUY/5Aj2Le/pRn/BHJrrii0MKxwo9tOXjUYM8TIXdsfj1CDJJ6sn
         fL+QCiMSspOv0aQDeptrUuvmFQlWWUBB5HilsLklfZg0+/DZUIMzVbyrMuvqBa5cc+Pl
         XRILj/2sE56hkW8nLqfh45fzhQ2Etd9dVJ+3PI1Fbnxdy4ulOjztfjbWUx6FLJKpnXDh
         zq/PE0+HpsCyQH/O/w/suy9mBLh3ArYQFy1w0NfHbXlfCzTPWAk7OpeCNzO9ekrKeSax
         jCEkCUvGQflcVooCBcA/cGkGcPmO3RrezjZ66WLKLX5OMRCiFMDnQaLkRhzGzaJMiOvG
         bHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788051048; x=1788655848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5xRRWbPzq85LPENEa5RemzaLgM4wy2zLBa2gwodi2Xs=;
        b=UMmWh65iKQT1vtKExZl1BtqzlyMbFkWRRkuV6fZ4ih8w77nzZD/s+Gpgcoa1if6roI
         sbynkLJ12crgjLHVELuQX5VbPmSh/qGDc9yZTvfW+E8E2MmcXf6UnrJSB9rpTtEaELP6
         /I8Bu05Sc+kOZE21ptdCJ8jGSh8lk/VQhPHWsAmYBlppZoBN3bOUbZpoBfOIQthehTk/
         bIqA44gHzLSrpLYcwD0u8N1622DrJRD33NJcBCEe8Rx63B4+tkQaTsjD0Cq3VydlVSI0
         vIGgIygKUBCP6fEwQ85QAmSBgkM6UnqskYDKM/JWOeNsqMfVnK4lMeUnytt3K17OgucE
         7xFw==
X-Gm-Message-State: AFuF++lCSVaQEuVfUFUEVZn5K8SjX8fpyDWMwTi5z6Hqv11c33/tc8mD
	jyifz4atCbo+Hv9LrM6+efdQ144uN/pasn4LY+sU9832N3nb4oYRIbYH9tiPJomS
X-Gm-Gg: AYBFou02LVzmy3Nmt8y1yEQV+KwPtfVrIhoqWlVazCm3cAlet3mzJ1gWIuqNv4vaqVB
	GYhf/5UpAj3FyOFkAQjeeNJ+TAfRHmYEmPbT0WhffnC0MsQoc2oGyfZ4g+ofcnSJ2pXpQFJY/3F
	jXUs77LE1GzkziE/dn89bN/OAUzt0MpXQODZrEHZc46PspKX6bFfb8nxEQmVynBvgKfGcoCPOYW
	lIzrx2i1R44uXDLrwmagosuWW4kPZcZHYJ1HSkE6gmzgZmEDJ/4//E7DroITu+a+Qy0fXb/K+2R
	R5j9tqa+0wuCpVqkuoOAxltsRimxw16rDwWP/aF7+u7XsOKAF3GJCYR2MQ08yh12V17lVai3z3g
	XiFo5ccZ+KToz9SmEs9aqAo4lqqhHVTLHt+6sRMBIDLU+eTiqidmKLqRzUD8A7ezjwvps7UV1lc
	FyM4Qb/NOS0XVna952E7V79BBL1GY+n8pe2YLMoY0QzINAGtXWWCVG22S6pmSdueKPpMnJMmBX5
	g==
X-Received: by 2002:a17:90b:3c83:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-3989bd54c84mr13810307a91.18.1788051047849;
        Sat, 29 Aug 2026 17:50:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea808csm13561826a91.2.2026.08.29.17.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 17:50:47 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 11/11] python3-colorlog: upgrade 6.11.0 -> 6.12.0
Date: Sun, 30 Aug 2026 12:50:15 +1200
Message-ID: <20260830005015.2555347-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830005015.2555347-1-ankur.tyagi85@gmail.com>
References: <20260830005015.2555347-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2026 00:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129592

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/borntyping/python-colorlog/releases/tag/v6.12.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-colorlog_6.11.0.bb => python3-colorlog_6.12.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-colorlog_6.11.0.bb => python3-colorlog_6.12.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_6.11.0.bb b/meta-python/recipes-devtools/python/python3-colorlog_6.12.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-colorlog_6.11.0.bb
rename to meta-python/recipes-devtools/python/python3-colorlog_6.12.0.bb
index c2da569d32..ec11213103 100644
--- a/meta-python/recipes-devtools/python/python3-colorlog_6.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-colorlog_6.12.0.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "colorlog"
 
-SRC_URI[sha256sum] = "9d90fb53fa906c8970c18fbe46506bae1fb5f86b513b8f867db37e4ace9be7ae"
+SRC_URI[sha256sum] = "2a7924c1dadf18b22a0eb8b06d1c7b01d5341707ec1641eb6fcc4fde0c3e8e5f"
 
 RDEPENDS:${PN} += "python3-logging"
 

