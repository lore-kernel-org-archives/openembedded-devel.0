Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6D9D37E2B
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:08:25 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9533.1768396096172672622
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:08:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gUvkE/ju;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34c565b888dso7222164a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 05:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768396095; x=1769000895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uL/MC06w3J0sPU79R3CtNr0PuxijUcGE8O/UN8tdIT0=;
        b=gUvkE/jun6NNuxSMQx65+snaz9CacAZOfqgw1q9aoefwB+kTXR78+cWRHLMZs8XSkT
         fntQ7foFRFHane2IeloKShuP2W3C/AF1e0DnAJILkoW8P0j3yyqMfwXWY5kVL9O23AUC
         NylPT/DjlwUfM3ATYkxx/of/4DK9biA2+NDtiH5YHZ1YkHhSxKYEV2oekuYxqBiHc5KX
         6i1Q9So/73JKNqylhXdhgjJx/txqQ0IekTP9tsYVoQFvbmEATi+7qx752jRBevp1RWzL
         7m3XFO4Af9pox6x1iFQDtY6irBqmlaZCifMj9a48Rx2zh0SPjxwKmL87XVPrCa/y+BGn
         NwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768396095; x=1769000895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uL/MC06w3J0sPU79R3CtNr0PuxijUcGE8O/UN8tdIT0=;
        b=fjg/dML547HzjJINRTC60SjYaxdYHLzt3lqWEaUUTCC640oV/z34ZJmt2rzYIUCxIb
         U3mpMP9nRqR5q52f8wnwPId+8mocRvHeH2RV7AHdOjXpnBVAmq/tFRCvN8sqivsmZSTA
         BZtAOwnN7WhRKrNYu3x19lzehSdl9LF6wsgISfE/QsC5q7zErQcPFhdcByzM4KKGcvvb
         qPcGL2U6GNJHhFxjmik0rAfbQGjBXQdMkG1S6Lg2p5kl/OudKMm6EZuD/jE9Qk0+Ak7r
         8rCNWUTuEpVEgGv5saxK0YdaeWJXj1tYHqeZiF6zwzddq5VUA29FVXkPOIGUcW1NJ+gi
         gYLA==
X-Gm-Message-State: AOJu0YxQ88lyih5S17B1qQ01RTJcSff6H8XDXKZirqOoQG7oAy/VFLsi
	+VJ+P2kLGy5Ta2dIcE6RanPXlxDyeECsfggLkZnRfRGJw5z5bmTrXxxF65+YQQ==
X-Gm-Gg: AY/fxX4SlbsDyxTAse5u2M4P8EJP6gcJZxdA88jvp0JCFvskRZhnyyAghkvtOK1030b
	+ygNhqa2WRUUHpP9T2MCgkqKzMT8AN/+EBmNuXuMAuvCnPvHrnUF/dPO2N0QDBmIlMvNz8csmRt
	tOY9vvuQ6ZRISSPQ2BfVp8LKyAljq4An1xFjVpIWetGr/+zmXbgk5YTyZYNo0b3s4sREzUpa4vF
	omXlYY/PDcANmaEAvDT6qK0BMZwutP4QXIwdvmx24ZAyVe/353V0JDq9H7tpfXa1azNdWXDpmwC
	TT5CSpyPyBoLhQ4UtRpmqLAk53IVYRd0lAKfHYWOyrU9NvlB+OjUUwCj6iVXFUV6uQOI1VbmuAz
	OLSJz7C3YTDyGuOxPbW2P4M4WZTb2lZ4gaitL6mbXHftSzEKmiQHDgzcil08jeHv723VYzfw7Mk
	MGCRTEK4/2r/F8tagU3EAJOv4=
X-Received: by 2002:a17:90b:224f:b0:34c:7d65:e4a with SMTP id 98e67ed59e1d1-3510b1455e7mr2052095a91.31.1768396095284;
        Wed, 14 Jan 2026 05:08:15 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35106914b1esm1296398a91.1.2026.01.14.05.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:08:14 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH v2 1/3] python3-virtualenv: upgrade 20.25.0 -> 20.25.3
Date: Thu, 15 Jan 2026 02:07:58 +1300
Message-ID: <20260114130800.1021123-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114130800.1021123-1-ankur.tyagi85@gmail.com>
References: <20260114130800.1021123-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 13:08:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123477

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://virtualenv.pypa.io/en/latest/changelog.html#v20-25-3-2024-04-17
https://virtualenv.pypa.io/en/latest/changelog.html#v20-25-2-2024-04-16
https://virtualenv.pypa.io/en/latest/changelog.html#v20-25-1-2024-02-21

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...hon3-virtualenv_20.25.0.bb => python3-virtualenv_20.25.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.25.0.bb => python3-virtualenv_20.25.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.0.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.25.0.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
index 1858fee25a..fee5250c4d 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.0.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "bf51c0d9c7dd63ea8e44086fa1e4fb1093a31e963b86959257378aef020e1f1b"
+SRC_URI[sha256sum] = "7bb554bbdfeaacc3349fa614ea5bff6ac300fc7c335e9facf3a3bcfc703f45be"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling

