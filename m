Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D3BD6D226
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 13:47:05 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42260.1766065623739535861
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 05:47:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LzfSwkAW;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-431048c4068so395658f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 05:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766065622; x=1766670422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zp90/Qv6n5gQhqaRapy8NGvsdohcqTFlZQCDOdkC66A=;
        b=LzfSwkAWwj7EsmJgkIBu9DAJ0u+ZA4RRtaznqKnj9KoV8JnU7QR/qdGUqkE684/zV6
         TgeLrmDZXO4Nka0PP9LMo5do8LcmhX3vL+Asx5MasgJJbVeU24pDbvNtD4+PsqTE67Xh
         SFxlNRJkmyor93t4AmQOvD8PajmYi0UrA1rrkbExMU/sdINzVrZGg6yWvroay5bBI+Xp
         v0f5hbM/dHSaBkIHQWHph+ECnp2KKh4eJ3prhGs++awbZPsS5BZMXDn7b1CE7Fui1wD+
         bgMv3n9QLISjOHDmYcmwrXpnLT9s52Sz86hBOn0XJWdJvU6GXxTAkmv3MQKZD5E3seYK
         33sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766065622; x=1766670422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zp90/Qv6n5gQhqaRapy8NGvsdohcqTFlZQCDOdkC66A=;
        b=m0ImFJk74pmFrxBmxVV+8PFeqyLBd6NhhqKtphZoQQmVOi7ezBvi0P83Mgg3eOQyuZ
         Qt+t+D32tgkeFjtnyJCs/ROxKSdM6XJuEB6Ju4PAcQSe767EA++W4jNQyDvShci+wBB3
         8WmxsLO0yh91zU45zkVWHuN8490u3pSmJ78EmhUu4dWuLWhEtpPWKGRKp62IXe5lX9Ix
         8sURZdu6VMSSyDeXWAfDvEK9sKKUMFZ7CnV2Q/r2HWLs5s5Zief+XORJTNBygBKxRFdF
         ArKVYCG5Rk09nRaZq0V0dTG4XzW/wjIJbeHU9HBDfCmzFILzr7Nh3C9NbCI++DDBfk2q
         YMyg==
X-Gm-Message-State: AOJu0Yx/cW6E5B9j0TseDY1nmtbvHtYi7CKiwQme5jPJYX7pobeD3XhO
	nTPM/WUKdjXtbATesAzLbXwssJFfOPU/V7LrKhPxObCFmBJ2GZ5wPvP3aP5jmw==
X-Gm-Gg: AY/fxX7rlMlUceiTcjXAw/nE0H/lY2Rhd5VSgR2OI4DTmchvxvULovqqwKHJGjgbYr4
	3bDo3qfYrcAASC/f5g7JT6jadysAMqIctGKXdQ5kNg+jakpYa8dmLBnpZKR57qfmOwm1mRv5oiQ
	75oc3DxV2hPzSS3CPJKrI37rposG1D2zqDvXd46HMeK5e1ISOfNoXnfHXMGE1sNXpKwaAdCKEg4
	pSK6PtheFaNEsTFzrKukiuG2t/MTwo0bq8Gvrz3tAdRELf6b7dZpIuIr3bWUhyz8BzHx2LgEwk+
	lR4uwOK2xirxzmoiLYFbURElk7gdFyndiPfV9yO1aRGqf+xEDCzGToODiPPECAIXyGM+6fMqJBW
	I4VzaWHPO6Z3bVv6xozE3ZXUHOgJU4/oWPQsO6y15gN+XlF7S7ZnFUD81aDMyFOILyT12mkq9fM
	dnbZi0dfdvuklieY411g4=
X-Google-Smtp-Source: AGHT+IEJ+cdJduL0O5wdHlg+iTv822D5BnarlYpRYxx3PiojzqDO46FgtcMWAjR91ijKs1g0QJJDwg==
X-Received: by 2002:adf:e588:0:b0:431:1c7:f967 with SMTP id ffacd0b85a97d-432447ac138mr3331895f8f.17.1766065621809;
        Thu, 18 Dec 2025 05:47:01 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324493fda5sm5272239f8f.17.2025.12.18.05.47.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 05:47:01 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][kirkstone][PATCH 2/4] hiawatha: set a working SRC_URI
Date: Thu, 18 Dec 2025 14:46:58 +0100
Message-ID: <20251218134700.3509105-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218134700.3509105-1-skandigraun@gmail.com>
References: <20251218134700.3509105-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 13:47:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122765

The project has moved to a new site, old SRC_URI stopped working.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
index 2e848eaf56..497babb89e 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
@@ -6,7 +6,7 @@ DEPENDS = "libxml2 libxslt virtual/crypt"
 
 SECTION = "net"
 
-SRC_URI = "http://hiawatha-webserver.org/files/hiawatha-10/${BP}.tar.gz \
+SRC_URI = "https://hiawatha.leisink.net/files/hiawatha-10/hiawatha-${PV}.tar.gz \
            file://hiawatha-init \
            file://hiawatha.service "
 

