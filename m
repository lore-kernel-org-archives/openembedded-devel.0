Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF8AC53209
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 02:14:56 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11435.1784859287302525693
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2026 19:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GMo9icwv;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso14185445ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2026 19:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784859287; x=1785464087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Qd6e4wOR0oZn9zC20axNKjmv97JvqN7msjXRwgirLM=;
        b=GMo9icwvP/k3ckLOCssVIhyFaN7i+jfAg/ibCLLi5+xdPMLBYIh10CQEd9T5yZBtiV
         b4HJv7mDe0ysR9YztaQ2CR8AUVtnIWJQTwht9Y9Lm9nF4GGxJWvGMSWwT66PE9BSP5YI
         Gqwf6W5zE3Q6c27k+qycw8gf5QOK8zL9sUfeEnSpez8ClMMhcaaXzc0mieTqZfpNfeYA
         J266JpDWEhHUbw+BlEWz9cVJ0r/pwLobQ/W6IWwBUtrwPnGqzhYuZ/PvVnm9AD8objYB
         1nea2yGSqofpBMz40N1wP1oT5kT0xzPAEXyK9tWxlGhhuGEccDZVTqy2pBcBzugEbG18
         WgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784859287; x=1785464087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Qd6e4wOR0oZn9zC20axNKjmv97JvqN7msjXRwgirLM=;
        b=EE2wj0Z7UaiouWl/6rlFTXjRCOPZ5jV/EyFUPaKTH9Q5zAXBcYfx5JQyrw+avbUlF3
         UT2gfGp7qBH0/pnUxa9vYGa17QpI3ryFFE8Gn6SG0m8RpEyTKTYmQ1DcqMn58K9zEfD8
         vLhUub8tC4NsKe1MJQYrCFK07d6d8vNmSde0+l4uBvhne3s1XmTifRkXmEfOYI4Jx7PS
         iQQRy49V5DLS9tOk30ZKrjKDJfN85bVuN05ixs3mtKcZYJoiW9GbZv3B/NszB2jii/SV
         p9PmZZkooxf4nxhtIIFi/4efpdXkxqCFRuo+8ay4AGj66l4GkxIZEEBSDriH9j1Kp1jJ
         OmQA==
X-Gm-Message-State: AOJu0YxYi05i1wlQujMQ+Yc7ALCNLzxdNr+5IqFPZzuHXgkxagdSYtXI
	0uoFrAKYG0YAXcA5+gBIwkGzJOcfb5IfSm8NEP/RIghJL2BMjy2Vup+Iu7Q1fw==
X-Gm-Gg: AR+sD10P7ozhR8urKfBaELr9olLVzmB4OG7b3gIr0GTKJcRVg9+Ri6y1FgB0Oj7xt+4
	1OyqwG+9c6BK0JwOMyFhf8G7hna4rB7GlMTIGMADWDJVfbJNsm7Lr9yTPNDPmp8bPYVid5QGUKW
	W/LGvg+J7hJJHUAy/vFPzXOHpKFftTRUgCANdoeaNandd+TGjPZ9iMY9KSuAUwBXS6QicqnvMiu
	2LpALqT3TPZ2uzrodQS+HZskVa+zJ292pzLss6VYADD0DgXPEeaXyNGmYpMwIkhadNFToE2LKFR
	+YHpIN8TB+xXShZSctTAWgYafWD4JJ+2A/zwr7Sd3v0R5nPzv7bJd9Mgjp4sh9RC/W1NQv8zO5N
	Rm3UvKs849zNN4EuFyO8JYhM+8/+SuuG4joBuEDcJIiBh0+zUTE9RAbUTxYkXUGqhKaH0K1WXp+
	9rocEI30zNXQRgyUE=
X-Received: by 2002:a17:90b:4f8b:b0:38d:3ca9:434 with SMTP id 98e67ed59e1d1-38ec6613322mr5706336a91.28.1784859286577;
        Thu, 23 Jul 2026 19:14:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1300401fsm26824794c88.3.2026.07.23.19.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 19:14:45 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 10/13] freerdp3: upgrade 3.28.0 -> 3.30.0
Date: Fri, 24 Jul 2026 14:14:04 +1200
Message-ID: <20260724021407.2840261-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
References: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 02:14:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128432

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://github.com/FreeRDP/FreeRDP/releases/tag/3.30.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/{freerdp3_3.28.0.bb => freerdp3_3.30.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.28.0.bb => freerdp3_3.30.0.bb} (99%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.28.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.30.0.bb
similarity index 99%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.28.0.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.30.0.bb
index 628b69cc2c..7d78f770f7 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.28.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.30.0.bb
@@ -8,7 +8,7 @@ RDEPENDS:${PN}-ptest += "cmake coreutils"
 
 inherit pkgconfig cmake ptest
 
-SRCREV = "5370fb26fbf034ecd11d3026b6ad639b5fff493f"
+SRCREV = "6b107f0aadbabc47941c5a5b893b88c01792af6d"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${PV} \
            file://run-ptest"
 

