Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104BCC9830E
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 16:30:59 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2391.1790353853015705801
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 09:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=KiSPZ6o8;
 spf=pass (domain: konsulko.com, ip: 74.125.225.140, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso7778675e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 09:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790353851; x=1790958651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f4Bz3hlbWg8LY0yi6fXJ66W4RAyN/xVjq28cyuldsks=;
        b=KiSPZ6o8ONQmgw06tljW5cFF7+xW1oBkeLwj+ubxQfqSPGRURoYYH2feu206m9thwW
         +5azfxabxEHErRZVifBGClzKTJZ718ZsNuxiO46ofW/AglkfF9eHINJSbA+3AhX4XLSa
         fr+uJE51MSlOJJEcXORqijGbnx186bqO5JfKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790353851; x=1790958651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f4Bz3hlbWg8LY0yi6fXJ66W4RAyN/xVjq28cyuldsks=;
        b=hl/odgsUbCPZVpZdy0s8sg5rbovRSSrUjU9aVKdRy1j3DhsrLvyUwAOgt4rtoZqStO
         JrP5o/yPwsYo0JxSgtcMPcNImJXNseY0Tf3oESViADBonr/a7Vuk1ohKFlzI6ZU4uxkI
         RxoA6XX9EefO89CuFqzcIX+Zqeg5JVWuhiACTpBjuSvfJP7OEIqXep+/GjXR/3IzdJdr
         FeOtkRoRMOY8iFeQ839Ha0vfA/nT0xVZSayGMF6P/DG+cl8+X7hfXp56NZQb8OcosbPs
         uKotRTdQssHZNTc4dJHjf9gVEJc/aFflX6+DPBzQ/EBlAet/2GVOcO6bJCdURKXRFrZX
         Bggg==
X-Gm-Message-State: AFuF++ms+pRRdnF3FcNnfGdwCWf1LJe020RxhuW5L5X8+5GZnUmmI9Es
	uwiTorWDqbQHhLPppMDJj3W6F7P3HzIX6m+giCchgUxrrDG17iH+2tBFniqr01d4UvfeaUT179d
	0toL6
X-Gm-Gg: AYBFou3+pQ/fSQATqiR2FXpPS6WscgzYnWAS8NX/+7TH3/HHciJH2g9cIyE1hR60ey3
	JcZ189KX+ZQ9DmR0YfcoPEHmPVByWwbm8KpqAM+NoPwUYaTaK6sOy5j9s04x1rz4yKnHl5q4MgZ
	QnNPHhkXE4TXAUne+A/TaKqgJg3B84/MP4CAj2xZ1SN0teXNJJeCc1bW9ZTS56dahe9jwF01GBU
	2lU16b2lS3gR72H8SgA4iXXohm4pCNdN2Xaiag4bQ+rz14d/UQv+iPBHZK+VHX0Z95BjtAvG7rP
	IjzqgjC/3zF0z+EKHrrUVgg72q7lL/eWhS55Ndy9VdBXSEpTz64Di35aBouB3wmyWw5quriN3b8
	stKEAGEXr/NpUgiBKitYaS6z+sxrBQTlLXqk8cF9hoqpC60go2XRqliQI9Ca22TuOjRysZnATZf
	NNcuoaCZym+qTG1TiZtaVSrbhFkdx10iuL8JjSeYOigGQvnegfsvcWZhwbUWgY1Wk9JCNfQkaSf
	8aSJBVi25+/1PPRUG2dAM+iZDCnf/MLs2vG2SV97wTpLrEJPhtyBbmuYeDCn/KQZwjkACtclNeQ
	fxF21Dl4mYrvmObzvjtNaFA82VZ+AIUAuA==
X-Received: by 2002:a05:600c:6207:b0:49f:bd3c:bc20 with SMTP id 5b1f17b1804b1-49fe66ff476mr121062355e9.27.1790353850971;
        Fri, 25 Sep 2026 09:30:50 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff044422asm69923035e9.2.2026.09.25.09.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:30:50 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2] python3-pydantic: Upgrade 2.13.4 -> 2.13.5
Date: Fri, 25 Sep 2026 19:30:48 +0300
Message-ID: <20260925163048.2523782-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 16:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130306

Upgrade to release 2.13.5:

- Allow reuse of validators when plugins are set
- Fix missing GC traversal on some pydantic-core struct fields
- Fix missing GC traversal in pydantic-core for
  GeneralFieldsSerializer
- Count validated model fields once in smart unions

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-pydantic_2.13.4.bb => python3-pydantic_2.13.5.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.13.4.bb => python3-pydantic_2.13.5.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.13.4.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.13.4.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb
index 17a6941d14..4ad7df88de 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.13.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb
@@ -11,9 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit python_hatchling ptest-python-pytest
 
-SRCREV = "cf67d4b3193c3fe43ede18612ed62785eee11382"
-PV .= "+git"
-SRC_URI = "git://github.com/pydantic/pydantic;protocol=https;branch=v2.13-fixes"
+SRCREV = "001dea020e0809844e5b17666432c9135a976f46"
+SRC_URI = "git://github.com/pydantic/pydantic;protocol=https;branch=v${@oe.utils.trim_version('${PV}', 2)}-fixes"
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
 CVE_PRODUCT = "pydantic:pydantic"
-- 
2.47.3


