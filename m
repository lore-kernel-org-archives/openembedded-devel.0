Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4DBC98321
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 11:48:19 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6903.1768650499118106842
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jan 2026 03:48:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UPQSS3o9;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4801bc328easo20827555e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 03:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768650497; x=1769255297; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0662bz4mEw4OcAOmJuzyZAeo9WvQfLoKaZkZfz+5pg=;
        b=UPQSS3o9E4bPnL62N1oAMfl7u64bNp482GyMqBzqPdJdheS3GHVu1Qe6sJXlPEAd3Z
         zi3BSQCPqtWcX3e4guw7nGX2tbvZPodI/IJXIaImbOgmHCsfdZepd1LQMbYyr5seoh0b
         jUu39lXTTO8PJedfDdilACsUDgKINeZdLntvkrxfoOTzs8zX5ztIMo1i4N3KThFe8JWp
         9GUS+oNt3J6iHIR9AldiXXqkNHxM86y+cjAWVcYpQZmpMqmU/7hfILZcfkA1HVkGAKEe
         fIKvFjqQEsr5KQo+SP+IvEnekENAl9Fv4W3rQG8c5gdu8QDrGTAyeGOQfGtT8iRdGbos
         D0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768650497; x=1769255297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V0662bz4mEw4OcAOmJuzyZAeo9WvQfLoKaZkZfz+5pg=;
        b=DKdJcWT1dN1EIFptUIIrzRbh9tYapXqqGS9B7ARCrE8T4SSYgixGbxGOqNsslFGyXE
         4otbZNH7N5BrJ9cZaBGuHkXr9I9Wae7kpcXUA2F52nSFs7PjQ0gK3G3wAMtmsd5/9Ek6
         Lp49oI/4MrXkpvoB2sJVVDHBQaZzp+kpiuaSAKStLG4eQDnmnYf/0LRQgvIwzPFljI1A
         qPrDsBFxH/aAW3UPJDnrnEBTizHQDwtgD8qymG2IbY5JBvKLMfKb8LxvYFqJElyRBZlj
         XSWrBkNK6y6kbbo3WRawc1XjCWCmLOJKE/Km3wOUPuYmmVPkqTYT+YfXgFUZDa8VcU1S
         ay/A==
X-Gm-Message-State: AOJu0YyTyjY+w2CTQFkVagfNbXxsRC7PZMmOdiztCknblI8Hn5czkfAU
	jke4vRHJL4WA2OBznbv3VbnZxzdD0aQUIps+foK1XPYadk84xC/LTqfXCaOEPQ==
X-Gm-Gg: AY/fxX4o/hTV8Bwv+tf6bTguAcbjRmcvXChvfDvL4GTaHfG/M9K7VLiKtdCn/pog0PD
	oGvDuX+2JyLGQc3+d1ouY0+rGVip6TC1DAaUoNLujdSIJjcnQLbJFyFJ7vDRPlhg58bewKAKzDt
	lvWvxBrW1bsJT+rlnG1O7m1Vzvoie3hzQZEq15eiQgvJXBm/FFjW4L9GeAtyJ6DzQ7Q/OrJDBTn
	i45M+Q5s4J0ba9tVe8YcNCnrs1LB9zD7Ni7/aulYKPmIQ1UCNPUv0h/qzu2w70aJ1/FZaMP7fyY
	7xi/tWaSHy4ADfsCrbmt9vYVny9U2DxJVnTQ8VSv/Q4PvjChBa4TNfAAvgZw2KS3yS9kx/XyTbM
	BmpAAPLOQ/O4oFdDMP7HOHMCutz9K6z+5/BiLFCFFejgxKveMFC/QJPX23CKwb0NSm+TvGKag9R
	5Dw/RSbHZH
X-Received: by 2002:a05:600c:8710:b0:471:14f5:126f with SMTP id 5b1f17b1804b1-4801eb142famr66780525e9.33.1768650497480;
        Sat, 17 Jan 2026 03:48:17 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e886829sm89717245e9.8.2026.01.17.03.48.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 03:48:17 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 2/4] python3-croniter: upgrade 1.3.5 -> 1.3.7
Date: Sat, 17 Jan 2026 12:48:13 +0100
Message-ID: <20260117114815.782230-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117114815.782230-1-skandigraun@gmail.com>
References: <20260117114815.782230-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 11:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123554

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 546ccc4a5bf3f6f7f7703e73651d4a7c9e2ade3b)

Changelog:
 - fix tests
 - Fix croniter_range infinite loop

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-croniter_1.3.5.bb => python3-croniter_1.3.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.3.5.bb => python3-croniter_1.3.7.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.3.5.bb b/meta-python/recipes-devtools/python/python3-croniter_1.3.7.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.3.5.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.3.7.bb
index 92962c0f45..c84affa851 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.3.5.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.3.7.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "7592fc0e8a00d82af98dfa2768b75983b6fb4c2adc8f6d0d7c931a715b7cefee"
+SRC_URI[sha256sum] = "72ef78d0f8337eb35393b8893ebfbfbeb340f2d2ae47e0d2d78130e34b0dd8b9"
 
 inherit pypi setuptools3
 

