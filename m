Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD93CCA5FA5
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 12:35:41 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57398.1790598937332284809
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 05:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=a+xEUAVa;
 spf=pass (domain: konsulko.com, ip: 74.125.225.76, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so2486672f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 05:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790598935; x=1791203735; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i6BoEAgNTlvvhXEUj7KVnnjUgvXrxNid4eGLnOecfmU=;
        b=a+xEUAVaEF4TIxaiv0SpzgGREEdOS91scEYPunLs8JcHHwJEHCu4xPd0iyxoJ1oHDl
         O2jPnXYETDURAvztyErIM3NvmJ6aDEmBqvtL00RWp3ypcTLGRibfHQhQzyxU+VdkpsQs
         +lCyKfcmgORzqtzYL4IFHtTOQr0umMXwrLapk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790598935; x=1791203735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i6BoEAgNTlvvhXEUj7KVnnjUgvXrxNid4eGLnOecfmU=;
        b=0oNe/rRY8HUA5fNl1lA4lxgtmUuPJ7Gn21k9hTVLDjKrikmwONdhlQtTTa1Co0p/mC
         2Y2ZPcOFFeX877uoHqv93gjVj+UMBsLaErzDJXPMWdgjignBICXJo9HtKP6MvYjaosqR
         I8bSYg5Ytv7TA2IHjlxBWhY/iEOCNw0ZK2zYv22h7+sN8tXH+dG0G7HBUjeRVCljz7pW
         ISFRhdTEvnMGqcPmPA34erQUQv2W4FKT4GU07mCgdhg9dObHpX0XYhYkLZVBHV/YgZTq
         ZinTNhtxOvHFAObMJUIEOXkN2n0sVEdzM9GK7EV53wAFlmXwWS83kC3Hh/fbNIcPLD5r
         gUYw==
X-Gm-Message-State: AFq9FYKiOXNBPOaE7624VvRlQz2b1hKlHKFNjOzlw0BUBt0sjeOfrys7
	RFyr3ZYjnVas9ogYSbr4chW+YAS8f17OkKOUMWx4BJj1cmtYui0qRltSLjF9FhvY9alqhFg1pQX
	qb1Et
X-Gm-Gg: AYBFou2+Um9fJ25z/ttwUC9xN7DXv/ObAt5m+jR017stBuAK5dtwXhsUUU5wvPxFUc1
	Cqd2D69g3Llck7ywtRwXWLPpkqWD5xalOXM0Y3DtXHT4npGh0lGWzMu9bbPhsiuy9qUNhHcf+U/
	/JSLnion5q7CBsLSLbScwiDJGAsCb+NllXCjDE1ihtR/M2IAurSNmQMroenmlxU+x/q/5T8aH4V
	LxtH/uBulBqJfDN9gP9p8fesngnpq1h4FNAYQL3R8eY3HMHonvwXjEfVTNHn2dCf90nndKz54zs
	hysyN26LISPiMdaJaHzBYZWY41Dj1IibJliKXkZENw0rurtqPMqwXMK7OPma193rfID3wM6P9Vi
	euC7qghJyHnLYnMwK5kgm8T97Q8mJw/PzLyDIu6KAjh8GV8yXuSdEFaQp57NN6VznRPYC1e/v2u
	sxN7b5cqq07BBTeCpW3KCKkYKLtcZQREdPdHUtXLpfyDmX2/Hc0Trj88oIuxsQDmQfFkeGqzyno
	MRbrghykk/tQ9RLJ0rv3fWF1AzzWo4iXmG7r3m+hHa0YAYEPGXtuT7OheGQTHXiWyDGC2hdgZRc
	4L4aX2wFqU0MUZ0ZGdCMSn6p
X-Received: by 2002:a05:6000:41ee:b0:487:9a8:9f31 with SMTP id ffacd0b85a97d-4887177a9a5mr25049138f8f.41.1790598935423;
        Mon, 28 Sep 2026 05:35:35 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6470b7sm27849770f8f.27.2026.09.28.05.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 05:35:34 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-pika: Upgrade 1.4.2 -> 1.4.4
Date: Mon, 28 Sep 2026 15:35:30 +0300
Message-ID: <20260928123531.187179-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 12:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130435

Upgrade to release 1.4.4:

- Revert "Fix callLater typing by passing keyword arguments"

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pika_1.4.2.bb => python3-pika_1.4.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pika_1.4.2.bb => python3-pika_1.4.4.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pika_1.4.2.bb b/meta-python/recipes-devtools/python/python3-pika_1.4.4.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pika_1.4.2.bb
rename to meta-python/recipes-devtools/python/python3-pika_1.4.4.bb
index b85b063207..2c18659eab 100644
--- a/meta-python/recipes-devtools/python/python3-pika_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pika_1.4.4.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://pika.readthedocs.io"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=678ec81495ba50edf81e84e4f1aa69f3"
 
-SRC_URI[sha256sum] = "48d1f50297e76be4fc798fd5232d4d532d7a4758e51f7c0ae6c4004b9808a26b"
+SRC_URI[sha256sum] = "8cfc8b33a5cb16e733bd60cffca9732c0d1d761ecd80a89f34ed7df2cd38d6d6"
 
 # The PyPI package omits some files for testing like tests/__init__.py
 # so use the GitHub source instead.
-- 
2.47.3


