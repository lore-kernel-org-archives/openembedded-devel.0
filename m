Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB0CC83F27
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 11:07:47 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.5570.1752577664658927794
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 04:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=eTfOb8+4;
 spf=pass (domain: konsulko.com, ip: 209.85.218.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae0de1c378fso864252066b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 04:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1752577663; x=1753182463; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjGh9YvajwguYe22GKmWKp3/SQYK/JV66N7m1d3azbU=;
        b=eTfOb8+48y5/S67PjR08B/4qKVgGjBrjUzXoq416E/r2FXFtEnl1oES8/7yvJN0g0G
         9hdM4P6w7jYSfhDHXBZl+LFwCtNPzhgtqbkFRCK+P4WDlQ8GiHMXOevzjiXH8R0XsSS7
         WrewqurWdsTEsy07JZblK3OtKamzmNBorohuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752577663; x=1753182463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjGh9YvajwguYe22GKmWKp3/SQYK/JV66N7m1d3azbU=;
        b=VtQg/NCmO5siRfJ/qVw5uh7IktjvGNA+lekhB8wzZmBLXTUwyGHdVG8OEd3XlWsKaN
         nRO8Ls3RNWpfNMCAAF71XwaDdwrfWMUqqzPGoGPxeoqkn68mAE31x6AlBPs+NH5oKRZJ
         XSqhbsPNlYRWdHpV/fUgHWPuZnUHldf/mGPtjRFS7sxUVbWEgNhvL50HFqjOYTb+dqx8
         bRzFYg4d+RuaiFm+u3VAWzrc4g07fY3lpBia8UNRPIWX3TkXuO4Dfr2ZRgtfNkO+x9c+
         Wo5ApGlyIY+SYbAGE9DNhdLXWt79RBASh8OgO1LnohlZP6iLfmdF+qWCtQyTA96r5pw2
         o+TQ==
X-Gm-Message-State: AOJu0YwT8IJAXjpWQAfUc4NRCKKGKiouLVcBomgr3wP6U54+EPIE2OQU
	NihrIaEtI/wTMoZMXQA9sEcuI3xemrl62RnBwA8Hizz5GHn055n9XV8pXnZMA8uo9JW2BBlxYHg
	h0u3N
X-Gm-Gg: ASbGncvD04K6EPY8LaZXLhLmpNs06sFC+Jt/qXIuttF+D/kC5iSD5F/M+kLW1xeFBY6
	P5qusSMuHirLnfna2wWdLN+4UYVcfi0vdFwi9SaH8eN26cjUpzJKjjmXOB/wELAU+5r6rzhllQi
	/UOrCL3krglSsB8qJqWppW2T/y1/1sZvuespT8ngZ/eRj32V3ARG1N78WmELipT2CurJ8aPbz0L
	AnDnBWyaH6Vqa5dNxUJDtXM3CeEvOCDNF8+a+iu2kT5xOiPVwcVcgHBgoZoVoiGUNIPcuqmN540
	jJtRWT4HYklpIku1XRCYiSsvH7+MIpkLGHdJtXmpHGeHLDhsoDxG0N9+DH2gFiA8z9Mv+mgm/Va
	08/3+0R85eR4JdgOmf0M0JDxlznnHtFUwFYeB
X-Google-Smtp-Source: AGHT+IEGY/0ny2famGcXlKS48adMYuqZSrV/U9IlhCMYTNxa9xXXxTTa0p2NpYaXiMAU0/FZPsB9tg==
X-Received: by 2002:a17:906:d7d0:b0:ad8:8529:4f8f with SMTP id a640c23a62f3a-ae6fc0aa451mr1543385266b.45.1752577662766;
        Tue, 15 Jul 2025 04:07:42 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7ee46cdsm1000843066b.60.2025.07.15.04.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 04:07:42 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-web3: Upgrade 7.12.0 -> 7.12.1
Date: Tue, 15 Jul 2025 14:07:38 +0300
Message-Id: <20250715110738.1033272-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250715110738.1033272-1-leon.anavi@konsulko.com>
References: <20250715110738.1033272-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 11:07:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118561

Upgrade to release 7.12.1:

- Fix AutoProvider batching setup by adding a proxy batch request.
- Update integrations tests to use geth v1.16.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-web3_7.12.0.bb => python3-web3_7.12.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_7.12.0.bb => python3-web3_7.12.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_7.12.0.bb b/meta-python/recipes-devtools/python/python3-web3_7.12.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-web3_7.12.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_7.12.1.bb
index 06e09b9cf1..fe5886692d 100644
--- a/meta-python/recipes-devtools/python/python3-web3_7.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_7.12.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1d34d9701a1461e4bd71a904ac4cf7be"
 
-SRC_URI[sha256sum] = "08fbe79a2e2503c9820132ebad24ba0372831588cabac5f467999c97ace7dda3"
+SRC_URI[sha256sum] = "97f6a116ccaeb5907bb4cb6c771cc23bc942bf09528a840189e9b509b7b8347c"
 
 inherit pypi setuptools3
 
-- 
2.39.5


