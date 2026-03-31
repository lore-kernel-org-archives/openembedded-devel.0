Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA6E1061B3B
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 11:38:40 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18374.1774957118931685263
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2026 04:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HRP+k9Uq;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cf7683a28so1407437f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 04:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774957117; x=1775561917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ieHvxOf+daO5IOUpkWzzXMQxpt1462V7bIq7E86rMtQ=;
        b=HRP+k9UqyQEjBWvyMvpzc0zv2Y0F5236U0Do8e8w0AWfJbWh1PzQ+wfoA3H/M8Ors8
         sG1KZ535jHYZveHU50OpAEMN9Uc5rP8G0mZ2BMTvwWGAfLEWb1wNIa+2JpCtZGMClr65
         dtGgGiMtqRYRNnvpeQozdaiYManzBBYSwkJ7PNkDsTbgE7JRyBDQK7qfznRNSKIOolEk
         f0S4LNWO4pI3kHuaNdxtumlWbBQDrjLBEDysUeR8Z13uM4mr9atgRRyqOE8GrV65Z3IL
         9rU9sZUK1YbG5+KNtYnaJ4YTnuPHtcZ5oFb0+po/iXVGzyALLiUZ9JtpsW1z8q5KJ0hH
         erNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774957117; x=1775561917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ieHvxOf+daO5IOUpkWzzXMQxpt1462V7bIq7E86rMtQ=;
        b=NCNNHVN8cHV8rkqCQruuB2Py4BNkBE/kl7K8SiisNiljEnm4u+nNDAoxYKjn30Fbgw
         4AKp1/iI0ISddQK8RLpv2xNqUzwxpdFPhesO7vYRl46aU+Jvtsk1JL63JAOJuvzzJDrD
         1QJ5QbLM1HgF1pcMVea7C4e/9/j4cpQ3jlt9sHJKESU1i5rHwDckeL1/cyVHS8OTwnoP
         jmbJpt1t3yBDlXdj7VCn1/V8MgxeUlJ/6zrhct/PHKOBfGqK+L78id80tEmLywx/KVNE
         wN2LFN9ZnzrGmTwAUIwzJXDQvzVhMUP5l5rq+Us7dmDxdTcKMyb0LxrkX1dn6Rv+jgwb
         Bdew==
X-Gm-Message-State: AOJu0Yx3bgW3rsrgvVmZaHzlC/L2wYsijfx7w1L5F4RhmPRhXzzjCsY9
	6V513Ic/jdAV8xA55b3ARoOZcijJ34JvlYcYgXIxaAX6VKm6dA6LG8Wa0K5/HQ==
X-Gm-Gg: ATEYQzyoc581tvNtI2M2yx8axGVNpUSPqyT9KUyZdV2iK7BCCiMuJtgyh1WG3dncFMB
	3P/HHUng4TTkR04GgegJS9TJqVR3lY2R+Q60F01WrWVYyVt0O3xjZJE7HkM3xMyJ2mD22rTPuWm
	kFKMI7NawDpN/yzUCzfJnd1xsJIEUW23wFT5VOdWv+UUGkCpuE8/uD6y+7+rZPwjA9x8sUwVrLV
	Jw4rIJxIMcIcA2o0p5481USrgaMCWFDP5668wyHZ1JT8I9nvNQL2B9zxhU9OZ78X+trDlmka6pU
	Bq+LWNXyX7atctTVUz9b9CdU2l8mpq14UiQZkmVkJSqjYqW3t6R35CUI7X1SSzGUSfDiv8xyjBK
	8+IGCpHWxP4RZ3rE2d0BD7ddR+Z77hutZQLu1e5U8coCFnl+vps421xhWcWJtSZJM9jrdiiBG+v
	4WqlY0cXT0Z7Ekzl006NpANOTPJj2srbc=
X-Received: by 2002:a5d:5f88:0:b0:43b:6356:7d00 with SMTP id ffacd0b85a97d-43b9e990080mr29059732f8f.17.1774957117140;
        Tue, 31 Mar 2026 04:38:37 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf330872asm24401846f8f.17.2026.03.31.04.38.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 04:38:36 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python3-nltk: upgrade 3.9.3 -> 3.9.4
Date: Tue, 31 Mar 2026 13:38:35 +0200
Message-ID: <20260331113835.3567782-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331113835.3567782-1-skandigraun@gmail.com>
References: <20260331113835.3567782-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 11:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125888

Changes:

* Support Python 3.14
* Fix bug in Levenshtein distance when substitution_cost > 2
* Fix bug in Treebank detokeniser re quote ordering
* Fix bug in Jaro similarity for empty strings
* Several security enhancements
* Fix GHSA-rf74-v2fm-23pw: unbounded recursion in JSONTaggedDecoder
* Implement TextTiling vocabulary introduction method (Hearst 1997)
* Fix ALINE feature matrix errors and add comprehensive tests
* Support multiple VerbNet versions, fix longid/shortid regex for VerbNet ids
* Let downloader fallback to md5 when sha256 is unavailable
* Several other minor bugfixes and code cleanups

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-nltk_3.9.3.bb => python3-nltk_3.9.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-nltk/{python3-nltk_3.9.3.bb => python3-nltk_3.9.4.bb} (89%)

diff --git a/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.3.bb b/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.4.bb
similarity index 89%
rename from meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.3.bb
rename to meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.4.bb
index d9f661b262..50c751ba98 100644
--- a/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.3.bb
+++ b/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.4.bb
@@ -24,4 +24,4 @@ RRECOMMENDS:${PN} = "\
 
 inherit setuptools3 pypi
 
-SRC_URI[sha256sum] = "cb5945d6424a98d694c2b9a0264519fab4363711065a46aa0ae7a2195b92e71f"
+SRC_URI[sha256sum] = "ed03bc098a40481310320808b2db712d95d13ca65b27372f8a403949c8b523d0"

