Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41237.1795611513831998583
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 04:58:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Wox8fqJH;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so58936365e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 04:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795611512; x=1796216312; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RmEW5ZxNQGG+9RqZ0v5tMzoG7roLMzFl7+GEGBSwckc=;
        b=Wox8fqJHYhiDFggeurLqN4+id8MahUDq3PtcpKhTrcE4xy3uaS0WaLowUalT5hL5N2
         zXbRAwNhdMQyVP7BGQNiN8M3DCI9R8u/9PjFKQodRLICJvxIHDvr0eeX4Zi2bXSq0wg6
         9IEN8WqVdHE4jJ02u1dLcV7QZho0TwZ9LJflg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611512; x=1796216312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RmEW5ZxNQGG+9RqZ0v5tMzoG7roLMzFl7+GEGBSwckc=;
        b=Ue/ieuTKMCo6oOm9W7qO8qsPgtyVs7b0ipMMq3Fm3JxWj7zHzvhZhHKZxUFmu3Zk+K
         5F9CUJBAkcE6yhPrr7cNVQVKtvuMjGEtAmG/3xHdl5zmaSK1PBiYqHAIzKu4kwF4oLzq
         bvrEz81KITk1/kAW4EueGaJcqnMyyA6SM/wSwISZgI+3rbJzjwgjuc5jPbJoE8ikXJoP
         5gIBm5qrnaZytBVfyGhu4a/lw2MjLRFu3LMd1vRzNf4qli/TYB7Jeh5CotgoLposrkC+
         La2jEaUyqIh4/ys5+IywPkwPH8uS0kNsmEd73S3pZvKHisjdlhA2FSTtKQp6Cb+m3cIw
         B7NQ==
X-Gm-Message-State: APuU4Z8kp9UCHnGAszUF2IWNntHTBS1FBGIl5gDDtgsvDwx9mVHlNDP4
	u2brah0IT1uT6hMW5CTZAyOXKOHLTVprJ0ZMXTBUQS1F5EaSSCi1hqOCNba+9c6CPtKL+Wu9zIB
	PxFYL
X-Gm-Gg: AZFdTZeSQLfcrpG72X8EX/RKR7NYudIqnfSC8P6oKXmkcKMuHevUGph4AYcJc2WtqNb
	af+dOBsK6wRT/Skk9ASKFKfBiLWKLnm/Ds7mTawQt9h/1GJOzHMkKnNAKMAHD3qC1kvzvmsFRG3
	wtN8wX/nROuKs9FuMgikSftKZiuC981w4peLKieY7W30KqzBSLSOXsQnrKgl/KMet3EnOBeB/65
	pTgdEddGP0cUGM4L82KNkykp9RnPYGXcK25lbC4ZM7vEy+ep0TQbvgzUVv6VbV+sqVugLHzHJg4
	ylP6YgO+HpG5r19ripiNXEBLMjU4XZN1JOkPDeReVoSVBKbAROSNSrjeViCBd8jVyevD7yvola0
	5zNJup2jmrg1+LypZzB2D7dPco9mgnTATni+OuHciNpmTFyY68KtxBv4UGwivhbeoTg7d65Ktqo
	AOwDLlk3XTjGGni9fut3b6qfUazlcdYhhBmhSUal3f1YN1WUHjD6g4sQiKYr4qPlfq7zFyDp5HK
	WHUoYzyAyPG9+BarzxoUBEaq/uuWZO2NFwP5Uy53fKPji1LiosxAATheSza1LQCgMO9vfRe23Ct
	KHtq5HZpt+DtvPc4LTpHHywN5EBPESfHkWXpOw+kYj6z3sVHcfVMVBN1xjMiQh9rQUDoppAgI/n
	pMBzpQWrUZcFWauGfc1SVH3QDuwnIyJ0kXNQoyImppL1IC8qsSPXyjQ==
X-Received: by 2002:a05:600c:1115:b0:4bb:a602:6c8b with SMTP id 5b1f17b1804b1-4bba60271damr28084565e9.14.1795611512149;
        Wed, 25 Nov 2026 04:58:32 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm32919300f8f.40.2026.11.25.04.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:58:31 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/8] python3-reportlab: Upgrade 5.1.0 -> 5.1.1
Date: Wed, 25 Nov 2026 14:58:22 +0200
Message-ID: <20261125125824.1799066-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125125824.1799066-1-leon.anavi@konsulko.com>
References: <20261125125824.1799066-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 12:58:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133079
Content-Type: text/plain; charset="utf-8"

Upgrade to release 5.1.1:

- Fixed hypenation bug.
- Fixed long data: url opening that caused error in rml.
- Changed PTOContainer ListFlowable handling.
- Fixed obvious bug in Table splitRows method.
- Move endLines & endTable to end of Table.draw (roundedCorners).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-reportlab_5.1.0.bb => python3-reportlab_5.1.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-reportlab_5.1.0.bb => python3-reportlab_5.1.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-reportlab_5.1.0.bb b/meta-python/recipes-devtools/python/python3-reportlab_5.1.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-reportlab_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-reportlab_5.1.1.bb
index 367c9527cc..27bbfee1b6 100644
--- a/meta-python/recipes-devtools/python/python3-reportlab_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-reportlab_5.1.1.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "An Open Source Python library for generating PDFs and graphics."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf24392f451ff6710fca1e96cefa0424"
 
-SRC_URI[sha256sum] = "6878200464527e87672d19e9f7cfc6bb890e3a6931e74ac6a1a8d1754aa55671"
+SRC_URI[sha256sum] = "4bc6d7e5a961cabd320850637fa469c81dd9d6e32d0fe4191446086c6ea9a8d3"
 
 CVE_PRODUCT = "reportlab"
 CVE_STATUS[CVE-2020-28463] = "fixed-version: has been fixed since 3.5.55"
-- 
2.47.3

