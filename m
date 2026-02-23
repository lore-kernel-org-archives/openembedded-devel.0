Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4316EC1130
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 19:19:03 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2738.1771874334592412788
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 11:18:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dq1H9NiW;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-483abed83b6so15080045e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 11:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771874333; x=1772479133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhRJChYzxMG/7B//AMGGV16kre53UC1EMXw+sUMOZh8=;
        b=Dq1H9NiWj95kDV0IWepsfc9n08XzA+TrhFg/Y3x8Hjc3fC9A67wQxxo2OcsoGD7y1/
         EDl14ZOGPyCJU4wuJkUd4z+yFh2dyTlYy7EdRXoWBzNcpbR426o2gtBVS3AGE982Sbgx
         qiy3mW7xwjUD6alY/mydFlIhBKx/ED+Od6B4qivoLxIm6MipBA/1q+VDsqyDpk8AP9aj
         7he7xAQ0gbRZ8wiiaUrZq+k/G3v0rMqjJLgMFR/a53m66qOuhh7Fd8iCfJ471qnleGHQ
         DNNcHfTbITQlDi5SpJoxJjqiNOIk459U4nuJm8IXaLP29olvSWjki1OFVAhLzUsktAsC
         iIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771874333; x=1772479133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qhRJChYzxMG/7B//AMGGV16kre53UC1EMXw+sUMOZh8=;
        b=M5y6Y3PK+4GsTZaC0VDLIIH3Mqp762q0zXgWN9fCs36oDWzv+qrUU6SM0J/raZMEuy
         Z+ndDj6mz5YBszRDBm1x8vH5px01vKHXy24WVB2BjW1E9PmwHOP5s3/r6hybP47aaPGw
         VtkKIh6c9JG137/7doib1kQr1+9pLh9XOT2l5AHVhj9N6Wc1DaHQQ0VyjUkDfgCOa/iX
         3HZeKNqTwiRPq96ZbBtlA0HqvCorYdqu7K51+yqcNhYNc9XUL7au+ah9IvhffG2HSvii
         XSRpqw+AEBp1SmSeQ3Yu14LBLR9IB7OJaeC8bMqvBg7ZTNLXpavkF5+I6klLjTgAiI0A
         PoZw==
X-Gm-Message-State: AOJu0YzXOZmNPnI+L2kxX7mayQtjZigkmlKJ1bLll2tpTYKYD3tB0tI+
	mwVWQyGM7RsF0Znjc6uyPdQr55KyodW70JHJk7+1OFOHy/YHLSbucCNhM04iJQ==
X-Gm-Gg: ATEYQzy8glJI3TdhTS0K9J9KDFK4iHOgBERibfFMGO2yp7lh4dTNJNPuNW0a0uZa+YP
	qCvn25i7FImAZOdNHIMw6AtNuiBBubkzgnN+/PllZIesgvpRFhWtN8mBHVAevk3bAZZTUvBrdpG
	momvyNl8cC7T9G2zwxXbEJ0hTWMpMilBlfIHF7GKJvrBjaLHi7MzKhf1E3Eng0FfTsQLUdMnckN
	gXVw46lzNGFIBwRhsfGgKtwsTRYnJjSGHckvXA6v2aVJqt1FDtirqMofHh4JEN7gkH9XpUMgxau
	B8wz4VsGlfQACDzudeOxV37fq3JiG3BvWh1Y2JPu87dLlGp/O82LU5hUUDMSw08X9Doz3FOuKZU
	bWymZaGQc9VSxftPi+YuJ/OoHsTgB3kzdooigJuqZvlrP6LJ3RalcEol6zGjPkOjkqxbvsoDFia
	gjSDChIUbhsEGEooGCdt+b
X-Received: by 2002:a05:6000:24c9:b0:437:70d3:44ec with SMTP id ffacd0b85a97d-4396f18a8f0mr16675848f8f.43.1771874332743;
        Mon, 23 Feb 2026 11:18:52 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54760sm21308781f8f.35.2026.02.23.11.18.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:18:52 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 02/13] freerdp: ignore CVE-2026-22853
Date: Mon, 23 Feb 2026 20:18:39 +0100
Message-ID: <20260223191850.1049304-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223191850.1049304-1-skandigraun@gmail.com>
References: <20260223191850.1049304-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 19:19:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124556

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-22853

The vulnerable feature was introduced in v3.9.0[1], the
recipe version is not affected. Ignore this CVE.

[1]: https://github.com/FreeRDP/FreeRDP/commit/a4bd5ba8863c0959501d4604159042a311dae85a

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
index 70198a1e21..63dc177cbe 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
@@ -119,6 +119,7 @@ python populate_packages:prepend () {
 
 CVE_STATUS[CVE-2024-32662] = "fixed-version: 2.x is not affected, bug was introduced in 3.0.0"
 CVE_STATUS[CVE-2025-68118] = "not-applicable-platform: Windows-only vulnerability"
+CVE_STATUS[CVE-2026-22853] = "cpe-incorrect: the vulnerability was introduced in 3.9.0"
 
 # avoid http://errors.yoctoproject.org/Errors/Details/852862/
 # fixed in freerdp3 with https://github.com/FreeRDP/FreeRDP/pull/10553

