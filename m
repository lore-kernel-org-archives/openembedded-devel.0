Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5CBC98314
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 12:58:55 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7282.1790254734676039355
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2026 05:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kerV3ru0;
 spf=pass (domain: konsulko.com, ip: 74.125.225.141, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so11554445e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 05:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790254733; x=1790859533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fjNRub04fx2y6EnRxvOFGr1RN6HlpyoRdblf8Ye1rcY=;
        b=kerV3ru03v6L9CZBWxB1hWOKskh9nEBIHYzw7V5LMtnxeplvnnbdkRW59i+xiQX1R0
         qxKiNo9ru5mZU6ytefjFL0qmyC3hS21/tG961VPYTDxc/6KZJpYxcb7+5in1m+RYB4Bj
         jskZZAwm1aw1ISuszGjph6Ld3A6NcB796S68s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790254733; x=1790859533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fjNRub04fx2y6EnRxvOFGr1RN6HlpyoRdblf8Ye1rcY=;
        b=zLr2RbDJgF1gA+7kjTFywtxTmeI5kH41on1mggKHTGP6RekZ2FQqiMM61zHA/kvhCZ
         J74ZGI6srVTOUN5y/NoXGU1JS7aE7uoO5h0ewxUQnm0RbZmgimByEQUPQ7wmYaTcFrWy
         /nIqDdA7QOz38l2QcJrGMzr29uapzzqzKhLZ+COEKZpaMoJpCkLrRphdotZXcdyOJrIC
         /p6YIICDmZlSpvJVGtcAaQuiUvgVcJXhw0LlhC4yyOVSbhGxp1JFWHOwybA6mFq0q0Em
         57nBACNZiWdCxx9nDi5n5PaO/Nq0Fi90fZVD/8AVFg9Ijzf0TBY4aMqYHZtbD88Xkbs/
         IRXA==
X-Gm-Message-State: AFuF++mQISvelylwdM6upOxuTGc6MlamT+SK/Qx7+8hjDbO8hxqf9Uli
	atNoF9fQQX9o9BsWC207ZVsnkzR4jSmAhPxUSJuvIjVGLlkQxbtWhTHgglxbrB6id3P8VnvHdz8
	7/ghD
X-Gm-Gg: AYBFou3UW4U2dWyLygZ2ea8Dqr4edOJ9KNA9Y8fbsVM6vilAchA2CrSLMwZXcAzXLbU
	W/Kr/0vtSJ8WloGNKl/32Xf7jD6Soe/5yYMtjkLmY8wvGzR4EoDzKAu3F5he6+AyFmD9mn1ErGt
	5/X1ZlqlwQ0i8ZADemBnsw20stMyzjkbuqIuPibIPLfK0iRh/NfVyBgw3G8yLYD/fOeg0+HEFb0
	Eqmx3ifWjaSzAHu4upnbksQF0N4xny9HMnHqUF09BPyQ6ke6ChLjGZ7uBFnFLUyr04lno7iRZ8U
	UBzrrq4DfPXY/xcL98ZsviJoWZxfl0nCrBAB70BXFPfSO0D7qkOYuPAXiAktqel+OcP1U0Arkg6
	edawE7AKmAh1r0rG3QzCG2RHWifVhNSZ63Lu38rI+1foh17uX48Oxi/ryt0tfXphaNHmqyeJpgt
	wCDLBZp/18xycOrQFwTQArUFcVUnttNXGpvQzksFflw8QZHBqPJEi90medKPSzMrgqrsC8895Mm
	+3iAlyJdYCY4ZS8nogu117y+gwKZJfI911BL86l2XrbpRnnQWL0Qw2hmyWMFo3zxE/UUpMNM+C3
	eK0cKYQp54PAH/BZaZFicx0=
X-Received: by 2002:a05:600c:8719:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-49fe66c8a5amr42467045e9.7.1790254732660;
        Thu, 24 Sep 2026 05:58:52 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5ded2b7sm63956605e9.10.2026.09.24.05.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:58:52 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-pydantic: Upgrade 2.13.4 -> 2.13.5
Date: Thu, 24 Sep 2026 15:58:47 +0300
Message-ID: <20260924125848.526537-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924125848.526537-1-leon.anavi@konsulko.com>
References: <20260924125848.526537-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 12:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130285

Upgrade to release 2.13.5:

- Allow reuse of validators when plugins are set
- Fix missing GC traversal on some pydantic-core struct fields
- Fix missing GC traversal in pydantic-core for
  GeneralFieldsSerializer
- Count validated model fields once in smart unions

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pydantic_2.13.4.bb => python3-pydantic_2.13.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.13.4.bb => python3-pydantic_2.13.5.bb} (98%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.13.4.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb
similarity index 98%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.13.4.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb
index 17a6941d14..7c5dcdcb26 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.13.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit python_hatchling ptest-python-pytest
 
-SRCREV = "cf67d4b3193c3fe43ede18612ed62785eee11382"
+SRCREV = "001dea020e0809844e5b17666432c9135a976f46"
 PV .= "+git"
 SRC_URI = "git://github.com/pydantic/pydantic;protocol=https;branch=v2.13-fixes"
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
-- 
2.47.3


