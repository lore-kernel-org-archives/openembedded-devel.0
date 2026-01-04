Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD52C2A073
	for <webhook@archiver.kernel.org>; Sun,  4 Jan 2026 09:13:02 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40224.1767517976289152099
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jan 2026 01:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lX9EEzTk;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47d3ffb0f44so45833325e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 01:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767517975; x=1768122775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QnU5eINtFQSB7OMJ/syNYnh1gScBy8Sw1lT2E256H0U=;
        b=lX9EEzTkN3G9tQ6SDvkTnQu4OzNaok/HrAbVqbCTK5kBZg8EkRiuIeri7eE9UNdcKD
         dZXCD3UtmBEcgv+ZPAkT4tdWuXr5RIeMS7C4kukn0GYTOjNhw3NYEQ1o6vs3/2ZPiRs4
         LLDAcTc5BoEtlTrL4UXf6sQnivmZGati+SB7u5G3yWhHm6QM7O0RSUVKRXsx1BDDFxJE
         Ylr5OwKE8aI5yIWJ8m+epRRoIYxPUa21ezpgJqNFMiNhFfM7EIQMSOdabXRUaCRhwQeO
         EdXA4YDWCMlwULCRv98ppgCEtT3Qbl4UdCifwNdJ7DBYJrDHFUTn4b76c1pdKLiBtvzP
         Vk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767517975; x=1768122775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QnU5eINtFQSB7OMJ/syNYnh1gScBy8Sw1lT2E256H0U=;
        b=QF3q6sbXHVU0CrP0Jg3aRcpvlXZbrKWvz5+gQYUTMAvD8W5tsS8NmYrrIhB7QAVOX+
         rdAbJczTXw4dZvdx/dZEnuc3P1SoFguXo6mFvrIxXi44pmWTRTph3cPRpXayF/FjTJkb
         d2SPOLtcIHx182l+zQMj1WZ9n1PEifS2eo2NM0he+mqPRf0g8mDtwOWvXPzDl2zSE8kR
         mFw6iZlgPcOVVKFOtKoqQCD99cVntv0s6xRX8l1bsVD/CJ7ghdPL+TZ8UPdw8Rl16z8I
         rejKjsp2YhtAHmCvphgyTf9jXiL7A33g/jiWUoX1dfrkFK3TS1wDfxzLOUCIhWL3aAKa
         BHWg==
X-Gm-Message-State: AOJu0Yy8ruyVVWqQR67AzOpRrcC4yb93FBrBMaIdp/UrJwlAkcI6DY7p
	YY3xl65RLJ1d0a9/5n9yPm2aQygibT4S5fK2I8TZQMRHJvaCt24lmTZEYT9g+Q==
X-Gm-Gg: AY/fxX4+2OuupGVRsB9Fg+o8fX9TM61jgMQJFEjVBd27PxmxmXhwBMSdsVO1ll9XtRS
	XD9zXK2NnS51ZgUTLjm/u6mjVZ01j9a5YBkfVtT16G3Dhd8FKFPYdO+SFuDI9AJii6NrdvWyXfj
	syR4U1TvZnLXgLNQ+9QHIQr0PuDyiRhFaRNWi/67obUonzbVwoTkiPXgx2+6fxMKqNeoKFXZkW2
	1RqyVRpu3tf//g0RjSsT1hUmk9TCgGGszzC2SfaqBJVpuRxGzwtnuS3O8rY5tBcMpOsaNhcEeZ2
	8Rvg810uiYbOvjf1qNBDyWFIvKkUXsZGigeoLHlmytArxVDhNl1L9G4P7q1X0ffq/hLTrPc1hB1
	gT5OmQtNX0SQTRj5v3QsW8ZMj2GPDekwOI9MQv+YaGflDKDzsmOyAvCFRAaPEVH6Ka0sZAAoVQg
	+npNDCuzP7UWhZAcra9uM=
X-Google-Smtp-Source: AGHT+IETPmou3zuHmhdyn0nZ+oGFW99L+al9rjdKgUsuXh6M0rPJDrsxwIMlVE59WI+4ilfwPyXocw==
X-Received: by 2002:a05:600c:4fc4:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-47d1955b392mr575592355e9.5.1767517974339;
        Sun, 04 Jan 2026 01:12:54 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d13e2bdsm84483275e9.3.2026.01.04.01.12.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 01:12:53 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/5] xdg-user-dirs: upgrade 0.17 -> 0.18
Date: Sun,  4 Jan 2026 10:12:47 +0100
Message-ID: <20260104091251.2696384-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 09:13:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123109

Changelog:
- Fixed minor leak
- Documentation fixes
- Updated translations

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{xdg-user-dirs_0.17.bb => xdg-user-dirs_0.18.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/xdg-user-dirs/{xdg-user-dirs_0.17.bb => xdg-user-dirs_0.18.bb} (76%)

diff --git a/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.17.bb b/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.18.bb
similarity index 76%
rename from meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.17.bb
rename to meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.18.bb
index 75d7f27485..84fc9e2f18 100644
--- a/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.17.bb
+++ b/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.18.bb
@@ -3,8 +3,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "http://user-dirs.freedesktop.org/releases/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "e0564ec6d838e6e41864d872a29b3575"
-SRC_URI[sha256sum] = "2a07052823788e8614925c5a19ef5b968d8db734fdee656699ea4f97d132418c"
+SRC_URI[sha256sum] = "ec6f06d7495cdba37a732039f9b5e1578bcb296576fde0da40edb2f52220df3c"
 
 inherit autotools gettext
 

