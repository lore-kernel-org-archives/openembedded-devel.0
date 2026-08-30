Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A67C61DE1
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 00:50:51 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1034.1788051045976578446
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Aug 2026 17:50:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=r/0V+YJs;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso3322393a91.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 17:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788051045; x=1788655845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aAQMpg3lGojFwY9qmTdnbFCoaklIcP5cDwNLmhUlhko=;
        b=r/0V+YJsmLD7Mn6uX8kIbEXuPEoZdbkHGhasqokLkhnbeQBlq5W98sin6JhuTXnaak
         I3cTpXd7Cuhq03N7nzJZamt2bwyzCoQoFO0NxX50Cc/FToED/r0wFdNmdPZ2GiNpCcvg
         Q+efLpIcfMNax3JxhOOnb838zy7+JY6EHbpuJrTZT9Za+GRYeJLwJch5qPamFFmU7diH
         FtyRXHr3P1wFQzo/465oaxWHP1mxB7dpJc3KYdy461fLNgWGwr50KoKJMP8kHxhuzQ2E
         KNUJE6rucBaqdLuT3McCIGNONAFefZO0gCX8apKRu8zJE7FcNKTxeKg1ozWnEaH6ONxX
         JJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788051045; x=1788655845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aAQMpg3lGojFwY9qmTdnbFCoaklIcP5cDwNLmhUlhko=;
        b=mJfJayMXujl/n5Ij3COVwROJHhWcmFxuPt5jrF6AwYQvqXwxu1+MQmx3cQHWN5y0oW
         cAPkEeIZnTNzm7PR/XDeiAHM4gdmRDmqZfbHhPsOxIpabC0n4wUmUylfihttJK6NuKq4
         k7Ed5riDL5mbD2Dr8W6drtyhepX1uTqmMUNftmEFnZkdW7LQ38nUYwvLM6LVtf+T7gBn
         2JtN+Qvg3xd52y/UN+Pm/PyCFadDcFsSRZT9iDesATY7tCWDVQk46djaIAUqdSG6mlY3
         86NwlGauzTgv9PhdGZSNcsxQnrXuOpHtxJWwuqbOpz3ZIe8n/g9jSsNrBZAKFNUwuxDZ
         76Nw==
X-Gm-Message-State: AFuF++lRvV4zl6dIRYrYs971gs5zVU26p/ku/mnY9nASPIGGwSpvNxTt
	GQnaqyzmczFrvbLQUFUwGeId5nf8jeQfos1Y78XTvojd7khjY7aBBfT8UO85Clj2
X-Gm-Gg: AYBFou09a9uBndL1t36ChIsYjymInxzC5iEUllimEC+aerdgkv7ME3BLiO5+j7Phu1C
	WQaFcYDdLD85xJ55Ud2JsHx5u+kJ9g1+DDpKUqIHrUlalH5NyZcmt7mzrR+MVN1H/ietYkhjFy5
	MK4MfvRXPbnpouIe8UWIzsiFJRjKHREF6KZjUVTePXml1e7Ee29/3LzwY4zPHeLdLzaxE4lb4fF
	KN5nNGH5kF5h02peYjt77lut3kOS9iXOEVgFSKkNBflcWD5L9ZRvOCnJbIQUyXlxC34dGcekW4d
	yNvD/G7d1yLbBF0SB5NVwYWfoJxm8m0PvM7JIYVVGpDFTdwO8OOaSo3O5qj7IuHii5KcCyDEUIa
	lDIO+gZfKIkgy4ftyLoxt/6wbvXYm9EqNwpAP0nCos/egtuARCHQjkIoF2YbAHNo/60qTyxMUZ5
	YyGanafg6lE/DNhO2g+NppvGfy8HnnnVgv2IS5tIperFzxuK9nCoMqZpjnuTLWKmAsajZ0cdvLE
	SCLH71W/yg=
X-Received: by 2002:a17:90b:388c:b0:396:5f7f:52f5 with SMTP id 98e67ed59e1d1-396d0e2466fmr27724568a91.3.1788051045420;
        Sat, 29 Aug 2026 17:50:45 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea808csm13561826a91.2.2026.08.29.17.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 17:50:45 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 10/11] python3-cmd2: upgrade 4.2.1 -> 4.2.2
Date: Sun, 30 Aug 2026 12:50:14 +1200
Message-ID: <20260830005015.2555347-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830005015.2555347-1-ankur.tyagi85@gmail.com>
References: <20260830005015.2555347-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2026 00:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129591

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/python-cmd2/cmd2/releases/tag/4.2.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-cmd2_4.2.1.bb => python3-cmd2_4.2.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_4.2.1.bb => python3-cmd2_4.2.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_4.2.1.bb b/meta-python/recipes-devtools/python/python3-cmd2_4.2.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cmd2_4.2.1.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_4.2.2.bb
index c7be4e8f06..e5916dedb9 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_4.2.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f2a861642858e0858af9dd4e4716bae0"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "89021603a18ceb41600d2f02b40c5df4d37e411027308e9a58714be1f3a56b6b"
+SRC_URI[sha256sum] = "8f1aff338f693be4c5ae0a1c928b17d728940e03386018615b25cdcd4abd6df3"
 
 inherit pypi python_setuptools_build_meta python3native
 

