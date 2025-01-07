Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B35E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 14:00:58 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.20736.1736258448791334643
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 06:00:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=AdpgFj8H;
 spf=pass (domain: konsulko.com, ip: 209.85.208.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d88c355e0dso9001043a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 06:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1736258447; x=1736863247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRE/FGwvgbX9Q7MST+XUunXogHMm9IxH1/hTVTdFl/0=;
        b=AdpgFj8HgJrYQhHK1hOShUH5qWhoPxmzJQU6No3mbfvac3/I/CGdofzbZVX0vCYyRL
         L3QHftkOfn8zIlb2mDJh0OFit1yNpEljFmy6rZTmG7bmLv+vR8fE1Iis7C4uKP/rJxhQ
         YXI6V7ZcXjRaabsnc03apZqZgbyJYy7ZgGR/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736258447; x=1736863247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRE/FGwvgbX9Q7MST+XUunXogHMm9IxH1/hTVTdFl/0=;
        b=rqjUaWhiJcvWBW8jP/R40sJOVVHHHQt24mcbCfbedW8EmnVxCc69Zj/Qq1j4BnraH5
         yD+6KhsMx/p1GDhy0y7Kbt8uyQChfH75pii/nJitNKU+ckJ11TEAo9Jm5ooV5zUIkeDB
         8zTNPxIEOVtcDCJlMB3XFclTwSV9aniz7QEotXohw4CTfDoxkTwFb2m3pLYkBOIUENry
         cSeuGTAvnI2zSD0ME4xjSiHDqw+f3/N3AOUMg6BXmgRU8w6wjzv6xfOjx0MveodXiLfU
         ZkXMaECyU94633eyCiDuHGXd962C3awJHikNFyfxHlPp8qpGdyLPBa1NorIUo0j19CXJ
         huJQ==
X-Gm-Message-State: AOJu0Yw9X0KnrVBpeeRj06PNfHhAaOnGFOfI4gl1YEVUBNYm2e2XOIX/
	SXQh021sg0qSWNe7SrsdVloiDhaXrKbk9Vw1cJn/lrj0B1V7qplMhg9bBj+WCrvgFdqoWPAwgxl
	Z
X-Gm-Gg: ASbGncuLw9I+OOQRTqN4su7GvZodEYsPvk0xTrx4OJvyF1Z6GscywFsvaZABy2kBLkT
	2ojgWtUO6uxsjosajvf1NhMgKuJcarABTwgPtXQBn5/da78+iyuVjYk/++douYuYHOuSRhRzADt
	5/acqT3eZsVYZYnk8b7vnMSOud+pDD0C0lPLa7TkkvCYQ2PJAkS1JXeTOhReJUbvEeMEgm8zJJu
	HVuKv8u7UHUhnmB6sPQGIxVWEu7WkV7cCZdksoX6M/tZdxcD5EnrBhg7g+Slru8gb5Jtlo=
X-Google-Smtp-Source: AGHT+IFZbMGr+QuJF7l0M5B9aS2ANmiCAmun0/gCFRJ0gr3B/eXrr1NHqoCJlRhb0pZ+YQS1Z2crnA==
X-Received: by 2002:a17:907:9621:b0:aa6:6f92:74b1 with SMTP id a640c23a62f3a-aac2ad7fa01mr5874088066b.13.1736258446717;
        Tue, 07 Jan 2025 06:00:46 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe4b6bsm2403422166b.93.2025.01.07.06.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 06:00:46 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-pymodbus: Upgrade 3.8.2 -> 3.8.3
Date: Tue,  7 Jan 2025 16:00:40 +0200
Message-Id: <20250107140040.3330151-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107140040.3330151-1-leon.anavi@konsulko.com>
References: <20250107140040.3330151-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 14:00:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114705

Upgrade to version 3.8.3:

- Remove deprecate from payload.
- Add background parameter to servers.
- Split async_io.py and simplify server start/stop.
- Update custom_msg example to include server.
- Move repl doc to repl repo.
- Add API to set max until disconnect.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymodbus_3.8.2.bb => python3-pymodbus_3.8.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.8.2.bb => python3-pymodbus_3.8.3.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.8.2.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.8.3.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.8.2.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.8.3.bb
index 9793cea257..b26a943d52 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.8.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eba8057aa82c058d2042b4b0a0e9cc63"
 
-SRC_URI[sha256sum] = "c57e41662cb7c26830f2f0e0166ffe2fe08ffd8749e0ce0a56f3d9f4bdc2a5c6"
+SRC_URI[sha256sum] = "d886186bf7c3cc140f17e830919c23e4cc88334fbb91d6e5e1d7dd05860fe2c8"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.5


