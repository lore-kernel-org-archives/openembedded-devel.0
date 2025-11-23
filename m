Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D31DCFA46B
	for <webhook@archiver.kernel.org>; Sun, 23 Nov 2025 16:17:49 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17519.1763914659326380411
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Nov 2025 08:17:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zx7QOiJY;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so22944815e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 08:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763914658; x=1764519458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YnJT4/ASWFt7lIM0w6YZemNxRuVlAy8WRdqWMqOBLyc=;
        b=Zx7QOiJYdUpsEMDC1scV/NaihOjY7NZrUqachjIS9+RkwwBYQxJZbATBJzbUKCjlyU
         +v33I/3BctJl9FLMWEqdDFrPiEtq5z25HgTKAx4mKlOIJCkPZm9dMzwDFFtKcf3z9njE
         MQ2TOottB13ZfXN4rTU0M8kJcNvvPulX9YLiKOGzQre508u3qsrem4fTuV2lkfjGCdwd
         u61piClEZlmFOnD3Qf9WOI2HcEqVhFqn8sXzQz4WjiIarzalpeWqQUNTP3MSyXHwpfN3
         3c30XVtqv0G6HkerfFX7Q7uwLU0zLjnAf1tGZmpjKFS2xUlDWpacRnmKJQTdmMx7ISsY
         1/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763914658; x=1764519458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YnJT4/ASWFt7lIM0w6YZemNxRuVlAy8WRdqWMqOBLyc=;
        b=cyyveh7NwvP4ehjAXep96QjaG0N95vXQ+/KRggXm7gN3Bn07gVKpAtqYOnwXC5M244
         UFf74a5sNZK1b+0iKBxh8GEItDLhneboeu/zFs8S2f0boaWnJOIufUul/5HLcWg7Jzp5
         6iAOSipZe5TshzM1hnCVQ02nQVjNvhNa+OiNwTKjyjiXcPR0/gniTQVDV5ibfwsnf1Mq
         xwdqQMhwl5AWlEcRJf2eriXkbpv0vdRrQDB6obnTmVc5lpg5cZF+nWw9zesi0ob4mivW
         Dr/ESFvk/FnZ5HmSYO0YXA311R5WBCyuoZ+gGsKpyWDCJcGdhzoaRzDFMdgPAZ9yrTLa
         dcig==
X-Gm-Message-State: AOJu0YzrQDh1Nf1ZXGDohhWSwvzgzao2AMo1z83YrgsgF+e6dOwda95e
	k3GmrLQS8NNxajKW82qEt9bJ2NKmtExhXORhdELaUM5louiiU1gRAt17krmDvcBX
X-Gm-Gg: ASbGncub2k+KZR/IAE1gO3Hb3byQeRyJlQqoLR0xZxJ4+dC9/WW/eQTHv4BI3wLHiYC
	hKLb0FpSjXDit9QNA+f5dCMhtIjsoQTgY3hknijW8PgDxS2JgA0Q7aorM3NO/T3rBcVZ82XRbIr
	DV7SOGBpWpzOg62yFoZyw5QSv8/UCTxCmvJWV71PNwsnvalLVxSFRRMQ0OZFafnCpkhmJkekX90
	zO0P2IZq2DF8QJftnDYTzLExhUp5aKfO6099yuZYMU9xSg/ICK1RB0U/lnmN+VmsHhDykRePzLX
	g4M0/lbWMVviIxW/YLsikLQXdrdPNvti/yYj6H5i+G78JM+m6qgyOSN651wlbUfKcJkWYal9Lkj
	cHpXl+qPjD0o3depD58BB6D9w76ag600C8JODBst+xJuF3Rq/uCAW/9yxUmD/xz62PnC64jMALc
	3LgmYUa6aablajyg/g6Rg=
X-Google-Smtp-Source: AGHT+IGbAePXTPWkmXzpz5v+/eGAYv74ijt5CEP7+yEXnyoonbOuQ4DmaDa1gTJ34HaPWfS5D7eAFQ==
X-Received: by 2002:a05:600c:529a:b0:477:8a2a:123e with SMTP id 5b1f17b1804b1-477c1133932mr82355575e9.33.1763914657670;
        Sun, 23 Nov 2025 08:17:37 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3592sm22279416f8f.21.2025.11.23.08.17.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 08:17:37 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/4] redis-7: ignore CVE-2022-3734 and CVE-2022-0543
Date: Sun, 23 Nov 2025 17:17:32 +0100
Message-ID: <20251123161732.1875494-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251123161732.1875494-1-skandigraun@gmail.com>
References: <20251123161732.1875494-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 16:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121996

CVE-2022-3734 only affects Windows.
CVE-2022-0543 affects only packages that were packaged for Debian and
Debian-derivative distros.

Neither of these issues is present in upstream Redis.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_7.0.15.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis_7.0.15.bb b/meta-oe/recipes-extended/redis/redis_7.0.15.bb
index 7b5d55467d..61a088775b 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.15.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.15.bb
@@ -34,6 +34,11 @@ SRC_URI[sha256sum] = "98066f5363504b26c34dd20fbcc3c957990d764cdf42576c836fc02107
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
+# not-applicable-config: the vulnerability is not present in upstream, only in Debian-packaged version
+CVE_CHECK_IGNORE += "CVE-2022-0543"
+# not-applicable-config: only affects Windows
+CVE_CHECK_IGNORE += "CVE-2022-3734"
+
 FINAL_LIBS:x86:toolchain-clang = "-latomic"
 FINAL_LIBS:riscv32:toolchain-clang = "-latomic"
 FINAL_LIBS:mips = "-latomic"

