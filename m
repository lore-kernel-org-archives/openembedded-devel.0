Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14AFD116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 11:20:59 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19325.1764588051375991134
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 03:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OO6HI9y8;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47774d3536dso32523185e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 03:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764588049; x=1765192849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpcCCKFX50f+6wShU8qrUnCYeDGCN8pM35wr46IwlPg=;
        b=OO6HI9y8SStgRYP2HBnp0w/BJFoZaLLJV70aUHVI1GwSDszAMbAdIdWCxISt7LBxDE
         e1HMYCgO/qLZhQkmEBwixurMQf2cjnP/dHBDZZuED0orqkUdmZa1y8ZFnX5tSkrs89jW
         PpMviNax5SlvcCFtYEvOtumb0tbpONyZbnKQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764588049; x=1765192849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YpcCCKFX50f+6wShU8qrUnCYeDGCN8pM35wr46IwlPg=;
        b=hvF/we+Mp6N5zZQwYIyKzA/6D/MSKjLh58hDIzjTrVDy+vDfq/6KcR1+7J8EZtzVDO
         YUT59mFLh7agEudwmxSgadDvALP9DZRTBrpmJAN9pknC0krk0VRbuFXlBWjPBUgspn5y
         lRf7k62QFCwatY6D8twF1lj36uWcuOrL7ejl1cMUSCTlZyk+Eyv5nC2URdWH+spU14eY
         7pzvkmPVV5v/v5zJ/spslCq27o4qOAMqOvQ5aOSPXNcHPJ+c4RPkJEbubRPmUmCjOMZw
         9kbpYolES2RxMTn0tX8b/uK6FzddXtdUngBR0AEHysumUmvnA5/8Tmv+wPYz/WPk3qXa
         6uvA==
X-Gm-Message-State: AOJu0Yyu+h0r8+ev2rUFE367ZSGC7AaeT2SDw7hSq3vN66IxKNJZDVjU
	8JRYa9HtfTHMPsYgV9uRdfwhsLA28k2gKuLEVtRRxu4tMfWDS/l3h/txgoTdZD1AiBODmbS5i17
	ucg1U
X-Gm-Gg: ASbGnctUOP8k3tuCBHl6gzKRy9TOmvNNeBtMTp54fUwHNDv/NpK5X76ogSxOVjJtZ/a
	pKtNHalG7ApQAXll5HQBvtjKXQyLqJie9CNwm3mng012ZR8BzZRblOA8Tj4hXUW7+ANnKNyuEOY
	YxZcPsW79I5QDaXLIlHhxNFt0qC9iUewgE4HOM76YJzfQSRjZZAdU30P7yV3qlqwt8bPO2ScW1a
	cFpENVuyyec66xFOMFk5/rf+7xOyoYVXNrw19nl6YJzUwnHEeyGZsIDvSfdW/O++92garRT6U0H
	HLClhQqRv4nMBa2yR8lfwAyEu82GwjycIH1BW7sXoqhiHVvrkXYrdAQNOPG3bo0APuqL4aqq0Y9
	xWPYezrcQjoAR178iuDyd8a4qRoGR+Y+UN9zGkG1ApR08lv0wIh110GDu9vD5LdYzq5flauGzdL
	BxxGkt92EEJ5VtfybZDtjTUF0F+eCIg5p8K/o=
X-Google-Smtp-Source: AGHT+IHznInsNsLG/kFY+x3/lJwSuWFj2x6PUMV08qsfVl1Y8Mp7cLExDRx0rx3lS54XrDIBtPryxw==
X-Received: by 2002:a05:600d:17:b0:477:9cec:c83e with SMTP id 5b1f17b1804b1-477b9ea35b6mr324106755e9.1.1764588049527;
        Mon, 01 Dec 2025 03:20:49 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3041sm24524527f8f.6.2025.12.01.03.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 03:20:49 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-zeroconf: Upgrade 0.147.2 -> 0.148.0
Date: Mon,  1 Dec 2025 13:20:44 +0200
Message-ID: <20251201112044.369630-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251201112044.369630-1-leon.anavi@konsulko.com>
References: <20251201112044.369630-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 11:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122204

Upgrade to release 0.148.0:

- Trigger semantic releases for 0.x branch

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-zeroconf_0.147.2.bb => python3-zeroconf_0.148.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.147.2.bb => python3-zeroconf_0.148.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.147.2.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.148.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.147.2.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.148.0.bb
index 31d671ceca..fd083d6ee8 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.147.2.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.148.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9fe712b1bc27c5c4e9ecd7f31d208900"
 
-SRC_URI[sha256sum] = "2f91e2544433acfa928c8dbaea7af8bf0644e06904610799d6b762fd599d81bd"
+SRC_URI[sha256sum] = "03fcca123df3652e23d945112d683d2f605f313637611b7d4adf31056f681702"
 
 inherit pypi python_poetry_core cython
 
-- 
2.47.3


