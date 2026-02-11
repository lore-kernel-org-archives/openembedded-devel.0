Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEB5E9E2F3
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 12:00:46 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17411.1770811242961121412
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Feb 2026 04:00:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KCSbgEbp;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8220bd582ddso1211828b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 04:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770811242; x=1771416042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fo0nbLL/SQgL4XwhRnm0e71fqrem/19MZaNmMkh3xag=;
        b=KCSbgEbpjdPb82GgNEX1Uw4fBK+BG2yOiGGJXLXQEZhGw21cF3Po48PzVK7WXK1cwF
         SuOkiaIkx546O22LqJRwuyQsfJz3SgNy8V2/4gIvV8GVsxzYbKBIH8sHCPWtXXKTLEKc
         sywQYnu+IgKWBwldoTcy2u9iqi/Ey/xqcSdhx+aaFainGP2z4zyL+rzg7IdQBdvKl2+J
         F8ZAL5by46kbv5U5UjgsKLjhIheXY/e1kjiFs7cWeCt5S6QJ+RYKH5Mvzr7hcRVXYMXF
         FxVJYjvc90c+w5QP0JxgsSiPhvrVu5m0XTclYprA0aLwXqmSO4rm6166eoTvJZV/58Bx
         7wiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770811242; x=1771416042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fo0nbLL/SQgL4XwhRnm0e71fqrem/19MZaNmMkh3xag=;
        b=vuKWvGa6aR00C21gREx0lLqkZ/s13sKkEJoRYGBPot63bFc1MI5jZc4ThEATCX/eWG
         w4H2LCv40kfRUY4223OmHf6jFplMZ/jHz2J5sXNWjcqG8HMbliYqOj22WB7d0JKIHpRV
         uhGQkW6uG98qeBQjgSnYQX0oC7gLuJYHoPspEhoVXeskgE9YNj3LWJT5Y/M66swHzk9c
         Jy7xxB01RNLIB+sc3jpg6B3xDZ2IQwvNRAUh8ZTN4P00IsHxDsBYFjJIigxf/iqEMPcK
         KPD/9D1fDiN+omifHMNhY42hfaknuN/cpQ7NemJ2ptQn+KBHaIExF7F/6xgrIftf5B2C
         vl4Q==
X-Gm-Message-State: AOJu0YzbkI4VCThXfkKiT/0rZudc5KAJ4AndLM5nBx3k7hiCPZK6RhsT
	TaN4uMaYlmaxIVmJ04az6X3PxgxTpYGP1DdH3yqAxYyUy7Y4n3LkHm7/uy+WjA==
X-Gm-Gg: AZuq6aKFn6BbRbU1LM7Zvyfh6ylw3IeZOPnng/FyS6aUkYm+SBqrb8jJC6KDKnxGLtG
	VebHB0TJfbbbIEt3TWzXmf6HChp46R7AFm4VJCzSC78v34Fsv9oulJaDB2/2XiAcGdkZHMoM+aq
	zB7Ysrx9BsvXQtpPBv/aZWdp4WocXpie/j0cv9PvOXqx7AvY855o+SoqFrpOTRuD29eAeYJVAZ/
	dBE2XUnXcQGDKLkQcCws8L7NUNbKnutJyclU37mo+4GVF3H0TxHIsPUp4hV2edAi9ApUgL9Nm2a
	6iWyFhS11CptJUCBcJouNDgENRp8pzrgEE7Aj3/+JXZgZTV3bFqwed4Em1a4FJ9OQOQXfhi4RIP
	li7Y1GKKxST4veugj/GE8JY2zgtzfApyywgLM0MFLf18qMo84xZ4NPQ1rTCQmZXrR53Fikg8Xyi
	KhRXLZnWfhmo9x6sT2u9+9ifwGGpG+6vkmqH6zj5SNFQ/1PA==
X-Received: by 2002:a05:6a00:1a06:b0:823:148c:d785 with SMTP id d2e1a72fcca58-8244163dee1mr12945107b3a.27.1770811241889;
        Wed, 11 Feb 2026 04:00:41 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e3669d8sm1805831b3a.2.2026.02.11.04.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 04:00:41 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 1/8] cryptsetup: upgrade 2.8.3 -> 2.8.4
Date: Thu, 12 Feb 2026 01:00:18 +1300
Message-ID: <20260211120025.4190831-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 12:00:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124329

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

Stable bug-fix release
https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.4/docs/v2.8.4-ReleaseNotes?ref_type=tags

(cherry picked from commit 9111684d670f1091fc38778cfb140d39871d9c0b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../cryptsetup/{cryptsetup_2.8.3.bb => cryptsetup_2.8.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.8.3.bb => cryptsetup_2.8.4.bb} (98%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.3.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.4.bb
similarity index 98%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.3.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.4.bb
index 44bf66c1ed..34755fc3ad 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.3.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.4.bb
@@ -24,7 +24,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "4a8a23b8b9d1a3250452e40acead4421a03e45a38954ad0595634f4266aa800f"
+SRC_URI[sha256sum] = "443e46f8964c9acc780f455afbb8e23aa0e8ed7ec504cfc59e04f406fa1e8a83"
 
 inherit autotools gettext pkgconfig
 

