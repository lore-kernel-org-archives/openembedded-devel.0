Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD6AAC55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:40:51 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24809.1785872448277742903
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IyJznbWO;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ceab75934dso3016085ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872448; x=1786477248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rhrOK6ve2MTDpdvXwQRotZvu3rHyz8xet+iJbUitdTc=;
        b=IyJznbWOlGUGLoF3IPJuUwwu4ALqkn/J8t8MolrfSwP9sMgCd5dCMTyV4yMw8FkQTI
         1NZqNt0blET1EFiHcH/1moux01VcEGspKOpovPwNvM7osZZ57KgTXK0LqDoOAWsMa7yt
         XePoP7F8B7MEoIcktFD6+yoJNd0GZWx+doSLjfYxXG5L2p5uGiqck66aC0NbzYI7L/G8
         YJPe3VoKktvMdHgHjVCejhDPuqQI/tgQVrty1dRZcgseun1M5H6nOcK03J6UYJaKZvk1
         6ckCr+a8fp+tPDbRy9hCap+AZU7SedxaNGgMM7MHuVxz3kD9+WQ8KSArTxciBJhyAZcv
         b7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872448; x=1786477248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rhrOK6ve2MTDpdvXwQRotZvu3rHyz8xet+iJbUitdTc=;
        b=NUT8Qnfm+JltWdW8aytIsykhAVw+kfg0Jzolk52uxZvB8djK+jZmO+iN2qrvKcAzOr
         JKVutM99dOjRW9ydG6Vg9jYbRYbpdTkgnUzZYe0dO2zLG+XzFlk0/8HG5vwcPbH+QAYi
         Vy1WzKGnds56RyGGNkQoQfgR+5i0DbVY/vEYP9jxJxKZctSnGjiIkXUXplalXi2cYiNu
         kMyZWwsDmRuhyC1aSI+tUT+nZpLqlws4/c+10iypep0dMrVCVXz/82qC5UGuMyY1pkC1
         gABDdFEAP1FkSBBHf3EjBZtIKRxKN257KAkcStkJHYbvvVtMrDpAPvoY3+KLhPEtPJNk
         WROw==
X-Gm-Message-State: AOJu0YyZrhRxnnkeyjsksohwmUwFUhMkIcLYReRKN7SdHZFDk0Sh/25h
	0BFgCMlixvcnXmMVL8JmRKwwLfw2Cv5vYvuK9rVjxVxSPuN0WMkUqt8duqo/NO5f
X-Gm-Gg: AR+sD11IpHhgE+gVkxQEu/qIM8GE+HrhBuESHxhYNVPbNZCEjyYcuMjW+vgir80T2Bo
	gy8PZwNDSlaSJrFND6/aDvYz9Wv4HgCbdnjqgp0k86YSnRlRyGbQvE6yfkzmQsWDQXt6/FNSMNp
	67XiZo1XNpbSK2Mz5TN4acZcH8iHSZyukRqPjHncy/G4+IGm7Seg7wryopmYvmDYKqKCqg5YrKQ
	ME+vbqv23wIJ87sibIq7MHNLjCwcSQJsYheVwnX90Xh2xW9pRg25/efSPv3kJpGqKUS6Ms3niAX
	KUL40ls9b3+OsxtzmuUrBQFvfRtAH3u1ZanIWBrTqx9kzBM6G2g1OPPLNK8rXW+ApcIPhDc5r45
	0yAFfD8J0d7qVXSaSd49spw3/BHGVuIDf2X0E546cBZK7L503oNbNlDBaEN87WH38b67TxQLVVE
	4P/WxIaiN0AQt6PgannWrbPy+zRXPqPgqjDvh8qyrXLoqrRB7n286Mckgi1h+KhlVO02znPAEj/
	Q==
X-Received: by 2002:a05:6a20:4307:b0:3c3:68b0:e273 with SMTP id adf61e73a8af0-3cb85ea2c70mr829209637.15.1785872447539;
        Tue, 04 Aug 2026 12:40:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:40:47 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 15/36] libosip2: upgrade 5.3.1 -> 5.3.2
Date: Wed,  5 Aug 2026 07:39:42 +1200
Message-ID: <20260804194003.3158916-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128762

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit b226b53ca0be4c3c3591714770be35818fd63b49)

Changelog:
https://cgit.git.savannah.gnu.org/cgit/osip.git/tree/ChangeLog

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libosip2/{libosip2_5.3.1.bb => libosip2_5.3.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/libosip2/{libosip2_5.3.1.bb => libosip2_5.3.2.bb} (88%)

diff --git a/meta-networking/recipes-support/libosip2/libosip2_5.3.1.bb b/meta-networking/recipes-support/libosip2/libosip2_5.3.2.bb
similarity index 88%
rename from meta-networking/recipes-support/libosip2/libosip2_5.3.1.bb
rename to meta-networking/recipes-support/libosip2/libosip2_5.3.2.bb
index fa99d33e1c..2de4f4345d 100644
--- a/meta-networking/recipes-support/libosip2/libosip2_5.3.1.bb
+++ b/meta-networking/recipes-support/libosip2/libosip2_5.3.2.bb
@@ -10,6 +10,6 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://src/osip2/osip.c;beginline=1;endline=19;md5=22ca0da0e41276c50c81b733953c208d"
 
 SRC_URI = "${GNU_MIRROR}/osip/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "fe82fe841608266ac15a5c1118216da00c554d5006e2875a8ac3752b1e6adc79"
+SRC_URI[sha256sum] = "16186f6f5540936b62c3aaca6e8409e1af25cd22abc3882b393be215f49d3b00"
 
 inherit autotools

